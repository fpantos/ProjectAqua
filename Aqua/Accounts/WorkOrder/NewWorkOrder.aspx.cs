using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessObject.Collections;
using AquaLibrary.DataAccess;
using AquaLibrary.BusinessLayer;
using System.Globalization;

namespace Aqua.Accounts.WorkOrder
{
    public partial class NewWorkOrder : System.Web.UI.Page
    {

        #region Variables
        private string actualServiceDate = "";
        private double totalWorkCharge = 0;
        private double taxPercentage = 0.13;
        private string myCustomShortDatePattern = @"MM/dd/yyyy";
        DateTimeFormatInfo dtf = new DateTimeFormatInfo();
        
        #endregion

        #region Constants
        //constant values for cell location in the Gridview
        private const int CellNumberForSunday = 1;
        private const int CellNumberForMonday = 2;
        private const int CellNumberForTuesday = 3;
        private const int CellNumberForWednesday = 4;
        private const int CellNumberForThursday = 5;
        private const int CellNumberForFriday = 6;
        private const int CellNumberForSaturday = 7;
        #endregion


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["accountSearched"] == null)
                {
                    // go back to search page
                    Response.Redirect("~/Accounts/SearchAccount.aspx");
                }
                else
                {
                    //get the account id and account name from the session
                    Account accountMakingTheOrder = Session["accountSearched"] as Account;
                    lblAccountNumber.Text = accountMakingTheOrder.AccountID.ToString();
                    lblAccountHolder.Text = accountMakingTheOrder.Firstname + " " + accountMakingTheOrder.Lastname;
                    PerformSessionCleanup();
                }

                //populate ddlTechnician
                PopulateTechnicianDropdownlist();

            }

        }

        private void PopulateTechnicianDropdownlist()
        {
            ddlTechnician.Items.Clear();
            ddlTechnician.Items.Add("Please Select");

            List<string> techList = EmployeeManager.GetTechnicians();
            foreach (String techName in techList)
            {
                ddlTechnician.Items.Add(techName);
            }
        }

        protected void mviewService_ActiveViewChanged(object sender, EventArgs e)
        {

        }


        #region View Activate and Deactivate  methods

        #region vwAddWorkOrder
        protected void vwAddWorkOrder_Activate(object sender, EventArgs e)
        {

        }

        protected void vwAddWorkOrder_Deactivate(object sender, EventArgs e)
        {

        }
        #endregion

        #region vwFinalizeOrder
        protected void vwFinalizeOrder_Activate(object sender, EventArgs e)
        {
            //display the work orders, replacement parts and service datetime

            ServiceWorkToBeDoneList w = Session["workList"] as ServiceWorkToBeDoneList;
            gviewWorkOrdersReview.DataSource = w;
            gviewWorkOrdersReview.DataBind();

            STG_ServiceWork stg_servWork = Session["stg_servWork"] as STG_ServiceWork;

            dtf = CultureInfo.CreateSpecificCulture("en-US").DateTimeFormat;
            dtf.ShortDatePattern = myCustomShortDatePattern;

            lblReviewServiceDateTime.Text = stg_servWork.ServiceDate.ToString("ddd") + " "+  stg_servWork.ServiceDate.ToString("d",dtf)
                    + " - " + ddlServiceStartTime.SelectedValue.ToString() + " to " + ddlServiceEndTime.SelectedValue.ToString();

            lblReviewTechnician.Text = ddlTechnician.SelectedValue.ToString();
        }

        protected void vwFinalizeOrder_Deactivate(object sender, EventArgs e)
        {

        }
        #endregion




        #endregion

        /// <summary>
        /// Shows the Service Work Schedule and allows the user to select a date and time for 
        /// the serview work
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkOpenScheduler_OnCommand(object sender, CommandEventArgs e)
        {
            //enable the gridview
            gviewSchedule.Enabled = true;

            // populate the gview schedule     
            LoadWorkHousInGridview();

            //populate the header rows with the current week
            DateTime todaysDate = System.DateTime.Now.ToLocalTime();

            PopulateGridviewSchedule(todaysDate);

            //show the scheduler
            this.mPopupSetServiceDateTime.Show();

            // if the session is not null, show the confirmed selected date and time
            if (Session["stg_servWork"] != null)
            {
                DateTimeFormatInfo dtfi;
                dtfi = CultureInfo.CreateSpecificCulture("en-US").DateTimeFormat;
                dtfi.ShortDatePattern = @"MM/dd/yyyy";

                STG_ServiceWork sw = Session["stg_servWork"] as STG_ServiceWork;
                ddlServiceEndTime.SelectedValue = sw.ServiceEndTime.ToShortTimeString().Replace(" ", "");
                ddlServiceStartTime.SelectedValue = sw.ServiceStartTime.ToShortTimeString().Replace(" ", "");
                lblSelectedServiceDate.Text = sw.ServiceDate.ToString("ddd") + " " + sw.ServiceDate.ToString("d", dtfi);


                //show the confirmation panel
                pnlConfirmServiceWorkAppointment.Visible = true;
            }
            else
            {
                //hide the confirmation panel
                pnlConfirmServiceWorkAppointment.Visible = false;
            }

        }

        #region Methods inside the Select A Service Datetime Modal Popup 

        private void PopulateGridviewSchedule(DateTime myDate)
        {
            List<string> workHoursList = WorkHourDB.GetWorkHoursList();
            List<DateTime> daysList; //contains the list of dates starting from sunday that fall within the week relative to the myDate variable
            DateTimeFormatInfo dtfi;
            DisplayGridviewHeader(myDate, out daysList, out dtfi);

            int cellNumberToUse = 0;
            foreach (DateTime d in daysList)
            {
                cellNumberToUse = GetTheCellNumberToUse(cellNumberToUse, d);

                // Prevent the user from scheduling previous days
                // disable linkbuttons where the date is < todays date
                if (d < DateTime.Now.ToLocalTime().AddDays(-1))
                {
                    foreach (GridViewRow row in gviewSchedule.Rows)
                    {
                        row.Cells[cellNumberToUse].Text = "-";
                    }
                }

                // get all appointments that fall on this day
                // STG_ServiceWorkList stg_servWorkList = STG_ServiceWorkManager.GetListByDate(d.Date);
                ServiceWorkList existingServiceWorkList = ServiceWorkManager.GetListByDate(d.Date);
                if (existingServiceWorkList != null)
                {
                    foreach (ServiceWork s in existingServiceWorkList)
                    {
                        // find the start time of this service work
                        string myStartTime = s.ServiceStartTime.ToShortTimeString();
                        int index = workHoursList.IndexOf(myStartTime.Replace(" ", ""));

                        // determine how long the appointment is, i.e from 10:00AM to 11:00AM and then 
                        // calculate the number of 30 minute interval from that range.

                        int myInterval = STG_ServiceWork.CalculateNumberOfIntervals(s.ServiceStartTime, s.ServiceEndTime);

                        if (index != -1)
                        {
                            //found a match 
                            for (int i = index; i < (myInterval + index); i++)
                            {
                                gviewSchedule.Rows[i].Cells[cellNumberToUse].Text = "Service Work ID: " + s.ServiceWorkID.ToString();
                                gviewSchedule.Rows[i].Cells[cellNumberToUse].ToolTip = "Service Work ID: " + s.ServiceWorkID.ToString();
                            }
                        }

                    }

                }

            }

            // Display the reference date in the textbox
            txtRefDate.Text = myDate.ToString("d", dtfi);

        }

        private void DisplayGridviewHeader(DateTime myDate, out List<DateTime> daysList, out DateTimeFormatInfo dtfi)
        {
            daysList = GetDaysInWeek(myDate);
            string dayForHeader;
            dtfi = CultureInfo.CreateSpecificCulture("en-US").DateTimeFormat;
            dtfi.ShortDatePattern = myCustomShortDatePattern;// @"MM/dd/yyyy";

            for (int i = 0; i < daysList.Count; i++)
            {
                dayForHeader = daysList[i].ToString("ddd") + " " + daysList[i].ToString("d", dtfi);
                gviewSchedule.HeaderRow.Cells[i + 1].Text = dayForHeader;

            }

        }

        protected void lnkChangeDate_OnCommand(object sender, CommandEventArgs e)
        {
            //clear any messages from lblAppointment message
            lblAppointmentMessage.Text = "";

            DateTime selectedDate;
            if (DateTime.TryParse(txtRefDate.Text, out selectedDate))
            {
                // a valid date is selected
                // PopulateGridviewScheduleHeader(selectedDate);
            }
            else
            {
                lblAppointmentMessage.Text = "Not a valid date time.";
                lblAppointmentMessage.ForeColor = System.Drawing.Color.Red;
                selectedDate = System.DateTime.Now.ToLocalTime();
            }

            LoadWorkHousInGridview();

            PopulateGridviewSchedule(selectedDate);

            this.mPopupSetServiceDateTime.Show();

        }

        protected void selectAServiceDateTime_OnCommand(object sender, CommandEventArgs e)
        {
            string whichDay = e.CommandName.ToString();
            string startTime = e.CommandArgument.ToString();
            // find out which day the service will be done
            switch (whichDay)
            {
                case "monday":
                    actualServiceDate = gviewSchedule.HeaderRow.Cells[CellNumberForMonday].Text;
                    break;
                case "tuesday":
                    actualServiceDate = gviewSchedule.HeaderRow.Cells[CellNumberForTuesday].Text;
                    break;
                case "wednesday":
                    actualServiceDate = gviewSchedule.HeaderRow.Cells[CellNumberForWednesday].Text;
                    break;
                case "thursday":
                    actualServiceDate = gviewSchedule.HeaderRow.Cells[CellNumberForThursday].Text;
                    break;
                case "friday":
                    actualServiceDate = gviewSchedule.HeaderRow.Cells[CellNumberForFriday].Text;
                    break;
                case "saturday":
                    actualServiceDate = gviewSchedule.HeaderRow.Cells[CellNumberForSaturday].Text;
                    break;
            }

            //load start time and end time dropdownlist 
            List<string> workHoursList = WorkHourDB.GetWorkHoursList();

            PopulateEndTimeDropdownList(workHoursList);
            PopulateStartTimeDropdownList(workHoursList);

            //get the start time based on the user's selection from the gridview
            ddlServiceStartTime.SelectedValue = startTime;

            //by default, the service end time must be 1 hour after the start time
            //string end = Convert.ToDateTime(startTime).AddHours(1).ToString();
            ddlServiceEndTime.SelectedValue = Convert.ToDateTime(startTime).AddHours(1).ToShortTimeString().Replace(" ", "");

            //display the service date selected by the user
            lblSelectedServiceDate.Text = actualServiceDate;


            LoadWorkHousInGridview();
            PopulateGridviewSchedule(Convert.ToDateTime(actualServiceDate));

            //show the date and time confirmation box
            this.mPopupSetServiceDateTime.Show();

            //disable the gridview after a date and time has been selected
            gviewSchedule.Enabled = false;

            //show the panel for date and time confirmation
            pnlConfirmServiceWorkAppointment.Visible = true;

            //enable the book linkbutton
            lnkConfirmServiceDateTime.Enabled = true;




        }

        #region Gridview Schedule Events
        protected void gviewSchedule_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            // gviewSchedule.SelectedRow.Cells[theCell].BackColor = System.Drawing.Color.Red;

        }

        protected void gviewSchedule_RowDataBound(object sender, GridViewRowEventArgs e)
        {


        } 
        #endregion

        protected void lnkConfirmServiceDateTime_OnCommand(object sender, CommandEventArgs e)
        {
            actualServiceDate = lblSelectedServiceDate.Text;

            STG_ServiceWork newSTG_ServiceWork = null;
            if (Session["stg_servWork"] == null)
            {
                //create a new service work appointment 
                newSTG_ServiceWork = new STG_ServiceWork();
                newSTG_ServiceWork.AccountID = Convert.ToInt32(lblAccountNumber.Text);
                newSTG_ServiceWork.ServiceDate = Convert.ToDateTime(actualServiceDate);
                newSTG_ServiceWork.ServiceStartTime = Convert.ToDateTime(ddlServiceStartTime.SelectedValue.ToString());
                newSTG_ServiceWork.ServiceEndTime = Convert.ToDateTime(ddlServiceEndTime.SelectedValue.ToString());
                newSTG_ServiceWork.Technician = "admin"; //default

                // create the session here
                Session["stg_servWork"] = newSTG_ServiceWork;
            }
            else
            {
                newSTG_ServiceWork = Session["stg_servWork"] as STG_ServiceWork;
                newSTG_ServiceWork.ServiceDate = Convert.ToDateTime(actualServiceDate);
                newSTG_ServiceWork.ServiceStartTime = Convert.ToDateTime(ddlServiceStartTime.SelectedValue.ToString());
                newSTG_ServiceWork.ServiceEndTime = Convert.ToDateTime(ddlServiceEndTime.SelectedValue.ToString());
                newSTG_ServiceWork.Technician = "admin"; //default
            }

            SaveSTG_ServiceWork(newSTG_ServiceWork);
        }

        private void SaveSTG_ServiceWork(STG_ServiceWork stg_servWork)
        {
            //
            // Before saving, check for conflicts with existing service works based on service date
            //
            // Retrieve existing service works for a specific date

            ServiceWorkList existingServiceWorkList = ServiceWorkManager.GetListByDate(Convert.ToDateTime(actualServiceDate), ddlServiceStartTime.SelectedValue.ToString());
            bool foundConflict = false;
            bool recordSaved = false;
            if (existingServiceWorkList != null)
            {
                foreach (ServiceWork existingServiceWork in existingServiceWorkList)
                {
                    while ((foundConflict == false) && (recordSaved == false))
                    {
                        if ((stg_servWork.ServiceEndTime.TimeOfDay > existingServiceWork.ServiceStartTime.TimeOfDay))
                        {
                            //do not allow the save
                            foundConflict = true;

                            lblBookingMessage.Text = "Cannot book the time. A conflict will occur with booking# " + existingServiceWork.ServiceWorkID;
                            LoadWorkHousInGridview();
                            PopulateGridviewSchedule(Convert.ToDateTime(actualServiceDate));

                            //show the scheduler
                            this.mPopupSetServiceDateTime.Show();
                        }
                        else
                        {
                            //save the service appointment
                            stg_servWork.STG_servID = STG_ServiceWorkManager.Save(stg_servWork);
                            ShowTheConfirmedDateTime();
                            recordSaved = true;
                        }
                    }//end while loop
                }//end foreach loop
            }
            else
            {
                //there's no conflict so saving can be made

                //save the service appointment
                stg_servWork.STG_servID = STG_ServiceWorkManager.Save(stg_servWork);
                ShowTheConfirmedDateTime();
            }
        }

        private void ShowTheConfirmedDateTime()
        {
            // show the confirmed service date and time panel
            pnlConfirmedServiceDateTime.Visible = true;

            //display the confirmed service datetime 
            lblConfirmedServiceDate.Text = actualServiceDate;
            lblConfirmedServiceTime.Text = ddlServiceStartTime.SelectedValue.ToString() + " to " + ddlServiceEndTime.SelectedValue.ToString();

            //enable the navigation finalize the service work order
            lnkGoToSetAppointmentDate.Enabled = true;
            lnkGoToSetAppointmentDate.CssClass = "linkStyle";
        }

        protected void lnkResetServiceDateTime_OnCommand(object sender, CommandEventArgs e)
        {
            lblBookingMessage.Text = "";
            //enable the gridivew scheduler
            gviewSchedule.Enabled = true;

            //hide the confirmation panel
            pnlConfirmServiceWorkAppointment.Visible = false;

            //load the work hours 
            LoadWorkHousInGridview();

            //load the service appointments in the gridview
            PopulateGridviewSchedule(Convert.ToDateTime(txtRefDate.Text));

            //show the date and time confirmation box
            this.mPopupSetServiceDateTime.Show();

            //disable the book linkbutton to force user to select a new date and time in the gridview
            lnkConfirmServiceDateTime.Enabled = false;


        }

        protected void lnkCancelSetServiceDateTime_OnClick(object sender, EventArgs e)
        {

        }

        private void PopulateEndTimeDropdownList(List<string> workHoursList)
        {
            ddlServiceEndTime.DataSource = workHoursList;
            ddlServiceEndTime.DataBind();
        }

        private void PopulateStartTimeDropdownList(List<string> workHoursList)
        {
            // only allow appointments to be scheduled until 7pm
            //remove the hours 730pm to 8pm in the dropdownlist

            workHoursList.RemoveRange(21, 2);

            ddlServiceStartTime.DataSource = workHoursList;
            ddlServiceStartTime.DataBind();
        }

        private static int GetTheCellNumberToUse(int cellNumberToUse, DateTime d)
        {
            // find out which day is being checked so that the proper cell number is assigned to the gridview
            switch (d.DayOfWeek.ToString().ToLower())
            {
                case "sunday":
                    cellNumberToUse = CellNumberForSunday;
                    break;
                case "monday":
                    cellNumberToUse = CellNumberForMonday;
                    break;
                case "tuesday":
                    cellNumberToUse = CellNumberForTuesday;
                    break;
                case "wednesday":
                    cellNumberToUse = CellNumberForWednesday;
                    break;
                case "thursday":
                    cellNumberToUse = CellNumberForThursday;
                    break;
                case "friday":
                    cellNumberToUse = CellNumberForFriday;
                    break;
                case "saturday":
                    cellNumberToUse = CellNumberForSaturday;
                    break;
            }
            return cellNumberToUse;
        }

        private static List<DateTime> GetDaysInWeek(DateTime myDate)
        {
            DateTimeFormatInfo dfi = DateTimeFormatInfo.CurrentInfo;
            DayOfWeek firstday = dfi.FirstDayOfWeek; //sunday
            DateTime referenceDate = myDate.Date;

            DayOfWeek today = dfi.Calendar.GetDayOfWeek(referenceDate);
            int diff = today - firstday;

            DateTime startDate = referenceDate.AddDays(-diff);

            DateTime endDate = startDate.AddDays(6);
            List<DateTime> daysList = new List<DateTime>();
            while (startDate <= endDate)
            {
                daysList.Add(startDate);
                startDate = startDate.AddDays(1);
            }

            return daysList;
        }

        private void LoadWorkHousInGridview()
        {
            DataTable dtWorkHours = WorkHourDB.GetWorkHours();

            //remove the 7:30PM and 8:00PM on the list
            for (int i = dtWorkHours.Rows.Count - 1; i >= 21; i--)
            {
                dtWorkHours.Rows.RemoveAt(i);
            }

            gviewSchedule.DataSource = dtWorkHours;
            gviewSchedule.DataBind();
        }

        #endregion


        #region Add Work Orders
        protected void lnkAddToWorkOrderGrid_OnCommand(object sender, CommandEventArgs e)
        {

            DropDownList ddlWorkType = (fviewWork.FindControl("ddlWorkType") as DropDownList);

            if (ddlWorkType.SelectedIndex == 0)
            {
                // display a label about making a work type selection
                lblMessage.Text = "Please select a work type";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                //add the work order

                //create a new serviceWorkToBeDone object
                ServiceWorkToBeDone serviceWorkTBD = new ServiceWorkToBeDone();
                serviceWorkTBD.WorkType = (fviewWork.FindControl("ddlWorkType") as DropDownList).SelectedItem.Text;
                serviceWorkTBD.WorkCharge = double.Parse((fviewWork.FindControl("txtWorkCharge") as TextBox).Text.ToString(), CultureInfo.InvariantCulture); //100;
                serviceWorkTBD.WorkNotes = (fviewWork.FindControl("txtWorkNotes") as TextBox).Text.Trim();

                //create the collection
                ServiceWorkToBeDoneList workList = new ServiceWorkToBeDoneList();

                // create a session variable
                if (Session["workList"] == null)
                {
                    workList.Add(serviceWorkTBD);
                    Session["workList"] = workList;
                }
                else
                {
                    workList = Session["workList"] as ServiceWorkToBeDoneList;
                    workList.Add(serviceWorkTBD);
                }

                gviewWorkList.DataSource = workList;
                gviewWorkList.DataBind();

                //reset the fields in the formview
                (fviewWork.FindControl("ddlWorkType") as DropDownList).SelectedIndex = 0;
                (fviewWork.FindControl("txtWorkCharge") as TextBox).Text = "";
                (fviewWork.FindControl("txtWorkNotes") as TextBox).Text = "";

                lblMessage.Text = "";

                //enable the scheduler linkbutton
                lnkOpenScheduler.Enabled = true;


            }



        }

        protected void gviewWorkList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;

            if (Session["workList"] != null)
            {
                ServiceWorkToBeDoneList workList = Session["workList"] as ServiceWorkToBeDoneList;
                workList.RemoveAt(index);

                gviewWorkList.DataSource = workList;
                gviewWorkList.DataBind();

                if (gviewWorkList.Rows.Count == 0)
                {
                    //disable the button to move to the next multiview
                    lnkGoToSetAppointmentDate.Enabled = false;
                }
            }

        }

        protected void gviewWorkList_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            //Display the work charge sub total in the footer
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                ServiceWorkToBeDoneList workList = Session["workList"] as ServiceWorkToBeDoneList;

                if (workList != null)
                {
                    foreach (ServiceWorkToBeDone sWork in workList)
                    {
                        totalWorkCharge += sWork.WorkCharge ;
                    }
                }

                e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[2].Text = "Sub Total " +  totalWorkCharge.ToString("c");
            }
        }

        protected void ddlWorkType_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlWorkType = (fviewWork.FindControl("ddlWorkType") as DropDownList);
            TextBox txtWorkCharge = (fviewWork.FindControl("txtWorkCharge") as TextBox);
            TextBox txtWorkNotes = (fviewWork.FindControl("txtWorkNotes") as TextBox);


            if (ddlWorkType.SelectedIndex == 1)
            {
                txtWorkCharge.Text = Convert.ToDouble(ddlWorkType.SelectedValue).ToString();

                // move the focus to the next textbox
                txtWorkNotes.Focus();
            }
            else
            {
                // set the focus
                txtWorkCharge.Focus();
            }


        }

        #endregion


        protected void lnkCompleteOrder_OnCommand(object sender, CommandEventArgs e)
        {
            
            STG_ServiceWork stg_servWork = Session["stg_servWork"] as STG_ServiceWork;
            ServiceWorkToBeDoneList workList = Session["workList"] as ServiceWorkToBeDoneList;

            // create an invoice
            Invoice newInvoice = new Invoice();
            newInvoice.AccountID =  Convert.ToInt32(lblAccountNumber.Text);
            newInvoice.InvoiceDate = DateTime.Now.ToLocalTime();
            newInvoice.CreatedBy = User.Identity.Name.ToString();
            //add service work subtotal + invoicelineitems subtotal
            double totalServiceWorkCharge = ServiceWork.CalculateTotalWorkCharge(workList);
            double totalServiceWorkChargeTax = ServiceWork.CalculateTotalTax(totalServiceWorkCharge, taxPercentage);

            newInvoice.SubTotal = totalServiceWorkCharge;

            //add service work tax + invoicelineitem tax
            newInvoice.TotalTaxCharged = totalServiceWorkChargeTax;

            //
            newInvoice.TotalAmount = (totalServiceWorkCharge + totalServiceWorkChargeTax);

            
            newInvoice.InvoiceID = InvoiceManager.Save(newInvoice);

            // save service work using stg_service work and invoice ID from invoice
            ServiceWork sWork = new ServiceWork();
            sWork.AccountID = stg_servWork.AccountID;
            sWork.ServiceDate = stg_servWork.ServiceDate;
            sWork.ServiceStartTime = stg_servWork.ServiceStartTime;
            sWork.ServiceEndTime = stg_servWork.ServiceEndTime;
            //sWork.ServiceStatus = stg_servWork.ServiceStatus;
            sWork.Technician = ddlTechnician.SelectedValue.ToString();
            sWork.InvoiceID = newInvoice.InvoiceID;
            sWork.SubTotal =  totalServiceWorkCharge;
            sWork.TaxCharged = totalServiceWorkChargeTax;
            sWork.ServiceWorkID = ServiceWorkManager.Save(sWork);

            // save service work to be done using service work ID
            
            foreach (ServiceWorkToBeDone sWorkToBeDone in workList)
            {
                sWorkToBeDone.ServiceWorkID = sWork.ServiceWorkID;
                //save each work to be done in the DB
                sWorkToBeDone.WorkToBeDoneID = ServiceWorkToBeDoneManager.Save(sWorkToBeDone);
            }


            //clear the session variables
            PerformSessionCleanup();
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {

            PerformSessionCleanup();

            //redirect the user to the accounts page
            Response.Redirect("~/Accounts/ViewAccount.aspx");




        }

        private void PerformSessionCleanup()
        {
            //clear all session variables used
            Session["workList"] = null;
            Session["stg_servWork"] = null;
        }

        protected void gviewWorkOrdersReview_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //Display the work charge sub total in the footer
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                ServiceWorkToBeDoneList workList = Session["workList"] as ServiceWorkToBeDoneList;

                if (workList != null)
                {
                    foreach (ServiceWorkToBeDone sWork in workList)
                    {
                        totalWorkCharge += sWork.WorkCharge;
                    }
                }

                e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[2].Text = "Sub Total " + totalWorkCharge.ToString("c");
            }


        }

    }
}
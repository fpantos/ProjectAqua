using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessLayer;
using AquaLibrary.Enums;
using AquaLibrary.BusinessObject.Collections;
using AquaLibrary.Helper;

namespace Aqua.Admin.EmployeeManagement
{
    public partial class ViewEmployee : System.Web.UI.Page
    {
        static int employeeID = 0;
        static Employee employeeSearched = new Employee();
        static Address homeAddress = new Address();
        static JobPosition position = new JobPosition();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if ((Session["employeeID"] == null))
                {
                    // go back to the seach employee page
                    Response.Redirect("~/Admin/EmployeeManagement/SearchEmployee.aspx");

                }
                else
                {
                    employeeID = Convert.ToInt32(Session["employeeID"]);
                    employeeSearched = EmployeeManager.GetEmployeeByID(employeeID);

                    // dislay the employee details
                    DisplayEmployee(employeeSearched);

                    // Get job description
                    position = JobPositionManager.GetPositionByID(employeeSearched.JobPositionID);
                    DisplayJobPosition(position);

                    // With the employee id, get the address id for the Home Address 
                    // from the EmployeeAddress table
                    homeAddress.AddressID = EmployeeAddressManager.GetAddressID(Convert.ToInt32(AddressType.Home), employeeSearched.EmployeeID);
                    homeAddress = AddressManager.GetAddressById(homeAddress.AddressID);
                    DisplayHomeAddress(homeAddress);



                }
            }


        }

        private void DisplayJobPosition(JobPosition position)
        {
            lblJobPosition.Text = position.PositionName;
        }

        #region Display Data on Form

        private void DisplayEmployee(Employee myEmployee)
        {

            // Show the employee number and employee holder 
            lblEmployeeNumber.Text = "Employee# " + myEmployee.EmployeeID.ToString();
            lblEmployeeName.Text = myEmployee.Firstname + " " + employeeSearched.Lastname;
            lblGender.Text = myEmployee.Gender;
            lblEmailAddress.Text = myEmployee.Email;
            lblHomephone.Text = myEmployee.Homephone;
            lblMobilephone.Text =  StringParser.PrepareNullValueForDisplay( myEmployee.Mobilephone);
            lblEmergencyContact.Text = myEmployee.EmergencyContact;
            lblEmergencyPhone1.Text = myEmployee.EmergencyPhone1;
            lblEmergencyPhone2.Text =  StringParser.PrepareNullValueForDisplay( myEmployee.EmergencyPhone2);
            lblHireDate.Text = myEmployee.HireDate.ToShortDateString();
            lblNotes.Text = myEmployee.Notes;
            lblTerminatedDate.Text =  StringParser.PrepareNullValueForDisplay( Convert.ToString(myEmployee.TerminatedDate));
        }


        private void DisplayHomeAddress(Address myAddress)
        {

            lblHomeAddressLine1.Text = myAddress.AddressLine1;
            lblHomeAddressLine2.Text = myAddress.AddressLine2;
            lblHomeCityTown.Text = myAddress.CityTown;
            lblHomeProvince.Text = myAddress.Province;
            lblHomePostalCode.Text = myAddress.PostalCode;
        }

        #endregion

 

        protected void lnkEditHomeAddress_OnCommand(object sender, CommandEventArgs e)
        {

            AddressList al = new AddressList();
            al.Add(AddressManager.GetAddressById(homeAddress.AddressID));

            fview_EditHomeAddress.DataSource = al;
            fview_EditHomeAddress.DataBind();
            this.mPopupEdit_HomeAddress.Show();
        }


        protected void lnkEditPersonalInformation_OnCommand(object sender, CommandEventArgs e)
        {
            EmployeeList el = new EmployeeList();
            el.Add(EmployeeManager.GetEmployeeByID(employeeSearched.EmployeeID));

            JobPositionList jl = new JobPositionList();
            jl.Add(JobPositionManager.GetPositionByID(employeeSearched.JobPositionID));

            fview_EditPersonalInformation.DataSource = el;
            fview_EditPersonalInformation.DataBind();

            this.mPopupEdit_PersonalInformation.Show();
        }


        protected void lnkSaveHomeAddressOnEdit_OnCommand(object sender, CommandEventArgs e)
        {

            //hide the modal popup
            mPopupEdit_HomeAddress.Hide();

            //get the new values from the form
            homeAddress.AddressLine1 = (fview_EditHomeAddress.FindControl("txtAddressLine1") as TextBox).Text.Trim();
            homeAddress.AddressLine2 = (fview_EditHomeAddress.FindControl("txtAddressLine2") as TextBox).Text.Trim();
            homeAddress.CityTown = (fview_EditHomeAddress.FindControl("txtCityTown") as TextBox).Text.Trim();
            homeAddress.Province = (fview_EditHomeAddress.FindControl("ddlProvince") as DropDownList).SelectedValue;
            homeAddress.PostalCode = ((fview_EditHomeAddress.FindControl("txtPostalCode_segment1") as TextBox).Text.Trim()
                                + (fview_EditHomeAddress.FindControl("txtPostalCode_segment2") as TextBox).Text).ToUpper();
            homeAddress.ModifiedDate = DateTime.Now.ToLocalTime();


            //save the changes
            AddressManager.Save(homeAddress);

            DisplayHomeAddress(homeAddress);


        }

        protected void lnkSavePersonalInformationOnEdit_OnCommand(object sender, CommandEventArgs e)
        {
            //hide the modal popup
            mPopupEdit_PersonalInformation.Hide();

            //get the new values from the form
            employeeSearched.Firstname = (fview_EditPersonalInformation.FindControl("txtFirstname") as TextBox).Text.Trim();
            employeeSearched.Lastname = (fview_EditPersonalInformation.FindControl("txtLastname") as TextBox).Text.Trim();
            employeeSearched.Email = (fview_EditPersonalInformation.FindControl("txtEmail") as TextBox).Text.Trim();
            employeeSearched.Gender = (fview_EditPersonalInformation.FindControl("ddlGender") as DropDownList).Text.Trim();
            employeeSearched.Homephone = (fview_EditPersonalInformation.FindControl("txtHomePhone") as TextBox).Text.Trim();
            employeeSearched.Mobilephone = (fview_EditPersonalInformation.FindControl("txtMobilePhone") as TextBox).Text.Trim();
            employeeSearched.EmergencyContact = (fview_EditPersonalInformation.FindControl("txtEmergencyContact") as TextBox).Text.Trim();
            employeeSearched.EmergencyPhone1 = (fview_EditPersonalInformation.FindControl("txtEmergencyPhone1") as TextBox).Text.Trim();
            employeeSearched.EmergencyPhone2 = (fview_EditPersonalInformation.FindControl("txtEmergencyPhone2") as TextBox).Text.Trim();
            employeeSearched.Notes = (fview_EditPersonalInformation.FindControl("txtNotes") as TextBox).Text.Trim();
            employeeSearched.ModifiedDate = DateTime.Now.ToLocalTime();
            employeeSearched.JobPositionID = Convert.ToInt32((fview_EditPersonalInformation.FindControl("ddlJobTitle") as DropDownList).Text.Trim());
            position.PositionID = Convert.ToInt32((fview_EditPersonalInformation.FindControl("ddlJobTitle") as DropDownList).Text.Trim());

            //save the changes
            EmployeeManager.Save(employeeSearched);

            DisplayEmployee(employeeSearched);

            position = JobPositionManager.GetPositionByID(employeeSearched.JobPositionID);
            DisplayJobPosition(position);
        }

        public static string GetEmployeeStatus(string isActive)
        {
            return StringParser.GetStatus(isActive);
        }

        #region string formatting

        protected string GetSubstringOnPhonenumber(string str, string location)
        {
            string returnVal = "";
            if (str != "")
            {

                if (location == "areaCode")
                {
                    returnVal = str.Substring(0, 3);
                }
                else if (location == "phoneSegment1")
                {
                    returnVal = str.Substring(3, 3);
                }

                else if (location == "phoneSegment2")
                {
                    returnVal = str.Substring(6, 4);
                }

            }


            return returnVal;

        }
        #endregion

    }
}
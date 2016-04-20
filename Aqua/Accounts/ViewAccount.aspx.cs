using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AquaLibrary.DataAccess;
using AquaLibrary.BusinessLayer;
using AquaLibrary.BusinessObject.Collections;
using AquaLibrary.BusinessObject;
using AquaLibrary.Enums;
using AquaLibrary.Helper;
using System.Collections;
using System.Collections.Specialized;

namespace Aqua.Accounts
{
    public partial class ViewAccount : System.Web.UI.Page
    {
        private static int _accountID = 0;
        private static Account _accountSearched = new Account();
        private static Address _homeAddress = new Address();
        private static Address _mailingAddress = new Address();
        private static PrepaidBottle selectedPrepaidBottle;
        private static ProductList _productList;

        protected void Page_Load(object sender, EventArgs e)
        {
            SessionCleanup();

            if (!IsPostBack)
            {
                if ((Session["accountID"] == null))
                {
                    // go back to the seach accounts page
                    Response.Redirect("~/Accounts/SearchAccount.aspx");
                }
                else
                {
                    _accountID = Convert.ToInt32(Session["accountID"]);
                    _accountSearched = AccountManager.GetAccountByID(_accountID);

                    // dislay the account details
                    DisplayAccount(_accountSearched);

                    // With the account id, get the address id for the Home Address 
                    // from the AccountAddress table
                    _homeAddress.AddressID = AccountAddressManager.GetAddressID(Convert.ToInt32(AddressType.Home), _accountSearched.AccountID);
                    _homeAddress = AddressManager.GetAddressById(_homeAddress.AddressID);
                    DisplayHomeAddress(_homeAddress);

                    // With the account id, get the address id for the Mailing Address 
                    // from the AccountAddress table
                    _mailingAddress.AddressID = AccountAddressManager.GetAddressID(Convert.ToInt32(AddressType.Mailing), _accountSearched.AccountID);
                    _mailingAddress = AddressManager.GetAddressById(_mailingAddress.AddressID);
                    DisplayMailingAddress(_mailingAddress);

                    /* Populate the tabs */
                    //Authorized Members Tab
                    DisplayAuthorizedMembers(_accountSearched);

                    DisplayServiceHistory(_accountSearched);

                    DisplayWaterAnalysis();

                    DisplayPrepaidWater();

                    DisplayWTE();

                }
            }


        }



        private void SessionCleanup()
        {

            //clear session variables created from service invoice
            Session["workList"] = null;
            Session["stg_servWork"] = null;
            Session["accountSearched"] = null;
        }

        #region Display Data on Form

        private void DisplayAccount(Account myAccount)
        {

            // Show the account number and account holder 
            lblAccountNumber.Text = "Account#" + myAccount.AccountID.ToString();
            lblPrimaryAccountHolder.Text = myAccount.Firstname + " " + _accountSearched.Lastname;
            lblEmailAddress.Text = myAccount.Email;
            lblHomephone.Text = StringParser.FormatPhonenumber(myAccount.Homephone);
            lblMobilephone.Text = StringParser.FormatPhonenumber(StringParser.PrepareNullValueForDisplay(myAccount.Mobilephone));
            lblWorkphone.Text = StringParser.FormatPhonenumber(StringParser.PrepareNullValueForDisplay(myAccount.Workphone));
            lblCustomerSince.Text = myAccount.CustomerSince.ToString("MM/dd/yyyy");
            lblWaterSourceLocation.Text = GetWaterSourceDescriptionByID(myAccount.WaterSourceLocationID);
            lblContactFrequency.Text = myAccount.ContactFrequency;
            lblENewsletter.Text = ConvertCheckBoxValueIntoYesNo((myAccount.IsENewsletter).ToString());
            lblNewsletter.Text = ConvertCheckBoxValueIntoYesNo((myAccount.IsNewsletter).ToString());


        }

        private void DisplayAuthorizedMembers(Account accountToView)
        {
            //Get the members list and then display them in the gridview
            AuthorizedMemberList aMemberList = new AuthorizedMemberList();
            aMemberList = AuthorizedMemberManager.GetListByAccountID(accountToView.AccountID);

            //diplay the members in the gridview
            gViewMembers.DataSource = aMemberList;
            gViewMembers.DataBind();
        }

        private void DisplayServiceHistory(Account accountToView)
        {
            //Get the list of existing service work 
            ServiceWorkList servWorkList = ServiceWorkManager.GetListByAccountID(accountToView.AccountID);
            gviewServiceHistory.DataSource = servWorkList;
            gviewServiceHistory.DataBind();
        }

        private void DisplayHomeAddress(Address myAddress)
        {

            lblHomeAddressLine1.Text = myAddress.AddressLine1;
            lblHomeAddressLine2.Text = myAddress.AddressLine2;
            lblHomeCityTown.Text = myAddress.CityTown;
            lblHomeProvince.Text = myAddress.Province;
            lblHomePostalCode.Text = myAddress.PostalCode;
        }

        private void DisplayMailingAddress(Address myAddress)
        {

            // display details on the web page
            lblMailingAddressLine1.Text = myAddress.AddressLine1;
            lblMailingAddressLine2.Text = myAddress.AddressLine2;
            lblMailingCityTown.Text = myAddress.CityTown;
            lblMailingProvince.Text = myAddress.Province;
            lblMailingPostalCode.Text = myAddress.PostalCode;

        }

        private void DisplayWaterAnalysis()
        {
            gviewWaterAnalysis.DataSource = WaterAnalysisManager.GetList(_accountID);
            gviewWaterAnalysis.DataBind();
        }

        private void DisplayPrepaidWater()
        {
            gviewPrepaidPackage.DataSource = PrepaidBottleManager.GetPrepaidPackagesByAccount(_accountID);
            gviewPrepaidPackage.DataBind();
        }

        private void DisplayWTE()
        {
            gviewWTE.DataSource = WTEManager.GetListByAccountID(_accountID);
            gviewWTE.DataBind();
        }


        #endregion

        #region Authorized Members Tab
        protected void lnkRemoveMember_OnCommand(object sender, CommandEventArgs e)
        {

            int memberID = Convert.ToInt32(e.CommandArgument.ToString());
            String operation = e.CommandName.ToString().ToLower();

            // delete the member from the account
            AuthorizedMemberManager.Delete(memberID);

            //after the operation reload the data
            Account a = new Account();
            a.AccountID = _accountID;
            DisplayAuthorizedMembers(a);

        }

        protected void gViewMembers_OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gViewMembers.EditIndex = -1;

            Account a = new Account();
            a.AccountID = _accountID;
            DisplayAuthorizedMembers(a);

            //show the edit and delete column
            gViewMembers.Columns[4].Visible = true; //edit
            gViewMembers.Columns[5].Visible = true; //delete

            //hide the update and cancel column
            gViewMembers.Columns[6].Visible = false; //update
            gViewMembers.Columns[7].Visible = false; //cancel

        }

        protected void gViewMembers_OnRowEditing(object sender, GridViewEditEventArgs e)
        {

            gViewMembers.EditIndex = e.NewEditIndex;
            Account a = new Account();
            a.AccountID = _accountID;
            DisplayAuthorizedMembers(a);


            //hide the edit and delete column
            gViewMembers.Columns[4].Visible = false; //edit
            gViewMembers.Columns[5].Visible = false; //delete

            //show the update and cancel columns
            gViewMembers.Columns[6].Visible = true; //update
            gViewMembers.Columns[7].Visible = true; //cancel

            //only show the update and cancel buttons of the row being edited
            (gViewMembers.Rows[e.NewEditIndex].FindControl("lnkUpdateMember") as LinkButton).Visible = true;
            (gViewMembers.Rows[e.NewEditIndex].FindControl("lnkCancelMember") as LinkButton).Visible = true;

        }

        protected void gViewMembers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = e.RowIndex;

            AuthorizedMember member = new AuthorizedMember();
            member.Firstname = (gViewMembers.Rows[index].FindControl("txtFirstname") as TextBox).Text;
            member.Lastname = (gViewMembers.Rows[index].FindControl("txtLastname") as TextBox).Text;
            member.RelationToAccountOwner = (gViewMembers.Rows[index].FindControl("txtRelationToAccountOwner") as TextBox).Text;
            member.ModifiedDate = DateTime.Now.ToLocalTime();
            member.AccountID = Convert.ToInt32((gViewMembers.Rows[index].FindControl("hdnAccountID") as HiddenField).Value);
            member.AuthMemberID = Convert.ToInt32(gViewMembers.DataKeys[index].Value);
            member.ModifiedBy = User.Identity.Name.ToString();
            AuthorizedMemberManager.Save(member);

            gViewMembers.EditIndex = -1;
            // reload the data
            Account a = new Account();
            a.AccountID = member.AccountID;
            DisplayAuthorizedMembers(a);

            //show the edit and delete column
            gViewMembers.Columns[4].Visible = true; //edit
            gViewMembers.Columns[5].Visible = true; //delete

            //hide the update and cancel column
            gViewMembers.Columns[6].Visible = false; //update
            gViewMembers.Columns[7].Visible = false; //cancel


        }

        protected void lnkAddAuthMember_OnCommand(object sender, CommandEventArgs e)
        {
            AuthorizedMember aMember = new AuthorizedMember();
            aMember.AccountID = _accountID;
            aMember.Firstname = (fviewAuthorizedMember.FindControl("txtFname") as TextBox).Text.Trim();
            aMember.Lastname = (fviewAuthorizedMember.FindControl("txtLname") as TextBox).Text.Trim();
            aMember.RelationToAccountOwner = (fviewAuthorizedMember.FindControl("txtRelation") as TextBox).Text.Trim();
            aMember.CreatedBy = User.Identity.Name.ToString();
            //save
            AuthorizedMemberManager.Save(aMember);

            //clear the fields
            (fviewAuthorizedMember.FindControl("txtLname") as TextBox).Text = "";
            (fviewAuthorizedMember.FindControl("txtFname") as TextBox).Text = "";
            (fviewAuthorizedMember.FindControl("txtRelation") as TextBox).Text = "";

            //display in gridview
            gViewMembers.DataSource = AuthorizedMemberManager.GetListByAccountID(_accountID);
            gViewMembers.DataBind();

        }

        //protected void lnkEditMember_OnCommand(object sender, CommandEventArgs e)
        //{
        //    int memberID = Convert.ToInt32(e.CommandArgument.ToString());
        //    String operation = e.CommandName.ToString().ToLower();

        //    // delete the member from the account
        //    AuthorizedMemberManager.Delete(memberID);

        //    //after the operation reload the data
        //    Account a = new Account();
        //    a.AccountID = accountID;
        //    LoadData_AuthorizedMembersList(a);
        //}


        #endregion

        protected void lnkEditHomeAddress_OnCommand(object sender, CommandEventArgs e)
        {

            AddressList al = new AddressList();
            al.Add(AddressManager.GetAddressById(_homeAddress.AddressID));

            fview_EditHomeAddress.DataSource = al;
            fview_EditHomeAddress.DataBind();
            this.mPopupEdit_HomeAddress.Show();
        }

        protected void lnkEditMailingAddress_OnCommand(object sender, CommandEventArgs e)
        {
            AddressList al = new AddressList();
            al.Add(AddressManager.GetAddressById(_mailingAddress.AddressID));
            fview_EditMailingAddress.DataSource = al;
            fview_EditMailingAddress.DataBind();

            this.mPopupEdit_MailingAddress.Show();

        }

        protected void lnkEditPersonalInformation_OnCommand(object sender, CommandEventArgs e)
        {

            AccountList al = new AccountList();
            al.Add(AccountManager.GetAccountByID(_accountSearched.AccountID));

            fview_EditPersonalInformation.DataSource = al;
            fview_EditPersonalInformation.DataBind();

            this.mPopupEdit_PersonalInformation.Show();
        }

        protected void lnkSaveHomeAddressOnEdit_OnCommand(object sender, CommandEventArgs e)
        {

            //hide the modal popup
            mPopupEdit_HomeAddress.Hide();

            //get the new values from the form
            _homeAddress.AddressLine1 = (fview_EditHomeAddress.FindControl("txtAddressLine1") as TextBox).Text;
            _homeAddress.AddressLine2 = (fview_EditHomeAddress.FindControl("txtAddressLine2") as TextBox).Text;
            _homeAddress.CityTown = (fview_EditHomeAddress.FindControl("txtCityTown") as TextBox).Text;
            _homeAddress.Province = (fview_EditHomeAddress.FindControl("ddlProvince") as DropDownList).SelectedValue;
            _homeAddress.PostalCode = ((fview_EditHomeAddress.FindControl("txtPostalCode_segment1") as TextBox).Text
                                + (fview_EditHomeAddress.FindControl("txtPostalCode_segment2") as TextBox).Text).ToUpper();
            _homeAddress.ModifiedDate = DateTime.Now.ToLocalTime();


            //save the changes
            AddressManager.Save(_homeAddress);

            DisplayHomeAddress(_homeAddress);


        }

        protected void lnkSaveMailingAddressOnEdit_OnCommand(object sender, CommandEventArgs e)
        {
            //hide the modal popup
            mPopupEdit_MailingAddress.Hide();

            //get the new values from the form
            _mailingAddress.AddressLine1 = (fview_EditMailingAddress.FindControl("txtAddressLine1") as TextBox).Text;
            _mailingAddress.AddressLine2 = (fview_EditMailingAddress.FindControl("txtAddressLine2") as TextBox).Text;
            _mailingAddress.CityTown = (fview_EditMailingAddress.FindControl("txtCityTown") as TextBox).Text;
            _mailingAddress.Province = (fview_EditMailingAddress.FindControl("ddlProvince") as DropDownList).SelectedValue;
            _mailingAddress.PostalCode = ((fview_EditMailingAddress.FindControl("txtPostalCode_segment1") as TextBox).Text
                                + (fview_EditMailingAddress.FindControl("txtPostalCode_segment2") as TextBox).Text).ToUpper();
            _mailingAddress.ModifiedDate = DateTime.Now.ToLocalTime();


            //save the changes
            AddressManager.Save(_mailingAddress);

            DisplayMailingAddress(_mailingAddress);

        }

        protected void lnkSavePersonalInformationOnEdit_OnCommand(object sender, CommandEventArgs e)
        {
            //hide the modal popup
            mPopupEdit_PersonalInformation.Hide();

            //get the new values from the form
            _accountSearched.Title = (fview_EditPersonalInformation.FindControl("ddlTitle") as DropDownList).SelectedValue;
            _accountSearched.Firstname = (fview_EditPersonalInformation.FindControl("txtFirstname") as TextBox).Text;
            _accountSearched.Middlename = (fview_EditPersonalInformation.FindControl("txtMiddlename") as TextBox).Text;
            _accountSearched.Lastname = (fview_EditPersonalInformation.FindControl("txtLastname") as TextBox).Text;
            _accountSearched.Suffix = (fview_EditPersonalInformation.FindControl("ddlSuffix") as DropDownList).SelectedValue;
            _accountSearched.Email = (fview_EditPersonalInformation.FindControl("txtEmail") as TextBox).Text;
            _accountSearched.Homephone = (fview_EditPersonalInformation.FindControl("txtHomePhone") as TextBox).Text;
            _accountSearched.Mobilephone = (fview_EditPersonalInformation.FindControl("txtMobilePhone") as TextBox).Text;
            _accountSearched.Workphone = (fview_EditPersonalInformation.FindControl("txtWorkPhone") as TextBox).Text;
            _accountSearched.CustomerSince = Convert.ToDateTime((fview_EditPersonalInformation.FindControl("txtCustSinceDate") as TextBox).Text);
            _accountSearched.WaterSourceLocationID = Convert.ToInt32((fview_EditPersonalInformation.FindControl("ddlWaterSourceLocation") as DropDownList).SelectedValue);
            _accountSearched.ContactFrequency = (fview_EditPersonalInformation.FindControl("ddlContactFrequency") as DropDownList).SelectedValue;
            _accountSearched.IsENewsletter = (fview_EditPersonalInformation.FindControl("chkNewsletterByEmail") as CheckBox).Checked;
            _accountSearched.IsNewsletter = (fview_EditPersonalInformation.FindControl("chkNewsletterByMail") as CheckBox).Checked;
            _accountSearched.ModifiedDate = DateTime.Now.ToLocalTime();


            //save the changes
            AccountManager.Save(_accountSearched);


            DisplayAccount(_accountSearched);
        }

        protected string GetWaterSourceDescriptionByID(int locationID)
        {
            return Ref_WaterSourceLocationDB.GetDescriptionByID(locationID);
        }

        #region Service Work Tab
        protected void lnkGoToServiceWorkOrder_OnCommand(object sender, CommandEventArgs e)
        {
            _accountSearched.AccountID.ToString();
            _accountSearched.Lastname.ToString();

            Session["accountSearched"] = _accountSearched;

            //send info to service work order page
            Response.Redirect("WorkOrder/NewWorkOrder.aspx");




        }


        protected void lnkViewServiceWorkDetails_OnCommand(object sender, CommandEventArgs e)
        {
            int serviceWorkID = Convert.ToInt32(e.CommandArgument.ToString());
            Session["serviceWorkID"] = serviceWorkID;

            //send info to view service work details page
            Response.Redirect("~/Service/View.aspx");

        }
        #endregion

        #region Water Analysis Reports Tab
        protected void lnkAddWaterAnalysis_OnCommand(object sender, CommandEventArgs e)
        {
            //add water analysis

            //get data on form
            WaterAnalysis wat = new WaterAnalysis();
            wat.ClearIron = Convert.ToDecimal((fviewWaterAnalysis.FindControl("txtClearIron") as TextBox).Text);
            wat.Hardness = Convert.ToDecimal((fviewWaterAnalysis.FindControl("txtHardness") as TextBox).Text);
            wat.HydrogenSulfide = Convert.ToDecimal((fviewWaterAnalysis.FindControl("txtHydrogenSulfide") as TextBox).Text);
            wat.PH_Acid = Convert.ToDecimal((fviewWaterAnalysis.FindControl("txtPh") as TextBox).Text);
            wat.TDS = Convert.ToDecimal((fviewWaterAnalysis.FindControl("txtTDS") as TextBox).Text);
            wat.AccountID = _accountID;
            //save
            wat.ReportID = WaterAnalysisManager.Save(wat);

            //clear the fields
            (fviewWaterAnalysis.FindControl("txtClearIron") as TextBox).Text = "";
            (fviewWaterAnalysis.FindControl("txtHardness") as TextBox).Text = "";
            (fviewWaterAnalysis.FindControl("txtHydrogenSulfide") as TextBox).Text = "";
            (fviewWaterAnalysis.FindControl("txtPh") as TextBox).Text = "";
            (fviewWaterAnalysis.FindControl("txtTDS") as TextBox).Text = "";

            //display in gridview
            gviewWaterAnalysis.DataSource = WaterAnalysisManager.GetList(_accountID);
            gviewWaterAnalysis.DataBind();

        }
        #endregion

        #region U-Fill Prepaid Tab
        protected void imgBtnShowDeductBalance_OnCommand(object sender, CommandEventArgs e)
        {

            this.mPopUpShowDeductPrepaidPkg.Show();

            selectedPrepaidBottle = PrepaidBottleManager.GetPrepaidBottleByID(Convert.ToInt32(e.CommandArgument.ToString()));

            PrepaidBottleList pList = new PrepaidBottleList();
            pList.Add(selectedPrepaidBottle);

            //populate formview
            fview_DeductPrepaidBottle.DataSource = pList;
            fview_DeductPrepaidBottle.DataBind();

            //display current balance
            (fview_DeductPrepaidBottle.FindControl("lblCurrentBalanceValue") as Label).Text = selectedPrepaidBottle.Balance.ToString();

            //set the focus on the deduct qty textbox
            (fview_DeductPrepaidBottle.FindControl("txtDeductQty") as TextBox).Focus();

        }

        protected void lnkDeductPrepaid_OnCommand(object sender, CommandEventArgs e)
        {
            //get the deduct qty from the formview
            int deductQty = Convert.ToInt32((fview_DeductPrepaidBottle.FindControl("txtDeductQty") as TextBox).Text);

            selectedPrepaidBottle.DeductBalance(deductQty);
            selectedPrepaidBottle.ModifiedBy = User.Identity.Name.ToString();
            selectedPrepaidBottle.ModifiedDate = DateTime.Now.ToLocalTime();
            PrepaidBottleManager.Save(selectedPrepaidBottle);

            PrepaidBottleTransaction pTransaction = new PrepaidBottleTransaction();
            pTransaction.PrepaidBottleID = selectedPrepaidBottle.PrepaidBottleID;
            pTransaction.LastUpdatedBalance = selectedPrepaidBottle.Balance;
            pTransaction.DeductQty = deductQty;
            pTransaction.TransactionType = "deduct";
            pTransaction.CreatedBy = User.Identity.Name.ToString();
            pTransaction.LastTransactionDate = DateTime.Now.ToLocalTime();
            PrepaidBottleTransactionManager.Save(pTransaction);

            //refresh the Prepaid Water Gridview
            DisplayPrepaidWater();



        }


        protected void lnkViewPrepaidHistory_OnCommand(object sender, CommandEventArgs e)
        {
            this.modPopUpPrepaidHistory.Show();

            int prepaidID = Convert.ToInt32(e.CommandArgument.ToString());
            //populate the gridview prepaid history
            gviewPrepaidHistory.DataSource = PrepaidBottleTransactionManager.GetListByPrepaidID(prepaidID);
            gviewPrepaidHistory.DataBind();

        }


        protected void imgBtnGoToSale_OnCommand(object sender, CommandEventArgs e)
        {
            //go to the sale page
            Session["accountID"] = _accountID;
            Response.Redirect("~/Sales/New.aspx");
        }


        #region Gridview Prepaid History
        protected void gviewPrepaidHistory_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //show the UpdateQty value depending on the type of transaction
                //if type of transaction is a top up, show top up qty,
                // else show deduct qty

                //find the transaction type for each row
                string transactionType = (e.Row.FindControl("lblTransactionType") as Label).Text;
                string updateQty = "";

                if (transactionType.ToLower() == "topup")
                {
                    //get the hidden top up qty in the gridview and assign it to the updateQty column
                    updateQty = (e.Row.FindControl("hdnTopUpQty") as HiddenField).Value.ToString();
                }
                else //deduct
                {
                    updateQty = (e.Row.FindControl("hdnDeductQty") as HiddenField).Value.ToString();
                }

                //display the updateQty in the gridview
                (e.Row.FindControl("lblUpdateQty") as Label).Text = updateQty;
            }
        }
        #endregion
        #endregion


        protected void lnkAddWTE_OnCommand(object sender, CommandEventArgs e)
        {
            //add record to db

            //get date from form
            WaterTreatmentEquipment w = new WaterTreatmentEquipment();

            w.AccountID = _accountID;
            w.ProductCode = (fviewWTE.FindControl("txtProductCode") as TextBox).Text;
            w.Description = (fviewWTE.FindControl("txtDescription") as TextBox).Text;
            w.Manufacturer = (fviewWTE.FindControl("txtManufacturer") as TextBox).Text;
            w.DateObtained = Convert.ToDateTime((fviewWTE.FindControl("txtDateObtained") as TextBox).Text);   
            w.CreatedBy = User.Identity.Name.ToString();
            w.WTE_ID = WTEManager.Save(w);

            ClearWTEFields();

            //populate the gridview
            DisplayWTE();

        }



        private void ClearWTEFields()
        {
            //clear fields
            (fviewWTE.FindControl("txtDescription") as TextBox).Text = "";
            (fviewWTE.FindControl("txtProductCode") as TextBox).Text = "";
            (fviewWTE.FindControl("txtManufacturer") as TextBox).Text = "";
            (fviewWTE.FindControl("txtDateObtained") as TextBox).Text = "";
        }


        protected void lnkLookupWTE_OnCommand(object sender, CommandEventArgs e)
        {
            //reset the search fields
            txtSearchWTE.Text = "";
            ddlSearchWTE.SelectedIndex = 0;
            txtSearchWTE.Focus();

            //clear the gridview
            gviewSearchWTE.DataSource = null;
            gviewSearchWTE.DataBind();

            this.modPopUpSelectWTE.Show();
        }

        protected void lnkResetWTEFields_OnCommand(object sender, CommandEventArgs e)
        {
            ClearWTEFields();
        }

        protected void btnSearchWTE_OnCommand(object sender, CommandEventArgs e)
        {

            string searchBy = ddlSearchWTE.SelectedValue.ToString();
            string input = txtSearchWTE.Text.ToString();
            _productList = ProductManager.GetWTEProductsByCriteria(searchBy, input);

            //display search result in gridview
            gviewSearchWTE.DataSource = _productList;
            gviewSearchWTE.DataBind();

            this.modPopUpSelectWTE.Show();
        }

        protected void lnkSelectWTE_OnCommand(object sender, CommandEventArgs e)
        {

            //get the product details using the product id
            int productID = Convert.ToInt32(e.CommandArgument.ToString());


            IEnumerable<Product> prodQuery = from prod in _productList
                                             where prod.ProductID == productID
                                             select prod;

            //populate the information on the Equipment Tab Textboxes
            foreach (Product p in prodQuery)
            {
                (fviewWTE.FindControl("txtDescription") as TextBox).Text = p.ProductDescription;
                (fviewWTE.FindControl("txtProductCode") as TextBox).Text = p.ProductCode;
                (fviewWTE.FindControl("txtManufacturer") as TextBox).Text = p.ManufacturerName;
            }




        }

        //protected void ddlSetReminder_OnSelectedIndexChanged(object sender, EventArgs e)
        //{

        //    DropDownList ddlSetReminder = fviewWTE.FindControl("ddlSetReminder") as DropDownList;
        //    if (ddlSetReminder.SelectedValue == "true")
        //    {
        //        //enable the other reminder params
        //        (fviewWTE.FindControl("pnlReminders") as Panel).Visible = true;

        //        //txtNextReminderDate
        //        //TextBox t = (fviewWTE.FindControl("txtNextReminderDate") as TextBox);
        //        //RequiredFieldValidator r = (fviewWTE.FindControl("rfv") as  RequiredFieldValidator);
        //        //r.ControlToValidate = (t.ID.ToString());
        //        //r.Display = ValidatorDisplay.Dynamic;
        //        //r.ValidationGroup = "valAddWTE";
        //        //r.ErrorMessage = "add";
        //        //fviewWTE.Controls.Add(r);

        //    }
        //    else
        //    {
        //        (fviewWTE.FindControl("pnlReminders") as Panel).Visible = false;
        //    }
        //}

        protected void gviewWTE_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;

            //delete the wte
            int wteID = Convert.ToInt32((gviewWTE.Rows[index].FindControl("hdnWTEID") as  HiddenField).Value);
            WTEManager.DeleteWTE(wteID);

            //display the gridview
            DisplayWTE();


        }

        protected void gviewWTE_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //show the modal popup

            //load the formview

            //get the id
            int wteID = Convert.ToInt32((gviewWTE.Rows[e.NewEditIndex].FindControl("hdnWTEID") as HiddenField).Value.ToString());
            WaterTreatmentEquipment wte = WTEManager.GetByWTEID(wteID);
            WaterTreatmentEquipmentList wteList = new WaterTreatmentEquipmentList();
            wteList.Add(wte);

            fviewUpdateWTE.DataSource = wteList;
            fviewUpdateWTE.DataBind();

            this.modPopUpShowUpdateWTE.Show();

        }


        protected void gviewWTE_RowDataBound(object sender, GridViewRowEventArgs e)
        {


        }


        protected void lnkUpdateWTE_OnCommand(object sender, CommandEventArgs e) 
        {
            //get details from formview hdnWteID
            WaterTreatmentEquipment w = new WaterTreatmentEquipment();
            w.WTE_ID = Convert.ToInt32( (fviewUpdateWTE.FindControl("hdnWteID") as HiddenField).Value.ToString());
            w.Description = (fviewUpdateWTE.FindControl("txtDescription") as TextBox).Text;
            w.Manufacturer = (fviewUpdateWTE.FindControl("txtManufacturer") as TextBox).Text;
            w.ProductCode = (fviewUpdateWTE.FindControl("txtProductCode") as TextBox).Text;
            w.DateObtained =  Convert.ToDateTime( (fviewUpdateWTE.FindControl("txtDateObtained") as TextBox).Text);
            w.ModifiedBy = User.Identity.Name.ToString();




            //update the record
            WTEManager.Save(w);

            //re-display the gridview
            DisplayWTE();
        
        
        
        }



        #region Helpers



        protected string ConvertCheckBoxValueIntoYesNo(string val)
        {
            return StringParser.ConvertCheckBoxValueIntoYesNo(val);
        }



        #endregion



    }
}
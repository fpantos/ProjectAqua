using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessObject.Collections;
using AquaLibrary.BusinessLayer;
using AquaLibrary.Enums;
using AquaLibrary.Helper;



namespace Aqua.Accounts
{
    public partial class NewAccount : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["accountToEdit"] != null)
                {



                }

                else
                {

                }

            }
        }

        protected void chkMailingAddressSameAsHomeAddress_CheckedChanged(object sender, EventArgs e)
        {
            if (chkMailingAddressSameAsHomeAddress.Checked == false)
            {
                fViewMailingAddress.Visible = true;
            }
            else
            {
                fViewMailingAddress.Visible = false;
            }
        }

        protected void lnkSave_Command(object sender, CommandEventArgs e)
        {
            // Save the new account
            Account myAccount = null;
            myAccount = GetAccountDetailsFromForm();
            myAccount.AccountID = AccountManager.Save(myAccount);


            //Save the home address
            Address myHomeAddress = null;
            myHomeAddress = GetHomeAddressDetailsFromForm();
            myHomeAddress.AddressID = AddressManager.Save(myHomeAddress);

            //save the mailing address
            Address myMailingAddress = null;
            myMailingAddress = GetMailingAddressDetailsFromForm();
            myMailingAddress.AddressID = AddressManager.Save(myMailingAddress);


            //Save the Home address and the new account on the AccountAddress table
            AccountAddress newAccountAddress = new AccountAddress();
            newAccountAddress.AccountID = myAccount.AccountID;
            newAccountAddress.AddressID = myHomeAddress.AddressID;
            newAccountAddress.AddressType = Convert.ToInt32(AddressType.Home);
            AccountAddressManager.AddAccountAddress(newAccountAddress);
            

            // Save the Mailing address and new account on the AccountAddress table
            newAccountAddress.AddressID = myMailingAddress.AddressID;
            newAccountAddress.AddressType = Convert.ToInt32(AddressType.Mailing);
            AccountAddressManager.AddAccountAddress(newAccountAddress);

            Session["accountID"] = null;
            Session["accountID"] = myAccount.AccountID;
            Response.Redirect("~/Accounts/ViewAccount.aspx");
        }

        private Address GetMailingAddressDetailsFromForm()
        {
             Address mailingAddress = new Address();
            // if checked, the home address is the same as the mailing address
            // get the details from the home address form
            if (chkMailingAddressSameAsHomeAddress.Checked)
            {
                mailingAddress.AddressLine1 = (fViewHomeAddress.FindControl("txtAddressLine1") as TextBox).Text;
                mailingAddress.AddressLine2 = (fViewHomeAddress.FindControl("txtAddressLine2") as TextBox).Text;
                mailingAddress.CityTown = (fViewHomeAddress.FindControl("txtCityTown") as TextBox).Text;
                mailingAddress.Province = (fViewHomeAddress.FindControl("ddlProvince") as DropDownList).SelectedValue;
                mailingAddress.PostalCode = ((fViewHomeAddress.FindControl("txtPostalCode_segment1") as TextBox).Text
                                    + (fViewHomeAddress.FindControl("txtPostalCode_segment2") as TextBox).Text).ToUpper();
            }
            else
            {
                mailingAddress.AddressLine1 = (fViewMailingAddress.FindControl("txtAddressLine1") as TextBox).Text;
                mailingAddress.AddressLine2 = (fViewMailingAddress.FindControl("txtAddressLine2") as TextBox).Text;
                mailingAddress.CityTown = (fViewMailingAddress.FindControl("txtCityTown") as TextBox).Text;
                mailingAddress.Province = (fViewMailingAddress.FindControl("ddlProvince") as DropDownList).SelectedValue;
                mailingAddress.PostalCode = ((fViewMailingAddress.FindControl("txtPostalCode_segment1") as TextBox).Text
                                    + (fViewMailingAddress.FindControl("txtPostalCode_segment2") as TextBox).Text).ToUpper();

            }

            return mailingAddress;
        }

        private Address GetHomeAddressDetailsFromForm()
        {
            Address homeAddress = new Address();
            homeAddress.AddressLine1 = (fViewHomeAddress.FindControl("txtAddressLine1") as TextBox).Text;
            homeAddress.AddressLine2 = (fViewHomeAddress.FindControl("txtAddressLine2") as TextBox).Text;
            homeAddress.CityTown = (fViewHomeAddress.FindControl("txtCityTown") as TextBox).Text;
            homeAddress.Province = (fViewHomeAddress.FindControl("ddlProvince") as DropDownList).SelectedValue;
            homeAddress.PostalCode = ((fViewHomeAddress.FindControl("txtPostalCode_segment1") as TextBox).Text
                                + (fViewHomeAddress.FindControl("txtPostalCode_segment2") as TextBox).Text).ToUpper();
            return homeAddress;
        }

        private Account GetAccountDetailsFromForm()
        {
            
            Account account = new Account();
            account.Title = (fViewCustomer.FindControl("ddlTitle") as DropDownList).SelectedValue;
            account.Firstname = (fViewCustomer.FindControl("txtFirstname") as TextBox).Text;
            account.Middlename = (fViewCustomer.FindControl("txtMiddlename") as TextBox).Text;
            account.Lastname = (fViewCustomer.FindControl("txtLastname") as TextBox).Text;
            account.Suffix = (fViewCustomer.FindControl("ddlSuffix") as DropDownList).SelectedValue;
            account.Email = (fViewCustomer.FindControl("txtEmail") as TextBox).Text;
            account.Homephone = (fViewCustomer.FindControl("txtHomePhone") as TextBox).Text;
            account.Mobilephone = (fViewCustomer.FindControl("txtMobilePhone") as TextBox ).Text;
            account.Workphone = (fViewCustomer.FindControl("txtWorkPhone") as TextBox).Text ;
            account.CustomerSince = Convert.ToDateTime((fViewCustomer.FindControl("txtCustSinceDate") as TextBox).Text);
            account.WaterSourceLocationID = Convert.ToInt32((fViewCustomer.FindControl("ddlWaterSourceLocation") as DropDownList).SelectedValue);
            account.ContactFrequency = (fViewCustomer.FindControl("ddlContactFrequency") as DropDownList).SelectedValue;
            account.IsENewsletter = (fViewCustomer.FindControl("chkNewsletterByEmail") as CheckBox).Checked;
            account.IsNewsletter = (fViewCustomer.FindControl("chkNewsletterByMail") as CheckBox).Checked;
            return account;
        }

        protected void ddlProvince_DataBound(object sender, EventArgs e)
        {
            DropDownList ddlProvince = fViewHomeAddress.FindControl("ddlProvince") as DropDownList;
            ddlProvince.SelectedIndex = 8; //default to ontario


        }






    }
}
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Extensions;
using System.Web.UI.WebControls;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessLayer;
using AquaLibrary.DataAccess;
using AquaLibrary.Helper;
using System.Data;

namespace Aqua.Accounts
{
    public partial class SearchAccount : System.Web.UI.Page
    {
        static string _searchBy = "";
        static string _searchString = "";
        static int _srcValue = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //get the querystring
                NameValueCollection n =  new NameValueCollection(Request.QueryString);
                
                if (n.HasKeys())
                {
                    _srcValue = Convert.ToInt32(n.Get(0));
                    //src=1 means that the user will be coming from the Sales page.
                    if (_srcValue == 1)
                    {
                        //prepare the gridview for searching an account to add in the invoice
                        gViewSearchResults.Columns[6].Visible = false; //deactivate column                     
                    }
                    n.Remove("src");
                }

                // clear the session strings
                Session["accountToUpdate"] = null;

                //put the focus on the dropdownlist on load
                ddlSearchAccount.Focus();


            }


        }

        protected void ddlSearchAccount_SelectedIndexChanged(object sender, EventArgs e)
        {

            txtInput.Focus();
            txtInput_AutoCompleteExtender.ContextKey = ddlSearchAccount.SelectedValue;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //clear the lblMessage for any previous messages
            lblMessage.Text = "";

            //search for the account here
            //string searchBy = ddlSearchAccount.SelectedValue;
            _searchBy = ddlSearchAccount.SelectedValue;

            // string searchString = txtInput.Text;
            _searchString = txtInput.Text;
            bool passedValidation = true;

            if (_searchBy == "By_AccountID")
            {
                //try converting the account id into a number
                // if it fails, then alert the user
                try
                {
                    Convert.ToInt32(_searchString);
                }
                catch (FormatException)
                {

                    lblMessage.Text = " Account#  " + _searchString + " is not valid. Please try again. ";
                    txtInput.Focus();
                    passedValidation = false;
                }
            }



            if (((ddlSearchAccount.SelectedIndex != 0) && (_searchString != "") && passedValidation))
            {  //proceed to search
                PopulateGridviewSearchResult();
            }


        }

        private void PopulateGridviewSearchResult()
        {
            DataTable searchResultsDataTable = AccountManager.GetAccountWithAddressBySearchCriteria(_searchBy, _searchString);
            gViewSearchResults.DataSource = searchResultsDataTable;

            // Session["accountToAdd"] = searchResultsDataTable;

            gViewSearchResults.DataBind();
            lblSearchResultCount.Text = "Search Results . . . . . Found " + searchResultsDataTable.Rows.Count + " row(s).";
        }

        protected void lnkName_OnCommand(object sender, CommandEventArgs e)
        {
            Session["accountID"] = null;
            Session["accountID"] = e.CommandArgument.ToString();

            if (_srcValue == 1) //redirect to the sale page
            {
                _srcValue = 0;//reset the static variable
                Response.Redirect("~/Sales/New.aspx");
                
            }
            else //go to the view accounts page
            {
                Response.Redirect("~/Accounts/ViewAccount.aspx");
            }


        }



        #region Helpers
        public static string GetAccountStatus(string isActive)
        {
            return StringParser.GetStatus(isActive);
        }

        public static string FormatPhonenumber(string phonenumber)
        {
            return StringParser.FormatPhonenumber(phonenumber);
        }
        #endregion



        #region Gridview SearchResults Events
        protected void gViewSearchResults_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            LinkButton lnkAccountStatusChanger = (e.Row.FindControl("lnkAccountStatusChanger") as LinkButton);

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //check the accounts' status
                string accountStatus = (e.Row.FindControl("lblAccountStatus") as Label).Text;


                if (accountStatus.ToLower() == "active")
                {

                    lnkAccountStatusChanger.Text = "Deactivate";
                    lnkAccountStatusChanger.CommandName = "deactivate";
                    (e.Row.FindControl("lnkName") as LinkButton).Enabled = true;
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }
                else
                {
                    lnkAccountStatusChanger.Text = "Activate";
                    lnkAccountStatusChanger.CommandName = "activate";

                    //disable the link button to click the account
                    (e.Row.FindControl("lnkName") as LinkButton).Enabled = false;
                    e.Row.ForeColor = System.Drawing.Color.Gray;
                }

            }

        }
        #endregion

        protected void lnkAccountStatusChanger_OnCommand(object sender, CommandEventArgs e)
        {
            string accountID = e.CommandArgument.ToString();
            Account account = new Account();
            account.AccountID = Convert.ToInt32(accountID);
            account.ModifiedDate = DateTime.Now.ToLocalTime();
            account.ModifiedBy = User.Identity.Name.ToString();

            //check if the action will be activate or deactivate
            if (e.CommandName == "deactivate")
            {
                //deactivate the account
                //Call the AccountManager to deactivate the account
                AccountManager.Deactivate(account);
            }
            else
            {
                //re-activate the account
                AccountManager.Activate(account);
            }

            //re-bind the gridview
            PopulateGridviewSearchResult();

        }
    }
}

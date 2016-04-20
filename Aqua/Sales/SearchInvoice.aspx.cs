using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AquaLibrary.BusinessLayer;

namespace Aqua.Sales
{
    public partial class SearchInvoice : System.Web.UI.Page
    {
        private static string _searchBy = "";
        private static string _searchString = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //put the focus on the dropdownlist on load
                ddlSearchCriteria.Focus();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //clear the lblMessage for any previous messages
            lblMessage.Text = "";

            //search for the account here
            //string searchBy = ddlSearchAccount.SelectedValue;
            _searchBy = ddlSearchCriteria.SelectedValue;

            // string searchString = txtInput.Text;
            _searchString = txtSearchInput.Text;
            bool passedValidation = true;

            if (_searchBy == "by_invoiceID")
            {
                //try converting the account id into a number
                // if it fails, then alert the user
                try
                {
                    Convert.ToInt32(_searchString);
                }
                catch (FormatException)
                {

                    lblMessage.Text = " Invoice# " + _searchString + " is not valid. Please try again. ";
                    txtSearchInput.Focus();
                    passedValidation = false;
                }
            }

            if (((ddlSearchCriteria.SelectedIndex != 0) && (_searchString != "") && passedValidation))
            {  //proceed to search
                PopulateGridviewSearchResult();
            }
        }

        private void PopulateGridviewSearchResult()
        {
            DataTable searchResultsDataTable = InvoiceManager.GetInvoiceBySearchCriteria(_searchBy, _searchString);
            gviewInvoiceSearchResult.DataSource = searchResultsDataTable;

            gviewInvoiceSearchResult.DataBind();
            lblSearchResultCount.Text = "Search Results . . . . . Found " + searchResultsDataTable.Rows.Count + " row(s).";
        }

        protected void lnkName_OnCommand(object sender, CommandEventArgs e)
        {
            Session["InvoiceID"] = null;
            Session["InvoiceID"] = e.CommandArgument.ToString();
            Response.Redirect("~/Sales/Invoice.aspx");

        }

        protected void ddlSearchCriteria_SelectedIndexChanged(object sender, EventArgs e)
        {

            txtSearchInput.Focus();
            txtSearchInput_AutoCompleteExtender.ContextKey = ddlSearchCriteria.SelectedValue;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Extensions;
using System.Web.UI.WebControls;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessLayer;
using AquaLibrary.DataAccess;
using System.Data;
using AquaLibrary.Helper;

namespace Aqua.Admin.EmployeeManagement
{
    public partial class SearchEmployee : System.Web.UI.Page
    {
        static String searchString;
        static String searchBy;

        protected void Page_Load(object sender, EventArgs e)
        {
            // clear the session strings
            Session["employeeToUpdate"] = null;

            //put the focus on the dropdownlist on load
            ddlSearchEmployee.Focus();

        }



        protected void ddlSearchEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSearchEmployee.SelectedIndex == 0) //select criteria
            {
                txtInput.MaxLength = 30;
            }
            else if (ddlSearchEmployee.SelectedIndex == 1) //by lastname
            {
                txtInput.MaxLength = 30;
            }
            else if (ddlSearchEmployee.SelectedIndex == 2) // id
            {
                txtInput.MaxLength = 10;
            }

            txtInput.Focus();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //search for the account here
            searchBy = ddlSearchEmployee.SelectedValue;
            searchString = txtInput.Text;
            bool passedValidation = true;

            if (searchBy == "By_EmployeeID")
            {
                //try converting the account id into a number
                // if it fails, then alert the user
                try
                {
                    Convert.ToInt32(searchString);
                }
                catch (FormatException)
                {

                    lblMessage.Text = " Employee#  " + searchString + " is not a valid ID. Please try again. ";
                    txtInput.Focus();
                    passedValidation = false;
                }
            }

            if ((ddlSearchEmployee.SelectedIndex != 0) && (searchString != "") && (passedValidation))
            {//proceed to search

                PopulateGridviewSearchResult();
            }


        }

        private void PopulateGridviewSearchResult()
        {
            DataTable searchResultsDataTable = EmployeeDB.GetEmployeeWithAddressBySearchCriteria(searchBy, searchString);
            gViewSearchResults.DataSource = searchResultsDataTable;
            gViewSearchResults.DataBind();
            lblSearchResultCount.Text = "Search Results . . . . . Found " + searchResultsDataTable.Rows.Count + " row(s).";
        }

        public static string GetEmployeeStatus(string isActive)
        {
            return StringParser.GetStatus(isActive);
        }

        protected void lnkEmployeeStatusChanger_OnCommand(object sender, CommandEventArgs e)
        {
            string employeeID = e.CommandArgument.ToString();
            Employee employee = new Employee();
            employee.EmployeeID = Convert.ToInt32(employeeID);
            employee.ModifiedDate = DateTime.Now.ToLocalTime();
            employee.ModifiedBy = User.Identity.Name.ToString();
            employee.RehiredDate = DateTime.Now.ToLocalTime();
            employee.TerminatedDate = DateTime.Now.ToLocalTime();

            //check if the action will be activate or deactivate
            if (e.CommandName == "deactivate")
            {
                //deactivate the account
                //Call the AccountManager to deactivate the account
                EmployeeManager.Deactivate(employee);
            }
            else
            {
                //re-activate the account
                EmployeeManager.Activate(employee);
            }

            PopulateGridviewSearchResult();
        }

        protected void gViewSearchResults_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            LinkButton lnkEmployeeStatusChanger = (e.Row.FindControl("lnkEmployeeStatusChanger") as LinkButton);

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //check the accounts' status
                string employeeStatus = (e.Row.FindControl("lblIsActive") as Label).Text;


                if (employeeStatus.ToLower() == "active")
                {

                    lnkEmployeeStatusChanger.Text = "Deactivate";
                    lnkEmployeeStatusChanger.CommandName = "deactivate";
                    (e.Row.FindControl("lnkName") as LinkButton).Enabled = true;
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }
                else
                {
                    lnkEmployeeStatusChanger.Text = "Activate";
                    lnkEmployeeStatusChanger.CommandName = "activate";

                    //disable the link button to click the account
                    (e.Row.FindControl("lnkName") as LinkButton).Enabled = false;
                    e.Row.ForeColor = System.Drawing.Color.Gray;
                }

            }

        }

        //protected void gViewEmployees_Sorting(object sender, GridViewSortEventArgs e)
        //{
        //    DataTable dtAllAccounts = Session["dtAllEmployees"] as DataTable;

        //    if (dtAllAccounts != null)
        //    {
        //        //e.SortDirection.ToString();
        //        dtAllAccounts.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
        //        gViewSearchResults.DataSource = Session["dtAllEmployees"] as DataTable;
        //        gViewSearchResults.DataBind();
        //    }

        //}

        //protected string GetSortDirection(string sortExpression)
        //{
        //    string sortDirection = "DESC";
        //    string lastSortExpression = "";
        //    string lastSortDirection;

        //    //get the last sortexpression that was used
        //    lastSortExpression = ViewState["sortExpression"] as string;

        //    if (sortExpression != null)
        //    {

        //        if (sortExpression == lastSortExpression)
        //        {
        //            lastSortDirection = ViewState["sortDirection"] as string;
        //            if ((lastSortDirection != null) && (lastSortDirection == "DESC"))
        //            {
        //                //reverse the sort order
        //                sortDirection = "ASC";
        //            }

        //        }
        //    }

        //    //save the new sort expression and sort direction values
        //    ViewState["sortExpression"] = sortExpression;
        //    ViewState["sortDirection"] = sortDirection;
        //    return sortDirection;
        //}

        protected void lnkName_OnCommand(object sender, CommandEventArgs e)
        {
            Session["employeeID"] = null;
            Session["employeeID"] = e.CommandArgument.ToString();

            Response.Redirect("~/Admin/EmployeeManagement/ViewEmployee.aspx");
        }
    }
}
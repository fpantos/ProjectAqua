using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AquaLibrary.BusinessLayer;
using AquaLibrary.Helper;
using AquaLibrary.BusinessObject;

namespace Aqua.Admin.EmployeeManagement
{
    public partial class ShowAllEmployees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridview();
            }
        }

        private void BindGridview()
        {
            //populate gridview
            DataTable dt = EmployeeManager.GetEmployeeWithAddress();

            //save the datatable in a session
            Session["dtAllEmployees"] = dt;

            gViewEmployees.DataSource = dt;
            gViewEmployees.DataBind();
        }

        protected void gViewEmployees_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtAllEmployees = Session["dtAllEmployees"] as DataTable;

            if (dtAllEmployees != null)
            {
                //e.SortDirection.ToString();
                dtAllEmployees.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
                gViewEmployees.DataSource = Session["dtAllEmployees"] as DataTable;
                gViewEmployees.DataBind();
            }

        }

        protected string GetSortDirection(string sortExpression)
        {
            string sortDirection = "DESC";
            string lastSortExpression = "";
            string lastSortDirection;

            //get the last sortexpression that was used
            lastSortExpression = ViewState["sortExpression"] as string;

            if (sortExpression != null)
            {
                if (sortExpression == lastSortExpression)
                {
                    lastSortDirection = ViewState["sortDirection"] as string;
                    if ((lastSortDirection != null) && (lastSortDirection == "DESC"))
                    {
                        //reverse the sort order
                        sortDirection = "ASC";
                    }
                }
            }

            //save the new sort expression and sort direction values
            ViewState["sortExpression"] = sortExpression;
            ViewState["sortDirection"] = sortDirection;
            return sortDirection;
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

            //re-bind the gridview
            BindGridview();

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

        protected void lnkName_OnCommand(object sender, CommandEventArgs e)
        {
            Session["employeeID"] = null;
            Session["employeeID"] = e.CommandArgument.ToString();

            Response.Redirect("~/Admin/EmployeeManagement/ViewEmployee.aspx");
        }
    }
}
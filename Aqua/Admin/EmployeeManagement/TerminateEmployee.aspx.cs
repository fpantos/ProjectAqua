using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AquaLibrary.DataAccess;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessLayer;

namespace Aqua.Admin.EmployeeManagement
{
    public partial class TerminateEmployee : System.Web.UI.Page
    {
        static Employee employeeTerminated = new Employee();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable searchResultsDataTable = EmployeeDB.GetActiveEmployeeList();
                gviewEmployees.DataSource = searchResultsDataTable;
                gviewEmployees.DataBind();
            }
        }

        //protected void gviewEmployee_RowDeleting(object sender,  GridViewRowEventArgs e)
        //{
        //    //string id = lblEmployeeId.Text;
        //    ////string searchString = "By_EmployeeID";
        //    //DataTable searchResultsDataTable = EmployeeDB.DeactivateEmployee(id);
        //    //gviewEmployees.DataSource = searchResultsDataTable;
        //    //gviewEmployees.DataBind();
        //  //string t =   (gviewEmployees.Rows[e.Row.RowIndex].FindControl("lnkTerminateEmployee") as LinkButton).CommandArgument.ToString();

            
        //  //  employeeTerminated.EmployeeID = Convert.ToInt32((gviewEmployees.FindControl("lnkTerminateEmployee") as LinkButton).CommandArgument.ToString());
        //  //  employeeTerminated.ModifiedDate = DateTime.Now.ToLocalTime();
        //  //  employeeTerminated.TerminatedDate = DateTime.Now.ToLocalTime();
        //  //  employeeTerminated.IsEmployed = false;

        //  //  //save the changes
        //  //  EmployeeManager.Save(employeeTerminated);
        //}

        //private void DeactivateEmployee(object sender, CommandEventArgs e) 
        //{
        //    Session["employeeID"] = null;
        //    Session["employeeID"] = e.CommandArgument.ToString();

        //    Response.Redirect("~/Admin/EmployeeManagement/TerminateEmployee.aspx");
        //}

        protected void gviewEmployee_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //string id = lblEmployeeId.Text;
            ////string searchString = "By_EmployeeID";
            //DataTable searchResultsDataTable = EmployeeDB.DeactivateEmployee(id);
            //gviewEmployees.DataSource = searchResultsDataTable;
            //gviewEmployees.DataBind();
            employeeTerminated.EmployeeID = Convert.ToInt32((gviewEmployees.Rows[e.RowIndex].FindControl("lnkTerminateEmployee") as LinkButton).CommandArgument.ToString());


            //employeeTerminated.EmployeeID = Convert.ToInt32((gviewEmployees.FindControl("lnkTerminateEmployee") as LinkButton).CommandArgument.ToString());
            employeeTerminated.ModifiedDate = DateTime.Now.ToLocalTime();
            employeeTerminated.TerminatedDate = DateTime.Now.ToLocalTime();
            employeeTerminated.ModifiedBy = User.Identity.Name.ToString();
            employeeTerminated.IsEmployed = false;

            //save the changes
            EmployeeManager.DeactivateEmployee(employeeTerminated);

            Response.Redirect("~/Admin/EmployeeManagement/TerminateEmployee.aspx");
        }
    }
}
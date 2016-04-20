using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessLayer;
using AquaLibrary.DataAccess;

namespace Aqua.Admin.EmployeeManagement
{
    public partial class ManageJobTitle : System.Web.UI.Page
    {
        static JobPosition jobPosition = new JobPosition();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable searchResultsDataTable = JobPositionManager.GetAll();
                gviewPositions.DataSource = searchResultsDataTable;
                gviewPositions.DataBind();
            }
        }


        protected void gviewJobPosition_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;

            jobPosition.PositionID = Convert.ToInt32((gviewPositions.Rows[rowIndex].FindControl("lnkDeletePosition") as LinkButton).CommandArgument);

            //delete the position
            JobPositionManager.DeleteJobPosition(jobPosition);

            //refresh the page
            Response.Redirect("~/Admin/EmployeeManagement/ManageJobTitle.aspx");




        }

        protected void gviewPositions_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            List<int> activePositionIDList = JobPositionManager.GetPositionIDsInUse();
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HiddenField hdnPositionID = (e.Row.FindControl("hdnPositionID") as HiddenField);
                int positionIDToBeDeleted = Convert.ToInt32(hdnPositionID.Value);

                if (activePositionIDList.Contains(positionIDToBeDeleted))
                {
                    //disable the delete button
                    LinkButton lnkDeletePosition = (e.Row.FindControl("lnkDeletePosition") as LinkButton);
                    lnkDeletePosition.Enabled = false;
                    lnkDeletePosition.ForeColor = System.Drawing.Color.Gray;
                }

            }
        }

        protected void lnkSave_OnCommand(object sender, CommandEventArgs e)
        {   //clear previous messages
            lblJobPositionMessage.Text = "";

            JobPosition job = new JobPosition();
            job.PositionName = txtNewPosition.Text.Trim();

            //check if position name already exist. If it does, do not add
            List<string> jobPositionsList = JobPositionManager.GetPositionNames();
            if (jobPositionsList.Contains(job.PositionName.ToLower()))
            {
                //do not add
                lblJobPositionMessage.Text = " This position already exists!";
                lblJobPositionMessage.ForeColor = System.Drawing.Color.Red;
            }
            else {
                //save
                job.PositionID = JobPositionManager.Save(job);
                Response.Redirect("~/Admin/EmployeeManagement/ManageJobTitle.aspx");
            }

           



        }

        
    }
}
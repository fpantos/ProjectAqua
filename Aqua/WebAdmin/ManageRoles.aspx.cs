using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Aqua.Admin.UserManagement
{
    public partial class ManageRoles : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayRoles();
            }
        }

        protected void btnCreateRole_Click(object sender, EventArgs e)
        {
            string newRole = txtNewRole.Text.Trim();

            if (!Roles.RoleExists(newRole))
            {
                // add the role
                Roles.CreateRole(newRole);

                DisplayRoles();
            }

            txtNewRole.Text = "";

        }

        private void DisplayRoles()
        {         
            gviewRoleList.DataSource = Roles.GetAllRoles();
            gviewRoleList.DataBind();
        }

        #region gviewRoleList events
        protected void gviewRoleList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string roleName = (gviewRoleList.Rows[e.RowIndex].FindControl("lblRoleName") as Label).Text;
            Roles.DeleteRole(roleName, false);
            DisplayRoles();
        }
        protected void gviewRoleList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //get the role in the current row
                string roleName = (e.Row.FindControl("lblRoleName") as Label).Text;

                string[] users = Roles.GetUsersInRole(roleName);
                int userCount = users.Count();
                if (userCount != 0) // no users is currently attached to this role
                {
                    (e.Row.FindControl("lnkDelete") as LinkButton).Enabled = false;
                    (e.Row.FindControl("lnkDelete") as LinkButton).ForeColor = System.Drawing.Color.Gray;
                }
            }

        }
        #endregion


    }
}
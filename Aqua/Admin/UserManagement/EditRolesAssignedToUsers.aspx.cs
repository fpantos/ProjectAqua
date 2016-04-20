using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Aqua.Admin.UserAndRoleManagement
{
    public partial class EditRolesAssignedToUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUsersToDropdownlist();
                BindRoles();
                CheckRolesForSelectedUser();
            }

        }

        private void BindRoles()
        {
            //bind roles to repeater
            string[] roles = Roles.GetAllRoles();
            List<string> filteredRoles = new List<string>();

            if (User.IsInRole("WebAdmin"))
            {
                //do nothing
                rptrRoles.DataSource = roles;
                rptrRoles.DataBind();
            }
            else
            {
                //get all roles excep web admin
                filteredRoles = roles.ToList<string>();
                filteredRoles.Remove("WebAdmin");

                rptrRoles.DataSource = filteredRoles;
                rptrRoles.DataBind();
            }
        }

        private void BindUsersToDropdownlist()
        {
            //bind users to dropdownlist
            MembershipUserCollection users = Membership.GetAllUsers();

            if (User.IsInRole("WebAdmin"))
            {
                //do nothing
                //display all users when the User has Web Admin Privs
            }
            else
            {
                //filter the users so that web admins are not present in the list
                //get all users except Web Admins
                List<string> webAdmins = Roles.GetUsersInRole("WebAdmin").ToList<string>();

                foreach (string webAdmin in webAdmins)
                {
                    users.Remove(webAdmin);
                }
            }

            ddlUsers.DataSource = users;
            ddlUsers.DataBind();
        }

        private void CheckRolesForSelectedUser()
        {
            string selectedUser = ddlUsers.SelectedValue;
            string[] selectedUserRoles = Roles.GetRolesForUser(selectedUser);

            foreach (RepeaterItem ri in rptrRoles.Items)
            {
                // Programmatically reference the CheckBox 
                CheckBox RoleCheckBox = ri.FindControl("chkRole") as CheckBox;
                // See if RoleCheckBox.Text is in selectedUsersRoles 
                if (selectedUserRoles.Contains<string>(RoleCheckBox.Text))
                {
                    RoleCheckBox.Checked = true;
                }
                else
                {
                    RoleCheckBox.Checked = false;
                }
            }
        }

        protected void ddlUsers_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            CheckRolesForSelectedUser();
        }

        protected void chkRole_OnCheckedChanged(object sender, EventArgs e)
        {

            CheckBox RoleCheckBox = sender as CheckBox;

            //get the currently selected user
            string selectedUser = ddlUsers.SelectedValue;

            string rolename = RoleCheckBox.Text;

            // Determine if we need to add or remove the user from this role 
            if (RoleCheckBox.Checked)
            {
                // Add the user to the role 
                Roles.AddUserToRole(selectedUser, rolename);
                // Display a status message 
                lblMessage.Text = string.Format("User {0} was added to role {1}.", selectedUser, rolename);
            }
            else
            {
                // Remove the user from the role 
                Roles.RemoveUserFromRole(selectedUser, rolename);
                // Display a status message 
                lblMessage.Text = string.Format("User {0} was removed from role {1}.", selectedUser, rolename);

            }
        }
    }
}
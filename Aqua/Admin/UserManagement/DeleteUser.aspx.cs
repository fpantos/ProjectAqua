using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Aqua.Admin.UserAndRoleManagement
{
    public partial class DeleteUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //bind the gridview
            DisplayUsers();
            lblMessage.Text = "";
        }

        private void DisplayUsers()
        {
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


            gviewUsers.DataSource = users;
            gviewUsers.DataBind();
        }

        protected void gviewUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string userToBeDeleted = (gviewUsers.Rows[e.RowIndex].FindControl("lblUser") as Label).Text;

            string currentUser = User.Identity.Name;

            //check id the user to be deleted is the current user
            if (currentUser == userToBeDeleted)
            {
                //do not allow deletion
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Operation not allowed. Can't delete current user.";
            }
            else 
            {
                //delete the user
                Membership.DeleteUser(userToBeDeleted);
            }



            //re-bind the gridview
            DisplayUsers();
        }
    }
}
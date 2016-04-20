using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Aqua.Admin
{
    public partial class CreateUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void SelectRoleWizardStep_OnActivate(object sender, EventArgs e)
        {
            //bind roles to repeater
            string[] roles = Roles.GetAllRoles();
            List<string> filteredRoles = new List<string>();

            if (User.IsInRole("WebAdmin"))
            {
                //do nothing
                 lstRoles.DataSource = roles;
                 lstRoles.DataBind();
            }
            else
            {
                //get all roles excep web admin
                filteredRoles = roles.ToList<string>();
                filteredRoles.Remove("WebAdmin");
                lstRoles.DataSource = filteredRoles;
                lstRoles.DataBind();
            }

            //lstRoles.DataSource = Roles.GetAllRoles();
           // lstRoles.DataBind();
           
        }

        protected void SelectRoleWizardStep_OnDeactivate(object sender, EventArgs e)
        {
            
            Roles.AddUserToRole(CreateUserWizard1.UserName, lstRoles.SelectedValue);

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
           // Roles.AddUserToRole(CreateUserWizard1.UserName, lstRoles.SelectedValue);
        }

        protected void lstRoles_SelectedIndexChanged(object sender, EventArgs e)
        {

        }



    }
}
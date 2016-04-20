using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Aqua.Masterpage
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.UserAgent.IndexOf("AppleWebKit") > 0)
            {
                Request.Browser.Adapters.Clear();


            }

            if (!IsPostBack) 
            {
                //string username = Page.User.Identity.Name.ToString();
                //Menu myMenu = LoginView1.FindControl("userMenu") as Menu;


                //MenuItem m = new MenuItem(username); 
                //    m.ChildItems.Add(new MenuItem("Profile Settings"));
                //    m.ChildItems.Add(new MenuItem("whateva Settings"));

                //    myMenu.Items.Add(m);

                
            
            }



        }



        //protected void userMenu_OnMenuItemDataBound(object sender, MenuEventArgs e) { }


        //protected void userMenu_OnLoad(object sender, EventArgs e)
        //{



        //}
    }
}
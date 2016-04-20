using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Aqua.Masterpage
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.UserAgent.IndexOf("AppleWebKit") > 0)
            {
                Request.Browser.Adapters.Clear();
            }
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {


            //  e.Item.Text = "";   
            // clear all the session if any items are clicked
            Session["accountID"] = null;
            Session["accountToUpdate"] = null;
        }

        protected void Menu1_MenuItemDataBound(object sender, MenuEventArgs e)
        {
            if ((e.Item.Text == "View Account") || (e.Item.Text == "My Settings")
                || (e.Item.Text == "View Employee") || (e.Item.Text == "View") || (e.Item.Text == "View Product")
                || (e.Item.Text == "View Details") || (e.Item.Text == "View Product Details")  
                || (e.Item.Text == "View Invoice") )
            {
                //something
                e.Item.Text = "" ;
                
            }
        }
    }
}
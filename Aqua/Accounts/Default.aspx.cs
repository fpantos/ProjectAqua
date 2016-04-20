using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Aqua.Accounts
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //clear session variables
            Session["accountID"] = null;
            Session["workList"] = null;
            Session["stg_servWork"] = null;
            Session["accountSearched"] = null;

            
        }
    }
}
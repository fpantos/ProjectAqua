using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Aqua.Error
{
    public partial class Whoops : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.IsInRole("WebAdmin"))
            {
                lnkViewLogs.Visible = true;
            }

        }
    }
}
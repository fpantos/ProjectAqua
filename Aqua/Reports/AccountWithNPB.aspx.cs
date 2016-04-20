using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aqua.Reports.src;

namespace Aqua.Reports
{
    public partial class AccountWithNPB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //AccountWithNPB a = new AccountWithNPB();
            NegativePrepaidBalance n = new NegativePrepaidBalance();
            rptAccountsWithNPB.ReportSource = n;
            rptAccountsWithNPB.RefreshReport();

        }
    }
}
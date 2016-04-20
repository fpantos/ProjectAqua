using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aqua.Reports.src;

namespace Aqua.Reports
{
    public partial class SalesByMonth : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CurrentYearSales currentYearSales = new CurrentYearSales();
            rptVwrSalesByCurrentYear.ReportSource =  currentYearSales;
            rptVwrSalesByCurrentYear.RefreshReport();
        }
    }
}
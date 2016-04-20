using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;
using AquaLibrary.BusinessLayer;

namespace Aqua.Sales
{
    public partial class Invoice : System.Web.UI.Page
    {
        private int invoiceID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

            if ((Session["invoiceID"] == null))
            {
                // go back to the seach accounts page
                Response.Redirect("~/Sales/New.aspx");
            }
            else
            {
                invoiceID = Convert.ToInt32(Session["invoiceID"]);
                GenerateInvoice();
            }
        }

        private void GenerateInvoice()
        {
            ReportDocument rptDocument = new ReportDocument();

            dsInvoice dinvoice = new dsInvoice();
            DataTable dt = InvoiceManager.GetInvoiceByID(invoiceID);
            dt.TableName = "Invoice";
            dinvoice.Tables[0].Merge(dt);

            rptDocument.Load(Server.MapPath("../Sales/src/rptInvoice.rpt"));

            //set dataset to the report viewer
            rptDocument.SetDataSource(dinvoice);

            rptInvoice.ReportSource = rptDocument;
            rptInvoice.RefreshReport();
        }

        protected void lnkCreateAnotherSale_OnClick(object sender, EventArgs e)
        {
            Session["invoiceID"] = null;
            Response.Redirect("~/Sales/New.aspx");
        }


    }
}
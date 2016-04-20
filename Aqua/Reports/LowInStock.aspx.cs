using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AquaLibrary.BusinessObject.Collections;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessLayer;
using System.Data;
using Aqua.Reports.src;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;


namespace Aqua.Reports
{
    public partial class LowInStock : System.Web.UI.Page
    {

        private static string _sortExpression, _sortDirection;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GenerateReport("unitsonhand", "asc");
            }
            else 
            {
                _sortExpression = ddlSortExpression.SelectedValue.ToString();
                _sortDirection = ddlDirection.SelectedValue.ToString();

                GenerateReport(_sortExpression, _sortDirection);

            
            }

        }

        protected void Page_Init(object sender, EventArgs e)
        {

        }



        private void GenerateReport(string sortExpression, string sortDirection)
        {
            ReportDocument rptDocument = new ReportDocument();

            dsSales dsales = new dsSales();
            DataTable dt = ProductManager.GetLowStock(sortExpression, sortDirection);
            dt.TableName = "Low Stock Report";
            dsales.Tables["LowStock"].Merge(dt);

            rptDocument.Load(Server.MapPath("../Reports/src/ProductsBelowReorderLevel.rpt"));

            //set dataset to the report viewer
            rptDocument.SetDataSource(dsales);


            rptProductsUnderStock.ReportSource = rptDocument;
            rptProductsUnderStock.RefreshReport();

            

        }

        protected void ddlSortExpression_SelectedIndexChanged(object sender, EventArgs e)
        {
           // GenerateReport(ddlSortExpression.SelectedValue.ToString(), ddlDirection.SelectedValue.ToString());
        }

        protected void ddlDirection_SelectedIndexChanged(object sender, EventArgs e)
        {
            //GenerateReport(ddlSortExpression.SelectedValue.ToString(), ddlDirection.SelectedValue.ToString());
        }


    }
}
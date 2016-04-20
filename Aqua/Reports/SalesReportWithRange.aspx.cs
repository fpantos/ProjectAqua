using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using Aqua.Reports.src;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using AquaLibrary.BusinessLayer;

namespace Aqua.Reports
{
    public partial class SalesReportWithRange : System.Web.UI.Page
    {

        string fromMonth, fromYear, toMonth, toYear;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateAllDropdownlist();

            }
            //get the values from the dropdownlist           
            GetValuesFromDropDownlist();

            GenerateReport(fromMonth, fromYear, toMonth, toYear);
        }

        private void GetValuesFromDropDownlist()
        {
            fromMonth = DateTime.ParseExact(ddlFromMonth.SelectedValue.ToString(), "MMMM", CultureInfo.CurrentCulture).Month.ToString();
            fromYear = ddlFromYear.SelectedValue.ToString();
            toMonth = DateTime.ParseExact(ddlToMonth.SelectedValue.ToString(), "MMMM", CultureInfo.CurrentCulture).Month.ToString();
            toYear = ddlToYear.SelectedValue.ToString();
        }

        //protected void lnkGenerateReport_OnClick(object sender, EventArgs e)
        //{


        //    //get the values from the dropdownlist           
        //    fromMonth = DateTime.ParseExact(ddlFromMonth.SelectedValue.ToString(), "MMMM", CultureInfo.CurrentCulture).Month.ToString();
        //    fromYear = ddlFromYear.SelectedValue.ToString();
        //    toMonth = DateTime.ParseExact(ddlToMonth.SelectedValue.ToString(), "MMMM", CultureInfo.CurrentCulture).Month.ToString();
        //    toYear = ddlToYear.SelectedValue.ToString();


        //    GenerateReport(fromMonth, fromYear, toMonth, toYear);
        //}

        private void GenerateReport(string fromMonth, string fromYear, string toMonth, string toYear)
        {
            ReportDocument rptDocument = new ReportDocument();

            dsSales dsales = new dsSales();
            DataTable dt = SalesReportManager.GetSalesByDateRange(fromMonth, fromYear, toMonth, toYear);
            dt.TableName = "Sales Report";
            dsales.Tables[0].Merge(dt);

            rptDocument.Load(Server.MapPath("../Reports/src/SalesWithDateRange.rpt"));

            //set dataset to the report viewer
            rptDocument.SetDataSource(dsales);

            rptSalesByDateRange.ReportSource = rptDocument;

            //display the date range selected by the user In the Report Heading
            // the 'to' notation stands for Text Object
            //get from month and year
            string fromParameters = ddlFromMonth.SelectedValue.ToString() + " " + ddlFromYear.SelectedValue.ToString();

            //get to month and year
            string toParameters = ddlToMonth.SelectedValue.ToString() + " " + ddlToYear.SelectedValue.ToString();

            TextObject toDateRangeValue = (TextObject)rptDocument.ReportDefinition.Sections["Section2"].ReportObjects["txtDateRangeValue"];
            toDateRangeValue.Text = fromParameters + " to " + toParameters; ;//ddlFromMonth.SelectedValue.ToString() + " " + ddlFromYear.SelectedValue.ToString();



            //refresh the report
            rptSalesByDateRange.RefreshReport();

        }

        private void PopulateAllDropdownlist()
        {
            //populate the dropdownlist
            PopulateMonths(ddlFromMonth);
            PopulateMonths(ddlToMonth);

            PopulateYears(ddlFromYear);
            PopulateYears(ddlToYear);
        }

        protected void PopulateMonths(DropDownList ddl)
        {
            var months = CultureInfo.CurrentCulture.DateTimeFormat.MonthNames;
            ddl.Items.Clear();

            for (int i = 0; i < months.Length - 1; i++)
            {
                ddl.Items.Add(months[i].ToString());
            }

            // Default to the current month
            ddl.SelectedValue = DateTime.Now.ToLocalTime().ToString("MMMM");

        }

        protected void PopulateYears(DropDownList ddl)
        {
            //get the current datetime
            DateTime d = DateTime.Now.ToLocalTime();

            //get the current year
            string currentYear = d.Year.ToString();

            //go back up to year 2005
            int startYear = 2005;
            int endYear = d.Year;
            ddl.Items.Clear();
            for (int i = startYear; i <= endYear; i++)
            {
                ddl.Items.Add(i.ToString());
            }

            ddl.SelectedValue = currentYear;

        }

    }
}
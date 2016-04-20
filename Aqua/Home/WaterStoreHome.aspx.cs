using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using AquaLibrary.BusinessLayer;
using AquaLibrary.BusinessObject.Collections;
using AquaLibrary.BusinessObject;
using AquaLibrary.Helper;
using System.Web.UI.DataVisualization.Charting;


namespace Aqua
{
    public partial class WaterStoreHome : System.Web.UI.Page
    {
        private static string _unitOfMeas = "litres";
        private static double totalConsumption = 0;

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                PopulateGridviewService();
            }
            //get the unit of measure from the radiobutton
            _unitOfMeas = rbtnUnit.SelectedValue.ToString();
            PopulateWaterUsageGraph(_unitOfMeas);

            //clear session variables
            Session["accountID"] = null;
            Session["lineItemList"] = null;
            Session["productID"] = null;
            Session["workList"] = null;
            Session["stg_servWork"] = null;
            Session["accountSearched"] = null;
        }



        #region Water Usage Graph
        private void PopulateWaterUsageGraph(string unitOfMeasure)
        {

            string yValue = "";
            string xValue = "";
            DateTime todaysDate = new DateTime();
            WaterUsageList waterUsageList = WaterUsageManager.GetList();

            for (int i = 9; i < 21; i++)
            {
                xValue = todaysDate.AddHours(i).ToString("h tt");
                yValue = GetYValue(i, waterUsageList, unitOfMeasure);
                totalConsumption += Convert.ToDouble(yValue);

                chrtWaterUsage.Series[0].Points.AddXY(xValue, yValue);
            }

            BuildChartTitle();

            // set the Y Axis title 
            chrtWaterUsage.ChartAreas[0].AxisY.Title = unitOfMeasure;

            DisplayTotalConsumption(unitOfMeasure);
        }

        private void DisplayTotalConsumption(string unitOfMeasure)
        {
            if (unitOfMeasure == "litres")
            {
                lblTotalConsumption.Text = totalConsumption.ToString() + " L" ;
            }
            else
            {
                lblTotalConsumption.Text = totalConsumption.ToString() + " US Gal" ;
            }

            //reset
            totalConsumption = 0;
        }

        private string GetYValue(int timeOfDay, WaterUsageList myList, string unitOfMeasure)
        {
            string yVal = "";

            if (myList != null)
            {
                IEnumerable<WaterUsage> waterUsageQuery =
                    from w in myList
                    where w.TimeOfDay == timeOfDay
                    select w;

                // if the query result contains data, assign the value
                // if not, assign 0 to yVal
                if (waterUsageQuery.Any())
                {
                    foreach (WaterUsage usage in waterUsageQuery)
                    {
                        if (unitOfMeasure == "litres")
                        {
                            yVal = usage.TotalLitresPerHour.ToString();
                        }
                        else
                        { //gallons
                            yVal = Math.Round(usage.TotalGallonsPerHour, 1).ToString();
                        }
                    }
                }
                else
                {
                    yVal = "0";
                }

            }
            else
            {
                yVal = "0";
            }





            return yVal;
        }

        private void BuildChartTitle()
        {
            string chartTitle = "For " + DateTime.Now.ToLongDateString();
            Title t = new Title(chartTitle, Docking.Top, new System.Drawing.Font("Helvetica", 10, System.Drawing.FontStyle.Bold), System.Drawing.Color.FromArgb(26, 59, 105));
            chrtWaterUsage.Titles.Add(t);
        }

        protected void lnkGallons_Command(object sender, CommandEventArgs e)
        {
            _unitOfMeas = "gallons";
            //populate the water usage graph with the US Gallon Measure
            //PopulateWaterUsageGraph(_unitOfMeas);
        }

        protected void lnkLitres_Command(object sender, CommandEventArgs e)
        {
            _unitOfMeas = "litres";
            //PopulateWaterUsageGraph(_unitOfMeas);
        }
        #endregion

        #region Upcoming Service Work
        private void PopulateGridviewService()
        {
            //populate service schedule
            gviewServiceWork.DataSource = ServiceWorkManager.GetTopTenServiceWorkFromToday();
            gviewServiceWork.DataBind();
        }

        protected void lnkViewServiceWorkDetails_OnCommand(object sender, CommandEventArgs e)
        {
            int serviceWorkID = Convert.ToInt32(e.CommandArgument.ToString());
            Session["serviceWorkID"] = serviceWorkID;

            //send to view service work details
            Response.Redirect("~/Service/View.aspx");
        }
        #endregion


        #region String Helper
        public static string FormatShortTimeString(string serviceStartTime)
        {
            return StringParser.FormatShortTimeString(serviceStartTime);
        }
        #endregion


    }
}
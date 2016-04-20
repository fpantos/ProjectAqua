using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AquaLibrary.DataAccess;
using AquaLibrary.BusinessLayer;
using AquaLibrary.BusinessObject.Collections;
using AquaLibrary.BusinessObject;
using AquaLibrary.Enums;
using AquaLibrary.Helper;
using System.Collections;
using System.Collections.Specialized;

namespace Aqua.Service
{
    public partial class View : System.Web.UI.Page
    {
        int _serviceWorkID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                if (Session["serviceWorkID"] != null)
                {
                    _serviceWorkID = Convert.ToInt32(Session["serviceWorkID"]);

                    PopulateDetailsView();
                    PopulateGridView();
                }
                else               
                {
                    //go back to home page
                    Response.Redirect("~/Home/WaterStoreHome.aspx");
                }

                //clear the session ID
                Session["serviceWorkID"] = null;    
            }
        }

        private void PopulateGridView()
        {
            gviewWorkItems.DataSource = ServiceWorkToBeDoneManager.GetListByServiceWorkID(_serviceWorkID);
            gviewWorkItems.DataBind();
        }

        private void PopulateDetailsView()
        {
            dviewServiceWorkDetails.DataSource = ServiceWorkManager.GetServiceWorkDetailsByID(_serviceWorkID);
            dviewServiceWorkDetails.DataBind();
        }

        protected void lnkGoToAccount_OnCommand(object sender, CommandEventArgs e) 
        {
            Session["accountID"] = e.CommandArgument.ToString();

            //go to the view account page
            Response.Redirect("~/Accounts/ViewAccount.aspx");
        }

        #region String Helper
        public static string FormatShortTimeString(string serviceStartTime)
        {
            return StringParser.FormatShortTimeString(serviceStartTime);
        }
        #endregion
    }
}
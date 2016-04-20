using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AquaLibrary.BusinessLayer;


namespace Aqua.Accounts
{
    public partial class ShowAllAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridview();
            }

        }

        private void BindGridview()
        {
            //populate gridview
            DataTable dt = AccountManager.GetAccountsWithAddress();

            //save the datatable in a session
            Session["dtAllAccounts"] = dt;

            gviewAccounts.DataSource = dt;
            gviewAccounts.DataBind();
        }

        protected void gviewAccounts_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtAllAccounts = Session["dtAllAccounts"] as DataTable;

            if (dtAllAccounts != null)
            {
                //e.SortDirection.ToString();
                dtAllAccounts.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
                gviewAccounts.DataSource = Session["dtAllAccounts"] as DataTable;
                gviewAccounts.DataBind();
            }

        }

        protected string GetSortDirection(string sortExpression)
        {
            string sortDirection = "DESC";
            string lastSortExpression = "";
            string lastSortDirection;

            //get the last sortexpression that was used
            lastSortExpression = ViewState["sortExpression"] as string;

            if (sortExpression != null)
            {

                if (sortExpression == lastSortExpression)
                {
                    lastSortDirection = ViewState["sortDirection"] as string;
                    if ((lastSortDirection != null) &&( lastSortDirection== "DESC")) 
                    {
                       //reverse the sort order
                        sortDirection = "ASC";
                    }
                   
                }
            }

            //save the new sort expression and sort direction values
            ViewState["sortExpression"] = sortExpression;
            ViewState["sortDirection"] = sortDirection;
            return sortDirection;
        }

    }
}
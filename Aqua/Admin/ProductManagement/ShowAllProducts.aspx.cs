using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AquaLibrary.BusinessLayer;
using AquaLibrary.BusinessObject;
using AquaLibrary.Helper;

namespace Aqua.Admin.ProductManagement
{
    public partial class ShowAllProducts : System.Web.UI.Page
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
            DataTable dt = ProductManager.GetProducts();

            //save the datatable in a session
            Session["dtAllProducts"] = dt;

            gShowProducts.DataSource = dt;
            gShowProducts.DataBind();
        }

        protected void gViewProducts_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtAllProducts = Session["dtAllProducts"] as DataTable;

            if (dtAllProducts != null)
            {
                //e.SortDirection.ToString();
                dtAllProducts.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
                gShowProducts.DataSource = Session["dtAllProducts"] as DataTable;
                gShowProducts.DataBind();
            }

        }

        protected void gViewSearchResults_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            LinkButton lnkProductStatusChanger = (e.Row.FindControl("lnkProductStatusChanger") as LinkButton);
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //check the accounts' status
                string productStatus = (e.Row.FindControl("lblIsActive") as Label).Text;
                if (productStatus.ToLower() == "discontinued")
                {

                    lnkProductStatusChanger.Text = "Reactivate";
                    lnkProductStatusChanger.CommandName = "reactivate";
                    (e.Row.FindControl("lnkProductCode") as LinkButton).Enabled = false;
                    e.Row.ForeColor = System.Drawing.Color.Gray;
                }
                else
                {
                    lnkProductStatusChanger.Text = "Discontinue";
                    lnkProductStatusChanger.CommandName = "discontinue";

                    //disable the link button to click the product
                    (e.Row.FindControl("lnkProductCode") as LinkButton).Enabled = true;
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }
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
                    if ((lastSortDirection != null) && (lastSortDirection == "DESC"))
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

        protected void lnkName_OnCommand(object sender, CommandEventArgs e)
        {
            Session["productID"] = null;
            Session["productID"] = e.CommandArgument.ToString();

            Response.Redirect("~/Admin/ProductManagement/ViewProduct.aspx");
        }

        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            BindGridview();
            gShowProducts.PageIndex = e.NewPageIndex;
            gShowProducts.DataBind();
        }

        protected void lnkProductStatusChanger_OnCommand(object sender, CommandEventArgs e)
        {
            string productID = e.CommandArgument.ToString();
            Product product = new Product();
            product.ProductID = Convert.ToInt32(productID);
            product.ModifiedDate = DateTime.Now.ToLocalTime();
            product.ModifiedBy = User.Identity.Name.ToString();

            //check if the action will be activate or deactivate
            if (e.CommandName == "discontinue")
            {
                //deactivate the account
                //Call the AccountManager to deactivate the account
                ProductManager.Discontinue(product);
            }
            else
            {
                ProductManager.Reactivate(product);
            }

            //re-bind the gridview
            BindGridview();

        }

        public static string GetProductStatus(string isDiscontinued)
        {
            return StringParser.GetProductStatus(isDiscontinued);
        }

    }
}
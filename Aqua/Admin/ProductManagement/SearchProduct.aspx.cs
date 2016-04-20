using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AquaLibrary.BusinessLayer;
using System.Data;
using AquaLibrary.BusinessObject;
using AquaLibrary.Helper;

namespace Aqua.Admin.ProductManagement
{
    public partial class SearchProduct : System.Web.UI.Page
    {

        static string _searchBy = "";
        static string _searchString = "";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSearchProduct_Click(object sender, EventArgs e)
        {
            _searchBy = ddlSearchCriteria.SelectedValue.ToString();
            _searchString = txtSearchInput.Text.ToString();
            if (_searchBy != "" && _searchString != "")
            {
                PopulateGridviewSearchResult();
            }

        }

        protected void gViewProducts_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtSearchedProduct = Session["dtSearchedProduct"] as DataTable;

            if (dtSearchedProduct != null)
            {
                //e.SortDirection.ToString();
                dtSearchedProduct.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
                gviewProductSearchResult.DataSource = Session["dtSearchedProduct"] as DataTable;
                gviewProductSearchResult.DataBind();
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

        private void PopulateGridviewSearchResult()
        {
            DataTable searchResultsDataTable = ProductManager.GetProductBySearchCriteria(_searchBy, _searchString);
            Session["dtSearchedProduct"] = searchResultsDataTable;
            gviewProductSearchResult.DataSource = searchResultsDataTable;
            gviewProductSearchResult.DataBind();
        }

        protected void ddlSearchCriteria_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtSearchInput.Focus();
            txtSearchInput_AutoCompleteExtender1.ContextKey = ddlSearchCriteria.SelectedValue;
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
            PopulateGridviewSearchResult();

        }

        public static string GetProductStatus(string isDiscontinued)
        {
            return StringParser.GetProductStatus(isDiscontinued);
        }
        public String PrepareNullForDisplay(string val)
        {
            return StringParser.PrepareNullValueForDisplay(val);
        }

        protected void lnkName_OnCommand(object sender, CommandEventArgs e)
        {
            Session["productID"] = null;
            Session["productID"] = e.CommandArgument.ToString();

            Response.Redirect("~/Admin/ProductManagement/ViewProduct.aspx");
        }

        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            PopulateGridviewSearchResult();
            gviewProductSearchResult.PageIndex = e.NewPageIndex;
            gviewProductSearchResult.DataBind();
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

                    //disable the link button to click the account
                    (e.Row.FindControl("lnkProductCode") as LinkButton).Enabled = true;
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }

            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessLayer;
using AquaLibrary.DataAccess;
using AquaLibrary.Helper;
using System.Data;

namespace Aqua.Products
{
    public partial class Search : System.Web.UI.Page
    {

        private static string _searchBy = "";
        private static string _searchString = "";
        private static int _srcValue = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            //throw new ApplicationException("test error");
            //get the querystring
            NameValueCollection n = new NameValueCollection(Request.QueryString);

            if (n.HasKeys())
            {
                _srcValue = Convert.ToInt32(n.Get(0));
                //src=1 means that the user will be coming from the Sales page.
                if (_srcValue == 1)
                {
                  //do any cleanup 
                    gviewProductSearchResult.Columns[5].Visible = true; // add product button
                    gviewProductSearchResult.Columns[6].Visible = false; // more details  button

                }
                n.Remove("src");
            }

            // clear the session string
            Session["productID"] = null;

            //put the focus on the dropdownlist on load
            ddlSearchCriteria.Focus();


        }

        protected void btnSearchProduct_Click(object sender, EventArgs e)
        {
            _searchBy = ddlSearchCriteria.SelectedValue.ToString();
            _searchString = txtSearchInput.Text.ToString();

            gviewProductSearchResult.DataSource = ProductManager.GetProductBySearchCriteria(_searchBy, _searchString);
            gviewProductSearchResult.DataBind();
        }

        protected void ddlSearchCriteria_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtSearchInput.Focus();
            txtSearchInput_AutoCompleteExtender.ContextKey = ddlSearchCriteria.SelectedValue;
        }

        protected void lnkGoToViewProductDetails_OnCommand(object sender, CommandEventArgs e)
        {
            Session["productID"] = e.CommandArgument.ToString();
            Response.Redirect("~/Products/View.aspx");

        }

        protected void lnkAddProductToOrder_OnCommand(object sender, CommandEventArgs e)
        {
            Session["productID"] = e.CommandArgument.ToString();
            Response.Redirect("~/Sales/New.aspx");
        
        }


        public String PrepareNullForDisplay(string val) 
        {
            return StringParser.PrepareNullValueForDisplay(val);
        }

        protected void gviewProductSearchResult_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow) 
            {
                //check on hand qty
                //if qty is 0, disable the add button
                string onHandQty = (e.Row.FindControl("lblUnitsOnHand") as Label).Text;

                if (onHandQty == "0") 
                {
                    (e.Row.FindControl("lnkAddProductToOrder") as LinkButton).Enabled = false;
                    e.Row.ForeColor = System.Drawing.Color.Gray;
                    
                }
            }
        }





    }
}
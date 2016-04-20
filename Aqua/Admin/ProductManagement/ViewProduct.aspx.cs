using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessLayer;
using AquaLibrary.BusinessObject.Collections;
using AquaLibrary.Helper;

namespace Aqua.Admin.ProductManagement
{
    public partial class ViewProduct : System.Web.UI.Page
    {
        static Product product = new Product();
        static int productID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((Session["ProductID"] == null))
                {
                    // go back to the show all products page
                    Response.Redirect("~/Admin/ProductManagement/ShowAllProducts.aspx");
                }
                else
                {
                    productID = Convert.ToInt32(Session["ProductID"]);
                    product = ProductManager.GetProductByID(productID);

                    ProductList pList = new ProductList();
                    pList.Add(product);

                    PopulateDetailsview(pList);

                    //populate the sub product gridview after populating the details view
                   // DisplaySubProducts();
                }
            }

        }

        private void PopulateDetailsview(ProductList pList)
        {
            dviewProductDetails.DataSource = pList;
            dviewProductDetails.DataBind();

            //populate the sub product gridview after populating the details view
            DisplaySubProducts();
        }


        protected void lnkEditProductInformation_OnCommand(object sender, CommandEventArgs e)
        {
            ProductList el = new ProductList();
            el.Add(ProductManager.GetProductByID(product.ProductID));

            fviewEditProduct.DataSource = el;
            fviewEditProduct.DataBind();

            this.mPopupEdit_Product.Show();

        }

        protected void lnkEditSubProductInformation_OnCommand(object sender, CommandEventArgs e)
        {
            String prodCategory = product.ProductCategory;

           // lblSubProductsHeader.Text = "Related Products from " + prodCategory + " category";
            //show sub product gridview
            geditSubProduct.DataSource = ProductManager.GetProductsByCategory(prodCategory, productID);
            geditSubProduct.DataBind();


            foreach (GridViewRow r in geditSubProduct.Rows)
            {
                CheckBox chk = (r.Cells[0].FindControl("chkSubProduct") as CheckBox);
                Label lbl = (r.Cells[5].FindControl("lblIsDiscontinued") as Label);
                if (lbl.Text == "True")
                {
                    chk.Enabled = false;
                    r.ForeColor = System.Drawing.Color.Gray;
                    //chk.Visible = false;
                }
            }

            //if (geditSubProduct.Rows.Count == 0)
            //{
            //    lblSubProductMessage.Text = "Found 0 rows";
            //}
            //else
            //{
            //    lblSubProductMessage.Text = "Found " + geditSubProduct.Rows.Count + " rows";
            //}

            this.mPopupEdit_SubProduct.Show();
        }

        protected void lnkDeleteSubProduct_OnCommand(object sender, CommandEventArgs e)
        {
            ProductPartReplacement subProduct = new ProductPartReplacement();
            subProduct.SubProductID = Convert.ToInt32(e.CommandArgument.ToString());
            subProduct.ProductID = Convert.ToInt32(productID);


            //Call the AccountManager to deactivate the product
            ProductManager.DeleteSubPart(subProduct);

            ProductList p = new ProductList();
            p.Add(product);
            PopulateDetailsview(p);


        }

        protected void lnkSaveSubProductEdit_OnCommand(object sender, CommandEventArgs e)
        {
            //Gets the selected products from the sub product gridview
            List<int> subProductIDList = GetSelectedSubProductsFromGridview();

            //Insert records in the Assembly table using the Main product Id and sub product ID
            foreach (int subProductID in subProductIDList)
            {

                ProductPartReplacement prodAssembly = new ProductPartReplacement();
                prodAssembly.ProductID = product.ProductID;
                prodAssembly.SubProductID = subProductID;
                prodAssembly.CreatedBy = User.Identity.Name.ToString();

                //save the records 
                ProductPartReplacementManager.Save(prodAssembly);
            }

            ProductList p = new ProductList();
            p.Add(product);
            PopulateDetailsview(p);
        }

        private List<int> GetSelectedSubProductsFromGridview()
        {
            List<int> subProductIDList = new List<int>();
            foreach (GridViewRow r in geditSubProduct.Rows)
            {
                CheckBox chk = (r.Cells[0].FindControl("chkSubProduct") as CheckBox);

                if (chk.Checked == true)
                {
                    //save this item to a list<product>
                    int prodId = Convert.ToInt32((r.FindControl("lblProductID") as Label).Text);
                    subProductIDList.Add(prodId);
                }
            }
            return subProductIDList;
        }

        protected void lnkSaveProductEdit_OnCommand(object sender, CommandEventArgs e)
        {
            //hide the modal popup
            this.mPopupEdit_Product.Hide();

            //get the new values from the form
            product.UnitCost = Convert.ToDouble((fviewEditProduct.FindControl("txtUnitCost") as TextBox).Text.Trim());
            product.UnitPrice = Convert.ToDouble((fviewEditProduct.FindControl("txtUnitPrice") as TextBox).Text.Trim());
            if ((fviewEditProduct.FindControl("txtUnitsOnHand") as TextBox).Text.Trim() == "")
            {
                product.UnitsOnHand = 0;
            }
            else
            {
                product.UnitsOnHand = Convert.ToInt32((fviewEditProduct.FindControl("txtUnitsOnHand") as TextBox).Text.Trim());
            }
            if ((fviewEditProduct.FindControl("txtReorderLevel") as TextBox).Text.Trim() == "")
            {
                product.ReorderLevel = 0;
            }
            else
            {
                product.ReorderLevel = Convert.ToInt32((fviewEditProduct.FindControl("txtReorderLevel") as TextBox).Text.Trim());
            }
            product.ItemUrl = (fviewEditProduct.FindControl("txtItemUrl") as TextBox).Text.Trim();

            //save the changes
            ProductManager.Save(product);

            // dislay the product details
            ProductList p = new ProductList();
            p.Add(product);
            PopulateDetailsview(p);



        }

        private void DisplaySubProducts()
        {
            int parentID = Convert.ToInt32(product.ProductID);

            lblSubProductsHeader.Text = "Sub-Products of " + product.ProductCode;
            //show sub product gridview
            gviewSubProduct.DataSource = ProductManager.GetSubProductByParent(parentID);
            gviewSubProduct.DataBind();

            //if (gviewSubProduct.Rows.Count == 0)
            //{
            //    lblSubProductMessage.Text = "Found 0 rows";
            //}
            //else
            //{
            //    lblSubProductMessage.Text = "Found " + gviewSubProduct.Rows.Count + " rows";
            //}
        }

        #region Helpers
        public static string GetProductStatus(string isDiscontinued)
        {
            return StringParser.GetProductStatus(isDiscontinued);
        }

        public static string PrepareNullValueForDisplay(string val)
        {
            return StringParser.PrepareNullValueForDisplay(val);
        }
        #endregion

    }
}
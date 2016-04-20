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

namespace Aqua.Products
{
    public partial class View : System.Web.UI.Page
    {
        private static int _productID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["productID"] == null)
                {
                    //return to the search product page
                    Response.Redirect("~/Products/Search.aspx");
                }

                else
                {
                    _productID = Convert.ToInt32(Session["productID"]);
                    Product myProduct = ProductDB.GetProductByID(_productID);
                    ProductList list = new ProductList();
                    list.Add(myProduct);

                    PopulateDetailsView(list);

                    //clear the session
                    Session["productID"] = null;

                    // show 5 related products on the gridview
                    ProductList fiveRelatedProducts = ProductManager.GetSubProductListByParentID(_productID);
                    ProductList fillerProductList = ProductManager.GetTop5ProductsByCategory(myProduct.ProductCategory);

                    if (fiveRelatedProducts != null)
                    {
                        if (fiveRelatedProducts.Count <= 5)
                        {
                            //to get a total of 5 products, get additional items from the product table where 
                            //product category is the same as the product

                            //make sure that the filler products does not contain any of the actual sub products
                            //from the fiveRelatedProducts
                            RemoveDuplicateProducts(fillerProductList, fiveRelatedProducts);

                            //add products on the fiveRelatedProducts List
                            //first find the quantity neeed to reach 5
                            int diff = (5 - fiveRelatedProducts.Count());

                            foreach (Product aProduct in fillerProductList.Take(diff))
                            {
                                fiveRelatedProducts.Add(aProduct);
                            }



                            //display the items in the gridview
                            PopulateRelatedProductsGridview(fiveRelatedProducts);
                        }
                    }
                    else
                    {
                        //get 5 products from the product db with the same product category

                        //make sure that the related products does not contain the product currently in the details view
                        fillerProductList.Remove(myProduct);

                        //display 
                        PopulateRelatedProductsGridview(fillerProductList);
                    }

                }



            }

        }

        private void RemoveDuplicateProducts(ProductList fillerList, ProductList listToRemove)
        {
            foreach (Product p in listToRemove) 
            {
                fillerList.Remove(p);
            }

        }

        private void PopulateRelatedProductsGridview(ProductList fiveRelatedProducts)
        {
            gviewRelatedProducts.DataSource = fiveRelatedProducts;
            gviewRelatedProducts.DataBind();
        }

        private void PopulateDetailsView(ProductList list)
        {
            dviewProduct.DataSource = list;
            dviewProduct.DataBind();
        }

        protected void lnkViewSubProduct_OnCommand(object sender, CommandEventArgs e)
        {
            Session["productID"] = e.CommandArgument.ToString();

            Response.Redirect("/Products/View.aspx");

        }




    }
}
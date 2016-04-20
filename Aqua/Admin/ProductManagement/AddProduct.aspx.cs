using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessObject.Collections;
using AquaLibrary.BusinessLayer;
using AquaLibrary.DataAccess;
using AquaLibrary.Enums;
using AquaLibrary.Helper;


namespace Aqua.Admin.ProductManagement
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

 



        protected void lnkSave_OnCommand(object sender, CommandEventArgs e)
        {
            //check if the product to be added will contain sub products
            RadioButtonList rbtnContainSubProduct = (fviewProduct.FindControl("rbtnContainSubProduct") as RadioButtonList);

            if (rbtnContainSubProduct.SelectedValue == "yes") 
            {
                //get the data from the form
                Product mainProduct = new Product();

                GetDetailsFromFormView(mainProduct);

                //save the main product to be added
                mainProduct.ProductID = ProductManager.Save(mainProduct);

                //Gets the selected products from the sub product gridview
                List<int> subProductIDList = GetSelectedSubProductsFromGridview();

                //Insert records in the Assembly table using the Main product Id and sub product ID
                foreach (int subProductID in subProductIDList) 
                {

                    ProductPartReplacement prodAssembly = new ProductPartReplacement();
                    prodAssembly.ProductID = mainProduct.ProductID;
                    prodAssembly.SubProductID = subProductID;
                    prodAssembly.CreatedBy = User.Identity.Name.ToString();

                    //save the records 
                    ProductPartReplacementManager.Save(prodAssembly);                
                }

            }
            else if (rbtnContainSubProduct.SelectedValue == "no")
            {

                //get the data from the form
                Product product = new Product();
                GetDetailsFromFormView(product);

                //save the main product to be added
                product.ProductID = ProductManager.Save(product);
            
            }

            //Bring the form to its initial state
            ResetFieldsAndGridview();

        }

        private void ResetFieldsAndGridview()
        {
            //clear the fields from the formview and the gridiview

            (fviewProduct.FindControl("txtProductCode") as TextBox).Text = "";
            (fviewProduct.FindControl("txtProdDescription") as TextBox).Text = "";
            (fviewProduct.FindControl("ddlProductCategory") as DropDownList).SelectedIndex = 0;
            (fviewProduct.FindControl("txtUnitCost") as TextBox).Text = "";
            (fviewProduct.FindControl("txtUnitPrice") as TextBox).Text = "";
            (fviewProduct.FindControl("txtUnitsOnHand") as TextBox).Text = "";
            (fviewProduct.FindControl("txtReorderLevel") as TextBox).Text = "";
            (fviewProduct.FindControl("txtManufacturerName") as TextBox).Text = "";
            (fviewProduct.FindControl("txtItemUrl") as TextBox).Text = "";
            (fviewProduct.FindControl("rbtnContainSubProduct") as RadioButtonList).SelectedValue = "no";
            (fviewProduct.FindControl("rbtnIsSubProduct") as RadioButtonList).SelectedValue = "false";

            pnlSubProducts.Visible = false;
            gviewSubProduct.DataSource = null;
            gviewSubProduct.DataBind();
        }

        private List<int> GetSelectedSubProductsFromGridview()
        {
            List<int> subProductIDList = new List<int>();
            foreach (GridViewRow r in gviewSubProduct.Rows)
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

        private void GetDetailsFromFormView(Product product)
        {
            RadioButtonList rbtnIsSubProduct = (fviewProduct.FindControl("rbtnIsSubProduct") as RadioButtonList);
            product.ProductCode = (fviewProduct.FindControl("txtProductCode") as TextBox).Text.Trim();
            product.ProductDescription = (fviewProduct.FindControl("txtProdDescription") as TextBox).Text.Trim();
            product.ProductCategory = (fviewProduct.FindControl("ddlProductCategory") as DropDownList).SelectedValue.ToString();
            product.UnitCost = Convert.ToDouble((fviewProduct.FindControl("txtUnitCost") as TextBox).Text.Trim());
            product.UnitPrice = Convert.ToDouble((fviewProduct.FindControl("txtUnitPrice") as TextBox).Text.Trim());
            if ((fviewProduct.FindControl("txtUnitsOnHand") as TextBox).Text.Trim() == "")
            {
                product.UnitsOnHand = 0;
            }
            else
            {
                product.UnitsOnHand = Convert.ToInt32((fviewProduct.FindControl("txtUnitsOnHand") as TextBox).Text.Trim());
            }
            if ((fviewProduct.FindControl("txtReorderLevel") as TextBox).Text.Trim() == "")
            { 
                product.ReorderLevel = 0;
            }
            else
            {
                product.ReorderLevel = Convert.ToInt32((fviewProduct.FindControl("txtReorderLevel") as TextBox).Text.Trim());
            }
            product.ManufacturerName = (fviewProduct.FindControl("txtManufacturerName") as TextBox).Text.Trim();
            product.ItemUrl = (fviewProduct.FindControl("txtItemUrl") as TextBox).Text.Trim();
            product.IsSubProduct = Convert.ToBoolean(rbtnIsSubProduct.SelectedValue);
            //if ((fviewProduct.FindControl("rbtnIsSubProduct") as RadioButton).Text == "yes")
            //{
            //    product.IsSubProduct = true;
            //}
            //else
            //{
            //    product.IsSubProduct = false;
            //}
            //product.CreatedBy = User.Identity.Name.ToString();
        }

        protected void rbtnContainSubProduct_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList rbtnContainSubProduct = (fviewProduct.FindControl("rbtnContainSubProduct") as RadioButtonList);

            int selectedIndex = rbtnContainSubProduct.SelectedIndex;

            if (rbtnContainSubProduct.SelectedValue == "yes")
            {

                pnlSubProducts.Visible = true;
                String prodCategory = (fviewProduct.FindControl("ddlProductCategory") as DropDownList).SelectedValue;

                lblSubProductsHeader.Text = "Related Products from " + prodCategory + " category";
                //show sub product gridview
                gviewSubProduct.DataSource = ProductManager.GetProductsByCategory(prodCategory);
                gviewSubProduct.DataBind();

                if (gviewSubProduct.Rows.Count == 0)
                {
                    lblSubProductMessage.Text = "Found 0 rows";
                }
                else
                {
                    lblSubProductMessage.Text = "Found " + gviewSubProduct.Rows.Count + " rows";
                }
            }
            else
            {
                pnlSubProducts.Visible = false;
                // do not show the gridview
                gviewSubProduct.DataSource = null;
                gviewSubProduct.DataBind();

            }
        }

        protected void fviewProduct_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }


    }
}
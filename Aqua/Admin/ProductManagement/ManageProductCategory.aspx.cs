using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessObject.Collections;
using AquaLibrary.BusinessLayer;
using AquaLibrary.DataAccess;

namespace Aqua.Admin.ProductManagement
{
    public partial class ManageProductCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //populate the gridview
                PopulateGridview();
            }


        }

        private void PopulateGridview()
        {
            gviewProductCategory.DataSource = Ref_ProductCategoryManager.GetList();
            gviewProductCategory.DataBind();
        }

        protected void lnkSaveProductCategory_OnCommand(object sender, CommandEventArgs e)
        {
            //clear previous messages
            lblMessage.Text = "";

            Ref_ProductCategory newProdCategory = new Ref_ProductCategory();
            newProdCategory.CategoryName = (fviewProdCategory.FindControl("txtProductCategoryName") as TextBox).Text.Trim().ToUpper();
            newProdCategory.Description = (fviewProdCategory.FindControl("txtProductCategoryDescription") as TextBox).Text.Trim();
            newProdCategory.CreatedBy = User.Identity.Name.ToString();

            //check if the category name already exist

            //get existing categories
            Ref_ProductCategoryList existingCategories = Ref_ProductCategoryManager.GetList();

            // find a match
            IEnumerable<Ref_ProductCategory> query = 
                from cat in existingCategories
                where cat.CategoryName == newProdCategory.CategoryName
                select cat;

            // if there is no match, then proceed with add
            if (!query.Any())
            {
                //add the new product category 
                Ref_ProductCategoryManager.Save(newProdCategory);
                //clear the inputs

                (fviewProdCategory.FindControl("txtProductCategoryName") as TextBox).Text = "";
                (fviewProdCategory.FindControl("txtProductCategoryDescription") as TextBox).Text = "";

            }
            else {
                lblMessage.Text = "Category name" + newProdCategory.CategoryName+" already exist.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                (fviewProdCategory.FindControl("txtProductCategoryName") as TextBox).Focus();

            }
                                                


            PopulateGridview();

            gviewProductCategory.Focus();

        }

        #region Gridview Product Category
        protected void gviewProductCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //get the category id of the product category to be deleted
            int categoryID = Convert.ToInt32((gviewProductCategory.Rows[e.RowIndex].FindControl("hdnCategoryID") as HiddenField).Value);

            //delete 
            Ref_ProductCategoryManager.DeleteProductCategory(categoryID);


            //re-bind the gridview
            PopulateGridview();


        }

        protected void gviewProductCategory_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            //clear previous messages
            lblMessage.Text = "";
        }

        protected void gviewProductCategory_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int editIndex = e.NewEditIndex;
            gviewProductCategory.EditIndex = editIndex;
            gviewProductCategory.SelectedIndex = editIndex;
            PopulateGridview();

            //hide the edit and delete column
            gviewProductCategory.Columns[3].Visible = false; //edit column
            gviewProductCategory.Columns[4].Visible = false; //delete column

            //show the update and cancel columns
            gviewProductCategory.Columns[5].Visible = true; //update column
            gviewProductCategory.Columns[6].Visible = true; //cancel column

            //only show the update and cancel buttons of the row being edited
            (gviewProductCategory.Rows[editIndex].FindControl("lnkUpdate") as LinkButton).Visible = true;
            (gviewProductCategory.Rows[editIndex].FindControl("lnkCancelEdit") as LinkButton).Visible = true;

            //disable the save button on the panel above
            lnkSaveProductCategory.Enabled = false;
            lnkSaveProductCategory.CssClass = "linkDeactivatedStyle";

        }

        protected void gviewProductCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {


            Ref_ProductCategory prodCategory = new Ref_ProductCategory();
            prodCategory.CategoryID = Convert.ToInt32((gviewProductCategory.Rows[e.RowIndex].FindControl("hdnCategoryID") as HiddenField).Value);
            prodCategory.CategoryName = (gviewProductCategory.Rows[e.RowIndex].FindControl("txtCategoryName") as TextBox).Text;
            prodCategory.Description = (gviewProductCategory.Rows[e.RowIndex].FindControl("txtDescription") as TextBox).Text;
            prodCategory.ModifiedBy = User.Identity.Name.ToString();

            Ref_ProductCategoryManager.Save(prodCategory);
            gviewProductCategory.EditIndex = -1;

            //enable the save button on the panel above after update
            lnkSaveProductCategory.Enabled = true;
            lnkSaveProductCategory.CssClass = "linkStyle";

            PopulateGridview();



            //show the edit and delete column
            gviewProductCategory.Columns[3].Visible = true; //edit column
            gviewProductCategory.Columns[4].Visible = true; //delete column

            //hide the update and cancel column
            gviewProductCategory.Columns[5].Visible = false; //update column
            gviewProductCategory.Columns[6].Visible = false;//cancel column

        }

        protected void gviewProductCategory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gviewProductCategory.EditIndex = -1;
            PopulateGridview();

            //enable the save button on the panel above after update
            lnkSaveProductCategory.Enabled = true;
            lnkSaveProductCategory.CssClass = "linkStyle";

            //show the edit and delete column
            gviewProductCategory.Columns[3].Visible = true; //edit column
            gviewProductCategory.Columns[4].Visible = true; //delete column

            //hide the update and cancel column
            gviewProductCategory.Columns[5].Visible = false; //update column
            gviewProductCategory.Columns[6].Visible = false;//cancel column



        }

        protected void gviewProductCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {


        }
        #endregion


    }
}
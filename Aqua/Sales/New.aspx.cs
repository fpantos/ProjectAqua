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

namespace Aqua
{
    public partial class New : System.Web.UI.Page
    {
        private static int _accountID = -1;
        private static int _productID = 0;
        private double invoiceLineItemsSubTotal = 0;
        private double invoiceLineItemsTotalTaxCharged = 0;
        private double invoiceLineItemsTotalAmount = 0;
        private double taxPercentage = 0.13;
        private static int _invoiceID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((Session["accountID"] == null))
                {
                    dViewAccountInfo.DataSource = null;
                    dViewAccountInfo.DataBind();
                }
                else
                {
                    _accountID = Convert.ToInt32(Session["accountID"]);

                    //populate details view
                    dViewAccountInfo.DataSource = AccountManager.GetAccountWithAddress(_accountID);
                    dViewAccountInfo.DataBind();
                }

                if (Session["productID"] != null) // add the item to the gridview
                {
                    lnkCompleteSale.CssClass = "linkStyle";
                    lnkCompleteSale.Enabled = true;
                    _productID = Convert.ToInt32(Session["productID"]);
                    InvoiceLineItem lineItem = GetProduct();

                    //clear the product id session 
                    Session["productID"] = null;

                    if (Session["lineItemList"] == null)
                    {
                        //add the invoice line item to the new invoice line item list
                        InvoiceLineItemList lineItemList = new InvoiceLineItemList();
                        lineItemList.Add(lineItem);

                        //save this list into a session variable
                        Session["lineItemList"] = lineItemList;
                        PopulateGridviewProductsOnOrder(lineItemList);
                    }
                    else
                    {
                        InvoiceLineItemList existingLineItems = Session["lineItemList"] as InvoiceLineItemList;
                        //add new items to the session
                        existingLineItems.Add(lineItem);

                        //display items in the gridview
                        PopulateGridviewProductsOnOrder(existingLineItems);
                    }
                }
                else
                {
                    //get the existing items from the session and display it
                    InvoiceLineItemList existingLineItems = Session["lineItemList"] as InvoiceLineItemList;

                    //display items in the gridview
                    PopulateGridviewProductsOnOrder(existingLineItems);

                }
            }
        }

        private InvoiceLineItem GetProduct()
        {
            Product myproduct = ProductManager.GetProductByID(_productID);
            //create a new lineItem
            InvoiceLineItem lineItem = new InvoiceLineItem();
            lineItem.ProductID = myproduct.ProductID;
            lineItem.ProductDescription = myproduct.ProductDescription;
            lineItem.ProductCode = myproduct.ProductCode;
            lineItem.Quantity = 1; //default quantity
            lineItem.UnitPriceCharged = myproduct.UnitPrice;
            lineItem.IsTaxExempt = myproduct.IsTaxExempt;
            lineItem.TaxCharged = lineItem.CalculateTaxCharged(taxPercentage);
            lineItem.CreatedBy = User.Identity.Name.ToString();
            return lineItem;
        }

        private void PopulateGridviewProductsOnOrder(InvoiceLineItemList lineItemList)
        {
            gviewProductsOrdered.DataSource = lineItemList;
            gviewProductsOrdered.DataBind();
        }

        protected void lnkSearchAccount_OnCommand(object sender, CommandEventArgs e)
        {
            Response.Redirect("~/Accounts/SearchAccount.aspx?src=" + 1);
        }

        protected void lnkSearchProduct_OnCommand(object sender, CommandEventArgs e)
        {
            Response.Redirect("~/Products/Search.aspx?src=" + 1);
        }


        #region Helpers


        public static string FormatPhonenumber(string phonenumber)
        {
            return StringParser.FormatPhonenumber(phonenumber);
        }
        #endregion

        #region Gridview Products Ordered
        protected void gviewProductsOrdered_DataBound(object sender, EventArgs e)
        {

        }
        protected void gviewProductsOrdered_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Right;
                (e.Row.FindControl("lblSubTotal") as Label).Text = invoiceLineItemsSubTotal.ToString("c");
                (e.Row.FindControl("lblTotalTax") as Label).Text = invoiceLineItemsTotalTaxCharged.ToString("c");
                //calculate the total amount payable
                invoiceLineItemsTotalAmount = (invoiceLineItemsSubTotal + invoiceLineItemsTotalTaxCharged);
                (e.Row.FindControl("lblTotalAmount") as Label).Text = invoiceLineItemsTotalAmount.ToString("c");
            }
        }
        protected void gviewProductsOrdered_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //get the value of the item total and tax charged
                double itemTotal = Convert.ToDouble((e.Row.FindControl("lblItemTotal") as Label).Text.Replace("$", ""));
                double taxCharged = Convert.ToDouble((e.Row.FindControl("lblTotalTaxCharged") as Label).Text.Replace("$", ""));

                invoiceLineItemsSubTotal += itemTotal;
                invoiceLineItemsTotalTaxCharged += taxCharged;
            }

        }
        protected void gviewProductsOrdered_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;
            if (Session["lineItemList"] != null)
            {
                InvoiceLineItemList myList = Session["lineItemList"] as InvoiceLineItemList;
                myList.RemoveAt(index);
                gviewProductsOrdered.DataSource = myList;
                gviewProductsOrdered.DataBind();
            }
        }
        protected void gviewProductsOrdered_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            lblMessage.Text = "";
            int index = e.RowIndex;

            //get the Item qty of the item to be updated
            int itemQuantity = Convert.ToInt32((gviewProductsOrdered.Rows[index].FindControl("txtItemQuantity") as TextBox).Text);
            int prodID = Convert.ToInt32((gviewProductsOrdered.Rows[index].FindControl("hdnProductID") as HiddenField).Value.ToString());

            //get the session
            InvoiceLineItemList lineItemList = Session["lineItemList"] as InvoiceLineItemList;

            Product myProduct = ProductManager.GetProductByID(prodID);

            //get the current in stock qty of the product
            if ((itemQuantity <= myProduct.UnitsOnHand) || (myProduct.UnitsOnHand == null)) //products with null units on hand are Prepaid water packages where unit qty is not stored
            {
                //allow the update 
                if (Session["lineItemList"] != null)
                {
                    InvoiceLineItem lineItem = lineItemList.ElementAt(index);
                    lineItem.Quantity = itemQuantity;
                    lineItem.TaxCharged = lineItem.CalculateTaxCharged(taxPercentage);

                    //save the invoiceItemList back into the session
                    //clear the session first
                    Session["lineItemList"] = null;
                    Session["lineItemList"] = lineItemList;
                    //re-bind the gridview
                    PopulateGridviewProductsOnOrder(lineItemList);
                }
            }
            else
            {
                //inform the user the item quantity is greater than the units on hand 
                lblMessage.Text = "Cannot update quantity. There are only " + myProduct.UnitsOnHand + " units left for this item.";

                //re-bind the gridview
                PopulateGridviewProductsOnOrder(lineItemList);

                //set the focus on the qty text box
                (gviewProductsOrdered.Rows[index].FindControl("txtItemQuantity") as TextBox).Focus();

            }








        }
        protected void gviewProductsOrdered_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }


        #endregion


        protected void lnkCompleteSale_Click(object sender, EventArgs e)
        {
            //get all the invoiceitem list
            InvoiceLineItemList lineItemList = Session["lineItemList"] as InvoiceLineItemList;

            //create an invoice
            Invoice newInvoice = new Invoice();
            BuildNewInvoice(lineItemList, newInvoice);

            newInvoice.InvoiceID = InvoiceManager.Save(newInvoice);
            _invoiceID = newInvoice.InvoiceID;

            //save each line item from the line item list
            foreach (InvoiceLineItem lineItem in lineItemList)
            {
                lineItem.InvoiceID = newInvoice.InvoiceID;
                //save line items
                InvoiceLineItemManager.Save(lineItem);

                //Update the stock quantity after the lineItem has been saved
                ProductManager.UpdateUnitsOnHand(lineItem, "subtract");

                //check if a lineitem is a Prepaid Water Pkg
                HandlePrepaidWaterPackages(newInvoice, lineItem);
            }

            //reset the account id
            _accountID = -1;
            //clean up session variables
            Session["productID"] = null;
            Session["lineItemList"] = null;
            Session["accountID"] = null;
        }

        private void BuildNewInvoice(InvoiceLineItemList lineItemList, Invoice newInvoice)
        {
            newInvoice.AccountID = _accountID;
            newInvoice.InvoiceDate = DateTime.Now.ToLocalTime();
            newInvoice.CreatedDate = DateTime.Now.ToLocalTime();
            newInvoice.ModifiedDate = DateTime.Now.ToLocalTime();
            newInvoice.CreatedBy = User.Identity.Name.ToString();
            newInvoice.SubTotal = Invoice.CalculateSubTotal(lineItemList);
            newInvoice.TotalTaxCharged = Invoice.CalculateTotalTaxes(lineItemList);
            newInvoice.TotalAmount = newInvoice.SubTotal + newInvoice.TotalTaxCharged;
        }

        private void HandlePrepaidWaterPackages(Invoice newInvoice, InvoiceLineItem lineItem)
        {
            if ((lineItem.ProductCode).Contains("WAT PKG"))
            {
                if (newInvoice.AccountID != null)
                {
                    // check if the account has an existing prepaid bottle account
                    // if not, create a new one
                    int bottleTypeID = ExtractBottleTypeID(lineItem.ProductCode);
                    PrepaidBottle p = PrepaidBottleManager.GetPrepaidBottle(_accountID, bottleTypeID);

                    if (p == null) //create a new one
                    {
                        p = new PrepaidBottle();
                        p.AccountID = _accountID;
                        p.PrepaidBottleType = bottleTypeID;
                        p.CreatedBy = User.Identity.Name.ToString();
                        p.TopUpBalance(ProductManager.GetTopUpQty(lineItem.ProductCode) * lineItem.Quantity);
                        p.PrepaidBottleID = PrepaidBottleManager.Save(p);
                    }
                    else
                    {
                        p.TopUpBalance(ProductManager.GetTopUpQty(lineItem.ProductCode));
                        p.ModifiedBy = User.Identity.Name.ToString();
                        PrepaidBottleManager.Save(p);
                    }

                    // save the prepaid bottle transaction
                    PrepaidBottleTransaction pBTransaction = new PrepaidBottleTransaction();
                    pBTransaction.PrepaidBottleID = p.PrepaidBottleID;
                    pBTransaction.TransactionType = "topUp";
                    pBTransaction.TopUpQty = ProductManager.GetTopUpQty(lineItem.ProductCode) * lineItem.Quantity;
                    pBTransaction.LastUpdatedBalance = p.Balance;
                    pBTransaction.CreatedBy = User.Identity.Name.ToString();
                    pBTransaction.TransactionID = PrepaidBottleTransactionManager.Save(pBTransaction);
                }
            }
        }

        public int ExtractBottleTypeID(string productCode)
        {
            string bottleSize = "";
            int typeID = 0;

            if (productCode.Contains("18L"))
            {
                bottleSize = "18L";
            }
            else if (productCode.Contains("11L"))
            {
                bottleSize = "11L";
            }
            else if (productCode.Contains("10L"))
            {
                bottleSize = "10L";
            }

            typeID = PrepaidBottleTypeManager.GetTypeByName(bottleSize);


            return typeID;
        }

        protected void mViewNewSale_ActiveViewChanged(object sender, EventArgs e)
        {

        }

        protected void lnkCreateAnotherSale_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Sales/New.aspx");
        }


        protected void lnkPrintInvoice_Click(object sender, EventArgs e)
        {
            Session["invoiceID"] = null;
            Session["invoiceID"] = _invoiceID;
            Response.Redirect("~/Sales/Invoice.aspx");
        }












    }
}
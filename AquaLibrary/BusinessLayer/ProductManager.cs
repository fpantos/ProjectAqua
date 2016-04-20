using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using AquaLibrary.DataAccess;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessObject.Collections;

namespace AquaLibrary.BusinessLayer
{
    public class ProductManager
    {

        public static int Save(Product product)
        {
            return ProductDB.Save(product);
        }

        public static int UpdateUnitsOnHand(InvoiceLineItem lineItem, string operation) 
        {
            return ProductDB.UpdateUnitsOnHand(lineItem, operation);
        }

        public static DataTable GetProductsByCategory(string prodCategory)
        {
            return ProductDB.GetProductsByCategory(prodCategory);
        }

        public static DataTable GetProductsByCategory(string prodCategory, int id)
        {
            return ProductDB.GetProductsByCategory(prodCategory, id);
        }

        public static DataTable GetProductBySearchCriteria(string searchBy, string searchString)
        {
            return ProductDB.GetProductBySearchCriteria(searchBy, searchString);
        }

        public static List<string> GetAutoCompleteList(string searchBy, string searchString) 
        {
            return ProductDB.GetAutoCompleteList(searchBy, searchString);
        }

        public static DataTable GetProducts()
        {
            return ProductDB.GetProducts();
        }

        public static Product GetProductByID(int id)
        {
            Product p = ProductDB.GetProductByID(id);

            return p;
        }

        public static int Discontinue(Product product)
        {
            return ProductDB.Discontinue(product);
        }

        public static DataTable GetSubProductByParent(int parentID)
        {
            return ProductDB.GetSubProductByParent(parentID);
        }

        public static int Reactivate(Product product)
        {
            return ProductDB.Reactivate(product);
        }

        public static int DeleteSubPart(ProductPartReplacement subProduct)
        {
            return ProductDB.DeleteSubPart(subProduct);
        }

        public static int GetTopUpQty(string productCode) 
        {
            return ProductDB.GetTopUpQty(productCode);
        
        }


        public static DataTable GetWTEProducts() 
        {
            return ProductDB.GetWTEProducts();
        }

        public static ProductList GetWTEProductsByCriteria(string searchBy, string searchString)
        {
            return ProductDB.GetWTEProductsByCriteria(searchBy, searchString);
        }

        public static ProductList GetSubProductListByParentID(int parentID) 
        {
            return ProductDB.GetSubProductListByParentID(parentID);
        }

        public static ProductList GetTop5ProductsByCategory(string productCategory) 
        {
            return ProductDB.GetTop5ProductsByCategory(productCategory);
        }

        public static DataTable GetLowStock(string sortExpression, string sortDirection) 
        {
            return ProductDB.GetLowStock(sortExpression, sortDirection);
        }

    }
}

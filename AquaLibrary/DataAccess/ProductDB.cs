using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Data.Common;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessObject.Collections;

namespace AquaLibrary.DataAccess
{
    public class ProductDB
    {

        public static int Save(Product product)
        {
            int result;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();

            try
            {

                conn = myConn.OpenDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.InsertUpdateProduct";

                if (product.ProductID == -1)
                {
                    cmd.Parameters.Add("@ProductID", SqlDbType.Int).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@ProductID", SqlDbType.Int).Value = product.ProductID;
                }

                cmd.Parameters.Add("@ProductDescription", SqlDbType.VarChar).Value = product.ProductDescription;
                cmd.Parameters.Add("@ProductCode", SqlDbType.VarChar).Value = product.ProductCode;
                cmd.Parameters.Add("@ProductCategory", SqlDbType.VarChar).Value = product.ProductCategory;
                cmd.Parameters.Add("@UnitCost", SqlDbType.Decimal).Value = product.UnitCost;
                cmd.Parameters.Add("@UnitPrice", SqlDbType.Decimal).Value = product.UnitPrice;
                cmd.Parameters.Add("@UnitsOnHand", SqlDbType.Int).Value = product.UnitsOnHand;
                cmd.Parameters.Add("@ReorderLevel", SqlDbType.Int).Value = product.ReorderLevel;
                cmd.Parameters.Add("@ManufacturerName", SqlDbType.VarChar).Value = product.ManufacturerName;
                cmd.Parameters.Add("@ItemUrl", SqlDbType.VarChar).Value = product.ItemUrl;
                cmd.Parameters.Add("@IsDiscontinued", SqlDbType.Bit).Value = product.IsDiscontinued;
                cmd.Parameters.Add("@IsSubProduct", SqlDbType.Bit).Value = product.IsSubProduct;
                cmd.Parameters.Add("@IsTaxExempt", SqlDbType.Bit).Value = product.IsTaxExempt;
                cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = product.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = product.ModifiedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = product.CreatedBy;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = product.ModifiedBy;

                DbParameter returnValue = cmd.CreateParameter();
                returnValue.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(returnValue);
                cmd.ExecuteNonQuery();

                result = Convert.ToInt32(returnValue.Value);
                cmd.Dispose();
            }
            finally
            {
                myConn.CloseDB(conn);
            }

            return result;
        }

        public static int UpdateUnitsOnHand( InvoiceLineItem lineItem, string operation) 
        {

            int result;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();

            try
            {   conn = myConn.OpenDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.[UpdateProductUnitsOnHand]";

                cmd.Parameters.Add("@updateQty", SqlDbType.Int).Value = lineItem.Quantity;
                cmd.Parameters.Add("@productID", SqlDbType.Int).Value = lineItem.ProductID;
                cmd.Parameters.Add("@operationtype", SqlDbType.VarChar).Value = operation;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = lineItem.CreatedDate;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = lineItem.CreatedBy;

                DbParameter returnValue = cmd.CreateParameter();
                returnValue.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(returnValue);
                cmd.ExecuteNonQuery();

                result = Convert.ToInt32(returnValue.Value);
                cmd.Dispose();
            }
            finally
            {
                myConn.CloseDB(conn);
            }
            return result;
        }

        public static Product GetProductByID(int id)
        {
            Product myProduct = new Product();
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.Product where ProductID = @ProductID";

            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add("@ProductID", SqlDbType.Int).Value = id;
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.Read())
                {
                    myProduct = FillDataRecord(dr);
                }

                dr.Close();
                cmd.Dispose();

            }
            finally
            {
                //close the connection
                myConn.CloseDB(conn);
            }

            return myProduct;
        }

        public static  DataTable GetWTEProducts()
        {
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr = null;
            SqlCommand cmd = new SqlCommand();
            DataTable dt = null;
            try
            {

                conn = myConn.OpenDB();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.getWTEList";
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                dt = new DataTable();
                dt.Load(dr);

                cmd.Dispose();
                dr.Close();
            }
            finally
            {

                myConn.CloseDB(conn);
            }
            return dt;
        
        }

        public static ProductList GetWTEProductsByCriteria(string searchBy, string searchString)
        {

            ProductList aList = null;

            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;

            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.GetWTEProductsBySearchCriteria";

                cmd.Parameters.Add("@SearchCriteria", SqlDbType.VarChar).Value = searchBy;
                cmd.Parameters.Add("@input", SqlDbType.VarChar).Value = searchString;

                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.HasRows)
                {
                    aList = new ProductList();
                    while (dr.Read())
                    {
                        aList.Add(FillDataRecord(dr));
                    }
                }

                cmd.Dispose();
                dr.Close();

            }
            finally
            {
                myConn.CloseDB(conn);
            }

            return aList;
        }

        public static int GetTopUpQty(string productCode)
        {
            int topUpQty = 0;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "select topupqty from aquaone.dbo.product where productcode = @productCode";

            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add("@productCode", SqlDbType.VarChar).Value = productCode;
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.Read())
                {
                    topUpQty = dr.GetInt32(0);
                }

                dr.Close();
                cmd.Dispose();

            }
            finally
            {
                //close the connection
                myConn.CloseDB(conn);
            }

            return topUpQty;
        }

        public static DataTable GetProductsByCategory(string productCategory)
        {
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr = null;
            SqlCommand cmd = new SqlCommand();
            DataTable dt = null;
            try
            {

                conn = myConn.OpenDB();
                cmd.Connection = conn;
                //cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Select * from Product where ProductCategory = @ProductCategory order by ProductCategory";

                cmd.Parameters.Add("@ProductCategory", SqlDbType.VarChar).Value = productCategory;
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                dt = new DataTable();
                dt.Load(dr);

                cmd.Dispose();
                dr.Close();
            }
            finally
            {

                myConn.CloseDB(conn);
            }
            return dt;

        }

        public static DataTable GetProductsByCategory(string productCategory, int ProductID)
        {
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr = null;
            SqlCommand cmd = new SqlCommand();
            DataTable dt = null;
            try
            {
                conn = myConn.OpenDB();
                cmd.Connection = conn;
                cmd.CommandText = "Select * from Product where ProductCategory = @ProductCategory and IsSubProduct=1 and  ProductID <> @ProductID  and ProductID not in (select SubProductID from ProductPartReplacement pp, Product p where pp.ProductID=@ProductID and p.ProductID=pp.SubProductID) order by ProductCategory";

                cmd.Parameters.Add("@ProductCategory", SqlDbType.VarChar).Value = productCategory;
                cmd.Parameters.Add("@ProductID", SqlDbType.VarChar).Value = ProductID;

                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                dt = new DataTable();
                dt.Load(dr);

                cmd.Dispose();
                dr.Close();
            }
            finally
            {

                myConn.CloseDB(conn);
            }
            return dt;

        }

        public static DataTable GetProductBySearchCriteria(string searchBy, string searchString)
        {
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr = null;
            SqlCommand cmd = new SqlCommand();
            DataTable dt = null;

            try
            {

                conn = myConn.OpenDB();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.[GetProductBySearchCriteria]";


                cmd.Parameters.Add("@SearchCriteria", SqlDbType.VarChar).Value = searchBy;
                cmd.Parameters.Add("@Input", SqlDbType.VarChar).Value = searchString;

                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                dt = new DataTable();
                dt.Load(dr);

                cmd.Dispose();
                dr.Close();
            }
            finally
            {
                myConn.CloseDB(conn);
            }

            return dt;

        }

        public static List<string> GetAutoCompleteList(string searchBy, string searchString)
        {
            List<string> searchList = new List<string>();
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr = null;
            SqlCommand cmd = new SqlCommand();
            try
            {

                conn = myConn.OpenDB();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.GetAutocompleteSearchListForProduct";
                cmd.Parameters.Add("@SearchCriteria", SqlDbType.VarChar).Value = searchBy;
                cmd.Parameters.Add("@input", SqlDbType.VarChar).Value = searchString;
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        searchList.Add(dr.GetValue(0).ToString());
                    }
                }

                cmd.Dispose();
                dr.Close();
            }
            finally
            {

                myConn.CloseDB(conn);
            }
            return searchList;
        }

        public static DataTable GetProducts()
        {
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr = null;
            SqlCommand cmd = new SqlCommand();
            DataTable dt = new DataTable();
            try
            {

                conn = myConn.OpenDB();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.GetProducts";

                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                dt.Load(dr);
            }
            finally
            {
                cmd.Dispose();
                myConn.CloseDB(conn);
            }
            return dt;
        }

        private static Product FillDataRecord(IDataRecord dr)
        {
            Product product = new Product();

            product.ProductID = dr.GetInt32(dr.GetOrdinal("ProductID"));
            product.ProductCode = dr.GetString(dr.GetOrdinal("ProductCode"));
            product.ProductDescription = dr.GetString(dr.GetOrdinal("ProductDescription"));
            product.ProductCategory = dr.GetString(dr.GetOrdinal("ProductCategory"));
            product.UnitCost = Convert.ToDouble(dr.GetDecimal(dr.GetOrdinal("UnitCost")));
            product.UnitPrice = Convert.ToDouble(dr.GetDecimal(dr.GetOrdinal("UnitPrice")));

            if (!dr.IsDBNull(dr.GetOrdinal("UnitsOnHand")))
            {
                product.UnitsOnHand = dr.GetInt32(dr.GetOrdinal("UnitsOnHand"));
            }
            if (!dr.IsDBNull(dr.GetOrdinal("ReorderLevel")))
            {
                product.ReorderLevel = dr.GetInt32(dr.GetOrdinal("ReorderLevel"));
            }       
            if (!dr.IsDBNull(dr.GetOrdinal("ManufacturerName")))
            {
                product.ManufacturerName = dr.GetString(dr.GetOrdinal("ManufacturerName"));
            }
            if (!dr.IsDBNull(dr.GetOrdinal("ItemUrl")))
            {
                product.ItemUrl = dr.GetString(dr.GetOrdinal("ItemUrl"));
            }
            
            product.IsSubProduct = dr.GetBoolean(dr.GetOrdinal("IsSubProduct"));
            product.IsDiscontinued = dr.GetBoolean(dr.GetOrdinal("IsDiscontinued"));
            product.IsTaxExempt = dr.GetBoolean(dr.GetOrdinal("IsTaxExempt"));

            return product;

        }

        public static int Discontinue(Product product)
        {
            int result;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();

            try
            {
                conn = myConn.OpenDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.DiscontinueProduct";

                cmd.Parameters.Add("@ProductID", SqlDbType.Int).Value = product.ProductID;
                cmd.Parameters.Add("@IsDiscontinued", SqlDbType.Bit).Value = product.IsDiscontinued;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = product.ModifiedBy;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = product.ModifiedDate;

                DbParameter returnValue = cmd.CreateParameter();
                returnValue.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(returnValue);
                cmd.ExecuteNonQuery();

                result = Convert.ToInt32(returnValue.Value);
            }
            finally
            {
                myConn.CloseDB(conn);
            }

            return result;
        }

        public static DataTable GetSubProductByParent(int parentID)
        {
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr = null;
            SqlCommand cmd = new SqlCommand();
            DataTable dt = null;
            try
            {

                conn = myConn.OpenDB();
                cmd.Connection = conn;
                cmd.CommandText = "Select p.ProductDescription, p.ProductCode, p.ProductCategory, p.ManufacturerName, pp.SubProductID from [aquaOne].[dbo].[Product] p, [aquaOne].[dbo].[ProductPartReplacement] pp where p.ProductID=pp.SubProductID and pp.ProductID=@ParentID ";

                cmd.Parameters.Add("@ParentID", SqlDbType.Int).Value = parentID;
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                dt = new DataTable();
                dt.Load(dr);

                cmd.Dispose();
                dr.Close();
            }
            finally
            {

                myConn.CloseDB(conn);
            }
            return dt;
        }

        public static ProductList GetSubProductListByParentID(int parentID)
        {
            ProductList aList = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr = null;
            SqlCommand cmd = new SqlCommand();
            try
            {

                conn = myConn.OpenDB();
                cmd.Connection = conn;
                //cmd.CommandText = "Select p.ProductDescription, p.ProductCode, p.ProductCategory, p.ManufacturerName, pp.SubProductID from [aquaOne].[dbo].[Product] p, [aquaOne].[dbo].[ProductPartReplacement] pp where p.ProductID=pp.SubProductID and pp.ProductID=@ParentID ";
                cmd.CommandText =  " select  p.* " +
                         " from AquaOne.dbo.ProductPartReplacement pp, Aquaone.dbo.product p " +
                        " where pp.productID = @ParentID " +
                        " and p.productid = pp.subproductid;";


                cmd.Parameters.Add("@ParentID", SqlDbType.Int).Value = parentID;
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.HasRows)
                {
                    aList = new  ProductList();
                    while (dr.Read())
                    {
                        aList.Add(FillDataRecord(dr));
                    }
                }

                cmd.Dispose();
                dr.Close();
            }
            finally
            {

                myConn.CloseDB(conn);
            }
            return aList;
        }

        public static int Reactivate(Product product)
        {
            int result;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();

            try
            {
                conn = myConn.OpenDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.ReactivateProduct";


                cmd.Parameters.Add("@ProductID", SqlDbType.Int).Value = product.ProductID;
                cmd.Parameters.Add("@IsDiscontinued", SqlDbType.Bit).Value = product.IsDiscontinued;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = product.ModifiedBy;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = product.ModifiedDate;

                DbParameter returnValue = cmd.CreateParameter();
                returnValue.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(returnValue);
                cmd.ExecuteNonQuery();

                result = Convert.ToInt32(returnValue.Value);
            }
            finally
            {
                myConn.CloseDB(conn);
            }

            return result;
        }

        public static int DeleteSubPart(ProductPartReplacement subProduct)
        {
            int result;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();

            try
            {
                conn = myConn.OpenDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.DeleteSubPart";

                cmd.Parameters.Add("@ProductID", SqlDbType.Int).Value = subProduct.ProductID;
                cmd.Parameters.Add("@SubProductID", SqlDbType.Int).Value = subProduct.SubProductID;

                DbParameter returnValue = cmd.CreateParameter();
                returnValue.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(returnValue);
                cmd.ExecuteNonQuery();

                result = Convert.ToInt32(returnValue.Value);
            }
            finally
            {
                myConn.CloseDB(conn);
            }

            return result;
        }


        public static ProductList GetTop5ProductsByCategory(string productCategory)
        {
            ProductList aList = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr = null;
            SqlCommand cmd = new SqlCommand();
            try
            {

                conn = myConn.OpenDB();
                cmd.Connection = conn;
                cmd.CommandText = "Select top 5 * from Product where ProductCategory = @ProductCategory order by newID();";

                cmd.Parameters.Add("@ProductCategory", SqlDbType.VarChar).Value = productCategory;
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.HasRows)
                {
                    aList = new ProductList();
                    while (dr.Read())
                    {
                        aList.Add(FillDataRecord(dr));
                    }
                }

                cmd.Dispose();
                dr.Close();
            }
            finally
            {

                myConn.CloseDB(conn);
            }
            return   aList;

        }

        public static DataTable GetLowStock(string sortExpression, string sortDirection)
        {
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr = null;
            SqlCommand cmd = new SqlCommand();
            DataTable dt = null;
            try
            {

                conn = myConn.OpenDB();
                cmd.Connection = conn;
                
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.GetProductsBelowReorderLevelWithFilter";
                cmd.Parameters.Add("@sortExpression", SqlDbType.VarChar).Value = sortExpression;
                cmd.Parameters.Add("@sortDirection", SqlDbType.VarChar).Value = sortDirection;
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                dt = new DataTable();
                dt.Load(dr);

                cmd.Dispose();
                dr.Close();
            }
            finally
            {

                myConn.CloseDB(conn);
            }
            return dt;
        }
        
    }
}

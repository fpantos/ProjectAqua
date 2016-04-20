using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessObject.Collections;
using System.Data.Common;

namespace AquaLibrary.DataAccess
{
    public class Ref_ProductCategoryDB
    {

        public static int Save(Ref_ProductCategory prodCategory)
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
                cmd.CommandText = "dbo.[InsertUpdateProductCategory]";

                if (prodCategory.CategoryID == -1)
                {
                    cmd.Parameters.Add("@CategoryID", SqlDbType.Int).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@CategoryID", SqlDbType.Int).Value = prodCategory.CategoryID;
                }
                cmd.Parameters.Add("@CategoryName", SqlDbType.VarChar).Value = prodCategory.CategoryName;
                cmd.Parameters.Add("@Description",SqlDbType.VarChar).Value = prodCategory.Description;
                cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = prodCategory.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = prodCategory.ModifiedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = prodCategory.CreatedBy;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = prodCategory.ModifiedBy;

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

        public static  Ref_ProductCategoryList GetList()
        {

            Ref_ProductCategoryList aList = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.ProductCategory";
            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand(sql, conn);

                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.HasRows)
                {
                    aList = new   Ref_ProductCategoryList();
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

        public static Ref_ProductCategory GetByID(int id)
        {
            Ref_ProductCategory prodCategory = new Ref_ProductCategory();
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.ProductCategory where categoryID = @categoryID";
            // Open the connection
            conn = myConn.OpenDB();
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add("@Category", SqlDbType.Int).Value = id;
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                prodCategory = FillDataRecord(dr);
            }
            cmd.Dispose();
            //close the connection
            myConn.CloseDB(conn);
            return prodCategory;
        }

        public static int DeleteProductCategory(int categoryID)
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
                cmd.CommandText = "dbo.DeleteProductCategory";


                cmd.Parameters.Add("@categoryID", SqlDbType.Int).Value =  categoryID;

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

        private static Ref_ProductCategory FillDataRecord(IDataRecord dr)
        {
            Ref_ProductCategory prodCategory = new Ref_ProductCategory();
            prodCategory.CategoryID = dr.GetInt32(dr.GetOrdinal("CategoryID"));
            prodCategory.CategoryName = dr.GetString(dr.GetOrdinal("CategoryName"));
            prodCategory.Description = dr.GetString(dr.GetOrdinal("Description"));
            prodCategory.CreatedDate = dr.GetDateTime(dr.GetOrdinal("CreatedDate"));
            prodCategory.ModifiedDate = dr.GetDateTime(dr.GetOrdinal("ModifiedDate"));
            prodCategory.CreatedBy = dr.GetString(dr.GetOrdinal("CreatedBy"));
            prodCategory.ModifiedBy = dr.GetString(dr.GetOrdinal("ModifiedBy"));

            return prodCategory;
        }

    }
}

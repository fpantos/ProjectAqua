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
    public class ProductPartReplacementDB
    {
        public static int Save(ProductPartReplacement prodReplacement)
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
                cmd.CommandText = "dbo.InsertProductPartReplacement";

                cmd.Parameters.Add("@ProductID", SqlDbType.Int).Value = prodReplacement.ProductID;
                cmd.Parameters.Add("@SubProductID", SqlDbType.Int).Value = prodReplacement.SubProductID;
                cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = prodReplacement.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = prodReplacement.ModifiedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = prodReplacement.CreatedBy;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = prodReplacement.ModifiedBy;

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

       

    }
}

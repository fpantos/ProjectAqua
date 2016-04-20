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
    public class PrepaidBottleTransactionDB
    {
        public static int Save( PrepaidBottleTransaction pBTransaction)
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
                cmd.CommandText = "dbo.InsertUpdatePBTransaction";

                if (pBTransaction.TransactionID == -1)
                {
                    cmd.Parameters.Add("@TransactionID", SqlDbType.Int).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@TransactionID", SqlDbType.Int).Value = pBTransaction.TransactionID;
                }             
                cmd.Parameters.Add("@TransactionType", SqlDbType.VarChar).Value = pBTransaction.TransactionType;

                if (pBTransaction.PrepaidBottleID == null)
                {
                    cmd.Parameters.Add("@PrepaidBottleID", SqlDbType.Int).Value = DBNull.Value;
                }
                else 
                {
                    cmd.Parameters.Add("@PrepaidBottleID", SqlDbType.Int).Value = pBTransaction.PrepaidBottleID;
                }

                cmd.Parameters.Add("@LastUpdatedBalance", SqlDbType.Int).Value = pBTransaction.LastUpdatedBalance;
                cmd.Parameters.Add("@DeductQty", SqlDbType.Int).Value = pBTransaction.DeductQty;
                cmd.Parameters.Add("@TopUpQty", SqlDbType.Int).Value = pBTransaction.TopUpQty;            
                cmd.Parameters.Add("@LastTransactionDate", SqlDbType.DateTime).Value = pBTransaction.LastTransactionDate;
                cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = pBTransaction.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = pBTransaction.ModifiedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = pBTransaction.CreatedBy;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = pBTransaction.ModifiedBy;

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

        public static  PrepaidBottleTransactioList GetListByPrepaidID(int prepaidID)
        {

            PrepaidBottleTransactioList aList = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            
            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.GetTransactionHistoryByPrepaidID";
                cmd.Parameters.Add("@prepaidID", SqlDbType.Int).Value = prepaidID;

                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.HasRows)
                {
                    aList = new PrepaidBottleTransactioList();
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

        private static PrepaidBottleTransaction FillDataRecord(IDataRecord dr)
        {
            PrepaidBottleTransaction pBTransaction = new PrepaidBottleTransaction();
            pBTransaction.TransactionID = dr.GetInt32(dr.GetOrdinal("TransactionID"));
            pBTransaction.TransactionType = dr.GetString(dr.GetOrdinal("TransactionType"));
            pBTransaction.PrepaidBottleID = dr.GetInt32(dr.GetOrdinal("PrepaidBottleID"));
            pBTransaction.LastUpdatedBalance = dr.GetInt32(dr.GetOrdinal("LastUpdatedBalance"));
            pBTransaction.DeductQty = dr.GetInt32(dr.GetOrdinal("DeductQty"));
            pBTransaction.TopUpQty = dr.GetInt32(dr.GetOrdinal("TopUpQty"));
            pBTransaction.LastTransactionDate = dr.GetDateTime(dr.GetOrdinal("LastTransactionDate"));
            pBTransaction.CreatedDate = dr.GetDateTime(dr.GetOrdinal("CreatedDate"));
            pBTransaction.ModifiedDate = dr.GetDateTime(dr.GetOrdinal("ModifiedDate"));
            pBTransaction.CreatedBy = dr.GetString(dr.GetOrdinal("CreatedBy"));
            pBTransaction.ModifiedBy = dr.GetString(dr.GetOrdinal("ModifiedBy"));
            return pBTransaction;

        }
    }
}

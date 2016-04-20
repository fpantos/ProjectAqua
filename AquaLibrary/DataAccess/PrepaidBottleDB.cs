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
    public class PrepaidBottleDB
    {

        public static int Save( PrepaidBottle prepaidBottle)
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
                cmd.CommandText = "dbo.InsertUpdatePrepaidBottle";

                if ( prepaidBottle.PrepaidBottleID == -1)
                {
                    cmd.Parameters.Add("@PrepaidBottleID", SqlDbType.Int).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@PrepaidBottleID", SqlDbType.Int).Value = prepaidBottle.PrepaidBottleID;
                }        
                cmd.Parameters.Add("@AccountID", SqlDbType.Int).Value = prepaidBottle.AccountID;
                cmd.Parameters.Add("@PrepaidBottleType", SqlDbType.Int).Value = prepaidBottle.PrepaidBottleType;
                cmd.Parameters.Add("@Balance", SqlDbType.Int).Value = prepaidBottle.Balance;
                cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = prepaidBottle.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = prepaidBottle.ModifiedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = prepaidBottle.CreatedBy;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = prepaidBottle.ModifiedBy;

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

        public static PrepaidBottle GetPrepaidBottle(int accountID, int type)
        {
           // Account account = new Account();
            PrepaidBottle pBottle = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.PrepaidBottle where AccountID = @AccountID and PrepaidBottleType = @type";

            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add("@AccountID", SqlDbType.Int).Value =  accountID;
                cmd.Parameters.Add("@type", SqlDbType.Int).Value =  type;
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.Read())
                {
                     pBottle = FillDataRecord(dr);
                }

                dr.Close();
                cmd.Dispose();

            }
            finally
            {
                //close the connection
                myConn.CloseDB(conn);
            }

            return  pBottle;
        }

        public static PrepaidBottle GetPrepaidBottleByID( int prepaidBottleID)
        {
            // Account account = new Account();
            PrepaidBottle pBottle = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.PrepaidBottle where  PrepaidBottleID = @prepaidBottleID";

            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add("@prepaidBottleID", SqlDbType.Int).Value = prepaidBottleID;
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.Read())
                {
                    pBottle = FillDataRecord(dr);
                }

                dr.Close();
                cmd.Dispose();

            }
            finally
            {
                //close the connection
                myConn.CloseDB(conn);
            }

            return pBottle;
        }

        public static DataTable GetPrepaidPackagesByAccount(int accountID)
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
                cmd.CommandText = "dbo.GetPrepaidPackagesByAccount";


                cmd.Parameters.Add("@accountID", SqlDbType.Int).Value = accountID;


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



        private static  PrepaidBottle FillDataRecord(IDataRecord dr)
        {
            PrepaidBottle prepaidBottle = new  PrepaidBottle();
            prepaidBottle.PrepaidBottleID = dr.GetInt32(dr.GetOrdinal("PrepaidBottleID"));
            prepaidBottle.AccountID = dr.GetInt32(dr.GetOrdinal("AccountID"));
            prepaidBottle.Balance = dr.GetInt32(dr.GetOrdinal("Balance"));
            prepaidBottle.PrepaidBottleType = dr.GetInt32(dr.GetOrdinal("PrepaidBottleType"));
            prepaidBottle.CreatedDate = dr.GetDateTime(dr.GetOrdinal("CreatedDate"));
            prepaidBottle.ModifiedDate = dr.GetDateTime(dr.GetOrdinal("ModifiedDate"));
            prepaidBottle.CreatedBy = dr.GetString(dr.GetOrdinal("CreatedBy"));
            prepaidBottle.ModifiedBy = dr.GetString(dr.GetOrdinal("ModifiedBy"));

            return prepaidBottle;

        }
    }
}

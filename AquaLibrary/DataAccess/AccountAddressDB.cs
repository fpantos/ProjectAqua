using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AquaLibrary.BusinessObject;
using System.Data.SqlClient;
using System.Data;

namespace AquaLibrary.DataAccess
{
    public class AccountAddressDB
    {
        public AccountAddressDB() { }
        
        public static int AddAccountAddress( AccountAddress newAccountAddress) 
        {
         
            int result;
            MyDBConnection dbconn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            try
            {

                conn = dbconn.OpenDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.AddAccountAddress";

                cmd.Parameters.Add("@AccountID",SqlDbType.Int).Value=newAccountAddress.AccountID;
                cmd.Parameters.Add("@AddressID",SqlDbType.Int).Value=newAccountAddress.AddressID;
                cmd.Parameters.Add("@AddressType",SqlDbType.Int).Value=newAccountAddress.AddressType;
                cmd.Parameters.Add("@CreatedDate",SqlDbType.DateTime).Value = newAccountAddress.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate",SqlDbType.DateTime).Value = newAccountAddress.ModifiedDate;
                cmd.Parameters.Add("@CreatedBy",SqlDbType.VarChar).Value = newAccountAddress.CreatedBy;
                cmd.Parameters.Add("@ModifiedBy",SqlDbType.VarChar).Value = newAccountAddress.ModifiedBy;


                result = cmd.ExecuteNonQuery();

            }
            finally
            {
                dbconn.CloseDB(conn);

            }

            return result;
        }


        public static int GetAddressID(int addressType,int id)
        {
            int addressID = 0;
            AccountAddress accountAddress = new AccountAddress();
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select addressid from AquaOne.dbo.AccountAddress where AccountID = @AccountID and AddressType = @AddressType";
            // Open the connection
            conn = myConn.OpenDB();
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add("@AccountID", SqlDbType.Int).Value = id;
            cmd.Parameters.Add("@AddressType", SqlDbType.Int).Value = addressType;
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                addressID = dr.GetInt32(0);
              //  accountAddress = FillDataRecord(dr);
            }
            cmd.Dispose();
            //close the connection
            myConn.CloseDB(conn);
            return addressID;

        }
        
        

        private static AccountAddress FillDataRecord(IDataRecord dr)
        {
            AccountAddress accountAddress = new AccountAddress();
            accountAddress.AddressID = dr.GetInt32(dr.GetOrdinal("AddressID"));
            accountAddress.AccountID = dr.GetInt32(dr.GetOrdinal("AccountID"));
            accountAddress.AddressType = dr.GetInt32(dr.GetOrdinal("AddressType"));

            return accountAddress;

        }





    }
}

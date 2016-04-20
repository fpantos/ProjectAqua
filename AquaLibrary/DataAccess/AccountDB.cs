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
    public class AccountDB
    {
        public AccountDB() { }

        public static int Save(Account account)
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
                cmd.CommandText = "dbo.InsertUpdateAccount";

                if (account.AccountID == -1)
                {
                    cmd.Parameters.Add("@AccountID", SqlDbType.Int).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@AccountID", SqlDbType.Int).Value = account.AccountID;
                }

                cmd.Parameters.Add("@Title", SqlDbType.VarChar).Value = account.Title;
                cmd.Parameters.Add("@Firstname", SqlDbType.VarChar).Value = account.Firstname;
                cmd.Parameters.Add("@Middlename", SqlDbType.VarChar).Value = account.Middlename;
                cmd.Parameters.Add("@Lastname", SqlDbType.VarChar).Value = account.Lastname;
                cmd.Parameters.Add("@Suffix", SqlDbType.VarChar).Value = account.Suffix;
                cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = account.Email;
                cmd.Parameters.Add("@Homephone", SqlDbType.VarChar).Value = account.Homephone;
                cmd.Parameters.Add("@Mobilephone", SqlDbType.VarChar).Value = account.Mobilephone;
                cmd.Parameters.Add("@Workphone", SqlDbType.VarChar).Value = account.Workphone;
                cmd.Parameters.Add("@CustomerSince", SqlDbType.DateTime).Value = account.CustomerSince;
                cmd.Parameters.Add("@WaterSourceLocationID", SqlDbType.Int).Value = account.WaterSourceLocationID;
                cmd.Parameters.Add("@ContactFrequency", SqlDbType.VarChar).Value = account.ContactFrequency;
                cmd.Parameters.Add("@IsActive", SqlDbType.Bit).Value = account.IsActive;
                cmd.Parameters.Add("@IsENewsletter", SqlDbType.Bit).Value = account.IsENewsletter;
                cmd.Parameters.Add("@IsNewsletter", SqlDbType.Bit).Value = account.IsNewsletter;
                cmd.Parameters.Add("@IsWaterTreatmentEquipment", SqlDbType.Bit).Value = account.IsWaterTreatmentEquipment;
                cmd.Parameters.Add("@IsBottledWater", SqlDbType.Bit).Value = account.IsBottledWater;
                cmd.Parameters.Add("@IsRental", SqlDbType.Bit).Value = account.IsRental;
                cmd.Parameters.Add("@IsService", SqlDbType.Bit).Value = account.IsService;
                cmd.Parameters.Add("@IsDelivery", SqlDbType.Bit).Value = account.IsDelivery;
                cmd.Parameters.Add("@IsWaterCare", SqlDbType.Bit).Value = account.IsWaterCare;
                cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = account.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = account.ModifiedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = account.CreatedBy;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = account.ModifiedBy;
                cmd.Parameters.Add("@Notes", SqlDbType.VarChar).Value = account.Notes;

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

        public static Account GetAccountByID(int id)
        {
            Account account = new Account();
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.Account where AccountID = @AccountID";

            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add("@AccountID", SqlDbType.Int).Value = id;
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.Read())
                {
                    account = FillDataRecord(dr);
                }

                dr.Close();
                cmd.Dispose();

            }
            finally
            {
                //close the connection
                myConn.CloseDB(conn);
            }

            return account;
        }

        public static AccountList GetList()
        {

            AccountList aList = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.Account";
            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand(sql, conn);

                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.HasRows)
                {
                    aList = new AccountList();
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

        //[GetAutocompleteSearchListForAccount]
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
                cmd.CommandText = "dbo.GetAutocompleteSearchListForAccount";
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


        /// <summary>
        /// helper method
        /// </summary>
        /// <param name="dr"></param>
        /// <returns></returns>
        private static Account FillDataRecord(IDataRecord dr)
        {
            Account account = new Account();
            account.AccountID = dr.GetInt32(dr.GetOrdinal("AccountID"));
            account.Title = dr.GetString(dr.GetOrdinal("Title"));
            account.Firstname = dr.GetString(dr.GetOrdinal("Firstname"));
            account.Middlename = dr.GetString(dr.GetOrdinal("Middlename"));
            account.Lastname = dr.GetString(dr.GetOrdinal("Lastname"));
            account.Suffix = dr.GetString(dr.GetOrdinal("Suffix"));
            account.Email = dr.GetString(dr.GetOrdinal("Email"));
            account.Homephone = dr.GetString(dr.GetOrdinal("Homephone"));
            account.Mobilephone = dr.GetString(dr.GetOrdinal("Mobilephone"));
            account.Workphone = dr.GetString(dr.GetOrdinal("Workphone"));
            account.CustomerSince = dr.GetDateTime(dr.GetOrdinal("CustomerSince"));
            account.WaterSourceLocationID = dr.GetInt32(dr.GetOrdinal("WaterSourceLocationID"));
            account.ContactFrequency = dr.GetString(dr.GetOrdinal("ContactFrequency"));
            account.IsActive = dr.GetBoolean(dr.GetOrdinal("IsActive"));
            account.IsENewsletter = dr.GetBoolean(dr.GetOrdinal("IsENewsletter"));
            account.IsNewsletter = dr.GetBoolean(dr.GetOrdinal("IsNewsletter"));
            account.IsWaterTreatmentEquipment = dr.GetBoolean(dr.GetOrdinal("IsWaterTreatmentEquipment"));
            account.IsBottledWater = dr.GetBoolean(dr.GetOrdinal("IsBottledWater"));
            account.IsRental = dr.GetBoolean(dr.GetOrdinal("IsRental"));
            account.IsService = dr.GetBoolean(dr.GetOrdinal("IsService"));
            account.IsDelivery = dr.GetBoolean(dr.GetOrdinal("IsDelivery"));
            account.IsWaterCare = dr.GetBoolean(dr.GetOrdinal("IsWaterCare"));
            account.Notes = dr.GetString(dr.GetOrdinal("Notes"));
            account.CreatedDate = dr.GetDateTime(dr.GetOrdinal("CreatedDate"));
            account.ModifiedDate = dr.GetDateTime(dr.GetOrdinal("ModifiedDate"));
            account.CreatedBy = dr.GetString(dr.GetOrdinal("CreatedBy"));
            account.ModifiedBy = dr.GetString(dr.GetOrdinal("ModifiedBy"));

            return account;

        }

        public static DataTable GetAccountWithAddressBySearchCriteria(string searchBy, string searchString)
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
                cmd.CommandText = "dbo.getaccountwithaddress";


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

        public static DataTable GetAccountWithAddress(int accountID)
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
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "Select * from aquaone.dbo.vw_accountWithAddress where accountID=@accountID";


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

        public static DataTable GetAccountsWithAddress()
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
                cmd.CommandText = "dbo.GetAccountsWithAddress";

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

        public static int Deactivate(Account account)
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
                cmd.CommandText = "dbo.DeactivateAccount";

                cmd.Parameters.Add("@AccountID", SqlDbType.Int).Value = account.AccountID;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = account.ModifiedDate;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = account.ModifiedBy;

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

        public static int Activate(Account account)
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
                cmd.CommandText = "dbo.ActivateAccount";

                cmd.Parameters.Add("@AccountID", SqlDbType.Int).Value = account.AccountID;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = account.ModifiedDate;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = account.ModifiedBy;

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

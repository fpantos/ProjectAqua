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
    public class AddressDB
    {
        public AddressDB() { }

        public static int Save(Address address) 
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
                cmd.CommandText = "dbo.InsertUpdateAddress";
                
                if (address.AddressID == -1)
                {
                    cmd.Parameters.Add("@AddressID", SqlDbType.Int).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@AddressID", SqlDbType.Int).Value = address.AddressID;
                }

                cmd.Parameters.Add("@AddressLine1", SqlDbType.VarChar).Value = address.AddressLine1;
                cmd.Parameters.Add("@AddressLine2", SqlDbType.VarChar).Value = address.AddressLine2;
                cmd.Parameters.Add("@CityTown", SqlDbType.VarChar).Value = address.CityTown;
                cmd.Parameters.Add("@Province", SqlDbType.VarChar).Value = address.Province;
                cmd.Parameters.Add("@PostalCode", SqlDbType.VarChar).Value = address.PostalCode;
                cmd.Parameters.Add("@Country", SqlDbType.VarChar).Value = address.Country;
                cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = address.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = address.ModifiedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = address.CreatedBy;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = address.ModifiedBy;

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

        public static Address GetAddressByID(int id) 
        {
            Address address = new Address();
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.Address where AddressID = @AddressID";
            // Open the connection
            conn = myConn.OpenDB();
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add("@AddressID", SqlDbType.Int).Value = id;
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                address = FillDataRecord(dr);
            }
            cmd.Dispose();
            //close the connection
            myConn.CloseDB(conn);
            return address;
        }


        public static AddressList GetList() 
        {
            AddressList aList = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.Address";

            // Open the connection
            conn = myConn.OpenDB();
            cmd = new SqlCommand(sql, conn);

            dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                aList = new AddressList();
                while (dr.Read())
                {
                    aList.Add(FillDataRecord(dr));
                }
            }

            cmd.Dispose();
            myConn.CloseDB(conn);
            return aList;
        }


        public static Address FillDataRecord(IDataRecord dr) 
        {
            Address address = new Address();

            address.AddressID = dr.GetInt32(dr.GetOrdinal("AddressID"));
            address.AddressLine1 = dr.GetString(dr.GetOrdinal("AddressLine1"));
            address.AddressLine2 = dr.GetString(dr.GetOrdinal("AddressLine2"));
            address.CityTown = dr.GetString(dr.GetOrdinal("CityTown"));
            address.Province = dr.GetString(dr.GetOrdinal("Province"));
            address.PostalCode = dr.GetString(dr.GetOrdinal("PostalCode"));
            address.Country = dr.GetString(dr.GetOrdinal("Country"));
            address.CreatedDate = dr.GetDateTime(dr.GetOrdinal("CreatedDate"));
            address.ModifiedDate = dr.GetDateTime(dr.GetOrdinal("ModifiedDate"));
            address.CreatedBy = dr.GetString(dr.GetOrdinal("CreatedBy"));
            address.ModifiedBy = dr.GetString(dr.GetOrdinal("ModifiedBy"));
            return address;
        }

        

    }
}

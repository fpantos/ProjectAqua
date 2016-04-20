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
    public class EmployeeAddressDB
    {



        public static int AddEmployeeAddress(EmployeeAddress newEmployeeAddress)
        {

            int result;
            MyDBConnection dbconn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            try
            {

                conn = dbconn.OpenDB();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.AddEmployeeAddress";

                cmd.Parameters.Add("@EmployeeID", SqlDbType.Int).Value = newEmployeeAddress.EmployeeID;
                cmd.Parameters.Add("@AddressID", SqlDbType.Int).Value = newEmployeeAddress.AddressID;
                cmd.Parameters.Add("@AddressType", SqlDbType.Int).Value = newEmployeeAddress.AddressType;
                cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = newEmployeeAddress.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = newEmployeeAddress.ModifiedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = newEmployeeAddress.CreatedBy;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = newEmployeeAddress.ModifiedBy;


                result = cmd.ExecuteNonQuery();

            }
            finally
            {
                cmd.Dispose();
                dbconn.CloseDB(conn);

            }

            return result;
        }

        public static int GetAddressID(int addressType, int id)
        {
            int addressID = 0;
            EmployeeAddress employeeAddress = new EmployeeAddress();
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select addressid from AquaOne.dbo.EmployeeAddress where EmployeeID = @EmployeeID and AddressType = @AddressType";
            // Open the connection
            try
            {
                conn = myConn.OpenDB();
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add("@EmployeeID", SqlDbType.Int).Value = id;
                cmd.Parameters.Add("@AddressType", SqlDbType.Int).Value = addressType;
                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    addressID = dr.GetInt32(0);
                    //  accountAddress = FillDataRecord(dr);
                }
            }
            finally
            {
                cmd.Dispose();
                //close the connection
                myConn.CloseDB(conn);
            }
            return addressID;

        }

        private static EmployeeAddress FillDataRecord(IDataRecord dr)
        {
            EmployeeAddress employeeAddress = new EmployeeAddress();
            employeeAddress.AddressID = dr.GetInt32(dr.GetOrdinal("AddressID"));
            employeeAddress.EmployeeID = dr.GetInt32(dr.GetOrdinal("EmployeeID"));
            employeeAddress.AddressType = dr.GetInt32(dr.GetOrdinal("AddressType"));

            return employeeAddress;

        }


    }
}

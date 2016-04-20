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
    public class SalesReportDB
    {


        public static DataTable GetSalesByDateRange(string fromMonth, string fromYear, string toMonth, string toYear)
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
                cmd.CommandText = "dbo.[GetSalesByCriteria]";

                cmd.Parameters.Add("@fromMonth", SqlDbType.VarChar).Value = fromMonth;
                cmd.Parameters.Add("@fromYear", SqlDbType.VarChar).Value = fromYear;
                cmd.Parameters.Add("@toMonth", SqlDbType.VarChar).Value = toMonth;
                cmd.Parameters.Add("@toYear", SqlDbType.VarChar).Value = toYear;


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


        public static DataTable GetYTDSales()
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
                cmd.CommandText = "dbo.[GetSalesYTD]";


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

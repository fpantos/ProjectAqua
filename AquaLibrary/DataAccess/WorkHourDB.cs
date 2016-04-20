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
    public class WorkHourDB
    {


        public static DataTable GetWorkHours()
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

                cmd.CommandText = "Select convert(varchar,[24Hr],100) as time from workhour";
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


        public static List<string> GetWorkHoursList()
        {
            List<string> workHourList = new List<string>();
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr = null;
            SqlCommand cmd = new SqlCommand(); ;

            try
            {
                conn = myConn.OpenDB();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;

                cmd.CommandText = "Select convert(varchar,[24Hr],100) as time from workhour";
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        workHourList.Add(dr.GetString(0));
                    }
                }
                cmd.Dispose();
                dr.Close();
            }
            finally
            {
                myConn.CloseDB(conn);
            }


            return workHourList;
        }
    }
}

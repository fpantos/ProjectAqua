using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessObject.Collections;
using System.Data.SqlClient;
using System.Data;

namespace AquaLibrary.DataAccess
{
    public class WaterUsageDB
    {
        public static DataTable GetUsagePerHour()
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
                cmd.CommandText = "dbo.GetWaterUsagePerHourCurrentDay";

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

        public static  WaterUsageList GetList()
        {

            WaterUsageList wList = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd =  new SqlCommand();
            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.GetWaterUsagePerHourCurrentDay";

                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.HasRows)
                {
                    wList = new  WaterUsageList();
                    while (dr.Read())
                    {
                        wList.Add(FillDataRecord(dr));
                    }
                }

                cmd.Dispose();
                dr.Close();

            }
            finally
            {
                myConn.CloseDB(conn);
            }

            return wList;
        }

        private static  WaterUsage FillDataRecord(IDataRecord dr)
        {
            WaterUsage w = new  WaterUsage();
            w.TotalGallonsPerHour = dr.GetDecimal(dr.GetOrdinal("TotalUsGallonsPerHour"));
            w.TotalLitresPerHour = dr.GetInt32(dr.GetOrdinal("TotalLitersPerHour"));
            w.TimeOfDay = dr.GetInt32(dr.GetOrdinal("HourTaken"));             
     
            return w;

        }
    }
}

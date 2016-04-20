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
    public class ServiceWorkDB 
    {
        public static int Save(ServiceWork servWork)
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
                cmd.CommandText = "dbo.[InsertUpdateServiceWork]";

                if (servWork.ServiceWorkID == -1)
                {
                    cmd.Parameters.Add("@ServiceWorkID", SqlDbType.Int).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@ServiceWorkID", SqlDbType.Int).Value = servWork.ServiceWorkID;
                }
                cmd.Parameters.Add("@AccountID", SqlDbType.Int).Value = servWork.AccountID;
                //cmd.Parameters.Add("@ServiceStatus", SqlDbType.VarChar).Value = servWork.ServiceStatus;
                cmd.Parameters.Add("@ServiceDate", SqlDbType.DateTime).Value = servWork.ServiceDate;
                cmd.Parameters.Add("@ServiceStartTime", SqlDbType.Time).Value = new TimeSpan(servWork.ServiceStartTime.Hour, servWork.ServiceStartTime.Minute, 0);
                cmd.Parameters.Add("@ServiceEndTime", SqlDbType.Time).Value = new TimeSpan(servWork.ServiceEndTime.Hour, servWork.ServiceEndTime.Minute, 0);
                cmd.Parameters.Add("@Technician", SqlDbType.VarChar).Value = servWork.Technician;
                cmd.Parameters.Add("@InvoiceID", SqlDbType.Int).Value = servWork.InvoiceID;
                cmd.Parameters.Add("@SubTotal", SqlDbType.Decimal).Value = servWork.SubTotal;
                cmd.Parameters.Add("@TaxCharged", SqlDbType.Decimal).Value = servWork.TaxCharged;

                cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = servWork.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = servWork.ModifiedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = servWork.CreatedBy;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = servWork.ModifiedBy;

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

        public static DataTable GetServiceWorkDetailsByID(int serviceWorkID)
        {

            DataTable dt = new DataTable();
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.[GetServiceWorkDetailsByID]";

                cmd.Parameters.Add("@serviceWorkID",SqlDbType.Int).Value = serviceWorkID;
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

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
        
        public static ServiceWorkList GetListByAccountID(int accountID)
        {
            ServiceWorkList aList = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.ServiceWork where accountID = @accountID";
            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add("@accountID", SqlDbType.Int).Value = accountID;

                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.HasRows)
                {
                    aList = new  ServiceWorkList();
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

        public static ServiceWorkList GetListByDate(DateTime theDate)
        {
            ServiceWorkList aList = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.serviceWork where serviceDate = @ServiceDate";
            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add("@ServiceDate", SqlDbType.DateTime).Value = theDate;

                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.HasRows)
                {
                    aList = new ServiceWorkList();
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

        public static ServiceWorkList GetListByDate(DateTime theDate, string startTime)
        {
            ServiceWorkList aList = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            //string sql = "Select * from AquaOne.dbo.ServiceWork where serviceDate = @ServiceDate and serviceStartTime > @ServiceStartTime ";
            string sql = "Select * from AquaOne.dbo.ServiceWork where serviceDate = @ServiceDate and serviceStartTime > @ServiceStartTime order by serviceStartTime";
            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add("@ServiceDate", SqlDbType.DateTime).Value = theDate.Date;
                DateTime serviceStartTime = Convert.ToDateTime(startTime);
                cmd.Parameters.Add("@ServiceStartTime", SqlDbType.Time).Value = new TimeSpan(serviceStartTime.Hour, serviceStartTime.Minute, 0);

                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.HasRows)
                {
                    aList = new ServiceWorkList();
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

        public static DataTable GetTopTenServiceWorkFromToday() 
        {

            DataTable dt =  new DataTable();
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.[GetTopTenServiceWorkFromToday]";
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

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

        private static  ServiceWork FillDataRecord(IDataRecord dr)
        {
             ServiceWork servWork = new  ServiceWork();

             servWork.ServiceWorkID = dr.GetInt32(dr.GetOrdinal("serviceworkID"));
             servWork.AccountID = dr.GetInt32(dr.GetOrdinal("AccountID"));
             servWork.InvoiceID = dr.GetInt32(dr.GetOrdinal("invoiceID"));
             //servWork.ServiceStatus = dr.GetString(dr.GetOrdinal("ServiceStatus"));
             servWork.ServiceDate = dr.GetDateTime(dr.GetOrdinal("ServiceDate"));
            //use dr.getvalue
             servWork.ServiceStartTime = Convert.ToDateTime(dr.GetValue(dr.GetOrdinal("ServiceStartTime")).ToString()); // dr.GetValue(dr.GetOrdinal("ServiceStartTime")) ;//dr.GetDateTime(dr.GetOrdinal("ServiceStartTime")).ToShortTimeString();
             servWork.ServiceEndTime = Convert.ToDateTime(dr.GetValue(dr.GetOrdinal("ServiceEndTime")).ToString()); //Convert.ToDateTime( dr.GetValue(dr.GetOrdinal("ServiceEndTime")).ToString()).ToShortTimeString().Replace(" ","");//dr.GetDateTime(dr.GetOrdinal("ServiceEndTime")).ToShortTimeString() ;
             servWork.Technician = dr.GetString(dr.GetOrdinal("Technician"));

             return servWork;
        }
        
    }


}

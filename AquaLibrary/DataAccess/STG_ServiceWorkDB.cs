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
    public class STG_ServiceWorkDB
    {

        public STG_ServiceWorkDB() { }

        public static int Save(STG_ServiceWork stg_servWork)
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
                cmd.CommandText = "dbo.[InsertUpdateSTG_serviceWork]";

                if (stg_servWork.STG_servID == -1)
                {
                    cmd.Parameters.Add("@STG_servID", SqlDbType.Int).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@STG_servID", SqlDbType.Int).Value = stg_servWork.STG_servID;
                }
                cmd.Parameters.Add("@AccountID",SqlDbType.Int).Value =  stg_servWork.AccountID;
                cmd.Parameters.Add("@ServiceStatus", SqlDbType.VarChar).Value = stg_servWork.ServiceStatus;
                cmd.Parameters.Add("@ServiceDate", SqlDbType.DateTime).Value = stg_servWork.ServiceDate;
                cmd.Parameters.Add("@ServiceStartTime", SqlDbType.Time).Value = new TimeSpan(stg_servWork.ServiceStartTime.Hour, stg_servWork.ServiceStartTime.Minute, 0);
                cmd.Parameters.Add("@ServiceEndTime", SqlDbType.Time).Value = new TimeSpan(stg_servWork.ServiceEndTime.Hour, stg_servWork.ServiceEndTime.Minute, 0); 
                cmd.Parameters.Add("@Technician", SqlDbType.VarChar).Value = stg_servWork.Technician;
                cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = stg_servWork.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = stg_servWork.ModifiedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = stg_servWork.CreatedBy;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = stg_servWork.ModifiedBy;

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

        public static int Delete(int stg_servID) 
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
                cmd.CommandText = "dbo.[DeleteSTG_ServiceWork]";
                cmd.Parameters.Add("@STG_servID", SqlDbType.Int).Value = stg_servID;

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

        public static STG_ServiceWorkList GetListByAccountID(int accountID)
        {
            STG_ServiceWorkList aList = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.STG_ServiceWork where accountID = @accountID";
            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add("@accountID", SqlDbType.Int).Value =  accountID   ;

                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.HasRows)
                {
                    aList = new STG_ServiceWorkList();
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

        public static STG_ServiceWorkList GetListByDate(DateTime theDate)
        {
            STG_ServiceWorkList aList = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.STG_serviceWork where serviceDate = @ServiceDate";
            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add("@ServiceDate", SqlDbType.DateTime).Value = theDate;

                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.HasRows)
                {
                    aList = new STG_ServiceWorkList();
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

        public static STG_ServiceWorkList GetListByDate(DateTime theDate, string startTime)
        {
            STG_ServiceWorkList aList = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.STG_ServiceWork where serviceDate = @ServiceDate and serviceStartTime > @ServiceStartTime";
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
                    aList = new STG_ServiceWorkList();
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

        private static STG_ServiceWork FillDataRecord(IDataRecord dr)
        {
            STG_ServiceWork stg_servWork = new STG_ServiceWork();

            stg_servWork.STG_servID = dr.GetInt32(dr.GetOrdinal("STG_ServID"));
            stg_servWork.AccountID =   dr.GetInt32( dr.GetOrdinal("AccountID"));
            stg_servWork.ServiceStatus = dr.GetString(dr.GetOrdinal("ServiceStatus"));
            stg_servWork.ServiceDate = dr.GetDateTime(dr.GetOrdinal("ServiceDate"));
            //use dr.getvalue
            stg_servWork.ServiceStartTime = Convert.ToDateTime(dr.GetValue(dr.GetOrdinal("ServiceStartTime")).ToString() ); // dr.GetValue(dr.GetOrdinal("ServiceStartTime")) ;//dr.GetDateTime(dr.GetOrdinal("ServiceStartTime")).ToShortTimeString();
            stg_servWork.ServiceEndTime = Convert.ToDateTime(dr.GetValue(dr.GetOrdinal("ServiceEndTime")).ToString() ); //Convert.ToDateTime( dr.GetValue(dr.GetOrdinal("ServiceEndTime")).ToString()).ToShortTimeString().Replace(" ","");//dr.GetDateTime(dr.GetOrdinal("ServiceEndTime")).ToShortTimeString() ;
            stg_servWork.Technician = dr.GetString(dr.GetOrdinal("Technician"));

            return stg_servWork;
        }



    }
}

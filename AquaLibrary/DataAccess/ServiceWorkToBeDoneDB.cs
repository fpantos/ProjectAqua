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
   public class ServiceWorkToBeDoneDB
   {


       public static int Save(ServiceWorkToBeDone sWork)
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
               cmd.CommandText = "dbo.InsertUpdateServiceWorkToBeDone";

               if (sWork.WorkToBeDoneID == -1)
               {
                   cmd.Parameters.Add("@WorkToBeDoneID", SqlDbType.Int).Value = DBNull.Value;
               }
               else
               {
                   cmd.Parameters.Add("@WorkToBeDoneID", SqlDbType.Int).Value = sWork.WorkToBeDoneID;
               }

               cmd.Parameters.Add("@WorkType", SqlDbType.VarChar).Value = sWork.WorkType;
               cmd.Parameters.Add("@WorkCharge", SqlDbType.Decimal).Value = sWork.WorkCharge;
               cmd.Parameters.Add("@WorkNotes", SqlDbType.VarChar).Value = sWork.WorkNotes;
               cmd.Parameters.Add("@ServiceWorkID", SqlDbType.Int).Value = sWork.ServiceWorkID;
               cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = sWork.CreatedDate;
               cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = sWork.ModifiedDate;
               cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = sWork.CreatedBy;
               cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = sWork.ModifiedBy;


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

       public static ServiceWorkToBeDoneList GetListByServiceWorkID(int serviceWorkID)
       {
           ServiceWorkToBeDoneList aList = null;
           MyDBConnection myConn = new MyDBConnection();
           SqlConnection conn = new SqlConnection();
           SqlDataReader dr;
           SqlCommand cmd = null;
           string sql = "Select * from AquaOne.dbo.ServiceWorkToBeDone where serviceWorkID = @serviceWorkID";
           try
           {
               // Open the connection
               conn = myConn.OpenDB();
               cmd = new SqlCommand(sql, conn);
               cmd.Parameters.Add("@serviceWorkID", SqlDbType.Int).Value = serviceWorkID;

               dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

               if (dr.HasRows)
               {
                   aList = new ServiceWorkToBeDoneList();
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

       private static ServiceWorkToBeDone FillDataRecord(IDataRecord dr)
       {
           ServiceWorkToBeDone workToBeDone = new ServiceWorkToBeDone();

           workToBeDone.WorkToBeDoneID = dr.GetInt32(dr.GetOrdinal("WorkToBeDoneID"));
           workToBeDone.WorkType = dr.GetString(dr.GetOrdinal("WorkType"));
           workToBeDone.WorkCharge =   Convert.ToDouble( dr.GetDecimal(dr.GetOrdinal("WorkCharge")));
           workToBeDone.WorkNotes = dr.GetString(dr.GetOrdinal("WorkNotes"));
           workToBeDone.ServiceWorkID = dr.GetInt32(dr.GetOrdinal("ServiceWorkID"));
           workToBeDone.CreatedDate = dr.GetDateTime(dr.GetOrdinal("CreatedDate"));
           workToBeDone.ModifiedDate = dr.GetDateTime(dr.GetOrdinal("ModifiedDate"));
           workToBeDone.CreatedBy = dr.GetString(dr.GetOrdinal("CreatedBy"));
           workToBeDone.ModifiedBy = dr.GetString(dr.GetOrdinal("ModifiedBy"));

           return workToBeDone;
       }

    }
}

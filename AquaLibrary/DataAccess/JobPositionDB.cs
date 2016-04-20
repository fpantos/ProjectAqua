using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using AquaLibrary.BusinessObject;
using System.Data.Common;

namespace AquaLibrary.DataAccess
{
    public class JobPositionDB
    {
        public static DataTable GetAll()
        {
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr = null;
            SqlCommand cmd = new SqlCommand(); ;

            conn = myConn.OpenDB();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "dbo.GetJobPositions";

            dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            DataTable dt = new DataTable();
            dt.Load(dr);


            return dt;
        }

        public static int DeleteJobPosition(JobPosition jobPosition)
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
                cmd.CommandText = "dbo.DeleteJobPosition";


                cmd.Parameters.Add("@PositionID", SqlDbType.Int).Value = jobPosition.PositionID;

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

        public static int Save(JobPosition job)
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
                cmd.CommandText = "dbo.InsertJobPosition";

                if (job.PositionID == -1)
                {
                    cmd.Parameters.Add("@PositionID", SqlDbType.Int).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@PositionID", SqlDbType.Int).Value = job.PositionID;
                }
                cmd.Parameters.Add("@PositionName", SqlDbType.VarChar).Value = job.PositionName;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = job.CreatedBy;
                cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = job.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = job.ModifiedDate;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = job.ModifiedBy;
                
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

        public static List<int> GetPositionIDsInUse()
        {
            List<int> idList = new List<int>();

            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            
            //get all the position ids from all employees that are currently hired
            string sql = "Select distinct positionID from Employee where isEmployed=1";

            // Open the connection
            conn = myConn.OpenDB();
            cmd = new SqlCommand(sql, conn);

            dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                
                while (dr.Read())
                {
                    idList.Add(dr.GetInt32(0));
                }
            }

            cmd.Dispose();
            myConn.CloseDB(conn);


            return idList;
        
        }

        public static List<String> GetPositionNames()
        {
            List<String> positionNamesList = new List<String>();

            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;

            //get all the position ids from all employees that are currently hired
            string sql = "Select  positionName from JobPosition";

            // Open the connection
            conn = myConn.OpenDB();
            cmd = new SqlCommand(sql, conn);

            dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {

                while (dr.Read())
                {
                    positionNamesList.Add(dr.GetString(0).ToLower() );
                }
            }

            cmd.Dispose();
            myConn.CloseDB(conn);


            return positionNamesList;

        }

        public static JobPosition GetPositionByID(int id)
        {
            JobPosition position = new JobPosition();
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.JobPosition where PositionID = @PositionID";
            // Open the connection
            conn = myConn.OpenDB();
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add("@PositionID", SqlDbType.Int).Value = id;
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                position = FillDataRecord(dr);
            }
            cmd.Dispose();
            //close the connection
            myConn.CloseDB(conn);
            return position;
        }

        private static JobPosition FillDataRecord(IDataRecord dr)
        {
            JobPosition position = new JobPosition();
            position.PositionID = dr.GetInt32(dr.GetOrdinal("PositionID"));
            position.PositionName = dr.GetString(dr.GetOrdinal("PositionName"));

            position.CreatedDate = dr.GetDateTime(dr.GetOrdinal("CreatedDate"));
            position.ModifiedDate = dr.GetDateTime(dr.GetOrdinal("ModifiedDate"));
            position.CreatedBy = dr.GetString(dr.GetOrdinal("CreatedBy"));
            position.ModifiedBy = dr.GetString(dr.GetOrdinal("ModifiedBy"));

            return position;
        }
    }
}

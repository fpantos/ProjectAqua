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
    public class PrepaidBottleTypeDB
    {
        public static int Save( PrepaidBottleType pBType )
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
                cmd.CommandText = "dbo.InsertUpdatePBType";

                if (pBType.TypeID == -1)
                {
                    cmd.Parameters.Add("@TypeID", SqlDbType.Int).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@TypeID", SqlDbType.Int).Value = pBType.TypeID;
                }

                cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = pBType.Name;
                cmd.Parameters.Add("@Description", SqlDbType.VarChar).Value = pBType.Description;
                cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = pBType.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = pBType.ModifiedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = pBType.CreatedBy;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = pBType.ModifiedBy;

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

        public static int GetBottleTypeByName(string name) 
        {
            int bottleType = 0;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select typeid from AquaOne.dbo.PrepaidBottleType where name = @name";

            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = name;
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.Read())
                {
                   bottleType= dr.GetInt32(0) ;
                }

                dr.Close();
                cmd.Dispose();

            }
            finally
            {
                //close the connection
                myConn.CloseDB(conn);
            }

            return  bottleType;
        
        }


        private static PrepaidBottleType FillDataRecord(IDataRecord dr)
        {
            PrepaidBottleType pBType = new PrepaidBottleType();
            pBType.TypeID = dr.GetInt32(dr.GetOrdinal("TypeID"));
            pBType.Name = dr.GetString(dr.GetOrdinal("Name"));
            pBType.Description = dr.GetString(dr.GetOrdinal("Description"));
            pBType.CreatedDate = dr.GetDateTime(dr.GetOrdinal("CreatedDate"));
            pBType.ModifiedDate = dr.GetDateTime(dr.GetOrdinal("ModifiedDate"));
            pBType.CreatedBy = dr.GetString(dr.GetOrdinal("CreatedBy"));
            pBType.ModifiedBy = dr.GetString(dr.GetOrdinal("ModifiedBy"));

            return pBType;

        }

    }
}

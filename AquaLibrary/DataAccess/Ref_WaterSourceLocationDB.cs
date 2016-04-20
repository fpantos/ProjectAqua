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
    public class Ref_WaterSourceLocationDB
    {

        public Ref_WaterSourceLocationDB() { }

        public static string GetDescriptionByID(int locationID) 
        {
            string description = "";
            AccountAddress accountAddress = new AccountAddress();
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select description from AquaOne.dbo.Ref_WaterSourceLocation where LocationID = @LocationID";
            // Open the connection
            conn = myConn.OpenDB();
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add("@LocationID", SqlDbType.Int).Value = locationID;
  
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                description = dr.GetString(0);
            }
            cmd.Dispose();
            //close the connection
            myConn.CloseDB(conn);
            return description;
 
        }

        /// <summary>
        /// helper method
        /// </summary>
        /// <param name="dr"></param>
        /// <returns></returns>
        private static Ref_WaterSourceLocation FillDataRecord(IDataRecord dr)
        {
            Ref_WaterSourceLocation waterSourceLoc = new Ref_WaterSourceLocation();
            waterSourceLoc.LocationID = dr.GetInt32(dr.GetOrdinal("LocationID"));
            waterSourceLoc.Description = dr.GetString(dr.GetOrdinal("Description"));
            waterSourceLoc.CreatedDate = dr.GetDateTime(dr.GetOrdinal("CreatedDate"));
            waterSourceLoc.ModifiedDate = dr.GetDateTime(dr.GetOrdinal("ModifiedDate"));
            waterSourceLoc.CreatedBy = dr.GetString(dr.GetOrdinal("CreatedBy"));
            waterSourceLoc.ModifiedBy = dr.GetString(dr.GetOrdinal("ModifiedBy"));

            
            return waterSourceLoc;

        }


    }



}

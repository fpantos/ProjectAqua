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
    public class WaterAnalysisDB
    {
        public WaterAnalysisDB() { }

        public static int Save(WaterAnalysis waterAnalysis)
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
                cmd.CommandText = "dbo.InsertUpdateWaterAnalysis";

                if (waterAnalysis.ReportID == -1)
                {
                    cmd.Parameters.Add("@ReportID", SqlDbType.Int).Value = DBNull.Value;
                }
                else
                {               
                    cmd.Parameters.Add("@ReportID", SqlDbType.Int).Value = waterAnalysis.ReportID;
                }

                cmd.Parameters.Add("@Hardness", SqlDbType.Decimal).Value = waterAnalysis.Hardness;
                cmd.Parameters.Add("@ClearIron", SqlDbType.Decimal).Value = waterAnalysis.ClearIron;
                cmd.Parameters.Add("@PH_Acid", SqlDbType.Decimal).Value = waterAnalysis.PH_Acid;
                cmd.Parameters.Add("@HydrogenSulfide", SqlDbType.Decimal).Value = waterAnalysis.HydrogenSulfide;
                cmd.Parameters.Add("@TDS", SqlDbType.Decimal).Value = waterAnalysis.TDS;            
                cmd.Parameters.Add("@AccountID", SqlDbType.Int).Value = waterAnalysis.AccountID;
                cmd.Parameters.Add("@Notes", SqlDbType.VarChar).Value = waterAnalysis.Notes;
                cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = waterAnalysis.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = waterAnalysis.ModifiedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = waterAnalysis.CreatedBy;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = waterAnalysis.ModifiedBy;


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

        public static WaterAnalysis GetWaterAnalysisByReportID(int id)
        {
            WaterAnalysis waterAnalysis = new WaterAnalysis();
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.WaterAnalysis where ReportID = @ReportID";
            // Open the connection
            conn = myConn.OpenDB();
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add("@ReportID", SqlDbType.Int).Value = id;
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                waterAnalysis = FillDataRecord(dr);
            }
            cmd.Dispose();
            //close the connection
            myConn.CloseDB(conn);
            return waterAnalysis;
        }

        public static WaterAnalysisList GetListByAccountID(int accountID)
        {

            WaterAnalysisList aList = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.WaterAnalysis where AccountID = @accountID";

            // Open the connection
            conn = myConn.OpenDB();
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add("@AccountID",SqlDbType.Int).Value = accountID;

            dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                aList = new WaterAnalysisList();
                while (dr.Read())
                {
                    aList.Add(FillDataRecord(dr));
                }
            }

            cmd.Dispose();
            myConn.CloseDB(conn);
            return aList;
        }

        /// <summary>
        /// helper method
        /// </summary>
        /// <param name="dr"></param>
        /// <returns></returns>
        private static WaterAnalysis FillDataRecord(IDataRecord dr)
        {
            WaterAnalysis waterAnalysis = new WaterAnalysis();
            waterAnalysis.ReportID = dr.GetInt32(dr.GetOrdinal("ReportID"));
            waterAnalysis.Hardness = dr.GetDecimal(dr.GetOrdinal("Hardness"));
            waterAnalysis.ClearIron = dr.GetDecimal(dr.GetOrdinal("ClearIron"));
            waterAnalysis.PH_Acid = dr.GetDecimal(dr.GetOrdinal("PH_Acid"));
            waterAnalysis.HydrogenSulfide = dr.GetDecimal(dr.GetOrdinal("HydrogenSulfide"));
            waterAnalysis.TDS = dr.GetDecimal(dr.GetOrdinal("TDS"));
            waterAnalysis.Notes = dr.GetString(dr.GetOrdinal("Notes"));
            waterAnalysis.AccountID = dr.GetInt32(dr.GetOrdinal("AccountID"));
            waterAnalysis.CreatedDate = dr.GetDateTime(dr.GetOrdinal("CreatedDate"));
            waterAnalysis.ModifiedDate = dr.GetDateTime(dr.GetOrdinal("ModifiedDate"));
            waterAnalysis.CreatedBy = dr.GetString(dr.GetOrdinal("CreatedBy"));
            waterAnalysis.ModifiedBy = dr.GetString(dr.GetOrdinal("ModifiedBy"));




            return waterAnalysis;

        }

    }
}

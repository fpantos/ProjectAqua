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
    public class WTEDB
    {
        public static int Save(WaterTreatmentEquipment wTEquipment)
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
                cmd.CommandText = "dbo.InsertUpdateWTE";

                if (wTEquipment.WTE_ID == -1)
                {
                    cmd.Parameters.Add("@WTEID", SqlDbType.Int).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@WTEID", SqlDbType.Int).Value = wTEquipment.WTE_ID;
                }

                cmd.Parameters.Add("@AccountID", SqlDbType.Int).Value = wTEquipment.AccountID;
                cmd.Parameters.Add("@Description", SqlDbType.VarChar).Value = wTEquipment.Description;
                cmd.Parameters.Add("@ProductCode", SqlDbType.VarChar).Value = wTEquipment.ProductCode;
                cmd.Parameters.Add("@Manufacturer", SqlDbType.VarChar).Value = wTEquipment.Manufacturer;
                cmd.Parameters.Add("@DateObtained", SqlDbType.DateTime).Value = wTEquipment.DateObtained;
                cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = wTEquipment.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = wTEquipment.ModifiedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = wTEquipment.CreatedBy;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = wTEquipment.ModifiedBy;
       

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

        public static int DeleteWTEByID(int wteID)
        {
            int result;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();

            try
            {
                conn = myConn.OpenDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "Delete from Aquaone.dbo.WaterTreatmentEquipment where wte_id=@wteID";
                cmd.Parameters.Add("@wteID", SqlDbType.Int).Value = wteID;

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


        public static WaterTreatmentEquipmentList GetList( int accountID)
        {

            WaterTreatmentEquipmentList aList = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.WaterTreatmentEquipment where accountID = @accountID";
            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add("@accountID", SqlDbType.Int).Value = accountID;
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.HasRows)
                {
                    aList = new WaterTreatmentEquipmentList();
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

        public static  WaterTreatmentEquipment GetByWTEID(int wte_id)
        {
            
            WaterTreatmentEquipment wte = new WaterTreatmentEquipment();
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.WaterTreatmentEquipment where wte_id = @wte_id";

            try
            {
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add("@wte_id", SqlDbType.Int).Value = wte_id;
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.Read())
                {
                    wte = FillDataRecord(dr);
                }

                dr.Close();
                cmd.Dispose();

            }
            finally
            {
                //close the connection
                myConn.CloseDB(conn);
            }

            return wte;
        }

        private static  WaterTreatmentEquipment FillDataRecord(IDataRecord dr)
        {
            WaterTreatmentEquipment wTEquipment = new WaterTreatmentEquipment();
            wTEquipment.WTE_ID = dr.GetInt32(dr.GetOrdinal("WTE_ID"));
            wTEquipment.AccountID = dr.GetInt32(dr.GetOrdinal("AccountID"));
            wTEquipment.Description = dr.GetString(dr.GetOrdinal("Description"));
            wTEquipment.ProductCode = dr.GetString(dr.GetOrdinal("ProductCode"));
            if (!dr.IsDBNull(dr.GetOrdinal("ProductCode")))
            {
                wTEquipment.ProductCode = dr.GetString(dr.GetOrdinal("ProductCode"));
            }

            
            wTEquipment.Manufacturer = dr.GetString(dr.GetOrdinal("Manufacturer"));
            wTEquipment.DateObtained = dr.GetDateTime(dr.GetOrdinal("DateObtained"));
            wTEquipment.CreatedDate = dr.GetDateTime(dr.GetOrdinal("CreatedDate"));
            wTEquipment.ModifiedDate = dr.GetDateTime(dr.GetOrdinal("ModifiedDate"));
            wTEquipment.CreatedBy = dr.GetString(dr.GetOrdinal("CreatedBy"));
            wTEquipment.ModifiedBy = dr.GetString(dr.GetOrdinal("ModifiedBy"));

            return wTEquipment;

        }



    }
}

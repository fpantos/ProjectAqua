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
    public class InvoiceDB
    {

        public static int Save( Invoice  invoice)
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
                cmd.CommandText = "dbo.InsertUpdateInvoice";

                if (invoice.InvoiceID == -1)
                {
                    cmd.Parameters.Add("@InvoiceID", SqlDbType.Int).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@InvoiceID", SqlDbType.Int).Value = invoice.InvoiceID;
                }

                cmd.Parameters.Add("@InvoiceDate", SqlDbType.DateTime).Value = invoice.InvoiceDate;

                if (invoice.AccountID == -1)
                {
                    cmd.Parameters.Add("@AccountID", SqlDbType.Int).Value = DBNull.Value;
                }
                else {

                    cmd.Parameters.Add("@AccountID", SqlDbType.Int).Value = invoice.AccountID;
                }


                cmd.Parameters.Add("@SubTotal", SqlDbType.Decimal).Value = invoice.SubTotal;
                cmd.Parameters.Add("@TotalTaxCharged", SqlDbType.Decimal).Value = invoice.TotalTaxCharged;
                cmd.Parameters.Add("@TotalAmount", SqlDbType.Decimal).Value = invoice.TotalAmount;
                cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = invoice.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = invoice.ModifiedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = invoice.CreatedBy;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = invoice.ModifiedBy;
                cmd.Parameters.Add("@Notes", SqlDbType.VarChar).Value = invoice.Notes;

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



        private static Invoice FillDataRecord(IDataRecord dr)
        {
            Invoice invoice = new  Invoice();
            invoice.InvoiceID = dr.GetInt32(dr.GetOrdinal("InvoiceID"));
            invoice.InvoiceDate = dr.GetDateTime(dr.GetOrdinal("InvoiceDate"));
            invoice.SubTotal = Convert.ToDouble((dr.GetOrdinal("SubTotal") ));
            invoice.TotalTaxCharged = Convert.ToDouble( dr.GetOrdinal("TotalTaxCharged"));
            invoice.TotalAmount = Convert.ToDouble(dr.GetOrdinal("TotalAmount"));
            invoice.AccountID = dr.GetInt32(dr.GetOrdinal("AccountID"));
            invoice.Notes = dr.GetString(dr.GetOrdinal("Notes"));
            invoice.CreatedDate = dr.GetDateTime(dr.GetOrdinal("CreatedDate"));
            invoice.ModifiedDate = dr.GetDateTime(dr.GetOrdinal("ModifiedDate"));
            invoice.CreatedBy = dr.GetString(dr.GetOrdinal("CreatedBy"));
            invoice.ModifiedBy = dr.GetString(dr.GetOrdinal("ModifiedBy"));

            return invoice;

        }

        public static DataTable GetInvoiceByID(int invoiceID)
        {
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr = null;
            SqlCommand cmd = new SqlCommand();
            DataTable dt = new DataTable();

            try
            {

                conn = myConn.OpenDB();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.[GetInvoiceByID]";

                cmd.Parameters.Add("@InvoiceID", SqlDbType.Int).Value = invoiceID;

                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                dt.Load(dr);


            }
            finally
            {
                cmd.Dispose();
                dr.Close();
                myConn.CloseDB(conn);
            }

            return dt;

        }

        internal static DataTable GetInvoiceBySearchCriteria(string searchBy, string searchString)
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
                cmd.CommandText = "dbo.getInvoiceBySearchCriteria";


                cmd.Parameters.Add("@SearchCriteria", SqlDbType.VarChar).Value = searchBy;
                cmd.Parameters.Add("@Input", SqlDbType.VarChar).Value = searchString;

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


    }
}

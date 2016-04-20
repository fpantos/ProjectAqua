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
    public class InvoiceLineItemDB
    {
        public static int Save( InvoiceLineItem invoiceLineItem)
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
                cmd.CommandText = "dbo.[InsertInvoiceLineItem]";

                cmd.Parameters.Add("@InvoiceID", SqlDbType.Int).Value = invoiceLineItem.InvoiceID;
                cmd.Parameters.Add("@ProductID", SqlDbType.Int).Value = invoiceLineItem.ProductID;
                cmd.Parameters.Add("@Quantity", SqlDbType.Int).Value = invoiceLineItem.Quantity;
                cmd.Parameters.Add("@UnitPriceCharged", SqlDbType.Decimal ).Value = invoiceLineItem.UnitPriceCharged;
                cmd.Parameters.Add("@TaxCharged", SqlDbType.Decimal).Value = invoiceLineItem.TaxCharged;
                cmd.Parameters.Add("@ItemTotal", SqlDbType.Decimal).Value = invoiceLineItem.ItemTotal;
                cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = invoiceLineItem.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = invoiceLineItem.ModifiedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = invoiceLineItem.CreatedBy;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = invoiceLineItem.ModifiedBy;

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

    }
}

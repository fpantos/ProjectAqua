using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AquaLibrary.BusinessObject.Collections;

namespace AquaLibrary.BusinessObject
{
    public class Invoice : RecordLogger
    {
        public Invoice()
        {
            InvoiceID = -1;
            InvoiceDate = DateTime.Now.ToLocalTime();
            AccountID = -1;
            SubTotal = 0;
            TotalTaxCharged = 0;
            TotalAmount = 0;
        }

        public int InvoiceID { get; set; }
        public DateTime InvoiceDate { get; set; }
        public int? AccountID { get; set; }
        public double SubTotal { get; set; }
        public double TotalTaxCharged { get; set; }
        public double TotalAmount { get ; set ; }

        public static double CalculateSubTotal(InvoiceLineItemList lineItems)
        {
            double subTotal = 0;
            foreach (InvoiceLineItem item in lineItems)
            {
                subTotal += item.ItemTotal;
            }

            return subTotal;
        }

        public static double CalculateTotalTaxes(InvoiceLineItemList lineItems)
        {
            double totalTaxes = 0;
            foreach (InvoiceLineItem item in lineItems)
            {
                totalTaxes += item.TaxCharged;
            }
            return totalTaxes;
        }



    }
}

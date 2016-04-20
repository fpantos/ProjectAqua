using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.BusinessObject
{
    public class InvoiceLineItem : RecordLogger
    {
        public InvoiceLineItem()
        {
            InvoiceID = -1;
            ProductID = -1;
            ProductDescription = "";
            ProductCode = "";
            Quantity = 1;
            UnitPriceCharged = 0;

        }

        public int InvoiceID { get; set; }
        public int ProductID { get; set; }
        public string ProductDescription { get; set; }
        public string ProductCode { get; set; }
        public bool IsTaxExempt { get; set; }
        public int Quantity { get; set; }
        public double UnitPriceCharged { get; set; }
        public double TaxCharged { get; set; }
        public double ItemTotal { get { return Quantity * UnitPriceCharged; } }

        public double CalculateTaxCharged(double taxAmount)     
        {
             double val = 0;
             if (this.IsTaxExempt==false)
             {
                 val = taxAmount * ItemTotal;
             }
             else 
             {
                 val = 0;
             }
           
            return val;
        }

    }
}

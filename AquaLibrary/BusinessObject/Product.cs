using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.BusinessObject
{
    public class Product : RecordLogger
    {
        public Product()
        {
            ProductID = -1;
            ProductCode = "";
            ProductDescription = "";
            ProductCategory = "";
            UnitCost = 0;
            UnitPrice = 0;
            UnitsOnHand = null;
            ReorderLevel = null;
            ManufacturerName = "";
            ItemUrl = "";
            IsSubProduct = false;
            IsDiscontinued = false;
            IsTaxExempt = false;
        }

        public int ProductID { get; set; }
        public string ProductCode { get; set; }
        public string ProductDescription { get; set; }
        public string ProductCategory { get; set; }
        public double UnitCost { get; set; }
        public double UnitPrice { get; set; }
        public int? UnitsOnHand { get; set; }
        public int? ReorderLevel { get; set; }
        public String ManufacturerName { get; set; }
        public String ItemUrl { get; set; }
        public bool IsDiscontinued { get; set; }
        public bool IsSubProduct { get; set; }
        public bool IsTaxExempt { get; set; }
        public int TopUpQty { get; set; }

    }
}

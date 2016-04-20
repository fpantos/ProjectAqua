using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.BusinessObject
{
    public class ProductPartReplacement : RecordLogger
    {
        public int ProductID { get; set; }
        public int SubProductID { get; set; }

    }
}
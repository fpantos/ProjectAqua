using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.BusinessObject
{
    public class Ref_ProductCategory : RecordLogger
    {
        public Ref_ProductCategory()
        {
            CategoryID = -1;
            CategoryName = "";
            Description = "";

    
    }
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }
        public string Description { get; set; }
    }
}

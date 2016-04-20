using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.BusinessObject
{
    public class WaterAnalysis : RecordLogger
    {
        public WaterAnalysis() 
        {
            ReportID = -1;
            Hardness = 0;
            ClearIron = 0;
            PH_Acid = 0;
            HydrogenSulfide = 0;
            TDS = 0;
            Notes = "";
            AccountID = 0;

            
        }

        public int ReportID { get; set; }
        public decimal  Hardness { get; set; }
        public decimal ClearIron { get; set; }
        public decimal PH_Acid { get; set; }
        public decimal HydrogenSulfide { get; set; }
        public decimal TDS { get; set; }
        public int AccountID { get; set; }





    }
}

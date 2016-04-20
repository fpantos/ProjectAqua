using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.BusinessObject
{
    public class WaterUsage
    {
        public int TimeOfDay { get; set; }
        public int TotalLitresPerHour { get; set; }
        public decimal TotalGallonsPerHour { get; set; }
        public string  UsageDate { get; set; }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.BusinessObject
{
    public class Ref_WaterSourceLocation :RecordLogger
    {
        public Ref_WaterSourceLocation() { }

        public int LocationID { get; set; }
        public string Description { get; set; }
    }
}

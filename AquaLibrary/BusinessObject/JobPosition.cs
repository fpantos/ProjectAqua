using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.BusinessObject
{
    public class JobPosition : RecordLogger
    {
        public JobPosition()
        {
            PositionID = -1;
            PositionName = "";
        }

        public int PositionID { get; set; }
        public string PositionName { get; set; }
    }
}

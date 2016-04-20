using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.BusinessObject
{
    public class PrepaidBottleType : RecordLogger
    {

        public int TypeID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

    }
}

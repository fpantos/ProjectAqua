using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.BusinessObject
{
    public class EmployeeAddress:RecordLogger
    {
        public int AddressID { get; set; }
        public int EmployeeID { get; set; }
        public int AddressType { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.BusinessObject
{
    public class RecordLogger
    {

        public RecordLogger()
        {
            CreatedDate = DateTime.Now.ToLocalTime();
            ModifiedDate = DateTime.Now.ToLocalTime();
            CreatedBy = "";
            ModifiedBy = "";
            Notes = "";
        }

        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string CreatedBy { get; set; }
        public string ModifiedBy { get; set; }
        public string Notes { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.BusinessObject
{
    public class ServiceWorkToBeDone : RecordLogger
    {
        public ServiceWorkToBeDone() 
        {
            WorkToBeDoneID = -1;
            WorkType = "";
            WorkCharge = 0;
            WorkNotes = "";
        }
        
        public int WorkToBeDoneID { get; set; }
        public string WorkType { get; set; }
        public double WorkCharge { get; set; }
        public string WorkNotes { get; set; }
        public int ServiceWorkID { get; set; }

    }
}

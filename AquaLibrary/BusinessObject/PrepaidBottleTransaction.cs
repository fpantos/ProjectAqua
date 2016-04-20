using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.BusinessObject
{
    public class PrepaidBottleTransaction : RecordLogger
    {
        public PrepaidBottleTransaction() 
        {
            TransactionID = -1;
            TransactionType = "";
            PrepaidBottleID = -1 ;
            LastUpdatedBalance = 0;
            DeductQty = 0;
            TopUpQty = 0;
            LastTransactionDate = DateTime.Now.ToLocalTime();
        }

        public int TransactionID { get; set; }
        public string TransactionType { get; set; }
        public int? PrepaidBottleID { get; set; }
        public int LastUpdatedBalance { get; set; }
        public int DeductQty { get; set; }
        public int TopUpQty { get; set; }
        public DateTime LastTransactionDate { get; set; }


    }
}

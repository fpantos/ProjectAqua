using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.BusinessObject
{
    public class PrepaidBottle : RecordLogger
    {
        public PrepaidBottle() 
        {

            PrepaidBottleID = -1;
            AccountID = -1;
            PrepaidBottleType = -1;
            Balance = 0;

        }

        public int PrepaidBottleID { get; set; }
        public int AccountID { get; set; }
        public int PrepaidBottleType { get; set; }
        public int Balance { get; set; }


        public void TopUpBalance(int qty) 
        {
            Balance += qty;
        }

        public void DeductBalance(int qty) 
        {
            Balance -= qty;
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AquaLibrary.BusinessObject.Collections;

namespace AquaLibrary.BusinessObject
{
    public class AccountAddress : RecordLogger
    {

        public AccountAddress() 
        {            
          

        }

        public int AddressID { get; set; }
        public int AccountID { get; set; }
        public int AddressType { get; set; }

    }
}

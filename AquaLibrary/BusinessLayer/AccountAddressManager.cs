using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using AquaLibrary.DataAccess;
using AquaLibrary.BusinessObject;

namespace AquaLibrary.BusinessLayer
{
    public class AccountAddressManager
    {
        
        public static int AddAccountAddress(AccountAddress newAccountAddress)
        {
            int result;
            result = AccountAddressDB.AddAccountAddress(newAccountAddress);
            return result;            
        }

        public static int GetAddressID(int addressType, int accountID) 
        {
            return AccountAddressDB.GetAddressID(addressType, accountID);
        }
    }
}

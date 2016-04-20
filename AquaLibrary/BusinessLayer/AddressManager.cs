using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using AquaLibrary.DataAccess;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessObject.Collections;

namespace AquaLibrary.BusinessLayer
{
    public class AddressManager
    {

        public static int Save(Address address) 
        {
            return AddressDB.Save(address);
        }

        public static Address GetAddressById(int id) 
        {
            return AddressDB.GetAddressByID(id);
        }

        public static AddressList GetList() 
        {
            return AddressDB.GetList();
        }

        /*
        public static int AddAddress(Address newAddress)
        {
            int result;
            result = AddressDB.AddAddress(newAddress);
            if (result != 0)
            {
                return result;
            }
            else 
            {
                throw new ApplicationException("Error in Adding the address. . . ");
            }

        }

        public int UpdateAccount(Address addressToBeUpdated)
        {
            return AddressDB.UpdateAccount(addressToBeUpdated);
        }*/
    }
}

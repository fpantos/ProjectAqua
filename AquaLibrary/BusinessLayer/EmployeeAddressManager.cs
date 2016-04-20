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
    public class EmployeeAddressManager
    {
        public static int AddEmployeeAddress(EmployeeAddress newEmployeeAddress)
        {
            int result;
            result = EmployeeAddressDB.AddEmployeeAddress(newEmployeeAddress);
            return result;
        }

        public static int GetAddressID(int addressType, int employeeID)
        {
            return EmployeeAddressDB.GetAddressID(addressType, employeeID);
        }
    }
}

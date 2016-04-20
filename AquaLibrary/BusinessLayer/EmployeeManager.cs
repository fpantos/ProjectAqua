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
    public class EmployeeManager
    {
        public static int Save(Employee employee)
        {
            return EmployeeDB.Save(employee);
        }

        public static int DeactivateEmployee(Employee employee)
        {
            return EmployeeDB.DeactivateEmployee(employee);
        }

        public static List<string> GetTechnicians() 
        {
            return EmployeeDB.GetTechnicians();
        }

        public static Employee GetEmployeeByID(int id)
        {
            Employee e = EmployeeDB.GetEmployeeByID(id);

            return e;
        }

        public static EmployeeList GetList()
        {
            return EmployeeDB.GetList();
        }

        public static DataTable GetEmployeeWithAddress()
        {
            return EmployeeDB.GetEmployeeWithAddress();
        }

        public static int Deactivate(Employee employee)
        {
            return EmployeeDB.Deactivate(employee);
        }

        public static int Activate(Employee employee)
        {
            return EmployeeDB.Activate(employee);
        }
    }
}

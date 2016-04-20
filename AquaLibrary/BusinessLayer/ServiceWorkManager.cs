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
    public class ServiceWorkManager
    {
        public static int Save(ServiceWork servWork)
        {
            return ServiceWorkDB.Save(servWork);
        }

        public static DataTable GetServiceWorkDetailsByID(int serviceWorkID)
        {
            return ServiceWorkDB.GetServiceWorkDetailsByID(serviceWorkID);
        }


        public static ServiceWorkList GetListByAccountID(int accountID)
        {
            return ServiceWorkDB.GetListByAccountID(accountID);
        }

        public static ServiceWorkList GetListByDate(DateTime myDate)
        {
            return ServiceWorkDB.GetListByDate(myDate);
        }

        public static ServiceWorkList GetListByDate(DateTime myDate, string startTime)
        {
            return ServiceWorkDB.GetListByDate(myDate, startTime);
        }

        public static DataTable GetTopTenServiceWorkFromToday() 
        {
            return ServiceWorkDB.GetTopTenServiceWorkFromToday();
        }
    }
}

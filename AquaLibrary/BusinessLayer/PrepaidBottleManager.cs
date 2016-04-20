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
    public class PrepaidBottleManager
    {
        public static int Save(PrepaidBottle p) 
        {
            return PrepaidBottleDB.Save(p);
        }

        public static PrepaidBottle GetPrepaidBottle(int accountid, int bottleType) 
        {
            return  PrepaidBottleDB.GetPrepaidBottle(accountid, bottleType);
        }

        public static DataTable GetPrepaidPackagesByAccount(int accountID) 
        {
            return PrepaidBottleDB.GetPrepaidPackagesByAccount(accountID);
        }

        public static PrepaidBottle GetPrepaidBottleByID(int prepaidID)
        {
            return   PrepaidBottleDB.GetPrepaidBottleByID(prepaidID);
         }
    }
}

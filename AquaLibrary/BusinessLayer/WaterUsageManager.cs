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
   public  class WaterUsageManager
    {
       public static DataTable GetUsagePerHour() 
       {
           return WaterUsageDB.GetUsagePerHour();
       }

       public static WaterUsageList GetList() 
       {
           return WaterUsageDB.GetList();
       }
    }
}

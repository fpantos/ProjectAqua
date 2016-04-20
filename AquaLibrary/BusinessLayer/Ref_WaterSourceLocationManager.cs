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
    public class Ref_WaterSourceLocationManager
    {
        public static string GetDescriptionByID(int locationID) 
        {
            return Ref_WaterSourceLocationDB.GetDescriptionByID(locationID) ;
        }
    }
}

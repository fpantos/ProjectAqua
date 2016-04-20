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
    public class STG_ServiceWorkManager
    {

        public static int Save(STG_ServiceWork s)
        {
            return STG_ServiceWorkDB.Save(s);
        }

        public static int Delete(int stg_servID) 
        {
            return STG_ServiceWorkDB.Delete(stg_servID);
        
        }

        public static STG_ServiceWorkList GetListByAccountID(int accountID)
        {
            return STG_ServiceWorkDB.GetListByAccountID(accountID);
        }

        public static STG_ServiceWorkList GetListByDate(DateTime myDate)
        {
            return STG_ServiceWorkDB.GetListByDate(myDate);
        }

        public static STG_ServiceWorkList GetListByDate(DateTime myDate, string startTime)
        {
            return STG_ServiceWorkDB.GetListByDate(myDate,startTime);
        }

        



    }
}

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
    public class PrepaidBottleTransactionManager
    {
        public static int Save(PrepaidBottleTransaction pBTransaction)
        {
            return PrepaidBottleTransactionDB.Save(pBTransaction);
        }

        public static PrepaidBottleTransactioList GetListByPrepaidID(int prepaidID) 
        {
            return PrepaidBottleTransactionDB.GetListByPrepaidID(prepaidID);
        }
    }
}

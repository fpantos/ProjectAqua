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
    public class ServiceWorkToBeDoneManager
    {

        public static int Save(ServiceWorkToBeDone sWork) 
        {
            return ServiceWorkToBeDoneDB.Save(sWork);
        }

        public static ServiceWorkToBeDoneList GetListByServiceWorkID(int serviceWorkID) 
        {
            return ServiceWorkToBeDoneDB.GetListByServiceWorkID(serviceWorkID);
        }
    }
}

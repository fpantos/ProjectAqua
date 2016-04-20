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
    public class PrepaidBottleTypeManager
    {
        public static int GetTypeByName(string name)
        {
            return PrepaidBottleTypeDB.GetBottleTypeByName(name);
        }

    }
}

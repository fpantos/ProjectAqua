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
    public class WTEManager
    {
        public static int Save(WaterTreatmentEquipment wte)
        {
            return WTEDB.Save(wte);
        }

        public static WaterTreatmentEquipment GetByWTEID(int wte_ID)
        {
            return WTEDB.GetByWTEID(wte_ID);
        }

        public static WaterTreatmentEquipmentList GetListByAccountID(int accountID)
        {
            return WTEDB.GetList(accountID);
        }

        public static int DeleteWTE(int wteID) 
        {
            return WTEDB.DeleteWTEByID(wteID);
        }
    }
}

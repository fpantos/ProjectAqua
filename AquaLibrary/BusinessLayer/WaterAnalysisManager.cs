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
    public class WaterAnalysisManager
    {
        public static int Save(WaterAnalysis waterAnalysis)
        {
            return WaterAnalysisDB.Save(waterAnalysis);
        }


        public static WaterAnalysis GetWaterAnalysisByReportID(int reportID)
        {
            return WaterAnalysisDB.GetWaterAnalysisByReportID(reportID);
        }

        public static WaterAnalysisList GetList(int accountID) 
        {
            return WaterAnalysisDB.GetListByAccountID(accountID);
        }



    }
}

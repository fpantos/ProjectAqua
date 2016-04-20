using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AquaLibrary.DataAccess;
using AquaLibrary.BusinessObject;
using System.Data;

namespace AquaLibrary.BusinessLayer
{
    public class JobPositionManager
    {

        public static DataTable GetAll()
        {
            return JobPositionDB.GetAll();
        }

        public static int DeleteJobPosition(JobPosition jobPosition)
        {
            return JobPositionDB.DeleteJobPosition(jobPosition);
        }

        public static int Save(JobPosition job)
        {
            return JobPositionDB.Save(job);
        }

        public static JobPosition GetPositionByID(int jobID)
        {
            return JobPositionDB.GetPositionByID(jobID);
        }

        public static List<int> GetPositionIDsInUse()
        {
            return JobPositionDB.GetPositionIDsInUse();
        }

        public static List<string> GetPositionNames()
        {
            return JobPositionDB.GetPositionNames();
        }
    }
}

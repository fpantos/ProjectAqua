using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AquaLibrary.BusinessObject.Collections;

namespace AquaLibrary.BusinessObject
{
    public class STG_ServiceWork : RecordLogger
    {
        public STG_ServiceWork() 
        {

            STG_servID = -1;
            ServiceStatus = "";
            ServiceDate = DateTime.Now.ToLocalTime();
            Technician = "";
            
        }

        public int STG_servID { get; set; }
        public int AccountID { get; set; }
        public string ServiceStatus { get; set; }
        public DateTime ServiceDate { get; set; }
        public DateTime ServiceStartTime { get; set; }
        public DateTime ServiceEndTime { get; set; }
        public String Technician { get; set; }
        public ServiceWorkToBeDoneList workToBeDoneList = new ServiceWorkToBeDoneList();

        public static int CalculateNumberOfIntervals(DateTime startTime, DateTime endTime)//string startTime, string endTime   ) 
        {
            int numberOfIntervals = 0;

            //Get the total minutes by subtracting end time to the start time
            double totalNumberOfMinutes = endTime.Subtract(startTime).TotalMinutes;
            numberOfIntervals = Convert.ToInt32(totalNumberOfMinutes) / 30;
            return numberOfIntervals;
        }
        
       

    }
}

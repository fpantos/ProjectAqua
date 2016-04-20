using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AquaLibrary.Enums;


namespace AquaLibrary.BusinessObject
{
    public class WaterTreatmentEquipment : RecordLogger
    {
        public WaterTreatmentEquipment()
        {
            WTE_ID = -1;
            AccountID = -1;
            Description = "";
            ProductCode = "";
            Manufacturer = "";
            DateObtained = new DateTime();
           // LastReminderDate = new DateTime();

        }
        public int WTE_ID { get; set; }
        public int AccountID { get; set; }
        public string Description { get; set; }
        public string ProductCode { get; set; }
        public string Manufacturer { get; set; }
        public DateTime DateObtained { get; set; }
        //public DateTime LastReminderDate { get; set; }



    }
}

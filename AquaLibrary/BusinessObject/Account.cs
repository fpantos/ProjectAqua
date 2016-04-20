using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.BusinessObject
{
    public class Account : Person
    {
        #region default constructor
        public Account()
        {
            AccountID = -1;
            Title = "";
            Firstname = "";
            Middlename = "";
            Lastname = "";
            Suffix = "";
            Email = "";
            Homephone = "";
            Mobilephone = "";
            Workphone = "";
            CustomerSince = DateTime.Now.ToLocalTime();
            WaterSourceLocationID = 1;
            ContactFrequency = "Monthly";
            IsActive = true;
            IsENewsletter = false;
            IsNewsletter = false;
            IsWaterTreatmentEquipment = false;
            IsBottledWater = false;
            IsRental = false;
            IsService = false;
            IsDelivery = false;
            IsWaterCare = false;
            
        }
        #endregion

        public int AccountID { get; set; }
        public DateTime CustomerSince { get; set; }
        public int WaterSourceLocationID { get; set; }
        public string ContactFrequency { get; set; }
        public bool IsActive { get; set; }
        public bool IsENewsletter { get; set; }
        public bool IsNewsletter { get; set; }
        public bool IsWaterTreatmentEquipment { get; set; }
        public bool IsBottledWater { get; set; }
        public bool IsRental { get; set; }
        public bool IsService { get; set; }
        public bool IsDelivery { get; set; }
        public bool IsWaterCare { get; set; }


    }



}

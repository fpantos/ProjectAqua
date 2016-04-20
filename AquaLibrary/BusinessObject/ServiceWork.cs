using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AquaLibrary.BusinessObject.Collections;

namespace AquaLibrary.BusinessObject
{
    public class ServiceWork : RecordLogger
    {

        public ServiceWork()
        {
            ServiceWorkID = -1;
            AccountID = -1;
            InvoiceID = -1;
            Technician = "";


        }
        public int ServiceWorkID { get; set; }
        public int AccountID { get; set; }
        public int InvoiceID { get; set; }
        //public string ServiceStatus { get; set; }
        public DateTime ServiceDate { get; set; }
        public DateTime ServiceStartTime { get; set; }
        public DateTime ServiceEndTime { get; set; }
        public String Technician { get; set; }
        public double SubTotal { get; set; }
        public double TaxCharged { get; set; }

        public ServiceWorkToBeDoneList workToBeDoneList = new ServiceWorkToBeDoneList();

        public static double CalculateTotalWorkCharge(ServiceWorkToBeDoneList workToBeDoneList)
        {
            double subTotal = 0;
            foreach (ServiceWorkToBeDone s in workToBeDoneList)
            {
                subTotal += s.WorkCharge;
            }
            return subTotal;
        }

        public static double CalculateTotalTax(double workChargeTotalAmount, double taxPercentage)
        {
            double totalTaxCharged = 0;
            totalTaxCharged = workChargeTotalAmount * taxPercentage;
            return totalTaxCharged;
        }



    }



}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace AquaLibrary.BusinessObject
{
    public class Employee :Person
    {
        public Employee()
        {
            EmployeeID = -1;
            Firstname = "";
            Lastname = "";
            Gender = "Male";
            Email = "";
            Homephone = "";
            Mobilephone = "";
            EmergencyContact="";
            EmergencyPhone1 = "";
            EmergencyPhone2 = "";
            IsEmployed = true;
            HireDate = DateTime.Now.ToLocalTime();
            TerminatedDate = null;
            Notes = "";
            JobPositionID = -1;
            RehiredDate = DateTime.Now.ToLocalTime();


        }

        public int EmployeeID { get; set; }
        public string EmergencyContact { get; set; }
        public string EmergencyPhone1 { get; set; }
        public string EmergencyPhone2 { get; set; }
        public bool IsEmployed { get; set; }
        public DateTime HireDate { get; set; }
        public DateTime ? TerminatedDate { get; set; }
        public int JobPositionID { get; set; }
        public DateTime RehiredDate { get; set; }
    }
}

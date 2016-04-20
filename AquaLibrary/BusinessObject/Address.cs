using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.BusinessObject
{
    public class Address : RecordLogger
    {
        public Address() 
        {
            AddressID = -1;
            AddressLine1 = "";
            AddressLine2 = "";
            CityTown = "";
            Province = "ON";
            PostalCode = "";
            Country = "Canada";
           
        }

        public int AddressID { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string CityTown { get; set; }
        public string Province { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }        
    }
}

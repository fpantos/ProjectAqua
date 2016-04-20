using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.BusinessObject
{
    public class Person : RecordLogger
    {
        public Person()
        {
            Title = "";
            Firstname = "";
            Middlename = "";
            Lastname = "";
            Gender = "";
            Suffix = "";
            Email = "";
            Homephone = "";
            Mobilephone = "";
            Workphone = "";
        }

        public string Title { get; set; }
        public string Firstname { get; set; }
        public string Middlename { get; set; }
        public string Lastname { get; set; }
        public string Gender { get; set; }
        public string Suffix { get; set; }
        public string Email { get; set; }
        public string Homephone { get; set; }
        public string Mobilephone { get; set; }
        public string Workphone { get; set; }




    }
}

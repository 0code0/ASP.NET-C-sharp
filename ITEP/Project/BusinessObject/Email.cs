using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;
namespace BusinessObject
{
     public class Email
    {
            public string from { get; set; }
            public string to { get; set; }
            public string subject { get; set; }
            public string body { get; set; }
            public string Number { get; set; }

     
     }
}

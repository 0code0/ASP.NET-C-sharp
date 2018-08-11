using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessObject;
namespace BusinessLogic
{
    public class EmailBL
    {
        public static bool sendmail(Email email)
        {
            return DataAccess.EmailDA.sendmail(email);
        
        }
    }
}

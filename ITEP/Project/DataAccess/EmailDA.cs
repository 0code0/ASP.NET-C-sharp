using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessObject;

using System.Net.Mail;

namespace DataAccess
{
    public class EmailDA
    {

        public static bool sendmail(Email email) {

            MailMessage mail = new MailMessage();

            mail.To.Add(email.to);
            mail.From = new MailAddress(System.Configuration.ConfigurationManager.AppSettings["Email"],"ITEP");
            mail.Body = email.body;
            mail.IsBodyHtml = true;
            mail.Subject = email.subject;
            

            SmtpClient client = new SmtpClient();
           client.DeliveryMethod = SmtpDeliveryMethod.Network;

           client.Host = System.Configuration.ConfigurationManager.AppSettings["Host"];
           client.Port = Convert.ToInt16(System.Configuration.ConfigurationManager.AppSettings["Port"]);
           client.EnableSsl= Convert.ToBoolean(System.Configuration.ConfigurationManager.AppSettings["EnableSsl"]);
           client.UseDefaultCredentials = false;
           client.Credentials = new System.Net.NetworkCredential(System.Configuration.ConfigurationManager.AppSettings["Email"],System.Configuration.ConfigurationManager.AppSettings["Password"]);


            try
            {
                client.Send(mail);
            }
            catch {
            
            }

            return true;
        
        }

    }
}

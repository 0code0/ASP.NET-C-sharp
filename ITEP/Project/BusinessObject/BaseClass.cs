using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessObject
{
   public abstract class BaseClass
    {
       public string UserName { get; set; }
       public string CreatedOn { get; set; }
       public string ThumbNail { get; set; }
       public bool IsDeleted { get; set; }
       public bool IsApproved { get; set; }

   }

}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessObject
{
   public  class Topics:BaseClass
    {
       public int Id { get; set; }
       public string Name { get; set; }
       public int SubjectId { get; set; }
       public int ParentId { get; set; }
       public int BranchId { get; set; }
       public Subjects Subjects { get; set; }
       public Topics ParentTopics { get; set; }


    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessObject
{
   public class Uploads:BaseClass
    {
       public int Id { get; set; }
       public string Title { get; set; }
       public string Path { get; set; }
       public int UploadsTypeId { get; set; }
       public int TopicsId { get; set; }
       
       // In place of UserId we need UserName
       // It will be a string type
       
       public UploadsType UploadsType { get; set; }

       public Topics Topics { get; set; }
      
      

    }
}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessObject
{
  public class Subjects:BaseClass

    {
      public int Id { get; set; }
      public string Name { get; set; }
      public int BranchId { get; set; }

      public Branch Branch { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess;
using BusinessObject;
namespace BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class BranchBL:BaseClassBL
    {

        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Insert)]
        public static bool Add(Branch branch) {

            return DataAccess.BranchDA.Add(branch);
        }

        public static bool Update(Branch branch)
        {

            return DataAccess.BranchDA.Update(branch);

        }
        public static bool Delete(Branch branch)
        {

            return DataAccess.BranchDA.Delete(branch);
    }
        public static Branch GetSingle(int Id)
        {

            return DataAccess.BranchDA.GetSingle(Id);

        }
        public static List<Branch> GetAll()
        {
            return DataAccess.BranchDA.GetAll();
        }
    }
}

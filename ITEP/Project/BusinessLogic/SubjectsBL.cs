using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessObject;
namespace BusinessLogic
{
   public class SubjectsBL:BaseClassBL
    {

        public static bool Add(Subjects subjects)
        {

            return DataAccess.SubjectsDA.Add(subjects);


        }

        public static bool Update(Subjects subjects)
        {

            return DataAccess.SubjectsDA.Update(subjects);


        }
        public static bool Delete(Subjects subjects)
        {

            return DataAccess.SubjectsDA.Delete(subjects);


        }
        public static Subjects GetSingle(int Id)
        {

            return DataAccess.SubjectsDA.GetSingle(Id);


        }
        public static List<Subjects> GetAll()
        {


            return DataAccess.SubjectsDA.GetAll();

        }

        public static List<Subjects> GetAllByBranch(int BranchId)
        {

            return DataAccess.SubjectsDA.GetAllByBranches(BranchId);

         

        }
    }
}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessObject;
namespace BusinessLogic
{
    public class QuestionBL:BaseClassBL
    {
        public static bool Add(Question question)
        {

            return DataAccess.QuestionDA.Add(question);
        }

        public static bool Update(Question question)
        {
            return DataAccess.QuestionDA.Update(question);

        }
        public static bool Delete(Question question)
        {
            return DataAccess.QuestionDA.Delete(question);
        }


        public static Question GetSingle(int Id)
        {
        return DataAccess.QuestionDA.GetSingle(Id);

        }


        public static List<Question> GetAll()
        {

            return DataAccess.QuestionDA.GetAll();
        }

        public static List<Question> GetAllApprovedQuestion() {

            return DataAccess.QuestionDA.GetAllApprovedQuestion();

        }

        public static List<Question> GetTopThreeQuestion()
        {
            return DataAccess.QuestionDA.GetTopThreeQuestion();

        }

    }
}

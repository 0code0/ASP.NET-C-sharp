using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessObject;
namespace BusinessLogic
{
    public class AnswerBL:BaseClassBL
    {
        public static bool Add(Answers answer)
        {
            return DataAccess.AnswersDA.Add(answer);
        }

        public static bool Update(Answers answer)
        {


                return DataAccess.AnswersDA.Update(answer);
        }
        public static bool Delete(Answers answer)
        {

            return DataAccess.AnswersDA.Delete(answer);

        }
        public static Answers GetSingle(int Id)
        {

            return DataAccess.AnswersDA.GetSingle(Id);
        }


        public static List<Answers> GetAll()
        {
            return DataAccess.AnswersDA.GetAll();
        }

        public static List<Answers> GetAllQuestion(int QuestionId)
        {
            return DataAccess.AnswersDA.GetAllQuestion(QuestionId);
        }

    }
}

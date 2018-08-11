using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessObject;
namespace BusinessLogic
{
    public class TopicsBL : BaseClassBL
    {
        public static bool Add(Topics topics)
        {
            return DataAccess.TopicsDA.Add(topics);
        }

        public static bool Update(Topics topics)
        {
            return DataAccess.TopicsDA.Update(topics);
        }

        public static bool Delete(Topics topics)
        {
            return DataAccess.TopicsDA.Delete(topics);
        }

        public static Topics GetSingle(int Id)
        {
            return DataAccess.TopicsDA.GetSingle(Id);
        }

        public static List<Topics> GetAll()
        {
            return DataAccess.TopicsDA.GetAll();
        }

        public static List<Topics> GetAllBySubjects(int SubjectId)
        {
            return DataAccess.TopicsDA.GetAllBySubjects(SubjectId);
        }

        public static List<Topics> GetAllByTopics()
        {
            return DataAccess.TopicsDA.GetAllByTopics();
        }

        public static List<Topics> GetAllByTopics(int ParentId)
        {
            return DataAccess.TopicsDA.GetAllByTopics(ParentId);
        }

        public static List<Topics> GetAllBySubjectsandTopics(int SubjectId)
        {
            return DataAccess.TopicsDA.GetAllBySubjectsandTopics(SubjectId);
        }
    }
}

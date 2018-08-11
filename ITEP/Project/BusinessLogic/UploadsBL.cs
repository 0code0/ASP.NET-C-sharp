using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessObject;
namespace BusinessLogic
{
  public class UploadsBL
    {

        public static bool Add(Uploads uploads)
        {

            return DataAccess.UploadsDA.Add(uploads);


        }

        public static bool Update(Uploads uploads)
        {

            return DataAccess.UploadsDA.Update(uploads);


        }
        public static bool Delete(Uploads uploads)
        {

            return DataAccess.UploadsDA.Delete(uploads);


        }

        public static List<Uploads> GetAllByUserName(string username)
        {
            return DataAccess.UploadsDA.GetAllByUserName(username);
        }

        public static Uploads GetSingle(int Id)
        {

            return DataAccess.UploadsDA.GetSingle(Id);


        }
        public static List<Uploads> GetAll()
        {


            return DataAccess.UploadsDA.GetAll();

        }

        public static List<Uploads> GetAllByCategory(int UploadsTypeId)
        {


            return DataAccess.UploadsDA.GetAllByCategory(UploadsTypeId);

        }
        public static List<Uploads> GetAllByCategoryAndTopic(int UploadsTypeId , int TopicId)
        {


            return DataAccess.UploadsDA.GetAllByCategoryAndTopic(UploadsTypeId,TopicId);

        }

        public static List<Uploads> GetVideos()
        {


            return DataAccess.UploadsDA.GetVideos();

        }

        public static List<Uploads> GetAllByCategoryAndTopicApproved(int UploadsTypeId, int TopicId)
        {
        
            return DataAccess.UploadsDA.GetAllByCategoryAndTopicApproved(UploadsTypeId, TopicId);

        }

        public static List<Uploads> GetTopSixVideos()
        {

            return DataAccess.UploadsDA.GetTopSixVideos();
        }

        public static List<Uploads> GetRelatedVideos(int TopicsId)
        {

            return DataAccess.UploadsDA.GetRelatedVideos(TopicsId);
        }

        public static List<Uploads> GetLatestData()
        {

            return DataAccess.UploadsDA.GetLatestData();
        }
  }
}

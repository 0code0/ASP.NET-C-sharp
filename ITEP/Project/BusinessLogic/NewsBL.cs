using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessObject;
namespace BusinessLogic
{
   public class NewsBL:BaseClassBL
    {


        public static bool Add(News news)
        {

            return DataAccess.NewsDA.Add(news);


        }

        public static bool Update(News news)
        {

            return DataAccess.NewsDA.Update(news);


        }
        public static bool Delete(News news)
        {

            return DataAccess.NewsDA.Delete(news);


        }
        public static News GetSingle(int Id)
        {

            return DataAccess.NewsDA.GetSingle(Id);


        }
        public static List<News> GetAll()
        {
            return DataAccess.NewsDA.GetAll();

        }

        public static List<News> GetAllByCategory(int CategoryId)
        {
            return DataAccess.NewsDA.GetAllByCategory(CategoryId);
        }

        
    }
}


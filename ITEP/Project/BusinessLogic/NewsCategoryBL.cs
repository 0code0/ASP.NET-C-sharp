using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessObject;
namespace BusinessLogic
{
   public class NewsCategoryBL:BaseClassBL
    {

        public static bool Add(NewsCategory newscategory)
        {

            return DataAccess.NewsCategoryDA.Add(newscategory);


        }

        public static bool Update(NewsCategory newscategory)
        {

            return DataAccess.NewsCategoryDA.Update(newscategory);


        }
        public static bool Delete(NewsCategory newscategory)
        {

            return DataAccess.NewsCategoryDA.Delete(newscategory);


        }
        public static NewsCategory GetSingle(int Id)
        {

            return DataAccess.NewsCategoryDA.GetSingle(Id);


        }
        public static List<NewsCategory> GetAll()
        {

            return DataAccess.NewsCategoryDA.GetAll();


        }

        public static List<NewsCategory> GetTopSix()
        {
            return DataAccess.NewsCategoryDA.GetTopSix();
        }
    }
}

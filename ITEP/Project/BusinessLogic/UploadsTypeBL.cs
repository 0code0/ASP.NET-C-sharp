using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessObject;

namespace BusinessLogic
{
    public class UploadsTypeBL
    {

        public static bool Add(UploadsType updatetype)
        {

            return DataAccess.UploadsTypeDA.Add(updatetype);


        }

        public static bool Update(UploadsType updatetype)
        {

            return DataAccess.UploadsTypeDA.Update(updatetype);


        }
        public static bool Delete(UploadsType updatetype)
        {

            return DataAccess.UploadsTypeDA.Delete(updatetype);


        }
        public static UploadsType GetSingle(int Id)
        {

            return DataAccess.UploadsTypeDA.GetSingle(Id);


        }
        public static List<UploadsType> GetAll()
        {

            return DataAccess.UploadsTypeDA.GetAll();
        
        }

    }
}

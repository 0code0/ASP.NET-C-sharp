
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using BusinessObject;
namespace DataAccess
{
     public class UploadsDA:BaseClassDA
    {
        public static bool Add(Uploads upload)
        {


            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("insert into Uploads(path,title,topicsid,uploadstypeid,username,IsApproved ,CreatedOn,IsDeleted,ThumbNail) values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}')", upload.Path, upload.Title, upload.TopicsId, upload.UploadsTypeId, upload.UserName,upload.IsApproved , upload.CreatedOn,upload.IsDeleted,upload.ThumbNail);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else

            return true;
        }

        public static bool Update(Uploads upload)
        {

            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("update uploads set title='{0}',path='{1}',uploadstypeid='{2}',topicsid='{3}',username='{4}',CreatedOn='{5}',IsApproved='{6}',IsDeleted='{7}',ThumbNail='{8}' where id='{9}'",upload.Title,upload.Path,upload.UploadsTypeId,upload.TopicsId,upload.UserName,upload.CreatedOn,upload.IsApproved,upload.IsDeleted,upload.ThumbNail,upload.Id);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else


            return true;
        }
        public static bool Delete(Uploads upload)
        {


            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("delete from uploads where id='{0}'", upload.Id);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else

            return true;
        }


        public static Uploads GetSingle(int Id)
        {

            Uploads upload = null;
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from Uploads where id = '{0}'", Id);

            SqlDataReader dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                upload = new Uploads();

                upload.Id = Convert.ToInt32(dataReader["Id"]);
                upload.Title = Convert.ToString(dataReader["Title"]);
                upload.Path = Convert.ToString(dataReader["Path"]);
                upload.UploadsTypeId = Convert.ToInt32(dataReader["UploadsTypeId"]);
                upload.TopicsId = Convert.ToInt32(dataReader["TopicsId"]);
                if (dataReader["UserName"] != DBNull.Value)

                    upload.UserName = Convert.ToString(dataReader["UserName"]);

                upload.UploadsType = UploadsTypeDA.GetSingle(upload.UploadsTypeId);
                upload.Topics = TopicsDA.GetSingle(upload.TopicsId);
                upload.ThumbNail = Convert.ToString(dataReader["ThumbNail"]);
                upload.IsApproved = Convert.ToBoolean(dataReader["IsApproved"]);
                upload.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);
                upload.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);
                
            }

            // 4) Close the connection
            connection.Close();

            return upload;

        }


        public static List<Uploads> GetAll()
        {
            List<Uploads> uploads = new List<Uploads>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from Uploads");

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Uploads upload = new Uploads();
                upload.Id = Convert.ToInt32(dataReader["Id"]);
                upload.Title = Convert.ToString(dataReader["Title"]);
                upload.Path = Convert.ToString(dataReader["Path"]);
                upload.UploadsTypeId = Convert.ToInt32(dataReader["UploadsTypeId"]);
                upload.TopicsId = Convert.ToInt32(dataReader["TopicsId"]);
                
                if (dataReader["UserName"]!=DBNull.Value)

                upload.UserName = Convert.ToString(dataReader["UserName"]);

                upload.ThumbNail = Convert.ToString(dataReader["ThumbNail"]);
                upload.UploadsType = UploadsTypeDA.GetSingle(upload.UploadsTypeId);
                upload.Topics = TopicsDA.GetSingle(upload.TopicsId);
                upload.IsApproved = Convert.ToBoolean(dataReader["IsApproved"]);
                upload.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);
                upload.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);
                
                uploads.Add(upload);
            }
            // 4) Close the connection
            connection.Close();


            return uploads;
        }


        public static List<Uploads> GetAllByUserName(string UserName)
        {
            List<Uploads> uploads = new List<Uploads>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from Uploads where UserName= '{0}'", UserName);

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Uploads upload = new Uploads();
                upload.Id = Convert.ToInt32(dataReader["Id"]);
                upload.Title = Convert.ToString(dataReader["Title"]);
                upload.Path = Convert.ToString(dataReader["Path"]);
                upload.UploadsTypeId = Convert.ToInt32(dataReader["UploadsTypeId"]);
                upload.TopicsId = Convert.ToInt32(dataReader["TopicsId"]);
               
                upload.UserName = Convert.ToString(dataReader["UserName"]);
                
                upload.UploadsType = UploadsTypeDA.GetSingle(upload.UploadsTypeId);
                upload.Topics = TopicsDA.GetSingle(upload.TopicsId);
                upload.IsApproved = Convert.ToBoolean(dataReader["IsApproved"]);
                upload.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);
                upload.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);
                upload.ThumbNail = Convert.ToString(dataReader["ThumbNail"]);
                uploads.Add(upload);
            }
            // 4) Close the connection
            connection.Close();


            return uploads;
        }


        public static List<Uploads> GetAllByCategory(int UploadsTypeId)
        {
            List<Uploads> uploads = new List<Uploads>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from Uploads where UploadsTypeId={0}", UploadsTypeId );

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Uploads upload = new Uploads();
                upload.Id = Convert.ToInt32(dataReader["Id"]);
                upload.Title = Convert.ToString(dataReader["Title"]);
                upload.Path = Convert.ToString(dataReader["Path"]);
                upload.UploadsTypeId = Convert.ToInt32(dataReader["UploadsTypeId"]);
                upload.TopicsId = Convert.ToInt32(dataReader["TopicsId"]);

                if (dataReader["UserName"] != DBNull.Value)

                    upload.UserName = Convert.ToString(dataReader["UserName"]);


                upload.UploadsType = UploadsTypeDA.GetSingle(upload.UploadsTypeId);
                upload.Topics = TopicsDA.GetSingle(upload.TopicsId);
                upload.IsApproved = Convert.ToBoolean(dataReader["IsApproved"]);
                upload.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);
                upload.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);
                upload.ThumbNail = Convert.ToString(dataReader["ThumbNail"]);
                uploads.Add(upload);
            }
            // 4) Close the connection
            connection.Close();


            return uploads;
        }

        public static List<Uploads> GetAllByCategoryAndTopic(int UploadsTypeId , int TopicId)
        {
            List<Uploads> uploads = new List<Uploads>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from Uploads where uploadstypeid={0} and topicsid={1}", UploadsTypeId , TopicId);

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Uploads upload = new Uploads();
                upload.Id = Convert.ToInt32(dataReader["Id"]);
                upload.Title = Convert.ToString(dataReader["Title"]);
                upload.Path = Convert.ToString(dataReader["Path"]);
                upload.UploadsTypeId = Convert.ToInt32(dataReader["UploadsTypeId"]);
                upload.TopicsId = Convert.ToInt32(dataReader["TopicsId"]);

                if (dataReader["UserName"] != DBNull.Value)

                    upload.UserName = Convert.ToString(dataReader["UserName"]);

                upload.ThumbNail = Convert.ToString(dataReader["ThumbNail"]);
                upload.UploadsType = UploadsTypeDA.GetSingle(upload.UploadsTypeId);
                upload.Topics = TopicsDA.GetSingle(upload.TopicsId);
                upload.IsApproved = Convert.ToBoolean(dataReader["IsApproved"]);
                upload.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);
                upload.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);
                
                uploads.Add(upload);
            }
            // 4) Close the connection
            connection.Close();


            return uploads;
        }


        public static List<Uploads> GetVideos()
        {
            List<Uploads> uploads = new List<Uploads>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from Uploads where uploadstypeid = '16' ");

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Uploads upload = new Uploads();
                upload.Id = Convert.ToInt32(dataReader["Id"]);
                upload.Title = Convert.ToString(dataReader["Title"]);
                upload.Path = Convert.ToString(dataReader["Path"]);
                upload.UploadsTypeId = Convert.ToInt32(dataReader["UploadsTypeId"]);
                upload.TopicsId = Convert.ToInt32(dataReader["TopicsId"]);

                if (dataReader["UserName"] != DBNull.Value)

                    upload.UserName = Convert.ToString(dataReader["UserName"]);


                upload.UploadsType = UploadsTypeDA.GetSingle(upload.UploadsTypeId);
                upload.Topics = TopicsDA.GetSingle(upload.TopicsId);
                upload.IsApproved = Convert.ToBoolean(dataReader["IsApproved"]);
                upload.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);
                upload.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);
                upload.ThumbNail = Convert.ToString(dataReader["ThumbNail"]);
                uploads.Add(upload);
            }
            // 4) Close the connection
            connection.Close();


            return uploads;
        }

        public static List<Uploads> GetAllByCategoryAndTopicApproved(int UploadsTypeId, int TopicId)
        {
            List<Uploads> uploads = new List<Uploads>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from Uploads where uploadstypeid={0} and topicsid={1} and IsApproved='True'", UploadsTypeId, TopicId);

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Uploads upload = new Uploads();
                upload.Id = Convert.ToInt32(dataReader["Id"]);
                upload.Title = Convert.ToString(dataReader["Title"]);
                upload.Path = Convert.ToString(dataReader["Path"]);
                upload.UploadsTypeId = Convert.ToInt32(dataReader["UploadsTypeId"]);
                upload.TopicsId = Convert.ToInt32(dataReader["TopicsId"]);

                if (dataReader["UserName"] != DBNull.Value)

                    upload.UserName = Convert.ToString(dataReader["UserName"]);


                upload.UploadsType = UploadsTypeDA.GetSingle(upload.UploadsTypeId);
                upload.Topics = TopicsDA.GetSingle(upload.TopicsId);
                upload.IsApproved = Convert.ToBoolean(dataReader["IsApproved"]);
                upload.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);
                upload.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);
                upload.ThumbNail = Convert.ToString(dataReader["ThumbNail"]);
                uploads.Add(upload);
            }
            // 4) Close the connection
            connection.Close();


            return uploads;
        }




        public static List<Uploads> GetTopSixVideos()
        {
            List<Uploads> uploads = new List<Uploads>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select top 6 * from Uploads where uploadstypeid = '16'");

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Uploads upload = new Uploads();
                upload.Id = Convert.ToInt32(dataReader["Id"]);
                upload.Title = Convert.ToString(dataReader["Title"]);
                upload.Path = Convert.ToString(dataReader["Path"]);
                upload.UploadsTypeId = Convert.ToInt32(dataReader["UploadsTypeId"]);
                upload.TopicsId = Convert.ToInt32(dataReader["TopicsId"]);

                if (dataReader["UserName"] != DBNull.Value)

                    upload.UserName = Convert.ToString(dataReader["UserName"]);

                upload.ThumbNail = Convert.ToString(dataReader["ThumbNail"]);
                upload.UploadsType = UploadsTypeDA.GetSingle(upload.UploadsTypeId);
                upload.Topics = TopicsDA.GetSingle(upload.TopicsId);
                upload.IsApproved = Convert.ToBoolean(dataReader["IsApproved"]);
                upload.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);
                upload.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);

                uploads.Add(upload);
            }
            // 4) Close the connection
            connection.Close();


            return uploads;
        }


        public static List<Uploads> GetRelatedVideos(int TopicsId)
        {
            List<Uploads> uploads = new List<Uploads>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select top 10 * from Uploads where uploadstypeid = '16' and TopicsId='{0}'",TopicsId);

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Uploads upload = new Uploads();
                upload.Id = Convert.ToInt32(dataReader["Id"]);
                upload.Title = Convert.ToString(dataReader["Title"]);
                upload.Path = Convert.ToString(dataReader["Path"]);
                upload.UploadsTypeId = Convert.ToInt32(dataReader["UploadsTypeId"]);
                upload.TopicsId = Convert.ToInt32(dataReader["TopicsId"]);

                if (dataReader["UserName"] != DBNull.Value)

                    upload.UserName = Convert.ToString(dataReader["UserName"]);

                upload.ThumbNail = Convert.ToString(dataReader["ThumbNail"]);
                upload.UploadsType = UploadsTypeDA.GetSingle(upload.UploadsTypeId);
                upload.Topics = TopicsDA.GetSingle(upload.TopicsId);
                upload.IsApproved = Convert.ToBoolean(dataReader["IsApproved"]);
                upload.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);
                upload.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);

                uploads.Add(upload);
            }
            // 4) Close the connection
            connection.Close();


            return uploads;
        }

        public static List<Uploads> GetLatestData()
        {
            List<Uploads> uploads = new List<Uploads>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select top 2 * from Uploads");

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Uploads upload = new Uploads();
                upload.Id = Convert.ToInt32(dataReader["Id"]);
                upload.Title = Convert.ToString(dataReader["Title"]);
                upload.Path = Convert.ToString(dataReader["Path"]);
                upload.UploadsTypeId = Convert.ToInt32(dataReader["UploadsTypeId"]);
                upload.TopicsId = Convert.ToInt32(dataReader["TopicsId"]);

                if (dataReader["UserName"] != DBNull.Value)

                    upload.UserName = Convert.ToString(dataReader["UserName"]);

                upload.ThumbNail = Convert.ToString(dataReader["ThumbNail"]);
                upload.UploadsType = UploadsTypeDA.GetSingle(upload.UploadsTypeId);
                upload.Topics = TopicsDA.GetSingle(upload.TopicsId);
                upload.IsApproved = Convert.ToBoolean(dataReader["IsApproved"]);
                upload.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);
                upload.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);

                uploads.Add(upload);
            }
            // 4) Close the connection
            connection.Close();


            return uploads;
        }

    }
}

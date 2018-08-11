using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using BusinessObject;
namespace DataAccess
{
   public class NewsDA:BaseClassDA
    {
        public static bool Add(News news)
        {


            // 1) Create the connection
            SqlConnection connection = new SqlConnection();

             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("insert into news(CategoryId,UploadTypeId,TextArea,ImagePath,HeadLines,IsDeleted) values('{0}','{1}','{2}','{3}','{4}','{5}')",news.CategoryId,news.UploadTypeId,news.TextArea,news.ImagePath,news.HeadLines,news.IsDeleted);

            int rowsAffected = command.ExecuteNonQuery();


            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else
                return true;

 
        }

        public static bool Update(News news)
        {
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("update news set categoryid='{0}',uploadtypeid='{1}',textarea='{2}',imagepath='{3}',headlines='{4}',IsDeleted='{5}' where id='{6}'", news.CategoryId, news.UploadTypeId, news.TextArea, news.ImagePath, news.HeadLines,news.IsDeleted,news.Id);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else
                return true;

 

            
        }
        public static bool Delete(News news)
        {


            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("delete from news where id='{0}'", news.Id);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else
                return true;

 
        }


        public static News GetSingle(int Id)
        {

            News news = null;
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from News where id = '{0}'", Id);

            SqlDataReader dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                news = new News();

                news.Id = Convert.ToInt32(dataReader["Id"]);
                news.CategoryId = Convert.ToInt32(dataReader["CategoryId"]);
                news.UploadTypeId = Convert.ToInt32(dataReader["UploadTypeId"]);
                news.TextArea = Convert.ToString(dataReader["TextArea"]);
                news.ImagePath = Convert.ToString(dataReader["ImagePath"]);
                news.HeadLines = Convert.ToString(dataReader["HeadLines"]);
                news.NewsCategory = NewsCategoryDA.GetSingle(news.CategoryId);
                news.UploadsType = UploadsTypeDA.GetSingle(news.UploadTypeId);
                if (dataReader["CreatedOn"] != DBNull.Value)
                news.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);
                news.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);
            
            }

            // 4) Close the connection
            connection.Close();

            return news;

        }


        public static List<News> GetAll()
        {
            List<News> newss = new List<News>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from News");

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                News news = new News();
                news.Id = Convert.ToInt32(dataReader["Id"]);
                news.CategoryId = Convert.ToInt32(dataReader["CategoryId"]);
                news.UploadTypeId = Convert.ToInt32(dataReader["UploadTypeId"]);
                news.TextArea = Convert.ToString(dataReader["TextArea"]);
                news.ImagePath = Convert.ToString(dataReader["ImagePath"]);
                news.HeadLines = Convert.ToString(dataReader["HeadLines"]);
                news.NewsCategory = NewsCategoryDA.GetSingle(news.CategoryId);
                news.UploadsType = UploadsTypeDA.GetSingle(news.UploadTypeId);
                if (dataReader["CreatedOn"] != DBNull.Value)
                news.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);
                news.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);
            

                newss.Add(news);
            }
            // 4) Close the connection
            connection.Close();


            return newss;
        }

        public static List<News> GetAllByCategory(int CategoryId)
        {
            List<News> newss = new List<News>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from News where categoryid='{0}'",CategoryId);

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                News news = new News();
                news.Id = Convert.ToInt32(dataReader["Id"]);
                news.CategoryId = Convert.ToInt32(dataReader["CategoryId"]);
                news.UploadTypeId = Convert.ToInt32(dataReader["UploadTypeId"]);
                news.TextArea = Convert.ToString(dataReader["TextArea"]);
                news.ImagePath = Convert.ToString(dataReader["ImagePath"]);
                news.HeadLines = Convert.ToString(dataReader["HeadLines"]);
                news.NewsCategory = NewsCategoryDA.GetSingle(news.CategoryId);
                news.UploadsType = UploadsTypeDA.GetSingle(news.UploadTypeId);
                if (dataReader["CreatedOn"]!= DBNull.Value)
                news.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);
                news.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);
            
              
                newss.Add(news);
            }
            // 4) Close the connection
            connection.Close();


            return newss;
        }

     

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessObject;
using System.Data.SqlClient;
namespace DataAccess
{
   public class NewsCategoryDA:BaseClassDA
    {
        public static bool Add(NewsCategory newscategory)
        {
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("insert into newscategory(name) values ('{0}')", newscategory.Name);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else
                return true;


            
        }

        public static bool Update(NewsCategory newscategory)
        {

            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("update newscategory set name= '{0}' where id='{1}'", newscategory.Name,newscategory.Id);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else

            return true;
        }
        public static bool Delete(NewsCategory newscategory)
        {

            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("delete from newscategory where id='{0}'" , newscategory.Id);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else

             return true;
        }


        public static NewsCategory GetSingle(int Id)
        {

            NewsCategory newscategory = null;
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from newscategory where id = '{0}'", Id);

            SqlDataReader dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                newscategory = new NewsCategory();

                newscategory.Id = Convert.ToInt32(dataReader["Id"]);
                newscategory.Name = Convert.ToString(dataReader["Name"]);
             }

            // 4) Close the connection
            connection.Close();

            return newscategory;

        }


        public static List<NewsCategory> GetAll()
        {
            List<NewsCategory> newscategorys = new List<NewsCategory>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from newscategory");

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                NewsCategory newscategory = new NewsCategory();

                newscategory.Id = Convert.ToInt32(dataReader["Id"]);
                newscategory.Name = Convert.ToString(dataReader["Name"]);


                newscategorys.Add(newscategory);
            }
            // 4) Close the connection
            connection.Close();


            return newscategorys;
        }

        public static List<NewsCategory> GetTopSix()
        {
            List<NewsCategory> newscategorys = new List<NewsCategory>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select top 6 * from newscategory");

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                NewsCategory newscategory = new NewsCategory();

                newscategory.Id = Convert.ToInt32(dataReader["Id"]);
                newscategory.Name = Convert.ToString(dataReader["Name"]);


                newscategorys.Add(newscategory);
            }
            // 4) Close the connection
            connection.Close();


            return newscategorys;
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using BusinessObject;


namespace DataAccess
{
    public class QuestionDA : BaseClassDA
    {
        public static bool Add(Question question)
        {

            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("insert into Question(Title,Description,UserName,NoOfViews,IsApproved,IsDeleted,CreatedOn) values('{0}','{1}','{2}','{3}','{4}','{5}','{6}')", question.Title, question.Description, question.UserName, question.NoOfViews, question.IsApproved, question.IsDeleted,question.CreatedOn);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else


                return true;
        }

        public static bool Update(Question question)
        {

            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("update Question set Title='{0}',Description='{1}',UserName='{2}',NoOfViews = '{3}',CreatedOn='{4}',IsApproved='{5}',IsDeleted='{6}' where id='{7}'", question.Title, question.Description, question.UserName, question.NoOfViews, question.CreatedOn, question.IsApproved, question.IsDeleted, question.Id);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else


                return true;
        }
        public static bool Delete(Question question)
        {
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("delete from Question where id='{0}'", question.Id);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else



                return true;
        }


        public static Question GetSingle(int Id)
        {

            Question question = null;
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from question where id = '{0}'", Id);

            SqlDataReader dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                question = new Question();

                question.Id = Convert.ToInt32(dataReader["Id"]);
                question.Title = Convert.ToString(dataReader["Title"]);
                question.Description = Convert.ToString(dataReader["Description"]);

                if (dataReader["UserName"] != DBNull.Value)
                    question.UserName = Convert.ToString(dataReader["UserName"]);
                
                question.NoOfViews = Convert.ToInt32(dataReader["NoOfViews"]);
                question.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);
                question.IsApproved = Convert.ToBoolean(dataReader["IsApproved"]);
                question.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);



            }

            // 4) Close the connection
            connection.Close();

            return question;

        }


        public static List<Question> GetAll()
        {
            List<Question> questions = new List<Question>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from question");

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Question question = new Question();

                question.Id = Convert.ToInt32(dataReader["Id"]);
                question.Title = Convert.ToString(dataReader["Title"]);
                
                question.Description = Convert.ToString(dataReader["Description"]);

                if (dataReader["UserName"] != DBNull.Value)
                    question.UserName = Convert.ToString(dataReader["UserName"]);
                
               
                question.NoOfViews = Convert.ToInt32(dataReader["NoOfViews"]);
                question.IsApproved = Convert.ToBoolean(dataReader["IsApproved"]);



                question.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);

                question.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);

                
                questions.Add(question);
            }
            // 4) Close the connection
            connection.Close();


            return questions;
        }



        public static List<Question> GetAllByUsers(string UserName)
        {
            List<Question> questions = new List<Question>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from question where username = '{0}'",UserName);

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Question question = new Question();

                question.Id = Convert.ToInt32(dataReader["Id"]);
                question.Title = Convert.ToString(dataReader["Title"]);
                question.Description = Convert.ToString(dataReader["Description"]);
                
                if (dataReader["UserName"]!=DBNull.Value)
                question.UserName = Convert.ToString(dataReader["UserName"]);
                
                question.NoOfViews = Convert.ToInt32(dataReader["NoOfViews"]);
                question.IsApproved = Convert.ToBoolean(dataReader["IsApproved"]);
                question.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);
                question.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);

               
                questions.Add(question);
            }
            // 4) Close the connection
            connection.Close();


            return questions;
        }

        public static List<Question> GetAllApprovedQuestion()
        {
            List<Question> questions = new List<Question>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from question where IsApproved='True'");

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Question question = new Question();

                question.Id = Convert.ToInt32(dataReader["Id"]);
                question.Title = Convert.ToString(dataReader["Title"]);

                question.Description = Convert.ToString(dataReader["Description"]);

                if (dataReader["UserName"] != DBNull.Value)
                    question.UserName = Convert.ToString(dataReader["UserName"]);


                question.NoOfViews = Convert.ToInt32(dataReader["NoOfViews"]);
                question.IsApproved = Convert.ToBoolean(dataReader["IsApproved"]);



                question.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);

                question.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);


                questions.Add(question);
            }
            // 4) Close the connection
            connection.Close();


            return questions;
        }

        public static List<Question> GetTopThreeQuestion()
        {
            List<Question> questions = new List<Question>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select top 3 * from question");

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Question question = new Question();

                question.Id = Convert.ToInt32(dataReader["Id"]);
                question.Title = Convert.ToString(dataReader["Title"]);

                question.Description = Convert.ToString(dataReader["Description"]);

                if (dataReader["UserName"] != DBNull.Value)
                    question.UserName = Convert.ToString(dataReader["UserName"]);


                question.NoOfViews = Convert.ToInt32(dataReader["NoOfViews"]);
                question.IsApproved = Convert.ToBoolean(dataReader["IsApproved"]);



                question.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);

                question.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);


                questions.Add(question);
            }
            // 4) Close the connection
            connection.Close();


            return questions;
        }
    }
}


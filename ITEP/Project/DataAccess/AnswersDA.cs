using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using BusinessObject;


namespace DataAccess
{
    public class AnswersDA : BaseClassDA
    {
        public static bool Add(Answers answer)
        {

            // 1) Create the connection
            SqlConnection connection = new SqlConnection();

            connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;
           
            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("insert into answers(Ans,QuestionId,UserName,Votes,CreatedOn,IsApproved,IsDeleted) values('{0}','{1}','{2}','{3}','{4}','{5}','{6}')", answer.Ans, answer.QuestionId, answer.UserName, answer.Votes, answer.CreatedOn, answer.IsApproved, answer.IsDeleted);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else


                return true;
        }

        public static bool Update(Answers answer)
        {

            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("update Answers set Ans='{0}',Questionid='{1}',UserName='{2}',Votes='{3}',CreatedOn='{4}',IsApproved='{5}',IsDeleted='{6}' where id='{7}'", answer.Ans, answer.QuestionId, answer.UserName,answer.Votes,answer.CreatedOn,answer.IsApproved,answer.IsDeleted,answer.Id);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else


                return true;
        }
        public static bool Delete(Answers answer)
        {
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("delete from Answers where id='{0}'", answer.Id);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else



                return true;
        }


        public static Answers GetSingle(int Id)
        {

            Answers answer = null;
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from answers where id = '{0}'", Id);

            SqlDataReader dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                answer = new Answers();

                answer.Id = Convert.ToInt32(dataReader["Id"]);
                answer.Ans = Convert.ToString(dataReader["Ans"]);
                answer.QuestionId = Convert.ToInt32(dataReader["QuestionId"]);
                answer.UserName = Convert.ToString(dataReader["UserName"]);
                answer.Votes = Convert.ToInt32(dataReader["Votes"]);
                
                answer.Question = QuestionDA.GetSingle(answer.QuestionId);
                answer.IsApproved = Convert.ToBoolean(dataReader["IsApproved"]);
                answer.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);
                answer.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);

            }

            // 4) Close the connection
            connection.Close();

            return answer;

        }


        public static List<Answers> GetAll()
        {
            List<Answers> answers = new List<Answers>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from answers");

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Answers answer = new Answers();

                answer.Id = Convert.ToInt32(dataReader["Id"]);
                answer.Ans = Convert.ToString(dataReader["Ans"]);
                answer.QuestionId = Convert.ToInt32(dataReader["QuestionId"]);
                answer.UserName = Convert.ToString(dataReader["UserName"]);
                answer.Votes = Convert.ToInt32(dataReader["Votes"]);
                answer.Question = QuestionDA.GetSingle(answer.QuestionId);
                answer.IsApproved = Convert.ToBoolean(dataReader["IsApproved"]);
                answer.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);
                answer.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);

                answers.Add(answer);
            }
            // 4) Close the connection
            connection.Close();


            return answers;
        }

        public static List<Answers> GetAllQuestion(int QuestionId)
        {
            List<Answers> answers = new List<Answers>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from answers where questionid='{0}'",QuestionId);

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Answers answer = new Answers();

                answer.Id = Convert.ToInt32(dataReader["Id"]);
                answer.Ans = Convert.ToString(dataReader["Ans"]);
                answer.QuestionId = Convert.ToInt32(dataReader["QuestionId"]);
                answer.UserName = Convert.ToString(dataReader["UserName"]);
                answer.Votes = Convert.ToInt32(dataReader["Votes"]);
                answer.Question = QuestionDA.GetSingle(answer.QuestionId);
                answer.IsApproved = Convert.ToBoolean(dataReader["IsApproved"]);
                answer.CreatedOn = Convert.ToString(dataReader["CreatedOn"]);
                answer.IsDeleted = Convert.ToBoolean(dataReader["IsDeleted"]);

                answers.Add(answer);
            }
            // 4) Close the connection
            connection.Close();


            return answers;
        }

    }
}


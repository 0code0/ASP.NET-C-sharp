using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessObject;
using System.Data.SqlClient;

namespace DataAccess
{
    public class TopicsDA
    {
        public static bool Add(Topics topic)
        {
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            if (topic.ParentId == 0)
            {
                command.CommandText = string.Format("insert into topics(name,subjectid,branchId,parentid) values('{0}','{1}','{2}',NULL)", topic.Name, topic.SubjectId,topic.BranchId);       
            
            }

            if (topic.ParentId != 0)
            {

                command.CommandText = string.Format("insert into topics(name,subjectid,parentid,branchId) values('{0}','{1}','{2}','{3}')", topic.Name, topic.SubjectId, topic.ParentId,topic.BranchId);
            }

            

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else



                return true;
        }

        public static bool Update(Topics topic)
        {
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            if(topic.ParentId==0)
            {

                command.CommandText = string.Format("update topics set name='{0}',subjectid='{1}',parentid= NULL,branchId = '{2}' where id='{3}'", topic.Name, topic.SubjectId,topic.BranchId,topic.Id);
            
            }
            if(topic.ParentId !=0)
            {

                command.CommandText = string.Format("update topics set name='{0}',subjectid='{1}',parentid='{2}',branchId = '{3}' where id='{4}'", topic.Name, topic.SubjectId, topic.ParentId,topic.BranchId,topic.Id);
            }
            

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else



                return true;
        }
        public static bool Delete(Topics topic)
        {

            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("delete from topics where id='{0}'", topic.Id);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else


                return true;
        }

   
        public static Topics GetSingle(int Id)
        {

            Topics topic = null;
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from topics where id = '{0}'", Id);

            SqlDataReader dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                topic = new Topics();

                topic.Id = Convert.ToInt32(dataReader["Id"]);
                topic.Name = Convert.ToString(dataReader["Name"]);
                topic.SubjectId = Convert.ToInt32(dataReader["SubjectId"]);
                topic.BranchId = Convert.ToInt32(dataReader["BranchId"]);
                if (dataReader["ParentId"] != DBNull.Value)
                    topic.ParentId = Convert.ToInt32(dataReader["ParentId"]);

                topic.Subjects = SubjectsDA.GetSingle(topic.SubjectId);
                topic.ParentTopics = TopicsDA.GetSingle(topic.ParentId);
            }

            // 4) Close the connection
            connection.Close();

            return topic;

        }


        public static List<Topics> GetAll()
        {
            List<Topics> topics = new List<Topics>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from topics");

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Topics topic = new Topics();

                topic.Id = Convert.ToInt32(dataReader["Id"]);
                topic.Name = Convert.ToString(dataReader["Name"]);
                topic.SubjectId = Convert.ToInt32(dataReader["SubjectId"]);
                topic.BranchId = Convert.ToInt32(dataReader["BranchId"]);
                if(dataReader["ParentId"]!=DBNull.Value)
                topic.ParentId = Convert.ToInt32(dataReader["ParentId"]);
                topic.Subjects = SubjectsDA.GetSingle(topic.SubjectId);
                topic.ParentTopics = TopicsDA.GetSingle(topic.ParentId);

                topics.Add(topic);
            }
            // 4) Close the connection
            connection.Close();


            return topics;
        }


        public static List<Topics> GetAllBySubjects(int SubjectId)
        {
            List<Topics> topics = new List<Topics>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from topics where subjectid ='{0}'", SubjectId);

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Topics topic = new Topics();

                topic.Id = Convert.ToInt32(dataReader["Id"]);
                topic.Name = Convert.ToString(dataReader["Name"]);
                topic.SubjectId = Convert.ToInt32(dataReader["SubjectId"]);
                topic.BranchId = Convert.ToInt32(dataReader["BranchId"]);
                if (dataReader["ParentId"] != DBNull.Value)
                    topic.ParentId = Convert.ToInt32(dataReader["ParentId"]);
                topic.Subjects = SubjectsDA.GetSingle(topic.SubjectId);
                topic.ParentTopics = TopicsDA.GetSingle(topic.ParentId);
                topics.Add(topic);
            }
            // 4) Close the connection
            connection.Close();


            return topics;
        }


        public static List<Topics> GetAllByTopics()
        {
            List<Topics> topics = new List<Topics>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "select * from topics where parentid is null";

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Topics topic = new Topics();

                topic.Id = Convert.ToInt32(dataReader["Id"]);
                topic.Name = Convert.ToString(dataReader["Name"]);
                topic.SubjectId = Convert.ToInt32(dataReader["SubjectId"]);
                topic.BranchId = Convert.ToInt32(dataReader["BranchId"]);
                if (dataReader["ParentId"] != DBNull.Value)
                topic.ParentId = Convert.ToInt32(dataReader["ParentId"]);
                topic.Subjects = SubjectsDA.GetSingle(topic.SubjectId);
                topic.ParentTopics = TopicsDA.GetSingle(topic.ParentId);


                topics.Add(topic);
            }
            // 4) Close the connection
            connection.Close();


            return topics;
        }

        public static List<Topics> GetAllByTopics(int ParentId)
        {
            List<Topics> topics = new List<Topics>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = String.Format("select * from topics where parentid ='{0}'",ParentId);

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Topics topic = new Topics();

                topic.Id = Convert.ToInt32(dataReader["Id"]);
                topic.Name = Convert.ToString(dataReader["Name"]);
                topic.SubjectId = Convert.ToInt32(dataReader["SubjectId"]);
                topic.BranchId = Convert.ToInt32(dataReader["BranchId"]);
                if (dataReader["ParentId"] != DBNull.Value)
                    topic.ParentId = Convert.ToInt32(dataReader["ParentId"]);

                topic.Subjects = SubjectsDA.GetSingle(topic.SubjectId);
                topic.ParentTopics = TopicsDA.GetSingle(topic.ParentId);

                topics.Add(topic);
            }
            // 4) Close the connection
            connection.Close();


            return topics;
        }

        public static List<Topics> GetAllBySubjectsandTopics(int SubjectId)
        {
            List<Topics> topics = new List<Topics>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from topics where subjectid ='{0}'and parentid is null", SubjectId);

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Topics topic = new Topics();

                topic.Id = Convert.ToInt32(dataReader["Id"]);
                topic.Name = Convert.ToString(dataReader["Name"]);
                topic.SubjectId = Convert.ToInt32(dataReader["SubjectId"]);
                topic.BranchId = Convert.ToInt32(dataReader["BranchId"]);
                if (dataReader["ParentId"] != DBNull.Value)
                    topic.ParentId = Convert.ToInt32(dataReader["ParentId"]);
                topic.Subjects = SubjectsDA.GetSingle(topic.SubjectId);
                topic.ParentTopics = TopicsDA.GetSingle(topic.ParentId);

                topics.Add(topic);
            }
            // 4) Close the connection
            connection.Close();


            return topics;
        }



    }
}

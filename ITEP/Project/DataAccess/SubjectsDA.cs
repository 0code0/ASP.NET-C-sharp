using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using BusinessObject;


namespace DataAccess
{
    public class SubjectsDA:BaseClassDA
    {
        public static bool Add(Subjects subject) {

            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("insert into subjects(name,branchid) values('{0}','{1}')",subject.Name,subject.BranchId);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else


            return true;
        }

        public static bool Update(Subjects subject)
        {

            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("update subjects set name='{0}',branchid='{1}'where id='{2}'",subject.Name,subject.BranchId,subject.Id);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else


            return true;
        }
        public static bool Delete(Subjects subject)
        {
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("delete from subjects where id='{0}'",subject.Id);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else



            return true;
        }


        public static Subjects GetSingle(int Id)
        {

            Subjects subjects = null;
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from subjects where id = '{0}'", Id);

            SqlDataReader dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                subjects = new Subjects();

                subjects.Id = Convert.ToInt32(dataReader["Id"]);
                subjects.Name = Convert.ToString(dataReader["Name"]);
                subjects.BranchId = Convert.ToInt32(dataReader["BranchId"]);

                subjects.Branch = BranchDA.GetSingle(subjects.BranchId);

            }

            // 4) Close the connection
            connection.Close();

            return subjects;

        }


        public static List<Subjects> GetAll()
        {
            List<Subjects> subjects = new List<Subjects>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from subjects");

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Subjects subject = new Subjects();

                subject.Id = Convert.ToInt32(dataReader["Id"]);
                subject.Name = Convert.ToString(dataReader["Name"]);
                subject.BranchId = Convert.ToInt32(dataReader["BranchId"]);
                subject.Branch = BranchDA.GetSingle(subject.BranchId);
                subjects.Add(subject);
            }
            // 4) Close the connection
            connection.Close();


            return subjects;
        }

        public static List<Subjects> GetAllByBranches(int BranchId)
        {
            List<Subjects> subjects = new List<Subjects>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from subjects where branchid ='{0}'",BranchId);

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Subjects subject = new Subjects();

                subject.Id = Convert.ToInt32(dataReader["Id"]);
                subject.Name = Convert.ToString(dataReader["Name"]);
                subject.BranchId = Convert.ToInt32(dataReader["BranchId"]);

                subject.Branch = BranchDA.GetSingle(subject.BranchId);
                subjects.Add(subject);
            }
            // 4) Close the connection
            connection.Close();


            return subjects;
        }


    }
}


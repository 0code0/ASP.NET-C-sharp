using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessObject;
using System.Data.SqlClient;
namespace DataAccess
{
   public class BranchDA:BaseClassDA
    {
        public static bool Add(Branch branch)
        {
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("insert into Branch(name) values('{0}')",branch.Name);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else
                return true;
        }

        public static bool Update(Branch branch)
        {
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("update Branch set name='{0}' where id='{1}'", branch.Name, branch.Id);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else
                return true;
        }
        public static bool Delete(Branch branch)
        {
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("delete from Branch where id='{0}'", branch.Id);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else
                return true;
        }

        public static Branch GetSingle(int Id)
        {

            Branch branch = null;
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from Branch where id = '{0}'", Id);

            SqlDataReader dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                branch = new Branch();

                branch.Id = Convert.ToInt32(dataReader["Id"]);
                branch.Name = Convert.ToString(dataReader["Name"]);

            }

            // 4) Close the connection
            connection.Close();

            return branch;

        }


        public static List<Branch> GetAll()
        {
            List<Branch> branchs = new List<Branch>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from Branch");

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Branch branch = new Branch();

                branch.Id = Convert.ToInt32(dataReader["Id"]);
                branch.Name = Convert.ToString(dataReader["Name"]);


                branchs.Add(branch);
            }
            // 4) Close the connection
            connection.Close();


            return branchs;
        }


    }
}

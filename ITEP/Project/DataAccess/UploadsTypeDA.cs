using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using BusinessObject;
namespace DataAccess
{
    public class UploadsTypeDA:BaseClassDA
    {
        public static bool Add(UploadsType uploadtype)
        {

            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("insert into uploadstype(name) values('{0}')",uploadtype.Name);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else


            return true;
        }

        public static bool Update(UploadsType uploadtype)
        {

            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("update uploadstype set name='{0}' where id='{1}'", uploadtype.Name,uploadtype.Id);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else


            return true;
        }
        public static bool Delete(UploadsType uploadtype)
        {

            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("delete from uploadstype where id='{0}'", uploadtype.Id);

            int rowsAffected = command.ExecuteNonQuery();

            // 4) Close the connection
            connection.Close();

            if (rowsAffected == 0)
                return false;
            else


            return true;
        }

        public static UploadsType GetSingle(int Id)
        {

            UploadsType uploadtype = null;
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from UploadsType where id = '{0}'",Id);

            SqlDataReader dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                uploadtype = new UploadsType();

                uploadtype.Id = Convert.ToInt32(dataReader["Id"]);
                uploadtype.Name = Convert.ToString(dataReader["Name"]);

                
            }

            // 4) Close the connection
            connection.Close();

            return uploadtype;
            
        }


        public static List<UploadsType> GetAll()
        {
            List<UploadsType> uploadtypes = new List<UploadsType>();
            // 1) Create the connection
            SqlConnection connection = new SqlConnection();
             connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            // 2) Open the connection
            connection.Open();

            // 3) Execute query
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = string.Format("select * from UploadsType");

            SqlDataReader dataReader = command.ExecuteReader();
           
            while (dataReader.Read())
            {
                UploadsType uploadtype = new UploadsType();

                uploadtype.Id = Convert.ToInt32(dataReader["Id"]);
                uploadtype.Name = Convert.ToString(dataReader["Name"]);

                uploadtypes.Add(uploadtype);
            }
            // 4) Close the connection
            connection.Close();


            return uploadtypes;
        }


    }
}

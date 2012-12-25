using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace Sklep2010
{
    public class User
    {
        int id;
        String login;
        String pass;
        String imie;
        String nazwisko;
        String adres;
        String kod;
        String miejscowosc;

        public User(int _id)
        {
            SqlConnection conn;
            SqlCommand cmd;
            SqlDataReader rdr;
            SqlParameter param;

            conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);

            conn.Open();

            cmd = new SqlCommand("SELECT * FROM users WHERE userID = @userID;");
            cmd.Connection = conn;

            param = new SqlParameter("userID", SqlDbType.Int);
            param.Value = _id;
            cmd.Parameters.Add(param);

            rdr = cmd.ExecuteReader();

            while (rdr.NextResult())
            {
                id = rdr.GetInt32(0);
            }

            conn.Close();
        }
    }
}
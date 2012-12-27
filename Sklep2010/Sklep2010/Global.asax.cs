using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using MySql.Data.MySqlClient;

namespace Sklep2010
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["cnt"] = 0;

            MySqlConnection conn;
            MySqlCommand cmd;
            MySqlDataReader rdr;

            conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);

            conn.Open();

            cmd = new MySqlCommand("SELECT licznik FROM ustawienia;");
            cmd.Connection = conn;

            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                Application["cnt"] = rdr.GetInt32(rdr.GetOrdinal("licznik"));

            }

            conn.Close();
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Application["cnt"] = (int)Application["cnt"] + 1;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {
            MySqlConnection conn;
            MySqlCommand cmd;
            MySqlParameter param;

            conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);

            conn.Open();

            cmd = new MySqlCommand("UPDATE ustawienia SET licznik = @licznik");
            cmd.Connection = conn;

            param = new MySqlParameter("licznik", MySqlDbType.Int32);
            param.Value = ((int)Application["cnt"]).ToString();
            cmd.Parameters.Add(param);

            cmd.ExecuteNonQuery();

            conn.Close();
        }
    }
}
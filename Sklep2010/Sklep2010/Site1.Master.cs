using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace Sklep2010
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["usr"] != null)
            {
                MySqlConnection conn;
                MySqlCommand cmd;
                MySqlDataReader rdr;
                MySqlParameter param;

                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);

                conn.Open();

                cmd = new MySqlCommand("SELECT userID FROM users_zapamietaj WHERE zapamietaneID = @zapamietaneID;");
                cmd.Connection = conn;

                param = new MySqlParameter("zapamietaneID", MySqlDbType.String);
                param.Value = Request.Cookies["usr"].Value;
                cmd.Parameters.Add(param);

                rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Session["user"] = new User(rdr.GetInt32(rdr.GetOrdinal("userID")));
                }

                conn.Close();
            }

            if (Request.Params["action"] != null)
            {
                if (Request.Params["action"] == "logout")
                {
                    HttpCookie cookie = new HttpCookie("usr","");
                    cookie.Expires = DateTime.Now.AddYears(-10);

                    Response.Cookies.Add(cookie);

                    Session.RemoveAll();
                    Session.Abandon();
                }
            }


            if (Session["user"] != null)
            {
                HyperLinkLogowanie.Visible = false;
                HyperLinkWyloguj.Visible = true;
                HyperLinkRejestracja.Visible = false;
                HyperLinkMyAcc.Visible = true;
            }
            else
            {
                HyperLinkLogowanie.Visible = true;
                HyperLinkWyloguj.Visible = false;
                HyperLinkRejestracja.Visible = true;
                HyperLinkMyAcc.Visible = false;
            }
        }
    }
}
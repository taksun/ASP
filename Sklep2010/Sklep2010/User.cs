using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using MySql.Data.MySqlClient;

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
            MySqlConnection conn;
            MySqlCommand cmd;
            MySqlDataReader rdr;
            MySqlParameter param;

            conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);

            conn.Open();

            cmd = new MySqlCommand("SELECT * FROM users WHERE userID = @userID;");
            cmd.Connection = conn;

            param = new MySqlParameter("userID", MySqlDbType.Int32);
            param.Value = _id;
            cmd.Parameters.Add(param);

            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                id = rdr.GetInt32(rdr.GetOrdinal("userID"));
                login = rdr.GetString(rdr.GetOrdinal("login"));
                pass = rdr.GetString(rdr.GetOrdinal("pass"));
                imie = rdr.GetString(rdr.GetOrdinal("imie"));
                nazwisko = rdr.GetString(rdr.GetOrdinal("nazwisko"));
                adres = rdr.GetString(rdr.GetOrdinal("adres"));
                kod = rdr.GetString(rdr.GetOrdinal("kod"));
                miejscowosc = rdr.GetString(rdr.GetOrdinal("miejscowosc"));
            }

            conn.Close();
        }

        public String getImieNazwisko()
        {
            return imie + " " + nazwisko;
        }

        public String getImie()
        {
            return imie;
        }

        public String getNazwisko()
        {
            return nazwisko;
        }

        public String getAdres()
        {
            return adres;
        }

        public String getKod()
        {
            return kod;
        }

        public String getMiejscowosc()
        {
            return miejscowosc;
        }

        public int getID()
        {
            return id;
        }

        public String getEmail()
        {
            return login;
        }

        public String getPass()
        {
            return pass;
        }

        public void setPass(String value)
        {
            pass = value;
        }

        public void setImie(String value)
        {
            imie = value;
        }

        public void setNazwisko(String value)
        {
            nazwisko = value;
        }

        public void setAdres(String value)
        {
            adres = value;
        }

        public void setKod(String value)
        {
            kod = value;
        }

        public void setMiejscowosc(String value)
        {
            miejscowosc = value;
        }

        public void update()
        {
            MySqlConnection conn;
            MySqlCommand cmd;
            MySqlParameter param;

            conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);

            conn.Open();

            cmd = new MySqlCommand("UPDATE users SET pass=@pass, imie=@imie, nazwisko=@nazwisko, adres=@adres, kod=@kod, miejscowosc=@miejscowosc WHERE userID = @userID;");
            cmd.Connection = conn;

            param = new MySqlParameter("userID", MySqlDbType.Int32);
            param.Value = id;
            cmd.Parameters.Add(param);

            param = new MySqlParameter("pass", MySqlDbType.String);
            param.Value = pass;
            cmd.Parameters.Add(param);

            param = new MySqlParameter("imie", MySqlDbType.String);
            param.Value = imie;
            cmd.Parameters.Add(param);

            param = new MySqlParameter("nazwisko", MySqlDbType.String);
            param.Value = nazwisko;
            cmd.Parameters.Add(param);

            param = new MySqlParameter("adres", MySqlDbType.String);
            param.Value = adres;
            cmd.Parameters.Add(param);

            param = new MySqlParameter("kod", MySqlDbType.String);
            param.Value = kod;
            cmd.Parameters.Add(param);

            param = new MySqlParameter("miejscowosc", MySqlDbType.String);
            param.Value = miejscowosc;
            cmd.Parameters.Add(param);

            cmd.ExecuteNonQuery();

            conn.Close();
        }
    }
}
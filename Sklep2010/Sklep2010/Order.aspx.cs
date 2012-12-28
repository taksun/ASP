using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

namespace Sklep2010
{
    public partial class Order : System.Web.UI.Page
    {
        public Decimal suma = 0.0M;
        public Decimal wysylka = 30.0M;
        public User usr;
        public DropDownList ddlwys;
        public DropDownList ddlpla;
        public TextBox tbImieNazwisko;
        public TextBox tbAdres;
        public TextBox tbKod;
        public TextBox tbMiejscowosc;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Server.Transfer("~/Login.aspx?order=true");
            }

            if (Request.Cookies["basket"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            usr = (User)Session["user"];

            DataView dv = (DataView)SqlDataSourceOrder.Select(DataSourceSelectArguments.Empty);

            Boolean czyil = false;

            if (dv.Count == 0)
            {
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                foreach (DataRowView drv in dv)
                {
                    int magazyn = int.Parse(drv["ileMagazyn"].ToString());
                    int ilosc = int.Parse(drv["ilosc"].ToString());
                    if (ilosc > magazyn)
                    {
                        czyil = true;
                        break;
                    }
                }
            }

            if (czyil)
            {
                Panel1.Visible = false;
                Panel4.Visible = true;
            }
        }

        protected void DataListOrder_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.DataItem != null)
            {
                suma += Decimal.Parse(((DataRowView)e.Item.DataItem)["ilosc"].ToString()) * Decimal.Parse(((DataRowView)e.Item.DataItem)["cena"].ToString());
            }
        }

        protected void ButtonAnuluj_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void ButtonZamow_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
            if (ddlwys.SelectedItem.Value.Equals("Kurier"))
            {
                suma += 30;
            }
            else
            {
                suma += 15;
            }
            Panel2.DataBind();
        }

        protected void ButtonWstecz_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
        }

        protected void DropDownListWysylka_OnLoad(object sender, EventArgs e)
        {
            ddlwys = (DropDownList)sender;
        }

        protected void DropDownListPlatnosc_OnLoad(object sender, EventArgs e)
        {
            ddlpla = (DropDownList)sender;
        }

        protected void TextBoxImieNazwisko_OnLoad(object sender, EventArgs e)
        {
            tbImieNazwisko = (TextBox)sender;
        }

        protected void TextBoxAdres_OnLoad(object sender, EventArgs e)
        {
            tbAdres = (TextBox)sender;
        }

        protected void TextBoxKod_OnLoad(object sender, EventArgs e)
        {
            tbKod = (TextBox)sender;
        }

        protected void TextBoxMiejscowosc_OnLoad(object sender, EventArgs e)
        {
            tbMiejscowosc = (TextBox)sender;
        }

        protected void ButtonPotwierz_Click(object sender, EventArgs e)
        {
            MySqlConnection conn;
            MySqlCommand cmd;
            MySqlParameter param;

            conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);

            conn.Open();

            cmd = new MySqlCommand("INSERT INTO zamowienia(wysylka, platnosc, userID) VALUES (@wysylka, @platnosc, @userID); SELECT LAST_INSERT_ID();");
            cmd.Connection = conn;

            param = new MySqlParameter("wysylka", MySqlDbType.String);
            param.Value = ddlwys.SelectedValue;
            cmd.Parameters.Add(param);

            param = new MySqlParameter("platnosc", MySqlDbType.String);
            param.Value = ddlpla.SelectedValue;
            cmd.Parameters.Add(param);

            param = new MySqlParameter("userID", MySqlDbType.Int32);
            param.Value = ((User)Session["user"]).getID();
            cmd.Parameters.Add(param);

            int id = Int32.Parse(cmd.ExecuteScalar().ToString());

            cmd.CommandText = "INSERT INTO zamowienia_wysylka(zamowienieID, imieNazwisko, adres, kod, miejscowosc) VALUES (@zamowienieID, @imieNazwisko, @adres, @kod, @miejscowosc);";

            param = new MySqlParameter("zamowienieID", MySqlDbType.Int32);
            param.Value = id;
            cmd.Parameters.Add(param);

            param = new MySqlParameter("imieNazwisko", MySqlDbType.String);
            param.Value = tbImieNazwisko.Text;
            cmd.Parameters.Add(param);

            param = new MySqlParameter("adres", MySqlDbType.String);
            param.Value = tbAdres.Text;
            cmd.Parameters.Add(param);

            param = new MySqlParameter("kod", MySqlDbType.String);
            param.Value = tbKod.Text;
            cmd.Parameters.Add(param);

            param = new MySqlParameter("miejscowosc", MySqlDbType.String);
            param.Value = tbMiejscowosc.Text;
            cmd.Parameters.Add(param);

            cmd.ExecuteNonQuery();

            cmd.CommandText = "INSERT INTO zamowienia_produkty(zamowienieID, produktID, ilosc) SELECT @zamowienieID, produktID, ilosc FROM koszyk_produkt WHERE koszykID = @koszykID;";

            param = new MySqlParameter("koszykID", MySqlDbType.String);
            param.Value = Request.Cookies["basket"].Value;
            cmd.Parameters.Add(param);

            cmd.ExecuteNonQuery();

            cmd.CommandText = "UPDATE produkty p, koszyk_produkt k SET p.ilosc = p.ilosc - k.ilosc WHERE k.koszykID = @koszykID AND p.produktID = k.produktID;";

            cmd.ExecuteNonQuery();

            cmd.CommandText = "DELETE FROM koszyk_produkt WHERE koszykID = @koszykID;";

            cmd.ExecuteNonQuery();

            conn.Close();

            Panel2.Visible = false;
            Panel3.Visible = true;
        }

        protected void ButtonPowrot_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Basket.aspx");
        }
    }
}
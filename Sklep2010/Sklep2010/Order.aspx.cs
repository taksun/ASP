using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

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

        }
    }
}
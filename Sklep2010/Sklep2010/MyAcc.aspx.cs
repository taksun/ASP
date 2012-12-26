using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Sklep2010
{
    public partial class MyAcc : System.Web.UI.Page
    {
        public User usr;
        public Decimal suma = 0.0M;
        public String wysylka;
        public Decimal wysylka_kwota;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            usr = (User)Session["user"];

            if (Request.Params["page"] != null)
            {
                if (Request.Params["page"].Equals("1"))
                {
                    PanelZamowienia.Visible = true;
                }
                else if (Request.Params["page"].Equals("2"))
                {
                    PanelProfil.Visible = true;
                    //PanelProfil.DataBind();
                }
                else if (Request.Params["page"].Equals("3"))
                {
                    PanelZmianaPass.Visible = true;
                }
            }
            else
            {
                PanelMyAcc.Visible = true;
            }
        }

        protected void ButtonZapisz_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                usr.setImie(TextBoxImie.Text);
                usr.setNazwisko(TextBoxNazwisko.Text);
                usr.setAdres(TextBoxAdres.Text);
                usr.setKod(TextBoxKodPocztowy.Text);
                usr.setMiejscowosc(TextBoxMiejscowosc.Text);

                usr.update();
            }
        }

        protected void PanelProfil_Load(object sender, EventArgs e)
        {
            if (TextBoxImie.Text.Equals(""))
            {
                TextBoxImie.Text = usr.getImie();
            }

            if (TextBoxNazwisko.Text.Equals(""))
            {
                TextBoxNazwisko.Text = usr.getNazwisko();
            }

            if (TextBoxAdres.Text.Equals(""))
            {
                TextBoxAdres.Text = usr.getAdres();
            }

            if (TextBoxKodPocztowy.Text.Equals(""))
            {
                TextBoxKodPocztowy.Text = usr.getKod();
            }

            if (TextBoxMiejscowosc.Text.Equals(""))
            {
                TextBoxMiejscowosc.Text = usr.getMiejscowosc();
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (TextBoxAktHaslo.Text.Equals(usr.getPass()))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void ButtonZmienHaslo_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                usr.setPass(TextBoxHaslo.Text);

                usr.update();

                LabelPassChanged.Visible = true;
            }
        }

        protected void PanelZamowienia_Load(object sender, EventArgs e)
        {
            SqlDataSourceZamowienia.SelectParameters["userID"].DefaultValue = usr.getID().ToString();
        }

        protected void DataListZamowienia_EditCommand(object source, DataListCommandEventArgs e)
        {
            SqlDataSourceSzczegoly.SelectParameters["zamowienieID"].DefaultValue = DataListZamowienia.DataKeys[e.Item.ItemIndex].ToString();
            SqlDataSourceSzczegoly2.SelectParameters["zamowienieID"].DefaultValue = DataListZamowienia.DataKeys[e.Item.ItemIndex].ToString();
            PanelSzczegoly.Visible = true;
            PanelZamowienia.Visible = false;
        }

        protected void ButtonWstecz_Click(object sender, EventArgs e)
        {
            PanelSzczegoly.Visible = false;
        }

        protected void DataListSzczegoly2_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.DataItem != null)
            {
                suma += Decimal.Parse(((DataRowView)e.Item.DataItem)["ilosc"].ToString()) * Decimal.Parse(((DataRowView)e.Item.DataItem)["cena"].ToString());
            }
        }

        protected void DataListSzczegoly_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.DataItem != null)
            {
                wysylka = ((DataRowView)e.Item.DataItem)["wysylka"].ToString();

                if (wysylka.Equals("Kurier"))
                {
                    wysylka_kwota = 30;
                }
                else
                {
                    wysylka_kwota = 15;
                }

                suma += wysylka_kwota;
            }
        }
    }
}
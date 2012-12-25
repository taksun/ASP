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
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Sklep2010
{
    public partial class Basket : System.Web.UI.Page
    {
        public Decimal suma = 0.0M;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void DataListKoszyk_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.DataItem != null)
            {
                suma += Decimal.Parse(((DataRowView)e.Item.DataItem)["ilosc"].ToString()) * Decimal.Parse(((DataRowView)e.Item.DataItem)["cena"].ToString());
            }
        }

        protected void DataListKoszyk_CancelCommand(object source, DataListCommandEventArgs e)
        {
            SqlDataSourceKoszyk.Insert();
        }

        protected void DataListKoszyk_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            SqlDataSourceKoszyk.DeleteParameters["produktID"].DefaultValue = DataListKoszyk.DataKeys[e.Item.ItemIndex].ToString();

            SqlDataSourceKoszyk.Delete();
        }

        protected void DataListKoszyk_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            foreach (DataListItem item in DataListKoszyk.Items)
            {
                SqlDataSourceKoszyk.UpdateParameters["produktID"].DefaultValue = DataListKoszyk.DataKeys[item.ItemIndex].ToString();
                SqlDataSourceKoszyk.UpdateParameters["ilosc"].DefaultValue = ((TextBox)item.FindControl("TextBoxIlosc")).Text;

                SqlDataSourceKoszyk.Update();
            }
        }

        protected void ButtonZamow_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Order.aspx");
        }

    }
}
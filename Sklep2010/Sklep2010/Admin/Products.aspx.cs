using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace Sklep2010.Admin
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("~/Admin/Default.aspx");
            }
        }

        protected void ButtonDodaj_Click(object sender, EventArgs e)
        {
            MySqlConnection conn;
            MySqlCommand cmd;
            MySqlParameter param;

            conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);

            conn.Open();

            cmd = new MySqlCommand("INSERT INTO produkty (nazwa, producent, kategoria, cena, opis, ilosc) VALUES (@nazwa, @producent, @kategoria, @cena, @opis, @ilosc);");
            cmd.Connection = conn;

            param = new MySqlParameter("nazwa", MySqlDbType.String);
            param.Value = TextBoxNazwa.Text;
            cmd.Parameters.Add(param);

            param = new MySqlParameter("producent", MySqlDbType.Int32);
            param.Value = DropDownListProducent.SelectedValue;
            cmd.Parameters.Add(param);

            param = new MySqlParameter("kategoria", MySqlDbType.Int32);
            param.Value = DropDownListKategoria.SelectedValue;
            cmd.Parameters.Add(param);

            param = new MySqlParameter("cena", MySqlDbType.Decimal);
            param.Value = TextBoxCena.Text;
            cmd.Parameters.Add(param);

            param = new MySqlParameter("opis", MySqlDbType.String);
            param.Value = TextBoxOpis.Text;
            cmd.Parameters.Add(param);

            param = new MySqlParameter("ilosc", MySqlDbType.Int32);
            param.Value = TextBoxIlosc.Text;
            cmd.Parameters.Add(param);

            cmd.ExecuteNonQuery();

            conn.Close();

            Response.Redirect("~/Admin/Products.aspx");
        }

        protected void DataListProdukty_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            SqlDataSourceProdukty.DeleteParameters["produktID"].DefaultValue = DataListProdukty.DataKeys[e.Item.ItemIndex].ToString();
            SqlDataSourceProdukty.Delete();
        }

        protected void DataListProdukty_EditCommand(object source, DataListCommandEventArgs e)
        {
            DataListProdukty.EditItemIndex = e.Item.ItemIndex;

            DataListProdukty.DataBind();
        }

        protected void DataListProdukty_CancelCommand(object source, DataListCommandEventArgs e)
        {
            DataListProdukty.EditItemIndex = -1;
            DataListProdukty.DataBind();
        }

        protected void DataListProdukty_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            SqlDataSourceProdukty.UpdateParameters["produktID"].DefaultValue = DataListProdukty.DataKeys[e.Item.ItemIndex].ToString();
            SqlDataSourceProdukty.UpdateParameters["nazwa"].DefaultValue = ((TextBox)e.Item.FindControl("TextBoxNazwa")).Text;
            SqlDataSourceProdukty.UpdateParameters["producent"].DefaultValue = ((DropDownList)e.Item.FindControl("DropDownListProducent")).SelectedValue;
            SqlDataSourceProdukty.UpdateParameters["kategoria"].DefaultValue = ((DropDownList)e.Item.FindControl("DropDownListKategoria")).SelectedValue;
            SqlDataSourceProdukty.UpdateParameters["cena"].DefaultValue = ((TextBox)e.Item.FindControl("TextBoxCena")).Text;
            SqlDataSourceProdukty.UpdateParameters["opis"].DefaultValue = ((TextBox)e.Item.FindControl("TextBoxOpis")).Text;
            SqlDataSourceProdukty.UpdateParameters["ilosc"].DefaultValue = ((TextBox)e.Item.FindControl("TextBoxIlosc")).Text;

            SqlDataSourceProdukty.Update();

            DataListProdukty.EditItemIndex = -1;
            DataListProdukty.DataBind();
        }

        protected void DataListProdukty_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemIndex == DataListProdukty.EditItemIndex)
            {
                DropDownList ddl = (DropDownList)e.Item.FindControl("DropDownListProducent");
                if (ddl != null)
                {
                    String value = ((DataRowView)e.Item.DataItem)["producentID"].ToString();
                    ddl.SelectedValue = value;
                }

                ddl = (DropDownList)e.Item.FindControl("DropDownListKategoria");
                if (ddl != null)
                {
                    String value = ((DataRowView)e.Item.DataItem)["kategoriaID"].ToString();
                    ddl.SelectedValue = value;
                }
            }
        }
    }
}
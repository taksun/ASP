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
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataListSzukaj_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            HttpCookie cookie;

            if (Request.Cookies["basket"] == null)
            {
                cookie = new HttpCookie("basket", System.Guid.NewGuid().ToString());
                cookie.Expires = DateTime.Now.AddDays(1);

                Response.Cookies.Add(cookie);

                SqlDataSourceKoszyk.InsertParameters["koszykID"].DefaultValue = cookie.Value;
                SqlDataSourceKoszyk.Insert();
            }
            else
            {
                cookie = Request.Cookies["basket"];
            }

            SqlDataSourceKoszyk.SelectParameters["koszykID"].DefaultValue = cookie.Value;
            SqlDataSourceKoszyk.SelectParameters["produktID"].DefaultValue = DataListSzukaj.DataKeys[e.Item.ItemIndex].ToString();

            DataView dv = (DataView)SqlDataSourceKoszyk.Select(DataSourceSelectArguments.Empty);

            if (dv.Count > 0)
            {
                SqlDataSourceSzukaj.UpdateParameters["koszykID"].DefaultValue = cookie.Value;
                SqlDataSourceSzukaj.UpdateParameters["produktID"].DefaultValue = DataListSzukaj.DataKeys[e.Item.ItemIndex].ToString();

                SqlDataSourceSzukaj.Update();
            }
            else
            {
                SqlDataSourceSzukaj.InsertParameters["koszykID"].DefaultValue = cookie.Value;
                SqlDataSourceSzukaj.InsertParameters["produktID"].DefaultValue = DataListSzukaj.DataKeys[e.Item.ItemIndex].ToString();

                SqlDataSourceSzukaj.Insert();
            }

            Response.Redirect("~/Basket.aspx");
        }

        protected void ButtonSzukaj_Click(object sender, EventArgs e)
        {
            SqlDataSourceSzukaj.SelectParameters["nazwa"].DefaultValue = '%'+TextBoxSzukaj.Text+'%';
        }

        protected void DataListSzukaj_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.DataItem == null) return;

            int ilosc = Int32.Parse(((DataRowView)e.Item.DataItem)["ilosc"].ToString());

            if (ilosc < 1) ((Button)e.Item.FindControl("ButtonDoKoszyka")).Enabled = false;

            MySqlConnection conn;
            MySqlCommand cmd;
            MySqlDataReader rdr;
            MySqlParameter param;

            conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);

            conn.Open();

            cmd = new MySqlCommand("SELECT obrazek FROM produkty_obrazki WHERE produktID = @produktID LIMIT 1;");
            cmd.Connection = conn;

            param = new MySqlParameter("produktID", MySqlDbType.Int32);
            param.Value = ((DataRowView)e.Item.DataItem)["produktID"].ToString();
            cmd.Parameters.Add(param);

            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                ((Image)e.Item.FindControl("ImageObrazek")).ImageUrl = "~/images/products/" + ((DataRowView)e.Item.DataItem)["produktID"].ToString() + "/" + rdr.GetString(rdr.GetOrdinal("obrazek"));
            }

            conn.Close();
        }
    }
}
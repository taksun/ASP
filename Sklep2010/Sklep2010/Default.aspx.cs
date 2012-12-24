using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Sklep
{
    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            int cat = 0;
            if (Request.Params["category"] != null)
            {
                cat = int.Parse(Request.Params["category"]);
            }
            SqlDataSourceProdukty.SelectParameters["kategoria"].DefaultValue = cat.ToString();
        }

        protected void BulletedListKategorie_DataBound(object sender, EventArgs e)
        {
            if (BulletedListKategorie.Items.Count > 0)
            {
                foreach(ListItem item in BulletedListKategorie.Items)
                {
                    item.Value = "~/Default.aspx?category=" + item.Value;
                }

                BulletedListKategorie.Items[0].Attributes["class"] = "first";
            }
        }

        protected void DataListProdukty_UpdateCommand(object source, DataListCommandEventArgs e)
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
            SqlDataSourceKoszyk.SelectParameters["produktID"].DefaultValue = DataListProdukty.DataKeys[e.Item.ItemIndex].ToString();

            DataView dv = (DataView)SqlDataSourceKoszyk.Select(DataSourceSelectArguments.Empty);

            if (dv.Count > 0)
            {
                SqlDataSourceProdukty.UpdateParameters["koszykID"].DefaultValue = cookie.Value;
                SqlDataSourceProdukty.UpdateParameters["produktID"].DefaultValue = DataListProdukty.DataKeys[e.Item.ItemIndex].ToString();

                SqlDataSourceProdukty.Update();
            }
            else
            {
                SqlDataSourceProdukty.InsertParameters["koszykID"].DefaultValue = cookie.Value;
                SqlDataSourceProdukty.InsertParameters["produktID"].DefaultValue = DataListProdukty.DataKeys[e.Item.ItemIndex].ToString();

                SqlDataSourceProdukty.Insert();
            }

            Response.Redirect("~/Basket.aspx");
        }
    }
}
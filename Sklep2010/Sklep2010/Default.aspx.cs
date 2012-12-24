using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
    }
}
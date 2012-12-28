using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Sklep2010
{

    public partial class Logowanie : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Zaloguj_Click(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSourceLogin.Select(DataSourceSelectArguments.Empty);          

            if (dv.Count > 0)
            {
                DataRowView drv = dv[0];

                if (drv["blokada"].ToString().Equals("True"))
                {
                    LInfo.Text = "To konto jest zablokowane!";
                    LInfo.Visible = true;
                }
                else
                {
                    if (CheckBoxZapamietaj.Checked)
                    {
                        HttpCookie cookie = new HttpCookie("usr", System.Guid.NewGuid().ToString());
                        cookie.Expires = DateTime.Now.AddYears(10);

                        Response.Cookies.Add(cookie);

                        SqlDataSourceLogin.DeleteParameters["userID"].DefaultValue = drv["userID"].ToString();

                        SqlDataSourceLogin.Delete();

                        SqlDataSourceLogin.InsertParameters["userID"].DefaultValue = drv["userID"].ToString();
                        SqlDataSourceLogin.InsertParameters["zapamietaneID"].DefaultValue = cookie.Value;

                        SqlDataSourceLogin.Insert();
                    }


                    Session["user"] = new User(int.Parse(drv["userID"].ToString()));


                    if (Request.Params["order"] != null)
                    {
                        Response.Redirect("~/Order.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                }
            }
            else
            {
                LInfo.Text = "Niepoprawny login lub hasło!";
                LInfo.Visible = true;
            }

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sklep
{

    public partial class Logowanie : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Zaloguj_Click(object sender, EventArgs e)
        {
            if ((TextBoxLogin.Text == "asd@asd.pl") && (TextBoxHaslo.Text == "asdqwe123"))
            {
                Session["user"] = TextBoxLogin.Text;

                Server.Transfer("~/Default.aspx");
                
            }
            else
            {
                LInfo.Text = "Niepoprawny login lub hasło!";
                LInfo.Visible = true;
                
            }

        }
    }
}
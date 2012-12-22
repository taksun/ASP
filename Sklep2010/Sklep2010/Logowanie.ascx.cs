using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sklep
{
    public delegate void LogowanieDelegate(bool zalogowany);

    public partial class Logowanie : System.Web.UI.UserControl
    {
        public event LogowanieDelegate LogowanieEvent;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Zaloguj_Click(object sender, EventArgs e)
        {
            if ((TextBoxLogin.Text == "asd@asd.pl") && (TextBoxHaslo.Text == "asdqwe123"))
            {
                LInfo.Text = "Witaj asd@asd.pl!";

                if (LogowanieEvent != null)
                    LogowanieEvent(true);

                Zaloguj.Text = "Wyloguj";
                Zaloguj.ValidationGroup = "";
                TextBoxLogin.Visible = false;
                TextBoxHaslo.Visible = false;
                LLogin.Visible = false;
                LHaslo.Visible = false;
                HyperLinkPrzypomnijHaslo.Visible = false;
                LInfo.Visible = true; 
            }
            else
            {
                LInfo.Text = "Niepoprawny login lub hasło!";

                if (Zaloguj.Text == "Zaloguj")
                {
                    LInfo.Visible = true;
                }
                else
                {
                    LInfo.Visible = false;
                    Zaloguj.Text = "Zaloguj";
                    Zaloguj.ValidationGroup = "login";
                    TextBoxLogin.Visible = true;
                    TextBoxLogin.Text = "";
                    TextBoxHaslo.Visible = true;
                    TextBoxHaslo.Text = "";
                    LLogin.Visible = true;
                    LHaslo.Visible = true;
                    HyperLinkPrzypomnijHaslo.Visible = true;
                }
                

                if (LogowanieEvent != null)
                    LogowanieEvent(false);
            }

        }
    }
}
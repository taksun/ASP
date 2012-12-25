using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sklep2010
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["action"] != null)
            {
                if (Request.Params["action"] == "logout")
                {
                    Session.RemoveAll();
                    Session.Abandon();
                }
            }


            if (Session["user"] != null)
            {
                HyperLinkLogowanie.Visible = false;
                HyperLinkWyloguj.Visible = true;
                HyperLinkRejestracja.Visible = false;
                HyperLinkMyAcc.Visible = true;
            }
            else
            {
                HyperLinkLogowanie.Visible = true;
                HyperLinkWyloguj.Visible = false;
                HyperLinkRejestracja.Visible = true;
                HyperLinkMyAcc.Visible = false;
            }
        }
    }
}
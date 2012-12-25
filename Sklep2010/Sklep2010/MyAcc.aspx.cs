using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sklep2010
{
    public partial class MyAcc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            if (Request.Params["page"] != null)
            {
                if (Request.Params["page"].Equals("1"))
                {
                    PanelZamowienia.Visible = true;
                }
                else if (Request.Params["page"].Equals("2"))
                {
                    PanelProfil.Visible = true;
                }
                else if (Request.Params["page"].Equals("3"))
                {
                    PanelZmianaPass.Visible = true;
                }
                else if (Request.Params["page"].Equals("4"))
                {
                    PanelZmianaEmail.Visible = true;
                }
            }
            else
            {
                PanelMyAcc.Visible = true;
            }
        }
    }
}
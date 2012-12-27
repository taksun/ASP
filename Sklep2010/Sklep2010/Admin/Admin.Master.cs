using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sklep2010.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["action"] != null)
            {
                if (Request.Params["action"] == "logout")
                {
                    Session.RemoveAll();
                    Session.Abandon();
                    Response.Redirect("~/Admin/Default.aspx");
                }
            }

            if (Session["admin"] != null)
            {
                PanelMenu.Visible = true;
            }
        }
    }
}
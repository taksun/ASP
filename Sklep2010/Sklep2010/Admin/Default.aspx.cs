﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sklep2010.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                PanelLogin.Visible = false;
                LabelLogin.Visible = true;
            }
        }

        protected void ButtonZaloguj_Click(object sender, EventArgs e)
        {
            if (TextBoxLogin.Text.Equals("admin") && TextBoxHaslo.Text.Equals("admin"))
            {
                Session["admin"] = true;
                Response.Redirect("~/Admin/Default.aspx");
            }
        }
    }
}
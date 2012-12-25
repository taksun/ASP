using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Sklep2010
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (CheckBoxRegulamin.Checked)
                args.IsValid = true;
            else
                args.IsValid = false;
        }

        protected void ButtonRejestracja_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlDataSourceRegister.Insert();

                Response.Redirect("~/Default.aspx");
            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DataView dv = (DataView)SqlDataSourceRegister.Select(DataSourceSelectArguments.Empty);

            if (dv.Count > 0)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Sklep2010.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("~/Admin/Default.aspx");
            }
        }

        protected void DataListUsers_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            SqlDataSourceUsers.DeleteParameters["userID"].DefaultValue = DataListUsers.DataKeys[e.Item.ItemIndex].ToString();

            SqlDataSourceUsers.Delete();
        }

        protected void DataListUsers_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            SqlDataSourceUsers.UpdateParameters["userID"].DefaultValue = DataListUsers.DataKeys[e.Item.ItemIndex].ToString();
            SqlDataSourceUsers.UpdateParameters["blokada"].DefaultValue = e.CommandArgument.ToString();

            SqlDataSourceUsers.Update();
        }

        protected void DataListUsers_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.DataItem != null)
            {
                String value = ((DataRowView)e.Item.DataItem)["blokada"].ToString();
                if (value.Equals("True"))
                {
                    ((Button)e.Item.FindControl("ButtonZablokuj")).CommandArgument = "False";
                    ((Button)e.Item.FindControl("ButtonZablokuj")).Text = "Odblokuj";
                }
            }
        }
    }
}
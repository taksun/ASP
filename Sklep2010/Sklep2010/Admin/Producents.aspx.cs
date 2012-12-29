using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.IO;


namespace Sklep2010.Admin
{
    public partial class Producents : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("~/Admin/Default.aspx");
            }
        }

        protected void ButtonDodaj_Click(object sender, EventArgs e)
        {
            MySqlConnection conn;
            MySqlCommand cmd;
            MySqlParameter param;

            conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);

            conn.Open();

            cmd = new MySqlCommand("INSERT INTO producenci (nazwa) VALUES (@nazwa);");
            cmd.Connection = conn;

            param = new MySqlParameter("nazwa", MySqlDbType.String);
            param.Value = TextBoxNazwa.Text;
            cmd.Parameters.Add(param);

            cmd.ExecuteNonQuery();

            conn.Close();

            Response.Redirect("~/Admin/Producents.aspx");
        }

        protected void DataListProducenci_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            SqlDataSourceProducenci.DeleteParameters["producentID"].DefaultValue = DataListProducenci.DataKeys[e.Item.ItemIndex].ToString();
            SqlDataSourceProducenci.Delete();

         
        }

        protected void DataListProducenci_EditCommand(object source, DataListCommandEventArgs e)
        {
            DataListProducenci.EditItemIndex = e.Item.ItemIndex;

            DataListProducenci.DataBind();
        }

        protected void DataListProducenci_CancelCommand(object source, DataListCommandEventArgs e)
        {
            DataListProducenci.EditItemIndex = -1;
            DataListProducenci.DataBind();
        }

        protected void DataListProducenci_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            SqlDataSourceProducenci.UpdateParameters["producentID"].DefaultValue = DataListProducenci.DataKeys[e.Item.ItemIndex].ToString();
            SqlDataSourceProducenci.UpdateParameters["nazwa"].DefaultValue = ((TextBox)e.Item.FindControl("TextBoxNazwa")).Text;


            SqlDataSourceProducenci.Update();

            DataListProducenci.EditItemIndex = -1;
            DataListProducenci.DataBind();
        }
        
    }
}
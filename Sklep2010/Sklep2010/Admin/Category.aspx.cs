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
    public partial class Category : System.Web.UI.Page
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

            cmd = new MySqlCommand("INSERT INTO kategorie (nazwa) VALUES (@nazwa);");
            cmd.Connection = conn;

            param = new MySqlParameter("nazwa", MySqlDbType.String);
            param.Value = TextBoxNazwa.Text;
            cmd.Parameters.Add(param);

            cmd.ExecuteNonQuery();

            conn.Close();

            Response.Redirect("~/Admin/Category.aspx");
        }

        protected void DataListKategorie_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            SqlDataSourceKategorie.DeleteParameters["kategoriaID"].DefaultValue = DataListKategorie.DataKeys[e.Item.ItemIndex].ToString();
            SqlDataSourceKategorie.Delete();

         
        }

        protected void DataListKategorie_EditCommand(object source, DataListCommandEventArgs e)
        {
            DataListKategorie.EditItemIndex = e.Item.ItemIndex;

            DataListKategorie.DataBind();
        }

        protected void DataListKategorie_CancelCommand(object source, DataListCommandEventArgs e)
        {
            DataListKategorie.EditItemIndex = -1;
            DataListKategorie.DataBind();
        }

        protected void DataListKategorie_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            SqlDataSourceKategorie.UpdateParameters["kategoriaID"].DefaultValue = DataListKategorie.DataKeys[e.Item.ItemIndex].ToString();
            SqlDataSourceKategorie.UpdateParameters["nazwa"].DefaultValue = ((TextBox)e.Item.FindControl("TextBoxNazwa")).Text;


            SqlDataSourceKategorie.Update();

            DataListKategorie.EditItemIndex = -1;
            DataListKategorie.DataBind();
        }
        
    }
}
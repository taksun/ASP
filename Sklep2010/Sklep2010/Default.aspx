<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sklep.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="sidebar1">
        <h2>Kategorie
        </h2>
        <asp:BulletedList ID="BulletedListKategorie" runat="server" 
            CssClass="list-style2" DisplayMode="HyperLink" DataMember="DefaultView" 
            DataSourceID="SqlDataSourceKategorie" DataTextField="nazwa" 
            DataValueField="kategoriaID" ondatabound="BulletedListKategorie_DataBound">
        </asp:BulletedList>
        <asp:SqlDataSource ID="SqlDataSourceKategorie" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
            SelectCommand="SELECT kategoriaID, nazwa FROM kategorie">
            </asp:SqlDataSource>
    </div>

    <div id="content2">
        <% if (Request.Params["category"] != null)
           { %>
        <asp:DataList ID="DataListProdukty" runat="server" 
            DataSourceID="SqlDataSourceProdukty" DataKeyField="produktID">
            <FooterTemplate>
                </table>
                <asp:Label ID="lblEmpty" Text="Brak produktów w kategorii" runat="server" Visible='<%#bool.Parse((DataListProdukty.Items.Count==0).ToString())%>'></asp:Label>
            </FooterTemplate>
            <HeaderTemplate>
                <% if (DataListProdukty.Items.Count > 0)
                   { %>
                <table>
                    <tr>
                        <th style="width:100px;"></th>
                        <th style="width:200px;">Nazwa</th>
                        <th style="width:100px;">Producent</th>
                        <th>Cena</th>
                        <th></th>
                    </tr>  
                <% } %>
            </HeaderTemplate>
            <ItemTemplate>
                
                    <tr>
                        <td><a href='Product.aspx?id=<%# Eval("produktID") %>'>PIC</a></td>
                        <td><a href='Product.aspx?id=<%# Eval("produktID") %>'><%# Eval("nazwa") %></a></td>
                        <td><%# Eval("producent") %></td>
                        <td><%# Eval("cena") %></td>
                        <td><asp:Button ID="ButtonDoKoszyka" runat="server" Text="Dodaj do koszyka" /></td>
                    </tr>                  

            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSourceProdukty" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
            SelectCommand="SELECT p.nazwa, p.cena, p.produktID, pr.nazwa as producent FROM produkty p, producenci pr WHERE (p.kategoria = ?) AND (pr.producentID = p.producent)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="kategoria" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <% }
           else
           { %>

           Nasza strona główna HEY!

        <% } %>
    </div>
</asp:Content>

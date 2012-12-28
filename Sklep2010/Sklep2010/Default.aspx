<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sklep2010.Default" %>
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
            DataSourceID="SqlDataSourceProdukty" DataKeyField="produktID" 
            onupdatecommand="DataListProdukty_UpdateCommand" 
            onitemdatabound="DataListProdukty_ItemDataBound">
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
                        <td><asp:Button ID="ButtonDoKoszyka" runat="server" Text="Dodaj do koszyka" 
                                CommandName="Update" /></td>
                    </tr>                  

            </ItemTemplate>
        </asp:DataList>
        
        <asp:SqlDataSource ID="SqlDataSourceProdukty" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
            
            SelectCommand="SELECT p.nazwa, p.cena, p.produktID, pr.nazwa as producent, p.ilosc FROM produkty p, producenci pr WHERE (p.kategoria = ?) AND (pr.producentID = p.producent)" 
            
            InsertCommand="INSERT INTO koszyk_produkt(koszykID, produktID) VALUES (@koszykID, @produktID)" 
            UpdateCommand="UPDATE koszyk_produkt SET ilosc = ilosc+1 WHERE koszykID = @koszykID AND produktID = @produktID">
            <InsertParameters>
                <asp:Parameter Name="koszykID" Type="String" />
                <asp:Parameter Name="produktID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="kategoria" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="koszykID" Type="String" />
                <asp:Parameter Name="produktID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceKoszyk" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            InsertCommand="INSERT INTO koszyk(koszykID) VALUES (@koszykID)" 
            ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
            SelectCommand="SELECT * FROM koszyk_produkt WHERE koszykID = @koszykID AND produktID = @produktID" 
            UpdateCommand="UPDATE koszyk SET koszykID = @koszykID">
            <InsertParameters>
                <asp:Parameter Name="koszykID" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="koszykID" Type="String" />
                <asp:Parameter Name="produktID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <% }
           else
           { %>

           Nasza strona główna HEY!

        <% } %>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Sklep2010.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .search 
        {
            width: 600px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="search">
        
        <asp:TextBox ID="TextBoxSzukaj" runat="server"></asp:TextBox>
        <asp:Button ID="ButtonSzukaj" runat="server" Text="Szukaj" 
            onclick="ButtonSzukaj_Click" />
        
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBoxSzukaj" ErrorMessage="Musisz coś podać!"></asp:RequiredFieldValidator>
        
        <br />
        <asp:SqlDataSource ID="SqlDataSourceSzukaj" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
            SelectCommand="SELECT p.nazwa, k.nazwa as kategoria, k.kategoriaID, p.cena, p.produktID, p.ilosc FROM produkty p, kategorie k WHERE p.kategoria = k.kategoriaID AND p.nazwa LIKE @nazwa"
            InsertCommand="INSERT INTO koszyk_produkt(koszykID, produktID) VALUES (@koszykID, @produktID)" 
            UpdateCommand="UPDATE koszyk_produkt SET ilosc = ilosc+1 WHERE koszykID = @koszykID AND produktID = @produktID">
            <InsertParameters>
                <asp:Parameter Name="koszykID" Type="String" />
                <asp:Parameter Name="produktID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="nazwa" Type="String" />
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
        <asp:DataList ID="DataListSzukaj" runat="server" 
            DataSourceID="SqlDataSourceSzukaj" DataKeyField="produktID" 
            onupdatecommand="DataListSzukaj_UpdateCommand" 
            onitemdatabound="DataListSzukaj_ItemDataBound">
            <HeaderTemplate>
                <table>
                    <tr>
                        <th></th>
                        <th>Nazwa</th>
                        <th>Kategoria</th>
                        <th>Cena</th>
                        <th></th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                        <td><a href='Product.aspx?id=<%# Eval("produktID") %>'><asp:Image ID="ImageObrazek" runat="server" ImageUrl="~/images/No_image.jpg" Width="100" Height="100"></asp:Image></a></td>
                        <td><a href='Product.aspx?id=<%# Eval("produktID") %>'><%# Eval("nazwa") %></a></td>
                        <td><a href='Default.aspx?category=<%# Eval("kategoriaID") %>'><%# Eval("kategoria") %></a></td>
                        <td><%# Eval("cena") %></td>
                        <td><asp:Button ID="ButtonDoKoszyka" runat="server" Text="Dodaj do koszyka" 
                                CommandName="Update" /></td>
                    </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:DataList>
        
    </div>
</asp:Content>

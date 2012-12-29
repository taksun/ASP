<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Sklep2010.Admin.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <asp:Panel ID="Panel1" runat="server">
    <asp:SqlDataSource ID="SqlDataSourceProdukty" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CS %>" 
        ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
        
        SelectCommand="SELECT p.produktID, p.nazwa, p.cena, p.opis, p.ilosc, pr.producentID, pr.nazwa as producent, k.kategoriaID, k.nazwa as kategoria FROM produkty p, producenci pr, kategorie k WHERE p.producent = pr.producentID AND p.kategoria = k.kategoriaID" 
        DeleteCommand="DELETE FROM produkty WHERE (produktID = @produktID)" 
        UpdateCommand="UPDATE produkty SET nazwa = @nazwa, producent = @producent, kategoria = @kategoria, cena = @cena, opis = @opis, ilosc = @ilosc WHERE produktID = @produktID">
        <DeleteParameters>
            <asp:Parameter Name="produktID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="nazwa" Type="String" />
            <asp:Parameter Name="producent" Type="Int32" />
            <asp:Parameter Name="kategoria" Type="String" />
            <asp:Parameter Name="cena" Type="Decimal" />
            <asp:Parameter Name="opis" Type="String" />
            <asp:Parameter Name="ilosc" Type="Int32" />
            <asp:Parameter Name="produktID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DataList ID="DataListProdukty" runat="server" 
        DataSourceID="SqlDataSourceProdukty" 
        ondeletecommand="DataListProdukty_DeleteCommand" DataKeyField="produktID" 
        oneditcommand="DataListProdukty_EditCommand" 
        oncancelcommand="DataListProdukty_CancelCommand" 
        onupdatecommand="DataListProdukty_UpdateCommand" 
        onitemdatabound="DataListProdukty_ItemDataBound" 
        onitemcommand="DataListProdukty_ItemCommand">
        <HeaderTemplate>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Nazwa</th>
                    <th>Producent</th>
                    <th>Kategoria</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("produktID") %></td>
                <td><%# Eval("nazwa") %></td>
                <td><%# Eval("producent") %></td>
                <td><%# Eval("kategoria") %></td>
                <td><asp:Button ID="ButtonEdytujObrazki" runat="server" Text="Edytuj Obrazki" CommandName="Item" /></td>
                <td><asp:Button ID="ButtonEdytuj" runat="server" Text="Edytuj" CommandName="Edit" /></td>
                <td><asp:Button ID="ButtonUsun" runat="server" Text="Usuń" CommandName="Delete" /></td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
        <tr>
            <td colspan="2">ID:</td>
            <td colspan="5">
                <%# Eval("produktID") %>
            </td>
        </tr>
        <tr>
            <td colspan="2">
            Nazwa:</td>
            <td colspan="5">
            <asp:TextBox ID="TextBoxNazwa" runat="server" Text='<%# Bind("nazwa") %>'></asp:TextBox>
            </td>
        <tr>
            <td colspan="2">
                Producent:</td>
            <td colspan="5">
                <asp:DropDownList ID="DropDownListProducent" runat="server" 
                    DataSourceID="Producent" DataTextField="nazwa" DataValueField="producentID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="Producent" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CS %>" 
                    ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
                    SelectCommand="SELECT nazwa, producentID FROM producenci">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">Kategoria:</td>
            <td colspan="5">
                <asp:DropDownList ID="DropDownListKategoria" runat="server" 
                    DataSourceID="Kategorie" DataTextField="nazwa" DataValueField="kategoriaID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="Kategorie" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CS %>" 
                    ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
                    SelectCommand="SELECT nazwa, kategoriaID FROM kategorie">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">Cena:</td>
            <td colspan="5">
                <asp:TextBox ID="TextBoxCena" runat="server" Text='<%# Bind("cena") %>'></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">Ilość:</td>
            <td colspan="5">
                <asp:TextBox ID="TextBoxIlosc" runat="server"  Text='<%# Bind("ilosc") %>'></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">Opis:</td>
            <td colspan="5">
                <asp:TextBox ID="TextBoxOpis" runat="server" TextMode="MultiLine"  Text='<%# Bind("opis") %>'></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
            <td colspan="5">
                <asp:Button ID="ButtonZapisz" runat="server" Text="Zapisz" CommandName="Update" />
                <asp:Button ID="ButtonAnuluj" runat="server" Text="Anuluj" CommandName="Cancel" />
            </td>
        </tr>
        </EditItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:DataList>

    <br />
    Dodaj nowy produkt
    <br />
    <table class="auto-style4">
        <tr>
            <td>Nazwa:</td>
            <td>
                <asp:TextBox ID="TextBoxNazwa" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Producent:</td>
            <td>
                <asp:DropDownList ID="DropDownListProducent" runat="server" 
                    DataSourceID="Producent" DataTextField="nazwa" DataValueField="producentID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="Producent" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CS %>" 
                    ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
                    SelectCommand="SELECT nazwa, producentID FROM producenci">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Kategotia:</td>
            <td>
                <asp:DropDownList ID="DropDownListKategoria" runat="server" 
                    DataSourceID="Kategorie" DataTextField="nazwa" DataValueField="kategoriaID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="Kategorie" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CS %>" 
                    ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
                    SelectCommand="SELECT nazwa, kategoriaID FROM kategorie">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Cena:</td>
            <td>
                <asp:TextBox ID="TextBoxCena" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Ilość:</td>
            <td>
                <asp:TextBox ID="TextBoxIlosc" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Opis:</td>
            <td>
                <asp:TextBox ID="TextBoxOpis" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="ButtonDodaj" runat="server" Text="Dodaj" 
                    onclick="ButtonDodaj_Click" />
                
            </td>
        </tr>
    </table>
    </asp:Panel>

    <asp:Panel ID="Panel2" Visible="false" runat="server">
        <asp:SqlDataSource ID="SqlDataSourceObrazki" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
            
            SelectCommand="SELECT produktID, obrazek FROM produkty_obrazki WHERE produktID = @produktID" 
            DeleteCommand="DELETE FROM produkty_obrazki WHERE produktID = @produktID AND obrazek = @obrazek" 
            InsertCommand="INSERT INTO produkty_obrazki(produktID, obrazek) VALUES (@produktID, @obrazek)">
            <DeleteParameters>
                <asp:Parameter Name="produktID" Type="Int32" />
                <asp:Parameter Name="obrazek" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="produktID" Type="Int32" />
                <asp:Parameter Name="obrazek" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="produktID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DataList ID="DataListObrazki" runat="server" DataKeyField="obrazek" 
            DataSourceID="SqlDataSourceObrazki" 
            ondeletecommand="DataListObrazki_DeleteCommand">
            <FooterTemplate>
                </table>
            </FooterTemplate>
            <HeaderTemplate>
                <table>
                    <tr>
                        <th>Obrazek</th>
                        <th></th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><a href='../images/products/<%# Eval("produktID") %>/<%# Eval("obrazek") %>'><%# Eval("obrazek") %></a></td>
                    <td><asp:Button ID="ButtonUsun" runat="server" Text="Usuń" CommandName="Delete" /></td>
                </tr>
            </ItemTemplate>
        </asp:DataList>
        Obrazek: 
        <asp:FileUpload ID="FileUpload1" runat="server" /> <br />
        <asp:Button ID="ButtonPowrot" runat="server" Text="Powrót" 
            onclick="ButtonPowrot_Click" />
            <asp:Button ID="ButtonDodajObrazek" runat="server" Text="Dodaj obrazek" 
            onclick="ButtonDodajObrazek_Click"/>
    </asp:Panel>
</asp:Content>

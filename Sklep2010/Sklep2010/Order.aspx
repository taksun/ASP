<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Sklep2010.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style4 {
            width: 100px;
        }
        .auto-style5 {
            width: 200px;
        }
        .auto-style6 {
            width: 122px;
        }
        .auto-style7 {
            width: 57px;
        }
        .auto-style8 {
            width: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:SqlDataSource ID="SqlDataSourceOrder" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
            SelectCommand="SELECT p.produktID, p.nazwa, k.nazwa as kategoria, p.cena, kp.ilosc FROM produkty p, koszyk_produkt kp, kategorie k WHERE p.produktID = kp.produktID AND p.kategoria = k.kategoriaID AND kp.koszykID = @koszykID">
            <SelectParameters>
                <asp:CookieParameter CookieName="basket" Name="koszykID" />
            </SelectParameters>
            </asp:SqlDataSource>

        <asp:DataList ID="DataListOrder" runat="server" 
            DataSourceID="SqlDataSourceOrder" 
            onitemdatabound="DataListOrder_ItemDataBound">

            <FooterTemplate>

            <% if (DataListOrder.Items.Count > 0)
               { %>

                <tr>
                <td colspan="4" align="right">Razem</td>
                <td align="center">
                    <asp:Label ID="LabelSuma" runat="server" Text='<%# suma.ToString("F") %>'></asp:Label></td>
                <td>&nbsp;</td>
            <tr>
                <td colspan="5" align="center">
                <b>Dane do wysyłki:</b>
                    <table>
            <tr>
                <td>Imie i Nazwisko</td>
                <td><asp:TextBox ID="TextBoxImieNazwisko" runat="server" Text='<%# usr.getImieNazwisko() %>'></asp:TextBox></td> 
            </tr>
            <tr>
                <td>Adres</td>
                <td><asp:TextBox ID="TextBoxAdres" runat="server" Text='<%# usr.getAdres() %>'></asp:TextBox></td> 
            </tr>
            <tr>
                <td>Kod Pocztowy</td>
                <td><asp:TextBox ID="TextBoxKod" runat="server" Text='<%# usr.getKod() %>'></asp:TextBox></td> 
            </tr>
            <tr>
                <td>Miejscowosc</td>
                <td><asp:TextBox ID="TextBoxMiejscowosc" runat="server" Text='<%# usr.getMiejscowosc() %>'></asp:TextBox></td> 
            </tr>
        </table>
                </td>
            </tr>
            </tr>
                <tr>
                <td colspan="4" align="right">
                    <asp:Button ID="ButtonAnuluj" OnClick="ButtonAnuluj_Click" runat="server" Text="Anuluj" />
                </td>
                <td>
                    <asp:Button ID="ButtonZamow" runat="server" Text="Złóż zamówienie"/>
                </td>
            </tr>
        </table>

        

        <% } %>

            </FooterTemplate>

            <HeaderTemplate>
            <% if (DataListOrder.Items.Count > 0)
               { %>
                <table class="auto-style1">
            <tr>
                <th class="auto-style5">Nazwa</th>
                <th class="auto-style4">Kategoria</th>
                <th class="auto-style6">Cena</th>
                <th class="auto-style7">Ilość</th>
                <th>Suma</th>
            </tr>
            <% }
               else
               {
                   Response.Redirect("~/Default.aspx");
               } %>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                <td class="auto-style5">
                    <%# Eval("nazwa") %>
                </td>
                <td class="auto-style4">
                    <%# Eval("kategoria") %>
                </td>
                <td align="center" class="auto-style6">
                    <asp:Label ID="LabelCena" runat="server" Text='<%# Eval("cena") %>'></asp:Label>
                </td>
                <td align="center" class="auto-style7">
                    <asp:Label ID="LabelIlosc" runat="server" Text='<%# Eval("ilosc") %>' CssClass="auto-style8"></asp:Label>
                </td>
                <td align="center">
                    <%# (int)Eval("ilosc")*(Decimal)Eval("cena") %>
                </td>
            </tr>
            </ItemTemplate>

        </asp:DataList>
    </p>
</asp:Content>

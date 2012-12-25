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
            width: 57px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:SqlDataSource ID="SqlDataSourceOrder" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
            
    
            SelectCommand="SELECT p.produktID, p.nazwa, k.nazwa as kategoria, p.cena, kp.ilosc FROM produkty p, koszyk_produkt kp, kategorie k WHERE p.produktID = kp.produktID AND p.kategoria = k.kategoriaID AND kp.koszykID = @koszykID">
            <SelectParameters>
                <asp:CookieParameter CookieName="basket" Name="koszykID" />
            </SelectParameters>
        </asp:SqlDataSource>

    <asp:Panel ID="Panel1" runat="server" CssClass="content">
        
        <asp:DataList ID="DataListOrder" runat="server" 
            DataSourceID="SqlDataSourceOrder" onitemdatabound="DataListOrder_ItemDataBound">
            <FooterTemplate>
                <% if (DataListOrder.Items.Count > 0)
               { %>
                <tr>
                    <td align="right" colspan="4">
                        <b>Razem</b></td>
                    <td align="center">
                        <asp:Label ID="LabelSuma" runat="server" Text='<%# suma.ToString("F") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <b>Forma płatności</b></td>
                    <td colspan="3">
                        <asp:DropDownList ID="DropDownListPlatnosc" runat="server">
                            <asp:ListItem>Przelew</asp:ListItem>
                            <asp:ListItem>PayPal</asp:ListItem>
                            <asp:ListItem>Pay4U</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <b>Sposób wysyłki</b></td>
                    <td colspan="3">
                        <asp:DropDownList ID="DropDownListWysylka" runat="server" OnLoad="DropDownListWysylka_OnLoad">
                            <asp:ListItem Value="Kurier">Kurier (30zł)</asp:ListItem>
                            <asp:ListItem Value="Poczta Polska">Poczta Polska (15zł)</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="5">
                        <b>Dane do wysyłki:</b>
                        <table>
                            <tr>
                                <td>
                                    Imie i Nazwisko</td>
                                <td>
                                    <asp:TextBox ID="TextBoxImieNazwisko" runat="server" 
                                        Text="<%# usr.getImieNazwisko() %>"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="TextBoxImieNazwisko" Display="Dynamic" 
                                        ErrorMessage="Musisz podac Imię i Nazwisko" Text="*" 
                                        ToolTip="Musisz podac Imię i Nazwisko" ValidationGroup="order"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Adres</td>
                                <td>
                                    <asp:TextBox ID="TextBoxAdres" runat="server" Text="<%# usr.getAdres() %>"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="TextBoxAdres" Display="Dynamic" 
                                        ErrorMessage="Musisz podać Adres!" Text="*" ToolTip="Musisz podać Adres!" 
                                        ValidationGroup="order"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Kod Pocztowy</td>
                                <td>
                                    <asp:TextBox ID="TextBoxKod" runat="server" Text="<%# usr.getKod() %>"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="TextBoxKod" Display="Dynamic" 
                                        ErrorMessage="Musisz podać Kod pocztowy!" Text="*" 
                                        ToolTip="Musisz podać Kod pocztowy!" ValidationGroup="order"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ControlToValidate="TextBoxKod" Display="Dynamic" 
                                        ErrorMessage="Podałeś błędny kod pocztowy!" Text="*" 
                                        ToolTip="Podałeś błędny kod pocztowy!" ValidationExpression="\d{2}-\d{3}" 
                                        ValidationGroup="order"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Miejscowosc</td>
                                <td>
                                    <asp:TextBox ID="TextBoxMiejscowosc" runat="server" 
                                        Text="<%# usr.getMiejscowosc() %>"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="TextBoxMiejscowosc" Display="Dynamic" 
                                        ErrorMessage="Musisz podać miejscowość!" Text="*" 
                                        ToolTip="Musisz podać miejscowość!" ValidationGroup="order"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Button ID="ButtonAnuluj" runat="server" OnClick="ButtonAnuluj_Click" 
                            Text="Anuluj" />
                    </td>
                    <td colspan="3">
                        <asp:Button ID="ButtonZamow" runat="server" OnClick="ButtonZamow_Click" 
                            Text="Złóż zamówienie" ValidationGroup="order" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="5">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            ValidationGroup="order" />
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
                        <th class="auto-style5">
                            Nazwa</th>
                        <th class="auto-style4">
                            Kategoria</th>
                        <th class="auto-style6">
                            Cena</th>
                        <th class="auto-style7">
                            Ilość</th>
                        <th>
                            Suma</th>
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
                        <asp:Label ID="LabelIlosc" runat="server"
                            Text='<%# Eval("ilosc") %>'></asp:Label>
                    </td>
                    <td align="center">
                        <%# (int)Eval("ilosc")*(Decimal)Eval("cena") %>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:DataList>
    </asp:Panel>
    <asp:Panel ID="Panel2" Visible="false" runat="server">
        

        <asp:DataList ID="DataListOrder2" runat="server" 
            DataSourceID="SqlDataSourceOrder" 
            onitemdatabound="DataListOrder_ItemDataBound">
            <FooterTemplate>
                    <tr>
                    <td class="auto-style5">
                        <% Response.Write(ddlwys.SelectedItem.Value); %>
                    </td>
                    <td class="auto-style4">
                        Wysyłka
                    </td>
                    <td align="center" class="auto-style6">
                        <% if (ddlwys.SelectedItem.Value.Equals("Kurier"))
                           {
                               Response.Write("30");
                           }
                           else
                           {
                               Response.Write("15");
                           } %>
                    </td>
                    <td align="center" class="auto-style7">
                        1
                    </td>
                    <td align="center">
                        <% if (ddlwys.SelectedItem.Value.Equals("Kurier"))
                           {
                               Response.Write("30");
                           }
                           else
                           {
                               Response.Write("15");
                           }  
                           %>
                    </td>
                </tr>

                <tr>
                    <td align="right" colspan="4">
                        <b>Razem</b></td>
                    <td align="center">
                        <asp:Label ID="LabelSuma" runat="server" Text='<%# suma.ToString("F") %>'></asp:Label>
                    </td>
                </tr>

                </table>
            </FooterTemplate>
            <HeaderTemplate>
            <table class="auto-style1">
                    <tr>
                        <th class="auto-style5">
                            Nazwa</th>
                        <th class="auto-style4">
                            Kategoria</th>
                        <th class="auto-style6">
                            Cena</th>
                        <th class="auto-style7">
                            Ilość</th>
                        <th>
                            Suma</th>
                    </tr>
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
                        <asp:Label ID="LabelIlosc" runat="server"
                            Text='<%# Eval("ilosc") %>'></asp:Label>
                    </td>
                    <td align="center">
                        <%# (int)Eval("ilosc")*(Decimal)Eval("cena") %>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:DataList>
        <asp:Button ID="ButtonWstecz" runat="server" Text="Wstecz" 
            onclick="ButtonWstecz_Click" />
        <asp:Button ID="ButtonPotwierz" runat="server" Text="Potwierdz zamówienie" />
    </asp:Panel>
</asp:Content>

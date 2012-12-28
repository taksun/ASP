<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MyAcc.aspx.cs" Inherits="Sklep2010.MyAcc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
        text-align: right;
    }
        .auto-style2 {
            text-align: left;
            color: red;
        }
        .auto-style4 {
        width: 190px;
    }
        .style1
        {
            text-align: right;
            height: 29px;
        }
        .style2
        {
            height: 29px;
        }
        .style3
        {
            font-weight: bold;
            text-align: right;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="sidebar1">
        <h2>Moje Konto</h2>
    <asp:BulletedList ID="BulletedList1" runat="server" CssClass="list-style2" DisplayMode="HyperLink">
        <asp:ListItem Value="~/MyAcc.aspx?page=1">Moje Zamówienia</asp:ListItem>
        <asp:ListItem Value="~/MyAcc.aspx?page=2">Profil</asp:ListItem>
        <asp:ListItem Value="~/MyAcc.aspx?page=3">Zmiana hasła</asp:ListItem>
    </asp:BulletedList>

    </div>
    <div id="content2">
        <asp:Panel ID="PanelMyAcc" Visible="false" runat="server">
            Witaj w swoim koncie!</asp:Panel>
        <asp:Panel ID="PanelProfil" Visible="false" runat="server" 
            onload="PanelProfil_Load">
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">Imię:</td>
                <td>
                    <asp:TextBox ID="TextBoxImie" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxImie" Display="Dynamic" ErrorMessage="Musisz podać imię!" ValidationGroup="Register" CssClass="auto-style2">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Nazwisko:</td>
                <td>
                    <asp:TextBox ID="TextBoxNazwisko" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxNazwisko" Display="Dynamic" ErrorMessage="Musisz podać Nazwisko!" ValidationGroup="Register" CssClass="auto-style2">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Adres(Ulica nr domu/nr lokalu):</td>
                <td>
                    <asp:TextBox ID="TextBoxAdres" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxAdres" Display="Dynamic" ErrorMessage="Musisz podać adres!" ValidationGroup="Register" CssClass="auto-style2">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Kod pocztowy:</td>
                <td>
                    <asp:TextBox ID="TextBoxKodPocztowy" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxKodPocztowy" Display="Dynamic" ErrorMessage="Musisz podać kod pocztowy!" ValidationGroup="Register" CssClass="auto-style2">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxKodPocztowy" CssClass="auto-style2" Display="Dynamic" ErrorMessage="Podałeś niepoprawny kod pocztowy!" ValidationExpression="\d{2}-\d{3}" ValidationGroup="Register">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Miejscowość:</td>
                <td>
                    <asp:TextBox ID="TextBoxMiejscowosc" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBoxMiejscowosc" Display="Dynamic" ErrorMessage="Musisz podać miejscowość!" ValidationGroup="Register" CssClass="auto-style2">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Button ID="ButtonZapisz" runat="server" Text="Zapisz" ValidationGroup="Register"
                        onclick="ButtonZapisz_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2"  class="auto-style2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Register" DisplayMode="List" />
                </td>
            </tr>
        </table>
        </asp:Panel>
        <asp:Panel ID="PanelZamowienia" Visible="false" runat="server" 
            onload="PanelZamowienia_Load">
            <asp:SqlDataSource ID="SqlDataSourceZamowienia" runat="server" 
                ConnectionString="<%$ ConnectionStrings:CS %>" 
                ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
                SelectCommand="SELECT zamowienieID, status, data FROM zamowienia WHERE (userID = @userID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="userID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <asp:DataList ID="DataListZamowienia" runat="server" 
                DataSourceID="SqlDataSourceZamowienia" DataKeyField="zamowienieID" 
                oneditcommand="DataListZamowienia_EditCommand">
                <FooterTemplate>
                    </table>
                </FooterTemplate>
                <HeaderTemplate>
                    <table>
                        <tr>
                            <th>Numer Zamówienia</th>
                            <th>Data zamówienia</th>
                            <th>Status zamówienia</th>
                            <th>Sczegóły</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("zamowienieID") %></td>
                        <td><%# Eval("data") %></td>
                        <td><%# Eval("status") %></td>
                        <td><asp:Button ID="ButtonSzegoly" runat="server" Text="Szczegóły zamówienia" CommandName="Edit" /></td>
                    </tr>
                </ItemTemplate>
            </asp:DataList>
        </asp:Panel>
        <asp:Panel ID="PanelSzczegoly" Visible="false" runat="server">
            <asp:SqlDataSource ID="SqlDataSourceSzczegoly" runat="server" 
                ConnectionString="<%$ ConnectionStrings:CS %>" 
                ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
                SelectCommand="SELECT z.zamowienieID, z.data, z.wysylka, z.platnosc, z.status, zw.imieNazwisko, zw.adres, zw.kod, zw.miejscowosc FROM zamowienia z, zamowienia_wysylka zw WHERE (z.zamowienieID = @zamowienieID) AND (z.zamowienieID = zw.zamowienieID)">
                <SelectParameters>
                    <asp:Parameter Name="zamowienieID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DataList ID="DataListSzczegoly" runat="server" 
                DataSourceID="SqlDataSourceSzczegoly" 
                onitemdatabound="DataListSzczegoly_ItemDataBound">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td class="style3">Numer zamówienia:</td>
                            <td><%# Eval("zamowienieID") %></td>
                        </tr>
                        <tr>
                            <td class="style3">Data zamówienia:</td>
                            <td><%# Eval("data") %></td>
                        </tr>
                        <tr>
                            <td class="style3">Status zamówienia:</td>
                            <td><%# Eval("status") %></td>
                        </tr>
                        <tr>
                            <td class="style3">Wybrana metoda płatności:</td>
                            <td><%# Eval("platnosc") %></td>
                        </tr>
                        <tr>
                            <td class="style3">Wbrany sposób wysyłki:</td>
                            <td><%# Eval("wysylka") %></td>
                        </tr>
                        <tr>
                            <td colspan="2"><br /></td>
                        </tr>
                        <tr>
                            <td class="style3">Dane do wysyłki:</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2"><%# Eval("imieNazwisko") %></td>
                        </tr>
                        <tr>
                            <td colspan="2"><%# Eval("adres") %></td>
                        </tr>
                        <tr>
                            <td colspan="2"><%# Eval("kod") %> <%# Eval("miejscowosc") %></td>
                        </tr>
                        <tr>
                            <td colspan="2"><br /></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSourceSzczegoly2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:CS %>" 
                                    ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
                                    SelectCommand="SELECT p.nazwa, zp.ilosc, p.cena, k.nazwa as kategoria FROM produkty p, kategorie k, zamowienia_produkty zp WHERE (zp.zamowienieID = @zamowienieID) AND (zp.produktID = p.produktID) AND (p.kategoria = k.kategoriaID)">
                                    <SelectParameters>
                                        <asp:Parameter Name="zamowienieID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:DataList ID="DataListSzczegoly2" runat="server" DataSourceID="SqlDataSourceSzczegoly2"
                                onitemdatabound="DataListSzczegoly2_ItemDataBound">
                                    <HeaderTemplate>
                                        <table>
                                            <tr>
                                                <th>Nazwa</th>
                                                <th>Kategoria</th>
                                                <th>Cena</th>
                                                <th>Ilość</th>
                                                <th>Suma</th>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("nazwa") %></td>
                                            <td><%# Eval("kategoria") %></td>
                                            <td><%# Eval("cena") %></td>
                                            <td><%# Eval("ilosc") %></td>
                                            <td><%# (Decimal)Eval("cena") * (int)Eval("ilosc") %></td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                            <tr>
                                                <td><%# wysylka %></td>
                                                <td>Wysyłka</td>
                                                <td><%# wysylka_kwota %></td>
                                                <td>1</td>
                                                <td><%# wysylka_kwota %></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" align="right" class="style3">Razem: </td>
                                                <td><%# suma.ToString("F") %></td>
                                            </tr>
                                        </table>
                                    </FooterTemplate>
                                </asp:DataList>
            <asp:Button ID="ButtonWstecz" runat="server" Text="Powrót" 
                onclick="ButtonWstecz_Click" />
        </asp:Panel>
        <asp:Panel ID="PanelZmianaPass" Visible="false" runat="server">
        <table class="auto-style1">
            <tr>
                <td colspan="2" class="auto-style2">
                    <asp:Label ID="LabelPassChanged" Visible="false" runat="server" Text="Hasło zostało zmienione!"></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style3">Aktualne hasło:</td>
                <td>
                    <asp:TextBox ID="TextBoxAktHaslo" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="TextBoxAktHaslo" Display="Dynamic" 
                        ErrorMessage="Musisz podać adres email!" ValidationGroup="Register" 
                        CssClass="auto-style2">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="TextBoxAktHaslo" CssClass="auto-style2" Display="Dynamic" 
                        ErrorMessage="Hasło musi się składać z przynajmniej 8 znaków!" ValidationExpression=".{8,}" 
                        ValidationGroup="Register">*</asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" 
                        ControlToValidate="TextBoxAktHaslo" CssClass="auto-style2" Display="Dynamic" 
                        ErrorMessage="Podane hasło nie zgadza się!" 
                        onservervalidate="CustomValidator1_ServerValidate" ValidationGroup="Register">*</asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">Nowe hasło:</td>
                <td class="style2">
                    <asp:TextBox ID="TextBoxHaslo" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBoxHaslo" Display="Dynamic" ErrorMessage="Musisz podać hasło!" ValidationGroup="Register" CssClass="auto-style2">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                        ControlToValidate="TextBoxHaslo" CssClass="auto-style2" Display="Dynamic" 
                        ErrorMessage="Hasło musi się składać z przynajmniej 8 znaków i zawierac przynajmniej 1 litere i 1 cyfre!" 
                        ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,})$" 
                        ValidationGroup="Register">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Powtórz nowe hasło:</td>
                <td>
                    <asp:TextBox ID="TextBoxHaslo2" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBoxHaslo2" Display="Dynamic" ErrorMessage="Musisz ponownie podać hasło!" ValidationGroup="Register" CssClass="auto-style2">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TextBoxHaslo" ControlToValidate="TextBoxHaslo2" CssClass="auto-style2" Display="Dynamic" ErrorMessage="Powtórzone hasło nie zgadza się!" ValidationGroup="Register">*</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Button ID="ButtonZmienHaslo" runat="server" Text="Zmień hasło" 
                        ValidationGroup="Register" onclick="ButtonZmienHaslo_Click"/>
                </td>
            </tr>
            <tr>
                <td colspan="2"  class="auto-style2">
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="Register" DisplayMode="List" />
                </td>
            </tr>
        </table>
        </asp:Panel>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Sklep2010.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: center;
            color: red;
        }
        .auto-style3 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 400px; margin: auto;">
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">Email:</td>
                <td>
                    <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxEmail" Display="Dynamic" ErrorMessage="Musisz podać adres email!" ValidationGroup="Register" CssClass="auto-style2">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" CssClass="auto-style2" Display="Dynamic" ErrorMessage="To nie jest poprawny adres email!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Register">*</asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" 
                        ControlToValidate="TextBoxEmail" CssClass="auto-style2" Display="Dynamic" 
                        ErrorMessage="Podany email jest już użyty!" 
                        onservervalidate="CustomValidator2_ServerValidate" ValidationGroup="Register">*</asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Hasło</td>
                <td>
                    <asp:TextBox ID="TextBoxHaslo" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxHaslo" Display="Dynamic" ErrorMessage="Musisz podać hasło!" ValidationGroup="Register" CssClass="auto-style2">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="TextBoxHaslo" CssClass="auto-style2" Display="Dynamic" 
                        ErrorMessage="Hasło musi się składać z przynajmniej 8 znaków i zawierac przynajmniej 1 litere i 1 cyfre!" 
                        ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,})$" 
                        ValidationGroup="Register">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Powtórz hasło:</td>
                <td>
                    <asp:TextBox ID="TextBoxHaslo2" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxHaslo2" Display="Dynamic" ErrorMessage="Musisz ponownie podać hasło!" ValidationGroup="Register" CssClass="auto-style2">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxHaslo" ControlToValidate="TextBoxHaslo2" CssClass="auto-style2" Display="Dynamic" ErrorMessage="Powtórzone hasło nie zgadza się!" ValidationGroup="Register">*</asp:CompareValidator>
                </td>
            </tr>
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
                <td class="auto-style3">Miejscowość</td>
                <td>
                    <asp:TextBox ID="TextBoxMiejscowosc" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBoxMiejscowosc" Display="Dynamic" ErrorMessage="Musisz podać miejscowość!" ValidationGroup="Register" CssClass="auto-style2">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Regulamin: link</td>
                <td>
                    <asp:CheckBox ID="CheckBoxRegulamin" runat="server" Text="Akceptuję regulamin" />
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Musisz zaakceptować regulamin!" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="Register" CssClass="auto-style2">*</asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td  class="auto-style2">
                    <asp:Button ID="ButtonRejestracja" runat="server" Text="Zarejestruj" 
                        ValidationGroup="Register" onclick="ButtonRejestracja_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2"  class="auto-style2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Register" DisplayMode="List" />
                    <asp:SqlDataSource ID="SqlDataSourceRegister" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CS %>" 
                        InsertCommand="INSERT INTO users(login, pass, imie, nazwisko, adres, kod, miejscowosc) VALUES (@login, @pass, @imie, @nazwisko, @adres, @kod, @miejscowosc)" 
                        ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
                        SelectCommand="SELECT userID FROM users WHERE (login = @login)">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="TextBoxEmail" Name="login" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBoxHaslo" Name="pass" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBoxImie" Name="imie" PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBoxNazwisko" Name="nazwisko" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBoxAdres" Name="adres" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBoxKodPocztowy" Name="kod" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBoxMiejscowosc" Name="miejscowosc" 
                                PropertyName="Text" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBoxEmail" Name="login" PropertyName="Text" 
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>

    </div>
</asp:Content>

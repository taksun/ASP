<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AccEdit.aspx.cs" Inherits="Sklep2010.AccEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
        text-align: right;
        width: 216px;
    }
        .auto-style2 {
            text-align: center;
            color: red;
        }
        .auto-style4 {
        width: 216px;
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
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Hasło</td>
                <td>
                    <asp:TextBox ID="TextBoxHaslo" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxHaslo" Display="Dynamic" ErrorMessage="Musisz podać hasło!" ValidationGroup="Register" CssClass="auto-style2">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBoxHaslo" CssClass="auto-style2" Display="Dynamic" ErrorMessage="Hasło musi się składać z przynajmniej 8 znaków!" ValidationExpression=".{8,}" ValidationGroup="Register">*</asp:RegularExpressionValidator>
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
                <td class="auto-style4">&nbsp;</td>
                <td  class="auto-style2">
                    <asp:Button ID="ButtonZapisz" runat="server" Text="Zapisz" ValidationGroup="Register" />
                </td>
            </tr>
            <tr>
                <td colspan="2"  class="auto-style2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Register" DisplayMode="List" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

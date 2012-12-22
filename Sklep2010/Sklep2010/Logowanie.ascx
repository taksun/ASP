<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Logowanie.ascx.cs" Inherits="Sklep.Logowanie" %>
<style type="text/css">
    .style1
    {
        width: 300px;
    }
    .style2
    {
        width: 51px;
    }
</style>

<table class="style1">
    <tr>
        <td class="style2">
            <asp:Label ID="LLogin" runat="server" Text="Login(email):"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxLogin" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBoxLogin" Display="Dynamic" 
                ErrorMessage="Pole nie może być puste!" ValidationGroup="login">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="TextBoxLogin" Display="Dynamic" 
                ErrorMessage="Login nie jest adresem email!" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="login">*</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style2">
            <asp:Label ID="LHaslo" runat="server" Text="Hasło:"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxHaslo" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="TextBoxHaslo" 
                ErrorMessage="Hasło musi się składać przynajmniej z 8 znaków!" 
                ValidationExpression=".{8,}" Display="Dynamic" ValidationGroup="login">*</asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBoxHaslo" Display="Dynamic" 
                ErrorMessage="Pole nie może być puste!" ValidationGroup="login">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="LInfo" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
    </tr>
    <tr>
        <td class="style2">
            </td>
        <td>
            <asp:Button ID="Zaloguj" runat="server" Text="Zaloguj" 
                onclick="Zaloguj_Click" ValidationGroup="login" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                ValidationGroup="login" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:HyperLink ID="HyperLinkPrzypomnijHaslo" runat="server" 
                NavigateUrl="~/Default.aspx">Przypomnij hasło</asp:HyperLink>
        </td>
    </tr>
</table>


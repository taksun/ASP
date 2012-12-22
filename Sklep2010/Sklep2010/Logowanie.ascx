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
                ErrorMessage="Pole login nie może być puste!" ValidationGroup="login">*</asp:RequiredFieldValidator>
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
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBoxHaslo" Display="Dynamic" 
                ErrorMessage="Pole hasło nie może być puste!" ValidationGroup="login">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="LInfo" runat="server" Text="Label" Visible="False" 
                ForeColor="Red"></asp:Label>
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
    </table>

<asp:SqlDataSource ID="SqlDataSourceLogin" runat="server" 
    ConnectionString="<%$ ConnectionStrings:CS %>" 
    ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
    SelectCommand="SELECT userID FROM users WHERE ((login = @login) AND (pass = @pass));">
    <SelectParameters>
        <asp:ControlParameter ControlID="TextBoxLogin" Name="login" PropertyName="Text" 
            Type="String" />
        <asp:ControlParameter ControlID="TextBoxHaslo" Name="pass" PropertyName="Text" 
            Type="String" />
    </SelectParameters>
</asp:SqlDataSource>



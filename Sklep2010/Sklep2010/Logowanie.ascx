<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Logowanie.ascx.cs" Inherits="Sklep2010.Logowanie" %>
<style type="text/css">
    .style1
    {
        width: 300px;
    }
    .style2
    {
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
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="TextBoxHaslo" Display="Dynamic" 
                ErrorMessage="Hasło musi się składać z przynajmniej 8 znaków i zawierac przynajmniej 1 litere i 1 cyfre!" 
                ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,})$" 
                ValidationGroup="login">*</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style2">
        </td>
        <td>
            <asp:CheckBox ID="CheckBoxZapamietaj" runat="server" Text="Zapamiętaj" />
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
    
    SelectCommand="SELECT userID, blokada FROM users WHERE ((login = @login) AND (pass = @pass));" 
    DeleteCommand="DELETE FROM users_zapamietaj WHERE userID = @userID" 
    InsertCommand="INSERT INTO users_zapamietaj(userID, zapamietaneID) VALUES (@userID,@zapamietaneID)">
    <DeleteParameters>
        <asp:Parameter Name="userID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="userID" Type="Int32" />
        <asp:Parameter Name="zapamietaneID" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="TextBoxLogin" Name="login" PropertyName="Text" 
            Type="String" />
        <asp:ControlParameter ControlID="TextBoxHaslo" Name="pass" PropertyName="Text" 
            Type="String" />
    </SelectParameters>
</asp:SqlDataSource>



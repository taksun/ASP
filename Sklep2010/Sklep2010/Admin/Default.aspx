<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sklep2010.Admin.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:panel ID="PanelLogin" runat="server">
    <table>
        <tr>
            <td>Login</td>
            <td><asp:textbox runat="server" ID="TextBoxLogin"></asp:textbox></td>
        </tr>
        <tr>
            <td>Haslo</td>
            <td><asp:textbox runat="server" ID="TextBoxHaslo" TextMode="Password"></asp:textbox></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:button ID="ButtonZaloguj" runat="server" text="Zaloguj" 
                    onclick="ButtonZaloguj_Click" /></td>
        </tr>
    </table>
    </asp:panel>
    <asp:label ID="LabelLogin" runat="server" text="Witaj w panelu administracyjnym!" Visible="false"></asp:label>
</asp:Content>

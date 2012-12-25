<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Sklep2010.Admin.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 500px;
        }
        .auto-style2 {
            width: 55px;
        }
        .auto-style3 {
            width: 49px;
        }
        .auto-style4 {
            width: 400px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <th>id</th>
            <th>nazwa</th>
            <th>kategoria</th>
            <th class="auto-style2">edytuj</th>
            <th class="auto-style3">usuń</th>
        </tr>
        <tr>
            <td>1</td>
            <td>Asd</td>
            <td>Asd</td>
            <td class="auto-style2">
                <asp:Button ID="ButtonEdytuj" runat="server" Text="Edytuj" />
            </td>
            <td class="auto-style3">
                <asp:Button ID="ButtonUsun" runat="server" Text="Usuń" />
            </td>
        </tr>
    </table>
    <br />
    dodawanie
    <br />
    <table class="auto-style4">
        <tr>
            <td>Nazwa:</td>
            <td>
                <asp:TextBox ID="TextBoxNazwa" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Kategotia:</td>
            <td>
                <asp:DropDownList ID="DropDownListKategoria" runat="server">
                    <asp:ListItem>asd</asp:ListItem>
                    <asp:ListItem>asd2</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Cena:</td>
            <td>
                <asp:TextBox ID="TextBoxCena" runat="server"></asp:TextBox>
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
                <asp:Button ID="ButtonDodaj" runat="server" Text="Dodaj" />
            </td>
        </tr>
    </table>
</asp:Content>

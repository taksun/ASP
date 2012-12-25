<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Sklep2010.Admin.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 400px;
        }
        .auto-style2 {
            width: 51px;
        }
        .auto-style3 {
            width: 72px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <th>id</th>
            <th>email</th>
            <th class="auto-style2">Usuń</th>
            <th class="auto-style3">Zablokuj</th>
        </tr>
        <tr>
            <td>1</td>
            <td>asd@asd.pl</td>
            <td class="auto-style2">
                <asp:Button ID="ButtonUsun" runat="server" Text="Usuń" />
            </td>
            <td class="auto-style3">
                <asp:Button ID="ButtonZablokuj" runat="server" Text="Zablokuj" />
            </td>
        </tr>
    </table>
</asp:Content>

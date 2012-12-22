<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Basket.aspx.cs" Inherits="Sklep.Basket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style4 {
            width: 912px;
        }
        .auto-style5 {
            width: 595px;
        }
        .auto-style6 {
            width: 122px;
        }
        .auto-style7 {
            width: 57px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <table class="auto-style1">
            <tr>
                <th class="auto-style5">Nazwa</th>
                <th class="auto-style4">Kategoria</th>
                <th class="auto-style6">Cena</th>
                <th class="auto-style7">Ilość</th>
                <th>Suma</th>
                <th>&nbsp;</th>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="LabelProdukt" runat="server" Text="Kategoria 2"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="LabelKategoria" runat="server" Text="Kategoria 1"></asp:Label>
                </td>
                <td align="center" class="auto-style6">
                    <asp:Label ID="LabelCena" runat="server" Text="5.30"></asp:Label>
                </td>
                <td align="center" class="auto-style7">
                    <asp:TextBox ID="TextBoxIlosc" runat="server" Width="28px">1</asp:TextBox>
                </td>
                <td align="center">
                    <asp:Label ID="LabelSuma" runat="server" Text="5.30"></asp:Label>
                </td>
                <td align="center">
                    <asp:Button ID="ButtonUsun" runat="server" Text="Usuń" />
                </td>
            </tr>
            <tr>
                <td colspan="4" align="right">Razem</td>
                <td align="center">5.30</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="4" align="right">
                    <asp:Button ID="ButtonWyczysc" runat="server" Text="Wyczyść" />
                    <asp:Button ID="ButtonPrzelicz" runat="server" Text="Przelicz" />
                </td>
                <td>
                    <asp:Button ID="ButtonZamów" runat="server" Text="Złóż zamówienie" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>

    </div>
</asp:Content>

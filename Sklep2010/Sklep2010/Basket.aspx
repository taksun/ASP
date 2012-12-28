<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Basket.aspx.cs" Inherits="Sklep2010.Basket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style4 {
            width: 100px;
        }
        .auto-style5 {
            width: 200px;
        }
        .auto-style6 {
            width: 122px;
        }
        .auto-style7 {
            width: 57px;
        }
        .auto-style8 {
            width: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <% if (Request.Cookies["basket"] == null)
           { %>
           Brak produktów w koszyku!
        <% }
           else
           { %>

        <asp:SqlDataSource ID="SqlDataSourceKoszyk" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
            
            
            SelectCommand="SELECT p.produktID, p.nazwa, k.nazwa as kategoria, k.kategoriaID, p.cena, kp.ilosc FROM produkty p, koszyk_produkt kp, kategorie k WHERE p.produktID = kp.produktID AND p.kategoria = k.kategoriaID AND kp.koszykID = @koszykID" 
            
            DeleteCommand="DELETE FROM koszyk_produkt WHERE koszykID = @koszykID AND produktID = @produktID" 
            InsertCommand="DELETE FROM koszyk_produkt WHERE koszykID = @koszykID" 
            UpdateCommand="UPDATE koszyk_produkt SET ilosc = @ilosc WHERE koszykID = @koszykID AND produktID = @produktID">
            <DeleteParameters>
                <asp:CookieParameter CookieName="basket" Name="koszykID" />
                <asp:Parameter Name="produktID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:CookieParameter CookieName="basket" Name="koszykID" />
            </InsertParameters>
            <SelectParameters>
                <asp:CookieParameter CookieName="basket" Name="koszykID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ilosc" Type="Int32" />
                <asp:CookieParameter CookieName="basket" Name="koszykID" />
                <asp:Parameter Name="produktID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:DataList ID="DataListKoszyk" runat="server" 
            DataSourceID="SqlDataSourceKoszyk" 
            onitemdatabound="DataListKoszyk_ItemDataBound" 
            oncancelcommand="DataListKoszyk_CancelCommand" 
            ondeletecommand="DataListKoszyk_DeleteCommand" DataKeyField="produktID" 
            onupdatecommand="DataListKoszyk_UpdateCommand">

            <FooterTemplate>
            <% if (DataListKoszyk.Items.Count > 0)
               { %>
            <tr>
                <td colspan="4" align="right">Razem</td>
                <td align="center">
                    <asp:Label ID="LabelSuma" runat="server" Text='<%# suma.ToString("F") %>'></asp:Label></td>
                <td>&nbsp;</td>
            </tr>
                <tr>
                <td colspan="4" align="right">
                    <asp:Button ID="ButtonWyczysc" CommandName="Cancel" runat="server" Text="Wyczyść" />
                    <asp:Button ID="ButtonPrzelicz" CommandName="Update" runat="server" Text="Przelicz" ValidationGroup="koszyk" />
                </td>
                <td>
                    <asp:Button ID="ButtonZamow" runat="server" OnClick="ButtonZamow_Click" Text="Złóż zamówienie" ValidationGroup="koszyk" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
            <% } %>
            </FooterTemplate>

            <HeaderTemplate>
            <% if (DataListKoszyk.Items.Count > 0)
               { %>
                <table class="auto-style1">
            <tr>
                <th class="auto-style5">Nazwa</th>
                <th class="auto-style4">Kategoria</th>
                <th class="auto-style6">Cena</th>
                <th class="auto-style7">Ilość</th>
                <th>Suma</th>
                <th>&nbsp;</th>
            </tr>
            <% }
               else
               { %>
               Brak produktów w koszyku!
            <% } %>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                <td class="auto-style5">
                    <a href='Product.aspx?id=<%# Eval("produktID") %>'><%# Eval("nazwa") %></a>
                </td>
                <td class="auto-style4">
                    <a href='Default.aspx?category=<%# Eval("kategoriaID") %>'><%# Eval("kategoria") %></a>
                </td>
                <td align="center" class="auto-style6">
                    <asp:Label ID="LabelCena" runat="server" Text='<%# Eval("cena") %>'></asp:Label>
                </td>
                <td align="center" class="auto-style7">
                    <asp:TextBox ID="TextBoxIlosc" Text='<%# Eval("ilosc") %>' runat="server" CssClass="auto-style8"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Ilość musi być większa od 0!" ControlToValidate="TextBoxIlosc" ValueToCompare="0" Operator="GreaterThan" Text="*" Display="Dynamic" ToolTip="Ilość musi być większa od 0!" ValidationGroup="koszyk"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*" ControlToValidate="TextBoxIlosc" ErrorMessage="Musisz podać ilość!" ToolTip="Musisz podać ilość!" Display="Dynamic" ValidationGroup="koszyk"></asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    <%# (int)Eval("ilosc")*(Decimal)Eval("cena") %>
                </td>
                <td align="center">
                    <asp:Button ID="ButtonUsun" CommandName="Delete" runat="server" Text="Usuń" />
                </td>
            </tr>
            </ItemTemplate>

        </asp:DataList>

        <% } %>
    </div>
</asp:Content>

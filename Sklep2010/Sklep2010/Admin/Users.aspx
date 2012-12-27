<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Sklep2010.Admin.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CS %>" 
        ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
        SelectCommand="SELECT userID, login, blokada FROM users" 
        DeleteCommand="DELETE FROM users WHERE userID = @userID" 
        UpdateCommand="UPDATE users SET blokada = @blokada WHERE userID = @userID">
        <DeleteParameters>
            <asp:Parameter Name="userID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="blokada" Type="Boolean" />
            <asp:Parameter Name="userID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DataList ID="DataListUsers" runat="server" 
        DataSourceID="SqlDataSourceUsers" 
        ondeletecommand="DataListUsers_DeleteCommand" DataKeyField="userID" 
        onupdatecommand="DataListUsers_UpdateCommand" 
        onitemdatabound="DataListUsers_ItemDataBound">
        <HeaderTemplate>
            <table>
                <tr>
                    <th>id</th>
                    <th>email</th>
                    <th></th>
                    <th></th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("userID") %></td>
                <td><%# Eval("login") %></td>
                <td>
                    <asp:Button ID="ButtonUsun" runat="server" Text="Usuń" CommandName="Delete" />
                </td>
                <td>
                    <asp:Button ID="ButtonZablokuj" runat="server" Text="Zablokuj" CommandName="Update" CommandArgument="True" />
                </td>
        </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:DataList>
</asp:Content>

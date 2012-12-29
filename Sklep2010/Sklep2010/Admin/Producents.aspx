<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Producents.aspx.cs" Inherits="Sklep2010.Admin.Producents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:SqlDataSource ID="SqlDataSourceProducenci" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CS %>" 
        ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
        
        SelectCommand="SELECT producentID, nazwa FROM producenci" 
        DeleteCommand="DELETE FROM producenci WHERE (producentID = @producentID)" 
        UpdateCommand="UPDATE producenci SET nazwa = @nazwa WHERE producentID = @producentID">
        <DeleteParameters>
            <asp:Parameter Name="producentID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>        
            <asp:Parameter Name="producentID" Type="Int32" />
            <asp:Parameter Name="nazwa" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DataList ID="DataListProducenci" runat="server" 
        DataSourceID="SqlDataSourceProducenci" 
        ondeletecommand="DataListProducenci_DeleteCommand" DataKeyField="producentID" 
        oneditcommand="DataListProducenci_EditCommand" 
        oncancelcommand="DataListProducenci_CancelCommand" 
        onupdatecommand="DataListProducenci_UpdateCommand" >
        
        
        <HeaderTemplate>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Nazwa</th>                
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("producentID") %></td>
                <td><%# Eval("nazwa") %></td>                               
                <td><asp:Button ID="ButtonEdytuj" runat="server" Text="Edytuj" CommandName="Edit" /></td>
                <td><asp:Button ID="ButtonUsun" runat="server" Text="Usuń" CommandName="Delete" /></td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
        <tr>
            <td colspan="2">ID:</td>
            <td colspan="5">
                <%# Eval("producentID") %>
            </td>
        </tr>
        <tr>
            <td colspan="2">
            Nazwa:</td>
            <td colspan="5">
            <asp:TextBox ID="TextBoxNazwa" runat="server" Text='<%# Bind("nazwa") %>'></asp:TextBox>
            </td>
            
        <tr>
            <td colspan="2">&nbsp;</td>
            <td colspan="5">
                <asp:Button ID="ButtonZapisz" runat="server" Text="Zapisz" CommandName="Update" />
                <asp:Button ID="ButtonAnuluj" runat="server" Text="Anuluj" CommandName="Cancel" />
            </td>
        </tr>
        </EditItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:DataList>

    <br />
    Dodaj nowego producenta
    <br />
    <table>
        <tr>
            <td>Nazwa:</td>
            <td>
                <asp:TextBox ID="TextBoxNazwa" runat="server"></asp:TextBox>
            </td>
        </tr>      
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="ButtonDodaj" runat="server" Text="Dodaj" onclick="ButtonDodaj_Click" />              
            </td>
        </tr>
    </table>
</asp:Content>


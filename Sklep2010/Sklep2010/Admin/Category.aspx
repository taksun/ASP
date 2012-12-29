<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Sklep2010.Admin.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
    <asp:SqlDataSource ID="SqlDataSourceKategorie" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CS %>" 
        ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
        
        SelectCommand="SELECT kategoriaID, nazwa as kategoria FROM kategorie" 
        DeleteCommand="DELETE FROM kategorie WHERE (kategoriaID = @kategoriaID)" 
        UpdateCommand="UPDATE kategorie SET nazwa = @nazwa WHERE kategoriaID = @kategoriaID">
        <DeleteParameters>
            <asp:Parameter Name="kategoriaID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>        
            <asp:Parameter Name="kategoriaID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DataList ID="DataListKategorie" runat="server" 
        DataSourceID="SqlDataSourceKategorie" 
        ondeletecommand="DataListKategorie_DeleteCommand" DataKeyField="kategoriaID" 
        oneditcommand="DataListKategorie_EditCommand" 
        oncancelcommand="DataListKategorie_CancelCommand" 
        onupdatecommand="DataListKategorie_UpdateCommand" >
        
        
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
                <td><%# Eval("kategoriaID") %></td>
                <td><%# Eval("nazwa") %></td>                               
                <td><asp:Button ID="ButtonEdytuj" runat="server" Text="Edytuj" CommandName="Edit" /></td>
                <td><asp:Button ID="ButtonUsun" runat="server" Text="Usuń" CommandName="Delete" /></td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
        <tr>
            <td colspan="2">ID:</td>
            <td colspan="5">
                <%# Eval("kategoriaID") %>
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
    Dodaj nowa kategorie
    <br />
    <table class="auto-style4">
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
    </asp:Panel>
</asp:Content>

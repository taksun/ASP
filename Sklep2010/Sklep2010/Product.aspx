<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Sklep2010.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="Div1">
<asp:DataList ID="DataListProdukty" runat="server" 
            DataSourceID="SqlDataSourceProdukty" DataKeyField="produktID"> 
           
            <FooterTemplate>
                </table>
                
            </FooterTemplate>
            <HeaderTemplate>
                <% if (DataListProdukty.Items.Count > 0)
                   { %>
                <table>
                    <tr>
                        <th style="width:100px;"></th>
                        <th style="width:200px;">Nazwa</th>
                        <th style="width:100px;">Producent</th>
                        <th style="width:100px;">Cena</th>
                        <th style="width:100px;">Opis</th>
                    </tr>  
                <% } %>
            </HeaderTemplate>
            <ItemTemplate>
                
                    <tr>
                        <td><%# Eval("produktID") %></td>
                        <td><%# Eval("nazwa") %></td>
                        <td><%# Eval("producent") %></td>
                        <td><%# Eval("cena") %></td>
                        <td><%# Eval("opis") %></td>
                    </tr>                  

            </ItemTemplate>
 </asp:DataList> 
       
        
        <asp:SqlDataSource ID="SqlDataSourceProdukty" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
            
            
                    SelectCommand="SELECT p.nazwa, p.cena, p.produktID, p.opis pr.nazwa as producent FROM produkty p, producenci pr WHERE (p.produktID = @produktID) AND (pr.producentID = p.producent)"> 
         
            <SelectParameters>
                <asp:Parameter DefaultValue="" Name="produktID" Type="Int32" />
            </SelectParameters>
           
        </asp:SqlDataSource>
      
    </div>
</asp:Content>

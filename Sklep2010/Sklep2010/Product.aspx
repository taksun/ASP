﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Sklep2010.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="Div1">
<asp:DataList ID="DataListProdukty" runat="server" 
            DataSourceID="SqlDataSourceProdukty" DataKeyField="produktID" 
            onupdatecommand="DataListProdukty_UpdateCommand">
        
            <ItemTemplate>
                <table >               
                     <tr>                   
                          <th style="width:100px;">Obrazek</th>   
                          <th style="width:100px;">Nazwa</th>    
                          <td><%# Eval("nazwa") %></td>                  
                    </tr> 
                    <tr>  
                        <td>&nbsp;</td>    
                        <th style="width:100px;">Producent</th>   
                        <td><%# Eval("producent") %></td>                      
                    </tr>      
                    <tr>                     
                        <td>&nbsp;</td>         
                        <th style="width:100px;">Cena</th>   
                        <td><%# Eval("cena") %></td>                                      
                    </tr> 
                  <tr>
                  <td>&nbsp;</td> 
                  <th style="width:100px;">Opis</th>
                  <td><%# Eval("opis") %></td>
                  </tr> 
                  <tr>
                  <td>&nbsp;</td> 
                  <td>&nbsp;</td> 
                  <td><asp:Button ID="ButtonDoKoszyka" runat="server" Text="Dodaj do koszyka" CommandName="Update" /></td>
                  </tr>                               
                   </table>                   
            </ItemTemplate>
 </asp:DataList> 
       
        
        <asp:SqlDataSource ID="SqlDataSourceProdukty" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
            SelectCommand="SELECT p.nazwa, p.cena, p.produktID, p.opis, pr.nazwa as producent FROM produkty p, producenci pr WHERE (p.produktID = @produktID) AND (pr.producentID = p.producent)"
            UpdateCommand="UPDATE koszyk_produkt SET ilosc = ilosc+1 WHERE koszykID = @koszykID AND produktID = @produktID"
            InsertCommand="INSERT INTO koszyk_produkt(koszykID, produktID) VALUES (@koszykID, @produktID)" >
             <InsertParameters>
                <asp:Parameter Name="koszykID" Type="String" />
                <asp:Parameter Name="produktID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="" Name="produktID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="koszykID" Type="String" />
                <asp:Parameter Name="produktID" Type="Int32" />
            </UpdateParameters>
           
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSourceKoszyk" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            InsertCommand="INSERT INTO koszyk(koszykID) VALUES (@koszykID)" 
            ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
            SelectCommand="SELECT * FROM koszyk_produkt WHERE koszykID = @koszykID AND produktID = @produktID" 
            UpdateCommand="UPDATE koszyk SET koszykID = @koszykID">
            <InsertParameters>
                <asp:Parameter Name="koszykID" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="koszykID" Type="String" />
                <asp:Parameter Name="produktID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
      
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Sklep2010.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="Div1">

                <table>
                    <tr>
                        <th style="width:100px;"></th>
                        <th style="width:100px;">Nazwa</th>
                        <th style="width:100px;">Producent</th>
                        <th style="width:100px;">Cena</th>
                        <th style="width:100px;">kategoria</th>
                        <th style="width:100px;">opis</th>
                    </tr>  
               </table>
          
           
       
        
        <asp:SqlDataSource ID="SqlDataSourceProdukty" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            ProviderName="<%$ ConnectionStrings:CS.ProviderName %>" 
            
            SelectCommand="SELECT p.nazwa, p.cena, p.produktID, p.opis pr.nazwa as producent FROM produkty p, producenci pr WHERE (p.kategoria = ?) AND (pr.producentID = p.producent)"> 
         
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="kategoria" Type="Int32" />
            </SelectParameters>
           
        </asp:SqlDataSource>
      
    </div>
</asp:Content>

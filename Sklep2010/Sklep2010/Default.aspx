<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sklep.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="sidebar1">
        <h2>Kategorie</h2>
        <ul class="list-style2">
					<li class="first"><a href="#">Pellentesque consectetuer </a></li>
					<li><a href="#">Lorem  adipiscing elit.</a></li>
					<li><a href="#">Phasellus pellentesque </a></li>
					<li><a href="#">Cras vitae pellentesque </a></li>
					<li><a href="#">Maecenas   feugiat eleifend.</a></li>
					<li><a href="#">Pellentesque  gravida blandit.</a></li>
					<li><a href="#">Phasellus pellentesque </a></li>
					<li><a href="#">Cras vitae pellentesque </a></li>
					<li><a href="#">Maecenas   feugiat eleifend.</a></li>
					<li><a href="#">Phasellus pellentesque </a></li>
				</ul>
    </div>

    <div id="content2">
        Nazwa Towaru<br />
        Producent: producent<br />
        Opis....<br />
        Cena
        <asp:Button ID="ButtonDodaj" runat="server" Text="Dodaj do koszyka" />
        </div>
</asp:Content>

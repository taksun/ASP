<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Sklep2010.Login" %>
<%@ Register src="Logowanie.ascx" tagname="Logowanie" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 300px; margin: 0px auto 0px auto;">
        <uc1:Logowanie ID="Logowanie1" runat="server" />
    </div>
</asp:Content>

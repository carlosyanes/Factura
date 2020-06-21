<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="BuscarFacturas.aspx.vb" Inherits="RegistroFacturas.BuscarFacturas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server" BackColor="#99CCFF">
    <asp:Label ID="Titulo" runat="server" BorderColor="Blue" CssClass="h1">Buscar Facturas </asp:Label>
    <br />
    <br />
    <asp:DropDownList ID="DlEstado" runat="server">
        <asp:ListItem Value="1">Activas</asp:ListItem>
        <asp:ListItem Value="2">Anuladas</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
   <asp:Button ID="Buscar" runat="server" Text="Buscar" />
   <asp:Button ID="Retornar" runat="server" Text="Retornar" />
    <br />
    <br />
    
    <br />
    <asp:GridView ID="Griddatos" runat="server"></asp:GridView>


  
</asp:Panel>
    

</asp:Content>

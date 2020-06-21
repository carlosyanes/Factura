<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="EliminarFacturas.aspx.vb" Inherits="RegistroFacturas.EliminarFacturas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <asp:Panel ID="Panel1" runat="server" BackColor="#99CCFF">
      <asp:Label ID="Titulo" runat="server" BorderColor="Blue" CssClass="h1">Eliminar Factura </asp:Label>
    <br />
    <br />
      <asp:Label ID="NFactura" runat="server" BorderColor="Blue" CssClass="h3">numero de Factura </asp:Label> &nbsp;
    <asp:TextBox ID="TBNFactura" runat="server" TextMode="Number"></asp:TextBox>
               <asp:Label ID="LblEliminarFactura" runat="server"></asp:Label>
    <br />
    <br />
   <asp:Button ID="Eliminar" runat="server" Text="Eliminar" />
   <asp:Button ID="Retornar" runat="server" Text="Retornar" />
    <br />
    <br /> 
    <br />
    <br />
        </asp:Panel>
</asp:Content>

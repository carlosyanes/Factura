<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AnularFacturas.aspx.vb" Inherits="RegistroFacturas.AnularFacturas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server" BackColor="#99CCFF">
        <asp:Label ID="Titulo" runat="server" BorderColor="Blue" CssClass="h1">Anular Factura </asp:Label>
    <br />
    <br />
      <asp:Label ID="NFactura" runat="server" BorderColor="Blue" CssClass="h3">numero de Factura </asp:Label> &nbsp;
    <asp:TextBox ID="TBNFactura" runat="server" TextMode="Number"></asp:TextBox>
               <asp:Label ID="LblAnularFactura" runat="server"></asp:Label>
    <br />
    <br />
   <asp:Button ID="Anular" runat="server" Text="Anular" />
   <asp:Button ID="Retornar" runat="server" Text="Retornar" />
    <br />
    <br /> 
    <br />
    <br />

        </asp:Panel>
</asp:Content>

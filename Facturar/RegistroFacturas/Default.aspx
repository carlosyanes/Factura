<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="RegistroFacturas._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
        <asp:Panel ID="Panel1" runat="server" BackColor="#0099FF">
            <div class="jumbotron">
            <h1>Registro de Facturas</h1>

            <p class="lead"></p>
            <p><a href="RegistroFacturas.aspx" class="btn btn-primary btn-lg">Ir a registro de facturas &raquo;</a></p>

            </div>

        <div class="row">
                <div class="col-md-4">
                    <h2>Buscar Facturas</h2>
                    <p>  </p>
                    <p>
                        <a class="btn btn-default" href="BuscarFacturas.aspx">Ir a Buscar facturas &raquo;</a>
                    </p>
                </div>
                <div class="col-md-4">
                    <h2>Anular Facturas</h2>
                    <p> </p>
                    <p>
                        <a class="btn btn-default" href="AnularFacturas.aspx">Ir a anular facturas &raquo;</a>
                    </p>
                </div>
                <div class="col-md-4">
                    <h2>Eliminar Facturas</h2>
                    <p>   </p>
                    <p>
                        <a class="btn btn-default" href="EliminarFacturas.aspx">Ir a Eliminar facturas &raquo;</a>
                    </p>
                </div>
            </div>

        </asp:Panel>
   

    

</asp:Content>

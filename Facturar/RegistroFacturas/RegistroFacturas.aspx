<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="RegistroFacturas.aspx.vb" Inherits="RegistroFacturas.RegistroFacturas" %>





<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >
   
   <asp:Panel ID="Panel1" runat="server" BackColor="#99CCFF">

    <table class="auto-style1" style="width: 1004px; height: 278px">
        <tr>
            <td colspan="2"><h1>Registro de Facturas</h1></td>
        </tr>
        <tr>
            <td class="auto-style2" style="width: 622px">
                Fecha  &nbsp;<asp:TextBox ID="TBFecha" runat="server" style="margin-left:auto" TextMode="Date" ></asp:TextBox>
                 <asp:Label ID="LblFecha" runat="server"></asp:Label>
            </td>
            <td>
                No Factura  &nbsp;<asp:TextBox ID="TBNFactura" runat="server" TextMode="Number"  placeholder="Ingrese numero de factura"></asp:TextBox>
               <asp:Label ID="LblFactura" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="width: 622px">
            <asp:Label ID="Label2" runat="server" Text="Nombre"></asp:Label>
            &nbsp;Del Cliente  &nbsp;<asp:TextBox ID="TBNombreCliente" runat="server" Width="315px"  placeholder="Ingrese el nombre del cliente"></asp:TextBox>
               <asp:Label ID="LblCliente" runat="server"></asp:Label>
            </td>
            <td>
                Nit  &nbsp;<asp:TextBox ID="TBNIT"  runat="server" onblur="nitIsValid(this.id)" placeholder="Ingrese Nit"></asp:TextBox>
                <asp:Label ID="LblNIT" runat="server"></asp:Label>
             


               


                
                 

            </td>
        </tr>
       
          <tr>
             <td>
                 
                  <br />
              
              </td>
             
          </tr>



       
    </table>


    <%-- <Table ID="Table1" runat="server">
                    <tr>

                        <th>  COD PRODUCTO  </th>
                        <th>  NOMBRE PRODUCTO  </th>
                        <th>  PRECIO  </th>
                        <th style="width: 97px">  CANTIDAD   </th>
                        <th style="width: 116px">  SUBTOTAL  </th>

                      </tr>

                      <tr>

                        <td> 
                            <asp:TextBox ID="TBIDProducto1" runat="server" TextMode="Number"  style="display: inline; text-align: center;"></asp:TextBox>
                          </td>
                        <td> 
                            <asp:TextBox ID="TBNombreP1" runat="server"></asp:TextBox>
                          </td>
                        <td> 
                            <asp:TextBox ID="TBPrecio1" runat="server" TextMode="Number"  style="display: inline; text-align: center;"></asp:TextBox>
                          </td>
                        <td style="width: 97px"> 
                            <asp:TextBox ID="TBCantidad1" runat="server" TextMode="Number"  style="display: inline; text-align: center;"></asp:TextBox>
                          </td>
                        <td style="width: 116px"> 
                            <asp:TextBox ID="TBSub1" runat="server" ReadOnly="True" TextMode="Number"></asp:TextBox>
                          </td>

                      </tr>

                      <tr>

                        <td> 
                            <asp:TextBox ID="TBIDProducto2" runat="server" TextMode="Number"  style="display: inline; text-align: center;"></asp:TextBox>
                          </td>
                        <td> 
                            <asp:TextBox ID="TBNombreP2" runat="server"></asp:TextBox>
                          </td>
                        <td>
                            <asp:TextBox ID="TBPrecio2" runat="server" TextMode="Number"  style="display: inline; text-align: center;"></asp:TextBox>
                          </td>
                        <td style="width: 97px"> 
                            <asp:TextBox ID="TBCantidad2" runat="server" TextMode="Number"  style="display: inline; text-align: center;"></asp:TextBox>
                          </td>
                        <td style="width: 116px"> 
                            <asp:TextBox ID="TBSub2" runat="server" ReadOnly="True" TextMode="Number"  style="display: inline; text-align: center;"></asp:TextBox>
                          </td>
                    </tr>

                     <tr>

                        <td> 
                            <asp:TextBox ID="TBIDProducto3" runat="server" TextMode="Number"  style="display: inline; text-align: center;"></asp:TextBox>
                         </td>
                        <td> 
                            <asp:TextBox ID="TBNombreP3" runat="server"></asp:TextBox>
                         </td>
                        <td>
                            <asp:TextBox ID="TBPrecio3" runat="server" TextMode="Number" style="display: inline; text-align: center;"></asp:TextBox>
                         </td>
                        <td style="width: 97px"> 
                            <asp:TextBox ID="TBCantidad3" runat="server" TextMode="Number"  style="display: inline; text-align: center;"></asp:TextBox>
                         </td>
                        <td style="width: 116px"> 
                            <asp:TextBox ID="TBSub3" runat="server" ReadOnly="True" TextMode="Number" style="display: inline; text-align: center;"></asp:TextBox>
                         </td>
                    </tr>
                    <tr>

                        <td> 
                            <asp:TextBox ID="TBIDProducto4" runat="server" TextMode="Number"></asp:TextBox>
                        </td>
                        <td> 
                            <asp:TextBox ID="TBNombreP4" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="TBPrecio4" runat="server" TextMode="Number"  style="display: inline; text-align: center;"></asp:TextBox>
                        </td>
                        <td style="width: 97px"> 
                            <asp:TextBox ID="TBCantidad4" runat="server" TextMode="Number" style="display: inline; text-align: center;"></asp:TextBox>
                        </td>
                        <td style="width: 116px"> 
                            <asp:TextBox ID="TBSub4" runat="server" ReadOnly="True" TextMode="Number"  style="display: inline; text-align: center;"></asp:TextBox>
                        </td>
                    </tr>
          <tr>
               <td>
               </td>
              <td>
               </td>
              <td>
               </td>
              <td>
                <asp:Label ID="Label3" runat="server" Text="Total"></asp:Label>
                  <br />
               </td>

             <td style="align-items:center">
              <asp:TextBox ID="TBtotal" runat="server" ReadOnly="True" TextMode="Number" style="display: inline; text-align: right;" ></asp:TextBox>

                  <asp:Label ID="LblDetalle" runat="server"></asp:Label>
             <br />
              
              </td>
             
             
          </tr>


          <tr>
             <td>
                  <asp:Label ID="LbProducto" runat="server" Text="Producto"></asp:Label>
                &nbsp;<asp:DropDownList ID="DLPRODUCTO" runat="server" DataSourceID="PRODUCTO" DataTextField="Nombre" DataValueField="id"></asp:DropDownList>  
                <asp:SqlDataSource ID="PRODUCTO" runat="server" ConnectionString="<%$ ConnectionStrings:FacturasConnectionString %>" SelectCommand="SP_Lista_Producto" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="LblCarntidad" runat="server" Text="Cantidad"></asp:Label>
                &nbsp;<asp:TextBox ID="TBCantidad" runat="server" TextMode="Number"  style="display: inline; text-align: center;" placeholder="Ingrese la cantida de producto" Width="62px"></asp:TextBox>

                 
            <br />
              
              </td>

                <td>
                 
                  <asp:Button ID="Agregar" runat="server" Text="+" />
              
              </td>
             
              
          </tr>

           <tr>
             <td>
                 <asp:GridView ID="GridProductos" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                     <Columns>
                         <asp:BoundField HeaderText="Cod_Producto" />
                         <asp:BoundField HeaderText="Nombre_Producto" />
                         <asp:BoundField HeaderText="Precio" />
                         <asp:BoundField HeaderText="Cantidad" />
                         <asp:BoundField HeaderText="Sub total" />
                     </Columns>
                     <FooterStyle BackColor="White" ForeColor="#000066" />
                     <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                     <RowStyle ForeColor="#000066" />
                     <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                     <SortedAscendingCellStyle BackColor="#F1F1F1" />
                     <SortedAscendingHeaderStyle BackColor="#007DBB" />
                     <SortedDescendingCellStyle BackColor="#CAC9C9" />
                     <SortedDescendingHeaderStyle BackColor="#00547E" />
                 </asp:GridView>
                  <br />
              
              </td>
             
          </tr>
           <tr>

             <td>
                 
                  <br />
              
              </td>
             
          </tr>

        <tr>
            <td colspan="5">
                <asp:Button ID="Guardar" runat="server" Text="Guardar" />
                <asp:Button ID="Anular" runat="server" Text="Anular" />
                 <asp:Button ID="Eliminar" runat="server" Text="Eliminar" />
                 <asp:Button ID="Buscar" runat="server" Text="Buscar" />
                 <asp:Button ID="Limpiar" runat="server" Text="Limpiar" />
                
                <asp:Label ID="LblResultado" runat="server"></asp:Label>
            </td>
        </tr>
                  </Table>--%>

       <div>
            <asp:Label ID="LbProducto" runat="server" Text="Producto"></asp:Label>
                &nbsp;<asp:DropDownList ID="DLPRODUCTO" runat="server" DataSourceID="PRODUCTO" DataTextField="Nombre" DataValueField="id"></asp:DropDownList>  
                <asp:SqlDataSource ID="PRODUCTO" runat="server" ConnectionString="<%$ ConnectionStrings:FacturasConnectionString %>" SelectCommand="SP_Lista_Producto" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
       <asp:Label ID="LblCarntidad" runat="server" Text="Cantidad"></asp:Label>
                &nbsp;<asp:TextBox ID="TBCantidad" runat="server" TextMode="Number"  style="display: inline; text-align: center;" placeholder="Ingrese la cantida de producto" Width="62px"></asp:TextBox>

        <asp:Button ID="Agregar" runat="server" Text="+" />

       </div>
      

       <div>
            <asp:GridView ID = "GridProductos" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
                 EmptyDataText="<div class='AspNet-GridView'><table cellpadding='0' cellspacing='0' summary=''><thead><tr><th scope='col'>Name</th><th scope='col'>ProductNumber</th><th scope='col'>Color</th><th scope='col'>StandardCost</th><th scope='col'>SellStartDate</th></tr></thead><tbody><tr><td colspan='5'>No se encontraron registros.<strong>En negrita.</strong></td></tr></tbody></table></div>"
                runat = "server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField = "Cod_Producto" HeaderText="Cod_Producto" ItemStyle-Width="30" />
                    <asp:BoundField DataField = "Nombre_Producto" HeaderText="Nombre_Producto" ItemStyle-Width="150" />
                    <asp:BoundField DataField = "Precio" HeaderText="Precio" ItemStyle-Width="12" />
                     <asp:BoundField DataField = "Cantidad" HeaderText="Cantidad" ItemStyle-Width="12" />
                    <asp:BoundField DataField = "Sub_Total" HeaderText="Sub_Total" ItemStyle-Width="12" />

                </Columns>
            </asp:GridView>
        </div>
        <div>
                <asp:Button ID="Guardar" runat="server" Text="Guardar" />
                <asp:Button ID="Anular" runat="server" Text="Anular" />
                 <asp:Button ID="Eliminar" runat="server" Text="Eliminar" />
                 <asp:Button ID="Buscar" runat="server" Text="Buscar" />
                 <asp:Button ID="Limpiar" runat="server" Text="Limpiar" />
                
                <asp:Label ID="LblResultado" runat="server"></asp:Label>
        </div>

     

     </asp:Panel>
   

</asp:Content>

                




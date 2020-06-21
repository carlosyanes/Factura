
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlTypes

Public Class RegistroFacturas
  Inherits System.Web.UI.Page
  Dim WithEvents Man As New Mantenimientos
  Dim miDataTable As New DataTable
  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    If Not IsPostBack Then
    Else

      miDataTable.Columns.Add("Nombre_Producto")
      miDataTable.Columns.Add("Cantidad")
    End If


    'If Not IsPostBack Then
    'Else


    '  miDataTable.Columns.Add("Cod_Producto")
    '  miDataTable.Columns.Add("Nombre_Producto")
    '  miDataTable.Columns.Add("Precio")
    '  miDataTable.Columns.Add("Cantidad")
    '  miDataTable.Columns.Add("Sub_Total")
    '  GridProductos.DataSource = miDataTable
    '  GridProductos.DataBind()

    'End If
  End Sub

  Protected Sub Guardar_Click(sender As Object, e As EventArgs) Handles Guardar.Click
    Dim XMLProducto As String = ""
    Dim Fecha As Date = Nothing
    Dim ClienteNombre As String = ""
    Dim Nit As String = ""
    Dim IdFactura As Integer = 0
    Dim Total As Double = 0
    Dim Estado As Char = "1"
    limpiarEstiquetas()
    'validar campos del encabezado de la factura
    If (validarcampos()) Then
      Fecha = TBFecha.Text
      ClienteNombre = TBNombreCliente.Text
      Nit = TBNIT.Text
      IdFactura = TBNFactura.Text
    End If

    'validar campos del detalle de la factura
    'If (validardetalle()) Then
    '  XMLProducto = "<detalles>"

    'If String.IsNullOrEmpty(TBCantidad1.Text) And String.IsNullOrEmpty(TBPrecio1.Text) Then
    '  TBSub1.Text = 0
    'Else
    '  TBSub1.Text = TBCantidad1.Text * TBPrecio1.Text
    '  XMLProducto += "<detalle><FacturaId>" + CStr(IdFactura) + "</FacturaId><ProductoId>" + TBIDProducto1.Text + "</ProductoId><Nombre>" + TBNombreP1.Text + "</Nombre> <Precio>" + TBPrecio1.Text + "</Precio><Cantidad> " + TBCantidad1.Text + " </Cantidad></detalle>"
    'End If

    'If String.IsNullOrEmpty(TBCantidad2.Text) And String.IsNullOrEmpty(TBPrecio2.Text) Then
    '  TBSub2.Text = 0
    'Else
    '  TBSub2.Text = TBCantidad2.Text * TBPrecio2.Text
    '  XMLProducto += "<detalle><FacturaId>" + IdFactura + "</FacturaId><ProductoId>" + TBIDProducto2.Text + "</ProductoId><Nombre>" + TBNombreP2.Text + "</Nombre> <Precio>" + TBPrecio2.Text + "</Precio><Cantidad> " + TBCantidad2.Text + " </Cantidad></detalle>"
    'End If


    'If String.IsNullOrEmpty(TBCantidad3.Text) And String.IsNullOrEmpty(TBPrecio3.Text) Then
    '  TBSub3.Text = 0
    'Else
    '  TBSub3.Text = TBCantidad3.Text * TBPrecio3.Text
    '  XMLProducto += "<detalle><FacturaId>" + IdFactura + "</FacturaId><ProductoId>" + TBIDProducto3.Text + "</ProductoId><Nombre>" + TBNombreP3.Text + "</Nombre> <Precio>" + TBPrecio3.Text + "</Precio><Cantidad> " + TBCantidad3.Text + " </Cantidad></detalle>"
    'End If

    'If String.IsNullOrEmpty(TBCantidad3.Text) And String.IsNullOrEmpty(TBPrecio3.Text) Then
    '  TBSub4.Text = 0
    'Else
    '  TBSub4.Text = TBCantidad4.Text * TBPrecio4.Text
    '  XMLProducto += "<detalle><FacturaId>" + IdFactura + "</FacturaId><ProductoId>" + TBIDProducto4.Text + "</ProductoId><Nombre>" + TBNombreP4.Text + "</Nombre> <Precio>" + TBPrecio4.Text + "</Precio><Cantidad> " + TBCantidad4.Text + " </Cantidad></detalle>"
    'End If

    'XMLProducto += "</detalles>"


    'TBtotal.Text = CInt(TBSub1.Text) + CInt(TBSub2.Text) + CInt(TBSub3.Text) + CInt(TBSub4.Text)

    'Total = TBtotal.Text

    'End If


    'If (ValidaNit(TBNIT.Text)) Then

    '  Dim bllFactura As New BLL.BllFactura
    '  If bllFactura.AgregarCliente(MiFactura) Then
    '    LblResultado.Text = "Agregado Exitosamente"
    '  Else
    '    LblResultado.Text = "No se Agregado "
    '  End If

    If (ValidaNit(TBNIT.Text)) Then
      If (Man.Ingresarfactura(IdFactura, Fecha, Nit, ClienteNombre, Total, Estado, XMLProducto)) Then
        LblResultado.Text = "Agregado Exitosamente"
        LblResultado.Attributes.Add("style", "color:green;")
      Else
        LblResultado.Text = "No se Agregado ya Existe"
        LblResultado.Attributes.Add("style", "color:red;")
      End If
    Else
      LblNIT.Text = "Debe de un Nit correcto"
      LblNIT.Attributes.Add("style", "color:red;")
    End If





  End Sub

  Public Function validarcampos() As Boolean
    Dim valida As Boolean = True

    If Trim(TBFecha.Text) = "" Then
      LblFecha.Text = "Debe de ingrese la fecha"
      LblFecha.Attributes.Add("style", "color:red;")


    End If
    If Trim(TBNombreCliente.Text) = "" Then
      LblCliente.Text = "Debe de ingrese la nombre del cliente"
      LblCliente.Attributes.Add("style", "color:red;")
      valida = False

    End If

    If Trim(TBNFactura.Text) = "" Then
      LblFactura.Text = "Debe de ingrese el numero de factura"
      LblFactura.Attributes.Add("style", "color:red;")
      valida = False

    End If
    If Trim(TBNIT.Text) = "" Then
      LblNIT.Text = "Debe de ingrese el Nit del cliente"
      LblNIT.Attributes.Add("style", "color:red;")
      valida = False

    End If

    Return valida
  End Function
  'Public Function validardetalle() As Boolean
  '  Dim valida As Boolean = False

  '  If (Trim(TBIDProducto1.Text) = "" And Trim(TBNombreP1.Text) = "" And Trim(TBCantidad1.Text) = "" And Trim(TBPrecio1.Text) = "") And (Trim(TBIDProducto2.Text) = "" And Trim(TBNombreP2.Text) = "" And Trim(TBCantidad2.Text) = "" And Trim(TBPrecio2.Text) = "") And (Trim(TBIDProducto3.Text) = "" And Trim(TBNombreP3.Text) = "" And Trim(TBCantidad3.Text) = "" And Trim(TBPrecio3.Text) = "") And (Trim(TBIDProducto4.Text) = "" And Trim(TBNombreP4.Text) = "" And Trim(TBCantidad4.Text) = "" And Trim(TBPrecio4.Text) = "") Then
  '    LblDetalle.Text = "Debe de ingrese por lo menos un producto"
  '    LblDetalle.Attributes.Add("style", "color:red;")
  '  Else
  '    valida = True
  '  End If

  '  Return valida
  'End Function

  Public Function ValidaNit(ByVal NIT As String) As Boolean
    Dim POS As Integer

    Dim Correlativo As String

    Dim DigitoVerificador As String

    Dim Factor As Integer

    Dim Suma As Integer = 0

    Dim Valor As Integer = 0

    Dim X As Integer

    Dim xMOD11 As Double = 0

    Dim S As String = Nothing


    ValidaNit = False


    Try
      POS = NIT.IndexOf("-")
      If POS = 0 Then Exit Function
      Correlativo = NIT.Substring(0, POS)

      DigitoVerificador = NIT.Substring(POS + 1)
      Factor = Correlativo.Length + 1

      For X = 0 To (NIT.IndexOf("-") - 1)
        Valor = Convert.ToInt32(NIT.Substring(X, 1))

        Suma += (Valor * Factor)

        Factor -= 1
      Next


      xMOD11 = (11 - (Suma Mod 11)) Mod 11

      S = Convert.ToString(xMOD11)


      If (xMOD11 = 10 And DigitoVerificador = "K") Or (S = DigitoVerificador) Then
        ValidaNit = True

      End If


    Catch ex As Exception
      LblNIT.Text = "Ingrese un Nit Correcto"
      LblNIT.Attributes.Add("style", "color:red;")


    End Try
  End Function

  Public Sub limpiarEstiquetas()

    LblFecha.Text = ""
    LblCliente.Text = ""
    LblFactura.Text = ""
    LblNIT.Text = ""
    'LblDetalle.Text = ""
    LblResultado.Text = ""

  End Sub
  Protected Sub Buscar_Click(sender As Object, e As EventArgs) Handles Buscar.Click
    Response.Redirect("BuscarFacturas.aspx")
  End Sub

  Protected Sub Eliminar_Click(sender As Object, e As EventArgs) Handles Eliminar.Click
    Response.Redirect("EliminarFacturas.aspx")
  End Sub

  Protected Sub Anular_Click(sender As Object, e As EventArgs) Handles Anular.Click
    Response.Redirect("AnularFacturas.aspx")
  End Sub

  Protected Sub Limpiar_Click(sender As Object, e As EventArgs) Handles Limpiar.Click
    TBFecha.Text = ""
    TBNFactura.Text = ""
    TBNombreCliente.Text = ""
    TBNIT.Text = ""

    LblFecha.Text = ""
    LblCliente.Text = ""
    LblFactura.Text = ""
    LblNIT.Text = ""
    'LblDetalle.Text = ""
    LblResultado.Text = ""
    'LblDetalle.Text = ""
    LblResultado.Text = ""

    'TBIDProducto1.Text = ""
    'TBNombreP1.Text = ""
    'TBCantidad1.Text = ""
    'TBPrecio1.Text = ""

    'TBIDProducto2.Text = ""
    'TBNombreP2.Text = ""
    'TBCantidad2.Text = ""
    'TBPrecio2.Text = ""

    'TBIDProducto3.Text = ""
    'TBNombreP3.Text = ""
    'TBCantidad3.Text = ""
    'TBPrecio3.Text = ""

    'TBIDProducto4.Text = ""
    'TBNombreP4.Text = ""
    'TBCantidad4.Text = ""
    'TBPrecio4.Text = ""
  End Sub

  Protected Sub Agregar_Click(sender As Object, e As EventArgs) Handles Agregar.Click



    Dim miDataTable As New DataTable
    miDataTable.Columns.Add("Cod_Producto")
    miDataTable.Columns.Add("Nombre_Producto")
    miDataTable.Columns.Add("Precio")
    miDataTable.Columns.Add("Cantidad")
    miDataTable.Columns.Add("Sub_Total")

    ' Renglon es la variable que adicionara renglones a mi datatable
    Dim Renglon As DataRow = miDataTable.NewRow()
    Renglon("Cod_Producto") = CInt(DLPRODUCTO.SelectedValue)
    Renglon("Nombre_Producto") = DLPRODUCTO.SelectedItem.Text
    Renglon("Precio") = 35
    Renglon("Cantidad") = CInt(TBCantidad.Text)
    Renglon("Sub_Total") = 35 * CDbl(TBCantidad.Text)
    miDataTable.Rows.Add(Renglon)



    '    por último enviado mi datatable a gridview para visualizarlo en pantalla
    Me.GridProductos.DataSource = miDataTable
    Me.GridProductos.DataBind()




  End Sub
End Class
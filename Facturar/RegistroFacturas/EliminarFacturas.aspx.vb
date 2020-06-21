Public Class EliminarFacturas
  Inherits System.Web.UI.Page
  Dim WithEvents Man As New Mantenimientos
  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

  End Sub



  Protected Sub Eliminar_Click(sender As Object, e As EventArgs) Handles Eliminar.Click
    Dim IdFactura As Integer = 0
    Dim valida As Boolean = True
    Dim Estado As Char = "3"
    If Trim(TBNFactura.Text) = "" Then
      LblEliminarFactura.Text = "Debe de ingrese el numero de factura"
      LblEliminarFactura.Attributes.Add("style", "color:red;")
      valida = False
    Else
      IdFactura = TBNFactura.Text

      If (Man.eliminarfactura(IdFactura, Estado)) Then
        LblEliminarFactura.Text = "Se eliminio Exitosamente"
        LblEliminarFactura.Attributes.Add("style", "color:green;")
      Else
        LblEliminarFactura.Text = "No se puede Eliminar "
        LblEliminarFactura.Attributes.Add("style", "color:red;")
      End If
    End If


  End Sub

  Protected Sub Retornar_Click(sender As Object, e As EventArgs) Handles Retornar.Click
    Response.Redirect("RegistroFacturas.aspx")
  End Sub
End Class
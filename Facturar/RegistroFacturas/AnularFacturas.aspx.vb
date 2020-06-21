Public Class AnularFacturas
  Inherits System.Web.UI.Page
  Dim WithEvents Man As New Mantenimientos
  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

  End Sub

  Protected Sub Anular_Click(sender As Object, e As EventArgs) Handles Anular.Click
    Dim IdFactura As Integer = 0
    Dim valida As Boolean = True
    Dim Estado As Char = "2"
    If Trim(TBNFactura.Text) = "" Then
      LblAnularFactura.Text = "Debe de ingrese el numero de factura"
      LblAnularFactura.Attributes.Add("style", "color:red;")
      valida = False
    Else
      IdFactura = TBNFactura.Text

      If (Man.eliminarfactura(IdFactura, Estado)) Then
        LblAnularFactura.Text = "Se Anulo Exitosamente"
        LblAnularFactura.Attributes.Add("style", "color:green;")
      Else
        LblAnularFactura.Text = "No se puede Anular "
        LblAnularFactura.Attributes.Add("style", "color:red;")
      End If
    End If

  End Sub

  Protected Sub Retornar_Click(sender As Object, e As EventArgs) Handles Retornar.Click
    Response.Redirect("RegistroFacturas.aspx")
  End Sub
End Class
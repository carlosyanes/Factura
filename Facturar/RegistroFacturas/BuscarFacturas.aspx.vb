Imports System.Drawing

Public Class BuscarFacturas
  Inherits System.Web.UI.Page
  Dim WithEvents Man As New Mantenimientos

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

  End Sub

  Protected Sub Retornar_Click(sender As Object, e As EventArgs) Handles Retornar.Click
    Response.Redirect("RegistroFacturas.aspx")
  End Sub

  Protected Sub Buscar_Click(sender As Object, e As EventArgs) Handles Buscar.Click

    Griddatos.DataSource = Nothing


    Dim tablas As New DataTable
    tablas = Man.Consultarfacturaxcliente(DlEstado.SelectedValue)
    Griddatos.DataSource = tablas
    Griddatos.DataBind()
  End Sub



End Class
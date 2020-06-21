Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web
Imports LayerEntity
Public Class DALFactura
  Public Function AgregarFactura(MiFactura As LayerEntity.ClsFactura) As Boolean
    Dim cnn As New SqlConnection(DAL.ClsConexion.cadcon)
    Dim cmd As New SqlCommand("SP_Crear_Factura", cnn)
    cmd.CommandType = CommandType.StoredProcedure
    'parametros a ingresar
    cmd.Parameters.Add("Id", SqlDbType.Int).Value = MiFactura.Id_Factura
    cmd.Parameters.Add("Fecha", SqlDbType.Date).Value = MiFactura.Fecha
    cmd.Parameters.Add("ClienteNit", SqlDbType.VarChar, 10).Value = MiFactura.ClienteNit
    cmd.Parameters.Add("ClienteNombre", SqlDbType.VarChar, 255).Value = MiFactura.ClienteNombre
    cmd.Parameters.Add("Total", SqlDbType.Float).Value = MiFactura.Total
    cmd.Parameters.Add("Estado", SqlDbType.Char, 1).Value = MiFactura.Estado
    cmd.Parameters.Add("XMLProducto", SqlDbType.VarChar, 255).Value = MiFactura.XMLProducto
    Try
      If cnn.State = ConnectionState.Closed Then
        cnn.Open()
      End If
      cmd.ExecuteNonQuery()
      Return True
    Catch ex As Exception
      Return False
    End Try
    cnn.Close()
  End Function
End Class

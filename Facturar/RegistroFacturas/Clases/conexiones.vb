Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Public Class conexiones
  Protected conn As New SqlConnection
  Event Err(descripcion As String)
  Public Function conectar(Optional CadenaConexion = Nothing)
    Dim Cadena As String
    If CadenaConexion = Nothing Then
      Cadena = ConfigurationManager.ConnectionStrings("FacturasConnectionString").ConnectionString
    Else
      Cadena = CadenaConexion
    End If
    Try
      conn = New SqlConnection(Cadena)
      conn.Open()
      Return True
    Catch ex As Exception
      RaiseEvent Err(ex.Message)
      Return False
    End Try
  End Function

  Public Function desconectar()
    Try
      If conn.State = ConnectionState.Open Then
        conn.Close()
        Return True
      Else
        Return False
      End If
    Catch ex As Exception
      RaiseEvent Err(ex.Message)
      Return False
    End Try
  End Function

End Class

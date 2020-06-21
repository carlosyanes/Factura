Imports System.Data.SqlClient


Public Class Mantenimientos
  Inherits conexiones
  Event Errores(Descripion As String)

  Public Function facturaxcliente() As DataTable

    Dim Query As String = "select  ClienteNombre [Nombre Cliente] , ClienteNit [Numero NIT] ,Count(Id ) [Cantidad Facturas] from factura where Estado =1 group by ClienteNombre, ClienteNit"
    Try
      conectar()
      Dim cmd As New SqlCommand(Query, conn)
      cmd.CommandType = CommandType.Text
      Dim resultado As SqlDataReader = cmd.ExecuteReader()
      Dim tablas As DataTable = New DataTable()
      tablas.Load(resultado)
      Return tablas
    Catch ex As Exception
      RaiseEvent Errores(ex.Message)
      Return Nothing
    Finally
      desconectar()
    End Try
  End Function

  Public Function Consultarfacturaxcliente(ByVal Estado As Char) As DataTable
    Try
      conectar()
      Dim cmd As New SqlCommand()
      cmd.Connection = conn
      cmd.CommandText = "SP_Busqueda_FacturasXCliente"
      cmd.CommandType = CommandType.StoredProcedure
      If Not (String.IsNullOrEmpty(Estado)) Then
        Dim Param = New SqlParameter("@Estado", Estado)
        cmd.Parameters.Add(Param)
      End If

      Dim resultado As SqlDataReader = cmd.ExecuteReader()
      Dim tablas As DataTable = New DataTable()
      tablas.Load(resultado)
      Return tablas
    Catch ex As Exception
      RaiseEvent Errores(ex.Message)
      Return Nothing
    Finally
      desconectar()
    End Try
  End Function



  Public Function Ingresarfactura(ByVal Id_Factura As Integer, ByVal Fecha As Date, ByVal ClienteNit As String, ByVal ClienteNombre As String, ByVal Total As Double, ByVal Estado As Char, ByVal XMLProducto As String) As Boolean
    Dim Result As Boolean = True
    Try
      conectar()
      Dim cmd As New SqlCommand()
      cmd.Connection = conn
      cmd.CommandText = "SP_Crear_Factura"
      cmd.CommandType = CommandType.StoredProcedure



      If Not (String.IsNullOrEmpty(Id_Factura)) Then

        cmd.Parameters.Add("@IdFactura", SqlDbType.Int).Value = Id_Factura

      End If
        If Not (String.IsNullOrEmpty(Fecha)) Then

        cmd.Parameters.Add("@Fecha", SqlDbType.Date).Value = Fecha

      End If
        If Not (String.IsNullOrEmpty(ClienteNit)) Then

        cmd.Parameters.Add("@ClienteNit", SqlDbType.VarChar, 10).Value = ClienteNit

      End If
        If Not (String.IsNullOrEmpty(ClienteNombre)) Then

        cmd.Parameters.Add("@ClienteNombre", SqlDbType.VarChar, 255).Value = ClienteNombre

      End If
        If Not (String.IsNullOrEmpty(Total)) Then

        cmd.Parameters.Add("@Total", SqlDbType.Float).Value = Total

      End If
        If Not (String.IsNullOrEmpty(Estado)) Then

        cmd.Parameters.Add("@Estado", SqlDbType.Char, 1).Value = Estado

      End If
        If Not (String.IsNullOrEmpty(XMLProducto)) Then

        cmd.Parameters.Add("@x", SqlDbType.VarChar, 255).Value = XMLProducto

      End If
      cmd.ExecuteNonQuery()

      Return Result
    Catch ex As Exception
      RaiseEvent Errores(ex.Message)
      Return False
    Finally
      desconectar()
    End Try
  End Function

  Public Function eliminarfactura(ByVal Id_Factura As Integer, ByVal Estado As Char) As Boolean
    Dim Result As Boolean = True
    Try
      conectar()
      Dim cmd As New SqlCommand()
      cmd.Connection = conn
      cmd.CommandText = "SP_Eliminar_Factura"
      cmd.CommandType = CommandType.StoredProcedure



      If Not (String.IsNullOrEmpty(Id_Factura)) Then

        cmd.Parameters.Add("@IdFactura", SqlDbType.Int).Value = Id_Factura

      End If

      If Not (String.IsNullOrEmpty(Estado)) Then

        cmd.Parameters.Add("@Estado", SqlDbType.Char, 1).Value = Estado

      End If

      cmd.ExecuteNonQuery()

      Return Result
    Catch ex As Exception
      RaiseEvent Errores(ex.Message)
      Return False
    Finally
      desconectar()
    End Try
  End Function


End Class

Public Class ClsFactura
#Region "Campos"

  Private _Id_Factura As Integer
  Private _Fecha As String
  Private _ClienteNit As String
  Private _ClienteNombre As String
  Private _Total As Double
  Private _Estado As Char
  Private _XMLProducto As String

#End Region
#Region "propiedades"
  Public Property Id_Factura As Integer
    Get
      Return _Id_Factura
    End Get
    Set(value As Integer)
    End Set
  End Property

  Public Property Fecha As String
    Get
      Return _Fecha
    End Get
    Set(value As String)
    End Set
  End Property
  Public Property ClienteNit As String
    Get
      Return _ClienteNit
    End Get
    Set(value As String)
    End Set
  End Property
  Public Property ClienteNombre As String
    Get
      Return _ClienteNombre
    End Get
    Set(value As String)
    End Set
  End Property

  Public Property Total As Double
    Get
      Return _Total
    End Get
    Set(value As Double)
    End Set
  End Property

  Public Property Estado As String
    Get
      Return _Estado
    End Get
    Set(value As String)
    End Set
  End Property
  Public Property XMLProducto As String
    Get
      Return _XMLProducto
    End Get
    Set(value As String)
    End Set
  End Property
#End Region

  Public Sub New()

  End Sub
  Public Sub New(ByVal Id_Factura As Integer, ByVal Fecha As String, ByVal ClienteNit As String, ByVal ClienteNombre As String, ByVal Total As Double, ByVal Estado As String, ByVal XMLProducto As String)
    _Id_Factura = Id_Factura
    _Fecha = Fecha
    _ClienteNit = ClienteNit
    _ClienteNombre = ClienteNombre
    _Total = Total
    _Estado = Estado
    _XMLProducto = XMLProducto
  End Sub
End Class

Public Class BllFactura
  Dim MiDalFactura As New DAL.DALFactura
  Public Function AgregarCliente(MiFactura As LayerEntity.ClsFactura) As Boolean
    Return MiDalFactura.AgregarFactura(MiFactura)
  End Function

End Class

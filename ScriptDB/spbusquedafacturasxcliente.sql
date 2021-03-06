USE [Facturas]
GO
/****** Object:  StoredProcedure [dbo].[SP_Busqueda_FacturasXCliente]    Script Date: 18/03/2020 11:03:19 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CY
-- Create date: BusquedafacturasXCliente
-- Description:	busqueda de facturas por Cliente
-- =============================================
ALTER PROCEDURE [dbo].[SP_Busqueda_FacturasXCliente]
	-- Add the parameters for the stored procedure here
  @Estado int =null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select  ClienteNombre [Nombre Cliente] , ClienteNit [Numero NIT] ,Count(Id ) [Cantidad Facturas] from 
	factura where Estado =@Estado
	group by ClienteNombre, ClienteNit

END

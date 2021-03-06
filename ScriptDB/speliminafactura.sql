USE [Facturas]
GO
/****** Object:  StoredProcedure [dbo].[SP_Eliminar_Factura]    Script Date: 16/03/2020 09:21:14 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CY
-- Create date:16/3/2020
-- Description:	Elimina de factura
-- =============================================
ALTER PROCEDURE [dbo].[SP_Eliminar_Factura] 
	-- Add the parameters for the stored procedure here
	@IdFactura int,
 @Estado char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Factura set   Estado=@Estado WHERE Id=@IdFactura
END

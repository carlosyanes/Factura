USE [Facturas]
GO
/****** Object:  StoredProcedure [dbo].[SP_Crear_Detalle]    Script Date: 18/03/2020 02:44:22 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CY
-- Create date:16/3/2020
-- Description:	Crear de Detalle factura
-- =============================================
ALTER PROCEDURE [dbo].[SP_Crear_Detalle]
	-- Add the parameters for the stored procedure here
	
 @xc varchar(max)= null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
declare
@x xml
select @x=@xc
	

    -- Insert statements for procedure here
	INSERT INTO Detalle
	SELECT
	   doc.col.value('FacturaId[1]', 'int') FacturaId
	   ,doc.col.value('ProductoId[1]', 'int') ProductoId
	   ,doc.col.value('Cantidad[1]', 'int') Cantidad 
   FROM @x.nodes('/detalles/detalle') doc(col)

END

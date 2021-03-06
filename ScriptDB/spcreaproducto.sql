USE [Facturas]
GO
/****** Object:  StoredProcedure [dbo].[SP_Crear_Producto]    Script Date: 18/03/2020 02:44:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CY
-- Create date:16/3/2020
-- Description:	Crear de Producto
-- =============================================
ALTER PROCEDURE [dbo].[SP_Crear_Producto]
	-- Add the parameters for the stored procedure here
	

 @x varchar(max)= null,
 @Estado char(1)=1
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
declare 
@xc xml

select @xc=@x

	   	INSERT INTO Producto

SELECT
   doc.col.value('ProductoId[1]', 'int') ProductoId
  ,doc.col.value('Nombre[1]', 'nvarchar(10)') Nombre 
   ,doc.col.value('Precio[1]', 'float') Precio 
    , Estado = @Estado

FROM @xc.nodes('/detalles/detalle') doc(col)
END

USE [Facturas]
GO
/****** Object:  StoredProcedure [dbo].[SP_Crear_Factura]    Script Date: 18/03/2020 03:54:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CY
-- Create date:16/3/2020
-- Description:	Crear de factura
-- =============================================
ALTER PROCEDURE [dbo].[SP_Crear_Factura]
	-- Add the parameters for the stored procedure here
 @IdFactura int ,	
 @Fecha datetime= NULL,	
 @ClienteNit nchar (10)= NULL, 
 @ClienteNombre varchar(max)= NULL,
 @Total float =NULL,
 @Estado char(1)=1,
 @x varchar(max)= null
AS
BEGIN



Begin TRAN
BEGIN TRY
  -- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


    -- Insert statements for procedure here
		insert into  Factura
	   (Id,Fecha,ClienteNit, ClienteNombre,Total,Estado)
	   values(@IdFactura,@Fecha, @ClienteNit, @ClienteNombre,@Total, @Estado)

	EXEC SP_Crear_Producto @x,@Estado
	
	EXEC SP_Crear_Detalle @x
  Commit TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
  BEGIN
    ROLLBACK TRAN
	 RAISERROR ('ya existe la factura', 16, 1)
    RETURN
  END 
END CATCH

END

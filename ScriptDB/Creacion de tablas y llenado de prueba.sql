Create table  Producto
( Id int  NOT NULL,
  Nombre nvarchar(max) NULL,
  Precio float NULL,
  Estado char(1),
   PRIMARY KEY (Id)
   
)



Create table  Factura
( Id int  NOT NULL,
  Fecha date NULL,
  ClienteNit nchar (10) NULL,
  ClienteNombre nvarchar(max) NULL,
  Total float NULL,
  Estado char(1),
  XMLProducto nvarchar(max) NULL,
   PRIMARY KEY (Id)
   
)

Create table  Detalle
(
	FacturaId int NOT NULL,
	 ProductoId int NOT NULL,
	 Cantidad int NULL,
	 FOREIGN KEY (FacturaId) REFERENCES Factura(Id),
	  FOREIGN KEY (ProductoId) REFERENCES Producto(Id),
)

    

	--DROP TABLE PRODUCTO
	--DROP TABLE FACTURA
	--DROP TABLE Detalle

	---- sp para abc
	--execute SP_Eliminar_Factura 1,1
--	execute SP_Crear_Factura '2020-03-16','46020292','Carlos Olivio Natareno Yanes','200',1,

--	 execute SP_Crear_Producto  'playera s' ,50.00,'1'
--	 execute SP_Crear_Producto  'playera sx' ,55.00,'1'
--	  execute SP_Crear_Producto  'playera m' ,75.00,'1'
--	   execute SP_Crear_Producto  'playera l' ,95.00,'1'
--	    execute SP_Crear_Producto  'playera xl' ,100.00,'1'

--		execute SP_Crear_Detalle N'<detalles>
--  <detalle FacturaId="1" ProductoId="1" Cantidad="2" ></detalle>
--  <detalle FacturaId="1" ProductoId="2" Cantidad="2" ></detalle>
--</detalles>'








select * from Factura

delete factura


declare
@x xml


@x=N'<detalles>
--  <detalle FacturaId="1" ProductoId="1" Cantidad="2" ></detalle>
--  <detalle FacturaId="1" ProductoId="2" Cantidad="2" ></detalle>
--</detalles>'

select REPLACE(@x, '<detalle', '<detalle FacturaId="'
+1'"')




DECLARE @xml xml
SET @xml = N'<detalles>
               <detalle><FacturaId>100</FacturaId><ProductoId>1</ProductoId><Nombre>playera xs</Nombre> <Precio>35</Precio><Cantidad> 10</Cantidad></detalle>
               <detalle><FacturaId>100</FacturaId><ProductoId>1</ProductoId><Nombre>playera s</Nombre> <Precio>35</Precio><Cantidad> 10</Cantidad></detalle>
             </detalles>'

SELECT
   doc.col.value('FacturaId[1]', 'int') FacturaId,
   doc.col.value('ProductoId[1]', 'int') ProductoId
  ,doc.col.value('Nombre[1]', 'nvarchar(10)') Nombre 
   ,doc.col.value('Precio[1]', 'float') Precio 
    ,doc.col.value('Cantidad[1]', 'int') Cantidad 

FROM @xml.nodes('/detalles/detalle') doc(col)

select * from factura 
select * from Producto
select* from Detalle

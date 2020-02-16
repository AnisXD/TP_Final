---------------------------------------------------------------------------------
--                                TRIGGERS                                     --
---------------------------------------------------------------------------------
CREATE TRIGGER ACTUALIZA_TOTAL_VENTA
ON DETALLES_VENTA
AFTER INSERT 
AS 
BEGIN 
SET NOCOUNT ON; 
UPDATE VENTAS set IMPORTETOTAL = IMPORTETOTAL + (SELECT PU_DV FROM INSERTED) 
where ID_VTA = (SELECT ID_VTA_DV FROM INSERTED)
END
GO

--Trigger que resta stock del inventario tras insertar un detalle de venta
CREATE TRIGGER ACTUALIZA_STOCK 
ON DETALLES_VENTA
AFTER INSERT 
AS 
BEGIN 
SET NOCOUNT ON; 
UPDATE CELULARES set STOCK_CEL = STOCK_CEL - (SELECT CANTIDAD_DV FROM INSERTED) 
where ID_MODELO = (SELECT ID_MODELO_DV FROM INSERTED)
END
GO

--Trigger que hace un reseed de la tabla Detalles ventas por cada nueva venta
CREATE TRIGGER RESEEDDV
ON VENTA
AFTER INSERT 
AS 
BEGIN  
DBCC CHECKIDENT (DETALLES_VENTA, reseed, 0);
END
GO
--Trigger que evita la modificación o eliminación de las tablas de la base de datos
CREATE Trigger TR_SEGURIDAD
ON database FOR DROP_TABLE,ALTER_TABLE
AS 
BEGIN
RAISERROR ('No está permitido borrar ni modificar tablas!',16,1)
ROLLBACK TRANSACTION
END



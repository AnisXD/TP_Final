--Trigger que evita la modificación o eliminación de las tablas de la base de datos
CREATE Trigger TR_SEGURIDAD
ON database FOR DROP_TABLE,ALTER_TABLE
AS 
BEGIN
RAISERROR ('No está permitido borrar ni modificar tablas!',16,1)
ROLLBACK TRANSACTION
END
go
--Trigger que resta stock del inventario tras insertar un detalle de venta
CREATE Trigger ACTUALIZA_STOCK 
ON DETALLES_VENTA
AFTER INSERT 
AS 
BEGIN 
SET NOCOUNT ON; 
UPDATE ProvXCel set stock_pc = stock_pc - (SELECT Cantidad_dv FROM INSERTED) 
where ID_PROV_pc = (SELECT ID_PROV_DF FROM INSERTED) and ID_Modelo_pc = (SELECT ID_Modelo_dv FROM INSERTED) 
END
go
--Trigger que hace un reseed de la tabla Detalles ventas por cada nueva venta
CREATE TRIGGER RESEED_DV
ON DETALLES_VENTA
AFTER INSERT 
AS 
BEGIN 
SET NOCOUNT ON; 
DBCC CHECKIDENT ('DetallesVentas', reseed, 1);
END

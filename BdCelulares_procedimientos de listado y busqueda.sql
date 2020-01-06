USE FINALPROG
GO

--------------------------------------------------------------
      --- Listados de Registros por Tabla---
--------------------------------------------------------------

CREATE Procedure MostrarMarcas
AS
   SELECT ID_MARCA AS Id,
		  NOMBRE_MARCA AS Marca
	FROM MARCAS
	  WHERE ESTADO_MARCA = 1
GO

CREATE Procedure MostrarCelulares
AS
   SELECT ID_MODELO as Modelo,
		  NOMBRE_MARCA as Marca,
		  DESCRIPCION_CEL as Descripcion,
		  STOCK_CEL as Stock,
		  PRECIO_UNITARIO_CEL as Precio,
		  UBICACION_IMAGEN_CEL as Imagen
	FROM CELULARES inner join MARCAS on (ID_MARCA_CEL=ID_MARCA)
	  WHERE ESTADO_CEL = 1
GO


CREATE Procedure MostrarRoles
AS
   SELECT ID_ROL AS Id,
		  ROL AS Rol
	FROM ROL
GO


CREATE Procedure MostrarUsuarios
AS
   SELECT DNI_USU AS DNI,
		  NOMBRE_USU AS Nombre,
		  APELLIDO_USU AS Apellido,
		  TELEFONO_USU AS Telefono,
		  descripcion_provincia AS Provincia,
		  desc_localidad AS Localidad,
		  DIRECCION_USU AS Direccion,
		  ROL AS Rol
	FROM USUARIOS inner join PROVINCIAS on (ID_PROVINCIA_USU=cod_provincia)
				  inner join LOCALIDADES on (ID_LOCALIDAD_USU=cod_postal)
				  inner join ROL on(ID_ROL_USU=ID_ROL)
	  WHERE ESTADO_USU = 1
GO

CREATE Procedure MostrarFormaPago
AS
   SELECT ID_FORMAPAGO_FP AS Id,
		  FORMAPAGO_FP AS FormaDePago
	FROM FORMA_PAGO
	  WHERE ESTADO_FP = 1
GO
CREATE Procedure MostrarFormaEnvio
AS
   SELECT ID_FORMAENVIO_FE AS Id,
		  FORMAENVIO_FE AS FormaDePago
	FROM FORMA_ENVIO
	  WHERE ESTADO_FE = 1
GO

CREATE Procedure MostrarVenta
AS
   SELECT ID_VTA AS Id,
		  ID_USU_VTA AS Usuario,
		  NOMBRE_USU AS Nombre,
		  APELLIDO_USU AS Apellido,
		  FECHA_VTA AS Fecha,
		  FORMAENVIO_FE AS FormaDeEnvio,
		  FORMAPAGO_FP AS FormaDePago,
		  IMPORTETOTAL AS Total
	FROM VENTAS inner join USUARIOS on(ID_USU_VTA=DNI_USU)
				inner join FORMA_ENVIO on (ID_FORMAENVIO_VTA=ID_FORMAENVIO_FE)
				inner join FORMA_PAGO on (ID_FORMAPAGO_VTA = ID_FORMAPAGO_FP)
GO

CREATE Procedure MostrarProvincias
AS
   SELECT cod_provincia AS IdProvincia,
		  descripcion_provincia AS Provincia
	FROM PROVINCIAS
GO

--------------------------------------------------------------
      --- Busqueda de Registros ---
--------------------------------------------------------------

------> LOCALIDADES 

CREATE Procedure MostrarLocalidadesPorProvincia
 @IDPROVINCIA int
AS
   SELECT cod_postal as IdLocalidad,
		  desc_localidad as Localidad
	FROM LOCALIDADES
	  WHERE cod_provincia = @IDPROVINCIA
GO

------> USUARIOS

CREATE Procedure MostrarUsuariosPorId
@IDUSU varchar(1)
AS
   SELECT DNI_USU as DNI,
		  NOMBRE_USU as Nombre,
		  APELLIDO_USU as Apellido,
		  TELEFONO_USU as Telefono,
		  descripcion_provincia as Provincia,
		  desc_localidad as Localidad,
		  DIRECCION_USU as Direccion,
		  ROL as Rol
	FROM USUARIOS inner join PROVINCIAS on (ID_PROVINCIA_USU=cod_provincia)
				  inner join LOCALIDADES on (ID_LOCALIDAD_USU=cod_postal)
				  inner join ROL on(ID_ROL_USU=ID_ROL)
	  WHERE ESTADO_USU = 1 AND DNI_USU=@IDUSU
GO
CREATE Procedure MostrarUsuariosPorRol
@IDROL varchar(1)
AS
   SELECT DNI_USU as DNI,
		  NOMBRE_USU as Nombre,
		  APELLIDO_USU as Apellido,
		  TELEFONO_USU as Telefono,
		  descripcion_provincia as Provincia,
		  desc_localidad as Localidad,
		  DIRECCION_USU as Direccion,
		  ROL as Rol
	FROM USUARIOS inner join PROVINCIAS on (ID_PROVINCIA_USU=cod_provincia)
				  inner join LOCALIDADES on (ID_LOCALIDAD_USU=cod_postal)
				  inner join ROL on(ID_ROL_USU=ID_ROL)
	  WHERE ESTADO_USU = 1 AND ID_ROL_USU=@IDROL
GO

------> VENTAS

CREATE Procedure MostrarVentaPorUsuario
@DNIUSUARIO varchar(15)
AS
   SELECT ID_VTA AS IdVenta,
		  ID_USU_VTA AS Usuario,
		  NOMBRE_USU AS Nombre,
		  APELLIDO_USU AS Apellido,
		  FECHA_VTA AS Fecha,
		  FORMAENVIO_FE AS FormaDeEnvio,
		  FORMAPAGO_FP AS FormaDePago,
		  IMPORTETOTAL AS Total
	FROM VENTAS inner join USUARIOS on(ID_USU_VTA=DNI_USU)
				inner join FORMA_ENVIO on (ID_FORMAENVIO_VTA=ID_FORMAENVIO_FE)
				inner join FORMA_PAGO on (ID_FORMAPAGO_VTA = ID_FORMAPAGO_FP)
	where ID_USU_VTA=@DNIUSUARIO
GO

CREATE Procedure MostrarVentaPorId
@IDVENTA int
AS
   SELECT ID_VTA AS IdVenta,
		  ID_USU_VTA AS Usuario,
		  NOMBRE_USU AS Nombre,
		  APELLIDO_USU AS Apellido,
		  FECHA_VTA AS Fecha,
		  FORMAENVIO_FE AS FormaDeEnvio,
		  FORMAPAGO_FP AS FormaDePago,
		  IMPORTETOTAL AS Total
	FROM VENTAS inner join USUARIOS on(ID_USU_VTA=DNI_USU)
				inner join FORMA_ENVIO on (ID_FORMAENVIO_VTA=ID_FORMAENVIO_FE)
				inner join FORMA_PAGO on (ID_FORMAPAGO_VTA = ID_FORMAPAGO_FP)
	where ID_VTA=@IDVENTA
GO

CREATE Procedure MostrarVentaPorFecha
@FECHA DATE
AS
   SELECT ID_VTA AS IdVenta,
		  ID_USU_VTA AS Usuario,
		  NOMBRE_USU AS Nombre,
		  APELLIDO_USU AS Apellido,
		  FECHA_VTA AS Fecha,
		  FORMAENVIO_FE AS FormaDeEnvio,
		  FORMAPAGO_FP AS FormaDePago,
		  IMPORTETOTAL AS Total
	FROM VENTAS inner join USUARIOS on(ID_USU_VTA=DNI_USU)
				inner join FORMA_ENVIO on (ID_FORMAENVIO_VTA=ID_FORMAENVIO_FE)
				inner join FORMA_PAGO on (ID_FORMAPAGO_VTA = ID_FORMAPAGO_FP)
	where FECHA_VTA=@FECHA
GO

CREATE Procedure MostrarVentasEntreFechas
@FECHAINICIO DATE,
@FECHAFIN DATE
AS
   SELECT ID_VTA AS IdVenta,
		  ID_USU_VTA AS Usuario,
		  NOMBRE_USU AS Nombre,
		  APELLIDO_USU AS Apellido,
		  FECHA_VTA AS Fecha,
		  FORMAENVIO_FE AS FormaDeEnvio,
		  FORMAPAGO_FP AS FormaDePago,
		  IMPORTETOTAL AS Total
	FROM VENTAS inner join USUARIOS on(ID_USU_VTA=DNI_USU)
				inner join FORMA_ENVIO on (ID_FORMAENVIO_VTA=ID_FORMAENVIO_FE)
				inner join FORMA_PAGO on (ID_FORMAPAGO_VTA = ID_FORMAPAGO_FP)
	where FECHA_VTA>@FECHAINICIO AND FECHA_VTA<@FECHAFIN
GO

CREATE Procedure MostrarVentasPorFormaDePago
@IDFORMAPAGOVENTA char
AS
   SELECT ID_VTA AS IdVenta,
		  ID_USU_VTA AS Usuario,
		  NOMBRE_USU AS Nombre,
		  APELLIDO_USU AS Apellido,
		  FECHA_VTA AS Fecha,
		  FORMAENVIO_FE AS FormaDeEnvio,
		  FORMAPAGO_FP AS FormaDePago,
		  IMPORTETOTAL AS Total
	FROM VENTAS inner join USUARIOS on(ID_USU_VTA=DNI_USU)
				inner join FORMA_ENVIO on (ID_FORMAENVIO_VTA=ID_FORMAENVIO_FE)
				inner join FORMA_PAGO on (ID_FORMAPAGO_VTA = ID_FORMAPAGO_FP)
	where ID_FORMAPAGO_VTA = @IDFORMAPAGOVENTA
GO

CREATE Procedure MostrarVentasPorFormaDeEnvio
@IDFORMAENVIOVENTA char
AS
   SELECT ID_VTA AS IdVenta,
		  ID_USU_VTA AS Usuario,
		  NOMBRE_USU AS Nombre,
		  APELLIDO_USU AS Apellido,
		  FECHA_VTA AS Fecha,
		  FORMAENVIO_FE AS FormaDeEnvio,
		  FORMAPAGO_FP AS FormaDePago,
		  IMPORTETOTAL AS Total
	FROM VENTAS inner join USUARIOS on(ID_USU_VTA=DNI_USU)
				inner join FORMA_ENVIO on (ID_FORMAENVIO_VTA=ID_FORMAENVIO_FE)
				inner join FORMA_PAGO on (ID_FORMAPAGO_VTA = ID_FORMAPAGO_FP)
	where ID_FORMAENVIO_VTA = @IDFORMAENVIOVENTA
GO

------> DETALLES DE VENTAS

CREATE Procedure MostrarDetallesPorIdVenta
@IDVENTA int
AS
   SELECT ID_DV AS Detalle,
		  ID_MODELO_DV AS Modelo,
		  NOMBRE_MARCA AS Marca,
		  CANTIDAD_DV AS Cantidad,
		  PU_DV AS PrecioUnitario,
		  (CANTIDAD_DV*PU_DV) AS Total
	FROM DETALLES_VENTA inner join CELULARES on (ID_MODELO_DV=ID_MODELO)
						inner join MARCAS on (ID_MARCA_CEL=ID_MARCA)
	WHERE ID_VTA_DV=@IDVENTA
GO

CREATE Procedure MostrarDetallesPorIdModelo
@IDMODELO varchar(15)
AS
   SELECT ID_DV AS Detalle,
		  ID_MODELO_DV AS Modelo,
		  NOMBRE_MARCA AS Marca,
		  CANTIDAD_DV AS Cantidad,
		  PU_DV AS PrecioUnitario,
		  (CANTIDAD_DV*PU_DV) AS Total
	FROM DETALLES_VENTA inner join CELULARES on (ID_MODELO_DV=ID_MODELO)
						inner join MARCAS on (ID_MARCA_CEL=ID_MARCA)
	WHERE ID_MODELO_DV=@IDMODELO
GO

CREATE Procedure MostrarDetallesPorIdMarca
@IDMARCA varchar(15)
AS
   SELECT ID_DV AS Detalle,
		  ID_MODELO_DV AS Modelo,
		  NOMBRE_MARCA AS Marca,
		  CANTIDAD_DV AS Cantidad,
		  PU_DV AS PrecioUnitario,
		  (CANTIDAD_DV*PU_DV) AS Total
	FROM DETALLES_VENTA inner join CELULARES on (ID_MODELO_DV=ID_MODELO)
						inner join MARCAS on (ID_MARCA_CEL=ID_MARCA)
	WHERE ID_MARCA_CEL=@IDMARCA
GO

------> CELULARES

CREATE Procedure MostrarCelularesPorIdMarca
@IDMARCA varchar(15)
AS
   SELECT ID_MODELO as Modelo,
		  NOMBRE_MARCA as Marca,
		  DESCRIPCION_CEL as Descripcion,
		  STOCK_CEL as Stock,
		  PRECIO_UNITARIO_CEL as Precio,
		  UBICACION_IMAGEN_CEL as Imagen
	FROM CELULARES inner join MARCAS on (ID_MARCA_CEL=ID_MARCA)
	  WHERE ESTADO_CEL = 1 AND ID_MARCA_CEL=@IDMARCA
GO

CREATE Procedure MostrarCelularesPorIdModelo
@IDMODELO varchar(15)
AS
   SELECT ID_MODELO as Modelo,
		  NOMBRE_MARCA as Marca,
		  DESCRIPCION_CEL as Descripcion,
		  STOCK_CEL as Stock,
		  PRECIO_UNITARIO_CEL as Precio,
		  UBICACION_IMAGEN_CEL as Imagen
	FROM CELULARES inner join MARCAS on (ID_MARCA_CEL=ID_MARCA)
	  WHERE ESTADO_CEL = 1 AND ID_MODELO=@IDMODELO
GO

------> MARCAS
CREATE Procedure MostrarMarcasPorId
@IDMARCA varchar(15)
AS
   SELECT ID_MARCA AS Id,
		  NOMBRE_MARCA AS Marca
	FROM MARCAS
	  WHERE ESTADO_MARCA = 1 AND ID_MARCA=@IDMARCA
GO

CREATE Procedure MostrarMarcasPorNombre
@NOMBREMARCA varchar(20)
AS
   SELECT ID_MARCA AS Id,
		  NOMBRE_MARCA AS Marca
	FROM MARCAS
	  WHERE ESTADO_MARCA = 1 AND NOMBRE_MARCA=@NOMBREMARCA
GO
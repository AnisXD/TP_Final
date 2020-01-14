---------------------------------------------
   ---- CREACION DE LA BASE DE DATOS-----
---------------------------------------------
USE master
go
CREATE DATABASE FINALPROG
go

USE FINALPROG
GO
--------------------------------------------------------
 -- CREACION DE PROVINCIAS Y LOCALIDADES -- 
--------------------------------------------------------
CREATE TABLE [PROVINCIAS](
	[cod_provincia] [int] NOT NULL,
	[descripcion_provincia] [nvarchar](50) NULL,
 CONSTRAINT [PK_PROVINCIAS] PRIMARY KEY CLUSTERED ([cod_provincia] ASC)
)
CREATE TABLE [LOCALIDADES](
	[cod_postal] [int] NOT NULL,
	[desc_localidad] [nvarchar](50) NULL,
	[cod_provincia] [int] NULL,
 CONSTRAINT [PK_LOCALIDADES] PRIMARY KEY CLUSTERED ([cod_postal] ASC)
)
---------------------------------------------------
 --- CREACION DE LAS OTRAS TABLAS ---
---------------------------------------------------
CREATE TABLE MARCAS
(
  ID_MARCA varchar(15) NOT NULL,
  NOMBRE_MARCA varchar(20) NOT NULL,
  ESTADO_MARCA bit NOT NULL default 1,
  Constraint PK_MARCA PRIMARY KEY (ID_MARCA)
)
GO
CREATE TABLE CELULARES
(
  ID_MODELO varchar(15) NOT NULL,
  ID_MARCA_CEL varchar(15) NOT NULL,
  DESCRIPCION_CEL varchar(100) NOT NULL,
  STOCK_CEL int NOT NULL default 1,
  PRECIO_UNITARIO_CEL float NOT NULL,
  UBICACION_IMAGEN_CEL varchar (100) NOT NULL,
  ESTADO_CEL bit NOT NULL default 1,
  Constraint PK_CELULARES PRIMARY KEY (ID_MODELO),
  Constraint FK_CELULARES FOREIGN KEY (ID_MARCA_CEL) references MARCAS(ID_MARCA)
)
GO
CREATE TABLE ROL
(
  ID_ROL varchar (1) NOT NULL,
  ROL varchar (20) NOT NULL
  Constraint PK_ROL PRIMARY KEY (ID_ROL)
)
GO
CREATE TABLE USUARIOS
(
  DNI_USU varchar(15) NOT NULL,
  NOMBRE_USU varchar(30) NOT NULL,
  APELLIDO_USU varchar(30) NOT NULL,
  TELEFONO_USU varchar(20) NOT NULL,
  ID_PROVINCIA_USU INT NOT NULL references PROVINCIAS(cod_provincia),
  ID_LOCALIDAD_USU INT NOT NULL references LOCALIDADES(cod_postal),
  DIRECCION_USU varchar(30) NOT NULL,
  CONTRASEÑA varchar(15) NOT NULL,
  ID_ROL_USU varchar (1) NOT NULL references ROL(ID_ROL),
  ESTADO_USU bit NOT NULL default 1,
  Constraint PK_USUARIOS PRIMARY KEY (DNI_USU)
)
GO
 CREATE TABLE FORMA_PAGO
(
  ID_FORMAPAGO_FP char(1) NOT NULL,
  FORMAPAGO_FP varchar (20) NOT NULL,
  ESTADO_FP bit NOT NULL default 1,
  Constraint PK_FORMA_PAGO PRIMARY KEY (ID_FORMAPAGO_FP)
)
GO
CREATE TABLE FORMA_ENVIO
(
   ID_FORMAENVIO_FE char(1) NOT NULL,
   FORMAENVIO_FE varchar (20) NOT NULL,
   ESTADO_FE bit NOT NULL default 1,
  Constraint PK_FORMA_ENVIO PRIMARY KEY (ID_FORMAENVIO_FE)
)
GO
CREATE TABLE VENTAS
(
  ID_VTA int IDENTITY(1,1) NOT NULL,
  ID_USU_VTA varchar(15) NOT NULL,
  ID_CLI_VTA varchar(15) NOT NULL,
  FECHA_VTA date NOT NULL,
  ID_FORMAENVIO_VTA char(1) NOT NULL default 1,
  ID_FORMAPAGO_VTA char(1) NOT NULL default 1,
  IMPORTETOTAL float NOT NULL,
  Constraint PK_VENTAS PRIMARY KEY (ID_VTA),
  Constraint FK_VENTAS_USU FOREIGN KEY (ID_USU_VTA) references USUARIOS (DNI_USU), 
  Constraint FK_VENTAS_CLI FOREIGN KEY (ID_CLI_VTA) references USUARIOS (DNI_USU),
  Constraint FK_VENTAS_FE FOREIGN KEY (ID_FORMAENVIO_VTA) references FORMA_ENVIO(ID_FORMAENVIO_FE),
  Constraint FK_VENTAS_FP FOREIGN KEY (ID_FORMAPAGO_VTA) references FORMA_PAGO(ID_FORMAPAGO_FP),
)
GO
CREATE TABLE DETALLES_VENTA
(
  ID_VTA_DV int NOT NULL,
  ID_DV int IDENTITY(1,1) NOT NULL,
  ID_MODELO_DV varchar (15) NOT NULL,
  CANTIDAD_DV int NOT NULL,
  PU_DV float NOT NULL,
  Constraint PK_DETALLES_VENTAS PRIMARY KEY (ID_DV, ID_VTA_DV),
  Constraint FK_ID_MODELO_DV FOREIGN KEY (ID_MODELO_DV) references CELULARES(ID_MODELO),
  Constraint FK_VENTAS_DV FOREIGN KEY (ID_VTA_DV) references VENTAS(ID_VTA)
)
GO
---------------------------------------------------------------
-- PROCEDIMIENTOS ALMACENADOS DE ALTA, BAJA Y MODIFICACION --
---------------------------------------------------------------
 
USE FINALPROG
GO
-------------------------------
       -- MARCAS --
-------------------------------
CREATE Procedure AltaMarca
 @IDMARCA varchar(15),
 @NOMBREMARCA varchar(30)
AS
 INSERT INTO MARCAS (ID_MARCA,
		 NOMBRE_MARCA)
	SELECT @IDMARCA,
		 @NOMBREMARCA
GO

CREATE Procedure ModificarMarca
 @IDMARCA varchar(15),
 @NOMBREMARCA varchar(30)
AS
 UPDATE MARCAS
	SET NOMBRE_MARCA = @NOMBREMARCA
	   WHERE ID_MARCA = @IDMARCA
GO

CREATE Procedure BajaLogicaMarca
@IDMARCA varchar(15)
AS
  UPDATE MARCAS
	Set ESTADO_MARCA = 0
		WHERE ID_MARCA = @IDMARCA
GO
------------------------
     -- CELULAR --
------------------------
CREATE Procedure AltaCelular
 @IDMODELOCEL varchar(15),
 @IDMARCACEL varchar(15),  
 @PRECIOUNITARIOCEL float,
 @STOCKCEL int,
 @DESCRIPCIONCEL varchar(100)
AS
 INSERT INTO CELULARES (ID_MODELO,
		 ID_MARCA_CEL, 
		 PRECIO_UNITARIO_CEL,
		 STOCK_CEL,
		 DESCRIPCION_CEL)
SELECT @IDMODELOCEL,
		 @IDMARCACEL,
		 @PRECIOUNITARIOCEL,
		 @STOCKCEL,
		 @DESCRIPCIONCEL
GO

CREATE Procedure ModificarCelular
 @IDMODELOCEL varchar(15),
 @IDMARCACEL varchar(15),  
 @PRECIOUNITARIOCEL float,
 @STOCKCEL int,
 @DESCRIPCIONCEL varchar(100)
AS
 UPDATE CELULARES
  SET ID_MARCA_CEL = @IDMARCACEL,
    PRECIO_UNITARIO_CEL = @PRECIOUNITARIOCEL,
    STOCK_CEL = @STOCKCEL,
    DESCRIPCION_CEL = @DESCRIPCIONCEL
    WHERE ID_MODELO = @IDMODELOCEL
GO

CREATE Procedure BajaLogicaCelular
@IDMODELOCEL varchar(15)
AS
UPDATE CELULARES
	Set ESTADO_CEL = 0
	WHERE ID_MODELO = @IDMODELOCEL
GO
----------------------------------
        --- ROL ---
----------------------------------

CREATE Procedure AltaRol
@IDROL varchar (1),
@ROL varchar (20)
AS
 INSERT INTO ROL(ID_ROL,
		 ROL)
	 SELECT @IDROL,
		  @ROL
GO

CREATE Procedure ModificarRol
@IDROL varchar (1),
@ROL varchar (20)
AS
 UPDATE ROL
	SET ROL = @ROL
		WHERE ID_ROL = @IDROL
GO
--------------------------
    --  USUARIOS  --
--------------------------    
CREATE Procedure AltaUsuario
 @DNIUSU varchar(15),
 @NOMBREUSU varchar(30),
 @APELLIDOUSU varchar(30),
 @TELEFONOUSU varchar(20),
 @PROVINCIAUSU int,
 @LOCALIDADUSU int,
 @DIRRECIONUSU varchar(30),
 @CONTRASEÑA varchar(15),
 @ROL varchar(1)
AS
 INSERT INTO USUARIOS  (DNI_USU,
						NOMBRE_USU,
						APELLIDO_USU,
						TELEFONO_USU,
						ID_PROVINCIA_USU,
						ID_LOCALIDAD_USU,
						DIRECCION_USU,
						CONTRASEÑA,
						ID_ROL_USU)
   SELECT	@DNIUSU,
			@NOMBREUSU,
			@APELLIDOUSU, 
			@TELEFONOUSU,
			@PROVINCIAUSU,
			@LOCALIDADUSU,
			@DIRRECIONUSU,
			@CONTRASEÑA,
			@ROL
GO

CREATE Procedure ModificarUsuario
 @DNIUSU varchar(15),
 @NOMBREUSU varchar(30),
 @APELLIDOUSU varchar(30),
 @TELEFONOUSU varchar(20),
 @PROVINCIAUSU int,
 @LOCALIDADUSU int,
 @DIRRECIONUSU varchar(30),
 @CONTRASEÑA varchar(15),
 @ROL varchar(1)
AS
  UPDATE USUARIOS
	SET	NOMBRE_USU = @NOMBREUSU, 
		APELLIDO_USU = @APELLIDOUSU, 
		DNI_USU = @DNIUSU, 
		TELEFONO_USU = @TELEFONOUSU, 
		ID_PROVINCIA_USU=@PROVINCIAUSU,
		ID_LOCALIDAD_USU=@LOCALIDADUSU,
		DIRECCION_USU = @DIRRECIONUSU, 
		CONTRASEÑA = @CONTRASEÑA, 
		ID_ROL_USU = @ROL
	  WHERE DNI_USU = @DNIUSU
GO

CREATE Procedure BajaLogicaUsuario
@DNIUSU varchar(15)
AS
 UPDATE USUARIOS
	Set ESTADO_USU = 0
		WHERE DNI_USU = @DNIUSU
GO

----------------------------------
        --- VENTAS ---
----------------------------------

CREATE Procedure AltaVenta
@IDUSUVTA varchar(15),
@IDCLIVTA varchar(15),
@IDFORMAENVIOVTA char(1),
@IDFORMAPAGOVTA char(1),
@IMPORTE float
AS
INSERT INTO VENTAS (ID_USU_VTA,
					ID_CLI_VTA,
					FECHA_VTA, 
					ID_FORMAENVIO_VTA, 
					ID_FORMAPAGO_VTA, 
					IMPORTETOTAL)
    SELECT  @IDUSUVTA,
			@IDCLIVTA, 
			GETDATE(), 
			@IDFORMAENVIOVTA, 
			@IDFORMAPAGOVTA, 
			@IMPORTE
GO
----------------------------------
    --- DETALLE DE VENTAS ---
----------------------------------

CREATE Procedure AltaDetalleVenta
@IDMODELODV varchar (15),
@CANTIDADDV int,
@PUDV float
AS
 INSERT INTO DETALLES_VENTA(ID_MODELO_DV,
							CANTIDAD_DV,
							PU_DV)
SELECT @IDMODELODV,
	   @CANTIDADDV,
  	   @PUDV
GO
----------------------------------
    --- FORMA DE PAGO ---
----------------------------------

CREATE Procedure AltaFormaDePago
 @IDFORMAPAGOFP char (1),
 @FORMAPAGOFP varchar (20)
AS
 INSERT INTO FORMA_PAGO(ID_FORMAPAGO_FP,
		FORMAPAGO_FP)
	SELECT @IDFORMAPAGOFP,
		@FORMAPAGOFP
GO

CREATE Procedure ModificarFormaDePago
 @IDFORMAPAGOFP char (1),
 @FORMAPAGOFP varchar (20)
AS
 UPDATE  FORMA_PAGO
    SET FORMAPAGO_FP = @FORMAPAGOFP
	WHERE ID_FORMAPAGO_FP = @IDFORMAPAGOFP

GO

CREATE Procedure BajaLogicaFormaDePago
@IDFORMAPAGOFP char (1)
AS
 UPDATE FORMA_PAGO
   Set ESTADO_FP = 0
     WHERE ID_FORMAPAGO_FP = @IDFORMAPAGOFP
GO

----------------------------------
    --- FORMA DE ENVIO ---
----------------------------------

CREATE Procedure AltaFormaDeEnvio
 @IDFORMAENVIOFE char (1),
 @FORMAENVIOFE varchar (20)
AS
 INSERT INTO FORMA_ENVIO (ID_FORMAENVIO_FE,
		 FORMAENVIO_FE)
	SELECT @IDFORMAENVIOFE,
		 @FORMAENVIOFE
GO

CREATE Procedure ModificarFormaDeEnvio
 @IDFORMAENVIO char (1),
 @FORMAENVIO varchar (20)
AS
  UPDATE FORMA_ENVIO
   SET FORMAENVIO_FE = @FORMAENVIO
	WHERE ID_FORMAENVIO_FE = @IDFORMAENVIO
GO

CREATE Procedure BajaLogicaFormaDeEnvio
@IDFORMAENVIOFE char (1)
AS
 UPDATE FORMA_ENVIO
  Set ESTADO_FE = 0
   WHERE ID_FORMAENVIO_FE = @IDFORMAENVIOFE
GO

--------------------------   DATOS   ------------------------
----> provincias
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (1, N'CABA')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (2, N'Buenos Aires')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (3, N'Catamarca')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (4, N'Cordoba')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (5, N'Corrientes')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (6, N'Chaco')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (7, N'Chubut')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (8, N'Entre Rios')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (9, N'Formosa')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (10, N'Jujuy')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (11, N'La Pampa')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (12, N'La Rioja')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (13, N'Mendoza')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (14, N'Misiones')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (15, N'Neuquen')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (16, N'Rio Negro')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (17, N'Salta')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (18, N'San Juan')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (19, N'San Luis')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (20, N'Santa Cruz')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (21, N'Santa Fe')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (22, N'Santiago del Estero')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (23, N'Tierra del Fuego')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (24, N'Tucuman')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (30, N'Otros')
INSERT [PROVINCIAS] ([cod_provincia], [descripcion_provincia]) VALUES (99, N'a determinar')
GO
----> localidades
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1000, N'RECOLETA', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1002, N'MONTSERRAT', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1004, N'PALERMO', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1005, N'RETIRO', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1006, N'SAN NICOLAS', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1007, N'VILLA REAL', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1020, N'BALVANERA', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1063, N'LA BOCA', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1064, N'SAN TELMO', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1066, N'BARRACAS', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1070, N'CONSTITUCION', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1080, N'SAN CRISTOBAL', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1158, N'VILLA GENERAL MITRE', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1172, N'ALMAGRO', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1184, N'CABALLITO', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1189, N'VILLA CRESPO', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1218, N'BOEDO', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1223, N'VILLA SANTA RITA', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1263, N'NUEVA POMPEYA', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1405, N'VELEZ SARSFIELD', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1406, N'FLORESTA', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1407, N'MONTE CASTRO', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1408, N'VERSALLES', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1409, N'FLORES', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1414, N'CHACARICA', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1416, N'PATERNAL', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1417, N'AGRONOMIA', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1418, N'VILLA DEVOTO', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1419, N'VILLA DEL PARQUE', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1424, N'BELGRANO', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1425, N'PUERTO MADERO', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1426, N'COLEGIALES', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1427, N'PARQUE CHAS', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1428, N'COGHLAN', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1429, N'NUÑEZ', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1430, N'SAAVEDRA', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1431, N'VILLA ORTUZAR', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1432, N'VILLA PUEYRREDON', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1433, N'VILLA URQUIZA', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1435, N'VILLA SOLDATI', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1436, N'VILLA RIACHUELO', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1437, N'PARQUE PATRICIOS', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1438, N'PARQUE CHACABUCO', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1439, N'VILLA LUGANO', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1440, N'VILLA LURO', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1443, N'PARQUE AVELLANEDA', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1444, N'LINIERS', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1454, N'MATADEROS', 1)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1601, N'BUENOS AIRES                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1602, N'FLORIDA (GBA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1603, N'VILLA MARTELLI (BA)           ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1605, N'MUNRO                         ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1607, N'VILLA ADELINA (BA)            ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1609, N'BOULOGNE (GBA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1611, N'DON TORCUATO (BA)             ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1612, N'GRAL. SARMIENTO (BA)          ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1613, N'LOS POLVORINES (BA)           ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1615, N'GRAN BOURG (GBA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1617, N'GENERAL PACHECO (GBA)         ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1618, N'EL TALAR                      ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1619, N'GARIN (GBA)                   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1620, N'A determinar                  ', 99)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1625, N'ESCOBAR (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1629, N'PILAR (BA)                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1635, N'DERQUI (BA)                   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1636, N'OLIVOS (GBA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1638, N'VICENTE LOPEZ (GBA)           ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1640, N'MARTINEZ (GBA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1642, N'SAN ISIDRO (GBA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1643, N'BECCAR (GBA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1644, N'VICTORIA (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1646, N'SAN FERNANDO (GBA)            ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1648, N'TIGRE                         ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1650, N'SAN MARTIN (GBA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1651, N'SAN ANDRES (BA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1653, N'VILLA BALLESTER               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1655, N'JOSE LEON SUAREZ (GBA)        ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1657, N'LOMA HERMOSA (BA)             ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1659, N'CAMPO DE MAYO (BA)            ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1661, N'BELLA VISTA (GBA)             ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1663, N'SAN MIGUEL (GBA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1664, N'MORENO (BA)                   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1665, N'JOSE C. PAZ (GBA)             ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1667, N'TORTUGUITAS                   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1669, N'DEL VISO (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1672, N'VILLA LYNCH (BA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1674, N'SAENZ PE¥A (BA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1676, N'SANTOS LUGARES (BA)           ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1678, N'CASEROS                       ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1682, N'VILLA BOSCH (GBA)             ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1684, N'EL PALOMAR (GBA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1686, N'HURLINGHAM (GBA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1688, N'VILLA TESEI (BA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1702, N'CIUDADELA (GBA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1704, N'RAMOS MEJIA (GBA)             ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1706, N'HAEDO (GBA)                   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1708, N'MORON (GBA)                   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1712, N'CASTELAR (GBA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1714, N'ITUZAINGO (GBA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1716, N'LIBERTAD (GBA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1718, N'SAN ANTONIO DE PADUA (BA)     ', 2)
GO
print 'Processed 100 total records'
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1722, N'MERLO (GBA)                   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1723, N'MARIANO ACOSTA                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1727, N'MARCOS PAZ (GBA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1741, N'GENERAL LAS HERAS (GBA)       ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1742, N'PASO DEL REY (GBA)            ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1744, N'MORENO (GBA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1746, N'FRANCISCO ALVAREZ (BA)        ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1748, N'GENERAL RODRIGUEZ             ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1752, N'LOMAS DEL MIRADOR (GBA)       ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1754, N'SAN JUSTO (GBA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1755, N'RAFAEL CASTILLO (GBA)         ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1757, N'GREGORIO DE LAFERRERE (GBA)   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1759, N'GONZALEZ CATAN (GBA)          ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1761, N'PONTEVEDRA (BA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1763, N'PARQUE SAN MARTIN (GBA)       ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1765, N'ISIDRO CASANOVA (GBA)         ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1766, N'TABLADA                       ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1768, N'VILLA MADERO (GBA)            ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1770, N'ALDO BONZI                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1772, N'VILLA CELINA (BA)             ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1773, N'INGENIERO BUDGE               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1774, N'LA SALADA                     ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1778, N'GENERAL GUEMES (GBA)          ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1802, N'EZEIZA (GBA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1806, N'TRISTAN SUAREZ                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1814, N'CAÑUELAS (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1816, N'REMEDIOS DE ESCALADA (GBA)    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1822, N'VALENTIN AISINA (GBA)         ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1824, N'LANUS  (GBA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1825, N'MONTE CHINGOLO (BA)           ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1828, N'BANFIELD (GBA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1832, N'LOMAS DE ZAMORA (GBA)         ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1834, N'TEMPERLEY                     ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1836, N'LLAVALLOL (GBA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1838, N'LUIS GUILLON (GBA)            ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1842, N'MONTE GRANDE (GBA)            ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1846, N'ADROGUE                       ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1847, N'RAFAEL CALZADA (BA)           ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1848, N'BANFIELD                      ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1849, N'CLAYPOLE (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1852, N'BURZACO (GBA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1854, N'LONGCHAMPS (GBA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1856, N'GLEW (GBA)                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1862, N'GUERNICA (GBA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1864, N'ALEJANDRO KORN                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1865, N'SAN VICENTE (BA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1870, N'AVELLANEDA (GBA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1871, N'DOCK SUD (GBA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1872, N'SARANDI (GBA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1874, N'VILLA DOMINICO (BA)           ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1875, N'WILDE (GBA)                   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1876, N'BERNAL (GBA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1878, N'QUILMES (GBA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1879, N'QUILMES OESTE (BA)            ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1881, N'SAN FRANCISCO SOLANO (BA)     ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1882, N'EZPELETA (GBA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1884, N'BERAZATEGUI (GBA)             ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1885, N'GUILLERMO E. HUDSON (BA)      ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1886, N'RANELAGH                      ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1888, N'FLORENCIO VARELA (GBA)        ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1890, N'JUAN MARIA GUTIERREZ          ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1891, N'ING. ALLAN                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1893, N'CTRO.AGRICOLA EL PATO         ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1894, N'VILLA ELISA (BA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1896, N'CITY BELL (GBA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1897, N'MANUEL B. GONNET (GBA)        ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1900, N'LA PLATA (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1901, N'LISANDRO OLMOS (BA)           ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1903, N'MELCHOR ROMERO                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1913, N'MAGDALENA (GBA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1917, N'VERONICA (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1923, N'BERISSO (GBA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1925, N'ENSENADA (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1980, N'BRANDSEN (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (1987, N'RANCHOS (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2000, N'ROSARIO (SF)                  ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2072, N'TEGUCIGALPA                   ', 30)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2100, N'ENTRE RIOS                    ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2101, N'SANTA FE                      ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2103, N'J. B. MOLINA (SF)             ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2105, N'SARGENTO CABRAL (SF)          ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2107, N'ALVAREZ (SF)                  ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2109, N'ACEBAL                        ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2111, N'SANTA TERESA (SF)             ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2113, N'PEYRANO (SF)                  ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2115, N'MAXIMO PAZ (SF)               ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2117, N'ALCORTA                       ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2121, N'PEREZ (SF)                    ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2123, N'SAN LORENZO                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2124, N'GOBERNADOR GALVEZ (SF)        ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2126, N'GENERAL LAGOS                 ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2128, N'ARROYO SECO (SF)              ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2132, N'FUNES (SF)                    ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2134, N'ROLDAN (SF)                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2136, N'SAN JERONIMO SUR (SF)         ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2138, N'CARCARA¥A (SF)                ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2142, N'SALTO GRANDE (SF)             ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2144, N'TOTORAS                       ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2146, N'SAN GENARO (SF)               ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2147, N'SAN GENARO NORTE (SF)         ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2148, N'CASAS (SF)                    ', 21)
GO
print 'Processed 200 total records'
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2152, N'GRANADERO BAIGORRIA (SF)      ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2154, N'CAPITAN BERMUDEZ (SF)         ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2156, N'FRAY LUIS BELTRAN (SF)        ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2170, N'CASILDA (SF)                  ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2173, N'SANDFORD (SF)                 ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2175, N'VILLA MUGUETA (SF)            ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2177, N'BIGAND (SF)                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2179, N'BOMBAÖ (SF)                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2181, N'LOS MOLINOS (SF)              ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2183, N'AREQUITO (SF)                 ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2185, N'SAN JOSE DE LA ESQUINA (SF)   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2187, N'ARTEAGA (SF)                  ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2189, N'CRUZ ALTA (CBA)               ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2200, N'SAN LORENZO (SF)              ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2202, N'PUERTO GENERAL SAN MARTIN (SF)', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2204, N'TIMBúES                       ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2206, N'OLIVEROS (SF)                 ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2208, N'MACIEL (SF)                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2214, N'ALDAO                         ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2216, N'SERODINO                      ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2218, N'CARRIZALES (SF)               ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2240, N'CORONDA (SF)                  ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2246, N'BARRANCAS (SF)                ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2248, N'BERNARDO DE YRIGOYEN (SF)     ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2252, N'GALVEZ (SF)                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2258, N'SANTA CLARA BUENA VISTA (SF)  ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2300, N'RAFAELA (SF)                  ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2301, N'RAMONA (SF)                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2307, N'ATALIVA (SF)                  ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2309, N'HUMBERTO 1 RO. (SF)           ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2313, N'MOISES VILLE (SF)             ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2317, N'EUSEBIA (SF)                  ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2322, N'SUNCHALES                     ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2340, N'CERES (SF)                    ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2341, N'CORDOBA                       ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2344, N'ARRUFO (SF)                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2345, N'VILLA TRINIDAD (SF)           ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2347, N'SAN GUILLERMO (SF)            ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2349, N'SUARDI                        ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2352, N'HERSILLA (SF)                 ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2354, N'SELVA                         ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2356, N'PINTO (SE)                    ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2357, N'SANTIAGO DEL ESTERO           ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2400, N'SAN FRANCISCO (CBA)           ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2405, N'SANTA CLARA DE SAGUIER (SF)   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2407, N'ESTACION CLUCELLAS (SF)       ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2409, N'ZENON PEREYRA (SF)            ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2413, N'FREYRE (CBA)                  ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2415, N'PORTEñA (CBA)                 ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2417, N'ALTOS DE CHIPIóN (CBA)        ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2419, N'BRIKMANN (CBA)                ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2421, N'MORTEROS (CBA)                ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2424, N'COLONIA MARINA (CBA)          ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2426, N'COLONIA SAN BARTOLOMé (CBA)   ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2432, N'EL TIO (CBA)                  ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2433, N'VILLA CONCEPCION DEL TIO (CBA)', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2434, N'ARROYITO (CBA)                ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2435, N'LA TORDILLA NORTE (CBA)       ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2438, N'FRONTERA (SF)                 ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2440, N'MARCO SASTRE (SF)             ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2445, N'MARIA JUANA (SF)              ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2447, N'SAN VICENTE (SF)              ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2449, N'S. M. ESCOBAS (SF)            ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2451, N'SAN JORGE (SF)                ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2453, N'CARLOS PELLEGRINI (SF)        ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2454, N'CAÑADA ROSQUIN (SF)           ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2500, N'CAÑADA DE GOMEZ (SF)          ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2501, N'BUSTINZA (SF)                 ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2503, N'VILLA ELOLSA (SF-)            ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2505, N'LAS PAREJAS (SF)              ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2506, N'CORREA (SF)                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2508, N'ARMSTRONG (SF)                ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2512, N'TORTUGAS                      ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2520, N'LAS ROSAS (SF)                ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2521, N'MONTES DE OCA (SF)            ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2523, N'BOUQUET (SF)                  ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2525, N'SAIRA (CBA)                   ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2527, N'MARIA SUSANA (SF)             ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2529, N'PIAMONTE (SF)                 ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2531, N'LANDETA (SF)                  ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2533, N'LOS CARDOS (SF)               ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2535, N'EL TREBOL (SF)                ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2550, N'BELL VILLE (CBA)              ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2553, N'JUSTINIANO POSSE (CBA)        ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2555, N'ORDO¥EZ (CBA)                 ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2557, N'LDIAZABAL (CBA)               ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2559, N'SAN ANTONIO DE LITíN (CBA)    ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2563, N'NOETINGER (CBA)               ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2566, N'SAN MARCOS SUD (CBA)          ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2572, N'BALLESTEROS (CBA)             ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2580, N'MARCOS JUAREZ (CBA)           ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2581, N'LOS SURGENTES (CBA)           ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2583, N'GENERAL BALDISERA (CBA)       ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2585, N'CAMILO ALDAO (CBA)            ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2587, N'INRIVILLE (CBA)               ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2589, N'MONTE BUEY (CBA)              ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2592, N'GENERAL ROCA (CBA)            ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2594, N'LEONES (CBA)                  ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2600, N'VENADO TUERTO (SF)            ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2601, N'MURPHY (SF)                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2602, N'MARIA TERESA (SF)             ', 21)
GO
print 'Processed 300 total records'
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2605, N'SANTA ISABEL (SF)             ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2607, N'VILLA CA¥AS (SF)              ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2613, N'SAN GREGORIO (SF)             ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2615, N'SAN EDUARDO (SF)              ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2617, N'SANCTI SPIRITU (SF)           ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2618, N'CARMEN (SF)                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2622, N'MAGGIOLO (SF)                 ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2624, N'ARIAS (CBA)                   ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2627, N'GUATIMOZLN (CBA)              ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2630, N'FIRMAT (SF)                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2635, N'CAñADA DEÖ UCIE (SF)          ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2637, N'LOS QUIRQUINCHOS              ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2639, N'BERABEVU (SF)                 ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2643, N'CHAñAR LADEADO                ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2645, N'CORRAL DE BUSTOS (CBA)        ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2650, N'CANAIS (CBA)                  ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2651, N'PUEBLO ITALIANO (CBA)         ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2655, N'WENCESLAO ESCALANTE (CBA)     ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2657, N'LABORDE (CBA)                 ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2659, N'MONTE MAIZ (CBA)              ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2661, N'ISLA VERDE (CBA)              ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2662, N'ALEJO LEDESMA                 ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2670, N'LA CARLOTA (CBA)              ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2671, N'VIAMONTE (CBA)                ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2675, N'CHAZóN                        ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2677, N'UCACHA                        ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2679, N'PASCANAS (CBA)                ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2681, N'ETRURIA (CBA)                 ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2686, N'ALEJANDRO                     ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2700, N'PERGAMINO                     ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2701, N'RANCAGUA (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2703, N'ESTACION CARABELAS (BA)       ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2705, N'ROJAS (BA)                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2713, N'MANUEL OCAMPO (BA)            ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2717, N'ACEVEDO                       ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2718, N'M. H. ALFONSO URQUIZA (BA)    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2720, N'COLON (BA)                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2722, N'WHEELWRIGHT                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2723, N'JUNCAL (SF)                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2725, N'HUGHES (SF)                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2728, N'MELINCUE (SF)                 ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2729, N'CARRERAS (SF)                 ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2732, N'EL ORTONDO (SF)               ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2740, N'ARRECIFES (BA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2741, N'SALTO (BA)                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2743, N'CHACABUCO (BA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2752, N'CAPITAN SARMIENTO             ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2760, N'SAN ANTONIO DE ARECO (BA)     ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2800, N'ZARATE (BA)                   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2804, N'CAMPANA (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2806, N'LIMA (BA)                     ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2812, N'CAPILLA DEL SEÑOR (GBA)       ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2820, N'GUALEGUAYCHU (ER)             ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2823, N'VILLA PARANACITO (ER)         ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2826, N'SAN ANTONIO (ER)              ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2840, N'GUALEGUAY (ER)                ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2843, N'GALARZA (ER)                  ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2845, N'GOBERNADOR MANSILLA (ER)      ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2846, N'J. DE LBICUY (ER)             ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2854, N'LARROQUE (ER)                 ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2900, N'SAN NICOLAS (BA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2901, N'LA EMILIA (BA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2907, N'CONESA (BA)                   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2914, N'VILLA RAMALLO (BA)            ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2915, N'RAMALLO (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2918, N'PAVON (SF)                    ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2919, N'VILLA CONSTITUCION (SF)       ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2921, N'GODOY (SF)                    ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2930, N'SAN PEDRO (BA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2933, N'PEREZ MILLáN (BA)             ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2935, N'SANTA LUCIA (BA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2942, N'BARADERO (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (2946, N'GOBERNADOR CASTRO (BA)        ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3000, N'SANTA FE (SF)                 ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3003, N'HELVECIA (SF)                 ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3005, N'SAN JAVIER (SF)               ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3009, N'FRANK (SF)                    ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3011, N'PEREIRA (SF)                  ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3013, N'SAN CARLOS CENTRO (SF)        ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3016, N'SANTO TOME (SF)               ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3018, N'RECREO (SF)                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3020, N'LAGUNA PAIVA (SF)             ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3023, N'PROGRESO (SF)                 ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3029, N'ELISA (SF)                    ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3036, N'LLAMBI CAMPBELL (SF)          ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3040, N'SAN JUSTO (SF)                ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3044, N'GOBERNADOR CRESPO (SF)        ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3048, N'VIDELA (SF)                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3050, N'CALCHAQUI (SF)                ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3052, N'LA CRIOLLA (SF)               ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3056, N'MARGARITA (SF)                ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3060, N'TOSTADO                       ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3061, N'VILLAMINETTI (SF)             ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3064, N'BANDERA (SE)                  ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3070, N'SAN CRISTOBAL (SF)            ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3080, N'ESPERANZA (SF)                ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3081, N'HUMBOLDT (SF)                 ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3085, N'PILAR (SF)                    ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3087, N'FELICIA (SF)                  ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3100, N'PARANA (E.RIOS)               ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3101, N'ALDEA VALLE MARIA             ', 8)
GO
print 'Processed 400 total records'
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3103, N'VILLA LIBERTADOR SAN MARTIN (E', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3105, N'DIAMANTE (ER)                 ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3109, N'VIALE (ER)                    ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3111, N'VILLA TABOSSI (ER)            ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3116, N'CRESPO (ER)                   ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3117, N'SEGUI (ER)                    ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3122, N'CERRITO (ER)                  ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3127, N'VILLA HERNANDARIAS (ER)       ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3133, N'MARíA GRANDE (ER)             ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3134, N'HASENKAMP (ER)                ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3138, N'ALCARAZ                       ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3142, N'BOVRII (ER)                   ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3144, N'SAUCE DE LUNA (ER)            ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3150, N'NOGOYA (ER)                   ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3153, N'VICTORIA (ER)                 ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3156, N'VILLA HERNANDEZ (ER)          ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3158, N'LUCAS GONZALEZ (ER)           ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3162, N'ARANGUREN (ER)                ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3164, N'RAMIREZ (ER)                  ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3170, N'BASALVIBASO (ER)              ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3174, N'ROSARIO DEL TALA (ER)         ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3177, N'MACIA (ER)                    ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3180, N'FEDERAL (ER)                  ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3185, N'CURUZU CUATIA                 ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3187, N'SAN JOSE DE FELICIANO (ER)    ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3190, N'LA PAZ (ER)                   ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3192, N'SANTA ELENA (ER)              ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3194, N'CORRIENTES                    ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3196, N'ESQUINA (CTES)                ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3200, N'CONCORDIA (ER)                ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3206, N'FEDERACION (ER)               ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3212, N'LOS CHARIúAS (ER)             ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3216, N'GENERAL CAMPOS (ER)           ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3218, N'SAN SALVADOR (ER)             ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3220, N'MONTE CASEROS (CTES)          ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3226, N'COLONIA MOCORETA (CTES)       ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3228, N'CHAJARI                       ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3229, N'VILLA DEL ROSARIO (ER)        ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3230, N'PASO DE LOS LIBRES (CTES)     ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3240, N'VILLAGUAY (ER)                ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3246, N'VILLA DORNíNGUEZ (ER)         ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3252, N'VILLA CLARA (ER)              ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3260, N'CONCEPCION DEL URUGUAY (ER)   ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3262, N'CASEROS (ER)                  ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3265, N'VILLA ELISA (ER)              ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3272, N'HERRERA (ER)                  ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3280, N'COLON                         ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3283, N'SAN JOSE (ER)                 ', 8)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3300, N'POSADAS (MNES)                ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3302, N'ITUZAINGO (CTES)              ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3304, N'MISIONES                      ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3313, N'CERRO AZUL (MNES)             ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3315, N'LEANDRO N. ALEM (MNES)        ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3322, N'SAN IGNACIO (MNES)            ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3324, N'GOBERNADOR ROCA (MNES)        ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3328, N'JARDIN AMERICA (MNES)         ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3332, N'CAPIOVI (MNES)                ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3334, N'PUERTO RICO (MNES)            ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3340, N'SANTO TOME (CTES)             ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3342, N'VIRASORO (CTES)               ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3344, N'ALVEAR (CTES)                 ', 3)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3346, N'LA CRUZ (CTES)                ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3350, N'APOSTOLES (MNES)              ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3355, N'DE LA SIERRA (MNES)           ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3357, N'SAN JAVIER (MNES)             ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3358, N'COLONIA LIEBIG (CTES)         ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3360, N'OBERA (MNES)                  ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3362, N'CAMPO GRANDE (MNES)           ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3363, N'VEINTICINCO DE MAYO (MNES)    ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3364, N'SAN VICENTE (MNES)            ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3366, N'BERNARDO DE IRIGOYEN (MNES)   ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3370, N'PUERTO IGUAZU (MNES)          ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3374, N'PUERTO LIBERTAD               ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3376, N'COLONIA WANDA (MNES)          ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3378, N'PUERTO ESPERANZA (MNES)       ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3380, N'EL DORADO (MNES)              ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3384, N'MONTECARLO (MNES)             ', 14)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3400, N'CORRIENTES (CTES)             ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3403, N'SAN LUIS DEL PALMAR (CTES)    ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3407, N'GENERAL PAZ (CTES)            ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3414, N'LTATL (CTES)                  ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3418, N'EMPEDRADO (CTES)              ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3420, N'SALADAS (CTES)                ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3421, N'SANTA ROSA (CTES)             ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3423, N'CONCEPCION (CTES)             ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3427, N'MBURUCUYá (CTES)              ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3432, N'BELLA VISTA (CTES)            ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3440, N'SANTA LUCIA (CTES)            ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3445, N'GOBERNADOR MARTINEZ (CTES)    ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3448, N'SAN ROQUE (CTES)              ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3450, N'GOYA (CTES)                   ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3460, N'CURUZU CUATIA (CTES)          ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3461, N'PERU GORRIA (CTES)            ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3463, N'SAUCE (CTES)                  ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3470, N'MERCEDES (CTES)               ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3474, N'CHAVARRíA                     ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3476, N'MARIANO 1. LOZA (CTES)        ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3480, N'LTá ÖBATE (CTES)              ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3481, N'BERON DE ASTRADA (CTES)       ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3485, N'SAN MIGUEL (CTES)             ', 5)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3500, N'RESISTENCIA (CHA)             ', 6)
GO
print 'Processed 500 total records'
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3501, N'CHACO                         ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3503, N'BARRANQUERAS (CHA)            ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3509, N'GENERAL J. DE SAN MARTIN (CHA)', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3514, N'LA VERDE                      ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3515, N'COLONIA ELISA (CHA)           ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3518, N'LA LEONESA (CHA)              ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3525, N'FORMOSA                       ', 9)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3530, N'QUITILIPI (CHA)               ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3531, N'P. DEL INDIO (CHA)            ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3534, N'MACHAGAI (CHA)                ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3536, N'PRESIDENCIA DE LA PLAZA (CHA) ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3540, N'VILLA ANGELA (CHA)            ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3541, N'SANTA SILVINA (CHA)           ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3545, N'VILLA BERTHET (CHA)           ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3550, N'VERA (SF)                     ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3555, N'ROMANG (SF)                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3560, N'RECONQUISTA (SF)              ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3561, N'AVELLANEDA (SF)               ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3572, N'MALABRIGO (SF)                ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3574, N'G.NORTE (STA.FE)              ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3580, N'VILLA OCAMPO (SF)             ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3586, N'LAS TOSCAS (SF)               ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3600, N'FORMOSA (FSA)                 ', 9)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3603, N'EL COLORADO (FSA)             ', 9)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3606, N'PIRANE (FSA)                  ', 9)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3610, N'CLORINDA (FSA)                ', 9)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3613, N'LAGUNA BLANCA (FSA)           ', 9)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3620, N'COMANDANTE FONTANA (FSA)      ', 9)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3624, N'ÖBARRETA (FSA)                ', 9)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3630, N'LAS LOMITAS (FSA)             ', 9)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3700, N'PRESIDENCIA R. S. PE¥A (CHA)  ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3701, N'SAN BERNARDO (CHA)            ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3703, N'TRES ISLETAS                  ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3705, N'COLONIA J. J. CASTELLI (CHA)  ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3708, N'P. DE INFIERNO (CHA)          ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3712, N'P. DE GUANACOS (SE)           ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3714, N'MONTE QUEMADO (SE)            ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3716, N'CAMPO LARGO (CHA)             ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3718, N'CORZUELA (CBA)                ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3722, N'LAS BRE¥AS (CHA)              ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3730, N'CHARATA                       ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3732, N'PINEDO CENTRAL (CHA)          ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3733, N'HERMOSO CAMPO (CHA)           ', 6)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3740, N'QUIMILI (SE)                  ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3743, N'TINTINA                       ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3760, N'AÑATUYA                       ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (3763, N'LOS JURLES (SE)               ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4000, N'SAN MIGUEL DE TUCUMAN (TUC)   ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4101, N'TUCUMAN                       ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4103, N'TAFI VIEJO                    ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4107, N'YERBA BUENA (TUC)             ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4109, N'BANDA DEL RIO SALI (TUC)      ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4111, N'CRUZ ALTA (TUC)               ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4119, N'LA RAMADA (TUC)               ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4123, N'SALTA                         ', 17)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4124, N'TRANCAS                       ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4128, N'LULES (TUC)                   ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4132, N'FAMAILLA (TUC)                ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4137, N'TAFI DEL VALLE                ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4139, N'SANTA MARIA (CAT)             ', 3)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4141, N'CATAMARCA                     ', 3)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4142, N'MONTEROS (TUC)                ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4145, N'RIO SECO                      ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4146, N'CONCEPCION (TUC)              ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4152, N'AQUILARES (TUC)               ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4158, N'JUAN B. ALBERDI (TUC)         ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4162, N'LA COCHA (TUC)                ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4168, N'BELLA VISTA (TUC)             ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4172, N'SIMOCA                        ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4182, N'LOS RALOS (TUC)               ', 24)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4190, N'ROSARIO DE LA FRONTERA (S)    ', 17)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4197, N'NUEVA ESPERANZA (SE)          ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4200, N'SANTIAGO DEL ESTERO (SE)      ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4208, N'LORETO (SE)                   ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4220, N'TERMAS DE RIO HONDO           ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4227, N'SANTO DOMINGO                 ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4230, N'FRIAS (SE)                    ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4238, N'SAN PEDRO DE GUASAYáN (SE)    ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4300, N'LA BANDA (SE)                 ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4301, N'COPO                          ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4322, N'FERNANDEZ (SEY)               ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4332, N'COLONIA DORA (SE)             ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4338, N'CLODOMIRA (SE)                ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4350, N'SUNCHO CORRAL                 ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4400, N'SALTA (S)                     ', 17)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4405, N'ROSARIO DE LERMA (S)          ', 17)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4411, N'JUJUY                         ', 10)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4427, N'CAFAYATE (S)                  ', 17)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4430, N'GENERAL M. DE GUEMES (S)      ', 17)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4440, N'METáN (S)                     ', 17)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4448, N'JOAQUIN V. GONZALEZ (S)       ', 17)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4449, N'LAS LAJITAS (S)               ', 17)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4500, N'SAN PEDRO DE JUJUY (J)        ', 10)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4512, N'LIBERTADOR SAN MARTIN (J)     ', 10)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4530, N'ORAN (S)                      ', 17)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4531, N'SANTA ROSA (S)                ', 17)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4550, N'EMBARCACION (S)               ', 17)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4560, N'TARTAGAL                      ', 17)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4568, N'POCITOS (S)                   ', 17)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4600, N'SAN SALVADOR DE JUJUY (J)     ', 10)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4603, N'EL CARMEN (J)                 ', 10)
GO
print 'Processed 600 total records'
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4608, N'PERICO (J)                    ', 10)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4612, N'PALPALA (JUJUY)               ', 10)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4630, N'HUMAHUACA (J)                 ', 10)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4640, N'ABRA PAMPA                    ', 10)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4650, N'LA QUIACA (J)                 ', 10)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4700, N'SAN FERNANDO DEL VALLE DE CAT.', 3)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4703, N'SAN LUIS                      ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4707, N'VILLA DOLORES (CAT)           ', 3)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4723, N'LOS ALTOS (CAT)               ', 3)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4728, N'CHUMBICHA (CAT)               ', 3)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4740, N'ANDALGALA (CAT)               ', 3)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (4750, N'BELEN (CAT)                   ', 3)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5000, N'CORDOBA (CBA)                 ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5001, N'GENERAL BUSTOS (CBA)          ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5003, N'SANTA ANA (CBA)               ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5006, N'BARRIO SAN VICENTE (CBA)      ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5008, N'BOULEVARD LOS GRANEROS (CBA)  ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5009, N'BARRIO ALTO ALBERDI (CBA)     ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5010, N'FUERZA AEREA ARGENTINA (CBA)  ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5012, N'ALEM                          ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5014, N'BAJADA PUCARA (CBA)           ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5016, N'CIUDADELA (CBA)               ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5101, N'COLONIA TIROLESA (CBA)        ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5105, N'VILLA ALLENDE (CBA)           ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5109, N'UNQUILLO (CBA)                ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5111, N'RIO CEBALLOS (CBA)            ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5113, N'SALSIPUEDES (CBA)             ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5121, N'DESPE¥ADEROS (CBA)            ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5123, N'FERRREIRA (CBA)               ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5125, N'MONTE CRISTO (CBA)            ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5127, N'RIO PRIMERO (CBA)             ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5133, N'SANTA ROSA DE RIO 1RO.(CBA)   ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5137, N'LA PUERTA (CBA)               ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5141, N'BALNEARIA (CBA)               ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5143, N'MIRAMAR (CBA)                 ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5145, N'GENERAL PAZ (CBA)             ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5147, N'AEROPUERTO CORDOBA            ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5151, N'LA CALERA (CBA)               ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5152, N'VILLA CARLOS PAZ (CBA)        ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5164, N'SANTA MARIA DE PUNILLA (CBA)  ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5166, N'COSQUIN (CBA)                 ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5172, N'LA FALDA (CBA)                ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5176, N'VILLA GIARDINO (CBA)          ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5178, N'LA CUMBRE (CBA)               ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5184, N'CAPILLA DEL MONTE (CBA)       ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5186, N'ALTA GRACIA (CBA)             ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5191, N'SAN AGUSTIN (CBA)             ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5194, N'VILLA GENERAL BELGRANO (CBA)  ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5196, N'SANTA ROSA DE CALAMUCHITA (CBA', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5200, N'DEAN FUNES (CBA)              ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5203, N'TULUMBA                       ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5209, N'SAN FRANCISCO DEL CHA¥AR (CBA)', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5220, N'JESUS MARIA (CBA)             ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5223, N'COLONIA CAROYA (CBA)          ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5225, N'OBISPO TREJO (CBA)            ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5231, N'SEBASTIAN EL CANO (CBA)       ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5236, N'VILLA DEL TOTORAL (CBA)       ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5238, N'LAS PE¥AS (CBA)               ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5244, N'SAN JOSE DE LA DORMIDA (CBA)  ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5248, N'VILLA DE MARIA RIO SECO (CBA) ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5250, N'OJO DE AGUA (SE)              ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5253, N'SUMAMPA                       ', 22)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5260, N'RECREO (CAT)                  ', 3)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5265, N'LA PAZ (CA)                   ', 3)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5274, N'EL MILAGRO (LR)               ', 12)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5276, N'LA RIOJA                      ', 12)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5280, N'CRUZ DEL EJE (CBA)            ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5284, N'VILLA DE SOTO (CBA)           ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5291, N'SAN CARLOS MINAS (CBA)        ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5295, N'SALSACATE (CBA)               ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5300, N'LA RIOJA (LR)                 ', 12)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5301, N'ANILLACO (LR)                 ', 12)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5310, N'AIMOGASTA                     ', 12)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5321, N'SAUJIL (CAT)                  ', 3)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5327, N'SALICAS (LR)                  ', 12)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5340, N'TINOGASTA                     ', 3)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5345, N'FIAMBALA (CAT)                ', 3)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5350, N'VILLA UNION (LR)              ', 12)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5357, N'VINCHINA (LR)                 ', 12)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5360, N'CHILECITO                     ', 12)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5365, N'FARNATINA (LR)                ', 12)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5380, N'CHAMICAL                      ', 12)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5383, N'OLTA (LR)                     ', 12)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5400, N'SAN JUAN (SJ)                 ', 18)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5401, N'SAN JUAN                      ', 18)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5405, N'BARREAL (SJ)                  ', 18)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5413, N'CHIMBAS                       ', 18)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5419, N'ALBARDON                      ', 18)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5425, N'RAWSON (SJ)                   ', 18)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5428, N'POCITOS (SJ)                  ', 18)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5435, N'VILLA SARMIENTO (SI)          ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5442, N'CAUCETE (SJ)                  ', 18)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5460, N'JACHAL (SJ)                   ', 18)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5470, N'CHEPES                        ', 12)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5500, N'MENDOZA (MZA)                 ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5501, N'GODOY CRUZ (MZA)              ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5503, N'MENDOZA                       ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5505, N'LUJAN (MZA)                   ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5507, N'LUJAN DE CUYO (MZA)           ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5509, N'BARRAQUERO (MZA)              ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5511, N'GENERAL GUTIERREZ (MZA)       ', 13)
GO
print 'Processed 700 total records'
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5515, N'MAIPU (MZA)                   ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5519, N'SAN JOSE DE GUAYMALLEN (MZA)  ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5521, N'VILLANUEVA (MZA)              ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5523, N'LAVALLE (MZA)                 ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5525, N'RODEO DE LA CRUZ (MZA)        ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5527, N'LOS CORRALITOS (MZA)          ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5529, N'RODEO DEL MEDIO (MZA)         ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5531, N'FRAY LUIS BELTRAN (MZA)       ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5533, N'BERMEJO (MZA)                 ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5535, N'COSTA DE ARAUJO (MZA)         ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5539, N'LAS HERAS (MZA)               ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5541, N'EL PLUMERILLO (MZA)           ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5545, N'USPALLATA (MZA)               ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5547, N'VILLA HIPODROMO (MZA)         ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5560, N'TUNUYAN                       ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5561, N'TUPUNGATO                     ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5565, N'VISTAFLORES (MZA)             ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5567, N'LA CONSULTA (MZA)             ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5569, N'EUGENIO BUSTOS (MZA)          ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5570, N'GENERAL SAN MARTIN (MZA)      ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5573, N'JUNIN (MZA)                   ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5577, N'RIVADAVIA (MZA)               ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5579, N'LA PAZ (MZA)                  ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5582, N'INGENIERO GIAGNONI (MZA)      ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5584, N'PALMIRA (MZA)                 ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5585, N'MEDRANO (MZA)                 ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5592, N'LA DORMIDA (MZA)              ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5594, N'LAS CATITAS (MZA)             ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5596, N'SANTA ROSA (MZA)              ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5600, N'SAN RAFAEL (MZA)              ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5603, N'GOUDGE                        ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5609, N'GUAYMALLEN                    ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5613, N'MALARGUE (MZA)                ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5620, N'GENERAL ALVEAR (MZA)          ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5621, N'LA PAMPA                      ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5622, N'VILLA ATUEL (MZA)             ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5624, N'REAL DEL PADRE (MZA)          ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5634, N'BOWEN (MZA)                   ', 13)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5700, N'SAN LUIS (SL)                 ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5701, N'PRINGLES                      ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5705, N'SAN FRANCISCO (SL)            ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5711, N'QUINES (SL)                   ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5713, N'CANDELARIA (SL)               ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5719, N'AYACUCHO (SL)                 ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5730, N'VILLA MERCEDES (SL)           ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5738, N'JUSTO DARACT (SL)             ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5750, N'LA TOMA (SL)                  ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5759, N'NASCHEL (SL)                  ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5770, N'CONCARAN (SL)                 ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5773, N'SAN MARTIN (SL)               ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5777, N'SANTA ROSA (SL)               ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5800, N'RIO CUARTO (CBA)              ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5805, N'CARNERILLOS (CBA)             ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5807, N'BENGOLEA (CBA)                ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5809, N'GENERAL CABRERA (CBA)         ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5813, N'ALCIRA GIGENA                 ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5815, N'ELENA (CBA)                   ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5817, N'CALAMUCHITA (CBA)             ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5823, N'LOS CONDORES (CBA)            ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5825, N'SANTA C. DE HOIMBERG (CBA)    ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5827, N'LAS VERTIENTES (CBA)          ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5829, N'SAMPACHO (CBA)                ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5841, N'SAN BASILIO (CBA)             ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5843, N'ADELIA MARIA                  ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5845, N'BULNES (CBA)                  ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5847, N'CORONEL MOLDES (CBA)          ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5848, N'LAS ACEQUIAS (CBA)            ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5850, N'RIO TERCERO (CBA)             ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5853, N'CORRALITO (CBA)               ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5854, N'ALMAFUERTE (CBA)              ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5856, N'EMBALSE (CBA)                 ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5859, N'LA CRUZ (CBA)                 ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5870, N'VILLA DOLORES (CBA)           ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5879, N'LA PAZ (CBA)                  ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5881, N'MERLO (SL)                    ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5889, N'MINA CLAVERO (CBA)            ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5900, N'VILLA MARIA (CBA)             ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5903, N'VILLANUEVA (CBA)              ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5907, N'COLONIA SILVIO PELLICO (CBA)  ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5911, N'LA PLAYOSA (CBA)              ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5913, N'POZO DEL MOLLE (CBA)          ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5915, N'CARRILOBO (CBA)               ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5917, N'ARROYO CABRAL (CBA)           ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5921, N'LAS PERDICES (CBA)            ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5923, N'GENERAL DEHEZA (CBA)          ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5925, N'PASCO (CBA)                   ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5927, N'TICINO                        ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5929, N'HERNANDO (CBA)                ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5933, N'TANCACHA                      ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5936, N'TIO PUJIO                     ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5940, N'LAS VARILLAS (CBA)            ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5941, N'LAS VARAS (CBA)               ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5943, N'SATURNINO LASPIUR (CBA)       ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5945, N'SACANTA (CBA)                 ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5947, N'EL ARA¥ADO (CBA)              ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5949, N'ALICIA)                       ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5960, N'RIO SEGUNDO (CBA)             ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5963, N'VILLA DEL ROSARIO (CBA)       ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5965, N'COLAZO (CBA)                  ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5967, N'LUQUE (CBA)                   ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5969, N'CALCHIN (CBA)                 ', 4)
GO
print 'Processed 800 total records'
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5972, N'PILAR (CBA)                   ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5974, N'LAGUNA LARGA (CBA)            ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5980, N'OLIVA (CBA)                   ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5984, N'JAMES CRAIX (CBA)             ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (5986, N'ONCATIVO (CBA)                ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6000, N'JUNIN (BA)                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6003, N'ASCENSION (BA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6005, N'GENERAL ARENALES (BA)         ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6007, N'ARRIBE¥OS (BA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6009, N'TEODELINA                     ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6015, N'LOS TOLDOS (BA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6030, N'VEDIA (BA)                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6034, N'JUAN B. ALBERDI (BA)          ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6042, N'IRIARTE (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6050, N'GENERAL PINTO (BA)            ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6062, N'CORONEL GRANADA (BA)          ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6064, N'AMEGHINO (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6065, N'BLAQUIER (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6070, N'LINCOLN (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6075, N'ROBERTS (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6077, N'PASTEUR (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6100, N'RUFINO (SF)                   ', 21)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6101, N'LA CESIRA (CBA)               ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6105, N'CAÑADA SECA (BA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6120, N'LABOULAYE (CBA)               ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6121, N'HUANCHILLA (CBA)              ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6125, N'SERRANO                       ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6127, N'JOVITA (CBA)                  ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6132, N'GENERAL LAVALLE (CBA)         ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6140, N'VICU¥A MACKENNA (CBA)         ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6200, N'REALICO (LP)                  ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6205, N'INGENIERO LUIGGI (LP)         ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6207, N'ALTA ITALIA (LP)              ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6213, N'PARERA (LP)                   ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6214, N'RANCUL (LP)                   ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6216, N'NUEVA GALIA (SL)              ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6220, N'BERNARDO LARROUDE (LP)        ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6221, N'INTENDENTE ALVEAR (LP)        ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6223, N'CORONEL CHARIONE (BA)         ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6225, N'BUCHARDO (CBA)                ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6230, N'GENERALVILLEGAS (BA)          ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6231, N'TRES ALGARROBOS               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6237, N'AMERICA (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6241, N'EMILIO V. BUNGE (BA)          ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6244, N'BANDERALO (BA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6261, N'UNION (SL)                    ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6270, N'HUINCA RENANCO (CBA)          ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6271, N'DEL CAMPILLO (CBA)            ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6273, N'VILLA VALERIA (CBA)           ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6275, N'VILLA HUIDOBRO (CBA)          ', 4)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6277, N'BUENA ESPERANZA (SL)          ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6300, N'SANTA ROSA (LP)               ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6301, N'MIGUEL RIGLOS (LP)            ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6303, N'TOAY                          ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6305, N'DOBLAS (LP)                   ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6306, N'JUNIN                         ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6307, N'MACACHíN (LP)                 ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6309, N'GENERAL CAMPOS (LP)           ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6311, N'GUATRACHE (LP)                ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6313, N'WINIFREDA (LP)                ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6315, N'COLONIA BARON (LP)            ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6319, N'VICTORICA (LP)                ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6321, N'TELEN                         ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6323, N'SANTA ÖSABEL (LP)             ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6330, N'CATRILO (LP)                  ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6333, N'QUEMú QUEMú (LP)              ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6339, N'SALLIQUELO (BA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6343, N'VILLA MAZA (BA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6346, N'PELLEGRINI (BA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6352, N'LONQUIMAY(LP)                 ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6360, N'GENERAL PICO (LP)             ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6369, N'TRENEL                        ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6380, N'EDUARDO CASTEX (LP)           ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6387, N'CALEUFú (LP)                  ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6389, N'ARIZONA (SL)                  ', 19)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6400, N'TRENQUE LAUQUEN               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6409, N'TRES LOMAS                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6417, N'CASBAS (BA)                   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6430, N'CARHUE (BA)                   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6435, N'TORNQUIST                     ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6439, N'BONIFACIO (BA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6441, N'RIVERA (BA)                   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6450, N'PEHUAJO (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6455, N'CARLOS TEJEDOR (BA)           ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6465, N'HENDERSON (BA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6469, N'MONES CAZON (SA)              ', 17)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6471, N'SALAZAR (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6472, N'FRANCISCO MADERO (BA)         ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6474, N'JUAN JOSE PASO (BA)           ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6500, N'9 DE JULIO                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6501, N'TROPEZON                      ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6505, N'DUDIGNAE (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6530, N'CARLOS CASARES (BA)           ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6533, N'QUIROGA (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6550, N'BOLIVAR (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6551, N'PIROVANO (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6553, N'URDAMPILLETA (BA)             ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6555, N'DAIREAUX                      ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6600, N'MERCEDES (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6605, N'NAVARRO (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6612, N'SUIPACHA                      ', 2)
GO
print 'Processed 900 total records'
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6620, N'CHIVILCOY                     ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6621, N'GOBERNADOR UGARTE (SA)        ', 17)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6625, N'VILLA MOQUEHUA (BA)           ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6634, N'ALBERTI                       ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6640, N'BRAGADO                       ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6646, N'GENERAL O''BRIEN (BA)          ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6660, N'25 DE MAYO                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6663, N'NORBERTO DE LA RIESTRA (BA)   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6665, N'PEDERNALES (BA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6700, N'LUJAN                         ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6703, N'TORRES                        ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6706, N'VILLA FIANDRIA (BA)           ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6708, N'OPEN DOOR                     ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6720, N'SAN ANDRES DE GILES (BA)      ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6721, N'SAN ANDRES DE GILES           ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6725, N'CARMEN DE ARECO (BA)          ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6734, N'RAWSON (BA)                   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (6748, N'O''HIGGINS (BA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7000, N'TANDIL                        ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7003, N'MARIA IGNACIA (SA)            ', 17)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7005, N'BARKER (BA)                   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7011, N'JUAN N. FERNANDEZ (SA)        ', 17)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7020, N'BENITO JUAREZ (BA)            ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7100, N'DOLORES (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7101, N'GENERAL CONESA (BA)           ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7103, N'GENERAL LAVALLE (BA)          ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7105, N'SAN CLEMENTE DEL TUYU (BA)    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7106, N'LAS TONINAS (BA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7107, N'SANTA TERESITA (BA)           ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7109, N'MAR DE AJO (BA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7111, N'SAN BERNARDO (BA)             ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7114, N'CASTELLI (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7116, N'PILA (BA)                     ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7118, N'GENERAL GUIDO (BA)            ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7130, N'CHASCOMUS                     ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7150, N'AYACUCHO (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7160, N'MAIPU (BA)                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7163, N'GENERAL MADARIAGA (BA)        ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7165, N'VILLA GESELL (BA)             ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7167, N'PINAMAR (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7172, N'GENERAL PIRAN (BA)            ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7174, N'CORONEL VIDAL (BA)            ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7200, N'LAS FLORES                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7203, N'RAUCH (BA)                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7214, N'CACHARí                       ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7220, N'MONTE (BA)                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7223, N'GENERAL BELGRANO (BA)         ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7226, N'SAN MIGUEL DEL MONTE          ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7234, N'ELVIRA (LOBOS) BA             ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7240, N'LOBOS (BA)                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7245, N'ROQUE PEREZ (BA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7260, N'SALADILLO (BA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7263, N'GENERAL ALVEAR (BA)           ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7300, N'AZUL (BA)                     ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7303, N'TAPALQUE                      ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7311, N'CHILLAR                       ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7318, N'HINOJO (BA)                   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7400, N'OLAVARRIA                     ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7401, N'SIERRA CHICA                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7403, N'LOMA NEGRA (BA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7406, N'GENERAL LAMADRID (BA)         ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7414, N'LAPRIDA (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7500, N'TRES ARROYOS                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7501, N'INDIO RICO (BA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7503, N'ORENSE (BA)                   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7505, N'CLAROMECO (BA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7509, N'ORIENTE (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7511, N'COPETONAS (BA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7513, N'ADOLFO GONZALES CHAVES        ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7515, N'DE LA GARMA (BA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7521, N'SAN CAYETANO (BA)             ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7530, N'CORONEL PRINGLES (BA)         ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7540, N'CORONEL SUAREZ (BA)           ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7545, N'HUANGUELEN (BA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7600, N'MAR DEL PLATA                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7601, N'BATAN (BA)                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7603, N'COM. OTAMENDI (BA)            ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7605, N'MECHONGUE (BA)                ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7607, N'MIRAMAR (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7620, N'BALCARCE (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7623, N'LOBERIA                       ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7630, N'NECOCHEA (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7631, N'QUEQUEN (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7635, N'LOBERIA (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (7637, N'NICANOR OLIVERA (BA)          ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8000, N'BAHIA BLANCA (BA)             ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8103, N'INGENIERO WHITE (BA)          ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8105, N'GENERAL DANIEL CERRI (BA)     ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8109, N'PUNTA ALTA (BA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8111, N'PUERTO BELGRANO               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8118, N'CABILDO (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8126, N'VILLA IRIS (BA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8132, N'MEDANOS (BA)                  ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8134, N'LA ADELA (LP)                 ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8136, N'JUAN COUSTE (BA)              ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8138, N'RIO COLORADO (RN)             ', 16)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8142, N'HILARIO ASCASUBI (BA)         ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8146, N'MAYOR BURATOVICH (BA)         ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8148, N'PEDRO LURO (BA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8150, N'CORONEL DORREGO (BA)          ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8153, N'MONTE HERMOSO (BA)            ', 2)
GO
print 'Processed 1000 total records'
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8166, N'SALDUNGARAY                   ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8168, N'SIERRA DE LA VENTANA          ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8170, N'PIGUE (BA)                    ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8174, N'SAAVEDRA (BA)                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8180, N'PUAN (BA)                     ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8183, N'ADOLFO ALSINA                 ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8200, N'GENERAL ACHA (LP)             ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8201, N'COLONIA 25 DE MAYO (LP)       ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8204, N'BERNASCONI (L.PAMPA)          ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8206, N'GENERAL SAN MARTIN (LP)       ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8208, N'JACINTO ARAUZ (LP)            ', 11)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8211, N'CHUBUT                        ', 7)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8300, N'NEUQUEN (NQN)                 ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8301, N'NEUQUEN                       ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8303, N'CINCO SALTOS (RN)             ', 16)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8305, N'S. P DEL CHA¥AR (NQN)         ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8307, N'CATRIEL (RN)                  ', 16)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8309, N'CENTENARIO (NQN)              ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8311, N'EL CHOCON (NQN)               ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8313, N'PICUN LEUFU (NON)             ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8315, N'PIEDRA DEL AGUILA (NQN)       ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8316, N'SENILLOSA                     ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8318, N'PLAZA HUINCUL (NQN)           ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8319, N'RINCON DE LOS SAUCES (NQN)    ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8322, N'CUTRAL CO (NQN)               ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8324, N'CIPOLLETTI (RN)               ', 16)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8326, N'RIO NEGRO                     ', 16)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8328, N'ALLEN (RN)                    ', 16)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8332, N'GENERAL ROCA (RN)             ', 16)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8334, N'INGENIERO HUERGO (NQN)        ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8336, N'VILLA REGINA (RN)             ', 16)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8337, N'CHINCHINALES                  ', 16)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8340, N'ZAPALA (NQN)                  ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8345, N'ALUMINé (NQN)                 ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8347, N'LAS LAJAS (NQN)               ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8349, N'LONCOPUE (NQN)                ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8353, N'CHOS MALAÖ                    ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8360, N'CHOELE CHOEL                  ', 16)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8361, N'LUIS BELTRAN (RN)             ', 16)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8370, N'SAN MARTIN DE LOS ANDES (NQN) ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8371, N'JUNIN DE LOS ANDES (NQN)      ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8400, N'SAN CARLOS DE BARILOCHE (RN)  ', 16)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8407, N'VILLA LA ANGOSTURA (NQN)      ', 15)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8418, N'INGENIERO JACOBACCI (RN)      ', 16)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8430, N'EL BOLSON (RN)                ', 16)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8431, N'LAGO PUELO (CHU)              ', 7)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8500, N'VIEDMA (RN)                   ', 16)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8503, N'GENERAL CONESA (RN)           ', 16)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8504, N'CARMEN DE PATAGONES (BA)      ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8508, N'STROEDER                      ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8512, N'VILLALONGA (BA)               ', 2)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8520, N'SAN ANTONIO OESTE (RN)        ', 16)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (8532, N'SIERRA GRANDE                 ', 16)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9001, N'COMODORO RIVADAVIA (CHU)      ', 7)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9005, N'GENERAL MOSCONI (CHU)         ', 7)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9011, N'CALETA OLIVIA (SC)            ', 20)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9013, N'SANTA CRUZ                    ', 20)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9015, N'PICO TRUNCADO (SC)            ', 20)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9017, N'LAS HERAS (SC)                ', 20)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9020, N'SARMIENTO (CHU)               ', 7)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9030, N'RIO MAYO (CHU)                ', 7)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9040, N'PERITO MORENO (SC)            ', 20)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9041, N'LOS ANTIGUOS (SC)             ', 20)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9050, N'PUERTO DESEADO (SC)           ', 20)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9100, N'TRELEW                        ', 7)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9103, N'RAWSON (CHU)                  ', 7)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9105, N'GAIMAN (CHU)                  ', 7)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9107, N'DOLAVON (CHU)                 ', 7)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9111, N'CAMARONES (CHU)               ', 7)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9120, N'PUERTO MADRYN (CHU)           ', 7)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9200, N'ESQUEL (CHU)                  ', 7)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9203, N'TREVELIN                      ', 7)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9210, N'EL MAITEN (CHU)               ', 7)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9223, N'GOBERNADOR COSTA (CHU)        ', 7)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9300, N'SANTA CRUZ (SC)               ', 20)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9303, N'LUIS PIEDRABUENA (SC)         ', 20)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9310, N'SAN JULIAN (SC)               ', 20)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9311, N'GOBERNADOR GREGORES (SC)      ', 20)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9400, N'RIO GALLEGOS (SC)             ', 20)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9405, N'EL CALAFATE (SC)              ', 20)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9407, N'YACIMIENTO R. TURBIO (SC)     ', 20)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9408, N'28 DE NOVIEMBRE               ', 20)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9409, N'TIERRA DEL FUEGO              ', 23)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9410, N'USHUAIA (TF)                  ', 23)
INSERT [LOCALIDADES] ([cod_postal], [desc_localidad], [cod_provincia]) VALUES (9420, N'RIO GRANDE (TF)               ', 23)
----> marcas
INSERT [MARCAS] ([ID_MARCA], [NOMBRE_MARCA], [ESTADO_MARCA]) VALUES (N'M00001', N'NOKIA', 1)
INSERT [MARCAS] ([ID_MARCA], [NOMBRE_MARCA], [ESTADO_MARCA]) VALUES (N'M00002', N'SAMSUNG', 1)
INSERT [MARCAS] ([ID_MARCA], [NOMBRE_MARCA], [ESTADO_MARCA]) VALUES (N'M00003', N'MOTOROLA', 1) 
INSERT [MARCAS] ([ID_MARCA], [NOMBRE_MARCA], [ESTADO_MARCA]) VALUES (N'M00004', N'HUAWEI', 1)
GO
----> forma de pago
INSERT [dbo].[FORMA_PAGO] ([ID_FORMAPAGO_FP], [FORMAPAGO_FP], [ESTADO_FP]) VALUES (N'C', N'TARJETA CREDITO', 1)
INSERT [dbo].[FORMA_PAGO] ([ID_FORMAPAGO_FP], [FORMAPAGO_FP], [ESTADO_FP]) VALUES (N'D', N'TARJETA DEBITO', 1)
INSERT [dbo].[FORMA_PAGO] ([ID_FORMAPAGO_FP], [FORMAPAGO_FP], [ESTADO_FP]) VALUES (N'E', N'EFECTIVO', 1)
INSERT [dbo].[FORMA_PAGO] ([ID_FORMAPAGO_FP], [FORMAPAGO_FP], [ESTADO_FP]) VALUES (N'M', N'MERCADOPAGO', 1)
INSERT [dbo].[FORMA_PAGO] ([ID_FORMAPAGO_FP], [FORMAPAGO_FP], [ESTADO_FP]) VALUES (N'P', N'PAGOFACIL', 1)
INSERT [dbo].[FORMA_PAGO] ([ID_FORMAPAGO_FP], [FORMAPAGO_FP], [ESTADO_FP]) VALUES (N'R', N'RAPIPAGO', 1)
INSERT [dbo].[FORMA_PAGO] ([ID_FORMAPAGO_FP], [FORMAPAGO_FP], [ESTADO_FP]) VALUES (N'T', N'TRANSFERENCIA BANC', 1)
GO
----> forma de envio
INSERT [dbo].[FORMA_ENVIO] ([ID_FORMAENVIO_FE], [FORMAENVIO_FE], [ESTADO_FE]) VALUES (N'C', N'A CORREO', 1)
INSERT [dbo].[FORMA_ENVIO] ([ID_FORMAENVIO_FE], [FORMAENVIO_FE], [ESTADO_FE]) VALUES (N'D', N'A DOMICILIO', 1)
INSERT [dbo].[FORMA_ENVIO] ([ID_FORMAENVIO_FE], [FORMAENVIO_FE], [ESTADO_FE]) VALUES (N'S', N'A SUCURSAR', 1)
GO
----> rol
INSERT [dbo].[ROL] ([ID_ROL], [ROL]) VALUES (N'A', N'ADMINISTRADOR')
INSERT [dbo].[ROL] ([ID_ROL], [ROL]) VALUES (N'C', N'CLIENTE')
INSERT [dbo].[ROL] ([ID_ROL], [ROL]) VALUES (N'E', N'EMPLEADO')
INSERT [dbo].[ROL] ([ID_ROL], [ROL]) VALUES (N'V', N'VENDEDOR')
GO
----> celulares
INSERT [dbo].[CELULARES] ([ID_MODELO], [ID_MARCA_CEL], [DESCRIPCION_CEL], [STOCK_CEL], [PRECIO_UNITARIO_CEL], [UBICACION_IMAGEN_CEL], [ESTADO_CEL]) 
VALUES (N'A30', N'M00002', N'RAM 3GB, ROM 32GB,BATERIA 3000 Mah, PANTALLA 6,2', 10, 21999, N'../Imagenes/samsungA30', 1)
INSERT [dbo].[CELULARES] ([ID_MODELO], [ID_MARCA_CEL], [DESCRIPCION_CEL], [STOCK_CEL], [PRECIO_UNITARIO_CEL], [UBICACION_IMAGEN_CEL], [ESTADO_CEL]) 
VALUES (N'G7POWER', N'M00003', N'RAM 3GB, ROM 32 GB, BATERIA 5000 Mah', 10, 18999, N'../imagenes/motog7power', 1)
GO
----> usuarios
INSERT [dbo].[USUARIOS] ([DNI_USU], [NOMBRE_USU], [APELLIDO_USU], [TELEFONO_USU], [ID_PROVINCIA_USU], [ID_LOCALIDAD_USU], [DIRECCION_USU], [CONTRASEÑA], [ID_ROL_USU], [ESTADO_USU]) 
VALUES (N'29183748', N'ADRIANA', N'RUIZ', N'1556263821', 5, 3460, N'BELGRANO 738', N'2222', N'C', 1)
INSERT [dbo].[USUARIOS] ([DNI_USU], [NOMBRE_USU], [APELLIDO_USU], [TELEFONO_USU], [ID_PROVINCIA_USU], [ID_LOCALIDAD_USU], [DIRECCION_USU], [CONTRASEÑA], [ID_ROL_USU], [ESTADO_USU]) 
VALUES (N'35273842', N'MARCELA', N'SANCHEZ', N'1583959345', 1, 1426, N'PERON 1294', N'4321', N'E', 1)
INSERT [dbo].[USUARIOS] ([DNI_USU], [NOMBRE_USU], [APELLIDO_USU], [TELEFONO_USU], [ID_PROVINCIA_USU], [ID_LOCALIDAD_USU], [DIRECCION_USU], [CONTRASEÑA], [ID_ROL_USU], [ESTADO_USU]) 
VALUES (N'37829483', N'JOSE', N'AVALOS', N'1582839495', 2, 1650, N'INDEPENDENCIA 583', N'1111', N'C', 1)
INSERT [dbo].[USUARIOS] ([DNI_USU], [NOMBRE_USU], [APELLIDO_USU], [TELEFONO_USU], [ID_PROVINCIA_USU], [ID_LOCALIDAD_USU], [DIRECCION_USU], [CONTRASEÑA], [ID_ROL_USU], [ESTADO_USU])
VALUES (N'48372938', N'ALBERTO', N'PEREZ', N'1576348295', 1, 1418, N'LAVALLE 268', N'1234', N'A', 1)
GO
----> ventas
SET IDENTITY_INSERT [dbo].[VENTAS] ON
INSERT [dbo].[VENTAS] ([ID_VTA], [ID_USU_VTA], [ID_CLI_VTA],  [FECHA_VTA], [ID_FORMAENVIO_VTA], [ID_FORMAPAGO_VTA], [IMPORTETOTAL]) VALUES (1, N'37829483', N'37829483', CAST(0x80400B00 AS Date), N'D', N'E', 21999)
INSERT [dbo].[VENTAS] ([ID_VTA], [ID_USU_VTA], [ID_CLI_VTA], [FECHA_VTA], [ID_FORMAENVIO_VTA], [ID_FORMAPAGO_VTA], [IMPORTETOTAL]) VALUES (2, N'48372938', N'48372938', CAST(0x80400B00 AS Date), N'S', N'D', 40998)
SET IDENTITY_INSERT [dbo].[VENTAS] OFF
GO
----> detalles de ventas
SET IDENTITY_INSERT [dbo].[DETALLES_VENTA] ON
INSERT [dbo].[DETALLES_VENTA] ([ID_VTA_DV], [ID_DV], [ID_MODELO_DV], [CANTIDAD_DV], [PU_DV]) 
VALUES (1, 1, N'A30', 1, 21999)
INSERT [dbo].[DETALLES_VENTA] ([ID_VTA_DV], [ID_DV], [ID_MODELO_DV], [CANTIDAD_DV], [PU_DV]) 
VALUES (2, 2, N'A30', 1, 21999)
INSERT [dbo].[DETALLES_VENTA] ([ID_VTA_DV], [ID_DV], [ID_MODELO_DV], [CANTIDAD_DV], [PU_DV]) 
VALUES (2, 3, N'G7POWER', 1, 18999)
SET IDENTITY_INSERT [dbo].[DETALLES_VENTA] OFF

?
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
	  ORDER BY NOMBRE_MARCA
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
	  ORDER BY NOMBRE_MARCA
GO

CREATE Procedure MostrarRoles
AS
   SELECT ID_ROL AS Id,
		  ROL AS Rol
	FROM ROL
GO

CREATE Procedure MostrarUsuarios
AS
   SELECT  DNI_USU AS DNI,
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
	  ORDER BY DNI_USU
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
		   ID_USU_VTA AS Vendedor,
		   ID_CLI_VTA AS Cliente,
		   NOMBRE_USU AS Nombre,
		   APELLIDO_USU AS Apellido,
		   FECHA_VTA AS Fecha,
		   FORMAENVIO_FE AS FormaDeEnvio,
		   FORMAPAGO_FP AS FormaDePago,
		   IMPORTETOTAL AS Total
	FROM VENTAS inner join USUARIOS on(ID_CLI_VTA=DNI_USU)
		     inner join FORMA_ENVIO on (ID_FORMAENVIO_VTA=ID_FORMAENVIO_FE)
		     inner join FORMA_PAGO on (ID_FORMAPAGO_VTA = ID_FORMAPAGO_FP)
		     ORDER BY FECHA_VTA
GO

CREATE Procedure MostrarProvincias
AS
   SELECT cod_provincia AS Id,
		  descripcion_provincia AS Provincia
	FROM PROVINCIAS
	ORDER BY descripcion_provincia
GO

--------------------------------------------------------------
      --- Busqueda de Registros ---
--------------------------------------------------------------

------> LOCALIDADES
CREATE Procedure MostrarLocalidadesPorProvincia
 @IDPROVINCIA int
AS
   SELECT cod_postal AS Id,
   desc_localidad AS Localidad
	FROM LOCALIDADES
	  WHERE cod_provincia = @IDPROVINCIA
	  ORDER BY desc_localidad
GO

------> USUARIOS


CREATE Procedure MostrarUsuariosPorId
@DNIUSU varchar(15)
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
	  WHERE ESTADO_USU = 1 AND DNI_USU=@DNIUSU
	  ORDER BY DNI_USU
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
	  ORDER BY DNI_USU
GO


------> VENTAS


CREATE Procedure MostrarVentasPorVendedor
@DNIUSU varchar(15)
AS
   SELECT ID_VTA AS Id,
	   ID_USU_VTA AS Vendedor,
	   ID_CLI_VTA AS Cliente,
	   NOMBRE_USU AS Nombre,
	   APELLIDO_USU AS Apellido,
	   FECHA_VTA AS Fecha,
	   FORMAENVIO_FE AS FormaDeEnvio,
	   FORMAPAGO_FP AS FormaDePago,
	   IMPORTETOTAL AS Total
	FROM VENTAS inner join USUARIOS on(ID_CLI_VTA=DNI_USU)
		     inner join FORMA_ENVIO on (ID_FORMAENVIO_VTA=ID_FORMAENVIO_FE)
		     inner join FORMA_PAGO on (ID_FORMAPAGO_VTA = ID_FORMAPAGO_FP)
	where ID_USU_VTA=@DNIUSU
	ORDER BY FECHA_VTA
GO


CREATE Procedure MostrarVentasPorCliente
@DNIUSU varchar(15)
AS
   SELECT ID_VTA AS Id,
	   ID_USU_VTA AS Vendedor,
	   ID_CLI_VTA AS Cliente,
	   NOMBRE_USU AS Nombre,
	   APELLIDO_USU AS Apellido,
	   FECHA_VTA AS Fecha,
	   FORMAENVIO_FE AS FormaDeEnvio,
	   FORMAPAGO_FP AS FormaDePago,
	   IMPORTETOTAL AS Total
	FROM VENTAS inner join USUARIOS on(ID_CLI_VTA=DNI_USU)
		     inner join FORMA_ENVIO on (ID_FORMAENVIO_VTA=ID_FORMAENVIO_FE)
		     inner join FORMA_PAGO on (ID_FORMAPAGO_VTA = ID_FORMAPAGO_FP)
	where ID_CLI_VTA=@DNIUSU
	ORDER BY FECHA_VTA
GO


CREATE Procedure MostrarVentaPorId
@IDVENTA int
AS
   SELECT ID_VTA AS Id,
	   ID_USU_VTA AS Vendedor,
	   ID_CLI_VTA AS Cliente,
	   NOMBRE_USU AS Nombre,
	   APELLIDO_USU AS Apellido,
	   FECHA_VTA AS Fecha,
	   FORMAENVIO_FE AS FormaDeEnvio,
	   FORMAPAGO_FP AS FormaDePago,
	   IMPORTETOTAL AS Total
	FROM VENTAS inner join USUARIOS on(ID_CLI_VTA=DNI_USU)
		     inner join FORMA_ENVIO on (ID_FORMAENVIO_VTA=ID_FORMAENVIO_FE)
		     inner join FORMA_PAGO on (ID_FORMAPAGO_VTA = ID_FORMAPAGO_FP)
	where ID_VTA=@IDVENTA
	ORDER BY FECHA_VTA
GO

CREATE Procedure MostrarVentaPorFecha
@FECHA DATE
AS
   SELECT ID_VTA AS Id,
	   ID_USU_VTA AS Vendedor,
	   ID_CLI_VTA AS Cliente,
	   NOMBRE_USU AS Nombre,
	   APELLIDO_USU AS Apellido,
	   FECHA_VTA AS Fecha,
	   FORMAENVIO_FE AS FormaDeEnvio,
	   FORMAPAGO_FP AS FormaDePago,
	   IMPORTETOTAL AS Total
	FROM VENTAS inner join USUARIOS on(ID_CLI_VTA=DNI_USU)
		     inner join FORMA_ENVIO on (ID_FORMAENVIO_VTA=ID_FORMAENVIO_FE)
		     inner join FORMA_PAGO on (ID_FORMAPAGO_VTA = ID_FORMAPAGO_FP)
	where FECHA_VTA=@FECHA
	ORDER BY FECHA_VTA
GO

CREATE Procedure MostrarVentasEntreFechas
@FECHAINICIO DATE,
@FECHAFIN DATE
AS
   SELECT ID_VTA AS Id,
	   ID_USU_VTA AS Vendedor,
	   ID_CLI_VTA AS Cliente,
	   NOMBRE_USU AS Nombre,
	   APELLIDO_USU AS Apellido,
	   FECHA_VTA AS Fecha,
	   FORMAENVIO_FE AS FormaDeEnvio,
	   FORMAPAGO_FP AS FormaDePago,
	   IMPORTETOTAL AS Total
	FROM VENTAS inner join USUARIOS on(ID_CLI_VTA=DNI_USU)
		     inner join FORMA_ENVIO on (ID_FORMAENVIO_VTA=ID_FORMAENVIO_FE)
		     inner join FORMA_PAGO on (ID_FORMAPAGO_VTA = ID_FORMAPAGO_FP)
	where FECHA_VTA>@FECHAINICIO AND FECHA_VTA<@FECHAFIN
	ORDER BY FECHA_VTA
GO

CREATE Procedure MostrarVentasPorFormaDePago
@IDFORMAPAGOVENTA char
AS
SELECT ID_VTA AS Id,
	   ID_USU_VTA AS Vendedor,
	   ID_CLI_VTA AS Cliente,
	   NOMBRE_USU AS Nombre,
	   APELLIDO_USU AS Apellido,
	   FECHA_VTA AS Fecha,
	   FORMAENVIO_FE AS FormaDeEnvio,
	   FORMAPAGO_FP AS FormaDePago,
	   IMPORTETOTAL AS Total
	FROM VENTAS inner join USUARIOS on(ID_CLI_VTA=DNI_USU)
		     inner join FORMA_ENVIO on (ID_FORMAENVIO_VTA=ID_FORMAENVIO_FE)
		     inner join FORMA_PAGO on (ID_FORMAPAGO_VTA = ID_FORMAPAGO_FP)
	where ID_FORMAPAGO_VTA = @IDFORMAPAGOVENTA
	ORDER BY FECHA_VTA
GO

CREATE Procedure MostrarVentasPorFormaDeEnvio
@IDFORMAENVIOVENTA char
AS
SELECT ID_VTA AS Id,
	   ID_USU_VTA AS Vendedor,
	   ID_CLI_VTA AS Cliente,
	   NOMBRE_USU AS Nombre,
	   APELLIDO_USU AS Apellido,
	   FECHA_VTA AS Fecha,
	   FORMAENVIO_FE AS FormaDeEnvio,
	   FORMAPAGO_FP AS FormaDePago,
	   IMPORTETOTAL AS Total
	FROM VENTAS inner join USUARIOS on(ID_CLI_VTA=DNI_USU)
		     inner join FORMA_ENVIO on (ID_FORMAENVIO_VTA=ID_FORMAENVIO_FE)
		     inner join FORMA_PAGO on (ID_FORMAPAGO_VTA = ID_FORMAPAGO_FP)
	where ID_FORMAENVIO_VTA = @IDFORMAENVIOVENTA
	ORDER BY FECHA_VTA
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
@IDMODELOCEL varchar(15)
AS
   SELECT ID_DV AS Detalle,
	  ID_MODELO_DV AS Modelo,
	  NOMBRE_MARCA AS Marca,
	  CANTIDAD_DV AS Cantidad,
	  PU_DV AS PrecioUnitario,
	  (CANTIDAD_DV*PU_DV) AS Total
	FROM DETALLES_VENTA inner join CELULARES on (ID_MODELO_DV=ID_MODELO)
				inner join MARCAS on (ID_MARCA_CEL=ID_MARCA)
	WHERE ID_MODELO_DV=@IDMODELOCEL
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
@IDMODELOCEL varchar(15)
AS
   SELECT ID_MODELO as Modelo,
	  NOMBRE_MARCA as Marca,
	  DESCRIPCION_CEL as Descripcion,
	  STOCK_CEL as Stock,
	  PRECIO_UNITARIO_CEL as Precio,
	  UBICACION_IMAGEN_CEL as Imagen
	FROM CELULARES inner join MARCAS on (ID_MARCA_CEL=ID_MARCA)
	  WHERE ESTADO_CEL = 1 AND ID_MODELO=@IDMODELOCEL
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


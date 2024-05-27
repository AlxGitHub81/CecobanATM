<<<<<<< HEAD
USE [master]
GO
/****** Object:  Database [ATMDB]    Script Date: 26/05/2024 05:59:31 p. m. ******/
DROP DATABASE IF EXISTS [ATMDB]
GO

DROP USER IF EXISTS [CecobanATMUsr]
GO

IF EXISTS 
    (SELECT name  
     FROM master.sys.server_principals
     WHERE name = 'CecobanATMUsr')
BEGIN
    
	DROP LOGIN [CecobanATMUsr]

END


--1) Creación de base
CREATE DATABASE [ATMDB];
GO

--2) Creación de Login
CREATE LOGIN [CecobanATMUsr] WITH PASSWORD=N'C3c0b@n%$5', DEFAULT_DATABASE=[ATMDB], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF

USE [ATMDB]
GO

--3) Creación de usuario
CREATE USER [CecobanATMUsr] FOR LOGIN [CecobanATMUsr] WITH DEFAULT_SCHEMA=[dbo]
GO

--4) Asignación de roles

ALTER ROLE [db_datareader] ADD MEMBER [CecobanATMUsr]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [CecobanATMUsr]
GO

GRANT EXECUTE TO [CecobanATMUsr] 


--Creación de objetos
-----------------------

USE [ATMDB]
GO
/****** Object:  StoredProcedure [dbo].[Tarjetas_SP]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[Tarjetas_SP]
GO
/****** Object:  StoredProcedure [dbo].[Cuentas_SP]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[Cuentas_SP]
GO
/****** Object:  StoredProcedure [dbo].[Cargos_SP]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[Cargos_SP]
GO
/****** Object:  StoredProcedure [dbo].[Abonos_SP]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[Abonos_SP]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Movimientos]') AND type in (N'U'))
ALTER TABLE [dbo].[Movimientos] DROP CONSTRAINT IF EXISTS [FK_Movimientos_MovimientosTipo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Movimientos]') AND type in (N'U'))
ALTER TABLE [dbo].[Movimientos] DROP CONSTRAINT IF EXISTS [FK_Movimientos_Cuentas1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Movimientos]') AND type in (N'U'))
ALTER TABLE [dbo].[Movimientos] DROP CONSTRAINT IF EXISTS [FK_Movimientos_Cuentas]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Montos]') AND type in (N'U'))
ALTER TABLE [dbo].[Montos] DROP CONSTRAINT IF EXISTS [FK_Montos_Cuentas]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CuentasTarjetas]') AND type in (N'U'))
ALTER TABLE [dbo].[CuentasTarjetas] DROP CONSTRAINT IF EXISTS [FK_CuentasTarjetas_Usuarios1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CuentasTarjetas]') AND type in (N'U'))
ALTER TABLE [dbo].[CuentasTarjetas] DROP CONSTRAINT IF EXISTS [FK_CuentasTarjetas_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CuentasTarjetas]') AND type in (N'U'))
ALTER TABLE [dbo].[CuentasTarjetas] DROP CONSTRAINT IF EXISTS [FK_CuentasTarjetas_Tarjetas]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CuentasTarjetas]') AND type in (N'U'))
ALTER TABLE [dbo].[CuentasTarjetas] DROP CONSTRAINT IF EXISTS [FK_CuentasTarjetas_Cuentas]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CuentasClientes]') AND type in (N'U'))
ALTER TABLE [dbo].[CuentasClientes] DROP CONSTRAINT IF EXISTS [FK_CuentasUsuarios_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CuentasClientes]') AND type in (N'U'))
ALTER TABLE [dbo].[CuentasClientes] DROP CONSTRAINT IF EXISTS [FK_CuentasUsuarios_Cuentas]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CuentasClientes]') AND type in (N'U'))
ALTER TABLE [dbo].[CuentasClientes] DROP CONSTRAINT IF EXISTS [FK_CuentasUsuarios_Clientes]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CuentasClientes]') AND type in (N'U'))
ALTER TABLE [dbo].[CuentasClientes] DROP CONSTRAINT IF EXISTS [FK_CuentasClientes_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Terminales]') AND type in (N'U'))
ALTER TABLE [dbo].[Terminales] DROP CONSTRAINT IF EXISTS [DF_Terminales_TerminalKey]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Movimientos]') AND type in (N'U'))
ALTER TABLE [dbo].[Movimientos] DROP CONSTRAINT IF EXISTS [DF_Movimientos_Fecha]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Usuarios]
GO
/****** Object:  Table [dbo].[Terminales]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Terminales]
GO
/****** Object:  Table [dbo].[Tarjetas]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Tarjetas]
GO
/****** Object:  Table [dbo].[MovimientosTipo]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[MovimientosTipo]
GO
/****** Object:  Table [dbo].[Movimientos]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Movimientos]
GO
/****** Object:  Table [dbo].[Montos]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Montos]
GO
/****** Object:  Table [dbo].[CuentasTarjetas]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[CuentasTarjetas]
GO
/****** Object:  Table [dbo].[CuentasClientes]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[CuentasClientes]
GO
/****** Object:  Table [dbo].[Cuentas]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Cuentas]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Clientes]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteId] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](60) NOT NULL,
	[ApellidoPaterno] [nvarchar](60) NOT NULL,
	[ApellidoMaterno] [nvarchar](60) NULL,
	[Estatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuentas]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuentas](
	[CuentaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Numero] [numeric](10, 0) NULL,
	[Clabe] [numeric](18, 0) NULL,
	[Estatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Cuentas] PRIMARY KEY CLUSTERED 
(
	[CuentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentasClientes]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentasClientes](
	[FK_ClienteId] [bigint] NOT NULL,
	[FK_CuentaId] [bigint] NOT NULL,
	[FechaAsignacion] [datetime] NOT NULL,
	[UsuarioAsignacionId] [int] NOT NULL,
	[FechaDesaginacion] [datetime] NULL,
	[UsuarioDesasignacionId] [int] NULL,
	[FK_EstatusId] [tinyint] NOT NULL,
 CONSTRAINT [PK_CuentasUsuarios] PRIMARY KEY CLUSTERED 
(
	[FK_ClienteId] ASC,
	[FK_CuentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentasTarjetas]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentasTarjetas](
	[FK_CuentaId] [bigint] NOT NULL,
	[FK_TarjetaId] [bigint] NOT NULL,
	[FechaAsignacion] [datetime] NOT NULL,
	[UsuarioAsignacionId] [int] NOT NULL,
	[FechaDesaginacion] [datetime] NULL,
	[UsuarioDesasignacionId] [int] NULL,
	[FK_EstatusId] [tinyint] NOT NULL,
 CONSTRAINT [PK_CuentasTarjetas] PRIMARY KEY CLUSTERED 
(
	[FK_CuentaId] ASC,
	[FK_TarjetaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Montos]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Montos](
	[FK_CuentaId] [bigint] NOT NULL,
	[Monto] [money] NOT NULL,
 CONSTRAINT [PK_Montos] PRIMARY KEY CLUSTERED 
(
	[FK_CuentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimientos]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimientos](
	[MovimientoId] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_CuentaId] [bigint] NOT NULL,
	[FK_TipoMovimientoId] [tinyint] NOT NULL,
	[Monto] [money] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[FK_TerminalId] [bigint] NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Movimientos] PRIMARY KEY CLUSTERED 
(
	[MovimientoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientosTipo]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientosTipo](
	[TipoMovimientoId] [tinyint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Estatus] [bit] NOT NULL,
	[Abono] [bit] NOT NULL,
 CONSTRAINT [PK_MovimientosTipo] PRIMARY KEY CLUSTERED 
(
	[TipoMovimientoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarjetas]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjetas](
	[TarjetaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Numero] [numeric](16, 0) NOT NULL,
	[Vencimiento] [date] NOT NULL,
	[Codigo] [smallint] NOT NULL,
	[Estatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Tarjetas] PRIMARY KEY CLUSTERED 
(
	[TarjetaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Terminales]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Terminales](
	[TerminalId] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](400) NULL,
	[FK_TipoId] [smallint] NOT NULL,
	[Estatus] [tinyint] NOT NULL,
	[TerminalKey] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Terminales] PRIMARY KEY CLUSTERED 
(
	[TerminalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApellidoPaterno] [varchar](50) NOT NULL,
	[ApellidoMaterno] [varchar](50) NOT NULL,
	[Estatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 
GO
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Estatus]) VALUES (1, N'Alejandro', N'Uribe', N'Baeza', 1)
GO
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Cuentas] ON 
GO
INSERT [dbo].[Cuentas] ([CuentaId], [Numero], [Clabe], [Estatus]) VALUES (1, CAST(1529672056 AS Numeric(10, 0)), CAST(12180000006720440 AS Numeric(18, 0)), 1)
GO
SET IDENTITY_INSERT [dbo].[Cuentas] OFF
GO
INSERT [dbo].[CuentasClientes] ([FK_ClienteId], [FK_CuentaId], [FechaAsignacion], [UsuarioAsignacionId], [FechaDesaginacion], [UsuarioDesasignacionId], [FK_EstatusId]) VALUES (1, 1, CAST(N'2024-05-25T00:00:00.000' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[CuentasTarjetas] ([FK_CuentaId], [FK_TarjetaId], [FechaAsignacion], [UsuarioAsignacionId], [FechaDesaginacion], [UsuarioDesasignacionId], [FK_EstatusId]) VALUES (1, 2, CAST(N'2024-05-25T00:00:00.000' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Montos] ([FK_CuentaId], [Monto]) VALUES (1, 100804.5000)
GO
SET IDENTITY_INSERT [dbo].[Movimientos] ON 
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (1, 1, 8, 17200.0000, CAST(N'2024-05-25T17:05:35.033' AS DateTime), NULL, N'deposito en ventanilla')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (2, 1, 8, 17200.0000, CAST(N'2024-05-25T17:06:17.947' AS DateTime), NULL, N'deposito en ventanilla')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (3, 1, 8, 17200.0000, CAST(N'2024-05-25T17:06:36.010' AS DateTime), NULL, N'deposito en ventanilla')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (4, 1, 8, 17200.0000, CAST(N'2024-05-25T17:07:28.053' AS DateTime), 1, N'deposito en ventanilla')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (5, 1, 8, 17200.0000, CAST(N'2024-05-25T17:07:33.203' AS DateTime), 1, N'deposito en ventanilla')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (6, 1, 7, 200.0000, CAST(N'2024-05-25T17:12:53.753' AS DateTime), 2, N'Disposición de efectivo')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (7, 1, 7, 200.0000, CAST(N'2024-05-25T17:13:07.133' AS DateTime), 2, N'Disposición de efectivo')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (8, 1, 7, 200.0000, CAST(N'2024-05-25T17:13:14.260' AS DateTime), 2, N'Disposición de efectivo')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (9, 1, 7, 200.0000, CAST(N'2024-05-25T17:13:17.970' AS DateTime), 2, N'Disposición de efectivo')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (13, 1, 8, 0.5000, CAST(N'2024-05-26T01:12:44.900' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (15, 1, 8, 0.5000, CAST(N'2024-05-26T01:41:04.757' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (16, 1, 8, 0.5000, CAST(N'2024-05-26T01:47:43.903' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (17, 1, 7, 0.5000, CAST(N'2024-05-26T11:58:30.660' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (18, 1, 7, 5000.0000, CAST(N'2024-05-26T11:59:21.283' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (21, 1, 8, 0.5000, CAST(N'2024-05-26T13:36:33.360' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (22, 1, 8, 0.5000, CAST(N'2024-05-26T13:36:49.463' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (23, 1, 7, 5000.0000, CAST(N'2024-05-26T13:37:37.997' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (24, 1, 8, 0.5000, CAST(N'2024-05-26T16:42:21.830' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (25, 1, 7, 5000.0000, CAST(N'2024-05-26T16:44:18.783' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (26, 1, 8, 0.5000, CAST(N'2024-05-26T17:45:03.610' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (27, 1, 8, 0.5000, CAST(N'2024-05-26T17:46:17.993' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (29, 1, 8, 0.5000, CAST(N'2024-05-26T17:47:39.300' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (30, 1, 8, 0.5000, CAST(N'2024-05-26T17:47:57.640' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (31, 1, 7, 5000.0000, CAST(N'2024-05-26T17:48:13.440' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (32, 1, 7, 5000.0000, CAST(N'2024-05-26T17:49:04.100' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (34, 1, 7, 5000.0000, CAST(N'2024-05-26T17:49:20.747' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
SET IDENTITY_INSERT [dbo].[Movimientos] OFF
GO
SET IDENTITY_INSERT [dbo].[MovimientosTipo] ON 
GO
INSERT [dbo].[MovimientosTipo] ([TipoMovimientoId], [Nombre], [Estatus], [Abono]) VALUES (1, N'Cargo', 1, 0)
GO
INSERT [dbo].[MovimientosTipo] ([TipoMovimientoId], [Nombre], [Estatus], [Abono]) VALUES (2, N'Por cobrar', 1, 0)
GO
INSERT [dbo].[MovimientosTipo] ([TipoMovimientoId], [Nombre], [Estatus], [Abono]) VALUES (3, N'Pago con tarjeta', 1, 0)
GO
INSERT [dbo].[MovimientosTipo] ([TipoMovimientoId], [Nombre], [Estatus], [Abono]) VALUES (4, N'Transferencia interbancaria enviada', 1, 0)
GO
INSERT [dbo].[MovimientosTipo] ([TipoMovimientoId], [Nombre], [Estatus], [Abono]) VALUES (7, N'Disposición de efectivo en cajeros', 1, 0)
GO
INSERT [dbo].[MovimientosTipo] ([TipoMovimientoId], [Nombre], [Estatus], [Abono]) VALUES (8, N'Depósito', 1, 1)
GO
INSERT [dbo].[MovimientosTipo] ([TipoMovimientoId], [Nombre], [Estatus], [Abono]) VALUES (9, N'Transferencia interbancaria recibida', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[MovimientosTipo] OFF
GO
SET IDENTITY_INSERT [dbo].[Tarjetas] ON 
GO
INSERT [dbo].[Tarjetas] ([TarjetaId], [Numero], [Vencimiento], [Codigo], [Estatus]) VALUES (2, CAST(1345739856923485 AS Numeric(16, 0)), CAST(N'2026-05-01' AS Date), 2345, 1)
GO
SET IDENTITY_INSERT [dbo].[Tarjetas] OFF
GO
SET IDENTITY_INSERT [dbo].[Terminales] ON 
GO
INSERT [dbo].[Terminales] ([TerminalId], [Nombre], [Descripcion], [FK_TipoId], [Estatus], [TerminalKey]) VALUES (1, N'Ventanilla 1 Suc. 095 Reforma', N'Ventanilla', 1, 1, N'cd71832f-73a1-4a97-84d9-c0d8200aac33')
GO
INSERT [dbo].[Terminales] ([TerminalId], [Nombre], [Descripcion], [FK_TipoId], [Estatus], [TerminalKey]) VALUES (2, N'Cajero automático', N'Cajero automático Num. 34567', 2, 1, N'aad313c4-b562-441d-b450-ecc960d91366')
GO
SET IDENTITY_INSERT [dbo].[Terminales] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Estatus]) VALUES (1, N'Alejandro', N'Uribe', N'Baeza', 1)
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Movimientos] ADD  CONSTRAINT [DF_Movimientos_Fecha]  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[Terminales] ADD  CONSTRAINT [DF_Terminales_TerminalKey]  DEFAULT (newid()) FOR [TerminalKey]
GO
ALTER TABLE [dbo].[CuentasClientes]  WITH CHECK ADD  CONSTRAINT [FK_CuentasClientes_Usuarios] FOREIGN KEY([UsuarioDesasignacionId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
GO
ALTER TABLE [dbo].[CuentasClientes] CHECK CONSTRAINT [FK_CuentasClientes_Usuarios]
GO
ALTER TABLE [dbo].[CuentasClientes]  WITH CHECK ADD  CONSTRAINT [FK_CuentasUsuarios_Clientes] FOREIGN KEY([FK_ClienteId])
REFERENCES [dbo].[Clientes] ([ClienteId])
GO
ALTER TABLE [dbo].[CuentasClientes] CHECK CONSTRAINT [FK_CuentasUsuarios_Clientes]
GO
ALTER TABLE [dbo].[CuentasClientes]  WITH CHECK ADD  CONSTRAINT [FK_CuentasUsuarios_Cuentas] FOREIGN KEY([FK_CuentaId])
REFERENCES [dbo].[Cuentas] ([CuentaId])
GO
ALTER TABLE [dbo].[CuentasClientes] CHECK CONSTRAINT [FK_CuentasUsuarios_Cuentas]
GO
ALTER TABLE [dbo].[CuentasClientes]  WITH CHECK ADD  CONSTRAINT [FK_CuentasUsuarios_Usuarios] FOREIGN KEY([UsuarioAsignacionId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
GO
ALTER TABLE [dbo].[CuentasClientes] CHECK CONSTRAINT [FK_CuentasUsuarios_Usuarios]
GO
ALTER TABLE [dbo].[CuentasTarjetas]  WITH CHECK ADD  CONSTRAINT [FK_CuentasTarjetas_Cuentas] FOREIGN KEY([FK_CuentaId])
REFERENCES [dbo].[Cuentas] ([CuentaId])
GO
ALTER TABLE [dbo].[CuentasTarjetas] CHECK CONSTRAINT [FK_CuentasTarjetas_Cuentas]
GO
ALTER TABLE [dbo].[CuentasTarjetas]  WITH CHECK ADD  CONSTRAINT [FK_CuentasTarjetas_Tarjetas] FOREIGN KEY([FK_TarjetaId])
REFERENCES [dbo].[Tarjetas] ([TarjetaId])
GO
ALTER TABLE [dbo].[CuentasTarjetas] CHECK CONSTRAINT [FK_CuentasTarjetas_Tarjetas]
GO
ALTER TABLE [dbo].[CuentasTarjetas]  WITH CHECK ADD  CONSTRAINT [FK_CuentasTarjetas_Usuarios] FOREIGN KEY([UsuarioAsignacionId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
GO
ALTER TABLE [dbo].[CuentasTarjetas] CHECK CONSTRAINT [FK_CuentasTarjetas_Usuarios]
GO
ALTER TABLE [dbo].[CuentasTarjetas]  WITH CHECK ADD  CONSTRAINT [FK_CuentasTarjetas_Usuarios1] FOREIGN KEY([UsuarioDesasignacionId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
GO
ALTER TABLE [dbo].[CuentasTarjetas] CHECK CONSTRAINT [FK_CuentasTarjetas_Usuarios1]
GO
ALTER TABLE [dbo].[Montos]  WITH CHECK ADD  CONSTRAINT [FK_Montos_Cuentas] FOREIGN KEY([FK_CuentaId])
REFERENCES [dbo].[Cuentas] ([CuentaId])
GO
ALTER TABLE [dbo].[Montos] CHECK CONSTRAINT [FK_Montos_Cuentas]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_Cuentas] FOREIGN KEY([FK_TerminalId])
REFERENCES [dbo].[Terminales] ([TerminalId])
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_Cuentas]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_Cuentas1] FOREIGN KEY([FK_CuentaId])
REFERENCES [dbo].[Cuentas] ([CuentaId])
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_Cuentas1]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_MovimientosTipo] FOREIGN KEY([FK_TipoMovimientoId])
REFERENCES [dbo].[MovimientosTipo] ([TipoMovimientoId])
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_MovimientosTipo]
GO
/****** Object:  StoredProcedure [dbo].[Abonos_SP]    Script Date: 26/05/2024 10:54:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alejandro Uribe Baeza
-- Create date: 25/05/2024
-- Description:	Operaciones de abonos sobre una cuenta
-- =============================================


/*
	
	EXEC [dbo].[Abonos_SP] 
			@Opcion = 1, 
			@Parametros=N'{"Numero":1529672056,"Monto":17200,"Tipo":8,"TerminalKey":"cd71832f-73a1-4a97-84d9-c0d8200aac33",
							"Concepto":"deposito en ventanilla"}'

*/

CREATE PROCEDURE [dbo].[Abonos_SP]
	@Opcion TINYINT
	,@Parametros NVARCHAR(MAX)
AS
BEGIN

	DECLARE @TerminalId BIGINT
	DECLARE @CuentaId BIGINT

	DECLARE @TBL_Parametros TABLE (Numero NUMERIC(10,0)
									,Monto MONEY
									,TerminalKey UNIQUEIDENTIFIER
									,TipoMovimientoId TINYINT
									
									,Descripcion VARCHAR(400))

	DECLARE @TBL_Respuesta TABLE (Resultado TINYINT
								,Descripcion NVARCHAR(50))

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF @Opcion = 1
	BEGIN
		--Abono a cuenta
		BEGIN TRY

		BEGIN TRANSACTION Abonos_Transaction
			

			INSERT INTO @TBL_Parametros(
									Numero,Monto,TerminalKey
									,TipoMovimientoId,Descripcion)
			VALUES(
					JSON_VALUE(@Parametros,'$.Numero'),JSON_VALUE(@Parametros,'$.Monto')
					,JSON_VALUE(@Parametros,'$.TerminalKey'),JSON_VALUE(@Parametros,'$.Tipo')
					,JSON_VALUE(@Parametros,'$.Concepto')
			)

			SET @TerminalId = (SELECT [TerminalId]
								FROM [dbo].[Terminales] AS [T]
								INNER JOIN @TBL_Parametros AS [P]
								ON [T].[TerminalKey] = [P].[TerminalKey])

			SET @CuentaId = (SELECT [CuentaId]
								FROM [dbo].[Cuentas] AS [C]
								INNER JOIN @TBL_Parametros AS [P]
								ON [C].[Numero] = [P].[Numero])

			IF @CuentaId IS NULL
			BEGIN
				INSERT INTO @TBL_Respuesta (Resultado,Descripcion)
				VALUES(2,'Número de cuenta incorrecto')
			END
			ELSE
			BEGIN
				UPDATE [dbo].[Montos]
				SET
					[Monto] = [Monto] + (SELECT [Monto] FROM @TBL_Parametros)
				WHERE
					[FK_CuentaId] = @CuentaId

				INSERT INTO [dbo].[Movimientos]
					   ([FK_CuentaId],[FK_TipoMovimientoId],[Monto]
					   ,[FK_TerminalId],[Descripcion])
				SELECT
					@CuentaId
					,TipoMovimientoId,Monto
					,@TerminalId,Descripcion
				FROM @TBL_Parametros


				INSERT INTO @TBL_Respuesta (Resultado,Descripcion)
				VALUES(1,'Operación correcta')
			END

		COMMIT TRANSACTION Abonos_Transaction

		END TRY
		BEGIN CATCH
			
			IF @@TRANCOUNT = 1
			BEGIN
				ROLLBACK TRANSACTION Abonos_Transaction
			END

			
			INSERT INTO @TBL_Respuesta([Resultado],[Descripcion])
			VALUES(0,'Error en operación')

		END CATCH

		--Resultado
		SELECT
			[Resultado]
			,[Descripcion]
		FROM @TBL_Respuesta

	END
END
GO
/****** Object:  StoredProcedure [dbo].[Cargos_SP]    Script Date: 26/05/2024 10:54:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alejandro Uribe Baeza
-- Create date: 25/05/2024
-- Description:	Operaciones de cargos sobre una cuenta
-- =============================================


/*
	
	EXEC [dbo].[Cargos_SP] 
			@Parametros=N'{"Numero":1529672056,"Monto":200,"tipo":7,"TerminalKey":"AAD313C4-B562-441D-B450-ECC960D91366","Concepto":"Disposición de efectivo"}'

*/

CREATE PROCEDURE [dbo].[Cargos_SP]
	@Parametros NVARCHAR(MAX)
AS
BEGIN

	DECLARE @TerminalId BIGINT
	DECLARE @CuentaId BIGINT

	DECLARE @TBL_Parametros TABLE (Numero NUMERIC(10,0)
									,Monto MONEY
									,TerminalKey UNIQUEIDENTIFIER
									,TipoMovimientoId TINYINT
									,Descripcion VARCHAR(400))

	DECLARE @TBL_Respuesta TABLE (Resultado TINYINT
								,Descripcion NVARCHAR(50))

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


		--Cargo a cuenta
		BEGIN TRY

		BEGIN TRANSACTION Cargos_Transaction
			

			INSERT INTO @TBL_Parametros(
									Numero,Monto,TerminalKey
									,TipoMovimientoId,Descripcion)
			VALUES(
					JSON_VALUE(@Parametros,'$.Numero'),JSON_VALUE(@Parametros,'$.Monto')
					,JSON_VALUE(@Parametros,'$.TerminalKey'),JSON_VALUE(@Parametros,'$.Tipo')
					,JSON_VALUE(@Parametros,'$.Concepto')
			)

			SET @TerminalId = (SELECT [TerminalId]
								FROM [dbo].[Terminales] AS [T]
								INNER JOIN @TBL_Parametros AS [P]
								ON [T].[TerminalKey] = [P].[TerminalKey])

			SET @CuentaId = (SELECT [CuentaId]
								FROM [dbo].[Cuentas] AS [C]
								INNER JOIN @TBL_Parametros AS [P]
								ON [C].[Numero] = [P].[Numero])

			IF @CuentaId IS NULL
			BEGIN
				INSERT INTO @TBL_Respuesta (Resultado,Descripcion)
				VALUES(2,'Número de cuenta incorrecto')
			END

			UPDATE [dbo].[Montos]
			SET
				[Monto] = [Monto] - (SELECT [Monto] FROM @TBL_Parametros)
			WHERE
				[FK_CuentaId] = @CuentaId

			INSERT INTO [dbo].[Movimientos]
				   ([FK_CuentaId],[FK_TipoMovimientoId],[Monto]
				   ,[FK_TerminalId],[Descripcion])
			SELECT
				@CuentaId
				,TipoMovimientoId,Monto
				,@TerminalId,Descripcion
			FROM @TBL_Parametros


			INSERT INTO @TBL_Respuesta (Resultado,Descripcion)
			VALUES(1,'Operación correcta')

		COMMIT TRANSACTION Cargos_Transaction

		END TRY
		BEGIN CATCH
			
			IF @@TRANCOUNT = 1
			BEGIN
				ROLLBACK TRANSACTION Cargos_Transaction
			END

			
			INSERT INTO @TBL_Respuesta([Resultado],[Descripcion])
			VALUES(0,'Error en operación')

		END CATCH

		--Resultado
		SELECT
			[Resultado]
			,[Descripcion]
		FROM @TBL_Respuesta

END
GO
/****** Object:  StoredProcedure [dbo].[Cuentas_SP]    Script Date: 26/05/2024 10:54:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alejandro Uribe Baeza
-- Create date: 25/05/2024
-- Description:	Operaciones sobre una cuenta
-- =============================================


/*
	
	EXEC [dbo].[Cuentas_SP] @Opcion = 1, @Parametros=N'{"Numero":0}'

*/

CREATE PROCEDURE [dbo].[Cuentas_SP]
	@Opcion TINYINT
	,@Parametros NVARCHAR(MAX)
AS
BEGIN

	DECLARE @Numero NUMERIC(10,0)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF @Opcion = 1
	BEGIN
		--Consulta de monto en una cuenta

		SET @Numero = JSON_VALUE(@Parametros,'$.Numero');

		SELECT
			[M].[Monto]
		FROM
			[dbo].[Montos] AS [M]
		INNER JOIN [dbo].[Cuentas] AS [C]
		ON
			[M].[FK_CuentaId] = [C].[CuentaId]
		WHERE
			[C].[Numero] = @Numero
		
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Tarjetas_SP]    Script Date: 26/05/2024 10:54:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alejandro Uribe Baeza
-- Create date: 25/05/2024
-- Description:	Operaciones sobre una tarjeta
-- Opciones:
--	Opción 1: Cambio de NIP a una tarjeta
-- =============================================


/*
	
	EXEC [dbo].[Tarjetas_SP] @Opcion=1, @Parametros=N'{"Numero":1529672056,"Codigo":678,"CodigoNuevo":5678}'

*/

CREATE PROCEDURE [dbo].[Tarjetas_SP]
	@Opcion TINYINT,
	@Parametros NVARCHAR(MAX)
AS
BEGIN
	
	DECLARE @CuentaNumero NUMERIC(10,0)
	DECLARE @CodigoNIP smallint
	DECLARE @CodigoNIPNuevo smallint

	DECLARE @TBL_Respuesta TABLE (Resultado TINYINT
									,Descripcion NVARCHAR(50))
									
	SET NOCOUNT ON;

    IF @Opcion = 1
	BEGIN
		--Cambio de NIP
		----------------------------------------
		SET @CuentaNumero = JSON_VALUE(@Parametros,'$.Numero');
		SET @CodigoNIP = JSON_VALUE(@Parametros,'$.Codigo');
		SET @CodigoNIPNuevo = JSON_VALUE(@Parametros,'$.CodigoNuevo');

		BEGIN TRY
			
			IF NOT EXISTS (SELECT
								[T].[Codigo]
							FROM
								[dbo].[CuentasTarjetas] AS [CT]
							INNER JOIN [dbo].[Cuentas] AS [C]
							ON
								[CT].[FK_CuentaId] = [C].[CuentaId]
							INNER JOIN [dbo].[Tarjetas] AS [T]
							ON
								[CT].[FK_TarjetaId] = [T].[TarjetaId]
							WHERE
								[C].[Numero] = @CuentaNumero
								AND [T].[Codigo] = @CodigoNIP)
			BEGIN
				INSERT INTO @TBL_Respuesta([Resultado],[Descripcion])
				VALUES(2,'Número de cuenta o NIP incorrecto')
			END
			ELSE
			BEGIN
				UPDATE [T]
				SET
					[T].[Codigo] = @CodigoNIPNuevo
				FROM
					[dbo].[CuentasTarjetas] AS [CT]
				INNER JOIN [dbo].[Cuentas] AS [C]
				ON
					[CT].[FK_CuentaId] = [C].[CuentaId]
				INNER JOIN [dbo].[Tarjetas] AS [T]
				ON
					[CT].[FK_TarjetaId] = [T].[TarjetaId]
				WHERE
					[C].[Numero] = @CuentaNumero
					AND [T].[Codigo] = @CodigoNIP
			
				IF @@ROWCOUNT > 0
				BEGIN
					INSERT INTO @TBL_Respuesta([Resultado],[Descripcion])
					VALUES(1,'Operación correcta')
				END
				ELSE
				BEGIN
					INSERT INTO @TBL_Respuesta([Resultado],[Descripcion])
					VALUES(2,'Parametros incorrectos')
				END
			END

		END TRY
		BEGIN CATCH


			INSERT INTO @TBL_Respuesta([Resultado],[Descripcion])
			VALUES(0,'Error en operación')

		END CATCH

		--Resultado
		SELECT
			[Resultado]
			,[Descripcion]
		FROM @TBL_Respuesta

	END
	
END
GO
=======
USE [master]
GO
/****** Object:  Database [ATMDB]    Script Date: 26/05/2024 05:59:31 p. m. ******/
DROP DATABASE IF EXISTS [ATMDB]
GO

DROP USER IF EXISTS [CecobanATMUsr]
GO

IF EXISTS 
    (SELECT name  
     FROM master.sys.server_principals
     WHERE name = 'CecobanATMUsr')
BEGIN
    
	DROP LOGIN [CecobanATMUsr]

END


--1) Creación de base
CREATE DATABASE [ATMDB];
GO

--2) Creación de Login
CREATE LOGIN [CecobanATMUsr] WITH PASSWORD=N'C3c0b@n%$5', DEFAULT_DATABASE=[ATMDB], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF

USE [ATMDB]
GO

--3) Creación de usuario
CREATE USER [CecobanATMUsr] FOR LOGIN [CecobanATMUsr] WITH DEFAULT_SCHEMA=[dbo]
GO

--4) Asignación de roles

ALTER ROLE [db_datareader] ADD MEMBER [CecobanATMUsr]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [CecobanATMUsr]
GO

GRANT EXECUTE TO [CecobanATMUsr] 


--Creación de objetos
-----------------------

USE [ATMDB]
GO
/****** Object:  StoredProcedure [dbo].[Tarjetas_SP]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[Tarjetas_SP]
GO
/****** Object:  StoredProcedure [dbo].[Cuentas_SP]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[Cuentas_SP]
GO
/****** Object:  StoredProcedure [dbo].[Cargos_SP]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[Cargos_SP]
GO
/****** Object:  StoredProcedure [dbo].[Abonos_SP]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[Abonos_SP]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Movimientos]') AND type in (N'U'))
ALTER TABLE [dbo].[Movimientos] DROP CONSTRAINT IF EXISTS [FK_Movimientos_MovimientosTipo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Movimientos]') AND type in (N'U'))
ALTER TABLE [dbo].[Movimientos] DROP CONSTRAINT IF EXISTS [FK_Movimientos_Cuentas1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Movimientos]') AND type in (N'U'))
ALTER TABLE [dbo].[Movimientos] DROP CONSTRAINT IF EXISTS [FK_Movimientos_Cuentas]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Montos]') AND type in (N'U'))
ALTER TABLE [dbo].[Montos] DROP CONSTRAINT IF EXISTS [FK_Montos_Cuentas]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CuentasTarjetas]') AND type in (N'U'))
ALTER TABLE [dbo].[CuentasTarjetas] DROP CONSTRAINT IF EXISTS [FK_CuentasTarjetas_Usuarios1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CuentasTarjetas]') AND type in (N'U'))
ALTER TABLE [dbo].[CuentasTarjetas] DROP CONSTRAINT IF EXISTS [FK_CuentasTarjetas_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CuentasTarjetas]') AND type in (N'U'))
ALTER TABLE [dbo].[CuentasTarjetas] DROP CONSTRAINT IF EXISTS [FK_CuentasTarjetas_Tarjetas]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CuentasTarjetas]') AND type in (N'U'))
ALTER TABLE [dbo].[CuentasTarjetas] DROP CONSTRAINT IF EXISTS [FK_CuentasTarjetas_Cuentas]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CuentasClientes]') AND type in (N'U'))
ALTER TABLE [dbo].[CuentasClientes] DROP CONSTRAINT IF EXISTS [FK_CuentasUsuarios_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CuentasClientes]') AND type in (N'U'))
ALTER TABLE [dbo].[CuentasClientes] DROP CONSTRAINT IF EXISTS [FK_CuentasUsuarios_Cuentas]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CuentasClientes]') AND type in (N'U'))
ALTER TABLE [dbo].[CuentasClientes] DROP CONSTRAINT IF EXISTS [FK_CuentasUsuarios_Clientes]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CuentasClientes]') AND type in (N'U'))
ALTER TABLE [dbo].[CuentasClientes] DROP CONSTRAINT IF EXISTS [FK_CuentasClientes_Usuarios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Terminales]') AND type in (N'U'))
ALTER TABLE [dbo].[Terminales] DROP CONSTRAINT IF EXISTS [DF_Terminales_TerminalKey]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Movimientos]') AND type in (N'U'))
ALTER TABLE [dbo].[Movimientos] DROP CONSTRAINT IF EXISTS [DF_Movimientos_Fecha]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Usuarios]
GO
/****** Object:  Table [dbo].[Terminales]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Terminales]
GO
/****** Object:  Table [dbo].[Tarjetas]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Tarjetas]
GO
/****** Object:  Table [dbo].[MovimientosTipo]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[MovimientosTipo]
GO
/****** Object:  Table [dbo].[Movimientos]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Movimientos]
GO
/****** Object:  Table [dbo].[Montos]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Montos]
GO
/****** Object:  Table [dbo].[CuentasTarjetas]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[CuentasTarjetas]
GO
/****** Object:  Table [dbo].[CuentasClientes]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[CuentasClientes]
GO
/****** Object:  Table [dbo].[Cuentas]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Cuentas]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 26/05/2024 10:54:18 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Clientes]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteId] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](60) NOT NULL,
	[ApellidoPaterno] [nvarchar](60) NOT NULL,
	[ApellidoMaterno] [nvarchar](60) NULL,
	[Estatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuentas]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuentas](
	[CuentaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Numero] [numeric](10, 0) NULL,
	[Clabe] [numeric](18, 0) NULL,
	[Estatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Cuentas] PRIMARY KEY CLUSTERED 
(
	[CuentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentasClientes]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentasClientes](
	[FK_ClienteId] [bigint] NOT NULL,
	[FK_CuentaId] [bigint] NOT NULL,
	[FechaAsignacion] [datetime] NOT NULL,
	[UsuarioAsignacionId] [int] NOT NULL,
	[FechaDesaginacion] [datetime] NULL,
	[UsuarioDesasignacionId] [int] NULL,
	[FK_EstatusId] [tinyint] NOT NULL,
 CONSTRAINT [PK_CuentasUsuarios] PRIMARY KEY CLUSTERED 
(
	[FK_ClienteId] ASC,
	[FK_CuentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentasTarjetas]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentasTarjetas](
	[FK_CuentaId] [bigint] NOT NULL,
	[FK_TarjetaId] [bigint] NOT NULL,
	[FechaAsignacion] [datetime] NOT NULL,
	[UsuarioAsignacionId] [int] NOT NULL,
	[FechaDesaginacion] [datetime] NULL,
	[UsuarioDesasignacionId] [int] NULL,
	[FK_EstatusId] [tinyint] NOT NULL,
 CONSTRAINT [PK_CuentasTarjetas] PRIMARY KEY CLUSTERED 
(
	[FK_CuentaId] ASC,
	[FK_TarjetaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Montos]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Montos](
	[FK_CuentaId] [bigint] NOT NULL,
	[Monto] [money] NOT NULL,
 CONSTRAINT [PK_Montos] PRIMARY KEY CLUSTERED 
(
	[FK_CuentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimientos]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimientos](
	[MovimientoId] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_CuentaId] [bigint] NOT NULL,
	[FK_TipoMovimientoId] [tinyint] NOT NULL,
	[Monto] [money] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[FK_TerminalId] [bigint] NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Movimientos] PRIMARY KEY CLUSTERED 
(
	[MovimientoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientosTipo]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientosTipo](
	[TipoMovimientoId] [tinyint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Estatus] [bit] NOT NULL,
	[Abono] [bit] NOT NULL,
 CONSTRAINT [PK_MovimientosTipo] PRIMARY KEY CLUSTERED 
(
	[TipoMovimientoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarjetas]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjetas](
	[TarjetaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Numero] [numeric](16, 0) NOT NULL,
	[Vencimiento] [date] NOT NULL,
	[Codigo] [smallint] NOT NULL,
	[Estatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Tarjetas] PRIMARY KEY CLUSTERED 
(
	[TarjetaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Terminales]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Terminales](
	[TerminalId] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](400) NULL,
	[FK_TipoId] [smallint] NOT NULL,
	[Estatus] [tinyint] NOT NULL,
	[TerminalKey] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Terminales] PRIMARY KEY CLUSTERED 
(
	[TerminalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 26/05/2024 10:54:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApellidoPaterno] [varchar](50) NOT NULL,
	[ApellidoMaterno] [varchar](50) NOT NULL,
	[Estatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 
GO
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Estatus]) VALUES (1, N'Alejandro', N'Uribe', N'Baeza', 1)
GO
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Cuentas] ON 
GO
INSERT [dbo].[Cuentas] ([CuentaId], [Numero], [Clabe], [Estatus]) VALUES (1, CAST(1529672056 AS Numeric(10, 0)), CAST(12180000006720440 AS Numeric(18, 0)), 1)
GO
SET IDENTITY_INSERT [dbo].[Cuentas] OFF
GO
INSERT [dbo].[CuentasClientes] ([FK_ClienteId], [FK_CuentaId], [FechaAsignacion], [UsuarioAsignacionId], [FechaDesaginacion], [UsuarioDesasignacionId], [FK_EstatusId]) VALUES (1, 1, CAST(N'2024-05-25T00:00:00.000' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[CuentasTarjetas] ([FK_CuentaId], [FK_TarjetaId], [FechaAsignacion], [UsuarioAsignacionId], [FechaDesaginacion], [UsuarioDesasignacionId], [FK_EstatusId]) VALUES (1, 2, CAST(N'2024-05-25T00:00:00.000' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Montos] ([FK_CuentaId], [Monto]) VALUES (1, 100804.5000)
GO
SET IDENTITY_INSERT [dbo].[Movimientos] ON 
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (1, 1, 8, 17200.0000, CAST(N'2024-05-25T17:05:35.033' AS DateTime), NULL, N'deposito en ventanilla')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (2, 1, 8, 17200.0000, CAST(N'2024-05-25T17:06:17.947' AS DateTime), NULL, N'deposito en ventanilla')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (3, 1, 8, 17200.0000, CAST(N'2024-05-25T17:06:36.010' AS DateTime), NULL, N'deposito en ventanilla')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (4, 1, 8, 17200.0000, CAST(N'2024-05-25T17:07:28.053' AS DateTime), 1, N'deposito en ventanilla')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (5, 1, 8, 17200.0000, CAST(N'2024-05-25T17:07:33.203' AS DateTime), 1, N'deposito en ventanilla')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (6, 1, 7, 200.0000, CAST(N'2024-05-25T17:12:53.753' AS DateTime), 2, N'Disposición de efectivo')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (7, 1, 7, 200.0000, CAST(N'2024-05-25T17:13:07.133' AS DateTime), 2, N'Disposición de efectivo')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (8, 1, 7, 200.0000, CAST(N'2024-05-25T17:13:14.260' AS DateTime), 2, N'Disposición de efectivo')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (9, 1, 7, 200.0000, CAST(N'2024-05-25T17:13:17.970' AS DateTime), 2, N'Disposición de efectivo')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (13, 1, 8, 0.5000, CAST(N'2024-05-26T01:12:44.900' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (15, 1, 8, 0.5000, CAST(N'2024-05-26T01:41:04.757' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (16, 1, 8, 0.5000, CAST(N'2024-05-26T01:47:43.903' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (17, 1, 7, 0.5000, CAST(N'2024-05-26T11:58:30.660' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (18, 1, 7, 5000.0000, CAST(N'2024-05-26T11:59:21.283' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (21, 1, 8, 0.5000, CAST(N'2024-05-26T13:36:33.360' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (22, 1, 8, 0.5000, CAST(N'2024-05-26T13:36:49.463' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (23, 1, 7, 5000.0000, CAST(N'2024-05-26T13:37:37.997' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (24, 1, 8, 0.5000, CAST(N'2024-05-26T16:42:21.830' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (25, 1, 7, 5000.0000, CAST(N'2024-05-26T16:44:18.783' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (26, 1, 8, 0.5000, CAST(N'2024-05-26T17:45:03.610' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (27, 1, 8, 0.5000, CAST(N'2024-05-26T17:46:17.993' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (29, 1, 8, 0.5000, CAST(N'2024-05-26T17:47:39.300' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (30, 1, 8, 0.5000, CAST(N'2024-05-26T17:47:57.640' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (31, 1, 7, 5000.0000, CAST(N'2024-05-26T17:48:13.440' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (32, 1, 7, 5000.0000, CAST(N'2024-05-26T17:49:04.100' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
INSERT [dbo].[Movimientos] ([MovimientoId], [FK_CuentaId], [FK_TipoMovimientoId], [Monto], [Fecha], [FK_TerminalId], [Descripcion]) VALUES (34, 1, 7, 5000.0000, CAST(N'2024-05-26T17:49:20.747' AS DateTime), 1, N'Oxxo Suc. Aeropuerto')
GO
SET IDENTITY_INSERT [dbo].[Movimientos] OFF
GO
SET IDENTITY_INSERT [dbo].[MovimientosTipo] ON 
GO
INSERT [dbo].[MovimientosTipo] ([TipoMovimientoId], [Nombre], [Estatus], [Abono]) VALUES (1, N'Cargo', 1, 0)
GO
INSERT [dbo].[MovimientosTipo] ([TipoMovimientoId], [Nombre], [Estatus], [Abono]) VALUES (2, N'Por cobrar', 1, 0)
GO
INSERT [dbo].[MovimientosTipo] ([TipoMovimientoId], [Nombre], [Estatus], [Abono]) VALUES (3, N'Pago con tarjeta', 1, 0)
GO
INSERT [dbo].[MovimientosTipo] ([TipoMovimientoId], [Nombre], [Estatus], [Abono]) VALUES (4, N'Transferencia interbancaria enviada', 1, 0)
GO
INSERT [dbo].[MovimientosTipo] ([TipoMovimientoId], [Nombre], [Estatus], [Abono]) VALUES (7, N'Disposición de efectivo en cajeros', 1, 0)
GO
INSERT [dbo].[MovimientosTipo] ([TipoMovimientoId], [Nombre], [Estatus], [Abono]) VALUES (8, N'Depósito', 1, 1)
GO
INSERT [dbo].[MovimientosTipo] ([TipoMovimientoId], [Nombre], [Estatus], [Abono]) VALUES (9, N'Transferencia interbancaria recibida', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[MovimientosTipo] OFF
GO
SET IDENTITY_INSERT [dbo].[Tarjetas] ON 
GO
INSERT [dbo].[Tarjetas] ([TarjetaId], [Numero], [Vencimiento], [Codigo], [Estatus]) VALUES (2, CAST(1345739856923485 AS Numeric(16, 0)), CAST(N'2026-05-01' AS Date), 2345, 1)
GO
SET IDENTITY_INSERT [dbo].[Tarjetas] OFF
GO
SET IDENTITY_INSERT [dbo].[Terminales] ON 
GO
INSERT [dbo].[Terminales] ([TerminalId], [Nombre], [Descripcion], [FK_TipoId], [Estatus], [TerminalKey]) VALUES (1, N'Ventanilla 1 Suc. 095 Reforma', N'Ventanilla', 1, 1, N'cd71832f-73a1-4a97-84d9-c0d8200aac33')
GO
INSERT [dbo].[Terminales] ([TerminalId], [Nombre], [Descripcion], [FK_TipoId], [Estatus], [TerminalKey]) VALUES (2, N'Cajero automático', N'Cajero automático Num. 34567', 2, 1, N'aad313c4-b562-441d-b450-ecc960d91366')
GO
SET IDENTITY_INSERT [dbo].[Terminales] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Estatus]) VALUES (1, N'Alejandro', N'Uribe', N'Baeza', 1)
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Movimientos] ADD  CONSTRAINT [DF_Movimientos_Fecha]  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[Terminales] ADD  CONSTRAINT [DF_Terminales_TerminalKey]  DEFAULT (newid()) FOR [TerminalKey]
GO
ALTER TABLE [dbo].[CuentasClientes]  WITH CHECK ADD  CONSTRAINT [FK_CuentasClientes_Usuarios] FOREIGN KEY([UsuarioDesasignacionId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
GO
ALTER TABLE [dbo].[CuentasClientes] CHECK CONSTRAINT [FK_CuentasClientes_Usuarios]
GO
ALTER TABLE [dbo].[CuentasClientes]  WITH CHECK ADD  CONSTRAINT [FK_CuentasUsuarios_Clientes] FOREIGN KEY([FK_ClienteId])
REFERENCES [dbo].[Clientes] ([ClienteId])
GO
ALTER TABLE [dbo].[CuentasClientes] CHECK CONSTRAINT [FK_CuentasUsuarios_Clientes]
GO
ALTER TABLE [dbo].[CuentasClientes]  WITH CHECK ADD  CONSTRAINT [FK_CuentasUsuarios_Cuentas] FOREIGN KEY([FK_CuentaId])
REFERENCES [dbo].[Cuentas] ([CuentaId])
GO
ALTER TABLE [dbo].[CuentasClientes] CHECK CONSTRAINT [FK_CuentasUsuarios_Cuentas]
GO
ALTER TABLE [dbo].[CuentasClientes]  WITH CHECK ADD  CONSTRAINT [FK_CuentasUsuarios_Usuarios] FOREIGN KEY([UsuarioAsignacionId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
GO
ALTER TABLE [dbo].[CuentasClientes] CHECK CONSTRAINT [FK_CuentasUsuarios_Usuarios]
GO
ALTER TABLE [dbo].[CuentasTarjetas]  WITH CHECK ADD  CONSTRAINT [FK_CuentasTarjetas_Cuentas] FOREIGN KEY([FK_CuentaId])
REFERENCES [dbo].[Cuentas] ([CuentaId])
GO
ALTER TABLE [dbo].[CuentasTarjetas] CHECK CONSTRAINT [FK_CuentasTarjetas_Cuentas]
GO
ALTER TABLE [dbo].[CuentasTarjetas]  WITH CHECK ADD  CONSTRAINT [FK_CuentasTarjetas_Tarjetas] FOREIGN KEY([FK_TarjetaId])
REFERENCES [dbo].[Tarjetas] ([TarjetaId])
GO
ALTER TABLE [dbo].[CuentasTarjetas] CHECK CONSTRAINT [FK_CuentasTarjetas_Tarjetas]
GO
ALTER TABLE [dbo].[CuentasTarjetas]  WITH CHECK ADD  CONSTRAINT [FK_CuentasTarjetas_Usuarios] FOREIGN KEY([UsuarioAsignacionId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
GO
ALTER TABLE [dbo].[CuentasTarjetas] CHECK CONSTRAINT [FK_CuentasTarjetas_Usuarios]
GO
ALTER TABLE [dbo].[CuentasTarjetas]  WITH CHECK ADD  CONSTRAINT [FK_CuentasTarjetas_Usuarios1] FOREIGN KEY([UsuarioDesasignacionId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
GO
ALTER TABLE [dbo].[CuentasTarjetas] CHECK CONSTRAINT [FK_CuentasTarjetas_Usuarios1]
GO
ALTER TABLE [dbo].[Montos]  WITH CHECK ADD  CONSTRAINT [FK_Montos_Cuentas] FOREIGN KEY([FK_CuentaId])
REFERENCES [dbo].[Cuentas] ([CuentaId])
GO
ALTER TABLE [dbo].[Montos] CHECK CONSTRAINT [FK_Montos_Cuentas]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_Cuentas] FOREIGN KEY([FK_TerminalId])
REFERENCES [dbo].[Terminales] ([TerminalId])
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_Cuentas]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_Cuentas1] FOREIGN KEY([FK_CuentaId])
REFERENCES [dbo].[Cuentas] ([CuentaId])
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_Cuentas1]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_MovimientosTipo] FOREIGN KEY([FK_TipoMovimientoId])
REFERENCES [dbo].[MovimientosTipo] ([TipoMovimientoId])
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_MovimientosTipo]
GO
/****** Object:  StoredProcedure [dbo].[Abonos_SP]    Script Date: 26/05/2024 10:54:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alejandro Uribe Baeza
-- Create date: 25/05/2024
-- Description:	Operaciones de abonos sobre una cuenta
-- =============================================


/*
	
	EXEC [dbo].[Abonos_SP] 
			@Opcion = 1, 
			@Parametros=N'{"Numero":1529672056,"Monto":17200,"Tipo":8,"TerminalKey":"cd71832f-73a1-4a97-84d9-c0d8200aac33",
							"Concepto":"deposito en ventanilla"}'

*/

CREATE PROCEDURE [dbo].[Abonos_SP]
	@Opcion TINYINT
	,@Parametros NVARCHAR(MAX)
AS
BEGIN

	DECLARE @TerminalId BIGINT
	DECLARE @CuentaId BIGINT

	DECLARE @TBL_Parametros TABLE (Numero NUMERIC(10,0)
									,Monto MONEY
									,TerminalKey UNIQUEIDENTIFIER
									,TipoMovimientoId TINYINT
									
									,Descripcion VARCHAR(400))

	DECLARE @TBL_Respuesta TABLE (Resultado TINYINT
								,Descripcion NVARCHAR(50))

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF @Opcion = 1
	BEGIN
		--Abono a cuenta
		BEGIN TRY

		BEGIN TRANSACTION Abonos_Transaction
			

			INSERT INTO @TBL_Parametros(
									Numero,Monto,TerminalKey
									,TipoMovimientoId,Descripcion)
			VALUES(
					JSON_VALUE(@Parametros,'$.Numero'),JSON_VALUE(@Parametros,'$.Monto')
					,JSON_VALUE(@Parametros,'$.TerminalKey'),JSON_VALUE(@Parametros,'$.Tipo')
					,JSON_VALUE(@Parametros,'$.Concepto')
			)

			SET @TerminalId = (SELECT [TerminalId]
								FROM [dbo].[Terminales] AS [T]
								INNER JOIN @TBL_Parametros AS [P]
								ON [T].[TerminalKey] = [P].[TerminalKey])

			SET @CuentaId = (SELECT [CuentaId]
								FROM [dbo].[Cuentas] AS [C]
								INNER JOIN @TBL_Parametros AS [P]
								ON [C].[Numero] = [P].[Numero])

			IF @CuentaId IS NULL
			BEGIN
				INSERT INTO @TBL_Respuesta (Resultado,Descripcion)
				VALUES(2,'Número de cuenta incorrecto')
			END
			ELSE
			BEGIN
				UPDATE [dbo].[Montos]
				SET
					[Monto] = [Monto] + (SELECT [Monto] FROM @TBL_Parametros)
				WHERE
					[FK_CuentaId] = @CuentaId

				INSERT INTO [dbo].[Movimientos]
					   ([FK_CuentaId],[FK_TipoMovimientoId],[Monto]
					   ,[FK_TerminalId],[Descripcion])
				SELECT
					@CuentaId
					,TipoMovimientoId,Monto
					,@TerminalId,Descripcion
				FROM @TBL_Parametros


				INSERT INTO @TBL_Respuesta (Resultado,Descripcion)
				VALUES(1,'Operación correcta')
			END

		COMMIT TRANSACTION Abonos_Transaction

		END TRY
		BEGIN CATCH
			
			IF @@TRANCOUNT = 1
			BEGIN
				ROLLBACK TRANSACTION Abonos_Transaction
			END

			
			INSERT INTO @TBL_Respuesta([Resultado],[Descripcion])
			VALUES(0,'Error en operación')

		END CATCH

		--Resultado
		SELECT
			[Resultado]
			,[Descripcion]
		FROM @TBL_Respuesta

	END
END
GO
/****** Object:  StoredProcedure [dbo].[Cargos_SP]    Script Date: 26/05/2024 10:54:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alejandro Uribe Baeza
-- Create date: 25/05/2024
-- Description:	Operaciones de cargos sobre una cuenta
-- =============================================


/*
	
	EXEC [dbo].[Cargos_SP] 
			@Parametros=N'{"Numero":1529672056,"Monto":200,"tipo":7,"TerminalKey":"AAD313C4-B562-441D-B450-ECC960D91366","Concepto":"Disposición de efectivo"}'

*/

CREATE PROCEDURE [dbo].[Cargos_SP]
	@Parametros NVARCHAR(MAX)
AS
BEGIN

	DECLARE @TerminalId BIGINT
	DECLARE @CuentaId BIGINT

	DECLARE @TBL_Parametros TABLE (Numero NUMERIC(10,0)
									,Monto MONEY
									,TerminalKey UNIQUEIDENTIFIER
									,TipoMovimientoId TINYINT
									,Descripcion VARCHAR(400))

	DECLARE @TBL_Respuesta TABLE (Resultado TINYINT
								,Descripcion NVARCHAR(50))

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


		--Cargo a cuenta
		BEGIN TRY

		BEGIN TRANSACTION Cargos_Transaction
			

			INSERT INTO @TBL_Parametros(
									Numero,Monto,TerminalKey
									,TipoMovimientoId,Descripcion)
			VALUES(
					JSON_VALUE(@Parametros,'$.Numero'),JSON_VALUE(@Parametros,'$.Monto')
					,JSON_VALUE(@Parametros,'$.TerminalKey'),JSON_VALUE(@Parametros,'$.Tipo')
					,JSON_VALUE(@Parametros,'$.Concepto')
			)

			SET @TerminalId = (SELECT [TerminalId]
								FROM [dbo].[Terminales] AS [T]
								INNER JOIN @TBL_Parametros AS [P]
								ON [T].[TerminalKey] = [P].[TerminalKey])

			SET @CuentaId = (SELECT [CuentaId]
								FROM [dbo].[Cuentas] AS [C]
								INNER JOIN @TBL_Parametros AS [P]
								ON [C].[Numero] = [P].[Numero])

			IF @CuentaId IS NULL
			BEGIN
				INSERT INTO @TBL_Respuesta (Resultado,Descripcion)
				VALUES(2,'Número de cuenta incorrecto')
			END

			UPDATE [dbo].[Montos]
			SET
				[Monto] = [Monto] - (SELECT [Monto] FROM @TBL_Parametros)
			WHERE
				[FK_CuentaId] = @CuentaId

			INSERT INTO [dbo].[Movimientos]
				   ([FK_CuentaId],[FK_TipoMovimientoId],[Monto]
				   ,[FK_TerminalId],[Descripcion])
			SELECT
				@CuentaId
				,TipoMovimientoId,Monto
				,@TerminalId,Descripcion
			FROM @TBL_Parametros


			INSERT INTO @TBL_Respuesta (Resultado,Descripcion)
			VALUES(1,'Operación correcta')

		COMMIT TRANSACTION Cargos_Transaction

		END TRY
		BEGIN CATCH
			
			IF @@TRANCOUNT = 1
			BEGIN
				ROLLBACK TRANSACTION Cargos_Transaction
			END

			
			INSERT INTO @TBL_Respuesta([Resultado],[Descripcion])
			VALUES(0,'Error en operación')

		END CATCH

		--Resultado
		SELECT
			[Resultado]
			,[Descripcion]
		FROM @TBL_Respuesta

END
GO
/****** Object:  StoredProcedure [dbo].[Cuentas_SP]    Script Date: 26/05/2024 10:54:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alejandro Uribe Baeza
-- Create date: 25/05/2024
-- Description:	Operaciones sobre una cuenta
-- =============================================


/*
	
	EXEC [dbo].[Cuentas_SP] @Opcion = 1, @Parametros=N'{"Numero":0}'

*/

CREATE PROCEDURE [dbo].[Cuentas_SP]
	@Opcion TINYINT
	,@Parametros NVARCHAR(MAX)
AS
BEGIN

	DECLARE @Numero NUMERIC(10,0)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF @Opcion = 1
	BEGIN
		--Consulta de monto en una cuenta

		SET @Numero = JSON_VALUE(@Parametros,'$.Numero');

		SELECT
			[M].[Monto]
		FROM
			[dbo].[Montos] AS [M]
		INNER JOIN [dbo].[Cuentas] AS [C]
		ON
			[M].[FK_CuentaId] = [C].[CuentaId]
		WHERE
			[C].[Numero] = @Numero
		
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Tarjetas_SP]    Script Date: 26/05/2024 10:54:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alejandro Uribe Baeza
-- Create date: 25/05/2024
-- Description:	Operaciones sobre una tarjeta
-- Opciones:
--	Opción 1: Cambio de NIP a una tarjeta
-- =============================================


/*
	
	EXEC [dbo].[Tarjetas_SP] @Opcion=1, @Parametros=N'{"Numero":1529672056,"Codigo":678,"CodigoNuevo":5678}'

*/

CREATE PROCEDURE [dbo].[Tarjetas_SP]
	@Opcion TINYINT,
	@Parametros NVARCHAR(MAX)
AS
BEGIN
	
	DECLARE @CuentaNumero NUMERIC(10,0)
	DECLARE @CodigoNIP smallint
	DECLARE @CodigoNIPNuevo smallint

	DECLARE @TBL_Respuesta TABLE (Resultado TINYINT
									,Descripcion NVARCHAR(50))
									
	SET NOCOUNT ON;

    IF @Opcion = 1
	BEGIN
		--Cambio de NIP
		----------------------------------------
		SET @CuentaNumero = JSON_VALUE(@Parametros,'$.Numero');
		SET @CodigoNIP = JSON_VALUE(@Parametros,'$.Codigo');
		SET @CodigoNIPNuevo = JSON_VALUE(@Parametros,'$.CodigoNuevo');

		BEGIN TRY
			
			IF NOT EXISTS (SELECT
								[T].[Codigo]
							FROM
								[dbo].[CuentasTarjetas] AS [CT]
							INNER JOIN [dbo].[Cuentas] AS [C]
							ON
								[CT].[FK_CuentaId] = [C].[CuentaId]
							INNER JOIN [dbo].[Tarjetas] AS [T]
							ON
								[CT].[FK_TarjetaId] = [T].[TarjetaId]
							WHERE
								[C].[Numero] = @CuentaNumero
								AND [T].[Codigo] = @CodigoNIP)
			BEGIN
				INSERT INTO @TBL_Respuesta([Resultado],[Descripcion])
				VALUES(2,'Número de cuenta o NIP incorrecto')
			END
			ELSE
			BEGIN
				UPDATE [T]
				SET
					[T].[Codigo] = @CodigoNIPNuevo
				FROM
					[dbo].[CuentasTarjetas] AS [CT]
				INNER JOIN [dbo].[Cuentas] AS [C]
				ON
					[CT].[FK_CuentaId] = [C].[CuentaId]
				INNER JOIN [dbo].[Tarjetas] AS [T]
				ON
					[CT].[FK_TarjetaId] = [T].[TarjetaId]
				WHERE
					[C].[Numero] = @CuentaNumero
					AND [T].[Codigo] = @CodigoNIP
			
				IF @@ROWCOUNT > 0
				BEGIN
					INSERT INTO @TBL_Respuesta([Resultado],[Descripcion])
					VALUES(1,'Operación correcta')
				END
				ELSE
				BEGIN
					INSERT INTO @TBL_Respuesta([Resultado],[Descripcion])
					VALUES(2,'Parametros incorrectos')
				END
			END

		END TRY
		BEGIN CATCH


			INSERT INTO @TBL_Respuesta([Resultado],[Descripcion])
			VALUES(0,'Error en operación')

		END CATCH

		--Resultado
		SELECT
			[Resultado]
			,[Descripcion]
		FROM @TBL_Respuesta

	END
	
END
GO
>>>>>>> 245da73cc457ef072cadd35f67070f05bb4b16c7

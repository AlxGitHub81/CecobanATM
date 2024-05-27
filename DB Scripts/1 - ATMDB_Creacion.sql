USE [master]
GO
/****** Object:  Database [ATMDB]    Script Date: 26/05/2024 05:59:31 p. m. ******/
DROP DATABASE IF EXISTS [ATMDB]
GO

DROP USER IF EXISTS [CecobanATM]
GO

IF EXISTS 
    (SELECT name  
     FROM master.sys.server_principals
     WHERE name = 'CecobanATM_V2')
BEGIN
    
	DROP LOGIN [CecobanATM_V2]

END


--1) Creación de base
CREATE DATABASE [ATMDB];
GO

ALTER DATABASE [ATMDB] SET  READ_WRITE 
GO

--2) Creación de Login
CREATE LOGIN [CecobanATM_V2] WITH PASSWORD=N'C3c0b@n%$5', DEFAULT_DATABASE=[ATMDB], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=ON, CHECK_POLICY=ON

USE [ATMDB]
GO



--3) Creación de usuario
CREATE USER [CecobanATM_Usr_V2] FOR LOGIN [CecobanATM_V2] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CecobanATM_Usr_V2]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [CecobanATM_Usr_V2]
GO

--4) Asignación de roles

ALTER ROLE [db_datareader] ADD MEMBER [CecobanATM_Usr_V2]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [CecobanATM_Usr_V2]
GO

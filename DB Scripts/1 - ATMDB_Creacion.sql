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

--ALTER DATABASE [ATMDB] SET  READ_WRITE 
--GO

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
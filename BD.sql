USE [master]
GO
/****** Object:  Database [encuestador_itla]    Script Date: 10/12/2020 9:39:00 PM ******/
CREATE DATABASE [encuestador_itla]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'encuestador_itla', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\encuestador_itla.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'encuestador_itla_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\encuestador_itla_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [encuestador_itla] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [encuestador_itla].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [encuestador_itla] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [encuestador_itla] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [encuestador_itla] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [encuestador_itla] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [encuestador_itla] SET ARITHABORT OFF 
GO
ALTER DATABASE [encuestador_itla] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [encuestador_itla] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [encuestador_itla] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [encuestador_itla] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [encuestador_itla] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [encuestador_itla] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [encuestador_itla] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [encuestador_itla] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [encuestador_itla] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [encuestador_itla] SET  ENABLE_BROKER 
GO
ALTER DATABASE [encuestador_itla] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [encuestador_itla] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [encuestador_itla] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [encuestador_itla] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [encuestador_itla] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [encuestador_itla] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [encuestador_itla] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [encuestador_itla] SET RECOVERY FULL 
GO
ALTER DATABASE [encuestador_itla] SET  MULTI_USER 
GO
ALTER DATABASE [encuestador_itla] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [encuestador_itla] SET DB_CHAINING OFF 
GO
ALTER DATABASE [encuestador_itla] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [encuestador_itla] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [encuestador_itla] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'encuestador_itla', N'ON'
GO
ALTER DATABASE [encuestador_itla] SET QUERY_STORE = OFF
GO
USE [encuestador_itla]
GO
/****** Object:  Table [dbo].[encuestas]    Script Date: 10/12/2020 9:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[encuestas](
	[id_usuario] [int] NULL,
	[id_encuesta] [int] NOT NULL,
	[nombre_encuesta] [varchar](100) NULL,
	[id_pregunta] [int] NULL,
	[pregunta] [varchar](max) NULL,
	[r_1] [varchar](100) NULL,
	[r_2] [varchar](100) NULL,
	[r_3] [varchar](100) NULL,
	[r_4] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_preguntas]    Script Date: 10/12/2020 9:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[vw_preguntas] AS
SELECT id_encuesta,nombre_encuesta,id_pregunta,pregunta,r_1,r_2,r_3,r_4 FROM encuestas
GO
/****** Object:  Table [dbo].[respuestas]    Script Date: 10/12/2020 9:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[respuestas](
	[id_encuesta] [int] NULL,
	[id_encuestado] [int] NULL,
	[encuestado] [varchar](30) NULL,
	[id_pregunta] [int] NULL,
	[respuesta] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_respuestas]    Script Date: 10/12/2020 9:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_respuestas]

as
select r.id_encuestado, e.id_encuesta,r.encuestado,r.id_pregunta, e.pregunta, r.respuesta from respuestas r  inner join encuestas e ON r.id_pregunta = e.id_pregunta
GO
/****** Object:  Table [dbo].[encuestas_temporal]    Script Date: 10/12/2020 9:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[encuestas_temporal](
	[id_usuario] [int] NULL,
	[id_encuesta] [int] NOT NULL,
	[nombre_encuesta] [varchar](100) NULL,
	[id_pregunta] [int] NULL,
	[pregunta] [varchar](max) NULL,
	[r_1] [varchar](100) NULL,
	[r_2] [varchar](100) NULL,
	[r_3] [varchar](100) NULL,
	[r_4] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[id_encuesta]    Script Date: 10/12/2020 9:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[id_encuesta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_encuesta] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[respuesta_temp]    Script Date: 10/12/2020 9:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[respuesta_temp](
	[id_encuesta] [int] NULL,
	[id_encuestado] [int] NULL,
	[encuestado] [varchar](50) NULL,
	[id_pregunta] [int] NULL,
	[respuesta] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 10/12/2020 9:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[apellido] [varchar](100) NULL,
	[usuario] [varchar](50) NULL,
	[contra] [varchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[encuestas] ([id_usuario], [id_encuesta], [nombre_encuesta], [id_pregunta], [pregunta], [r_1], [r_2], [r_3], [r_4]) VALUES (NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[encuestas] ([id_usuario], [id_encuesta], [nombre_encuesta], [id_pregunta], [pregunta], [r_1], [r_2], [r_3], [r_4]) VALUES (0, 2, N'asdfasdf', 1, N'asdf', N'asdf', N'asdfasdf', N'', N'')
INSERT [dbo].[encuestas] ([id_usuario], [id_encuesta], [nombre_encuesta], [id_pregunta], [pregunta], [r_1], [r_2], [r_3], [r_4]) VALUES (1, 4, N'CALCENTERS', 1, N'Trabajas en un call center?', N'Si?', N'No?', N'', N'')
INSERT [dbo].[encuestas] ([id_usuario], [id_encuesta], [nombre_encuesta], [id_pregunta], [pregunta], [r_1], [r_2], [r_3], [r_4]) VALUES (0, 3, N'asdfasd', 2, N'hola, me amas?', N'si', N'no', N'tal ves', N'no lo se ')
INSERT [dbo].[encuestas] ([id_usuario], [id_encuesta], [nombre_encuesta], [id_pregunta], [pregunta], [r_1], [r_2], [r_3], [r_4]) VALUES (1, 4, N'CALCENTERS', 2, N'Por que?', N'Porque si', N'Porque es el unico trabajo que hay', N'Porque no se que mas haces', N'')
INSERT [dbo].[encuestas] ([id_usuario], [id_encuesta], [nombre_encuesta], [id_pregunta], [pregunta], [r_1], [r_2], [r_3], [r_4]) VALUES (1, 4, N'CALCENTERS', 3, N'Eres feliz con tu trabajo', N'Si', N'No', N'Parcialmente', N'No lo se')
INSERT [dbo].[encuestas] ([id_usuario], [id_encuesta], [nombre_encuesta], [id_pregunta], [pregunta], [r_1], [r_2], [r_3], [r_4]) VALUES (1, 4, N'CALCENTERS', 4, N'En que idioma es tu call center?', N'Ingles', N'Español', N'Frances', N'otro idioma')
INSERT [dbo].[encuestas] ([id_usuario], [id_encuesta], [nombre_encuesta], [id_pregunta], [pregunta], [r_1], [r_2], [r_3], [r_4]) VALUES (1, 7, N'summer work and travel', 1, N'has participado alguna vez en el programa?', N'si', N'no', N'me gustaria', N'')
INSERT [dbo].[encuestas] ([id_usuario], [id_encuesta], [nombre_encuesta], [id_pregunta], [pregunta], [r_1], [r_2], [r_3], [r_4]) VALUES (1, 7, N'summer work and travel', 2, N'cuantas veces has participado?', N'1', N'2', N'3', N'4')
INSERT [dbo].[encuestas] ([id_usuario], [id_encuesta], [nombre_encuesta], [id_pregunta], [pregunta], [r_1], [r_2], [r_3], [r_4]) VALUES (1, 7, N'summer work and travel', 3, N'Te gustaria volver?', N'si', N'no', N'N/A', N'')
SET IDENTITY_INSERT [dbo].[id_encuesta] ON 

INSERT [dbo].[id_encuesta] ([id], [nombre_encuesta]) VALUES (1, N'asdfasdf')
INSERT [dbo].[id_encuesta] ([id], [nombre_encuesta]) VALUES (2, N'asdfasd')
INSERT [dbo].[id_encuesta] ([id], [nombre_encuesta]) VALUES (3, N'asdf')
INSERT [dbo].[id_encuesta] ([id], [nombre_encuesta]) VALUES (4, N'asdf')
INSERT [dbo].[id_encuesta] ([id], [nombre_encuesta]) VALUES (5, N'asdf')
INSERT [dbo].[id_encuesta] ([id], [nombre_encuesta]) VALUES (6, N'asdf')
INSERT [dbo].[id_encuesta] ([id], [nombre_encuesta]) VALUES (7, N'asdf')
INSERT [dbo].[id_encuesta] ([id], [nombre_encuesta]) VALUES (8, N'adsf')
INSERT [dbo].[id_encuesta] ([id], [nombre_encuesta]) VALUES (9, N'dsfasdf')
INSERT [dbo].[id_encuesta] ([id], [nombre_encuesta]) VALUES (10, N'asdf')
INSERT [dbo].[id_encuesta] ([id], [nombre_encuesta]) VALUES (11, N'asdf')
INSERT [dbo].[id_encuesta] ([id], [nombre_encuesta]) VALUES (12, N'asdf')
INSERT [dbo].[id_encuesta] ([id], [nombre_encuesta]) VALUES (13, N'asdfasdf')
SET IDENTITY_INSERT [dbo].[id_encuesta] OFF
INSERT [dbo].[respuesta_temp] ([id_encuesta], [id_encuestado], [encuestado], [id_pregunta], [respuesta]) VALUES (7, 5, N'Laura', 1, N'si')
INSERT [dbo].[respuesta_temp] ([id_encuesta], [id_encuestado], [encuestado], [id_pregunta], [respuesta]) VALUES (7, 5, N'Laura', 2, N'si')
INSERT [dbo].[respuestas] ([id_encuesta], [id_encuestado], [encuestado], [id_pregunta], [respuesta]) VALUES (4, 1, N'angel', 1, N'si')
INSERT [dbo].[respuestas] ([id_encuesta], [id_encuestado], [encuestado], [id_pregunta], [respuesta]) VALUES (4, 1, N'angel', 2, N'puede ser')
INSERT [dbo].[respuestas] ([id_encuesta], [id_encuestado], [encuestado], [id_pregunta], [respuesta]) VALUES (4, 1, N'angel', 3, N'porque si')
INSERT [dbo].[respuestas] ([id_encuesta], [id_encuestado], [encuestado], [id_pregunta], [respuesta]) VALUES (4, 1, N'angel', 4, N'no')
INSERT [dbo].[respuestas] ([id_encuesta], [id_encuestado], [encuestado], [id_pregunta], [respuesta]) VALUES (4, 2, N'Pedro', 1, N'Si?')
INSERT [dbo].[respuestas] ([id_encuesta], [id_encuestado], [encuestado], [id_pregunta], [respuesta]) VALUES (4, 2, N'Pedro', 2, N'Porque no se que mas haces')
INSERT [dbo].[respuestas] ([id_encuesta], [id_encuestado], [encuestado], [id_pregunta], [respuesta]) VALUES (4, 2, N'Pedro', 3, N'Porque no se que mas haces')
INSERT [dbo].[respuestas] ([id_encuesta], [id_encuestado], [encuestado], [id_pregunta], [respuesta]) VALUES (4, 2, N'Pedro', 4, N'Porque no se que mas haces')
INSERT [dbo].[respuestas] ([id_encuesta], [id_encuestado], [encuestado], [id_pregunta], [respuesta]) VALUES (4, 3, N'Laura', 1, N'Si?')
INSERT [dbo].[respuestas] ([id_encuesta], [id_encuestado], [encuestado], [id_pregunta], [respuesta]) VALUES (4, 3, N'Laura', 2, N'Porque no se que mas haces')
INSERT [dbo].[respuestas] ([id_encuesta], [id_encuestado], [encuestado], [id_pregunta], [respuesta]) VALUES (4, 3, N'Laura', 3, N'Porque no se que mas haces')
INSERT [dbo].[respuestas] ([id_encuesta], [id_encuestado], [encuestado], [id_pregunta], [respuesta]) VALUES (4, 3, N'Laura', 4, N'Porque no se que mas haces')
INSERT [dbo].[respuestas] ([id_encuesta], [id_encuestado], [encuestado], [id_pregunta], [respuesta]) VALUES (7, 4, N'Angel', 1, N'si')
INSERT [dbo].[respuestas] ([id_encuesta], [id_encuestado], [encuestado], [id_pregunta], [respuesta]) VALUES (7, 4, N'Angel', 2, N'2')
INSERT [dbo].[respuestas] ([id_encuesta], [id_encuestado], [encuestado], [id_pregunta], [respuesta]) VALUES (7, 5, N'Laura', 1, N'si')
INSERT [dbo].[respuestas] ([id_encuesta], [id_encuestado], [encuestado], [id_pregunta], [respuesta]) VALUES (7, 5, N'Laura', 2, N'si')
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id], [nombre], [apellido], [usuario], [contra]) VALUES (1, NULL, NULL, N'papirata', N'Pedro809')
SET IDENTITY_INSERT [dbo].[usuarios] OFF
/****** Object:  StoredProcedure [dbo].[sp_agregar_pregunta]    Script Date: 10/12/2020 9:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_agregar_pregunta]
@id_usuario int,
@id_encuesta int,
@nombre_encuesta varchar(100),
@id_pregunta int,
@pregunta varchar(100),
@respuesta1 varchar(100),
@respuesta2 varchar(100),
@respuesta3 varchar(100),
@respuesta4 varchar(100)
AS
BEGIN
INSERT INTO encuestas_temporal VALUES (@id_usuario,@id_encuesta,@nombre_encuesta,@id_pregunta,@pregunta,@respuesta1,@respuesta2,
@respuesta3,@respuesta4)

UPDATE encuestas_temporal SET nombre_encuesta = @nombre_encuesta
END
GO
USE [master]
GO
ALTER DATABASE [encuestador_itla] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [Biblioteca]    Script Date: 12/04/2019 9:59:13 ******/
CREATE DATABASE [Biblioteca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Biblioteca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Biblioteca.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Biblioteca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Biblioteca_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Biblioteca] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Biblioteca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Biblioteca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Biblioteca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Biblioteca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Biblioteca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Biblioteca] SET ARITHABORT OFF 
GO
ALTER DATABASE [Biblioteca] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Biblioteca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Biblioteca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Biblioteca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Biblioteca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Biblioteca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Biblioteca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Biblioteca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Biblioteca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Biblioteca] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Biblioteca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Biblioteca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Biblioteca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Biblioteca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Biblioteca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Biblioteca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Biblioteca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Biblioteca] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Biblioteca] SET  MULTI_USER 
GO
ALTER DATABASE [Biblioteca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Biblioteca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Biblioteca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Biblioteca] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Biblioteca] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Biblioteca]
GO
/****** Object:  Table [dbo].[Bibliotecario]    Script Date: 12/04/2019 9:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bibliotecario](
	[CedulaID] [varchar](13) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Numero de telefono] [varchar](12) NULL,
	[Sexo] [varchar](1) NULL,
 CONSTRAINT [PK_Bibliotecario] PRIMARY KEY CLUSTERED 
(
	[CedulaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estudiante]    Script Date: 12/04/2019 9:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estudiante](
	[Nombre] [varchar](30) NULL,
	[Matricula] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Estudiante] PRIMARY KEY CLUSTERED 
(
	[Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Formulario]    Script Date: 12/04/2019 9:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Formulario](
	[Nombre del estudiante] [varchar](30) NULL,
	[Matricula] [varchar](15) NULL,
	[Nombre del libro] [varchar](50) NULL,
	[Codigo del libro] [varchar](20) NULL,
	[Fecha] [date] NULL,
	[CedulaID] [varchar](13) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 12/04/2019 9:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Libro](
	[Codigo del libro] [varchar](20) NOT NULL,
	[Nombre del libro] [varchar](50) NULL,
	[Autor del libro] [varchar](30) NULL,
	[Produccion] [varchar](50) NULL,
 CONSTRAINT [PK_Libro] PRIMARY KEY CLUSTERED 
(
	[Codigo del libro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Formulario]  WITH CHECK ADD  CONSTRAINT [FK_Formulario_Bibliotecario] FOREIGN KEY([CedulaID])
REFERENCES [dbo].[Bibliotecario] ([CedulaID])
GO
ALTER TABLE [dbo].[Formulario] CHECK CONSTRAINT [FK_Formulario_Bibliotecario]
GO
ALTER TABLE [dbo].[Formulario]  WITH CHECK ADD  CONSTRAINT [FK_Formulario_Estudiante] FOREIGN KEY([Matricula])
REFERENCES [dbo].[Estudiante] ([Matricula])
GO
ALTER TABLE [dbo].[Formulario] CHECK CONSTRAINT [FK_Formulario_Estudiante]
GO
ALTER TABLE [dbo].[Formulario]  WITH CHECK ADD  CONSTRAINT [FK_Formulario_Libro] FOREIGN KEY([Codigo del libro])
REFERENCES [dbo].[Libro] ([Codigo del libro])
GO
ALTER TABLE [dbo].[Formulario] CHECK CONSTRAINT [FK_Formulario_Libro]
GO
USE [master]
GO
ALTER DATABASE [Biblioteca] SET  READ_WRITE 
GO

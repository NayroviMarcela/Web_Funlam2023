USE [master]
GO
/****** Object:  Database [dbs_comercio]    Script Date: 8/08/2023 7:51:22 a. m. ******/
CREATE DATABASE [dbs_comercio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbs_comercio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\dbs_comercio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbs_comercio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\dbs_comercio_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dbs_comercio] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbs_comercio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbs_comercio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbs_comercio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbs_comercio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbs_comercio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbs_comercio] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbs_comercio] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbs_comercio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbs_comercio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbs_comercio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbs_comercio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbs_comercio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbs_comercio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbs_comercio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbs_comercio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbs_comercio] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbs_comercio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbs_comercio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbs_comercio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbs_comercio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbs_comercio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbs_comercio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbs_comercio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbs_comercio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbs_comercio] SET  MULTI_USER 
GO
ALTER DATABASE [dbs_comercio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbs_comercio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbs_comercio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbs_comercio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbs_comercio] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbs_comercio] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbs_comercio] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbs_comercio] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbs_comercio]
GO
/****** Object:  Table [dbo].[tblcategoria]    Script Date: 8/08/2023 7:51:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblcategoria](
	[Pkcodigo] [bigint] IDENTITY(0,1) NOT NULL,
	[Descripcion] [varchar](5000) NULL,
	[Nomenclatura] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pkcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblcomprador]    Script Date: 8/08/2023 7:51:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblcomprador](
	[Pkcodigo] [varchar](10) NOT NULL,
	[Nombre] [varchar](5000) NULL,
	[Contacto] [varchar](10) NULL,
	[Correo] [varchar](10) NULL,
	[Direccion] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pkcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblestado]    Script Date: 8/08/2023 7:51:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblestado](
	[Pkcodigo] [bigint] IDENTITY(0,1) NOT NULL,
	[Descripcion] [varchar](5000) NULL,
	[Nomenclatura] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pkcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblfactura]    Script Date: 8/08/2023 7:51:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblfactura](
	[Pknfactura] [bigint] IDENTITY(1,1) NOT NULL,
	[Fkid_tblcomprador] [varchar](10) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[Fkcodigo_tblproductos] [varchar](20) NOT NULL,
	[Fkcodigo_tblestado] [bigint] NOT NULL,
	[valorVenta] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pknfactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblproductos]    Script Date: 8/08/2023 7:51:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblproductos](
	[Pkcodigo] [varchar](20) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Existencia] [bigint] NOT NULL,
	[Valor_compra] [float] NOT NULL,
	[Ganancia] [float] NOT NULL,
	[Fkcodigo_tblcategoria] [bigint] NOT NULL,
	[Especificaciones] [varchar](5000) NOT NULL,
	[Valor_venta] [float] NOT NULL,
	[Fkcodigo_tblestado] [bigint] NOT NULL,
	[Fkid_tblusuario] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pkcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblusuarios]    Script Date: 8/08/2023 7:51:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblusuarios](
	[Pkcodigo] [varchar](20) NOT NULL,
	[Nombre] [varchar](5000) NULL,
	[Contacto] [varchar](10) NULL,
	[Correo] [varchar](10) NULL,
	[Direccion] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pkcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [dbs_comercio] SET  READ_WRITE 
GO

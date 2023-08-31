USE [master]
GO
/****** Object:  Database [SQLDB]    Script Date: 31/8/2023 19:29:00 ******/
CREATE DATABASE [SQLDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SQLDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SQLDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SQLDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SQLDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SQLDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SQLDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SQLDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SQLDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SQLDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SQLDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SQLDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SQLDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SQLDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SQLDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SQLDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SQLDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SQLDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SQLDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SQLDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SQLDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SQLDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SQLDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SQLDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SQLDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SQLDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SQLDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SQLDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SQLDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SQLDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SQLDB] SET  MULTI_USER 
GO
ALTER DATABASE [SQLDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SQLDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SQLDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SQLDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SQLDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SQLDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SQLDB', N'ON'
GO
ALTER DATABASE [SQLDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SQLDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SQLDB]
GO
/****** Object:  Table [dbo].[Almacen]    Script Date: 31/8/2023 19:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Almacen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Disponibilidad Local] [int] NULL,
	[Disponibilidad Miami] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credito]    Script Date: 31/8/2023 19:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credito](
	[IdCredito] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Monto] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Debito]    Script Date: 31/8/2023 19:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Debito](
	[IdDebito] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Monto] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 31/8/2023 19:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Descripcion] [nvarchar](100) NULL,
	[Categoria] [nvarchar](50) NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Almacen] ON 

INSERT [dbo].[Almacen] ([Id], [Nombre], [Disponibilidad Local], [Disponibilidad Miami]) VALUES (1, N'Laptop', 5, 1)
INSERT [dbo].[Almacen] ([Id], [Nombre], [Disponibilidad Local], [Disponibilidad Miami]) VALUES (2, N'Camiseta de algodon', 12, 200)
INSERT [dbo].[Almacen] ([Id], [Nombre], [Disponibilidad Local], [Disponibilidad Miami]) VALUES (3, N'Manzanas', 10, 100)
INSERT [dbo].[Almacen] ([Id], [Nombre], [Disponibilidad Local], [Disponibilidad Miami]) VALUES (4, N'Auriculares inalambricos', 2, 50)
INSERT [dbo].[Almacen] ([Id], [Nombre], [Disponibilidad Local], [Disponibilidad Miami]) VALUES (5, N'Jeans ajustados', 50, 90)
INSERT [dbo].[Almacen] ([Id], [Nombre], [Disponibilidad Local], [Disponibilidad Miami]) VALUES (6, N'Chocolate negro', 9, 95)
INSERT [dbo].[Almacen] ([Id], [Nombre], [Disponibilidad Local], [Disponibilidad Miami]) VALUES (7, N'Smartphone', 6, 300)
INSERT [dbo].[Almacen] ([Id], [Nombre], [Disponibilidad Local], [Disponibilidad Miami]) VALUES (8, N'Vestido elegante', 2, 10)
INSERT [dbo].[Almacen] ([Id], [Nombre], [Disponibilidad Local], [Disponibilidad Miami]) VALUES (9, N'Yogur griego', 25, 300)
INSERT [dbo].[Almacen] ([Id], [Nombre], [Disponibilidad Local], [Disponibilidad Miami]) VALUES (10, N'Altavoz bluetooth', 3, 80)
SET IDENTITY_INSERT [dbo].[Almacen] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Categoria]) VALUES (1, N'Laptop', N'Laptop de ultima generacion con procesador rapido y alta resolucion.', N'Electronica')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Categoria]) VALUES (2, N'Camiseta de algodon', N'Camiseta basica de algodon en varios colores de talla.', N'Ropa')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Categoria]) VALUES (3, N'Manzanas', N'Manzanas frescas y jugosas, perfectas como snack saludable.', N'Alimentos')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Categoria]) VALUES (4, N'Auriculares inalambricos', N'auriculares con tecnologia bluetooth para una experiencia inalambrica.', N'Electronica')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Categoria]) VALUES (5, N'Jeans ajustados', N'Jeans de estilo ajustado con diseño moderno.', N'Ropa')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Categoria]) VALUES (6, N'Chocolate negro', N'Tableta de chocolate negro con alto contenido de cacao.', N'Alimentos')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Categoria]) VALUES (7, N'Smartphone', N'Smartphone de gama media y camara de alta calidad.', N'Electronica')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Categoria]) VALUES (8, N'Vestido elegante', N'Vestido elegante para ocasiones especiales.', N'Ropa')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Categoria]) VALUES (9, N'Yogur griego', N'Yogur griego con frutas secas y sin azucar añadida.', N'Alimentos')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Categoria]) VALUES (10, N'Altavoz bluetooth', N'Altavoz portatil con conectividad bluetooth para reproducir musica.', N'Electronica')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Categoria]) VALUES (23, N'Iphone 18', N'Una vaina alta gama que no ha salido', N'SmartPhon')
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
ALTER TABLE [dbo].[Almacen]  WITH CHECK ADD  CONSTRAINT [FK_Almacen_Productos] FOREIGN KEY([Id])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[Almacen] CHECK CONSTRAINT [FK_Almacen_Productos]
GO
USE [master]
GO
ALTER DATABASE [SQLDB] SET  READ_WRITE 
GO

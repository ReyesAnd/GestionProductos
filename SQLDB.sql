USE [SQLDB]
GO
/****** Object:  Table [dbo].[Almacen]    Script Date: 2/9/2023 20:13:30 ******/
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
/****** Object:  Table [dbo].[Categorias]    Script Date: 2/9/2023 20:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 2/9/2023 20:13:31 ******/
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
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategoria], [Categoria]) VALUES (1, N'Electronica')
INSERT [dbo].[Categorias] ([IdCategoria], [Categoria]) VALUES (2, N'Ropa')
INSERT [dbo].[Categorias] ([IdCategoria], [Categoria]) VALUES (3, N'Alimentos')
INSERT [dbo].[Categorias] ([IdCategoria], [Categoria]) VALUES (4, N'Prueba')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
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
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Categoria]) VALUES (23, N'Iphone 18', N'Una vaina alta gama que no ha salido', N'Electronica')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Categoria]) VALUES (27, N'Prueba', N'Objeto de prueba actualizado.', N'Prueba')
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
ALTER TABLE [dbo].[Almacen]  WITH CHECK ADD  CONSTRAINT [FK_Almacen_Productos] FOREIGN KEY([Id])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[Almacen] CHECK CONSTRAINT [FK_Almacen_Productos]
GO

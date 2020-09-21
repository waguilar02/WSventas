USE [master]
GO
/****** Object:  Database [VentasRegistro]    Script Date: 21/09/2020 10:10:29 ******/
CREATE DATABASE [VentasRegistro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VentasRegistro', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\VentasRegistro.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VentasRegistro_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\VentasRegistro_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VentasRegistro] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VentasRegistro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VentasRegistro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VentasRegistro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VentasRegistro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VentasRegistro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VentasRegistro] SET ARITHABORT OFF 
GO
ALTER DATABASE [VentasRegistro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VentasRegistro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VentasRegistro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VentasRegistro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VentasRegistro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VentasRegistro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VentasRegistro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VentasRegistro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VentasRegistro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VentasRegistro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VentasRegistro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VentasRegistro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VentasRegistro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VentasRegistro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VentasRegistro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VentasRegistro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VentasRegistro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VentasRegistro] SET RECOVERY FULL 
GO
ALTER DATABASE [VentasRegistro] SET  MULTI_USER 
GO
ALTER DATABASE [VentasRegistro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VentasRegistro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VentasRegistro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VentasRegistro] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VentasRegistro] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'VentasRegistro', N'ON'
GO
ALTER DATABASE [VentasRegistro] SET QUERY_STORE = OFF
GO
USE [VentasRegistro]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 21/09/2020 10:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Concepto]    Script Date: 21/09/2020 10:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concepto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_venta_orden] [bigint] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precioUnitario] [decimal](16, 2) NOT NULL,
	[importe] [decimal](16, 2) NOT NULL,
	[id_producto] [int] NOT NULL,
 CONSTRAINT [PK_Concepto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OficinaDeVenta]    Script Date: 21/09/2020 10:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OficinaDeVenta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OficinaDeVenta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 21/09/2020 10:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[precioUnitario] [decimal](16, 2) NOT NULL,
	[costo] [decimal](16, 2) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentaOrden]    Script Date: 21/09/2020 10:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentaOrden](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_oficina] [int] NOT NULL,
	[total] [decimal](16, 2) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_VentaOrden] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 
GO
INSERT [dbo].[Cliente] ([id], [nombre]) VALUES (1, N'Cliente A de prueba')
GO
INSERT [dbo].[Cliente] ([id], [nombre]) VALUES (2, N'Cliente B de Prueba')
GO
INSERT [dbo].[Cliente] ([id], [nombre]) VALUES (3, N'Cliente C prueba')
GO
INSERT [dbo].[Cliente] ([id], [nombre]) VALUES (4, N'Cliente D prueba')
GO
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Concepto] ON 
GO
INSERT [dbo].[Concepto] ([id], [id_venta_orden], [cantidad], [precioUnitario], [importe], [id_producto]) VALUES (1, 1, 23, CAST(700.20 AS Decimal(16, 2)), CAST(16104.60 AS Decimal(16, 2)), 2)
GO
INSERT [dbo].[Concepto] ([id], [id_venta_orden], [cantidad], [precioUnitario], [importe], [id_producto]) VALUES (2, 1, 4, CAST(300.00 AS Decimal(16, 2)), CAST(1200.00 AS Decimal(16, 2)), 1)
GO
INSERT [dbo].[Concepto] ([id], [id_venta_orden], [cantidad], [precioUnitario], [importe], [id_producto]) VALUES (3, 1, 6, CAST(300.00 AS Decimal(16, 2)), CAST(1800.00 AS Decimal(16, 2)), 1)
GO
INSERT [dbo].[Concepto] ([id], [id_venta_orden], [cantidad], [precioUnitario], [importe], [id_producto]) VALUES (4, 1, 2, CAST(300.00 AS Decimal(16, 2)), CAST(600.00 AS Decimal(16, 2)), 1)
GO
INSERT [dbo].[Concepto] ([id], [id_venta_orden], [cantidad], [precioUnitario], [importe], [id_producto]) VALUES (5, 1, 1, CAST(300.00 AS Decimal(16, 2)), CAST(300.00 AS Decimal(16, 2)), 1)
GO
INSERT [dbo].[Concepto] ([id], [id_venta_orden], [cantidad], [precioUnitario], [importe], [id_producto]) VALUES (7, 1, 2, CAST(300.00 AS Decimal(16, 2)), CAST(600.00 AS Decimal(16, 2)), 1)
GO
INSERT [dbo].[Concepto] ([id], [id_venta_orden], [cantidad], [precioUnitario], [importe], [id_producto]) VALUES (8, 4, 2, CAST(1600.45 AS Decimal(16, 2)), CAST(3000.90 AS Decimal(16, 2)), 3)
GO
INSERT [dbo].[Concepto] ([id], [id_venta_orden], [cantidad], [precioUnitario], [importe], [id_producto]) VALUES (9, 1, 5, CAST(1500.45 AS Decimal(16, 2)), CAST(7502.25 AS Decimal(16, 2)), 3)
GO
INSERT [dbo].[Concepto] ([id], [id_venta_orden], [cantidad], [precioUnitario], [importe], [id_producto]) VALUES (19, 25, 4, CAST(700.20 AS Decimal(16, 2)), CAST(2800.80 AS Decimal(16, 2)), 2)
GO
INSERT [dbo].[Concepto] ([id], [id_venta_orden], [cantidad], [precioUnitario], [importe], [id_producto]) VALUES (20, 26, 4, CAST(700.20 AS Decimal(16, 2)), CAST(2800.80 AS Decimal(16, 2)), 2)
GO
INSERT [dbo].[Concepto] ([id], [id_venta_orden], [cantidad], [precioUnitario], [importe], [id_producto]) VALUES (21, 26, 3, CAST(300.00 AS Decimal(16, 2)), CAST(900.00 AS Decimal(16, 2)), 1)
GO
INSERT [dbo].[Concepto] ([id], [id_venta_orden], [cantidad], [precioUnitario], [importe], [id_producto]) VALUES (22, 26, 1, CAST(700.20 AS Decimal(16, 2)), CAST(700.20 AS Decimal(16, 2)), 2)
GO
SET IDENTITY_INSERT [dbo].[Concepto] OFF
GO
SET IDENTITY_INSERT [dbo].[OficinaDeVenta] ON 
GO
INSERT [dbo].[OficinaDeVenta] ([id], [nombre]) VALUES (1, N'Bogotá')
GO
INSERT [dbo].[OficinaDeVenta] ([id], [nombre]) VALUES (2, N'Cali')
GO
INSERT [dbo].[OficinaDeVenta] ([id], [nombre]) VALUES (3, N'Medellín')
GO
SET IDENTITY_INSERT [dbo].[OficinaDeVenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 
GO
INSERT [dbo].[Producto] ([id], [nombre], [precioUnitario], [costo]) VALUES (1, N'papitas', CAST(300.00 AS Decimal(16, 2)), CAST(270.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[Producto] ([id], [nombre], [precioUnitario], [costo]) VALUES (2, N'refresco 350cc', CAST(700.20 AS Decimal(16, 2)), CAST(600.20 AS Decimal(16, 2)))
GO
INSERT [dbo].[Producto] ([id], [nombre], [precioUnitario], [costo]) VALUES (3, N'Tomates x 12', CAST(1500.45 AS Decimal(16, 2)), CAST(953.10 AS Decimal(16, 2)))
GO
INSERT [dbo].[Producto] ([id], [nombre], [precioUnitario], [costo]) VALUES (4, N'Cebollas x 6', CAST(2500.34 AS Decimal(16, 2)), CAST(2001.20 AS Decimal(16, 2)))
GO
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[VentaOrden] ON 
GO
INSERT [dbo].[VentaOrden] ([id], [fecha], [id_cliente], [id_oficina], [total], [estado]) VALUES (1, CAST(N'2020-09-19T00:00:00.000' AS DateTime), 1, 1, CAST(88724.85 AS Decimal(16, 2)), 1)
GO
INSERT [dbo].[VentaOrden] ([id], [fecha], [id_cliente], [id_oficina], [total], [estado]) VALUES (2, CAST(N'2020-09-19T00:00:00.000' AS DateTime), 1, 3, CAST(7502.25 AS Decimal(16, 2)), 1)
GO
INSERT [dbo].[VentaOrden] ([id], [fecha], [id_cliente], [id_oficina], [total], [estado]) VALUES (4, CAST(N'2020-09-19T00:00:00.000' AS DateTime), 1, 3, CAST(3000.90 AS Decimal(16, 2)), 1)
GO
INSERT [dbo].[VentaOrden] ([id], [fecha], [id_cliente], [id_oficina], [total], [estado]) VALUES (17, CAST(N'2020-09-20T22:55:43.237' AS DateTime), 2, 2, NULL, 1)
GO
INSERT [dbo].[VentaOrden] ([id], [fecha], [id_cliente], [id_oficina], [total], [estado]) VALUES (18, CAST(N'2020-09-20T22:57:36.657' AS DateTime), 2, 3, NULL, 1)
GO
INSERT [dbo].[VentaOrden] ([id], [fecha], [id_cliente], [id_oficina], [total], [estado]) VALUES (19, CAST(N'2020-09-20T22:58:59.617' AS DateTime), 2, 3, NULL, 1)
GO
INSERT [dbo].[VentaOrden] ([id], [fecha], [id_cliente], [id_oficina], [total], [estado]) VALUES (20, CAST(N'2020-09-20T22:59:38.923' AS DateTime), 2, 3, NULL, 1)
GO
INSERT [dbo].[VentaOrden] ([id], [fecha], [id_cliente], [id_oficina], [total], [estado]) VALUES (21, CAST(N'2020-09-20T22:59:42.443' AS DateTime), 2, 3, NULL, 1)
GO
INSERT [dbo].[VentaOrden] ([id], [fecha], [id_cliente], [id_oficina], [total], [estado]) VALUES (22, CAST(N'2020-09-20T22:59:46.330' AS DateTime), 2, 3, NULL, 1)
GO
INSERT [dbo].[VentaOrden] ([id], [fecha], [id_cliente], [id_oficina], [total], [estado]) VALUES (23, CAST(N'2020-09-20T23:00:26.167' AS DateTime), 2, 3, NULL, 1)
GO
INSERT [dbo].[VentaOrden] ([id], [fecha], [id_cliente], [id_oficina], [total], [estado]) VALUES (24, CAST(N'2020-09-20T23:01:23.913' AS DateTime), 2, 2, NULL, 1)
GO
INSERT [dbo].[VentaOrden] ([id], [fecha], [id_cliente], [id_oficina], [total], [estado]) VALUES (25, CAST(N'2020-09-20T23:06:31.997' AS DateTime), 2, 2, CAST(2800.80 AS Decimal(16, 2)), 1)
GO
INSERT [dbo].[VentaOrden] ([id], [fecha], [id_cliente], [id_oficina], [total], [estado]) VALUES (26, CAST(N'2020-09-20T23:35:24.293' AS DateTime), 2, 3, CAST(4401.00 AS Decimal(16, 2)), 1)
GO
SET IDENTITY_INSERT [dbo].[VentaOrden] OFF
GO
ALTER TABLE [dbo].[Concepto]  WITH CHECK ADD  CONSTRAINT [FK_Concepto_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Producto] ([id])
GO
ALTER TABLE [dbo].[Concepto] CHECK CONSTRAINT [FK_Concepto_Producto]
GO
ALTER TABLE [dbo].[Concepto]  WITH CHECK ADD  CONSTRAINT [FK_Concepto_VentaOrden] FOREIGN KEY([id_venta_orden])
REFERENCES [dbo].[VentaOrden] ([id])
GO
ALTER TABLE [dbo].[Concepto] CHECK CONSTRAINT [FK_Concepto_VentaOrden]
GO
ALTER TABLE [dbo].[VentaOrden]  WITH CHECK ADD  CONSTRAINT [FK_VentaOrden_Cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[VentaOrden] CHECK CONSTRAINT [FK_VentaOrden_Cliente]
GO
ALTER TABLE [dbo].[VentaOrden]  WITH CHECK ADD  CONSTRAINT [FK_VentaOrden_OficinaDeVenta] FOREIGN KEY([id_oficina])
REFERENCES [dbo].[OficinaDeVenta] ([id])
GO
ALTER TABLE [dbo].[VentaOrden] CHECK CONSTRAINT [FK_VentaOrden_OficinaDeVenta]
GO
/****** Object:  StoredProcedure [dbo].[spInsertarConcepto]    Script Date: 21/09/2020 10:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertarConcepto]

@ventaOrden bigint,
@producto int,
@cantidad int



--insert into Concepto(id_venta_orden,id_producto,cantidad,precioUnitario,importe) values (1,2,25,)

AS
BEGIN
	 declare @Punitario decimal (16,2) 
     --validamos si existe el codigo de orden y el cod de producto
	 if((select COUNT(*) from VentaOrden where id=@ventaOrden)>0 and (select COUNT(*) from Producto where id =@producto)>0)
	 begin
		
		
		--extraemos el precio unitario actual para guardarlo en la orden
		select top 1  @Punitario = (precioUnitario) from Producto where id = @producto

	    --insertamos la orden
		insert into Concepto(id_venta_orden,id_producto,cantidad,precioUnitario,importe) 
					values (@ventaOrden,@producto,@cantidad,@Punitario,@Punitario*@cantidad)
					declare @id int = @@identity
					select @id
	 end
	 else
	 begin
		select 0
	 end


END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarVenta]    Script Date: 21/09/2020 10:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertarVenta]
@cliente int,
@oficina int


AS
BEGIN
	
	
	insert into VentaOrden (fecha,id_cliente,id_oficina,estado) values (GETDATE(),@cliente,@oficina,1)
	declare @id bigint = @@IDENTITY
	select @id


END
GO
/****** Object:  Trigger [dbo].[tgRecalcularTotalVenta]    Script Date: 21/09/2020 10:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tgRecalcularTotalVenta]
on [dbo].[Concepto]
FOR insert --update
as
     declare @idVenta int = (select id_venta_orden from inserted)

	update VentaOrden set total = (select sum(Concepto.importe) from Concepto where id_venta_orden = @idVenta )

	     where id=@idVenta


GO
ALTER TABLE [dbo].[Concepto] ENABLE TRIGGER [tgRecalcularTotalVenta]
GO
USE [master]
GO
ALTER DATABASE [VentasRegistro] SET  READ_WRITE 
GO

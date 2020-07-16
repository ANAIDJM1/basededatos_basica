USE [master]
GO
/****** Object:  Database [educandoSA-f]     ******/
CREATE DATABASE [educandoSA-f]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'educandoSA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\educandoSA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'educandoSA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\educandoSA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [educandoSA-f] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [educandoSA-f].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [educandoSA-f] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [educandoSA-f] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [educandoSA-f] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [educandoSA-f] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [educandoSA-f] SET ARITHABORT OFF 
GO
ALTER DATABASE [educandoSA-f] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [educandoSA-f] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [educandoSA-f] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [educandoSA-f] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [educandoSA-f] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [educandoSA-f] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [educandoSA-f] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [educandoSA-f] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [educandoSA-f] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [educandoSA-f] SET  ENABLE_BROKER 
GO
ALTER DATABASE [educandoSA-f] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [educandoSA-f] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [educandoSA-f] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [educandoSA-f] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [educandoSA-f] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [educandoSA-f] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [educandoSA-f] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [educandoSA-f] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [educandoSA-f] SET  MULTI_USER 
GO
ALTER DATABASE [educandoSA-f] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [educandoSA-f] SET DB_CHAINING OFF 
GO
ALTER DATABASE [educandoSA-f] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [educandoSA-f] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [educandoSA-f] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [educandoSA-f] SET QUERY_STORE = OFF
GO
USE [educandoSA-f]
GO
/****** Object:  User [user3]     ******/
CREATE USER [user3] FOR LOGIN [user3] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [user1]     ******/
CREATE USER [user1] FOR LOGIN [user1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [user3]
GO
ALTER ROLE [db_owner] ADD MEMBER [user1]
GO
/****** Object:  Table [dbo].[compra_entrada]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra_entrada](
	[Orden_o_compra] [int] NULL,
	[nro_entrada_almacen] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cotizacion]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cotizacion](
	[nro_solicitud] [int] NOT NULL,
	[proveedor_nombre] [varchar](200) NULL,
	[codigo_bien] [varchar](10) NULL,
	[costo] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[nro_solicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrada_almacen]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrada_almacen](
	[nro_entrada] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[nro_factura] [int] NULL,
	[Proveedor_nombre] [varchar](200) NULL,
	[Total_bienes] [int] NULL,
	[valor_total] [float] NULL,
	[nro_o_compra] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nro_entrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entrada_item]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entrada_item](
	[nro_entrada] [int] NULL,
	[Codigo_universal] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrada_Salida]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrada_Salida](
	[nro_entrada] [int] NULL,
	[nro_salida] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item](
	[Codigo_universal] [varchar](10) NOT NULL,
	[nombre_bien] [varchar](50) NULL,
	[cantidad_solicitada] [int] NULL,
	[cantidad_despachada] [int] NULL,
	[unidad_medida] [varchar](10) NULL,
	[valor_unitario] [float] NULL,
	[valor_total] [float] NULL,
	[proveedor] [varchar](200) NULL,
 CONSTRAINT [IDX_cod_Universal] PRIMARY KEY CLUSTERED 
(
	[Codigo_universal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item_solicitud_c]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_solicitud_c](
	[Codigo_universal] [varchar](10) NULL,
	[nro_solicitud] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item_ubicacion]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item_ubicacion](
	[Codigo_universal] [varchar](10) NULL,
	[Codigo_ubicacion] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orden_compra]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden_compra](
	[nro_o_compra] [int] NOT NULL,
	[nro_orden_c] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nro_o_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orden_contractual]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden_contractual](
	[nro_orden_c] [int] IDENTITY(1,1) NOT NULL,
	[nit] [varchar](50) NULL,
	[nombre_proveedor] [varchar](200) NULL,
	[fecha_orden] [date] NULL,
	[fecha_entrega] [date] NULL,
	[monto_total] [float] NULL,
	[nro_solicitud_cotizacion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nro_orden_c] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salida_almacen]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salida_almacen](
	[nro_salida] [int] IDENTITY(1,1) NOT NULL,
	[responsabe_nombre] [varchar](50) NULL,
	[fecha_salida] [date] NULL,
	[fecha_entrega] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[nro_salida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solicitudes_compra]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitudes_compra](
	[nro_solicitud] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NULL,
	[Responsable_nombre] [varchar](50) NULL,
	[Responsable_cedula] [int] NULL,
	[Centro_costos] [varchar](100) NULL,
	[Rubro_presupuestal] [varchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[nro_solicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubicacion_item_O_bien]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubicacion_item_O_bien](
	[Codigo_ubicacion] [varchar](10) NOT NULL,
	[Responsable_nombre] [varchar](50) NULL,
	[Fecha_entrega] [date] NULL,
	[Direccion] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo_ubicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_nombre]     ******/
CREATE NONCLUSTERED INDEX [IDX_nombre] ON [dbo].[item]
(
	[nombre_bien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[compra_entrada]  WITH CHECK ADD FOREIGN KEY([nro_entrada_almacen])
REFERENCES [dbo].[Entrada_almacen] ([nro_entrada])
GO
ALTER TABLE [dbo].[compra_entrada]  WITH CHECK ADD FOREIGN KEY([Orden_o_compra])
REFERENCES [dbo].[Orden_compra] ([nro_o_compra])
GO
ALTER TABLE [dbo].[Cotizacion]  WITH CHECK ADD FOREIGN KEY([nro_solicitud])
REFERENCES [dbo].[Solicitudes_compra] ([nro_solicitud])
GO
ALTER TABLE [dbo].[entrada_item]  WITH CHECK ADD FOREIGN KEY([Codigo_universal])
REFERENCES [dbo].[item] ([Codigo_universal])
GO
ALTER TABLE [dbo].[entrada_item]  WITH CHECK ADD FOREIGN KEY([nro_entrada])
REFERENCES [dbo].[Entrada_almacen] ([nro_entrada])
GO
ALTER TABLE [dbo].[Entrada_Salida]  WITH CHECK ADD FOREIGN KEY([nro_entrada])
REFERENCES [dbo].[Entrada_almacen] ([nro_entrada])
GO
ALTER TABLE [dbo].[Entrada_Salida]  WITH CHECK ADD FOREIGN KEY([nro_salida])
REFERENCES [dbo].[Salida_almacen] ([nro_salida])
GO
ALTER TABLE [dbo].[Item_solicitud_c]  WITH CHECK ADD FOREIGN KEY([Codigo_universal])
REFERENCES [dbo].[item] ([Codigo_universal])
GO
ALTER TABLE [dbo].[Item_solicitud_c]  WITH CHECK ADD FOREIGN KEY([nro_solicitud])
REFERENCES [dbo].[Solicitudes_compra] ([nro_solicitud])
GO
ALTER TABLE [dbo].[item_ubicacion]  WITH CHECK ADD FOREIGN KEY([Codigo_universal])
REFERENCES [dbo].[item] ([Codigo_universal])
GO
ALTER TABLE [dbo].[item_ubicacion]  WITH CHECK ADD FOREIGN KEY([Codigo_ubicacion])
REFERENCES [dbo].[Ubicacion_item_O_bien] ([Codigo_ubicacion])
GO
ALTER TABLE [dbo].[Orden_compra]  WITH CHECK ADD FOREIGN KEY([nro_orden_c])
REFERENCES [dbo].[Orden_contractual] ([nro_orden_c])
GO
ALTER TABLE [dbo].[Orden_contractual]  WITH CHECK ADD FOREIGN KEY([nro_solicitud_cotizacion])
REFERENCES [dbo].[Cotizacion] ([nro_solicitud])
GO
/****** Object:  StoredProcedure [dbo].[Buscar_item]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Buscar_item]
  @Codigo int 
as
  select nombre_bien,cantidad_solicitada,unidad_medida,valor_unitario,proveedor
  from item
  where Codigo_universal=@Codigo 
GO
/****** Object:  StoredProcedure [dbo].[buscar_Solicitud]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[buscar_Solicitud]
  @No_Solicitud int 
 as
  select Responsable_nombre, Fecha,Centro_costos
    from Solicitudes_compra
   where nro_solicitud= @No_Solicitud;
GO
/****** Object:  StoredProcedure [dbo].[SP_calcula_montos_economicos]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_calcula_montos_economicos]
@monto_a_buscar int
as 
select *from Orden_contractual
where monto_total <= @monto_a_buscar
GO
/****** Object:  StoredProcedure [dbo].[SP_calcularTotal_item]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_calcularTotal_item]
as  
update item set valor_total=valor_unitario*	cantidad_solicitada
GO
/****** Object:  StoredProcedure [dbo].[SP_Eliminar_Solicitud]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Eliminar_Solicitud]
  @No_Solicitud int 
 as
   delete from Solicitudes_compra
   where nro_solicitud= @No_Solicitud;
GO
/****** Object:  StoredProcedure [dbo].[SP_Orden_Conceptual]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Orden_Conceptual]
  @Codigo int 
as
  select nombre_proveedor,fecha_orden,monto_total
  from Orden_contractual
  where nro_orden_c=@Codigo 
GO
USE [master]
GO
ALTER DATABASE [educandoSA-f] SET  READ_WRITE 
GO

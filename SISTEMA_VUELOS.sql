USE [svuelosF]
GO
/****** Object:  Table [dbo].[Aeropuerto] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aeropuerto](
	[CodigoA] [int] NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[ciudad] [varchar](100) NOT NULL,
	[pais] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Avion]   . ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avion](
	[Modelo] [varchar](50) NOT NULL,
	[nro_plazas] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Modelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Escala_tecnica]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Escala_tecnica](
	[nroescala] [int] IDENTITY(1,1) NOT NULL,
	[pais_escala] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nroescala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programa_vuelo]  . ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programa_vuelo](
	[NPVuelo] [int] IDENTITY(1,1) NOT NULL,
	[Linea_Area] [varchar](200) NOT NULL,
	[Dias_Vuelo] [varchar](200) NOT NULL,
	[pais_aterrizaje] [varchar](100) NOT NULL,
	[pais_despeje] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NPVuelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programa_vuelo_Aeropuerto]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programa_vuelo_Aeropuerto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NPVuelo] [int] NOT NULL,
	[CodigoA] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programa_vuelo_escala]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programa_vuelo_escala](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NPVuelo] [int] NOT NULL,
	[nroescala] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programa_vuelo_vuelo]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programa_vuelo_vuelo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NPVuelo] [int] NOT NULL,
	[num_vuelo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vuelo]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vuelo](
	[num_vuelo] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[plazas_vacias] [int] NOT NULL,
	[modelo_avion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[num_vuelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Aeropuerto] ([CodigoA], [nombre], [ciudad], [pais]) VALUES (1, N'jose maria cordiba', N'medellin', N'colombia')
INSERT [dbo].[Aeropuerto] ([CodigoA], [nombre], [ciudad], [pais]) VALUES (2, N'aerper', N'lima', N'peru')
INSERT [dbo].[Aeropuerto] ([CodigoA], [nombre], [ciudad], [pais]) VALUES (3, N'aerecu', N'quito', N'ecuador')
INSERT [dbo].[Aeropuerto] ([CodigoA], [nombre], [ciudad], [pais]) VALUES (4, N'aerbrasil', N'sao pablo', N'brasil')
INSERT [dbo].[Aeropuerto] ([CodigoA], [nombre], [ciudad], [pais]) VALUES (5, N'aermarru', N'yabala', N'marruecos')
GO
INSERT [dbo].[Avion] ([Modelo], [nro_plazas]) VALUES (N'abc1', 234)
INSERT [dbo].[Avion] ([Modelo], [nro_plazas]) VALUES (N'ftq-1', 200)
INSERT [dbo].[Avion] ([Modelo], [nro_plazas]) VALUES (N'ññk-1', 200)
INSERT [dbo].[Avion] ([Modelo], [nro_plazas]) VALUES (N'qwe2', 431)
INSERT [dbo].[Avion] ([Modelo], [nro_plazas]) VALUES (N'zxc', 500)
GO
SET IDENTITY_INSERT [dbo].[Escala_tecnica] ON 

INSERT [dbo].[Escala_tecnica] ([nroescala], [pais_escala]) VALUES (1, N'Peru')
INSERT [dbo].[Escala_tecnica] ([nroescala], [pais_escala]) VALUES (2, N'Ecuador')
INSERT [dbo].[Escala_tecnica] ([nroescala], [pais_escala]) VALUES (3, N'brasil')
INSERT [dbo].[Escala_tecnica] ([nroescala], [pais_escala]) VALUES (4, N'marruecos')
INSERT [dbo].[Escala_tecnica] ([nroescala], [pais_escala]) VALUES (5, N'colombia')
SET IDENTITY_INSERT [dbo].[Escala_tecnica] OFF
GO
SET IDENTITY_INSERT [dbo].[Programa_vuelo] ON 

INSERT [dbo].[Programa_vuelo] ([NPVuelo], [Linea_Area], [Dias_Vuelo], [pais_aterrizaje], [pais_despeje]) VALUES (1, N'latam', N'lu,mi,ju', N'Colombia', N'Peru')
INSERT [dbo].[Programa_vuelo] ([NPVuelo], [Linea_Area], [Dias_Vuelo], [pais_aterrizaje], [pais_despeje]) VALUES (2, N'viva', N'lu,ju,sa', N'Peru', N'Ecuador')
INSERT [dbo].[Programa_vuelo] ([NPVuelo], [Linea_Area], [Dias_Vuelo], [pais_aterrizaje], [pais_despeje]) VALUES (3, N'maza', N'sa,do', N'Ecuador', N'Peru')
INSERT [dbo].[Programa_vuelo] ([NPVuelo], [Linea_Area], [Dias_Vuelo], [pais_aterrizaje], [pais_despeje]) VALUES (4, N'blue', N'ma,mi', N'Colombia', N'Ecuador')
SET IDENTITY_INSERT [dbo].[Programa_vuelo] OFF
GO
SET IDENTITY_INSERT [dbo].[Programa_vuelo_Aeropuerto] ON 

INSERT [dbo].[Programa_vuelo_Aeropuerto] ([id], [NPVuelo], [CodigoA]) VALUES (1, 1, 5)
INSERT [dbo].[Programa_vuelo_Aeropuerto] ([id], [NPVuelo], [CodigoA]) VALUES (2, 2, 1)
INSERT [dbo].[Programa_vuelo_Aeropuerto] ([id], [NPVuelo], [CodigoA]) VALUES (3, 3, 2)
INSERT [dbo].[Programa_vuelo_Aeropuerto] ([id], [NPVuelo], [CodigoA]) VALUES (4, 4, 5)
SET IDENTITY_INSERT [dbo].[Programa_vuelo_Aeropuerto] OFF
GO
SET IDENTITY_INSERT [dbo].[Programa_vuelo_escala] ON 

INSERT [dbo].[Programa_vuelo_escala] ([id], [NPVuelo], [nroescala]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[Programa_vuelo_escala] OFF
GO
SET IDENTITY_INSERT [dbo].[Vuelo] ON 

INSERT [dbo].[Vuelo] ([num_vuelo], [fecha], [plazas_vacias], [modelo_avion]) VALUES (4, CAST(N'2020-02-04' AS Date), 23, N'abc1')
INSERT [dbo].[Vuelo] ([num_vuelo], [fecha], [plazas_vacias], [modelo_avion]) VALUES (5, CAST(N'2020-02-03' AS Date), 34, N'qwe2')
INSERT [dbo].[Vuelo] ([num_vuelo], [fecha], [plazas_vacias], [modelo_avion]) VALUES (6, CAST(N'2020-02-03' AS Date), 24, N'zxc')
INSERT [dbo].[Vuelo] ([num_vuelo], [fecha], [plazas_vacias], [modelo_avion]) VALUES (7, CAST(N'2020-07-12' AS Date), 44, N'ññk-1')
SET IDENTITY_INSERT [dbo].[Vuelo] OFF
GO
ALTER TABLE [dbo].[Programa_vuelo_Aeropuerto]  WITH CHECK ADD FOREIGN KEY([CodigoA])
REFERENCES [dbo].[Aeropuerto] ([CodigoA])
GO
ALTER TABLE [dbo].[Programa_vuelo_Aeropuerto]  WITH CHECK ADD FOREIGN KEY([NPVuelo])
REFERENCES [dbo].[Programa_vuelo] ([NPVuelo])
GO
ALTER TABLE [dbo].[Programa_vuelo_escala]  WITH CHECK ADD FOREIGN KEY([NPVuelo])
REFERENCES [dbo].[Programa_vuelo] ([NPVuelo])
GO
ALTER TABLE [dbo].[Programa_vuelo_escala]  WITH CHECK ADD FOREIGN KEY([nroescala])
REFERENCES [dbo].[Escala_tecnica] ([nroescala])
GO
ALTER TABLE [dbo].[Programa_vuelo_vuelo]  WITH CHECK ADD FOREIGN KEY([NPVuelo])
REFERENCES [dbo].[Programa_vuelo] ([NPVuelo])
GO
ALTER TABLE [dbo].[Programa_vuelo_vuelo]  WITH CHECK ADD FOREIGN KEY([num_vuelo])
REFERENCES [dbo].[Vuelo] ([num_vuelo])
GO
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD FOREIGN KEY([modelo_avion])
REFERENCES [dbo].[Avion] ([Modelo])
GO
/****** Object:  StoredProcedure [dbo].[SP_actualizarpuestos_Vuelo]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_actualizarpuestos_Vuelo]
@puestos_vacios int,
@en_vuelo varchar(23)
as  
update Vuelo set plazas_vacias=@puestos_vacios where num_vuelo=@en_vuelo
GO
/****** Object:  StoredProcedure [dbo].[SP_buscar_Aeropuerto]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_buscar_Aeropuerto]
  @No_Aeropuerto int 
 as
  select *
    from Aeropuerto
   where CodigoA= @No_Aeropuerto;
GO
/****** Object:  StoredProcedure [dbo].[SP_buscar_Vuelo]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_buscar_Vuelo]
  @No_vuelo varchar(50) 
 as
  select *
    from Vuelo
   where num_vuelo= @No_vuelo
GO
/****** Object:  StoredProcedure [dbo].[SP_Eliminar_Programa_vuelo]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Eliminar_Programa_vuelo]
  @No_programa int 
 as
   delete from Programa_vuelo
   where NPVuelo= @No_programa;
GO

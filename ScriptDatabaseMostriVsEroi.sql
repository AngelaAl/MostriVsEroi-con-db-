USE [master]
GO
/****** Object:  Database [MostriVsEroi]    Script Date: 19/03/2021 15:23:53 ******/
CREATE DATABASE [MostriVsEroi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MostriVsEroi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MostriVsEroi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MostriVsEroi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MostriVsEroi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MostriVsEroi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MostriVsEroi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MostriVsEroi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MostriVsEroi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MostriVsEroi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MostriVsEroi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MostriVsEroi] SET ARITHABORT OFF 
GO
ALTER DATABASE [MostriVsEroi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MostriVsEroi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MostriVsEroi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MostriVsEroi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MostriVsEroi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MostriVsEroi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MostriVsEroi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MostriVsEroi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MostriVsEroi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MostriVsEroi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MostriVsEroi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MostriVsEroi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MostriVsEroi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MostriVsEroi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MostriVsEroi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MostriVsEroi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MostriVsEroi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MostriVsEroi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MostriVsEroi] SET  MULTI_USER 
GO
ALTER DATABASE [MostriVsEroi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MostriVsEroi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MostriVsEroi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MostriVsEroi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MostriVsEroi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MostriVsEroi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MostriVsEroi] SET QUERY_STORE = OFF
GO
USE [MostriVsEroi]
GO
/****** Object:  Table [dbo].[Armi]    Script Date: 19/03/2021 15:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Armi](
	[NomeArma] [varchar](255) NOT NULL,
	[PuntiDanno] [int] NOT NULL,
	[Classe] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[NomeArma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mostri]    Script Date: 19/03/2021 15:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mostri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NomeMostro] [varchar](255) NULL,
	[Classe] [varchar](255) NULL,
	[Arma] [varchar](255) NULL,
	[Livello] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MostriConPuntiDanno]    Script Date: 19/03/2021 15:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MostriConPuntiDanno] (ID,NomeMostro, Classe, Arma, Livello, PuntiDanno)
AS SELECT Mostri.*, Armi.PuntiDanno
FROM Mostri, Armi
WHERE Mostri.Arma = Armi.NomeArma
GO
/****** Object:  Table [dbo].[Livelli]    Script Date: 19/03/2021 15:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Livelli](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PuntiVita] [int] NOT NULL,
	[PuntiPerPassaggio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MostriConPuntiDannoEPuntiVita]    Script Date: 19/03/2021 15:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MostriConPuntiDannoEPuntiVita] (ID, NomeMostro, Classe, Arma, Livello, PuntiDanno, PuntiVita)
AS SELECT Mostri.ID, Mostri.NomeMostro, Mostri.Classe, Mostri.Arma, Mostri.Livello,
Armi.PuntiDanno,
Livelli.PuntiVita
FROM Mostri
INNER JOIN Armi
ON Mostri.Arma = Armi.NomeArma
INNER JOIN Livelli
ON Livelli.ID = Mostri.Livello
GO
/****** Object:  Table [dbo].[Statistiche]    Script Date: 19/03/2021 15:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statistiche](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NomeEroe] [varchar](255) NULL,
	[TempoTotaleGioco] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Eroi]    Script Date: 19/03/2021 15:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eroi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NomeEroe] [varchar](255) NULL,
	[Classe] [varchar](255) NULL,
	[Arma] [varchar](255) NULL,
	[Livello] [int] NOT NULL,
	[PuntiVita] [int] NOT NULL,
	[PuntiAccumulati] [int] NOT NULL,
	[NomeGiocatore] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StatistichePuntiAccumulatiGiocatore]    Script Date: 19/03/2021 15:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StatistichePuntiAccumulatiGiocatore] (ID, NomeEroe, TempoTotaleGioco, PuntiAccumulati, NomeGiocatore)
AS SELECT Statistiche.*, Eroi.PuntiAccumulati, Eroi.NomeGiocatore
FROM Statistiche, Eroi
WHERE Statistiche.NomeEroe = Eroi.NomeEroe
GO
/****** Object:  View [dbo].[EroiConPuntiDanno]    Script Date: 19/03/2021 15:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EroiConPuntiDanno] (ID, NomeEroe, Classe, Arma, Livello, PuntiVita, PuntiAccumulati, NomeGiocatore, PuntiDanno)
AS SELECT Eroi.*, Armi.PuntiDanno
FROM Eroi, Armi
WHERE Eroi.Arma = Armi.NomeArma
GO
/****** Object:  Table [dbo].[Classi]    Script Date: 19/03/2021 15:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classi](
	[Nome] [varchar](255) NOT NULL,
	[Eroe] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Giocatori]    Script Date: 19/03/2021 15:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Giocatori](
	[NomeGiocatore] [varchar](255) NOT NULL,
	[Ruolo] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NomeGiocatore] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Alabarda', 15, N'Guerriero')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Alabarda Del Drago', 30, N'Signore Del Male')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Arco', 7, N'Orco')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Arco e frecce', 8, N'Mago')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Ascia', 8, N'Guerriero')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Bacchetta', 5, N'Mago')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Bastone Magico', 10, N'Mago')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Clava', 5, N'Orco')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Discorso Noioso', 4, N'Cultista')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Divinazione', 15, N'Signore Del Male')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Farneticazione', 7, N'Cultista')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Fulmine', 10, N'Signore Del Male')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Fulmine Celeste', 15, N'Signore Del Male')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Imprecazione', 5, N'Cultista')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Magia Nera', 3, N'Cultista')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Mazza', 5, N'Guerriero')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Mazza Chiodata', 10, N'Orco')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Onda d''urto', 15, N'Mago')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Pugnali', 5, N'Mago')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Spada', 10, N'Guerriero')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Spada rotta', 3, N'Orco')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Spadone', 15, N'Guerriero')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Tempesta', 8, N'Signore Del Male')
INSERT [dbo].[Armi] ([NomeArma], [PuntiDanno], [Classe]) VALUES (N'Tempesta Oscura', 15, N'Signore Del Male')
GO
INSERT [dbo].[Classi] ([Nome], [Eroe]) VALUES (N'Cultista', 0)
INSERT [dbo].[Classi] ([Nome], [Eroe]) VALUES (N'Guerriero', 1)
INSERT [dbo].[Classi] ([Nome], [Eroe]) VALUES (N'Mago', 1)
INSERT [dbo].[Classi] ([Nome], [Eroe]) VALUES (N'Orco', 0)
INSERT [dbo].[Classi] ([Nome], [Eroe]) VALUES (N'Signore Del Male', 0)
GO
SET IDENTITY_INSERT [dbo].[Eroi] ON 

INSERT [dbo].[Eroi] ([ID], [NomeEroe], [Classe], [Arma], [Livello], [PuntiVita], [PuntiAccumulati], [NomeGiocatore]) VALUES (24, N'Lancillotto', N'Guerriero', N'Alabarda', 2, 24, 40, N'Angela')
SET IDENTITY_INSERT [dbo].[Eroi] OFF
GO
INSERT [dbo].[Giocatori] ([NomeGiocatore], [Ruolo]) VALUES (N'Angela', N'Admin')
GO
SET IDENTITY_INSERT [dbo].[Livelli] ON 

INSERT [dbo].[Livelli] ([ID], [PuntiVita], [PuntiPerPassaggio]) VALUES (1, 20, 0)
INSERT [dbo].[Livelli] ([ID], [PuntiVita], [PuntiPerPassaggio]) VALUES (2, 40, 30)
INSERT [dbo].[Livelli] ([ID], [PuntiVita], [PuntiPerPassaggio]) VALUES (3, 60, 60)
INSERT [dbo].[Livelli] ([ID], [PuntiVita], [PuntiPerPassaggio]) VALUES (4, 80, 90)
INSERT [dbo].[Livelli] ([ID], [PuntiVita], [PuntiPerPassaggio]) VALUES (5, 100, 120)
SET IDENTITY_INSERT [dbo].[Livelli] OFF
GO
SET IDENTITY_INSERT [dbo].[Mostri] ON 

INSERT [dbo].[Mostri] ([ID], [NomeMostro], [Classe], [Arma], [Livello]) VALUES (1, N'Non Morto', N'Cultista', N'Magia Nera', 1)
INSERT [dbo].[Mostri] ([ID], [NomeMostro], [Classe], [Arma], [Livello]) VALUES (2, N'Zuru', N'Orco', N'Clava', 2)
INSERT [dbo].[Mostri] ([ID], [NomeMostro], [Classe], [Arma], [Livello]) VALUES (3, N'Reietto', N'Cultista', N'Discorso Noioso', 2)
INSERT [dbo].[Mostri] ([ID], [NomeMostro], [Classe], [Arma], [Livello]) VALUES (4, N'Incappucciato', N'Cultista', N'Farneticazione', 2)
INSERT [dbo].[Mostri] ([ID], [NomeMostro], [Classe], [Arma], [Livello]) VALUES (5, N'Eremitas', N'Cultista', N'Imprecazione', 1)
INSERT [dbo].[Mostri] ([ID], [NomeMostro], [Classe], [Arma], [Livello]) VALUES (6, N'Arturus', N'Cultista', N'Imprecazione', 2)
INSERT [dbo].[Mostri] ([ID], [NomeMostro], [Classe], [Arma], [Livello]) VALUES (7, N'Brutus', N'Orco', N'Spada rotta', 1)
INSERT [dbo].[Mostri] ([ID], [NomeMostro], [Classe], [Arma], [Livello]) VALUES (8, N'Moclas', N'Orco', N'Mazza Chiodata', 3)
INSERT [dbo].[Mostri] ([ID], [NomeMostro], [Classe], [Arma], [Livello]) VALUES (9, N'Natel', N'Orco', N'Arco', 2)
INSERT [dbo].[Mostri] ([ID], [NomeMostro], [Classe], [Arma], [Livello]) VALUES (10, N'Ertim', N'Orco', N'Arco', 3)
INSERT [dbo].[Mostri] ([ID], [NomeMostro], [Classe], [Arma], [Livello]) VALUES (11, N'Mago Supremo', N'Signore Del Male', N'Divinazione', 5)
INSERT [dbo].[Mostri] ([ID], [NomeMostro], [Classe], [Arma], [Livello]) VALUES (12, N'Intecus', N'Signore Del Male', N'Tempesta Oscura', 5)
INSERT [dbo].[Mostri] ([ID], [NomeMostro], [Classe], [Arma], [Livello]) VALUES (13, N'Iposter', N'Signore Del Male', N'Fulmine Celeste', 5)
INSERT [dbo].[Mostri] ([ID], [NomeMostro], [Classe], [Arma], [Livello]) VALUES (14, N'Dannato', N'Signore Del Male', N'Alabarda Del Drago', 5)
INSERT [dbo].[Mostri] ([ID], [NomeMostro], [Classe], [Arma], [Livello]) VALUES (15, N'Apprendista', N'Signore Del Male', N'Tempesta', 4)
INSERT [dbo].[Mostri] ([ID], [NomeMostro], [Classe], [Arma], [Livello]) VALUES (16, N'Antino', N'Signore Del Male', N'Fulmine', 4)
INSERT [dbo].[Mostri] ([ID], [NomeMostro], [Classe], [Arma], [Livello]) VALUES (17, N'Shrek', N'Orco', N'Mazza Chiodata', 4)
SET IDENTITY_INSERT [dbo].[Mostri] OFF
GO
SET IDENTITY_INSERT [dbo].[Statistiche] ON 

INSERT [dbo].[Statistiche] ([ID], [NomeEroe], [TempoTotaleGioco]) VALUES (22, N'Lancillotto', 190805)
SET IDENTITY_INSERT [dbo].[Statistiche] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Eroi__87430EFABD947578]    Script Date: 19/03/2021 15:23:54 ******/
ALTER TABLE [dbo].[Eroi] ADD UNIQUE NONCLUSTERED 
(
	[NomeEroe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Armi]  WITH CHECK ADD FOREIGN KEY([Classe])
REFERENCES [dbo].[Classi] ([Nome])
GO
ALTER TABLE [dbo].[Eroi]  WITH CHECK ADD FOREIGN KEY([Arma])
REFERENCES [dbo].[Armi] ([NomeArma])
GO
ALTER TABLE [dbo].[Eroi]  WITH CHECK ADD FOREIGN KEY([Classe])
REFERENCES [dbo].[Classi] ([Nome])
GO
ALTER TABLE [dbo].[Eroi]  WITH CHECK ADD FOREIGN KEY([Livello])
REFERENCES [dbo].[Livelli] ([ID])
GO
ALTER TABLE [dbo].[Eroi]  WITH CHECK ADD FOREIGN KEY([NomeGiocatore])
REFERENCES [dbo].[Giocatori] ([NomeGiocatore])
GO
ALTER TABLE [dbo].[Mostri]  WITH CHECK ADD FOREIGN KEY([Arma])
REFERENCES [dbo].[Armi] ([NomeArma])
GO
ALTER TABLE [dbo].[Mostri]  WITH CHECK ADD FOREIGN KEY([Classe])
REFERENCES [dbo].[Classi] ([Nome])
GO
ALTER TABLE [dbo].[Mostri]  WITH CHECK ADD FOREIGN KEY([Livello])
REFERENCES [dbo].[Livelli] ([ID])
GO
ALTER TABLE [dbo].[Statistiche]  WITH CHECK ADD FOREIGN KEY([NomeEroe])
REFERENCES [dbo].[Eroi] ([NomeEroe])
GO
USE [master]
GO
ALTER DATABASE [MostriVsEroi] SET  READ_WRITE 
GO

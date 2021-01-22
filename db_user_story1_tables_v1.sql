USE [pandamidb]
GO
ALTER TABLE [dbo].[utilisateur] DROP CONSTRAINT [FK_utilisateur_ville]
GO
ALTER TABLE [dbo].[utilisateur] DROP CONSTRAINT [FK_utilisateur_motif_desinscription]
GO
ALTER TABLE [dbo].[utilisateur] DROP CONSTRAINT [FK_utilisateur_genre]
GO
ALTER TABLE [dbo].[type_service] DROP CONSTRAINT [FK_type_service_categorie]
GO
ALTER TABLE [dbo].[equipement_type_service] DROP CONSTRAINT [FK_equipement_type_service_type_service]
GO
ALTER TABLE [dbo].[equipement_type_service] DROP CONSTRAINT [FK_equipement_type_service_equipement]
GO
ALTER TABLE [dbo].[equipement_demande] DROP CONSTRAINT [FK_equipement_demande_equipement]
GO
ALTER TABLE [dbo].[equipement_demande] DROP CONSTRAINT [FK_equipement_demande_demande_service]
GO
ALTER TABLE [dbo].[demande_service] DROP CONSTRAINT [FK_demande_service_ville]
GO
ALTER TABLE [dbo].[demande_service] DROP CONSTRAINT [FK_demande_service_utilisateur]
GO
ALTER TABLE [dbo].[demande_service] DROP CONSTRAINT [FK_demande_service_type_service]
GO
/****** Object:  Table [dbo].[ville]    Script Date: 21/01/2021 11:39:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ville]') AND type in (N'U'))
DROP TABLE [dbo].[ville]
GO
/****** Object:  Table [dbo].[utilisateur]    Script Date: 21/01/2021 11:39:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[utilisateur]') AND type in (N'U'))
DROP TABLE [dbo].[utilisateur]
GO
/****** Object:  Table [dbo].[type_service]    Script Date: 21/01/2021 11:39:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[type_service]') AND type in (N'U'))
DROP TABLE [dbo].[type_service]
GO
/****** Object:  Table [dbo].[motif_desinscription]    Script Date: 21/01/2021 11:39:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[motif_desinscription]') AND type in (N'U'))
DROP TABLE [dbo].[motif_desinscription]
GO
/****** Object:  Table [dbo].[genre]    Script Date: 21/01/2021 11:39:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[genre]') AND type in (N'U'))
DROP TABLE [dbo].[genre]
GO
/****** Object:  Table [dbo].[equipement_type_service]    Script Date: 21/01/2021 11:39:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[equipement_type_service]') AND type in (N'U'))
DROP TABLE [dbo].[equipement_type_service]
GO
/****** Object:  Table [dbo].[equipement_demande]    Script Date: 21/01/2021 11:39:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[equipement_demande]') AND type in (N'U'))
DROP TABLE [dbo].[equipement_demande]
GO
/****** Object:  Table [dbo].[equipement]    Script Date: 21/01/2021 11:39:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[equipement]') AND type in (N'U'))
DROP TABLE [dbo].[equipement]
GO
/****** Object:  Table [dbo].[demande_service]    Script Date: 21/01/2021 11:39:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[demande_service]') AND type in (N'U'))
DROP TABLE [dbo].[demande_service]
GO
/****** Object:  Table [dbo].[categorie]    Script Date: 21/01/2021 11:39:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[categorie]') AND type in (N'U'))
DROP TABLE [dbo].[categorie]
GO
USE [master]
GO
/****** Object:  Database [pandamidb]    Script Date: 21/01/2021 11:39:59 ******/
DROP DATABASE [pandamidb]
GO
/****** Object:  Database [pandamidb]    Script Date: 21/01/2021 11:39:59 ******/
CREATE DATABASE [pandamidb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pandamidb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\pandamidb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pandamidb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\pandamidb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [pandamidb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pandamidb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pandamidb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pandamidb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pandamidb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pandamidb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pandamidb] SET ARITHABORT OFF 
GO
ALTER DATABASE [pandamidb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pandamidb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pandamidb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pandamidb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pandamidb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pandamidb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pandamidb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pandamidb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pandamidb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pandamidb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pandamidb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pandamidb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pandamidb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pandamidb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pandamidb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pandamidb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pandamidb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pandamidb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [pandamidb] SET  MULTI_USER 
GO
ALTER DATABASE [pandamidb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pandamidb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pandamidb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pandamidb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pandamidb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pandamidb] SET QUERY_STORE = OFF
GO
USE [pandamidb]
GO
/****** Object:  Table [dbo].[categorie]    Script Date: 21/01/2021 11:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorie](
	[id_categorie] [int] IDENTITY(1,1) NOT NULL,
	[libelle_categorie] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_categorie] PRIMARY KEY CLUSTERED 
(
	[id_categorie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[demande_service]    Script Date: 21/01/2021 11:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[demande_service](
	[id_demande] [int] IDENTITY(1,1) NOT NULL,
	[id_emetteur] [int] NOT NULL,
	[date_enregistrement] [date] NOT NULL,
	[date_realisation] [date] NOT NULL,
	[adresse_realisation] [nvarchar](70) NULL,
	[id_ville] [int] NULL,
	[heure_realisation] [time](7) NOT NULL,
	[id_type_service] [int] NOT NULL,
	[date_annulation] [date] NULL,
	[date_cloture] [date] NULL,
	[date_non_finalisation] [date] NULL,
	[id_motif_annulation] [int] NULL,
 CONSTRAINT [PK_demande_service] PRIMARY KEY CLUSTERED 
(
	[id_demande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equipement]    Script Date: 21/01/2021 11:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipement](
	[id_equipement] [int] IDENTITY(1,1) NOT NULL,
	[libelle_equipement] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_equipement] PRIMARY KEY CLUSTERED 
(
	[id_equipement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equipement_demande]    Script Date: 21/01/2021 11:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipement_demande](
	[id_equipement] [int] NOT NULL,
	[id_demande] [int] NOT NULL,
 CONSTRAINT [PK_equipement_demande] PRIMARY KEY CLUSTERED 
(
	[id_equipement] ASC,
	[id_demande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equipement_type_service]    Script Date: 21/01/2021 11:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipement_type_service](
	[id_equipement] [int] NOT NULL,
	[id_type_service] [int] NOT NULL,
 CONSTRAINT [PK_equipement_type_service] PRIMARY KEY CLUSTERED 
(
	[id_equipement] ASC,
	[id_type_service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genre]    Script Date: 21/01/2021 11:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genre](
	[id_genre] [int] IDENTITY(1,1) NOT NULL,
	[libelle_genre] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_genre] PRIMARY KEY CLUSTERED 
(
	[id_genre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[motif_desinscription]    Script Date: 21/01/2021 11:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[motif_desinscription](
	[id_motif] [int] IDENTITY(1,1) NOT NULL,
	[libelle_motif] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_motif_desinscription] PRIMARY KEY CLUSTERED 
(
	[id_motif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_service]    Script Date: 21/01/2021 11:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_service](
	[id_type_service] [int] IDENTITY(1,1) NOT NULL,
	[libelle_type_service] [nvarchar](50) NOT NULL,
	[id_categorie] [int] NOT NULL,
 CONSTRAINT [PK_type_service] PRIMARY KEY CLUSTERED 
(
	[id_type_service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[utilisateur]    Script Date: 21/01/2021 11:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[utilisateur](
	[id_utilisateur] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](30) NOT NULL,
	[prenom] [nvarchar](30) NOT NULL,
	[id_genre] [int] NOT NULL,
	[date_naissance] [date] NOT NULL,
	[adresse] [nvarchar](70) NOT NULL,
	[id_ville] [int] NOT NULL,
	[num_telephone] [nchar](10) NOT NULL,
	[email] [nvarchar](50) NULL,
	[date_inscription] [date] NOT NULL,
	[date_desinscription] [date] NULL,
	[id_motif_desinscription] [int] NULL,
 CONSTRAINT [PK_utilisateur] PRIMARY KEY CLUSTERED 
(
	[id_utilisateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ville]    Script Date: 21/01/2021 11:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ville](
	[id_ville] [int] IDENTITY(1,1) NOT NULL,
	[libelle_ville] [nvarchar](100) NOT NULL,
	[code_postal] [nchar](5) NOT NULL,
 CONSTRAINT [PK_ville] PRIMARY KEY CLUSTERED 
(
	[id_ville] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[demande_service]  WITH CHECK ADD  CONSTRAINT [FK_demande_service_type_service] FOREIGN KEY([id_type_service])
REFERENCES [dbo].[type_service] ([id_type_service])
GO
ALTER TABLE [dbo].[demande_service] CHECK CONSTRAINT [FK_demande_service_type_service]
GO
ALTER TABLE [dbo].[demande_service]  WITH CHECK ADD  CONSTRAINT [FK_demande_service_utilisateur] FOREIGN KEY([id_emetteur])
REFERENCES [dbo].[utilisateur] ([id_utilisateur])
GO
ALTER TABLE [dbo].[demande_service] CHECK CONSTRAINT [FK_demande_service_utilisateur]
GO
ALTER TABLE [dbo].[demande_service]  WITH CHECK ADD  CONSTRAINT [FK_demande_service_ville] FOREIGN KEY([id_ville])
REFERENCES [dbo].[ville] ([id_ville])
GO
ALTER TABLE [dbo].[demande_service] CHECK CONSTRAINT [FK_demande_service_ville]
GO
ALTER TABLE [dbo].[equipement_demande]  WITH CHECK ADD  CONSTRAINT [FK_equipement_demande_demande_service] FOREIGN KEY([id_demande])
REFERENCES [dbo].[demande_service] ([id_demande])
GO
ALTER TABLE [dbo].[equipement_demande] CHECK CONSTRAINT [FK_equipement_demande_demande_service]
GO
ALTER TABLE [dbo].[equipement_demande]  WITH CHECK ADD  CONSTRAINT [FK_equipement_demande_equipement] FOREIGN KEY([id_equipement])
REFERENCES [dbo].[equipement] ([id_equipement])
GO
ALTER TABLE [dbo].[equipement_demande] CHECK CONSTRAINT [FK_equipement_demande_equipement]
GO
ALTER TABLE [dbo].[equipement_type_service]  WITH CHECK ADD  CONSTRAINT [FK_equipement_type_service_equipement] FOREIGN KEY([id_equipement])
REFERENCES [dbo].[equipement] ([id_equipement])
GO
ALTER TABLE [dbo].[equipement_type_service] CHECK CONSTRAINT [FK_equipement_type_service_equipement]
GO
ALTER TABLE [dbo].[equipement_type_service]  WITH CHECK ADD  CONSTRAINT [FK_equipement_type_service_type_service] FOREIGN KEY([id_type_service])
REFERENCES [dbo].[type_service] ([id_type_service])
GO
ALTER TABLE [dbo].[equipement_type_service] CHECK CONSTRAINT [FK_equipement_type_service_type_service]
GO
ALTER TABLE [dbo].[type_service]  WITH CHECK ADD  CONSTRAINT [FK_type_service_categorie] FOREIGN KEY([id_categorie])
REFERENCES [dbo].[categorie] ([id_categorie])
GO
ALTER TABLE [dbo].[type_service] CHECK CONSTRAINT [FK_type_service_categorie]
GO
ALTER TABLE [dbo].[utilisateur]  WITH CHECK ADD  CONSTRAINT [FK_utilisateur_genre] FOREIGN KEY([id_genre])
REFERENCES [dbo].[genre] ([id_genre])
GO
ALTER TABLE [dbo].[utilisateur] CHECK CONSTRAINT [FK_utilisateur_genre]
GO
ALTER TABLE [dbo].[utilisateur]  WITH CHECK ADD  CONSTRAINT [FK_utilisateur_motif_desinscription] FOREIGN KEY([id_motif_desinscription])
REFERENCES [dbo].[motif_desinscription] ([id_motif])
GO
ALTER TABLE [dbo].[utilisateur] CHECK CONSTRAINT [FK_utilisateur_motif_desinscription]
GO
ALTER TABLE [dbo].[utilisateur]  WITH CHECK ADD  CONSTRAINT [FK_utilisateur_ville] FOREIGN KEY([id_ville])
REFERENCES [dbo].[ville] ([id_ville])
GO
ALTER TABLE [dbo].[utilisateur] CHECK CONSTRAINT [FK_utilisateur_ville]
GO
USE [master]
GO
ALTER DATABASE [pandamidb] SET  READ_WRITE 
GO

/* 
	Ce script permet de créer les tables nécessaires à la user story 1. 
	Il ne doit être utilisé que si la base de données est vide et ne comporte aucune table.
	Version 2 (BM - 21.01.2021)
*/


USE [pandamidb]
GO
/****** Object:  Table [dbo].[categorie]    Script Date: 21/01/2021 14:45:23 ******/
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
/****** Object:  Table [dbo].[demande_service]    Script Date: 21/01/2021 14:45:23 ******/
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
/****** Object:  Table [dbo].[equipement]    Script Date: 21/01/2021 14:45:23 ******/
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
/****** Object:  Table [dbo].[equipement_demande]    Script Date: 21/01/2021 14:45:23 ******/
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
/****** Object:  Table [dbo].[equipement_type_service]    Script Date: 21/01/2021 14:45:23 ******/
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
/****** Object:  Table [dbo].[genre]    Script Date: 21/01/2021 14:45:23 ******/
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
/****** Object:  Table [dbo].[motif_desinscription]    Script Date: 21/01/2021 14:45:23 ******/
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
/****** Object:  Table [dbo].[type_service]    Script Date: 21/01/2021 14:45:23 ******/
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
/****** Object:  Table [dbo].[utilisateur]    Script Date: 21/01/2021 14:45:23 ******/
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
/****** Object:  Table [dbo].[ville]    Script Date: 21/01/2021 14:45:23 ******/
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

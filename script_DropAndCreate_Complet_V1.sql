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
ALTER TABLE [dbo].[reponse] DROP CONSTRAINT [FK_reponse_utilisateur]
GO
ALTER TABLE [dbo].[reponse] DROP CONSTRAINT [FK_reponse_demande_service]
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
/****** Object:  Table [dbo].[ville]    Script Date: 27/01/2021 16:15:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ville]') AND type in (N'U'))
DROP TABLE [dbo].[ville]
GO
/****** Object:  Table [dbo].[utilisateur]    Script Date: 27/01/2021 16:15:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[utilisateur]') AND type in (N'U'))
DROP TABLE [dbo].[utilisateur]
GO
/****** Object:  Table [dbo].[type_service]    Script Date: 27/01/2021 16:15:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[type_service]') AND type in (N'U'))
DROP TABLE [dbo].[type_service]
GO
/****** Object:  Table [dbo].[reponse]    Script Date: 27/01/2021 16:15:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[reponse]') AND type in (N'U'))
DROP TABLE [dbo].[reponse]
GO
/****** Object:  Table [dbo].[motif_desinscription]    Script Date: 27/01/2021 16:15:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[motif_desinscription]') AND type in (N'U'))
DROP TABLE [dbo].[motif_desinscription]
GO
/****** Object:  Table [dbo].[genre]    Script Date: 27/01/2021 16:15:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[genre]') AND type in (N'U'))
DROP TABLE [dbo].[genre]
GO
/****** Object:  Table [dbo].[equipement_type_service]    Script Date: 27/01/2021 16:15:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[equipement_type_service]') AND type in (N'U'))
DROP TABLE [dbo].[equipement_type_service]
GO
/****** Object:  Table [dbo].[equipement_demande]    Script Date: 27/01/2021 16:15:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[equipement_demande]') AND type in (N'U'))
DROP TABLE [dbo].[equipement_demande]
GO
/****** Object:  Table [dbo].[equipement]    Script Date: 27/01/2021 16:15:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[equipement]') AND type in (N'U'))
DROP TABLE [dbo].[equipement]
GO
/****** Object:  Table [dbo].[demande_service]    Script Date: 27/01/2021 16:15:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[demande_service]') AND type in (N'U'))
DROP TABLE [dbo].[demande_service]
GO
/****** Object:  Table [dbo].[categorie]    Script Date: 27/01/2021 16:15:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[categorie]') AND type in (N'U'))
DROP TABLE [dbo].[categorie]
GO
/****** Object:  Table [dbo].[categorie]    Script Date: 27/01/2021 16:15:15 ******/
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
/****** Object:  Table [dbo].[demande_service]    Script Date: 27/01/2021 16:15:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[demande_service](
	[id_demande] [int] IDENTITY(1,1) NOT NULL,
	[id_emetteur] [int] NOT NULL,
	[date_enregistrement] [datetime] NOT NULL,
	[date_realisation] [datetime] NOT NULL,
	[adresse_realisation] [nvarchar](70) NULL,
	[id_ville] [int] NULL,
	[id_type_service] [int] NOT NULL,
	[date_annulation] [date] NULL,
	[date_cloture] [datetime] NULL,
	[date_non_finalisation] [datetime] NULL,
	[id_motif_annulation] [int] NULL,
 CONSTRAINT [PK_demande_service] PRIMARY KEY CLUSTERED 
(
	[id_demande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equipement]    Script Date: 27/01/2021 16:15:15 ******/
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
/****** Object:  Table [dbo].[equipement_demande]    Script Date: 27/01/2021 16:15:15 ******/
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
/****** Object:  Table [dbo].[equipement_type_service]    Script Date: 27/01/2021 16:15:15 ******/
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
/****** Object:  Table [dbo].[genre]    Script Date: 27/01/2021 16:15:15 ******/
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
/****** Object:  Table [dbo].[motif_desinscription]    Script Date: 27/01/2021 16:15:15 ******/
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
/****** Object:  Table [dbo].[reponse]    Script Date: 27/01/2021 16:15:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reponse](
	[id_reponse] [int] IDENTITY(1,1) NOT NULL,
	[id_utilisateur] [int] NOT NULL,
	[id_demande] [int] NOT NULL,
	[date_reponse] [datetime] NOT NULL,
	[date_acceptation] [datetime] NULL,
	[date_refus] [datetime] NULL,
	[date_annulation_participation] [datetime] NULL,
 CONSTRAINT [PK_reponse] PRIMARY KEY CLUSTERED 
(
	[id_reponse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_service]    Script Date: 27/01/2021 16:15:15 ******/
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
/****** Object:  Table [dbo].[utilisateur]    Script Date: 27/01/2021 16:15:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[utilisateur](
	[id_utilisateur] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](30) NOT NULL,
	[prenom] [nvarchar](30) NOT NULL,
	[id_genre] [int] NOT NULL,
	[date_naissance] [datetime] NOT NULL,
	[adresse] [nvarchar](70) NOT NULL,
	[id_ville] [int] NOT NULL,
	[num_telephone] [nchar](10) NOT NULL,
	[email] [nvarchar](50) NULL,
	[date_inscription] [datetime] NOT NULL,
	[date_desinscription] [datetime] NULL,
	[id_motif_desinscription] [int] NULL,
 CONSTRAINT [PK_utilisateur] PRIMARY KEY CLUSTERED 
(
	[id_utilisateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ville]    Script Date: 27/01/2021 16:15:15 ******/
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
SET IDENTITY_INSERT [dbo].[categorie] ON 

INSERT [dbo].[categorie] ([id_categorie], [libelle_categorie]) VALUES (1, N'extérieur')
INSERT [dbo].[categorie] ([id_categorie], [libelle_categorie]) VALUES (2, N'intérieur')
SET IDENTITY_INSERT [dbo].[categorie] OFF
GO
SET IDENTITY_INSERT [dbo].[demande_service] ON 

INSERT [dbo].[demande_service] ([id_demande], [id_emetteur], [date_enregistrement], [date_realisation], [adresse_realisation], [id_ville], [id_type_service], [date_annulation], [date_cloture], [date_non_finalisation], [id_motif_annulation]) VALUES (1, 1, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-02-02T11:45:00.000' AS DateTime), N'3 rue des chemins', 8, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[demande_service] ([id_demande], [id_emetteur], [date_enregistrement], [date_realisation], [adresse_realisation], [id_ville], [id_type_service], [date_annulation], [date_cloture], [date_non_finalisation], [id_motif_annulation]) VALUES (2, 1, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2020-03-15T13:15:00.000' AS DateTime), N'3 rue des chemins', 8, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[demande_service] ([id_demande], [id_emetteur], [date_enregistrement], [date_realisation], [adresse_realisation], [id_ville], [id_type_service], [date_annulation], [date_cloture], [date_non_finalisation], [id_motif_annulation]) VALUES (3, 1, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-24T20:00:00.000' AS DateTime), N'3 rue des chemins', 8, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[demande_service] ([id_demande], [id_emetteur], [date_enregistrement], [date_realisation], [adresse_realisation], [id_ville], [id_type_service], [date_annulation], [date_cloture], [date_non_finalisation], [id_motif_annulation]) VALUES (5, 2, CAST(N'2020-12-25T00:00:00.000' AS DateTime), CAST(N'2021-01-22T18:30:00.000' AS DateTime), N'4 allée des ruelles', 12, 12, NULL, NULL, NULL, NULL)
INSERT [dbo].[demande_service] ([id_demande], [id_emetteur], [date_enregistrement], [date_realisation], [adresse_realisation], [id_ville], [id_type_service], [date_annulation], [date_cloture], [date_non_finalisation], [id_motif_annulation]) VALUES (7, 2, CAST(N'2020-12-25T00:00:00.000' AS DateTime), CAST(N'2021-01-09T19:45:00.000' AS DateTime), N'4 allée des ruelles', 12, 14, NULL, NULL, NULL, NULL)
INSERT [dbo].[demande_service] ([id_demande], [id_emetteur], [date_enregistrement], [date_realisation], [adresse_realisation], [id_ville], [id_type_service], [date_annulation], [date_cloture], [date_non_finalisation], [id_motif_annulation]) VALUES (8, 2, CAST(N'2020-12-25T00:00:00.000' AS DateTime), CAST(N'2021-04-26T12:30:00.000' AS DateTime), N'4 allée des ruelles', 12, 8, NULL, NULL, NULL, NULL)
INSERT [dbo].[demande_service] ([id_demande], [id_emetteur], [date_enregistrement], [date_realisation], [adresse_realisation], [id_ville], [id_type_service], [date_annulation], [date_cloture], [date_non_finalisation], [id_motif_annulation]) VALUES (9, 3, CAST(N'2020-10-10T00:00:00.000' AS DateTime), CAST(N'2020-12-15T13:45:00.000' AS DateTime), N'6 boulevard des passages', 10, 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[demande_service] ([id_demande], [id_emetteur], [date_enregistrement], [date_realisation], [adresse_realisation], [id_ville], [id_type_service], [date_annulation], [date_cloture], [date_non_finalisation], [id_motif_annulation]) VALUES (11, 3, CAST(N'2020-10-10T00:00:00.000' AS DateTime), CAST(N'2021-02-23T12:00:00.000' AS DateTime), N'6 boulevard des passages', 10, 9, NULL, NULL, NULL, NULL)
INSERT [dbo].[demande_service] ([id_demande], [id_emetteur], [date_enregistrement], [date_realisation], [adresse_realisation], [id_ville], [id_type_service], [date_annulation], [date_cloture], [date_non_finalisation], [id_motif_annulation]) VALUES (12, 3, CAST(N'2020-10-10T00:00:00.000' AS DateTime), CAST(N'2021-01-30T16:30:00.000' AS DateTime), N'6 boulevard des passages', 10, 6, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[demande_service] OFF
GO
SET IDENTITY_INSERT [dbo].[equipement] ON 

INSERT [dbo].[equipement] ([id_equipement], [libelle_equipement]) VALUES (1, N'voiture')
INSERT [dbo].[equipement] ([id_equipement], [libelle_equipement]) VALUES (2, N'fer-à-repasser')
INSERT [dbo].[equipement] ([id_equipement], [libelle_equipement]) VALUES (3, N'aspirateur')
INSERT [dbo].[equipement] ([id_equipement], [libelle_equipement]) VALUES (4, N'produits d''entretien')
INSERT [dbo].[equipement] ([id_equipement], [libelle_equipement]) VALUES (5, N'arrosoir')
INSERT [dbo].[equipement] ([id_equipement], [libelle_equipement]) VALUES (6, N'taille-haie')
INSERT [dbo].[equipement] ([id_equipement], [libelle_equipement]) VALUES (7, N'casserole')
INSERT [dbo].[equipement] ([id_equipement], [libelle_equipement]) VALUES (8, N'saladier')
INSERT [dbo].[equipement] ([id_equipement], [libelle_equipement]) VALUES (9, N'jeux de société')
INSERT [dbo].[equipement] ([id_equipement], [libelle_equipement]) VALUES (10, N'ballon')
INSERT [dbo].[equipement] ([id_equipement], [libelle_equipement]) VALUES (11, N'table-à-repasser')
INSERT [dbo].[equipement] ([id_equipement], [libelle_equipement]) VALUES (12, N'serpillère')
INSERT [dbo].[equipement] ([id_equipement], [libelle_equipement]) VALUES (13, N'raclette à vitre')
SET IDENTITY_INSERT [dbo].[equipement] OFF
GO
INSERT [dbo].[equipement_type_service] ([id_equipement], [id_type_service]) VALUES (1, 3)
INSERT [dbo].[equipement_type_service] ([id_equipement], [id_type_service]) VALUES (2, 5)
INSERT [dbo].[equipement_type_service] ([id_equipement], [id_type_service]) VALUES (3, 6)
INSERT [dbo].[equipement_type_service] ([id_equipement], [id_type_service]) VALUES (4, 6)
INSERT [dbo].[equipement_type_service] ([id_equipement], [id_type_service]) VALUES (5, 2)
INSERT [dbo].[equipement_type_service] ([id_equipement], [id_type_service]) VALUES (6, 8)
INSERT [dbo].[equipement_type_service] ([id_equipement], [id_type_service]) VALUES (7, 9)
INSERT [dbo].[equipement_type_service] ([id_equipement], [id_type_service]) VALUES (8, 9)
INSERT [dbo].[equipement_type_service] ([id_equipement], [id_type_service]) VALUES (9, 14)
INSERT [dbo].[equipement_type_service] ([id_equipement], [id_type_service]) VALUES (10, 14)
INSERT [dbo].[equipement_type_service] ([id_equipement], [id_type_service]) VALUES (11, 5)
INSERT [dbo].[equipement_type_service] ([id_equipement], [id_type_service]) VALUES (12, 6)
INSERT [dbo].[equipement_type_service] ([id_equipement], [id_type_service]) VALUES (13, 6)
GO
SET IDENTITY_INSERT [dbo].[genre] ON 

INSERT [dbo].[genre] ([id_genre], [libelle_genre]) VALUES (1, N'masculin')
INSERT [dbo].[genre] ([id_genre], [libelle_genre]) VALUES (2, N'feminin')
SET IDENTITY_INSERT [dbo].[genre] OFF
GO
SET IDENTITY_INSERT [dbo].[type_service] ON 

INSERT [dbo].[type_service] ([id_type_service], [libelle_type_service], [id_categorie]) VALUES (1, N'sortir le chien', 1)
INSERT [dbo].[type_service] ([id_type_service], [libelle_type_service], [id_categorie]) VALUES (2, N'arroser les plantes', 1)
INSERT [dbo].[type_service] ([id_type_service], [libelle_type_service], [id_categorie]) VALUES (3, N'faire les courses', 1)
INSERT [dbo].[type_service] ([id_type_service], [libelle_type_service], [id_categorie]) VALUES (5, N'faire du repassage', 2)
INSERT [dbo].[type_service] ([id_type_service], [libelle_type_service], [id_categorie]) VALUES (6, N'faire le ménage', 2)
INSERT [dbo].[type_service] ([id_type_service], [libelle_type_service], [id_categorie]) VALUES (8, N'tailler les haies', 1)
INSERT [dbo].[type_service] ([id_type_service], [libelle_type_service], [id_categorie]) VALUES (9, N'faire la cuisine', 2)
INSERT [dbo].[type_service] ([id_type_service], [libelle_type_service], [id_categorie]) VALUES (10, N'aide aux devoirs', 2)
INSERT [dbo].[type_service] ([id_type_service], [libelle_type_service], [id_categorie]) VALUES (12, N'prendre le courrier', 2)
INSERT [dbo].[type_service] ([id_type_service], [libelle_type_service], [id_categorie]) VALUES (14, N'garder un/des enfant(s)', 2)
SET IDENTITY_INSERT [dbo].[type_service] OFF
GO
SET IDENTITY_INSERT [dbo].[utilisateur] ON 

INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (1, N'MAREJUS', N'Benoit', 1, CAST(N'1986-06-06T00:00:00.000' AS DateTime), N'21, rue Louis Braille', 19, N'0675334196', N'benoitmarejus@hotmail.fr', CAST(N'2021-01-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (2, N'CARVIN', N'Paul', 1, CAST(N'1940-05-30T00:00:00.000' AS DateTime), N'10, cours de Vincennes', 19, N'0671819526', NULL, CAST(N'2021-01-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (3, N'RIBAUT', N'Madeleine', 2, CAST(N'1955-11-10T00:00:00.000' AS DateTime), N'50, avenue Daumesnil', 19, N'0758563241', NULL, CAST(N'2021-01-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (4, N'TOUSSAINT', N'Isabelle', 2, CAST(N'1987-01-04T00:00:00.000' AS DateTime), N'9, rue Condorcet', 16, N'0685412635', NULL, CAST(N'2021-01-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (5, N'BELIN', N'Jean', 1, CAST(N'1980-07-25T00:00:00.000' AS DateTime), N'12, rue Navarin', 16, N'0674852369', NULL, CAST(N'2021-01-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (6, N'COSTER', N'Fanny', 2, CAST(N'1980-06-30T00:00:00.000' AS DateTime), N'65, rue des Martyrs', 16, N'0785961123', NULL, CAST(N'2021-01-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (7, N'DALLIN', N'Charlotte', 2, CAST(N'1960-09-09T00:00:00.000' AS DateTime), N'17, rue Lancereaux', 15, N'0685233112', NULL, CAST(N'2021-01-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (8, N'PICOT', N'Nicolas', 1, CAST(N'1990-03-25T00:00:00.000' AS DateTime), N'80, boulevard Haussmann', 15, N'0612365478', NULL, CAST(N'2021-01-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (9, N'GAUTRON', N'Yes', 1, CAST(N'1956-02-27T00:00:00.000' AS DateTime), N'50, rue de la Pépinière', 15, N'0678912333', NULL, CAST(N'2021-01-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (10, N'KERVALEC', N'Nolwenn', 2, CAST(N'1992-07-23T00:00:00.000' AS DateTime), N'32, rue Laborde', 15, N'0674523365', NULL, CAST(N'2021-01-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (14, N'trg', N'hgg', 1, CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'ici', 11, N'0         ', N'moi@hotmail.com', CAST(N'2021-01-26T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (15, N'trg', N'hgg', 1, CAST(N'2000-01-26T00:00:00.000' AS DateTime), N'ici', 12, N'0         ', N'moi@hotmail.com', CAST(N'2021-01-26T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (16, N'moi', N'moi', 1, CAST(N'2000-02-01T00:00:00.000' AS DateTime), N'iciici', 11, N'0         ', N'moi@hotmail.com', CAST(N'2021-01-26T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (17, N'moi', N'moi', 1, CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'ici', 13, N'0         ', N'moi@hotmail.com', CAST(N'2021-01-26T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (18, N'trg', N'moi', 2, CAST(N'2002-01-02T00:00:00.000' AS DateTime), N'ici', 10, N'0         ', N'moi@hotmail.com', CAST(N'2021-01-26T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (20, N'trg', N'hgg', 1, CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'ici', 10, N'0         ', N'moi@hotmail.com', CAST(N'2021-01-26T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (21, N'moi', N'moi', 1, CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'ici', 14, N'0         ', N'moi@hotmail.com', CAST(N'2021-01-26T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (22, N'moi', N'moi', 1, CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'ici', 14, N'0         ', N'moi@hotmail.com', CAST(N'2021-01-26T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (23, N'moi', N'moi', 1, CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'ici', 14, N'0         ', N'moi@hotmail.com', CAST(N'2021-01-26T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (24, N'moi', N'hgg', 1, CAST(N'1988-06-06T00:00:00.000' AS DateTime), N'ici', 14, N'0         ', N'moi@hotmail.com', CAST(N'2021-01-26T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (25, N'trg', N'hgg', 1, CAST(N'2000-02-01T00:00:00.000' AS DateTime), N'ici', 14, N'0         ', N'moi@hotmail.com', CAST(N'2021-01-26T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[utilisateur] OFF
GO
SET IDENTITY_INSERT [dbo].[ville] ON 

INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (8, N'Paris 1', N'75001')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (9, N'Paris 2', N'75002')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (10, N'Paris 3', N'75003')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (11, N'Paris 4', N'75004')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (12, N'Paris 5', N'75005')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (13, N'Paris 6', N'75006')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (14, N'Paris 7', N'75007')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (15, N'Paris 8', N'75008')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (16, N'Paris 9', N'75009')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (17, N'Paris 10', N'75010')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (18, N'Paris 11', N'75011')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (19, N'Paris 12', N'75012')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (20, N'Paris 13', N'75013')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (21, N'Paris 14', N'75014')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (22, N'Paris 15', N'75015')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (23, N'Paris 16', N'75016')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (24, N'Paris 17', N'75017')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (25, N'Paris 18', N'75018')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (26, N'Paris 19', N'75019')
INSERT [dbo].[ville] ([id_ville], [libelle_ville], [code_postal]) VALUES (27, N'Paris 20', N'75020')
SET IDENTITY_INSERT [dbo].[ville] OFF
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
ALTER TABLE [dbo].[reponse]  WITH CHECK ADD  CONSTRAINT [FK_reponse_demande_service] FOREIGN KEY([id_demande])
REFERENCES [dbo].[demande_service] ([id_demande])
GO
ALTER TABLE [dbo].[reponse] CHECK CONSTRAINT [FK_reponse_demande_service]
GO
ALTER TABLE [dbo].[reponse]  WITH CHECK ADD  CONSTRAINT [FK_reponse_utilisateur] FOREIGN KEY([id_utilisateur])
REFERENCES [dbo].[utilisateur] ([id_utilisateur])
GO
ALTER TABLE [dbo].[reponse] CHECK CONSTRAINT [FK_reponse_utilisateur]
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

/*
	Ce script permet de vider et remplir les tables nécessaires à la user story 1.
	Version 1 (BM - 21.01.2021)
*/

USE [pandamidb]
GO
DELETE FROM [dbo].[equipement_demande]
GO
DELETE FROM [dbo].[equipement_type_service]
GO
DELETE FROM [dbo].[equipement]
GO
DELETE FROM [dbo].[demande_service]
GO
DELETE FROM [dbo].[utilisateur]
GO
DELETE FROM [dbo].[genre]
GO
DELETE FROM [dbo].[motif_desinscription]
GO
DELETE FROM [dbo].[type_service]
GO
DELETE FROM [dbo].[categorie]
GO
DELETE FROM [dbo].[ville]
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
SET IDENTITY_INSERT [dbo].[categorie] ON 

INSERT [dbo].[categorie] ([id_categorie], [libelle_categorie]) VALUES (1, N'extérieur')
INSERT [dbo].[categorie] ([id_categorie], [libelle_categorie]) VALUES (2, N'intérieur')
SET IDENTITY_INSERT [dbo].[categorie] OFF
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
SET IDENTITY_INSERT [dbo].[genre] ON 

INSERT [dbo].[genre] ([id_genre], [libelle_genre]) VALUES (1, N'masculin')
INSERT [dbo].[genre] ([id_genre], [libelle_genre]) VALUES (2, N'feminin')
SET IDENTITY_INSERT [dbo].[genre] OFF
GO
SET IDENTITY_INSERT [dbo].[utilisateur] ON 

INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (1, N'MAREJUS', N'Benoit', 1, CAST(N'1986-06-06' AS Date), N'21, rue Louis Braille', 19, N'0675334196', N'benoitmarejus@hotmail.fr', CAST(N'2021-01-21' AS Date), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (2, N'CARVIN', N'Paul', 1, CAST(N'1940-05-30' AS Date), N'10, cours de Vincennes', 19, N'0671819526', NULL, CAST(N'2021-01-21' AS Date), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (3, N'RIBAUT', N'Madeleine', 2, CAST(N'1955-11-10' AS Date), N'50, avenue Daumesnil', 19, N'0758563241', NULL, CAST(N'2021-01-21' AS Date), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (4, N'TOUSSAINT', N'Isabelle', 2, CAST(N'1987-01-04' AS Date), N'9, rue Condorcet', 16, N'0685412635', NULL, CAST(N'2021-01-21' AS Date), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (5, N'BELIN', N'Jean', 1, CAST(N'1980-07-25' AS Date), N'12, rue Navarin', 16, N'0674852369', NULL, CAST(N'2021-01-21' AS Date), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (6, N'COSTER', N'Fanny', 2, CAST(N'1980-06-30' AS Date), N'65, rue des Martyrs', 16, N'0785961123', NULL, CAST(N'2021-01-21' AS Date), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (7, N'DALLIN', N'Charlotte', 2, CAST(N'1960-09-09' AS Date), N'17, rue Lancereaux', 15, N'0685233112', NULL, CAST(N'2021-01-21' AS Date), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (8, N'PICOT', N'Nicolas', 1, CAST(N'1990-03-25' AS Date), N'80, boulevard Haussmann', 15, N'0612365478', NULL, CAST(N'2021-01-21' AS Date), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (9, N'GAUTRON', N'Yes', 1, CAST(N'1956-02-27' AS Date), N'50, rue de la Pépinière', 15, N'0678912333', NULL, CAST(N'2021-01-21' AS Date), NULL, NULL)
INSERT [dbo].[utilisateur] ([id_utilisateur], [nom], [prenom], [id_genre], [date_naissance], [adresse], [id_ville], [num_telephone], [email], [date_inscription], [date_desinscription], [id_motif_desinscription]) VALUES (10, N'KERVALEC', N'Nolwenn', 2, CAST(N'1992-07-23' AS Date), N'32, rue Laborde', 15, N'0674523365', NULL, CAST(N'2021-01-21' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[utilisateur] OFF
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

USE [pandamidb]
GO
DELETE FROM [dbo].[demande_service]
GO
SET IDENTITY_INSERT [dbo].[demande_service] ON 

INSERT [dbo].[demande_service] ([id_demande], [id_emetteur], [date_enregistrement], [date_realisation], [adresse_realisation], [id_ville], [heure_realisation], [id_type_service], [date_annulation], [date_cloture], [date_non_finalisation], [id_motif_annulation]) VALUES (11, 1, CAST(N'2021-01-24' AS Date), CAST(N'2021-02-25' AS Date), N'3 rue des chemins', 11, CAST(N'11:25:00' AS Time), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[demande_service] ([id_demande], [id_emetteur], [date_enregistrement], [date_realisation], [adresse_realisation], [id_ville], [heure_realisation], [id_type_service], [date_annulation], [date_cloture], [date_non_finalisation], [id_motif_annulation]) VALUES (12, 2, CAST(N'2021-01-12' AS Date), CAST(N'2021-03-02' AS Date), N'2 allée du chemin', 15, CAST(N'15:15:00' AS Time), 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[demande_service] ([id_demande], [id_emetteur], [date_enregistrement], [date_realisation], [adresse_realisation], [id_ville], [heure_realisation], [id_type_service], [date_annulation], [date_cloture], [date_non_finalisation], [id_motif_annulation]) VALUES (13, 3, CAST(N'2020-12-22' AS Date), CAST(N'2021-02-15' AS Date), N'1 rue des passages', 18, CAST(N'20:15:00' AS Time), 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[demande_service] ([id_demande], [id_emetteur], [date_enregistrement], [date_realisation], [adresse_realisation], [id_ville], [heure_realisation], [id_type_service], [date_annulation], [date_cloture], [date_non_finalisation], [id_motif_annulation]) VALUES (14, 4, CAST(N'2021-01-01' AS Date), CAST(N'2021-02-21' AS Date), N'5 cité des rues', 15, CAST(N'18:45:00' AS Time), 8, NULL, NULL, NULL, NULL)
INSERT [dbo].[demande_service] ([id_demande], [id_emetteur], [date_enregistrement], [date_realisation], [adresse_realisation], [id_ville], [heure_realisation], [id_type_service], [date_annulation], [date_cloture], [date_non_finalisation], [id_motif_annulation]) VALUES (16, 5, CAST(N'2021-01-05' AS Date), CAST(N'2021-02-03' AS Date), N'6 boulevard des cités', 16, CAST(N'10:15:00' AS Time), 9, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[demande_service] OFF
GO

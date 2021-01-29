USE [pandamidb]
GO
/****** Object:  StoredProcedure [dbo].[GetDemandesEnCoursBenevole]    Script Date: 29/01/2021 09:46:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mathilda
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetDemandesEnCoursBenevole] 
	-- Add the parameters for the stored procedure here
	@IdUtilisateur int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT ds.date_realisation, 
		   ds.id_demande,
		   CASE WHEN ds.adresse_realisation IS NULL THEN ut.adresse ELSE  ds.adresse_realisation END AS adresse_realisation,
	       CASE WHEN v.libelle_ville IS NULL THEN vi.libelle_ville ELSE v.libelle_ville END AS libelle_ville, 
		   CASE WHEN v.code_postal IS NULL THEN vi.code_postal ELSE v.code_postal END AS code_postal,
	       ts.libelle_type_service, 
		   u.nom,
		   u.prenom
	FROM demande_service ds INNER JOIN type_service ts       ON  ds.id_type_service = ts.id_type_service
							INNER JOIN ville v		         ON v.id_ville = ds.id_ville
							INNER JOIN reponse r             ON r.id_demande = ds.id_demande
							INNER JOIN utilisateur u         ON r.id_utilisateur = u.id_utilisateur
							INNER JOIN utilisateur ut        ON ds.id_emetteur = ut.id_utilisateur
							INNER JOIN ville vi              ON vi.id_ville = ut.id_ville
	WHERE r.id_utilisateur = @IdUtilisateur 
	AND ds.date_annulation IS NULL
	AND ds.date_cloture IS NULL
	AND ds.date_non_finalisation IS NULL 
	AND ds.date_realisation > SYSDATETIME()
	AND r.date_refus IS NULL
	AND r.date_annulation_participation IS NULL
	AND r.date_acceptation IS NOT NULL
END
GO

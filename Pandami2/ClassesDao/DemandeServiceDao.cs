﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using Pandami2.Models;

namespace Pandami2.ClassesDao
{

    // classe qui permet d'extraire et insérer des données depuis/vers la table demande_service
    public class DemandeServiceDao
    {
        string connStr = ConfigurationManager.ConnectionStrings["PandamiConnectionString"].ConnectionString;

        // méthode qui permet d'ajouter une demande de service dans la table demande_service
        public void AjouterDemande(int idEmetteur, DateTime dateEnregistrement, DateTime dateRealisation,
           string adresseRealisation, int? idVille, int idTypeService, DateTime? dateAnnulation, DateTime? dateCloture,
           DateTime? dateNonFinalisation, int? idMotifAnnulation)
        {
            SqlConnection cnx = new SqlConnection();
            cnx.ConnectionString = connStr;
            cnx.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "dbo.InsertDemandeService";
            SqlParameter param1 = new SqlParameter("@idEmetteur", idEmetteur);
            SqlParameter param2 = new SqlParameter("@dateEnregistrement", dateEnregistrement);
            SqlParameter param3 = new SqlParameter("@dateRealisation", dateRealisation);
            SqlParameter param4 = new SqlParameter("@adresseRealisation", adresseRealisation);
            SqlParameter param5 = new SqlParameter("@idVille", idVille);
            SqlParameter param6 = new SqlParameter("@idTypeService", idTypeService);
            SqlParameter param7 = new SqlParameter("@dateAnnulation", dateAnnulation);
            SqlParameter param8 = new SqlParameter("@dateCloture", dateCloture);
            SqlParameter param9 = new SqlParameter("@dateNonFinalisation", dateNonFinalisation);
            SqlParameter param10 = new SqlParameter("@idMotifAnnulation", idMotifAnnulation);
            cmd.Parameters.Add(param1);
            cmd.Parameters.Add(param2);
            cmd.Parameters.Add(param3);
            cmd.Parameters.Add(param4);
            cmd.Parameters.Add(param5);
            cmd.Parameters.Add(param6);
            cmd.Parameters.Add(param7);
            cmd.Parameters.Add(param8);
            cmd.Parameters.Add(param9);
            cmd.Parameters.Add(param10);
            cmd.ExecuteNonQuery();
            cnx.Close();
        }

        //méthode qui permet d'obtenir une List d'objets DemandeService
        public List<DemandeService> AfficherDemandes()
        {
            SqlConnection cnx = new SqlConnection();
            cnx.ConnectionString = connStr;
            cnx.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "SELECT ut.nom, " +
                                     "ut.prenom, " +
                                     "ds.id_demande, " +
                                     "ds.id_emetteur, " +
                                     "ds.date_enregistrement, " +
                                     "ds.date_realisation, " +
                                     "case when ds.adresse_realisation is null then ut.adresse else ds.adresse_realisation end as adresse_realisation, " +
                                     "ut.id_ville, " +
                                     "case when vi.libelle_ville is null then (" +
                                                                          "SELECT libelle_ville FROM ville WHERE id_ville=ut.id_ville) else vi.libelle_ville end as libelle_ville, " +
                                     "ts.libelle_type_service, " +
                                     "ds.date_annulation, " +
                                     "ds.date_cloture, " +
                                     "ds.date_non_finalisation, " +
                                     "ds.id_motif_annulation " +
                              "FROM demande_service ds INNER JOIN utilisateur ut on ds.id_emetteur=ut.id_utilisateur " +
                                                      "INNER JOIN ville vi ON ds.id_ville=vi.id_ville " +
                                                      "INNER JOIN type_service ts ON ds.id_type_service=ts.id_type_service;";
            cmd.CommandType = System.Data.CommandType.Text;
            SqlDataReader dr = cmd.ExecuteReader();
            List<DemandeService> listeDemandes = new List<DemandeService>();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    DemandeService demande = new DemandeService((int)dr["id_emetteur"]);
                    demande.NomPrenomEmetteur = (string)dr["nom"] + " " + (string)dr["prenom"];
                    demande.IdDemande = (int)dr["id_demande"];
                    demande.DateEnregistrement = (DateTime)dr["date_enregistrement"];
                    demande.DateRealisation = (DateTime)dr["date_realisation"];
                    demande.AdresseRealisation = (string)dr["adresse_realisation"];
                    demande.LibelleVilleRealisation = (string)dr["libelle_ville"];
                    demande.LibelleTypeService = (string)dr["libelle_type_service"];
                    if (dr["date_annulation"] != DBNull.Value)
                    {
                        demande.DateAnnulation = (DateTime)dr["date_annulation"];
                    }
                    if (dr["date_cloture"] != DBNull.Value)
                    {
                        demande.DateCloture = (DateTime)dr["date_cloture"];
                    }
                    listeDemandes.Add(demande);
                }
            }
            cnx.Close();
            return listeDemandes;
        }

        public List<DemandeService> GetDemandesEnCoursBeneficiaire(int idUtilisateur)
        {
            SqlConnection cnx = new SqlConnection();
            cnx.ConnectionString = connStr;
            cnx.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "dbo.GetInfosDemandesEnCoursBeneficiaire";
            SqlParameter idUtilisateurPara = new SqlParameter("@IdUtilisateur", idUtilisateur);
            cmd.Parameters.Add(idUtilisateurPara);
            SqlDataReader dr = cmd.ExecuteReader();
            List<DemandeService> listeDemandes = new List<DemandeService>();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    DemandeService demande = new DemandeService((DateTime)dr["date_realisation"], 
                                                                (string)dr["adresse_realisation"], 
                                                                (string)dr["code_postal"], 
                                                                (string)dr["libelle_ville"],
                                                                (string)dr["libelle_type_service"],
                                                                (string)dr["nom"]+" "+dr["prenom"],
                                                                (int)dr["id_demande"]);
                    
                    listeDemandes.Add(demande);
                }
            }
            cnx.Close();
            return listeDemandes;
        }
        public List<DemandeService> GetDemandesEnCoursBenevole(int idUtilisateur)
        {
            SqlConnection cnx = new SqlConnection();
            cnx.ConnectionString = connStr;
            cnx.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "dbo.GetDemandesEnCoursBenevole";
            SqlParameter idUtilisateurPara = new SqlParameter("@IdUtilisateur", idUtilisateur);
            cmd.Parameters.Add(idUtilisateurPara);
            SqlDataReader dr = cmd.ExecuteReader();
            List<DemandeService> listeDemandes = new List<DemandeService>();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    DemandeService demande = new DemandeService((DateTime)dr["date_realisation"],
                                                                (string)dr["adresse_realisation"],
                                                                (string)dr["code_postal"],
                                                                (string)dr["libelle_ville"],
                                                                (string)dr["libelle_type_service"],
                                                                (string)dr["nom"] + " " + dr["prenom"],
                                                                (int)dr["id_demande"]);

                    listeDemandes.Add(demande);
                }
            }
            cnx.Close();
            return listeDemandes;
        }
        public List<DemandeService> GetDemandesNonPourvues(int idUtilisateur)
        {
            SqlConnection cnx = new SqlConnection();
            cnx.ConnectionString = connStr;
            cnx.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "dbo.GetDemandesNonPourvues";
            SqlParameter idUtilisateurPara = new SqlParameter("@IdUtilisateur", idUtilisateur);
            cmd.Parameters.Add(idUtilisateurPara);
            SqlDataReader dr = cmd.ExecuteReader();
            List<DemandeService> listeDemandes = new List<DemandeService>();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    DemandeService demande = new DemandeService((DateTime)dr["date_realisation"],
                                                                (string)dr["adresse_realisation"],
                                                                (string)dr["code_postal"],
                                                                (string)dr["libelle_ville"],
                                                                (string)dr["libelle_type_service"],
                                                                (int)dr["id_demande"]);

                    listeDemandes.Add(demande);
                }
            }
            cnx.Close();
            return listeDemandes;
        }
    }
}
-- Généré par Oracle SQL Developer Data Modeler 3.3.0.747
--   à :        2014-05-07 09:41:08 CEST
--   site :      Oracle Database 11g
--   type :      Oracle Database 11g




CREATE TABLE Adresser_Livraison
  (
    --  C'est l'identifiant de l'adresse
    adressesLivraison_id   INTEGER NOT NULL ,
    Commandes_commandes_id INTEGER NOT NULL
  ) ;
ALTER TABLE Adresser_Livraison ADD CONSTRAINT Adresser_Livraison_PK PRIMARY KEY
(
  adressesLivraison_id
)
;

CREATE TABLE Adresses
  (
    --  C'est l'identifiant de l'adresse
    adresses_id INTEGER NOT NULL ,
    --  C'est le nom de la rue
    adresses_rue VARCHAR2 (100) ,
    --  C'est le complément d'adresse ( batiment, escalier, Résidence, etage...)
    adresses_complement VARCHAR2 (100) ,
    --  C'est le code postal de la ville
    adresse_codePostal VARCHAR2 (10) NOT NULL ,
    --  C'est le nom de la ville
    adresses_ville VARCHAR2 (100) NOT NULL ,
    --  C'est l'identifiant pays où se situe l'adresse
    pays_id      INTEGER NOT NULL ,
    Pays_pays_id INTEGER NOT NULL
  ) ;
ALTER TABLE Adresses ADD CONSTRAINT Adresses_PK PRIMARY KEY
(
  adresses_id
)
;

CREATE TABLE Appartenir
  (
    Articles_articles_numero INTEGER NOT NULL ,
    Categorie_categorie_id   INTEGER NOT NULL
  ) ;

CREATE TABLE Articles
  (
    --  Est l'identifiant d'un article. C'est un entier.
    articles_numero INTEGER NOT NULL
  ) ;
ALTER TABLE Articles ADD CONSTRAINT Article_PK PRIMARY KEY
(
  articles_numero
)
;

CREATE TABLE Catalogues
  (
    --  c'est l'identifiant du catague
    catalogue_id INTEGER NOT NULL ,
    --  C'est le libellé du catalogue
    catalogue_libelle VARCHAR2 (200 CHAR) NOT NULL ,
    --  C'est la date à laquelle le catalogue a été publié
    catalogue_dateDebut DATE NOT NULL ,
    --  C'est la date à la quelle le catalogue a expirée
    catalogue_dateFin DATE NOT NULL
  ) ;
ALTER TABLE Catalogues ADD CONSTRAINT Catalogues_PK PRIMARY KEY
(
  catalogue_id
)
;

CREATE TABLE Categorie
  (
    --  C'est l'identifiant de la catégorie
    categorie_id INTEGER NOT NULL ,
    --  C'est l'intitulé de a catégorie
    categorie_libelle VARCHAR2 (200 CHAR)
  ) ;
ALTER TABLE Categorie ADD CONSTRAINT Categorie_PK PRIMARY KEY
(
  categorie_id
)
;

CREATE TABLE Champs
  (
    --  C'est l'identifiant du champ.
    champs_id INTEGER NOT NULL ,
    --  C'est le nom du champ
    champs_libelle VARCHAR2 (50 CHAR) NOT NULL
  ) ;
ALTER TABLE Champs ADD CONSTRAINT Champs_PK PRIMARY KEY
(
  champs_id
)
;

CREATE TABLE Changement
  (
    --  C'est l'identifiant du changement effectué sur un champs lié à une entité.
    changements_id INTEGER NOT NULL ,
    --  C'est la date d'itération.
    changements_date   DATE NOT NULL ,
    changements_valeur VARCHAR2 (500) NOT NULL
  ) ;
ALTER TABLE Changement ADD CONSTRAINT Changement_PK PRIMARY KEY
(
  changements_id
)
;

CREATE TABLE Clients
  (
    --  C'est l'identifiant du client
    clients_id INTEGER NOT NULL ,
    --  C'est le nom du client
    clients_nom VARCHAR2 (50) NOT NULL ,
    --  C'est le prénom du client
    clients_prenom VARCHAR2 (50) NOT NULL
  ) ;
ALTER TABLE Clients ADD CONSTRAINT Clients_PK PRIMARY KEY
(
  clients_id
)
;

CREATE TABLE Commandes
  (
    --  C'est le numero de commande
    commandes_id INTEGER NOT NULL ,
    --  C'est la date de la commande
    commandes_date DATE NOT NULL ,
    --  C'est l'identifiant du client
    clients_id INTEGER NOT NULL
  ) ;
ALTER TABLE Commandes ADD CONSTRAINT Commandes_PK PRIMARY KEY
(
  commandes_id
)
;

CREATE TABLE DateAdresse
  (
    --  C'est l'une des clés de l'identfiant de la table
    dateAdresse_id INTEGER NOT NULL ,
    --  C'est l'une des clés de l'identifiant de la table.
    dateAdresse_date DATE NOT NULL
  ) ;
ALTER TABLE DateAdresse ADD CONSTRAINT DateAdresse_PK PRIMARY KEY
(
  dateAdresse_id, dateAdresse_date
)
;

CREATE TABLE Facturer
  (
    --  c'est l'identifiant de la date d'adresse
    DateAdresse_dateAdresse_id INTEGER NOT NULL ,
    --  c'est l'identifiant de la date d'adresse
    DateAdresse_dateAdresse_date DATE NOT NULL ,
    --  c'est l'identifiant du client à qui est adressé la facture
    Clients_clients_id INTEGER NOT NULL ,
    --  c'est le numéro de commande
    Commandes_commandes_id INTEGER NOT NULL ,
    Adresses_adresses_id   INTEGER NOT NULL
  ) ;
ALTER TABLE Facturer ADD CONSTRAINT Facturer_PK PRIMARY KEY
(
  DateAdresse_dateAdresse_id, DateAdresse_dateAdresse_date, Clients_clients_id
)
;

CREATE TABLE Fornisseur
  (
    --  C'est l'identifiant du fournisseur
    Fournisseur_id INTEGER NOT NULL ,
    --  C'es le nom du fournisseur
    Fournisseur_libelle UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    NOT NULL ,
    Adresses_adresses_id INTEGER NOT NULL ,
    --  c'est l'adresse courriel du fournisseur
    fournisseur_email UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    NOT NULL
  ) ;
ALTER TABLE Fornisseur ADD CONSTRAINT Fornisseur_PK PRIMARY KEY
(
  Fournisseur_id
)
;

CREATE TABLE Fournir
  (
    Articles_articles_numero  INTEGER NOT NULL ,
    Fornisseur_Fournisseur_id INTEGER NOT NULL
  ) ;

CREATE TABLE Ligne_commande
  (
    --  c'est l'identifiant de l'article
    Articles_numero INTEGER NOT NULL ,
    --  C'est le numéro de commande
    Commandes_id INTEGER NOT NULL ,
    --  C'est la quantité
    qte INTEGER NOT NULL
  ) ;
ALTER TABLE Ligne_commande ADD CONSTRAINT Ligne_commande_PK PRIMARY KEY
(
  Commandes_id, Articles_numero
)
;

CREATE TABLE Mouvement
  (
    --  C'est l'identifiant du mouvement
    mouvement_id INTEGER NOT NULL ,
    --  C'est la date à laquelle le mouvement a été effectué
    mouvement_date DATE NOT NULL ,
    --  C'est la quantité de mouvement
    mouvement_valeur INTEGER NOT NULL
  ) ;
ALTER TABLE Mouvement ADD CONSTRAINT Mouvement_PK PRIMARY KEY
(
  mouvement_id
)
;

CREATE TABLE Pays
  (
    --  C'est l'identifiant du pays
    pays_id INTEGER NOT NULL ,
    --  C'est le nom du pays
    pays_nom VARCHAR2 (100) NOT NULL
  ) ;
ALTER TABLE Pays ADD CONSTRAINT Pays_PK PRIMARY KEY
(
  pays_id
)
;

CREATE TABLE Repertorie
  (
    Articles_articles_numero INTEGER NOT NULL ,
    Catalogues_catalogue_id  INTEGER NOT NULL
  ) ;

CREATE TABLE Subir
  (
    --  C'est l'identifiant du champ concerné par le changement.
    champs_id INTEGER NOT NULL ,
    --  C'est l'identifiant du changement
    changements_id INTEGER NOT NULL ,
    --  C'est l'identifiant d'un article
    articles_numero INTEGER NOT NULL
  ) ;
ALTER TABLE Subir ADD CONSTRAINT Subir_PK PRIMARY KEY
(
  champs_id, changements_id, articles_numero
)
;

CREATE TABLE Subir_M
  (
    Articles_articles_numero INTEGER NOT NULL ,
    Mouvement_mouvement_id   INTEGER NOT NULL
  ) ;

ALTER TABLE Adresser_Livraison ADD CONSTRAINT Adresser_Livraison_Adresses_FK FOREIGN KEY ( adressesLivraison_id ) REFERENCES Adresses ( adresses_id ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Adresser_Livraison ADD CONSTRAINT Adresser_Livraison_Commandes_FK FOREIGN KEY ( Commandes_commandes_id ) REFERENCES Commandes ( commandes_id ) ;

ALTER TABLE Adresses ADD CONSTRAINT Adresses_Pays_FK FOREIGN KEY ( Pays_pays_id ) REFERENCES Pays ( pays_id ) ;

ALTER TABLE Appartenir ADD CONSTRAINT Appartenir_Articles_FK FOREIGN KEY ( Articles_articles_numero ) REFERENCES Articles ( articles_numero ) ;

ALTER TABLE Appartenir ADD CONSTRAINT Appartenir_Categorie_FK FOREIGN KEY ( Categorie_categorie_id ) REFERENCES Categorie ( categorie_id ) ;

ALTER TABLE Commandes ADD CONSTRAINT Commandes_Clients_FK FOREIGN KEY ( clients_id ) REFERENCES Clients ( clients_id ) ;

ALTER TABLE Facturer ADD CONSTRAINT Facturer_Adresses_FK FOREIGN KEY ( Adresses_adresses_id ) REFERENCES Adresses ( adresses_id ) ;

ALTER TABLE Facturer ADD CONSTRAINT Facturer_Commandes_FK FOREIGN KEY ( Commandes_commandes_id ) REFERENCES Commandes ( commandes_id ) ;

ALTER TABLE Facturer ADD CONSTRAINT Facturer_DateAdresse_FK FOREIGN KEY ( DateAdresse_dateAdresse_id, DateAdresse_dateAdresse_date ) REFERENCES DateAdresse ( dateAdresse_id, dateAdresse_date ) ;

ALTER TABLE Fornisseur ADD CONSTRAINT Fornisseur_Adresses_FK FOREIGN KEY ( Adresses_adresses_id ) REFERENCES Adresses ( adresses_id ) ;

ALTER TABLE Fournir ADD CONSTRAINT Fournir_Articles_FK FOREIGN KEY ( Articles_articles_numero ) REFERENCES Articles ( articles_numero ) ;

ALTER TABLE Fournir ADD CONSTRAINT Fournir_Fornisseur_FK FOREIGN KEY ( Fornisseur_Fournisseur_id ) REFERENCES Fornisseur ( Fournisseur_id ) ;

ALTER TABLE Ligne_commande ADD CONSTRAINT Ligne_commande_Articles_FK FOREIGN KEY ( Articles_numero ) REFERENCES Articles ( articles_numero ) ;

ALTER TABLE Ligne_commande ADD CONSTRAINT Ligne_commande_Commandes_FK FOREIGN KEY ( Commandes_id ) REFERENCES Commandes ( commandes_id ) ;

ALTER TABLE Repertorie ADD CONSTRAINT Repertorie_Articles_FK FOREIGN KEY ( Articles_articles_numero ) REFERENCES Articles ( articles_numero ) ;

ALTER TABLE Repertorie ADD CONSTRAINT Repertorie_Catalogues_FK FOREIGN KEY ( Catalogues_catalogue_id ) REFERENCES Catalogues ( catalogue_id ) ;

ALTER TABLE Subir ADD CONSTRAINT Subir_Articles_FK FOREIGN KEY ( articles_numero ) REFERENCES Articles ( articles_numero ) ;

ALTER TABLE Subir ADD CONSTRAINT Subir_Champs_FK FOREIGN KEY ( champs_id ) REFERENCES Champs ( champs_id ) ;

ALTER TABLE Subir ADD CONSTRAINT Subir_Changement_FK FOREIGN KEY ( changements_id ) REFERENCES Changement ( changements_id ) ;

ALTER TABLE Subir_M ADD CONSTRAINT Subir_M_Articles_FK FOREIGN KEY ( Articles_articles_numero ) REFERENCES Articles ( articles_numero ) ;

ALTER TABLE Subir_M ADD CONSTRAINT Subir_M_Mouvement_FK FOREIGN KEY ( Mouvement_mouvement_id ) REFERENCES Mouvement ( mouvement_id ) ;


-- Rapport récapitulatif d'Oracle SQL Developer Data Modeler : 
-- 
-- CREATE TABLE                            20
-- CREATE INDEX                             0
-- ALTER TABLE                             37
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- ERRORS                                   3
-- WARNINGS                                 0

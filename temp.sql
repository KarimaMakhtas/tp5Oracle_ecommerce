-- Généré par Oracle SQL Developer Data Modeler 3.3.0.747
--   à :        2014-05-07 10:48:54 CEST
--   site :      Oracle Database 11g
--   type :      Oracle Database 11g




CREATE TABLE Adresser_Livraison
  (
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
    adresses_id         INTEGER NOT NULL ,
    adresses_rue        VARCHAR2 (100) ,
    adresses_complement VARCHAR2 (100) ,
    adresse_codePostal  VARCHAR2 (10) NOT NULL ,
    adresses_ville      VARCHAR2 (100) NOT NULL ,
    pays_id             INTEGER NOT NULL ,
    Pays_pays_id        INTEGER NOT NULL
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
  ( articles_numero INTEGER NOT NULL
  ) ;
ALTER TABLE Articles ADD CONSTRAINT Article_PK PRIMARY KEY
(
  articles_numero
)
;

CREATE TABLE Catalogues
  (
    catalogue_id        INTEGER NOT NULL ,
    catalogue_libelle   VARCHAR2 (200 CHAR) NOT NULL ,
    catalogue_dateDebut DATE NOT NULL ,
    catalogue_dateFin   DATE NOT NULL
  ) ;
ALTER TABLE Catalogues ADD CONSTRAINT Catalogues_PK PRIMARY KEY
(
  catalogue_id
)
;

CREATE TABLE Categorie
  (
    categorie_id      INTEGER NOT NULL ,
    categorie_libelle VARCHAR2 (200 CHAR)
  ) ;
ALTER TABLE Categorie ADD CONSTRAINT Categorie_PK PRIMARY KEY
(
  categorie_id
)
;

CREATE TABLE Champs
  (
    champs_id      INTEGER NOT NULL ,
    champs_libelle VARCHAR2 (50 CHAR) NOT NULL
  ) ;
ALTER TABLE Champs ADD CONSTRAINT Champs_PK PRIMARY KEY
(
  champs_id
)
;

CREATE TABLE Changement
  (
    changements_id     INTEGER NOT NULL ,
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
    clients_id     INTEGER NOT NULL ,
    clients_nom    VARCHAR2 (50) NOT NULL ,
    clients_prenom VARCHAR2 (50) NOT NULL
  ) ;
ALTER TABLE Clients ADD CONSTRAINT Clients_PK PRIMARY KEY
(
  clients_id
)
;

CREATE TABLE Commandes
  (
    commandes_id   INTEGER NOT NULL ,
    commandes_date DATE NOT NULL ,
    clients_id     INTEGER NOT NULL
  ) ;
ALTER TABLE Commandes ADD CONSTRAINT Commandes_PK PRIMARY KEY
(
  commandes_id
)
;

CREATE TABLE DateAdresse
  (
    dateAdresse_id   INTEGER NOT NULL ,
    dateAdresse_date DATE NOT NULL
  ) ;
ALTER TABLE DateAdresse ADD CONSTRAINT DateAdresse_PK PRIMARY KEY
(
  dateAdresse_id, dateAdresse_date
)
;

CREATE TABLE Facturer
  (
    DateAdresse_dateAdresse_id   INTEGER NOT NULL ,
    DateAdresse_dateAdresse_date DATE NOT NULL ,
    Clients_clients_id           INTEGER NOT NULL ,
    Commandes_commandes_id       INTEGER NOT NULL ,
    Adresses_adresses_id         INTEGER NOT NULL
  ) ;
ALTER TABLE Facturer ADD CONSTRAINT Facturer_PK PRIMARY KEY
(
  DateAdresse_dateAdresse_id, DateAdresse_dateAdresse_date, Clients_clients_id
)
;

CREATE TABLE Fournir
  (
    Articles_articles_numero  INTEGER NOT NULL ,
    Fornisseur_Fournisseur_id INTEGER NOT NULL
  ) ;

CREATE TABLE Fournisseur
  (
    Fournisseur_id       INTEGER NOT NULL ,
    Fournisseur_libelle  VARCHAR2 (200 CHAR) NOT NULL ,
    Adresses_adresses_id INTEGER NOT NULL ,
    fournisseur_email    VARCHAR2 (200 CHAR) NOT NULL
  ) ;
ALTER TABLE Fournisseur ADD CONSTRAINT Fornisseur_PK PRIMARY KEY
(
  Fournisseur_id
)
;

CREATE TABLE Ligne_commande
  (
    Articles_numero INTEGER NOT NULL ,
    Commandes_id    INTEGER NOT NULL ,
    qte             INTEGER NOT NULL
  ) ;
ALTER TABLE Ligne_commande ADD CONSTRAINT Ligne_commande_PK PRIMARY KEY
(
  Commandes_id, Articles_numero
)
;

CREATE TABLE Mouvement
  (
    mouvement_id     INTEGER NOT NULL ,
    mouvement_date   DATE NOT NULL ,
    mouvement_valeur INTEGER NOT NULL
  ) ;
ALTER TABLE Mouvement ADD CONSTRAINT Mouvement_PK PRIMARY KEY
(
  mouvement_id
)
;

CREATE TABLE Pays
  (
    pays_id  INTEGER NOT NULL ,
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
    champs_id       INTEGER NOT NULL ,
    changements_id  INTEGER NOT NULL ,
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

ALTER TABLE Adresser_Livraison ADD CONSTRAINT AdresserLivr_Adresses_FK FOREIGN KEY ( adressesLivraison_id ) REFERENCES Adresses ( adresses_id ) ;

ALTER TABLE Adresser_Livraison ADD CONSTRAINT AdresserLivr_Commandes_FK FOREIGN KEY ( Commandes_commandes_id ) REFERENCES Commandes ( commandes_id ) ;

ALTER TABLE Adresses ADD CONSTRAINT Adresses_Pays_FK FOREIGN KEY ( Pays_pays_id ) REFERENCES Pays ( pays_id ) ;

ALTER TABLE Appartenir ADD CONSTRAINT Appartenir_Articles_FK FOREIGN KEY ( Articles_articles_numero ) REFERENCES Articles ( articles_numero ) ;

ALTER TABLE Appartenir ADD CONSTRAINT Appartenir_Categorie_FK FOREIGN KEY ( Categorie_categorie_id ) REFERENCES Categorie ( categorie_id ) ;

ALTER TABLE Commandes ADD CONSTRAINT Commandes_Clients_FK FOREIGN KEY ( clients_id ) REFERENCES Clients ( clients_id ) ;

ALTER TABLE Facturer ADD CONSTRAINT Facturer_Adresses_FK FOREIGN KEY ( Adresses_adresses_id ) REFERENCES Adresses ( adresses_id ) ;

ALTER TABLE Facturer ADD CONSTRAINT Facturer_Commandes_FK FOREIGN KEY ( Commandes_commandes_id ) REFERENCES Commandes ( commandes_id ) ;

ALTER TABLE Facturer ADD CONSTRAINT Facturer_DateAdresse_FK FOREIGN KEY ( DateAdresse_dateAdresse_id, DateAdresse_dateAdresse_date ) REFERENCES DateAdresse ( dateAdresse_id, dateAdresse_date ) ;

ALTER TABLE Fournisseur ADD CONSTRAINT Fornisseur_Adresses_FK FOREIGN KEY ( Adresses_adresses_id ) REFERENCES Adresses ( adresses_id ) ;

ALTER TABLE Fournir ADD CONSTRAINT Fournir_Articles_FK FOREIGN KEY ( Articles_articles_numero ) REFERENCES Articles ( articles_numero ) ;

ALTER TABLE Fournir ADD CONSTRAINT Fournir_Fornisseur_FK FOREIGN KEY ( Fornisseur_Fournisseur_id ) REFERENCES Fournisseur ( Fournisseur_id ) ;

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
-- ERRORS                                   0
-- WARNINGS                                 0

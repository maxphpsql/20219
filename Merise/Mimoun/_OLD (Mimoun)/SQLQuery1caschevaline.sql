--CREATE DATABASE CHEVAL
--GO
USE CHEVAL

/*------------------------------------------------------------
*        Script SQLSERVER 
------------------------------------------------------------*/


/*------------------------------------------------------------
-- Table: ChampsCourse
------------------------------------------------------------*/
CREATE TABLE ChampsCourse(
	numerochampscourse INT IDENTITY (1,1) NOT NULL ,
	CONSTRAINT prk_constraint_ChampsCourse PRIMARY KEY NONCLUSTERED (numerochampscourse)
);


/*------------------------------------------------------------
-- Table: Cheval
------------------------------------------------------------*/
CREATE TABLE Cheval(
	numerocheval    INT  NOT NULL ,
	nomcheval       VARCHAR (25)  ,
	nomproprietaire VARCHAR (25)  ,
	sexe            VARCHAR (25)  ,
	CONSTRAINT prk_constraint_Cheval PRIMARY KEY NONCLUSTERED (numerocheval)
);


/*------------------------------------------------------------
-- Table: Course
------------------------------------------------------------*/
CREATE TABLE Course(
	numerocourse         INT IDENTITY (1,1) NOT NULL ,
	heuredepart          DATETIME   ,
	nomepreuve           VARCHAR (25)  ,
	prixgagnant          CHAR (25)   ,
	typecourse           VARCHAR (25)  ,
	distance             INT   ,
	numerochampscourse   INT   ,
	numeroreunioncources INT   ,
	CONSTRAINT prk_constraint_Course PRIMARY KEY NONCLUSTERED (numerocourse)
);


/*------------------------------------------------------------
-- Table: Proprietaire
------------------------------------------------------------*/
CREATE TABLE Proprietaire(
	numeroproprietaire  INT  NOT NULL ,
	nomproprietaire     VARCHAR (25)  ,
	couleurproprietaire VARCHAR (25)  ,
	CONSTRAINT prk_constraint_Proprietaire PRIMARY KEY NONCLUSTERED (numeroproprietaire)
);


/*------------------------------------------------------------
-- Table: Reunioncourse
------------------------------------------------------------*/
CREATE TABLE Reunioncourse(
	numeroreunioncources INT IDENTITY (1,1) NOT NULL ,
	typereunioncourse    bit   ,
	nombrereunion        VARCHAR (25)  ,
	jourdereunion        DATETIME  ,
	CONSTRAINT prk_constraint_Reunioncourse PRIMARY KEY NONCLUSTERED (numeroreunioncources)
);


/*------------------------------------------------------------
-- Table: jockey
------------------------------------------------------------*/
CREATE TABLE jockey(
	numerojockey INT  NOT NULL ,
	CONSTRAINT prk_constraint_jockey PRIMARY KEY NONCLUSTERED (numerojockey)
);


/*------------------------------------------------------------
-- Table: participe
------------------------------------------------------------*/
CREATE TABLE participe(
	nombreparticipant  INT   ,
	numerochevalcourse INT   ,
	placealacorde      INT   ,
	handicap           DECIMAL (25,0)   ,
	gaincheval         DATETIME  ,
	numerocheval       INT  NOT NULL ,
	numerocourse       INT  NOT NULL ,
	CONSTRAINT prk_constraint_participe PRIMARY KEY NONCLUSTERED (numerocheval,numerocourse)
);


/*------------------------------------------------------------
-- Table: possede
------------------------------------------------------------*/
CREATE TABLE possede(
	numerocheval       INT  NOT NULL ,
	numeroproprietaire INT  NOT NULL ,
	CONSTRAINT prk_constraint_possede PRIMARY KEY NONCLUSTERED (numerocheval,numeroproprietaire)
);


/*------------------------------------------------------------
-- Table: engendre
------------------------------------------------------------*/
CREATE TABLE engendre(
	nompere             VARCHAR (25)  ,
	nommere             VARCHAR (25)  ,
	numerocheval        INT  NOT NULL ,
	numerocheval_Cheval INT  NOT NULL ,
	CONSTRAINT prk_constraint_engendre PRIMARY KEY NONCLUSTERED (numerocheval,numerocheval_Cheval)
);


/*------------------------------------------------------------
-- Table: monte
------------------------------------------------------------*/
CREATE TABLE monte(
	numerocheval INT  NOT NULL ,
	numerojockey INT  NOT NULL ,
	CONSTRAINT prk_constraint_monte PRIMARY KEY NONCLUSTERED (numerocheval,numerojockey)
);


/*------------------------------------------------------------
-- Table: participebis
------------------------------------------------------------*/
CREATE TABLE participebis(
	numerojockey         INT  NOT NULL ,
	numeroreunioncources INT  NOT NULL ,
	CONSTRAINT prk_constraint_participebis PRIMARY KEY NONCLUSTERED (numerojockey,numeroreunioncources)
);


/*------------------------------------------------------------
-- Table: entraine
------------------------------------------------------------*/
CREATE TABLE entraine(
	numeroproprietaire INT  NOT NULL ,
	numerocheval       INT  NOT NULL ,
	CONSTRAINT prk_constraint_entraine PRIMARY KEY NONCLUSTERED (numeroproprietaire,numerocheval)
);



ALTER TABLE Course ADD CONSTRAINT FK_Course_numerochampscourse FOREIGN KEY (numerochampscourse) REFERENCES ChampsCourse(numerochampscourse);
ALTER TABLE Course ADD CONSTRAINT FK_Course_numeroreunioncources FOREIGN KEY (numeroreunioncources) REFERENCES Reunioncourse(numeroreunioncources);
ALTER TABLE participe ADD CONSTRAINT FK_participe_numerocheval FOREIGN KEY (numerocheval) REFERENCES Cheval(numerocheval);
ALTER TABLE participe ADD CONSTRAINT FK_participe_numerocourse FOREIGN KEY (numerocourse) REFERENCES Course(numerocourse);
ALTER TABLE possede ADD CONSTRAINT FK_possede_numerocheval FOREIGN KEY (numerocheval) REFERENCES Cheval(numerocheval);
ALTER TABLE possede ADD CONSTRAINT FK_possede_numeroproprietaire FOREIGN KEY (numeroproprietaire) REFERENCES Proprietaire(numeroproprietaire);
ALTER TABLE engendre ADD CONSTRAINT FK_engendre_numerocheval FOREIGN KEY (numerocheval) REFERENCES Cheval(numerocheval);
ALTER TABLE engendre ADD CONSTRAINT FK_engendre_numerocheval_Cheval FOREIGN KEY (numerocheval_Cheval) REFERENCES Cheval(numerocheval);
ALTER TABLE monte ADD CONSTRAINT FK_monte_numerocheval FOREIGN KEY (numerocheval) REFERENCES Cheval(numerocheval);
ALTER TABLE monte ADD CONSTRAINT FK_monte_numerojockey FOREIGN KEY (numerojockey) REFERENCES jockey(numerojockey);
ALTER TABLE participebis ADD CONSTRAINT FK_participebis_numerojockey FOREIGN KEY (numerojockey) REFERENCES jockey(numerojockey);
ALTER TABLE participebis ADD CONSTRAINT FK_participebis_numeroreunioncources FOREIGN KEY (numeroreunioncources) REFERENCES Reunioncourse(numeroreunioncources);
ALTER TABLE entraine ADD CONSTRAINT FK_entraine_numeroproprietaire FOREIGN KEY (numeroproprietaire) REFERENCES Proprietaire(numeroproprietaire);
ALTER TABLE entraine ADD CONSTRAINT FK_entraine_numerocheval FOREIGN KEY (numerocheval) REFERENCES Cheval(numerocheval);


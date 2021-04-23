drop database papyrus;
create database papyrus;
use papyrus;

create table produit (
codart	char(4) PRIMARY KEY NOT NULL,
libart	varchar(30) NOT NULL,
stkale	int NOT NULL,
stkphy	int NOT NULL,
qteann	int NOT NULL,
unimes	char(5) NOT NULL
);

create table fournis (
numfou	int PRIMARY KEY NOT NULL,
nomfou	varchar(25) NOT NULL,
ruefou	varchar(50) NOT NULL,
posfou	char(5) NOT NULL,
vilfou	varchar(30) NOT NULL,
confou	varchar(15)NOT NULL,
satisf	tinyint CHECK (satisf>=0 AND satisf<=10)
);

create table entcom (
numcom	int AUTO_INCREMENT PRIMARY KEY NOT NULL,
obscom	varchar(50),
datcom	timestamp NOT NULL,
numfou	int,
foreign key (numfou) references fournis (numfou)
);

create table ligcom (
numcom	int NOT NULL,
numlig	tinyint NOT NULL,
codart	char(4) NOT NULL,
qtecde	int NOT NULL,
priuni	decimal(5.2) NOT NULL,
qteliv	int,
derliv	date NOT NULL,
PRIMARY KEY (numcom, numlig),
foreign key (numcom) references entcom (numcom),
foreign key (codart) references produit (codart)
);

create table vente (
codart	char(4) NOT NULL,
numfou	int NOT NULL,
delliv	smallint NOT NULL,
qte1		int NOT NULL,
prix1		decimal(5.2) NOT NULL,
qte2		int,
prix2		decimal(5.2),
qte3		int,
prix3		decimal(5.2),
PRIMARY KEY (codart, numfou),
foreign key (numfou) references fournis (numfou),
foreign key (codart) references produit (codart)
);

LOAD DATA LOCAL INFILE 'C:\\Users\\80010-29-03\\Desktop\\produit.csv'
INTO TABLE produit
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(codart, libart, unimes, stkale, stkphy, qteann);

insert into fournis (numfou, nomfou, ruefou, posfou, vilfou, confou, satisf) values
(00120, 'GROBRIGAN', '20 rue du papier', 92200, 'papercity', 'Georges', 08),
(00540, 'ECLIPSE', '53 rue laisse flotter les rubans', 78250, 'Bugbugville', 'Nestor', 07),
(08700, 'MEDICIS', '120 rue des plantes', 75014, 'Paris', 'Lison',0),
(09120, 'DISCOBOL', '11 rue des sports', 85100, 'La Roche sur Yon', 'Hercule', 08),
(09150, 'DEPANPAP', '26 avenue des locomotives', 59987, 'Coroncountry', 'Pollux', 05),
(09180, 'HURRYTAPE', '68 boulevard des octets', 04044, 'Dumpville', 'Track',0);

insert into entcom (numcom, obscom, numfou) values
(70010, '', 00120),
(70011, 'Commande urgente', 00540),
(70020, '', 09120),
(70025, 'Commande urgente', 09150),
(70210, 'Commande cadencée', 00120),
(70300, '', 09120),
(70250, 'Commande cadencée', 08700),
(70620, '', 00540),
(70625, '', 00120),
(70629, '', 09180);

insert into ligcom (numcom, numlig, codart, qtecde, priuni, qteliv, derliv) values
(70010, 01, 'I100', 3000, 470, 3000, '2007-03-15'),
(70010, 02, 'I105', 2000, 485, 2000, '2007-07-05'),
(70010, 03, 'I108', 1000, 680, 1000, '2007-08-20'),
(70010, 04, 'D035', 200, 40, 250, '2007-02-20'),
(70010, 05, 'P220', 6000, 3500, 6000, '2007-03-31'),
(70010, 06, 'P240', 6000, 2000, 2000, '2007-03-31'),
(70011, 01, 'I105', 1000, 600, 1000, '2007-05-16'),
(70020, 01, 'B001', 200, 140, 0, '2007-12-31'),
(70020, 02, 'B002', 200, 140, 0, '2007-12-31'),
(70025, 01, 'I100', 1000, 590, 1000, '2007-05-15'),
(70025, 02, 'I105', 500, 590, 500, '2007-03-15'),
(70210, 01, 'I100', 1000, 470, 1000, '2007-07-15'),
(70011, 02, 'P220', 10000, 3500, 10000, '2007-08-31'),
(70300, 01, 'I100', 50, 790, 50, '2007-10-31'),
(70250, 01, 'P230', 15000, 4900, 12000, '2007-12-15'),
(70250, 02, 'P220', 10000, 3350, 10000, '2007-11-10'),
(70620, 01, 'I105', 200, 600, 200, '2007-11-01'),
(70625, 01, 'I100', 1000, 470, 1000, '2007-10-15'),
(70625, 02, 'P220', 10000, 3500, 10000, '2007-10-31'),
(70629, 01, 'B001', 200, 140, 0, '2007-12-31'),
(70629, 02, 'B002', 200, 140, 0, '2007-12-31');

LOAD DATA LOCAL INFILE 'C:\\Users\\80010-29-03\\Desktop\\vente.csv'
INTO TABLE vente
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(numfou, codart, delliv, qte1, prix1, qte2, prix2, qte3, prix3);

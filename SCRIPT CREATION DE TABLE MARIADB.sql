create database fil_rouge_db;


CREATE TABLE categorie (
    reference INT NOT null AUTO_INCREMENT,
    type_de_bonbon VARCHAR(50) NOT NULL,    
    PRIMARY KEY (reference)    
);

CREATE TABLE etat (
    reference INT NOT null AUTO_INCREMENT,
    etat VARCHAR(50) NOT NULL,    
    PRIMARY KEY (reference)    
);

CREATE TABLE stock (
    reference VARCHAR(50) NOT NULL,
    designation VARCHAR(50),
    description VARCHAR(255),
    FK_categorie INT,
    prix DECIMAL(10,2),
    quantite INT(20),
    PRIMARY KEY (reference),
   FOREIGN KEY (FK_categorie) REFERENCES categorie(reference)
); 

CREATE TABLE rgpd (
    reference INT NOT null AUTO_INCREMENT ,
    mise_a_jour VARCHAR(50) NOT NULL,    
    PRIMARY KEY (reference)    
);

CREATE TABLE clients (
    reference VARCHAR(6) NOT NULL,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    adresse VARCHAR(100) NOT NULL,
    code_postal INT(5),
    ville VARCHAR(50),
    date_de_naissance DATE,
    FK_rgpd INT,
    PRIMARY KEY (reference),
    FOREIGN KEY (FK_rgpd) REFERENCES rgpd(reference)
);



CREATE TABLE `commandes` (
  `numero_de_commande` int(20) NOT NULL,
  `FK_produit` varchar(50) NOT NULL,
  `FK_client` varchar(6) NOT NULL,
  `date_commande` date NOT NULL,
  `quantite` int(20) DEFAULT NULL,
  `FK_etat` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero_de_commande`,`FK_produit`),
  FOREIGN KEY (`FK_etat`) REFERENCES etat(`reference`),
  FOREIGN KEY (`FK_client`) REFERENCES clients(`reference`),
  FOREIGN KEY (`FK_produit`) REFERENCES `stock` (`reference`)
);


INSERT INTO rgpd (mise_a_jour)
VALUES ("1.1"),("1.2");

INSERT INTO clients (reference,nom,prenom,adresse,code_postal,ville,date_de_naissance,FK_rgpd)
VALUES 	("dj-26","Daniel","Jack","2 rue de la poupée qui tousse",59150,"WATTRELOS","1982-07-20",1),
		("bb-33","Barbie","Barbara","5 square Jean Valjean",75001,"PARIS","2001-01-14",2),
		("ma-11","Michel","Angélica","14 avenue de la république",13000,"MARSEILLE","1999-11-25",2),
		("ft-45","Frère","Tuck","Bistro face à l'église",12000,"LE MONASTERE","1973-01-01",1),
		("af-56","Auposte","Fildèle","1 rue la villette",77000,"MELUN","1987-04-23",1)
;

INSERT INTO categorie (type_de_bonbon)
VALUES ("Gourmand"),("Menthe"),("Fruit");

INSERT INTO stock (reference,designation,description,FK_categorie,prix,quantite)
VALUES 	("blackcoffe",	"Café noir"			,"Un goût puissant qui réveille",1,5.90,1200),
		("menthe1",		"Menthe glacé"		,"Une fraicheur qui décoiffe",2,5.90,2623),
		("banana",		"Banane"			,"Pour avoir la banane toute la journée",3,6.00,0),
		("caramel1",	"Caramel Beurre salé","Breton ou pas, tu vas adorer",1,6.90,5432),
		("montelimar",	"Le Montélimar"		,"Enfin du nougat qu'on ne doit pas partager",1,6.90,456),
		("menteur",		"Menteur"			,"Ce n'est pas de la menthe, c'est un iceberg",2,6.20,324),
		("moka",		"Moka"				,"Robuste oui mais subtile",1,6.00,245),
		("exotic"		,"Fruits exotiques"	,"Attention aux coups de soleil",3,5.90,1025),
		("strawberry"	,"Tagada"			,"Ramènes ta fraise",3,6.20,2469)
;

INSERT INTO etat (etat)
VALUES
	 ('validation'),
	 ('preparation'),
	 ('livré');

INSERT INTO commandes (numero_de_commande,FK_produit,FK_client,date_commande,quantite,FK_etat)
VALUES
	 (1,"blackcoffe","dj-26","2020-01-15",2,3),
	 (1,"menthe1","dj-26","2020-01-15",5,3),
	 (1,"banana","dj-26","2020-01-15",1,3),
	 (2,"caramel1","ft-45","2020-02-22",4,3),
	 (2,"montelimar","ft-45","2020-02-22",7,3),
	 (3,"menteur","bb-33","2020-03-01",4,3),
	 (3,"moka","bb-33","2020-03-01",3,3),
	 (3,"exotic","bb-33","2020-03-01",9,3),
	 (4,"strawberry","af-56","2020-02-02",2,3),
	 (5,"menthe1","af-56","2020-03-29",2,2),
	 (5,"montelimar","af-56","2020-03-29",5,2),
	 (5,"moka","af-56","2020-03-29",8,2),
	 (5,"exotic","af-56","2020-03-29",1,2),
	 (6,"banana","ma-11","2020-04-12",7,1),
	 (6,"exotic","ma-11","2020-04-12",8,1)
	;


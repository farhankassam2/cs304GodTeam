drop table StoreManager cascade constraints;
drop table Customer cascade constraints;
drop table Store1 cascade constraints;
drop table Store2 cascade constraints;
drop table MessageSendsAndReceives cascade constraints;
drop table FoodItemOffers1 cascade constraints;
drop table FoodItemOffers2 cascade constraints;
drop table OrderFullfillsAndPlaces cascade constraints;
drop table Contains cascade constraints;


CREATE TABLE StoreManager(
	smid int,
	smUsername varchar(50) NOT NULL,
	smPassword varchar(50) NOT NULL,
	smName varchar(50),
	smAddress varchar(50),
	PRIMARY KEY (smid),
	UNIQUE (smUsername)
);
grant select on StoreManager to public;


CREATE TABLE Customer(
	cid int,
	cUsername varchar(50) NOT NULL,
	cPassword varchar(50) NOT NULL,
	cName varchar(50),
	cAddress varchar(50),
	PRIMARY KEY(cid),
	UNIQUE(cUsername)
);
grant select on Customer to public;


CREATE TABLE Store2 (
	sid int,
	smid int NOT NULL UNIQUE,
	sName varchar(50) NOT NULL UNIQUE,
	sAddress varchar(50) NOT NULL,
	PRIMARY KEY (sid),
	FOREIGN KEY (smid) REFERENCES StoreManager ON DELETE CASCADE
);
grant select on Store2 to public;

CREATE TABLE Store1(
	sName varchar(50),
	sPopularItem int,
  PRIMARY KEY(sName),
	FOREIGN KEY (sName) REFERENCES Store2(sName) ON DELETE CASCADE
);
grant select on Store1 to public;


CREATE TABLE MessageSendsAndReceives (
	mid int,
	sid int NOT NULL,
	cid int NOT NULL,
	subject varchar(50),
	content varchar(50),
	mTime int NOT NULL,
	PRIMARY KEY (mid, sid, cid),
	FOREIGN KEY (sid) REFERENCES Store2 ON DELETE CASCADE,
	FOREIGN KEY (cid) REFERENCES Customer ON DELETE CASCADE
);
grant select on MessageSendsAndReceives to public;


CREATE TABLE FoodItemOffers2 (
	fid int,
	sid int,
	title varchar(50) NOT NULL,
	PRIMARY KEY (fid),
	UNIQUE(title),
	FOREIGN KEY (sid) REFERENCES Store2 ON DELETE CASCADE
);
grant select on FoodItemOffers2 to public;

CREATE TABLE FoodItemOffers1(
	title varchar(50),
	description varchar(50),
	PRIMARY KEY (title),
	FOREIGN KEY (title) REFERENCES FoodItemOffers2(title) ON DELETE CASCADE
);
grant select on FoodItemOffers1 to public;


CREATE TABLE OrderFullfillsAndPlaces (
	oid int,
	sid int NOT NULL,
	cid int NOT NULL,
	oTime int,
	PRIMARY KEY (oid),
	FOREIGN KEY (sid) REFERENCES Store2 ON DELETE CASCADE,
	FOREIGN KEY (cid) REFERENCES Customer ON DELETE CASCADE
);
grant select on OrderFullfillsAndPlaces to public;

CREATE TABLE Contains (
	oid int,
	fid int,
	PRIMARY KEY (oid, fid),
	FOREIGN KEY (oid) REFERENCES OrderFullfillsAndPlaces ON DELETE CASCADE,
	FOREIGN KEY (fid) REFERENCES FoodItemOffers2 ON DELETE CASCADE
);
grant select on Contains to public;

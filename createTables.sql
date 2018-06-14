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


CREATE TABLE Store1(
	sName varchar(50),
	sPopularItem int,
  PRIMARY KEY(sName)
);
grant select on Store1 to public;

CREATE TABLE Store2 (
	sid int,
	smid int NOT NULL UNIQUE,
	sName varchar(50) NOT NULL UNIQUE,
	sAddress varchar(50) NOT NULL,
	PRIMARY KEY (sid)
);
grant select on Store2 to public;

alter table Store1 add FOREIGN KEY (sName) REFERENCES Store2(sName) ON DELETE CASCADE;
alter table Store2 add FOREIGN KEY (smid) REFERENCES StoreManager ON DELETE CASCADE;


CREATE TABLE MessageSendsAndReceives (
	mid int,
	sid int NOT NULL,
	cid int NOT NULL,
	subject varchar(50),
	content varchar(50),
	mTime int NOT NULL,
	PRIMARY KEY (mid, sid, cid)
);
grant select on MessageSendsAndReceives to public;

alter table MessageSendsAndReceives add FOREIGN KEY (sid) REFERENCES Store2 ON DELETE CASCADE;
alter table MessageSendsAndReceives add FOREIGN KEY (cid) REFERENCES Customer ON DELETE CASCADE;


CREATE TABLE FoodItemOffers1(
	title varchar(50),
	description varchar(50),
	PRIMARY KEY (title)
);
grant select on FoodItemOffers1 to public;

CREATE TABLE FoodItemOffers2 (
	fid int,
	sid int,
	title varchar(50) NOT NULL,
	PRIMARY KEY (fid),
	UNIQUE(title)
);
grant select on FoodItemOffers2 to public;

alter table  FoodItemOffers1 add FOREIGN KEY (title) REFERENCES FoodItemOffers2(title) ON DELETE CASCADE;
alter table  FoodItemOffers2 add FOREIGN KEY (sid) REFERENCES Store2;


CREATE TABLE OrderFullfillsAndPlaces (
	oid int,
	sid int NOT NULL,
	cid int NOT NULL,
	oTime int,
	PRIMARY KEY (oid)
);
grant select on OrderFullfillsAndPlaces to public;

alter table  OrderFullfillsAndPlaces add FOREIGN KEY (sid) REFERENCES Store2 ON DELETE CASCADE;
alter table  OrderFullfillsAndPlaces add FOREIGN KEY (cid) REFERENCES Customer ON DELETE CASCADE;


CREATE TABLE Contains (
	oid int,
	fid int,
	PRIMARY KEY (oid, fid)
);
grant select on Contains to public;

alter table Contains add FOREIGN KEY (oid) REFERENCES OrderFullfillsAndPlaces;
alter table  Contains add FOREIGN KEY (fid) REFERENCES FoodItemOffers2;

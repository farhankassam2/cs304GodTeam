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
	FOREIGN KEY (sid) REFERENCES Store2
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
	FOREIGN KEY (oid) REFERENCES OrderFullfillsAndPlaces,
	FOREIGN KEY (fid) REFERENCES FoodItemOffers2
);
grant select on Contains to public;


/* Insert 20 Stores, 70 Customers */
INSERT INTO StoreManager VALUES (120246,'Jennifer6218','9498Cohen','Jennifer Cohen','847 Cambie Creek');
INSERT INTO Store2 VALUES (36420,120246,'The Delicious Cafe','363 Cambie Hill');
INSERT INTO Store1 VALUES ('The Delicious Cafe',920460);
INSERT INTO FoodItemOffers2 VALUES (920460,36420,'Fresh Curry');
INSERT INTO FoodItemOffers1 VALUES ('Fresh Curry','The tastiest Curry possible');
INSERT INTO StoreManager VALUES (735262,'Davis739','7431Robyn','Davis Robyn','934 Main Terrace');
INSERT INTO Store2 VALUES (988843,735262,'The Icy Patisserie','818 Sasamat Bouleletd');
INSERT INTO Store1 VALUES ('The Icy Patisserie',116993);
INSERT INTO FoodItemOffers2 VALUES (116993,988843,'Red Calzone');
INSERT INTO FoodItemOffers1 VALUES ('Red Calzone','The tastiest Calzone possible');
INSERT INTO FoodItemOffers2 VALUES (440533,988843,'Fresh Coffee');
INSERT INTO FoodItemOffers1 VALUES ('Fresh Coffee','The tastiest Coffee possible');
INSERT INTO FoodItemOffers2 VALUES (357922,988843,'Red Pasta');
INSERT INTO FoodItemOffers1 VALUES ('Red Pasta','The tastiest Pasta possible');
INSERT INTO FoodItemOffers2 VALUES (471217,988843,'Natural Curry');
INSERT INTO FoodItemOffers1 VALUES ('Natural Curry','The tastiest Curry possible');
INSERT INTO FoodItemOffers2 VALUES (451085,988843,'Healthy Taco');
INSERT INTO FoodItemOffers1 VALUES ('Healthy Taco','The tastiest Taco possible');
INSERT INTO FoodItemOffers2 VALUES (261133,988843,'Healthy Sushi');
INSERT INTO FoodItemOffers1 VALUES ('Healthy Sushi','The tastiest Sushi possible');
INSERT INTO StoreManager VALUES (178188,'Wong3509','2590Joey','Wong Joey','490 Pender Gardens');
INSERT INTO Store2 VALUES (828721,178188,'The Traditional Barbecue','680 Cambie St');
INSERT INTO Store1 VALUES ('The Traditional Barbecue',869650);
INSERT INTO FoodItemOffers2 VALUES (869650,828721,'Amazing Sushi');
INSERT INTO FoodItemOffers1 VALUES ('Amazing Sushi','The tastiest Sushi possible');
INSERT INTO FoodItemOffers2 VALUES (871157,828721,'Spicy Burger');
INSERT INTO FoodItemOffers1 VALUES ('Spicy Burger','The tastiest Burger possible');
INSERT INTO FoodItemOffers2 VALUES (450530,828721,'Dazzling Burger');
INSERT INTO FoodItemOffers1 VALUES ('Dazzling Burger','The tastiest Burger possible');
INSERT INTO StoreManager VALUES (602680,'Bonnibel2225','4714Anderson','Bonnibel Anderson','983 Broadway Terrace');
INSERT INTO Store2 VALUES (836537,602680,'The Enjoyable Cafe','951 Discovery Creek');
INSERT INTO Store1 VALUES ('The Enjoyable Cafe',43412);
INSERT INTO FoodItemOffers2 VALUES (43412,836537,'Wonderful Sandwich');
INSERT INTO FoodItemOffers1 VALUES ('Wonderful Sandwich','The tastiest Sandwich possible');
INSERT INTO FoodItemOffers2 VALUES (781175,836537,'Toasted Fries');
INSERT INTO FoodItemOffers1 VALUES ('Toasted Fries','The tastiest Fries possible');
INSERT INTO FoodItemOffers2 VALUES (467309,836537,'Best Curry');
INSERT INTO FoodItemOffers1 VALUES ('Best Curry','The tastiest Curry possible');
INSERT INTO FoodItemOffers2 VALUES (958469,836537,'Soft Ice Cream');
INSERT INTO FoodItemOffers1 VALUES ('Soft Ice Cream','The tastiest Ice Cream possible');
INSERT INTO FoodItemOffers2 VALUES (334730,836537,'Attractive Chicken Strips');
INSERT INTO FoodItemOffers1 VALUES ('Attractive Chicken Strips','The tastiest Chicken Strips possible');
INSERT INTO FoodItemOffers2 VALUES (982747,836537,'Magnificent Sandwich');
INSERT INTO FoodItemOffers1 VALUES ('Magnificent Sandwich','The tastiest Sandwich possible');
INSERT INTO StoreManager VALUES (288672,'Anne5155','4188George','Anne George','406 Broadway Creek');
INSERT INTO Store2 VALUES (448835,288672,'The Wonderful Patisserie','877 Hamilton Gardens');
INSERT INTO Store1 VALUES ('The Wonderful Patisserie',726269);
INSERT INTO FoodItemOffers2 VALUES (726269,448835,'Natural Taco');
INSERT INTO FoodItemOffers1 VALUES ('Natural Taco','The tastiest Taco possible');
INSERT INTO FoodItemOffers2 VALUES (850908,448835,'Cold Coffee');
INSERT INTO FoodItemOffers1 VALUES ('Cold Coffee','The tastiest Coffee possible');
INSERT INTO FoodItemOffers2 VALUES (523236,448835,'Dazzling Milkshake');
INSERT INTO FoodItemOffers1 VALUES ('Dazzling Milkshake','The tastiest Milkshake possible');
INSERT INTO FoodItemOffers2 VALUES (949794,448835,'Hot Salad');
INSERT INTO FoodItemOffers1 VALUES ('Hot Salad','The tastiest Salad possible');
INSERT INTO FoodItemOffers2 VALUES (992399,448835,'Healthy Burrito');
INSERT INTO FoodItemOffers1 VALUES ('Healthy Burrito','The tastiest Burrito possible');
INSERT INTO FoodItemOffers2 VALUES (186631,448835,'Mysterious Fries');
INSERT INTO FoodItemOffers1 VALUES ('Mysterious Fries','The tastiest Fries possible');
INSERT INTO StoreManager VALUES (580738,'Bonnibel5777','5212Robyn','Bonnibel Robyn','748 Carmel Avenue');
INSERT INTO Store2 VALUES (543367,580738,'The Delicious Brasserie','367 Eastdown Cr');
INSERT INTO Store1 VALUES ('The Delicious Brasserie',382029);
INSERT INTO FoodItemOffers2 VALUES (382029,543367,'Toasted Meatballs');
INSERT INTO FoodItemOffers1 VALUES ('Toasted Meatballs','The tastiest Meatballs possible');
INSERT INTO FoodItemOffers2 VALUES (973410,543367,'Fresh Chicken Strips');
INSERT INTO FoodItemOffers1 VALUES ('Fresh Chicken Strips','The tastiest Chicken Strips possible');
INSERT INTO FoodItemOffers2 VALUES (199728,543367,'Plump Fries');
INSERT INTO FoodItemOffers1 VALUES ('Plump Fries','The tastiest Fries possible');
INSERT INTO FoodItemOffers2 VALUES (338535,543367,'Mysterious Coffee');
INSERT INTO FoodItemOffers1 VALUES ('Mysterious Coffee','The tastiest Coffee possible');
INSERT INTO FoodItemOffers2 VALUES (358472,543367,'Delicious Meatballs');
INSERT INTO FoodItemOffers1 VALUES ('Delicious Meatballs','The tastiest Meatballs possible');
INSERT INTO StoreManager VALUES (809433,'Barbara851','7567Violet','Barbara Violet','872 Trafalgar St');
INSERT INTO Store2 VALUES (907754,809433,'The Magical Taco City','251 Burrard Bouleletd');
INSERT INTO Store1 VALUES ('The Magical Taco City',439575);
INSERT INTO FoodItemOffers2 VALUES (439575,907754,'Toasted Burger');
INSERT INTO FoodItemOffers1 VALUES ('Toasted Burger','The tastiest Burger possible');
INSERT INTO FoodItemOffers2 VALUES (778766,907754,'Black Chicken Strips');
INSERT INTO FoodItemOffers1 VALUES ('Black Chicken Strips','The tastiest Chicken Strips possible');
INSERT INTO FoodItemOffers2 VALUES (3432,907754,'Magical Meatballs');
INSERT INTO FoodItemOffers1 VALUES ('Magical Meatballs','The tastiest Meatballs possible');
INSERT INTO FoodItemOffers2 VALUES (274120,907754,'Healthy Coffee');
INSERT INTO FoodItemOffers1 VALUES ('Healthy Coffee','The tastiest Coffee possible');
INSERT INTO StoreManager VALUES (182308,'Bob1909','8361Ross','Bob Ross','106 Blanca Lane');
INSERT INTO Store2 VALUES (614271,182308,'The Magical Cafe','718 Alma Grove');
INSERT INTO Store1 VALUES ('The Magical Cafe',187428);
INSERT INTO FoodItemOffers2 VALUES (187428,614271,'Icy Bagel');
INSERT INTO FoodItemOffers1 VALUES ('Icy Bagel','The tastiest Bagel possible');
INSERT INTO FoodItemOffers2 VALUES (979397,614271,'Magical Burrito');
INSERT INTO FoodItemOffers1 VALUES ('Magical Burrito','The tastiest Burrito possible');
INSERT INTO StoreManager VALUES (651129,'Faye5248','6583Jennifer','Faye Jennifer','586 Trafalgar Creek');
INSERT INTO Store2 VALUES (111260,651129,'The Traditional Boulangerie','135 Sasamat Grove');
INSERT INTO Store1 VALUES ('The Traditional Boulangerie',315525);
INSERT INTO FoodItemOffers2 VALUES (315525,111260,'Jolly Ice Cream');
INSERT INTO FoodItemOffers1 VALUES ('Jolly Ice Cream','The tastiest Ice Cream possible');
INSERT INTO FoodItemOffers2 VALUES (954196,111260,'Plump Sandwich');
INSERT INTO FoodItemOffers1 VALUES ('Plump Sandwich','The tastiest Sandwich possible');
INSERT INTO FoodItemOffers2 VALUES (119926,111260,'Plump Pasta');
INSERT INTO FoodItemOffers1 VALUES ('Plump Pasta','The tastiest Pasta possible');
INSERT INTO FoodItemOffers2 VALUES (498230,111260,'Jolly Pulled Pork Sandwich');
INSERT INTO FoodItemOffers1 VALUES ('Jolly Pulled Pork Sandwich','The tastiest Pulled Pork Sandwich possible');
INSERT INTO StoreManager VALUES (437883,'Joey8730','9419Ross','Joey Ross','68 Pacific Gardens');
INSERT INTO Store2 VALUES (585061,437883,'The Enjoyable Pancake House','567 Trafalgar Hill');
INSERT INTO Store1 VALUES ('The Enjoyable Pancake House',486243);
INSERT INTO FoodItemOffers2 VALUES (486243,585061,'Mysterious Burger');
INSERT INTO FoodItemOffers1 VALUES ('Mysterious Burger','The tastiest Burger possible');
INSERT INTO FoodItemOffers2 VALUES (573846,585061,'Dazzling Coffee');
INSERT INTO FoodItemOffers1 VALUES ('Dazzling Coffee','The tastiest Coffee possible');
INSERT INTO FoodItemOffers2 VALUES (83370,585061,'Traditional Ice Cream');
INSERT INTO FoodItemOffers1 VALUES ('Traditional Ice Cream','The tastiest Ice Cream possible');
INSERT INTO StoreManager VALUES (215638,'Bill9793','2574Christie','Bill Christie','501 Arbutus Bouleletd');
INSERT INTO Store2 VALUES (651268,215638,'The Spicy Sandwichery','806 Davie Center');
INSERT INTO Store1 VALUES ('The Spicy Sandwichery',803631);
INSERT INTO FoodItemOffers2 VALUES (803631,651268,'Jolly Calzone');
INSERT INTO FoodItemOffers1 VALUES ('Jolly Calzone','The tastiest Calzone possible');
INSERT INTO FoodItemOffers2 VALUES (988022,651268,'Succulent Milkshake');
INSERT INTO FoodItemOffers1 VALUES ('Succulent Milkshake','The tastiest Milkshake possible');
INSERT INTO FoodItemOffers2 VALUES (373276,651268,'Soft Pulled Pork Sandwich');
INSERT INTO FoodItemOffers1 VALUES ('Soft Pulled Pork Sandwich','The tastiest Pulled Pork Sandwich possible');
INSERT INTO FoodItemOffers2 VALUES (275130,651268,'Magnificent Cake');
INSERT INTO FoodItemOffers1 VALUES ('Magnificent Cake','The tastiest Cake possible');
INSERT INTO FoodItemOffers2 VALUES (857120,651268,'Natural Pulled Pork Sandwich');
INSERT INTO FoodItemOffers1 VALUES ('Natural Pulled Pork Sandwich','The tastiest Pulled Pork Sandwich possible');
INSERT INTO FoodItemOffers2 VALUES (947031,651268,'Traditional Pasta');
INSERT INTO FoodItemOffers1 VALUES ('Traditional Pasta','The tastiest Pasta possible');
INSERT INTO StoreManager VALUES (826018,'Christie3040','6229Kim','Christie Kim','204 Arbutus Grove');
INSERT INTO Store2 VALUES (296824,826018,'The Delicious Buffet','4 Broadway Creek');
INSERT INTO Store1 VALUES ('The Delicious Buffet',424366);
INSERT INTO FoodItemOffers2 VALUES (424366,296824,'Natural Cake');
INSERT INTO FoodItemOffers1 VALUES ('Natural Cake','The tastiest Cake possible');
INSERT INTO FoodItemOffers2 VALUES (837679,296824,'Soft Calzone');
INSERT INTO FoodItemOffers1 VALUES ('Soft Calzone','The tastiest Calzone possible');
INSERT INTO FoodItemOffers2 VALUES (816029,296824,'Chubby Fries');
INSERT INTO FoodItemOffers1 VALUES ('Chubby Fries','The tastiest Fries possible');
INSERT INTO FoodItemOffers2 VALUES (123737,296824,'Icy Sandwich');
INSERT INTO FoodItemOffers1 VALUES ('Icy Sandwich','The tastiest Sandwich possible');
INSERT INTO StoreManager VALUES (58073,'Yuri9410','3677Wong','Yuri Wong','888 Davie Gardens');
INSERT INTO Store2 VALUES (500748,58073,'The Enjoyable Buffet','16 Highland Terrace');
INSERT INTO Store1 VALUES ('The Enjoyable Buffet',287634);
INSERT INTO FoodItemOffers2 VALUES (287634,500748,'Black Fries');
INSERT INTO FoodItemOffers1 VALUES ('Black Fries','The tastiest Fries possible');
INSERT INTO FoodItemOffers2 VALUES (786242,500748,'Magical Salad');
INSERT INTO FoodItemOffers1 VALUES ('Magical Salad','The tastiest Salad possible');
INSERT INTO FoodItemOffers2 VALUES (267894,500748,'Black Sushi');
INSERT INTO FoodItemOffers1 VALUES ('Black Sushi','The tastiest Sushi possible');
INSERT INTO FoodItemOffers2 VALUES (257250,500748,'Best Calzone');
INSERT INTO FoodItemOffers1 VALUES ('Best Calzone','The tastiest Calzone possible');
INSERT INTO FoodItemOffers2 VALUES (660943,500748,'Fresh Fries');
INSERT INTO FoodItemOffers1 VALUES ('Fresh Fries','The tastiest Fries possible');
INSERT INTO FoodItemOffers2 VALUES (640071,500748,'Wonderful Burger');
INSERT INTO FoodItemOffers1 VALUES ('Wonderful Burger','The tastiest Burger possible');
INSERT INTO FoodItemOffers2 VALUES (333147,500748,'Amazing Calzone');
INSERT INTO FoodItemOffers1 VALUES ('Amazing Calzone','The tastiest Calzone possible');
INSERT INTO FoodItemOffers2 VALUES (460690,500748,'Plump Sushi');
INSERT INTO FoodItemOffers1 VALUES ('Plump Sushi','The tastiest Sushi possible');
INSERT INTO StoreManager VALUES (325399,'Taylor747','270Mary','Taylor Mary','566 Eastdown Gardens');
INSERT INTO Store2 VALUES (789145,325399,'The Natural Cafe','818 Broadway Creek');
INSERT INTO Store1 VALUES ('The Natural Cafe',102649);
INSERT INTO FoodItemOffers2 VALUES (102649,789145,'Dazzling Cake');
INSERT INTO FoodItemOffers1 VALUES ('Dazzling Cake','The tastiest Cake possible');
INSERT INTO FoodItemOffers2 VALUES (472114,789145,'Amazing Coffee');
INSERT INTO FoodItemOffers1 VALUES ('Amazing Coffee','The tastiest Coffee possible');
INSERT INTO FoodItemOffers2 VALUES (403448,789145,'Beautiful Coffee');
INSERT INTO FoodItemOffers1 VALUES ('Beautiful Coffee','The tastiest Coffee possible');
INSERT INTO StoreManager VALUES (751547,'Leah9450','1118Carleton','Leah Carleton','447 Davie Hill');
INSERT INTO Store2 VALUES (821495,751547,'The Natural Boulangerie','585 Upland Center');
INSERT INTO Store1 VALUES ('The Natural Boulangerie',118031);
INSERT INTO FoodItemOffers2 VALUES (118031,821495,'Best Salad');
INSERT INTO FoodItemOffers1 VALUES ('Best Salad','The tastiest Salad possible');
INSERT INTO FoodItemOffers2 VALUES (459369,821495,'Traditional Sushi');
INSERT INTO FoodItemOffers1 VALUES ('Traditional Sushi','The tastiest Sushi possible');
INSERT INTO FoodItemOffers2 VALUES (922975,821495,'Jolly Chicken Strips');
INSERT INTO FoodItemOffers1 VALUES ('Jolly Chicken Strips','The tastiest Chicken Strips possible');
INSERT INTO FoodItemOffers2 VALUES (622856,821495,'Hot Curry');
INSERT INTO FoodItemOffers1 VALUES ('Hot Curry','The tastiest Curry possible');
INSERT INTO StoreManager VALUES (608718,'Sebastian3276','869Joey','Sebastian Joey','289 Beach Alley');
INSERT INTO Store2 VALUES (974529,608718,'The Healthy Pizzeria','883 Yew Place');
INSERT INTO Store1 VALUES ('The Healthy Pizzeria',261232);
INSERT INTO FoodItemOffers2 VALUES (261232,974529,'Cold Burrito');
INSERT INTO FoodItemOffers1 VALUES ('Cold Burrito','The tastiest Burrito possible');
INSERT INTO FoodItemOffers2 VALUES (786025,974529,'Natural Fries');
INSERT INTO FoodItemOffers1 VALUES ('Natural Fries','The tastiest Fries possible');
INSERT INTO FoodItemOffers2 VALUES (705359,974529,'Enjoyable Sandwich');
INSERT INTO FoodItemOffers1 VALUES ('Enjoyable Sandwich','The tastiest Sandwich possible');
INSERT INTO FoodItemOffers2 VALUES (287727,974529,'Dazzling Ice Cream');
INSERT INTO FoodItemOffers1 VALUES ('Dazzling Ice Cream','The tastiest Ice Cream possible');
INSERT INTO StoreManager VALUES (85331,'Taylor826','1895Yuki','Taylor Yuki','616 Gibbins Gardens');
INSERT INTO Store2 VALUES (343458,85331,'The Attractive Buffet','796 Sasamat Heights');
INSERT INTO Store1 VALUES ('The Attractive Buffet',939361);
INSERT INTO FoodItemOffers2 VALUES (939361,343458,'Dazzling Salad');
INSERT INTO FoodItemOffers1 VALUES ('Dazzling Salad','The tastiest Salad possible');
INSERT INTO FoodItemOffers2 VALUES (271821,343458,'Jolly Coffee');
INSERT INTO FoodItemOffers1 VALUES ('Jolly Coffee','The tastiest Coffee possible');
INSERT INTO FoodItemOffers2 VALUES (367921,343458,'Beautiful Burrito');
INSERT INTO FoodItemOffers1 VALUES ('Beautiful Burrito','The tastiest Burrito possible');
INSERT INTO StoreManager VALUES (509984,'Carleton9273','433Jennifer','Carleton Jennifer','376 Thurlow Place');
INSERT INTO Store2 VALUES (743441,509984,'The Cold Cafe','722 Carmel Terrace');
INSERT INTO Store1 VALUES ('The Cold Cafe',659193);
INSERT INTO FoodItemOffers2 VALUES (659193,743441,'Enjoyable Fries');
INSERT INTO FoodItemOffers1 VALUES ('Enjoyable Fries','The tastiest Fries possible');
INSERT INTO StoreManager VALUES (38228,'Beckett1661','3278David','Beckett David','254 Broadway Bouleletd');
INSERT INTO Store2 VALUES (486960,38228,'The Delicious Taco City','678 Broadway St');
INSERT INTO Store1 VALUES ('The Delicious Taco City',610684);
INSERT INTO FoodItemOffers2 VALUES (610684,486960,'Fresh Salad');
INSERT INTO FoodItemOffers1 VALUES ('Fresh Salad','The tastiest Salad possible');
INSERT INTO FoodItemOffers2 VALUES (535103,486960,'Beautiful Sushi');
INSERT INTO FoodItemOffers1 VALUES ('Beautiful Sushi','The tastiest Sushi possible');
INSERT INTO StoreManager VALUES (736482,'Whitney8011','2364Percy','Whitney Percy','463 Arbutus Creek');
INSERT INTO Store2 VALUES (43707,736482,'The Wonderful Tavern','528 Blanca Hill');
INSERT INTO Store1 VALUES ('The Wonderful Tavern',727194);
INSERT INTO FoodItemOffers2 VALUES (727194,43707,'Succulent Calzone');
INSERT INTO FoodItemOffers1 VALUES ('Succulent Calzone','The tastiest Calzone possible');
INSERT INTO FoodItemOffers2 VALUES (725872,43707,'Toasted Salad');
INSERT INTO FoodItemOffers1 VALUES ('Toasted Salad','The tastiest Salad possible');
INSERT INTO FoodItemOffers2 VALUES (638714,43707,'Magnificent Milkshake');
INSERT INTO FoodItemOffers1 VALUES ('Magnificent Milkshake','The tastiest Milkshake possible');
INSERT INTO FoodItemOffers2 VALUES (231020,43707,'Best Coffee');
INSERT INTO FoodItemOffers1 VALUES ('Best Coffee','The tastiest Coffee possible');
INSERT INTO FoodItemOffers2 VALUES (575340,43707,'Magical Taco');
INSERT INTO FoodItemOffers1 VALUES ('Magical Taco','The tastiest Taco possible');
INSERT INTO FoodItemOffers2 VALUES (565888,43707,'Best Burrito');
INSERT INTO FoodItemOffers1 VALUES ('Best Burrito','The tastiest Burrito possible');
INSERT INTO FoodItemOffers2 VALUES (535978,43707,'Jolly Burger');
INSERT INTO FoodItemOffers1 VALUES ('Jolly Burger','The tastiest Burger possible');
INSERT INTO FoodItemOffers2 VALUES (807572,43707,'Attractive Milkshake');
INSERT INTO FoodItemOffers1 VALUES ('Attractive Milkshake','The tastiest Milkshake possible');
INSERT INTO Customer VALUES (493630,'Wong6705','5546Robyn','Wong Robyn','543 Blanca Cr');
INSERT INTO Customer VALUES (110920,'Roy3165','3087Elon','Roy Elon','464 Sasamat Canyon');
INSERT INTO Customer VALUES (727309,'Bonnibel6747','5465Ross','Bonnibel Ross','260 Blanca Lane');
INSERT INTO Customer VALUES (389363,'Joey8038','9Hannah','Joey Hannah','433 Mainland Junction');
INSERT INTO Customer VALUES (838588,'Emily2153','3810Linda','Emily Linda','791 Gibbins Junction');
INSERT INTO Customer VALUES (820784,'Jackson4146','3884Michael','Jackson Michael','822 Eastdown Alley');
INSERT INTO Customer VALUES (68469,'Timothy6702','6501Faye','Timothy Faye','242 Gibbins Avenue');
INSERT INTO Customer VALUES (188425,'Joey8392','9374Dan','Joey Dan','821 Upland Junction');
INSERT INTO Customer VALUES (600212,'Lee9986','9972Rey','Lee Rey','811 Marine Alley');
INSERT INTO Customer VALUES (567705,'Joey8489','4193Jennifer','Joey Jennifer','880 Blanca Way');
INSERT INTO Customer VALUES (911919,'Taylor7532','2315Smith','Taylor Smith','368 Sasamat Square');
INSERT INTO Customer VALUES (516644,'Adam7943','3741James','Adam James','386 Pacific Hill');
INSERT INTO Customer VALUES (49348,'Susan7416','7468Winnie','Susan Winnie','173 Hamilton Gardens');
INSERT INTO Customer VALUES (5912,'Elle448','2886Adam','Elle Adam','820 Arbutus Cr');
INSERT INTO Customer VALUES (63448,'Jan4164','5139Jackson','Jan Jackson','881 Arbutus Avenue');
INSERT INTO Customer VALUES (794929,'Timothy8462','8780Winnie','Timothy Winnie','544 Pacific Avenue');
INSERT INTO Customer VALUES (959264,'Tim535','4819Cohen','Tim Cohen','676 Granville Alley');
INSERT INTO Customer VALUES (456653,'Han3154','1341Smith','Han Smith','822 Discovery Heights');
INSERT INTO Customer VALUES (306078,'Elle7584','4507Winnie','Elle Winnie','334 Thurlow St');
INSERT INTO Customer VALUES (247682,'Rey2377','1876Mary','Rey Mary','715 Cambie Square');
INSERT INTO Customer VALUES (675034,'Sara1468','2209Elle','Sara Elle','600 Carmel Avenue');
INSERT INTO Customer VALUES (615373,'Mary3828','6702Chris','Mary Chris','347 Gibbins Cr');
INSERT INTO Customer VALUES (716173,'James8679','569Smith','James Smith','810 Broadway Gardens');
INSERT INTO Customer VALUES (334412,'Kyra6750','9127Susan','Kyra Susan','5 Carmel Bouleletd');
INSERT INTO Customer VALUES (675356,'Rey6767','4771Elle','Rey Elle','118 Cambie Canyon');
INSERT INTO Customer VALUES (622878,'David321','4598Anderson','David Anderson','854 Arbutus Creek');
INSERT INTO Customer VALUES (574283,'Kyra4343','2105Michael','Kyra Michael','26 Broadway Hill');
INSERT INTO Customer VALUES (798618,'Smith8297','7672Patricia','Smith Patricia','192 Highland Grove');
INSERT INTO Customer VALUES (821993,'Hannah1657','1667Adam','Hannah Adam','260 Highland Place');
INSERT INTO Customer VALUES (278227,'Smith7557','9296Glenn','Smith Glenn','794 Sasamat Lane');
INSERT INTO Customer VALUES (475182,'Glenn7265','3007William','Glenn William','712 Thurlow Lane');
INSERT INTO Customer VALUES (422200,'David6214','5401Rey','David Rey','451 Mainland Dr');
INSERT INTO Customer VALUES (433970,'Han8093','6821Drake','Han Drake','267 Cambie Creek');
INSERT INTO Customer VALUES (640570,'Robert4479','9269Lydia','Robert Lydia','272 Marine Lane');
INSERT INTO Customer VALUES (57149,'Roy9728','945Leah','Roy Leah','424 Trafalgar Place');
INSERT INTO Customer VALUES (390519,'Dan8907','6066Roy','Dan Roy','993 Gibbins St');
INSERT INTO Customer VALUES (69753,'Chris8508','7703Robert','Chris Robert','278 Pender Hill');
INSERT INTO Customer VALUES (993585,'James8631','1678Susan','James Susan','587 Burrard Junction');
INSERT INTO Customer VALUES (721513,'Beckett645','9590Taylor','Beckett Taylor','365 Pender Alley');
INSERT INTO Customer VALUES (70524,'Anderson5785','1220Beckett','Anderson Beckett','119 Hamilton Square');
INSERT INTO Customer VALUES (663663,'Percy5788','2712Linda','Percy Linda','991 Marine Cr');
INSERT INTO Customer VALUES (374199,'Sebastian7324','9320Faye','Sebastian Faye','618 Burrard Junction');
INSERT INTO Customer VALUES (42906,'Drake3264','5288Jackson','Drake Jackson','643 Trafalgar Gardens');
INSERT INTO Customer VALUES (298177,'Chris3702','1330Whitney','Chris Whitney','238 Trafalgar Lane');
INSERT INTO Customer VALUES (805122,'Davis4143','8990Kim','Davis Kim','735 Cambie Terrace');
INSERT INTO Customer VALUES (289820,'Bill1305','1206Mary','Bill Mary','782 Pender Junction');
INSERT INTO Customer VALUES (889672,'Susan678','4782Nicki','Susan Nicki','176 Gibbins Cr');
INSERT INTO Customer VALUES (189817,'David3138','6452Taylor','David Taylor','687 Cambie Alley');
INSERT INTO Customer VALUES (511436,'Kyra6714','7058Bonnibel','Kyra Bonnibel','8 Highland Place');
INSERT INTO Customer VALUES (413564,'Nicki7388','6130Kyra','Nicki Kyra','185 Davie Way');
INSERT INTO Customer VALUES (194484,'Elon2473','4620Christie','Elon Christie','602 Mainland Terrace');
INSERT INTO Customer VALUES (662712,'Davis7656','9486Smith','Davis Smith','465 Arbutus Square');
INSERT INTO Customer VALUES (145632,'Kim7921','2450Kelly','Kim Kelly','375 Trafalgar St');
INSERT INTO Customer VALUES (41999,'Wong1051','4160Faye','Wong Faye','135 Sasamat Junction');
INSERT INTO Customer VALUES (996070,'Elon1333','4696Maria','Elon Maria','102 Arbutus Lane');
INSERT INTO Customer VALUES (131052,'Lena1668','7503George','Lena George','34 Eastdown Center');
INSERT INTO Customer VALUES (155114,'Emily7686','8041John','Emily John','183 Arbutus Square');
INSERT INTO Customer VALUES (443519,'Barbara7330','8289Jeff','Barbara Jeff','673 Marine Way');
INSERT INTO Customer VALUES (142979,'Yuri4534','1937Izuku','Yuri Izuku','87 Pacific Hill');
INSERT INTO Customer VALUES (650589,'Bill2744','5109Sebastian','Bill Sebastian','353 Upland Avenue');
INSERT INTO Customer VALUES (30590,'Adam5566','4736Kim','Adam Kim','517 Highland Square');
INSERT INTO Customer VALUES (813951,'Percy7486','1982Mary','Percy Mary','442 Arbutus Terrace');
INSERT INTO Customer VALUES (181452,'Robert8624','2488Wong','Robert Wong','409 Carmel Hill');
INSERT INTO Customer VALUES (433454,'Barbara6504','8300Carleton','Barbara Carleton','708 Sasamat Junction');
INSERT INTO Customer VALUES (938158,'Jan9675','9965Christie','Jan Christie','609 Blanca Grove');
INSERT INTO Customer VALUES (989188,'Jan930','8029Davis','Jan Davis','6 Sasamat St');
INSERT INTO Customer VALUES (462367,'Robyn8506','6953Sebastian','Robyn Sebastian','178 Carmel St');
INSERT INTO Customer VALUES (410747,'Dan6881','4225Barbara','Dan Barbara','227 Marine Canyon');
INSERT INTO Customer VALUES (306604,'Yuki7918','4666Michael','Yuki Michael','884 Mainland Lane');
INSERT INTO Customer VALUES (179664,'Lincoln5935','7299Whitney','Lincoln Whitney','61 Eastdown Grove');
INSERT INTO OrderFullfillsAndPlaces VALUES (453423,36420,179664,1528956088244);
INSERT INTO Contains VALUES (453423,920460);
INSERT INTO MessageSendsAndReceives VALUES (77780,36420,179664,'Your order #453423','Your order is on its way. Enjoy!',1528956088244);
INSERT INTO OrderFullfillsAndPlaces VALUES (208748,36420,57149,1528957029125);
INSERT INTO Contains VALUES (208748,920460);
INSERT INTO MessageSendsAndReceives VALUES (499008,36420,57149,'Your order #208748','Your order is on its way. Enjoy!',1528957029125);
INSERT INTO OrderFullfillsAndPlaces VALUES (5796,36420,675356,1528956394067);
INSERT INTO Contains VALUES (5796,920460);
INSERT INTO MessageSendsAndReceives VALUES (203093,36420,675356,'Your order #5796','Your order is on its way. Enjoy!',1528956394067);
INSERT INTO OrderFullfillsAndPlaces VALUES (614691,36420,516644,1528957441219);
INSERT INTO Contains VALUES (614691,920460);
INSERT INTO MessageSendsAndReceives VALUES (11979,36420,516644,'Your order #614691','Your order is on its way. Enjoy!',1528957441219);
INSERT INTO OrderFullfillsAndPlaces VALUES (89031,36420,989188,1528956951603);
INSERT INTO Contains VALUES (89031,920460);
INSERT INTO MessageSendsAndReceives VALUES (769045,36420,989188,'Your order #89031','Your order is on its way. Enjoy!',1528956951603);
INSERT INTO OrderFullfillsAndPlaces VALUES (790703,36420,131052,1528957743402);
INSERT INTO Contains VALUES (790703,920460);
INSERT INTO MessageSendsAndReceives VALUES (178787,36420,131052,'Your order #790703','Your order is on its way. Enjoy!',1528957743402);
INSERT INTO OrderFullfillsAndPlaces VALUES (593414,988843,938158,1528956424630);
INSERT INTO Contains VALUES (593414,357922);
INSERT INTO Contains VALUES (593414,451085);
INSERT INTO MessageSendsAndReceives VALUES (670396,988843,938158,'Your order #593414','Your order is on its way. Enjoy!',1528956424630);
INSERT INTO OrderFullfillsAndPlaces VALUES (787291,988843,716173,1528956391490);
INSERT INTO Contains VALUES (787291,451085);
INSERT INTO Contains VALUES (787291,116993);
INSERT INTO Contains VALUES (787291,261133);
INSERT INTO MessageSendsAndReceives VALUES (474094,988843,716173,'Your order #787291','Your order is on its way. Enjoy!',1528956391490);
INSERT INTO OrderFullfillsAndPlaces VALUES (899795,988843,410747,1528958007788);
INSERT INTO Contains VALUES (899795,116993);
INSERT INTO Contains VALUES (899795,471217);
INSERT INTO Contains VALUES (899795,261133);
INSERT INTO MessageSendsAndReceives VALUES (582343,988843,410747,'Your order #899795','Your order is on its way. Enjoy!',1528958007788);
INSERT INTO OrderFullfillsAndPlaces VALUES (908550,988843,663663,1528957884604);
INSERT INTO Contains VALUES (908550,261133);
INSERT INTO Contains VALUES (908550,440533);
INSERT INTO MessageSendsAndReceives VALUES (830395,988843,663663,'Your order #908550','Your order is on its way. Enjoy!',1528957884604);
INSERT INTO OrderFullfillsAndPlaces VALUES (571964,828721,493630,1528956835843);
INSERT INTO Contains VALUES (571964,450530);
INSERT INTO Contains VALUES (571964,869650);
INSERT INTO Contains VALUES (571964,871157);
INSERT INTO MessageSendsAndReceives VALUES (21918,828721,493630,'Your order #571964','Your order is on its way. Enjoy!',1528956835843);
INSERT INTO OrderFullfillsAndPlaces VALUES (509829,828721,662712,1528956466978);
INSERT INTO Contains VALUES (509829,450530);
INSERT INTO Contains VALUES (509829,871157);
INSERT INTO Contains VALUES (509829,869650);
INSERT INTO MessageSendsAndReceives VALUES (325405,828721,662712,'Your order #509829','Your order is on its way. Enjoy!',1528956466978);
INSERT INTO OrderFullfillsAndPlaces VALUES (92303,828721,798618,1528956219268);
INSERT INTO Contains VALUES (92303,450530);
INSERT INTO Contains VALUES (92303,869650);
INSERT INTO MessageSendsAndReceives VALUES (326688,828721,798618,'Your order #92303','Your order is on its way. Enjoy!',1528956219268);
INSERT INTO OrderFullfillsAndPlaces VALUES (453622,828721,5912,1528956558005);
INSERT INTO Contains VALUES (453622,869650);
INSERT INTO MessageSendsAndReceives VALUES (470476,828721,5912,'Your order #453622','Your order is on its way. Enjoy!',1528956558005);
INSERT INTO OrderFullfillsAndPlaces VALUES (905449,828721,278227,1528956382703);
INSERT INTO Contains VALUES (905449,871157);
INSERT INTO MessageSendsAndReceives VALUES (987835,828721,278227,'Your order #905449','Your order is on its way. Enjoy!',1528956382703);
INSERT INTO OrderFullfillsAndPlaces VALUES (378446,836537,615373,1528956373610);
INSERT INTO Contains VALUES (378446,781175);
INSERT INTO MessageSendsAndReceives VALUES (883458,836537,615373,'Your order #378446','Your order is on its way. Enjoy!',1528956373610);
INSERT INTO OrderFullfillsAndPlaces VALUES (938470,836537,511436,1528956448799);
INSERT INTO Contains VALUES (938470,467309);
INSERT INTO Contains VALUES (938470,334730);
INSERT INTO Contains VALUES (938470,958469);
INSERT INTO MessageSendsAndReceives VALUES (385506,836537,511436,'Your order #938470','Your order is on its way. Enjoy!',1528956448799);
INSERT INTO OrderFullfillsAndPlaces VALUES (897771,836537,938158,1528956719437);
INSERT INTO Contains VALUES (897771,43412);
INSERT INTO Contains VALUES (897771,334730);
INSERT INTO MessageSendsAndReceives VALUES (747483,836537,938158,'Your order #897771','Your order is on its way. Enjoy!',1528956719437);
INSERT INTO OrderFullfillsAndPlaces VALUES (850124,836537,662712,1528957293842);
INSERT INTO Contains VALUES (850124,781175);
INSERT INTO MessageSendsAndReceives VALUES (308422,836537,662712,'Your order #850124','Your order is on its way. Enjoy!',1528957293842);
INSERT INTO OrderFullfillsAndPlaces VALUES (835799,448835,650589,1528956350983);
INSERT INTO Contains VALUES (835799,523236);
INSERT INTO Contains VALUES (835799,186631);
INSERT INTO Contains VALUES (835799,726269);
INSERT INTO Contains VALUES (835799,949794);
INSERT INTO MessageSendsAndReceives VALUES (507648,448835,650589,'Your order #835799','Your order is on its way. Enjoy!',1528956350983);
INSERT INTO OrderFullfillsAndPlaces VALUES (468424,448835,422200,1528956053548);
INSERT INTO Contains VALUES (468424,850908);
INSERT INTO MessageSendsAndReceives VALUES (645767,448835,422200,'Your order #468424','Your order is on its way. Enjoy!',1528956053548);
INSERT INTO OrderFullfillsAndPlaces VALUES (80262,448835,993585,1528957358804);
INSERT INTO Contains VALUES (80262,949794);
INSERT INTO Contains VALUES (80262,992399);
INSERT INTO Contains VALUES (80262,186631);
INSERT INTO MessageSendsAndReceives VALUES (122308,448835,993585,'Your order #80262','Your order is on its way. Enjoy!',1528957358804);
INSERT INTO OrderFullfillsAndPlaces VALUES (550559,448835,794929,1528957994711);
INSERT INTO Contains VALUES (550559,726269);
INSERT INTO MessageSendsAndReceives VALUES (375883,448835,794929,'Your order #550559','Your order is on its way. Enjoy!',1528957994711);
INSERT INTO OrderFullfillsAndPlaces VALUES (205069,448835,996070,1528956923039);
INSERT INTO Contains VALUES (205069,523236);
INSERT INTO Contains VALUES (205069,850908);
INSERT INTO Contains VALUES (205069,949794);
INSERT INTO MessageSendsAndReceives VALUES (962876,448835,996070,'Your order #205069','Your order is on its way. Enjoy!',1528956923039);
INSERT INTO OrderFullfillsAndPlaces VALUES (799084,448835,813951,1528956207444);
INSERT INTO Contains VALUES (799084,523236);
INSERT INTO Contains VALUES (799084,992399);
INSERT INTO MessageSendsAndReceives VALUES (39331,448835,813951,'Your order #799084','Your order is on its way. Enjoy!',1528956207444);
INSERT INTO OrderFullfillsAndPlaces VALUES (307582,448835,306604,1528957266117);
INSERT INTO Contains VALUES (307582,992399);
INSERT INTO Contains VALUES (307582,949794);
INSERT INTO MessageSendsAndReceives VALUES (889688,448835,306604,'Your order #307582','Your order is on its way. Enjoy!',1528957266117);
INSERT INTO OrderFullfillsAndPlaces VALUES (810570,448835,389363,1528956251310);
INSERT INTO Contains VALUES (810570,992399);
INSERT INTO Contains VALUES (810570,850908);
INSERT INTO Contains VALUES (810570,186631);
INSERT INTO MessageSendsAndReceives VALUES (15327,448835,389363,'Your order #810570','Your order is on its way. Enjoy!',1528956251310);
INSERT INTO OrderFullfillsAndPlaces VALUES (848399,448835,181452,1528956154093);
INSERT INTO Contains VALUES (848399,726269);
INSERT INTO Contains VALUES (848399,186631);
INSERT INTO MessageSendsAndReceives VALUES (82809,448835,181452,'Your order #848399','Your order is on its way. Enjoy!',1528956154093);
INSERT INTO OrderFullfillsAndPlaces VALUES (312835,543367,247682,1528957821229);
INSERT INTO Contains VALUES (312835,199728);
INSERT INTO Contains VALUES (312835,382029);
INSERT INTO MessageSendsAndReceives VALUES (215067,543367,247682,'Your order #312835','Your order is on its way. Enjoy!',1528957821229);
INSERT INTO OrderFullfillsAndPlaces VALUES (489101,543367,155114,1528956805563);
INSERT INTO Contains VALUES (489101,199728);
INSERT INTO Contains VALUES (489101,382029);
INSERT INTO MessageSendsAndReceives VALUES (329195,543367,155114,'Your order #489101','Your order is on its way. Enjoy!',1528956805563);
INSERT INTO OrderFullfillsAndPlaces VALUES (782852,543367,49348,1528956430068);
INSERT INTO Contains VALUES (782852,382029);
INSERT INTO Contains VALUES (782852,358472);
INSERT INTO MessageSendsAndReceives VALUES (320588,543367,49348,'Your order #782852','Your order is on its way. Enjoy!',1528956430068);
INSERT INTO OrderFullfillsAndPlaces VALUES (764748,543367,433970,1528956631628);
INSERT INTO Contains VALUES (764748,358472);
INSERT INTO Contains VALUES (764748,338535);
INSERT INTO Contains VALUES (764748,199728);
INSERT INTO MessageSendsAndReceives VALUES (163649,543367,433970,'Your order #764748','Your order is on its way. Enjoy!',1528956631628);
INSERT INTO OrderFullfillsAndPlaces VALUES (680493,543367,63448,1528956160674);
INSERT INTO Contains VALUES (680493,338535);
INSERT INTO Contains VALUES (680493,199728);
INSERT INTO Contains VALUES (680493,973410);
INSERT INTO MessageSendsAndReceives VALUES (455591,543367,63448,'Your order #680493','Your order is on its way. Enjoy!',1528956160674);
INSERT INTO OrderFullfillsAndPlaces VALUES (319153,543367,334412,1528957120634);
INSERT INTO Contains VALUES (319153,338535);
INSERT INTO Contains VALUES (319153,973410);
INSERT INTO Contains VALUES (319153,358472);
INSERT INTO Contains VALUES (319153,199728);
INSERT INTO MessageSendsAndReceives VALUES (466848,543367,334412,'Your order #319153','Your order is on its way. Enjoy!',1528957120634);
INSERT INTO OrderFullfillsAndPlaces VALUES (270349,543367,989188,1528956957024);
INSERT INTO Contains VALUES (270349,382029);
INSERT INTO Contains VALUES (270349,973410);
INSERT INTO MessageSendsAndReceives VALUES (895772,543367,989188,'Your order #270349','Your order is on its way. Enjoy!',1528956957024);
INSERT INTO OrderFullfillsAndPlaces VALUES (26398,543367,821993,1528957712935);
INSERT INTO Contains VALUES (26398,973410);
INSERT INTO Contains VALUES (26398,338535);
INSERT INTO Contains VALUES (26398,358472);
INSERT INTO MessageSendsAndReceives VALUES (198583,543367,821993,'Your order #26398','Your order is on its way. Enjoy!',1528957712935);
INSERT INTO OrderFullfillsAndPlaces VALUES (943625,907754,69753,1528956130872);
INSERT INTO Contains VALUES (943625,274120);
INSERT INTO Contains VALUES (943625,778766);
INSERT INTO MessageSendsAndReceives VALUES (817461,907754,69753,'Your order #943625','Your order is on its way. Enjoy!',1528956130872);
INSERT INTO OrderFullfillsAndPlaces VALUES (333406,907754,798618,1528956921104);
INSERT INTO Contains VALUES (333406,439575);
INSERT INTO Contains VALUES (333406,3432);
INSERT INTO MessageSendsAndReceives VALUES (807178,907754,798618,'Your order #333406','Your order is on its way. Enjoy!',1528956921104);
INSERT INTO OrderFullfillsAndPlaces VALUES (162826,907754,516644,1528957809737);
INSERT INTO Contains VALUES (162826,439575);
INSERT INTO Contains VALUES (162826,778766);
INSERT INTO MessageSendsAndReceives VALUES (974071,907754,516644,'Your order #162826','Your order is on its way. Enjoy!',1528957809737);
INSERT INTO OrderFullfillsAndPlaces VALUES (792471,907754,42906,1528957028553);
INSERT INTO Contains VALUES (792471,274120);
INSERT INTO MessageSendsAndReceives VALUES (188248,907754,42906,'Your order #792471','Your order is on its way. Enjoy!',1528957028553);
INSERT INTO OrderFullfillsAndPlaces VALUES (216049,907754,189817,1528956460142);
INSERT INTO Contains VALUES (216049,3432);
INSERT INTO MessageSendsAndReceives VALUES (738267,907754,189817,'Your order #216049','Your order is on its way. Enjoy!',1528956460142);
INSERT INTO OrderFullfillsAndPlaces VALUES (896980,907754,813951,1528956687641);
INSERT INTO Contains VALUES (896980,3432);
INSERT INTO Contains VALUES (896980,274120);
INSERT INTO MessageSendsAndReceives VALUES (437213,907754,813951,'Your order #896980','Your order is on its way. Enjoy!',1528956687641);
INSERT INTO OrderFullfillsAndPlaces VALUES (833781,907754,57149,1528956083138);
INSERT INTO Contains VALUES (833781,274120);
INSERT INTO Contains VALUES (833781,439575);
INSERT INTO MessageSendsAndReceives VALUES (163832,907754,57149,'Your order #833781','Your order is on its way. Enjoy!',1528956083138);
INSERT INTO OrderFullfillsAndPlaces VALUES (157473,907754,374199,1528956601184);
INSERT INTO Contains VALUES (157473,3432);
INSERT INTO MessageSendsAndReceives VALUES (224564,907754,374199,'Your order #157473','Your order is on its way. Enjoy!',1528956601184);
INSERT INTO OrderFullfillsAndPlaces VALUES (664852,907754,433970,1528956224142);
INSERT INTO Contains VALUES (664852,439575);
INSERT INTO Contains VALUES (664852,274120);
INSERT INTO MessageSendsAndReceives VALUES (156674,907754,433970,'Your order #664852','Your order is on its way. Enjoy!',1528956224142);
INSERT INTO OrderFullfillsAndPlaces VALUES (187943,614271,567705,1528956826937);
INSERT INTO Contains VALUES (187943,187428);
INSERT INTO Contains VALUES (187943,979397);
INSERT INTO MessageSendsAndReceives VALUES (925256,614271,567705,'Your order #187943','Your order is on its way. Enjoy!',1528956826937);
INSERT INTO OrderFullfillsAndPlaces VALUES (653007,614271,462367,1528956266447);
INSERT INTO Contains VALUES (653007,979397);
INSERT INTO MessageSendsAndReceives VALUES (489886,614271,462367,'Your order #653007','Your order is on its way. Enjoy!',1528956266447);
INSERT INTO OrderFullfillsAndPlaces VALUES (605217,614271,675356,1528956541027);
INSERT INTO Contains VALUES (605217,979397);
INSERT INTO Contains VALUES (605217,187428);
INSERT INTO MessageSendsAndReceives VALUES (795877,614271,675356,'Your order #605217','Your order is on its way. Enjoy!',1528956541027);
INSERT INTO OrderFullfillsAndPlaces VALUES (792306,614271,334412,1528956100240);
INSERT INTO Contains VALUES (792306,187428);
INSERT INTO Contains VALUES (792306,979397);
INSERT INTO MessageSendsAndReceives VALUES (825443,614271,334412,'Your order #792306','Your order is on its way. Enjoy!',1528956100240);
INSERT INTO OrderFullfillsAndPlaces VALUES (687923,614271,389363,1528957423445);
INSERT INTO Contains VALUES (687923,979397);
INSERT INTO Contains VALUES (687923,187428);
INSERT INTO MessageSendsAndReceives VALUES (317261,614271,389363,'Your order #687923','Your order is on its way. Enjoy!',1528957423445);
INSERT INTO OrderFullfillsAndPlaces VALUES (873602,614271,493630,1528957040004);
INSERT INTO Contains VALUES (873602,979397);
INSERT INTO MessageSendsAndReceives VALUES (683723,614271,493630,'Your order #873602','Your order is on its way. Enjoy!',1528957040004);
INSERT INTO OrderFullfillsAndPlaces VALUES (266102,614271,63448,1528956752714);
INSERT INTO Contains VALUES (266102,979397);
INSERT INTO MessageSendsAndReceives VALUES (967172,614271,63448,'Your order #266102','Your order is on its way. Enjoy!',1528956752714);
INSERT INTO OrderFullfillsAndPlaces VALUES (721904,614271,567705,1528956872419);
INSERT INTO Contains VALUES (721904,979397);
INSERT INTO MessageSendsAndReceives VALUES (108052,614271,567705,'Your order #721904','Your order is on its way. Enjoy!',1528956872419);
INSERT INTO OrderFullfillsAndPlaces VALUES (889048,111260,189817,1528956233718);
INSERT INTO Contains VALUES (889048,498230);
INSERT INTO Contains VALUES (889048,315525);
INSERT INTO MessageSendsAndReceives VALUES (188681,111260,189817,'Your order #889048','Your order is on its way. Enjoy!',1528956233718);
INSERT INTO OrderFullfillsAndPlaces VALUES (531189,111260,820784,1528956967121);
INSERT INTO Contains VALUES (531189,119926);
INSERT INTO Contains VALUES (531189,315525);
INSERT INTO MessageSendsAndReceives VALUES (220949,111260,820784,'Your order #531189','Your order is on its way. Enjoy!',1528956967121);
INSERT INTO OrderFullfillsAndPlaces VALUES (813918,111260,475182,1528957123666);
INSERT INTO Contains VALUES (813918,315525);
INSERT INTO Contains VALUES (813918,498230);
INSERT INTO Contains VALUES (813918,119926);
INSERT INTO MessageSendsAndReceives VALUES (220625,111260,475182,'Your order #813918','Your order is on its way. Enjoy!',1528957123666);
INSERT INTO OrderFullfillsAndPlaces VALUES (841957,111260,959264,1528956678151);
INSERT INTO Contains VALUES (841957,119926);
INSERT INTO Contains VALUES (841957,954196);
INSERT INTO MessageSendsAndReceives VALUES (476880,111260,959264,'Your order #841957','Your order is on its way. Enjoy!',1528956678151);
INSERT INTO OrderFullfillsAndPlaces VALUES (39780,111260,389363,1528957031875);
INSERT INTO Contains VALUES (39780,954196);
INSERT INTO Contains VALUES (39780,498230);
INSERT INTO MessageSendsAndReceives VALUES (486235,111260,389363,'Your order #39780','Your order is on its way. Enjoy!',1528957031875);
INSERT INTO OrderFullfillsAndPlaces VALUES (460579,111260,42906,1528956319798);
INSERT INTO Contains VALUES (460579,498230);
INSERT INTO Contains VALUES (460579,954196);
INSERT INTO MessageSendsAndReceives VALUES (243490,111260,42906,'Your order #460579','Your order is on its way. Enjoy!',1528956319798);
INSERT INTO OrderFullfillsAndPlaces VALUES (270485,111260,798618,1528956064884);
INSERT INTO Contains VALUES (270485,119926);
INSERT INTO Contains VALUES (270485,954196);
INSERT INTO MessageSendsAndReceives VALUES (389176,111260,798618,'Your order #270485','Your order is on its way. Enjoy!',1528956064884);
INSERT INTO OrderFullfillsAndPlaces VALUES (34287,111260,615373,1528956968185);
INSERT INTO Contains VALUES (34287,315525);
INSERT INTO MessageSendsAndReceives VALUES (701230,111260,615373,'Your order #34287','Your order is on its way. Enjoy!',1528956968185);
INSERT INTO OrderFullfillsAndPlaces VALUES (94012,111260,663663,1528956170376);
INSERT INTO Contains VALUES (94012,498230);
INSERT INTO Contains VALUES (94012,119926);
INSERT INTO Contains VALUES (94012,954196);
INSERT INTO MessageSendsAndReceives VALUES (492446,111260,663663,'Your order #94012','Your order is on its way. Enjoy!',1528956170376);
INSERT INTO OrderFullfillsAndPlaces VALUES (372554,585061,131052,1528956529676);
INSERT INTO Contains VALUES (372554,83370);
INSERT INTO MessageSendsAndReceives VALUES (149655,585061,131052,'Your order #372554','Your order is on its way. Enjoy!',1528956529676);
INSERT INTO OrderFullfillsAndPlaces VALUES (590435,585061,41999,1528957283890);
INSERT INTO Contains VALUES (590435,83370);
INSERT INTO Contains VALUES (590435,486243);
INSERT INTO MessageSendsAndReceives VALUES (634240,585061,41999,'Your order #590435','Your order is on its way. Enjoy!',1528957283890);
INSERT INTO OrderFullfillsAndPlaces VALUES (910250,585061,30590,1528957274578);
INSERT INTO Contains VALUES (910250,573846);
INSERT INTO MessageSendsAndReceives VALUES (402616,585061,30590,'Your order #910250','Your order is on its way. Enjoy!',1528957274578);
INSERT INTO OrderFullfillsAndPlaces VALUES (77941,585061,131052,1528957981594);
INSERT INTO Contains VALUES (77941,486243);
INSERT INTO MessageSendsAndReceives VALUES (372922,585061,131052,'Your order #77941','Your order is on its way. Enjoy!',1528957981594);
INSERT INTO OrderFullfillsAndPlaces VALUES (467106,585061,838588,1528956923407);
INSERT INTO Contains VALUES (467106,486243);
INSERT INTO Contains VALUES (467106,83370);
INSERT INTO MessageSendsAndReceives VALUES (120645,585061,838588,'Your order #467106','Your order is on its way. Enjoy!',1528956923407);
INSERT INTO OrderFullfillsAndPlaces VALUES (668530,585061,996070,1528956856244);
INSERT INTO Contains VALUES (668530,486243);
INSERT INTO Contains VALUES (668530,573846);
INSERT INTO MessageSendsAndReceives VALUES (274698,585061,996070,'Your order #668530','Your order is on its way. Enjoy!',1528956856244);
INSERT INTO OrderFullfillsAndPlaces VALUES (627077,585061,675034,1528957251431);
INSERT INTO Contains VALUES (627077,573846);
INSERT INTO MessageSendsAndReceives VALUES (295419,585061,675034,'Your order #627077','Your order is on its way. Enjoy!',1528957251431);
INSERT INTO OrderFullfillsAndPlaces VALUES (806787,651268,640570,1528957799933);
INSERT INTO Contains VALUES (806787,947031);
INSERT INTO Contains VALUES (806787,988022);
INSERT INTO MessageSendsAndReceives VALUES (425561,651268,640570,'Your order #806787','Your order is on its way. Enjoy!',1528957799933);
INSERT INTO OrderFullfillsAndPlaces VALUES (53525,296824,911919,1528957543150);
INSERT INTO Contains VALUES (53525,424366);
INSERT INTO Contains VALUES (53525,837679);
INSERT INTO MessageSendsAndReceives VALUES (289074,296824,911919,'Your order #53525','Your order is on its way. Enjoy!',1528957543150);
INSERT INTO OrderFullfillsAndPlaces VALUES (41426,296824,727309,1528956503502);
INSERT INTO Contains VALUES (41426,123737);
INSERT INTO Contains VALUES (41426,424366);
INSERT INTO MessageSendsAndReceives VALUES (82344,296824,727309,'Your order #41426','Your order is on its way. Enjoy!',1528956503502);
INSERT INTO OrderFullfillsAndPlaces VALUES (81748,296824,278227,1528956050910);
INSERT INTO Contains VALUES (81748,123737);
INSERT INTO MessageSendsAndReceives VALUES (603261,296824,278227,'Your order #81748','Your order is on its way. Enjoy!',1528956050910);
INSERT INTO OrderFullfillsAndPlaces VALUES (273810,500748,68469,1528956194945);
INSERT INTO Contains VALUES (273810,267894);
INSERT INTO Contains VALUES (273810,460690);
INSERT INTO MessageSendsAndReceives VALUES (65235,500748,68469,'Your order #273810','Your order is on its way. Enjoy!',1528956194945);
INSERT INTO OrderFullfillsAndPlaces VALUES (717904,500748,675356,1528957089336);
INSERT INTO Contains VALUES (717904,287634);
INSERT INTO Contains VALUES (717904,257250);
INSERT INTO MessageSendsAndReceives VALUES (292689,500748,675356,'Your order #717904','Your order is on its way. Enjoy!',1528957089336);
INSERT INTO OrderFullfillsAndPlaces VALUES (196181,500748,306078,1528957378742);
INSERT INTO Contains VALUES (196181,460690);
INSERT INTO Contains VALUES (196181,287634);
INSERT INTO Contains VALUES (196181,267894);
INSERT INTO Contains VALUES (196181,640071);
INSERT INTO MessageSendsAndReceives VALUES (393541,500748,306078,'Your order #196181','Your order is on its way. Enjoy!',1528957378742);
INSERT INTO OrderFullfillsAndPlaces VALUES (857187,500748,959264,1528957765301);
INSERT INTO Contains VALUES (857187,267894);
INSERT INTO MessageSendsAndReceives VALUES (479472,500748,959264,'Your order #857187','Your order is on its way. Enjoy!',1528957765301);
INSERT INTO OrderFullfillsAndPlaces VALUES (930728,789145,194484,1528957895956);
INSERT INTO Contains VALUES (930728,472114);
INSERT INTO MessageSendsAndReceives VALUES (188313,789145,194484,'Your order #930728','Your order is on its way. Enjoy!',1528957895956);
INSERT INTO OrderFullfillsAndPlaces VALUES (304923,789145,69753,1528956157787);
INSERT INTO Contains VALUES (304923,472114);
INSERT INTO Contains VALUES (304923,102649);
INSERT INTO MessageSendsAndReceives VALUES (609919,789145,69753,'Your order #304923','Your order is on its way. Enjoy!',1528956157787);
INSERT INTO OrderFullfillsAndPlaces VALUES (345261,789145,663663,1528956152273);
INSERT INTO Contains VALUES (345261,102649);
INSERT INTO Contains VALUES (345261,472114);
INSERT INTO Contains VALUES (345261,403448);
INSERT INTO MessageSendsAndReceives VALUES (140297,789145,663663,'Your order #345261','Your order is on its way. Enjoy!',1528956152273);
INSERT INTO OrderFullfillsAndPlaces VALUES (79675,821495,334412,1528956839326);
INSERT INTO Contains VALUES (79675,622856);
INSERT INTO MessageSendsAndReceives VALUES (765112,821495,334412,'Your order #79675','Your order is on its way. Enjoy!',1528956839326);
INSERT INTO OrderFullfillsAndPlaces VALUES (683275,821495,188425,1528956172381);
INSERT INTO Contains VALUES (683275,459369);
INSERT INTO Contains VALUES (683275,922975);
INSERT INTO Contains VALUES (683275,118031);
INSERT INTO MessageSendsAndReceives VALUES (630950,821495,188425,'Your order #683275','Your order is on its way. Enjoy!',1528956172381);
INSERT INTO OrderFullfillsAndPlaces VALUES (678916,821495,410747,1528957082045);
INSERT INTO Contains VALUES (678916,459369);
INSERT INTO Contains VALUES (678916,622856);
INSERT INTO MessageSendsAndReceives VALUES (468169,821495,410747,'Your order #678916','Your order is on its way. Enjoy!',1528957082045);
INSERT INTO OrderFullfillsAndPlaces VALUES (973411,821495,475182,1528956586947);
INSERT INTO Contains VALUES (973411,622856);
INSERT INTO MessageSendsAndReceives VALUES (642137,821495,475182,'Your order #973411','Your order is on its way. Enjoy!',1528956586947);
INSERT INTO OrderFullfillsAndPlaces VALUES (980031,974529,155114,1528957647883);
INSERT INTO Contains VALUES (980031,705359);
INSERT INTO Contains VALUES (980031,287727);
INSERT INTO Contains VALUES (980031,261232);
INSERT INTO Contains VALUES (980031,786025);
INSERT INTO MessageSendsAndReceives VALUES (553650,974529,155114,'Your order #980031','Your order is on its way. Enjoy!',1528957647883);
INSERT INTO OrderFullfillsAndPlaces VALUES (731317,343458,433454,1528956451754);
INSERT INTO Contains VALUES (731317,939361);
INSERT INTO Contains VALUES (731317,367921);
INSERT INTO MessageSendsAndReceives VALUES (636050,343458,433454,'Your order #731317','Your order is on its way. Enjoy!',1528956451754);
INSERT INTO OrderFullfillsAndPlaces VALUES (590675,343458,820784,1528957279243);
INSERT INTO Contains VALUES (590675,271821);
INSERT INTO Contains VALUES (590675,939361);
INSERT INTO Contains VALUES (590675,367921);
INSERT INTO MessageSendsAndReceives VALUES (553951,343458,820784,'Your order #590675','Your order is on its way. Enjoy!',1528957279243);
INSERT INTO OrderFullfillsAndPlaces VALUES (19538,343458,938158,1528957780301);
INSERT INTO Contains VALUES (19538,271821);
INSERT INTO Contains VALUES (19538,939361);
INSERT INTO MessageSendsAndReceives VALUES (623903,343458,938158,'Your order #19538','Your order is on its way. Enjoy!',1528957780301);
INSERT INTO OrderFullfillsAndPlaces VALUES (903022,343458,189817,1528956949349);
INSERT INTO Contains VALUES (903022,367921);
INSERT INTO Contains VALUES (903022,939361);
INSERT INTO Contains VALUES (903022,271821);
INSERT INTO MessageSendsAndReceives VALUES (263083,343458,189817,'Your order #903022','Your order is on its way. Enjoy!',1528956949349);
INSERT INTO OrderFullfillsAndPlaces VALUES (352815,343458,49348,1528957102613);
INSERT INTO Contains VALUES (352815,367921);
INSERT INTO Contains VALUES (352815,939361);
INSERT INTO MessageSendsAndReceives VALUES (15709,343458,49348,'Your order #352815','Your order is on its way. Enjoy!',1528957102613);
INSERT INTO OrderFullfillsAndPlaces VALUES (253295,343458,794929,1528956838433);
INSERT INTO Contains VALUES (253295,271821);
INSERT INTO Contains VALUES (253295,367921);
INSERT INTO MessageSendsAndReceives VALUES (629730,343458,794929,'Your order #253295','Your order is on its way. Enjoy!',1528956838433);
INSERT INTO OrderFullfillsAndPlaces VALUES (5636,343458,622878,1528957416447);
INSERT INTO Contains VALUES (5636,939361);
INSERT INTO Contains VALUES (5636,367921);
INSERT INTO Contains VALUES (5636,271821);
INSERT INTO MessageSendsAndReceives VALUES (703306,343458,622878,'Your order #5636','Your order is on its way. Enjoy!',1528957416447);
INSERT INTO OrderFullfillsAndPlaces VALUES (393247,343458,181452,1528956835512);
INSERT INTO Contains VALUES (393247,939361);
INSERT INTO Contains VALUES (393247,271821);
INSERT INTO MessageSendsAndReceives VALUES (834531,343458,181452,'Your order #393247','Your order is on its way. Enjoy!',1528956835512);
INSERT INTO OrderFullfillsAndPlaces VALUES (679171,343458,911919,1528956981476);
INSERT INTO Contains VALUES (679171,367921);
INSERT INTO Contains VALUES (679171,939361);
INSERT INTO MessageSendsAndReceives VALUES (847062,343458,911919,'Your order #679171','Your order is on its way. Enjoy!',1528956981476);
INSERT INTO OrderFullfillsAndPlaces VALUES (153823,743441,663663,1528956720525);
INSERT INTO Contains VALUES (153823,659193);
INSERT INTO MessageSendsAndReceives VALUES (775350,743441,663663,'Your order #153823','Your order is on its way. Enjoy!',1528956720525);
INSERT INTO OrderFullfillsAndPlaces VALUES (920705,743441,389363,1528956266463);
INSERT INTO Contains VALUES (920705,659193);
INSERT INTO MessageSendsAndReceives VALUES (74192,743441,389363,'Your order #920705','Your order is on its way. Enjoy!',1528956266463);
INSERT INTO OrderFullfillsAndPlaces VALUES (264376,486960,179664,1528956347178);
INSERT INTO Contains VALUES (264376,610684);
INSERT INTO Contains VALUES (264376,535103);
INSERT INTO MessageSendsAndReceives VALUES (74338,486960,179664,'Your order #264376','Your order is on its way. Enjoy!',1528956347178);
INSERT INTO OrderFullfillsAndPlaces VALUES (571086,43707,640570,1528957113916);
INSERT INTO Contains VALUES (571086,231020);
INSERT INTO Contains VALUES (571086,535978);
INSERT INTO MessageSendsAndReceives VALUES (437294,43707,640570,'Your order #571086','Your order is on its way. Enjoy!',1528957113916);
INSERT INTO OrderFullfillsAndPlaces VALUES (806274,43707,189817,1528957368774);
INSERT INTO Contains VALUES (806274,535978);
INSERT INTO Contains VALUES (806274,231020);
INSERT INTO Contains VALUES (806274,807572);
INSERT INTO MessageSendsAndReceives VALUES (955953,43707,189817,'Your order #806274','Your order is on its way. Enjoy!',1528957368774);
INSERT INTO OrderFullfillsAndPlaces VALUES (430792,43707,996070,1528956501690);
INSERT INTO Contains VALUES (430792,638714);
INSERT INTO Contains VALUES (430792,725872);
INSERT INTO MessageSendsAndReceives VALUES (588051,43707,996070,'Your order #430792','Your order is on its way. Enjoy!',1528956501690);
INSERT INTO OrderFullfillsAndPlaces VALUES (242777,43707,30590,1528957431526);
INSERT INTO Contains VALUES (242777,575340);
INSERT INTO Contains VALUES (242777,638714);
INSERT INTO Contains VALUES (242777,725872);
INSERT INTO MessageSendsAndReceives VALUES (31865,43707,30590,'Your order #242777','Your order is on its way. Enjoy!',1528957431526);
INSERT INTO OrderFullfillsAndPlaces VALUES (992231,43707,194484,1528956268225);
INSERT INTO Contains VALUES (992231,727194);
INSERT INTO Contains VALUES (992231,725872);
INSERT INTO Contains VALUES (992231,638714);
INSERT INTO MessageSendsAndReceives VALUES (194041,43707,194484,'Your order #992231','Your order is on its way. Enjoy!',1528956268225);
INSERT INTO OrderFullfillsAndPlaces VALUES (337176,43707,911919,1528957880089);
INSERT INTO Contains VALUES (337176,231020);
INSERT INTO MessageSendsAndReceives VALUES (522100,43707,911919,'Your order #337176','Your order is on its way. Enjoy!',1528957880089);
INSERT INTO OrderFullfillsAndPlaces VALUES (197418,43707,721513,1528956656859);
INSERT INTO Contains VALUES (197418,535978);
INSERT INTO Contains VALUES (197418,638714);
INSERT INTO Contains VALUES (197418,231020);
INSERT INTO Contains VALUES (197418,727194);
INSERT INTO MessageSendsAndReceives VALUES (626297,43707,721513,'Your order #197418','Your order is on its way. Enjoy!',1528956656859);
INSERT INTO OrderFullfillsAndPlaces VALUES (360069,43707,640570,1528956059324);
INSERT INTO Contains VALUES (360069,565888);
INSERT INTO Contains VALUES (360069,535978);
INSERT INTO Contains VALUES (360069,575340);
INSERT INTO MessageSendsAndReceives VALUES (857967,43707,640570,'Your order #360069','Your order is on its way. Enjoy!',1528956059324);

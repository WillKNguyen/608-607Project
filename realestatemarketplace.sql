DROP DATABASE IF EXISTS REALESTATEMARKETPLACE;
CREATE DATABASE REALESTATEMARKETPLACE; 
USE REALESTATEMARKETPLACE;

DROP TABLE IF EXISTS WEBSITE_USER;
CREATE TABLE WEBSITE_USER (
	Email			varchar(255)	not null,
	UserName		varchar(30),
	Phone			varchar(10),
    UserPassword	varchar(30),
    primary key (Email)
);

INSERT INTO WEBSITE_USER (Email, UserName, Phone, UserPassword)
VALUES
('eric@ucalgary.ca', 'Eric', '4031012222', 'ericp'),
('will@ucalgary.ca', 'Will', '4032023333', 'willp'),
('ardit@ucalgary.ca', 'Ardit', '4033034444', 'arditp'),
('feras@ucalgary.ca', 'Feras', '4034045555', 'ferasp');


DROP TABLE IF EXISTS BUYER;
CREATE TABLE BUYER (
	Email			varchar(255)	not null,
    ScreenName		varchar(30),
	primary key (Email)
);

INSERT INTO BUYER (Email, ScreenName)
VALUES
('eric@ucalgary.ca', 'eric meister'),
('will@ucalgary.ca', 'willn');


DROP TABLE IF EXISTS SELLER;
CREATE TABLE SELLER (
	Email 				varchar(255)	not null,
    SCompany			varchar(30),
    SRating				integer,
    SLanguage			varchar(30),
    primary key (Email)
);

INSERT INTO SELLER (Email, SCompany, SRating, SLanguage)
VALUES
('ardit@ucalgary.ca', 'ABC', '9', 'English'),
('feras@ucalgary.ca', 'XYZ', '7', 'English');


DROP TABLE IF EXISTS NEIGHBOURHOOD;
CREATE TABLE NEIGHBOURHOOD (
	NeighbourhoodId		integer,
    AveragePrice		float,
    WalkScore			float,
    BikeScore			float,
    primary key (NeighbourhoodId)
);

INSERT INTO NEIGHBOURHOOD (NeighbourhoodId, AveragePrice, WalkScore, BikeScore)
VALUES
(1, 400000, 8, 6),
(2, 500000, 9, 7),
(3, 600000, 10, 8);


DROP TABLE IF EXISTS PROPERTY;
CREATE TABLE PROPERTY (
	MLS					varchar(10)	not null,
    Address				varchar(255),
    CurrentPrice		integer,
    Bedrooms			integer,
    Bathrooms			integer,
    PropertyType		varchar(30),
    SoldBy				varchar(30),
    NId					integer,
    primary key (MLS),
    foreign key (NId) references NEIGHBOURHOOD(NeighbourhoodId)
);

INSERT INTO PROPERTY (MLS, Address, CurrentPrice, Bedrooms, Bathrooms, PropertyType, SoldBy, NId)
VALUES
('SK913993', '207 Lehrer PLACE, Saskatoon, SK S7R 0L4', 669900, 3, 2, 'House', 'ardit@ucalgary.ca', 1),
('SK914061', '3104 Ortona STREET, Saskatoon, SK S7M 3R4', 619900, 3, 3, 'House', 'ardit@ucalgary.ca', 2),
('SK914153', '714A Victoria AVENUE, Saskatoon, SK S7N 0Z2', 374900, 3, 3, 'House', 'ardit@ucalgary.ca', 3),
('SK914148', '246 Frobisher CRESCENT, Saskatoon, SK S7K 4Y7', 479900, 5, 3, 'House', 'ardit@ucalgary.ca', 1),
('SK914086', '739 Hastings COVE, Saskatoon, SK S7V 0G6', 899900, 4, 3, 'House', 'ardit@ucalgary.ca', 2),
('SK914075', '334 Crean CRESCENT, Saskatoon, SK S7J 3X2', 419900, 4, 3, 'House', 'ardit@ucalgary.ca', 3),
('SK914144', '962 Kloppenburg CRESCENT, Saskatoon, SK S7W 0P2', 559900, 5, 3, 'House', 'ardit@ucalgary.ca', 1),
('SK914082', '2435 Rosewood DRIVE, Saskatoon, SK S7V 0Z3', 554300, 3, 3, 'House', 'ardit@ucalgary.ca', 2),
('SK914108', '1 Bow COURT, Saskatoon, SK S7K 1H9', 399000, 4, 3, 'House', 'ardit@ucalgary.ca', 3),
('E4320360', '14611 95th St NW, Edmonton, AB T5E 3Y7', 575000, 6, 2, 'House', 'ardit@ucalgary.ca', 1),
('E4320364', '10465 42nd Ave NW, Edmonton, AB T6J 7C7', 429900, 2, 3, 'Condo', 'ardit@ucalgary.ca', 2),
('E4320358', '10346 142nd St NW, Edmonton, AB T5N 2P1', 393000, 5, 2, 'House', 'ardit@ucalgary.ca', 3),
('E4320355', '5512 145th Ave NW, Edmonton, AB T5A 3R3', 185000, 3, 3, 'House', 'ardit@ucalgary.ca', 1),
('E4320309', '4611 128th Ave NW, Edmonton, AB T5A 2M7', 399900, 4, 3, 'House', 'ardit@ucalgary.ca', 2),
('E4320357', '7339 S Terwillegar Dr NW #1418, Edmonton, AB T6R 0M1', 130000, 1, 1, 'Condo', 'ardit@ucalgary.ca', 3),
('E4320331', '1711 109th St NW, Edmonton, AB T6J 5Z8', 519900, 5, 4, 'House', 'ardit@ucalgary.ca', 1),
('E4320291', '13239 Delwood Rd NW, Edmonton, AB T5C 3B5', 299990, 5, 2, 'House', 'ardit@ucalgary.ca', 2),
('E4320295', '12631 161st Ave NW, Edmonton, AB T5X 4W7', 350000, 4, 3, 'House', 'ardit@ucalgary.ca', 3),
('C4320250', '64 S Citadel Dr NW, Calgary, AB T3G 3V1', 529900, 3, 3, 'House', 'ardit@ucalgary.ca', 1),
('C4320251', '957 S Rundlecairn Way NE, Calgary, AB T1Y 2W7', 429900, 5, 3, 'House', 'ardit@ucalgary.ca', 2),
('C4320252', '220 W Deer Park Pl SE, Calgary, AB T2J 5M2', 499900, 4, 3, 'House', 'ardit@ucalgary.ca', 3),
('C4320253', '10 Sage Hill Way NW #111, Calgary, AB T3R 0H5', 369900, 2, 2, 'Condo', 'ardit@ucalgary.ca', 1),
('C4320254', '425 N 12th Ave NE, Calgary, AB T2E 1A7', 799500, 4, 3, 'House', 'ardit@ucalgary.ca', 2),
('C4320255', '3519 N 49th St NW #28, Calgary, AB T3A 2C7', 189000, 2, 1, 'Condo', 'ardit@ucalgary.ca', 3),
('C4320256', '2232 Langriville Dr SW, Calgary, AB T3E 5G7', 925000, 5, 3, 'House', 'ardit@ucalgary.ca', 1),
('C4320257', '256 E Edgebank Cir NW, Calgary, AB T3A 4W1', 968000, 5, 3, 'House', 'ardit@ucalgary.ca', 2),
('C4320258', '3415 NE Bonita Cres NW, Calgary, AB T3B 2R9', 499000, 8, 2, 'House', 'ardit@ucalgary.ca', 3),
('W5827624', '173 Wallace Ave, Toronto, ON M6H 1V3', 1699000, 4, 4, 'House', 'ardit@ucalgary.ca', 1),
('C5827688', '131 Hillmount Ave, Toronto, ON M6B 1X7', 1999000, 3, 2, 'House', 'ardit@ucalgary.ca', 2),
('E5827522', '1125 Warden Ave, Toronto, ON M1R 2P8', 1069000, 3, 2, 'House', 'ardit@ucalgary.ca', 3),
('E5827792', '30 Baseball Pl #1408, Toronto, ON M4M 0E8', 539900, 1, 1, 'Condo', 'ardit@ucalgary.ca', 1),
('E5827793', '51 Burnfield Ave, Toronto, ON M6G 1Y4', 2350000, 3, 4, 'House', 'ardit@ucalgary.ca', 2),
('E5827794', '55 Harbour Sq #2516, Toronto, ON M5J 2L1', 698000, 1, 1, 'Condo', 'ardit@ucalgary.ca', 3),
('C5827824', '45 Sunrise Ave #104, Toronto, ON M4A 2S3', 599999, 3, 2, 'House', 'ardit@ucalgary.ca', 1),
('C5827723', '348 Brunswick Ave, Toronto, ON M5R 2Y9', 2995000, 4, 4, 'House', 'ardit@ucalgary.ca', 2),
('C5827831', '33 Bay St #2808, Toronto, ON M5J 2Z3', 1258000, 2, 2, 'Condo', 'ardit@ucalgary.ca', 3),
('W5827705', '485 Meadows Blvd #12, Mississauga, ON L4Z 1H1', 824900, 3, 3, 'House', 'ardit@ucalgary.ca', 1),
('W5827706', '2929 Aquitaine Ave #405, Mississauga, ON L5N 2C7', 500000, 2, 2, 'Condo', 'ardit@ucalgary.ca', 2),
('W5827674', '6860 Glen Erin Dr UNIT 30, Mississauga, ON L5N 2E1', 789900, 3, 3, 'House', 'ardit@ucalgary.ca', 3),
('W5827547', '325 Webb Dr #310, Mississauga, ON L5B 3Z9', 549999, 2, 2, 'Condo', 'ardit@ucalgary.ca', 1),
('W5827548', '1425 Chriseden Dr, Mississauga, ON L5H 1V3', 4125000, 4, 5, 'House', 'ardit@ucalgary.ca', 2),
('W5827299', '660 Arbor Rd, Mississauga, ON L5G 2J9', 999000, 4, 3, 'House', 'ardit@ucalgary.ca', 3),
('W5827300', '945 Meadow Wood Rd, Mississauga, ON L5J 2S8', 2650000, 4, 1, 'House', 'ardit@ucalgary.ca', 1),
('W5826773', '2358 Cobbinshaw Cir, Mississauga, ON L5N 2G3', 1089000, 3, 3, 'House', 'ardit@ucalgary.ca', 2),
('40331876', '2280 Doulton Dr, Mississauga, ON L5H 3M1', 13890000, 5, 9, 'House', 'ardit@ucalgary.ca', 3),
('202226140', '25 Remington Ct, Halifax, NS B3M 3Y6', 499900, 3, 2, 'House', 'ardit@ucalgary.ca', 1),
('202225990', '55 Kearney Lake Rd, Halifax, NS B3M 2S6', 569900, 2, 2, 'Condo', 'ardit@ucalgary.ca', 2),
('202215459', '1160 Rockcliffe St, Halifax, NS B3H 3Y6', 7450000, 4, 5, 'House', 'ardit@ucalgary.ca', 3),
('202226090', '1650 Granville St #904, Halifax, NS B3J 0E1', 869000, 2, 2, 'Condo', 'ardit@ucalgary.ca', 1),
('202225003', '68 Hartlen Ave, Halifax, NS B3R 1R6', 379900, 3, 2, 'House', 'ardit@ucalgary.ca', 2),
('202223264', '1233 Purcells Cove Rd, Halifax, NS B3P 1B3', 499000, 3, 2, 'House', 'ardit@ucalgary.ca', 3),
('202212337', '2947 Purcells Cove Rd, Halifax, NS B3P 2G2', 1995000, 3, 3, 'House', 'ardit@ucalgary.ca', 1),
('202224206', '13 McFatridge Rd, Halifax, NS B3N 2R2', 369900, 2, 2, 'Condo', 'ardit@ucalgary.ca', 2),
('202225587', '29 Gateway Rd, Halifax, NS B3M 1M6', 499900, 4, 2, 'House', 'ardit@ucalgary.ca', 3),
('R2738427', '1020 Harwood St #1504, Vancouver, BC V6E 4R1', 1199000, 2, 2, 'Condo', 'ardit@ucalgary.ca', 1),
('R2738459', '1718 Venables St #404, Vancouver, BC V5L 2H4', 689000, 1, 1, 'Condo', 'ardit@ucalgary.ca', 2),
('R2738462', '1330 Burrard St #306, Vancouver, BC V6Z 2B8', 519000, 2, 1, 'Condo', 'ardit@ucalgary.ca', 3),
('R2738122', '4515 W 14th Ave, Vancouver, BC V6R 2Y5', 3088000, 5, 4, 'House', 'ardit@ucalgary.ca', 1),
('R2738271', '3678 E 25th Ave, Vancouver, BC V5R 1K5', 1788800, 4, 2, 'House', 'ardit@ucalgary.ca', 2),
('R2738190', '3537 Osler St, Vancouver, BC V6H 2W4', 23800000, 5, 9, 'House', 'ardit@ucalgary.ca', 3),
('R2738436', '621 W 51st Ave, Vancouver, BC V6P 1B9', 4289000, 6, 7, 'House', 'ardit@ucalgary.ca', 1),
('R2697014', '1318 Minto Cres, Vancouver, BC V6H 2J5', 24800000, 5, 9, 'House', 'ardit@ucalgary.ca', 2),
('R2738458', '345 E 64th Ave, Vancouver, BC V5X 2M8', 1699000, 5, 4, 'House', 'ardit@ucalgary.ca', 3),
('R2738460', '137 Burrows Ave, Winnipeg, MB R2W 1Z3', 219900, 3, 2, 'House', 'ardit@ucalgary.ca', 2),
('40181595', '1343 Blythe Rd, Mississauga, ON L5H 2C2', 24500000, 7, 10, 'House', 'ardit@ucalgary.ca', 3),
('SK914132', '46 Peeling AVENUE, Saskatoon, SK S7M 4K4', 329900, 4, 2, 'House', 'ardit@ucalgary.ca', 1),
('SK914049', '831 F AVENUE N, Saskatoon, SK S7L 1W6', 419000, 5, 3, 'House', 'ardit@ucalgary.ca', 2),
('SK914096', '739 L AVENUE S, Saskatoon, SK S7M 2H8', 229900, 3, 2, 'House', 'ardit@ucalgary.ca', 3),
('SK914089', '115 Ash STREET E, Saskatoon, SK', 259900, 3, 1, 'House', 'ardit@ucalgary.ca', 3),
('SK914121', '1227 D AVENUE N, Saskatoon, SK', 249900, 8, 5, 'House', 'ardit@ucalgary.ca', 3),
('SK914104', '2415 Rosewood DRIVE, Saskatoon, SK', 598700, 3, 3, 'House', 'ardit@ucalgary.ca', 1),
('SK914117', '1 927 Heritage VIEW, Saskatoon, SK', 509900, 2, 3, 'Condo', 'ardit@ucalgary.ca', 2),
('SK914106', '2427 Rosewood DRIVE, Saskatoon, SK', 632500, 4, 3, 'House', 'ardit@ucalgary.ca', 1),
('SK914056', '3409 Ortona STREET, Saskatoon, SK', 1275000, 6, 4, 'House', 'ardit@ucalgary.ca', 2),
('SK913998', '302 Poth CRESCENT, Saskatoon, SK', 319900, 3, 3, 'House', 'ardit@ucalgary.ca', 1),
('SK914012', '652 University DRIVE, Saskatoon, SK', 599900, 5, 3, 'House', 'ardit@ucalgary.ca', 2),
('SK914042', '108 1435 Embassy DRIVE, Saskatoon, SK', 119900, 2, 1, 'Condo', 'ardit@ucalgary.ca', 3),
('SK914035', '506 537 4th AVENUE N, Saskatoon, SK', 179900, 2, 1, 'Condo', 'ardit@ucalgary.ca', 1),
('SK914010', 'B4 255 Kingsmere BOULEVARD, Saskatoon, SK', 129900, 2, 2, 'Condo', 'ardit@ucalgary.ca', 2),
('SK914052', '210 Aniskotaw MANOR, Saskatoon, SK', 499900, 3, 3, 'House', 'ardit@ucalgary.ca', 3),
('E4319228', '14425 110A AV NW, Edmonton, AB', 392500, 4, 3, 'House', 'ardit@ucalgary.ca', 2),
('E4318803', '9124 141 ST NW NW, Edmonton, AB', 1190000, 4, 3, 'House', 'ardit@ucalgary.ca', 3),
('E4318797', '#7 15710 BEAUMARIS RD NW, Edmonton, AB', 189900, 3, 2, 'House', 'ardit@ucalgary.ca', 1),
('E4318817', '6843 111 ST NW, Edmonton, AB', 380000, 4, 2, 'House', 'ardit@ucalgary.ca', 2),
('E4318811', '#602 12303 JASPER AV NW, Edmonton, AB', 325000, 2, 2, 'Condo', 'ardit@ucalgary.ca', 3),
('E4318805', '11710 122 ST NW, Edmonton, AB', 389900, 3, 2, 'House', 'ardit@ucalgary.ca', 1),
('E4318453', '#1502 10303 105 ST NW, Edmonton, AB', 215000, 2, 1, 'Condo', 'ardit@ucalgary.ca', 2),
('E4318462', '16 West Point WD NW, Edmonton, AB', 1389900, 4, 6, 'House', 'ardit@ucalgary.ca', 3),
('E4318292', '9220 75 ST NW, Edmonton, AB', 450000, 5, 4, 'House', 'ardit@ucalgary.ca', 1),
('E4318289', '#120 10407 122 ST NW, Edmonton, AB', 234800, 2, 1, 'Condo', 'ardit@ucalgary.ca', 2),
('E4318264', '11134 101 ST NW, Edmonton, AB', 309900, 2, 2, 'Condo', 'ardit@ucalgary.ca', 3),
('E4318270', '12824 130 ST NW, Edmonton, AB', 286900, 2, 1, 'Condo', 'ardit@ucalgary.ca', 1),
('E4318272', '6512 111 AV NW, Edmonton, AB', 835000, 5, 4, 'House', 'ardit@ucalgary.ca', 2),
('E4318286', '#809 10142 111 ST NW, Edmonton, AB', 400000, 2, 2, 'Condo', 'feras@ucalgary.ca', 3),
('A2004671', '12905 66 Street NW, Edmonton, AB', 250000, 2, 1, 'Condo', 'feras@ucalgary.ca', 1),
('E4313860', '9535 147 AV NW, Edmonton, AB', 295000, 4, 5, 'House', 'feras@ucalgary.ca', 2),
('E4313357', '#105 11716 100 AV NW, Edmonton, AB', 320000, 2, 2, 'Condo', 'feras@ucalgary.ca', 3),
('A2009409', '253 22 Avenue NW, Calgary, AB', 629999, 2, 2, 'Condo', 'feras@ucalgary.ca', 1),
('A2008802', '159 New Brighton Close SE, Calgary, AB', 689900, 5, 4, 'House', 'feras@ucalgary.ca', 2),
('A2003495', '1029 Fonda Court SE, Calgary, AB', 299900, 4, 2, 'House', 'feras@ucalgary.ca', 3),
('A2005616', '1716 42 Street NE, Calgary, AB', 519900, 4, 3, 'House', 'feras@ucalgary.ca', 1),
('A2011129', '111 Deerpath Court SE, Calgary, AB', 399000, 3, 2, 'House', 'feras@ucalgary.ca', 2),
('A2012027', '1 1720 kensington Road NW, Calgary, AB', 575000, 3, 4, 'House', 'feras@ucalgary.ca', 3),
('A2011096', '180 Gordon Drive SW, Calgary, AB', 499900, 3, 2, 'House', 'feras@ucalgary.ca', 1),
('A2011719', '2 930 Royal Avenue SW, Calgary, AB', 199900, 2, 1, 'Condo', 'feras@ucalgary.ca', 2),
('A2011914', '1413 151 Country Village Road NE, Calgary, AB', 340000, 1, 1, 'Condo', 'feras@ucalgary.ca', 3),
('A2012019', '27 Hunterhorn Crescent NE, Calgary, AB', 349900, 3, 2, 'House', 'feras@ucalgary.ca', 1),
('A2007664', '325 Mckenzie Towne Gate SE, Calgary, AB', 374900, 3, 3, 'House', 'feras@ucalgary.ca', 2),
('A2009419', '8 Taraglen Road NE, Calgary, AB', 439900, 3, 2, 'House', 'feras@ucalgary.ca', 3),
('A1258735', '4308 13045 6 Street SW, Calgary, AB', 174900, 2, 1, 'Condo', 'feras@ucalgary.ca', 1),
('A2010155', '106 Tuscany Meadows Heights NW, Calgary, AB', 924888, 4, 4, 'House', 'feras@ucalgary.ca', 2),
('A2004459', '305 525 13 Avenue SW, Calgary, AB', 159900, 1, 1, 'Condo', 'feras@ucalgary.ca', 3),
('A2008620', '306 1315 12 Avenue SW, Calgary, AB', 294900, 2, 2, 'Condo', 'feras@ucalgary.ca', 1),
('A2003939', '40 Strathcona Road SW, Calgary, AB', 699900, 3, 3, 'House', 'feras@ucalgary.ca', 2),
('A2009522', '34 New Brighton Circle SE, Calgary, AB', 559900, 3, 3, 'House', 'feras@ucalgary.ca', 3),
('A2004597', '1115 2395 Eversyde Avenue SW, Calgary, AB', 224900, 2, 1, 'Condo', 'feras@ucalgary.ca', 1),
('A1255646', '3101 73 Erin Woods Court SE, Calgary, AB', 209900, 2, 2, 'Condo', 'feras@ucalgary.ca', 2),
('C5827918', '#423 1005 KING ST W, Toronto, ON', 629000, 1, 1, 'Condo', 'feras@ucalgary.ca', 3),
('W5827885', '11 SUNNYBRAE CRES, Toronto, ON', 1199000, 3, 2, 'House', 'feras@ucalgary.ca', 1),
('C5827921', '#714 629 KING ST, Toronto, ON', 629000, 1, 1, 'Condo', 'feras@ucalgary.ca', 2),
('W5827929', '38 VEROBEACH BLVD, Toronto, ON', 848888, 4, 2, 'House', 'feras@ucalgary.ca', 3),
('W5827880', '51 BURNFIELD AVE, Toronto, ON', 2350000, 3, 4, 'House', 'feras@ucalgary.ca', 1),
('C5827952', '#ON 2007 HILLCREST AVE, Toronto, ON', 795000, 2, 2, 'Condo', 'feras@ucalgary.ca', 2),
('W5827886', '#1012 816 LANSDOWNE AVE, Toronto, ON', 729900, 2, 2, 'Condo', 'feras@ucalgary.ca', 3),
('E5826980', '#304 452 SCARBOROUGH GOLFCLUB RD, Toronto, ON', 408000, 2, 2, 'Condo', 'feras@ucalgary.ca', 1),
('C5827246', '#PH05 15 FORT YORK BLVD, Toronto, ON', 3750000, 3, 3, 'House', 'feras@ucalgary.ca', 2),
('W5827399', '33 WICKFORD DR, Toronto, ON', 1879000, 5, 5, 'House', 'feras@ucalgary.ca', 3),
('C5827589', '137 SEATON ST, Toronto, ON', 1780000, 3, 3, 'House', 'feras@ucalgary.ca', 1),
('E5827590', '411 MAIN ST, Toronto, ON', 599000, 2, 1, 'Condo', 'feras@ucalgary.ca', 2),
('C5827707', '244 BENSON AVE, Toronto, ON', 1569000, 3, 2, 'House', 'feras@ucalgary.ca', 1),
('C5827219', '#809 70 MILL ST, Toronto, ON', 839000, 2, 2, 'Condo', 'feras@ucalgary.ca', 2),
('W5827724', '#213 2772 KEELE ST, Toronto, ON', 499000, 2, 1, 'Condo', 'feras@ucalgary.ca', 3),
('C5827323', '#1406 10 BELLAIR ST, Toronto, ON', 1539900, 2, 2, 'Condo', 'feras@ucalgary.ca', 1),
('W5826908', '#213 20 SOUTHPORT ST, Toronto, ON', 569000, 2, 2, 'Condo', 'feras@ucalgary.ca', 3),
('W5827909', '3179 IBBETSON CRES, Mississauga, ON', 1100000, 4, 3, 'House', 'feras@ucalgary.ca', 1),
('W5827928', '#2109 1 VALHALLA INN RD, Toronto, ON', 729900, 3, 2, 'House', 'feras@ucalgary.ca', 2),
('W5827892', '38 ROYAL VISTA RD, Brampton, ON', 915000, 4, 4, 'House', 'feras@ucalgary.ca', 3),
('W5827911', '80A CORBY CRES, Brampton, ON', 699000, 3, 3, 'House', 'feras@ucalgary.ca', 1),
('W5827935', '50 ERINGATE DR, Toronto, ON', 949000, 3, 2, 'House', 'feras@ucalgary.ca', 2),
('W5827400', '3259 SCOTCH PINE GATE AVE, Mississauga, ON', 1259000, 5, 4, 'House', 'feras@ucalgary.ca', 1),
('40349553', '1457 WAKEHURST Crescent, Oakville, ON', 1479000, 4, 3, 'House', 'feras@ucalgary.ca', 2),
('W5827557', '#3203 208 ENFIELD PL, Mississauga, ON', 736888, 2, 2, 'Condo', 'feras@ucalgary.ca', 3),
('40349719', '4085 PARKSIDE VILLAGE Drive Unit# 310, Mississauga, ON', 749900, 2, 2, 'Condo', 'feras@ucalgary.ca', 2),
('W5826905', '938 BLAIRHOLM AVE, Mississauga, ON', 999000, 4, 3, 'House', 'feras@ucalgary.ca', 3),
('W5826834', '1425 CHRISEDEN DR, Mississauga, ON', 4125000, 4, 5, 'House', 'feras@ucalgary.ca', 2),
('W5827351', '128 PARK ST E, Mississauga, ON', 1219000, 3, 4, 'House', 'feras@ucalgary.ca', 3),
('W5827448', '63 VIVIANS CRES, Brampton, ON', 1024990, 3, 3, 'House', 'feras@ucalgary.ca', 1),
('H4151093', '80 ABSOLUTE Avenue Unit #311, Mississauga, ON', 569420, 1, 2, 'Condo', 'feras@ucalgary.ca', 2),
('40349185', '53 RAYSIDE Drive, Etobicoke, ON', 1199919, 5, 2, 'House', 'feras@ucalgary.ca', 3),
('W5826874', '52A TREEVIEW DR, Toronto, ON', 1428800, 4, 4, 'House', 'feras@ucalgary.ca', 1),
('W5827446', '11 ROSEMEADE AVE, Toronto, ON', 1349900, 5, 3, 'House', 'feras@ucalgary.ca', 2),
('R2738552', '208 8070 OAK STREET, Vancouver, BC', 1179700, 2, 2, 'Condo', 'feras@ucalgary.ca', 3),
('R2738530', '1106 5629 BIRNEY AVENUE, Vancouver, BC', 1319000, 2, 2, 'Condo', 'feras@ucalgary.ca', 1),
('R2738528', '1278 DUCHESS AVENUE, West Vancouver, BC', 2198000, 3, 3, 'House', 'feras@ucalgary.ca', 2),
('R2738554', '3206 CAROLINA STREET, Vancouver, BC', 2198000, 6, 5, 'House', 'feras@ucalgary.ca', 3),
('R2738518', '2005 4388 BUCHANAN STREET, Burnaby, BC', 849900, 2, 2, 'Condo', 'feras@ucalgary.ca', 1),
('R2738548', '201 8070 OAK STREET, Vancouver, BC', 917700, 1, 1, 'Condo', 'feras@ucalgary.ca', 2),
('R2738556', '202 8030 OAK STREET, Vancouver, BC', 1379800, 3, 2, 'House', 'feras@ucalgary.ca', 3),
('R2738581', '605 53 W HASTINGS STREET, Vancouver, BC', 875000, 1, 1, 'Condo', 'feras@ucalgary.ca', 1),
('R2738546', '102 8030 OAK STREET, Vancouver, BC', 698800, 1, 1, 'Condo', 'feras@ucalgary.ca', 2),
('R2738543', '3206 CAROLINA STREET, Vancouver, BC', 2198000, 6, 5, 'House', 'feras@ucalgary.ca', 3),
('R2738527', '167 2035 GLENAIRE DRIVE, North Vancouver, BC', 1159000, 3, 2, 'House', 'feras@ucalgary.ca', 1),
('X5826720', '3616 POINT GREY RD, Vancouver, BC', 4880000, 4, 3, 'House', 'feras@ucalgary.ca', 2),
('R2738231', 'PH1 1550 ALBERNI STREET, Vancouver, BC', 31880800, 3, 5, 'House', 'feras@ucalgary.ca', 3),
('R2738215', '3403 1189 MELVILLE STREET, Vancouver, BC', 2848000, 3, 3, 'House', 'feras@ucalgary.ca', 1),
('R2738301', '204 565 17TH STREET, West Vancouver, BC', 1150000, 2, 2, 'Condo', 'feras@ucalgary.ca', 2),
('R2738168', '1403 1818 ALBERNI STREET, Vancouver, BC', 2269900, 2, 2, 'Condo', 'feras@ucalgary.ca', 3),
('R2738296', '2002 1550 FERN STREET, North Vancouver, BC', 924000, 2, 2, 'Condo', 'feras@ucalgary.ca', 1),
('R2738293', '101 5615 HAMPTON PLACE, Vancouver, BC', 1050000, 2, 2, 'Condo', 'feras@ucalgary.ca', 2),
('202226988', '13 Hull Avenue, Winnipeg, MB', 349900, 2, 1, 'Condo', 'feras@ucalgary.ca', 3),
('202227043', '190 Springwater Road, Winnipeg, MB', 674900, 3, 3, 'House', 'feras@ucalgary.ca', 1),
('202227027', '475 Besant Street, Winnipeg, MB', 349000, 4, 2, 'House', 'feras@ucalgary.ca', 2),
('202227046', '669 Alfred Avenue, Winnipeg, MB', 169900, 3, 1, 'House', 'feras@ucalgary.ca', 3),
('202224448', '38 Inman Avenue, Winnipeg, MB', 270000, 2, 1, 'Condo', 'feras@ucalgary.ca', 1),
('202226958', '32 SOUTHLANDS Drive, East St Paul, MB', 1057000, 5, 3, 'House', 'feras@ucalgary.ca', 2),
('202226877', '55 Forestgate Avenue, Winnipeg, MB', 499000, 3, 2, 'House', 'feras@ucalgary.ca', 3),
('202226999', '32 Crystal Avenue, Winnipeg, MB', 198700, 2, 1, 'Condo', 'feras@ucalgary.ca', 1),
('202227009', '206 Yale Avenue, Winnipeg, MB', 229900, 2, 1, 'Condo', 'feras@ucalgary.ca', 2),
('202226895', '34 Hood Avenue, Winnipeg, MB', 434900, 3, 3, 'House', 'feras@ucalgary.ca', 1),
('202227006', '207 Edward Avenue, Winnipeg, MB', 319900, 3, 1, 'House', 'feras@ucalgary.ca', 2),
('202226121', '58 Lindenwood Drive, Winnipeg, MB', 649900, 4, 3, 'House', 'feras@ucalgary.ca', 3),
('202226911', '21 DISCOVERY Cove, Winnipeg, MB', 1490000, 6, 5, 'House', 'feras@ucalgary.ca', 1),
('202226898', '251 Cullen Drive, Winnipeg, MB', 349900, 4, 2, 'House', 'feras@ucalgary.ca', 2),
('202226907', '150 Nordstrom Drive, Winnipeg, MB', 499900, 3, 3, 'House', 'feras@ucalgary.ca', 3),
('202226946', '789 Sherburn Street, Winnipeg, MB', 229900, 2, 1, 'Condo', 'feras@ucalgary.ca', 1),
('202225745', '389 Beverley Street, Winnipeg, MB', 74900, 3, 1, 'House', 'feras@ucalgary.ca', 2),
('202225532', '11 Crocker Place, Winnipeg, MB', 899900, 4, 3, 'House', 'feras@ucalgary.ca', 3);


DROP TABLE IF EXISTS AMENITIES;
CREATE TABLE AMENITIES (
	NId			integer,
    Amenity		varchar(255),
    foreign key (NId) references NEIGHBOURHOOD(NeighbourhoodId)
);

INSERT INTO AMENITIES (NId, Amenity)
VALUES
(1, 'Playground'),
(1, 'School'),
(2, 'Tennis Court'),
(2, 'Gym'),
(3, 'Golf Course'),
(3, 'Mall');


DROP TABLE IF EXISTS LISTINGS;
CREATE TABLE LISTINGS AS (
	SELECT Email, MLS
    FROM SELLER AS S, PROPERTY AS P
    WHERE S.Email = P.SoldBy);
        
ALTER TABLE LISTINGS 
	ADD CONSTRAINT fk_Email FOREIGN KEY (Email) REFERENCES SELLER(Email),
    ADD CONSTRAINT fk_MLS FOREIGN KEY (MLS) REFERENCES PROPERTY(MLS);
    
DROP TABLE IF EXISTS PRICE_HISTORY;
CREATE TABLE PRICE_HISTORY (
	UpdateDate		timestamp	not null default current_timestamp,
	MLS				varchar(10),
    OldPrice		float,
    primary key (UpdateDate),
    foreign key (MLS) references PROPERTY(MLS)
);

INSERT INTO PRICE_HISTORY (UpdateDate, MLS, OldPrice)
VALUES
('2022-09-01', 'SK913993', 680000),
('2022-09-02', 'SK914061', 630000),
('2022-09-03', 'SK914153', 380000);


DROP TABLE IF EXISTS SAVED_BY;
CREATE TABLE SAVED_BY (
	BuyerEmail		varchar(255),
    MLS				varchar(10),
    SavedDate		date,
    foreign key(BuyerEmail) references BUYER(Email),
    foreign key(MLS) references PROPERTY(MLS)
);

INSERT INTO SAVED_BY (BuyerEmail, MLS, SavedDate)
VALUES
('eric@ucalgary.ca', 'SK913993', '2022-10-01'),
('will@ucalgary.ca', 'SK914061', '2022-10-02'),
('will@ucalgary.ca', 'SK914153', '2022-10-03');


-- create after update trigger to update the price history when the property price goes up or down
DROP TRIGGER IF EXISTS pricechange;
DELIMITER $$
CREATE TRIGGER pricechange
AFTER UPDATE 
ON PROPERTY FOR EACH ROW
BEGIN
	IF OLD.CurrentPrice <> NEW.CurrentPrice THEN
		INSERT INTO PRICE_HISTORY(MLS, OldPrice)
		VALUES(old.MLS, old.CurrentPrice);
    END IF;
END$$
DELIMITER ;


-- create before delete trigger to remove the listing from properties when listing is taken down from the listings table
-- this should really be delete on cascade. delete trigger is used for archiving rows in another table, which we don't have.
DROP TRIGGER IF EXISTS droplisting;
DELIMITER $$
CREATE TRIGGER droplisting
BEFORE DELETE
ON PROPERTY FOR EACH ROW
BEGIN
	DELETE FROM PROPERTY AS P WHERE P.MLS = MLS; -- delete from listing table
    DELETE FROM PRICE_HISTORY AS PH WHERE PH.MLS = MLS; -- delete from price history table
    DELETE FROM SAVED_BY AS S WHERE S.MLS = MLS; -- delete from favourites table
END$$
DELIMITER ;
    
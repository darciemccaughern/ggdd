DROP DATABASE IF EXISTS `GGDD_declan`;
Create database GGDD_declan;
USE GGDD_declan;


CREATE TABLE employee (
employeeId SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    fName varchar(40) NOT NULL,
    lName varchar(40) NOT NULL,
    address varchar(50) NOT NULL,
    city varchar(50) NOT NULL,
    county varchar(50),
    postalCode VARCHAR(10) DEFAULT NULL,
    accNumber varchar(12),
    sortCode char(6),
    startSalary decimal(11,2) NOT NULL,
    nin char(9) NOT NULL,
    primary key (employeeId)
    );
    
    
 -- Already done
 INSERT INTO employee(fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) 
 VALUES ("Darcie smells", "Grace", "32 Woodburn Road", "Belfast", "Antrim", "BT6 8GH", 817216254617, 098675, 15600, "PK091789G");

 -- New Employees
 INSERT INTO employee(fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) 
 VALUES ("Gillon", "Brown", "02 Pearl Street", "Belfast", "Antrim", "BT9 8FG", 891782678526, 018926, 15600, "PJ017825T");

 INSERT INTO employee(fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) 
 VALUES ("Gareth", "Moore", "67 Blossom Avenue", "Belfast", "Antrim", "BT8 7FY", 819278165467, 017825, 15600, "PK018925I");

 INSERT INTO employee(fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) 
 VALUES ("Declan", "White", "89 Falls Road", "Belfast", "Antrim", "BT9 9JH", 819267187654, 817276, 15600, "PL817265P");
 

 CREATE TABLE hr (
 employeeId SMALLINT UNSIGNED NOT NULL PRIMARY KEY,
 CONSTRAINT fkHrEmployeeId FOREIGN KEY (employeeId) REFERENCES employee (employeeId)
 );
 
 -- Post code validation
ALTER TABLE employee
ADD CONSTRAINT postCodeValidation
	CHECK(REGEXP_LIKE(postalCode, '[A-Z][A-Z][0-9][[:space:]][0-9][A-Z][A-Z]') OR
	REGEXP_LIKE(postalCode, '[A-Z][A-Z][0-9][0-9][[:space:]][0-9][A-Z][A-Z]') OR
	REGEXP_LIKE(postalCode, '[A-Z][0-9][0-9][[:space:]][0-9][A-Z][A-Z]') OR
    REGEXP_LIKE(postalCode, '[A-Z][0-9][[:space:]][0-9][A-Z][A-Z]') or
    REGEXP_LIKE(postalCode, '[A-Z][A-Z][0-9][A-Z][[:space:]][0-9][A-Z][A-Z]')or
    REGEXP_LIKE(postalCode, '[A-Z][0-9][A-Z][[:space:]][0-9][A-Z][A-Z]'));


CREATE TABLE salesEmployee(
employeeId SMALLINT UNSIGNED NOT NULL PRIMARY KEY,
commissionRate DECIMAL(5,2),
totalSalesTerm DECIMAL(11,2),
CONSTRAINT fkEmployeeIDSales FOREIGN KEY (employeeId) REFERENCES employee (employeeId)
);



/*
-- Users and view permissions

CREATE USER 'HR'@'academy2020.cpc8rvmbbd9k.eu-west-2.rds.amazonaws.com' IDENTIFIED BY 'HRpassword';

GRANT INSERT ON GGDD_declan.HR TO 'HR'@'academy2020.cpc8rvmbbd9k.eu-west-2.rds.amazonaws.com';

-- code ran
*/

CREATE TABLE finance (
 employeeId SMALLINT UNSIGNED NOT NULL PRIMARY KEY,
 CONSTRAINT fkFinanceEmployeeId FOREIGN KEY (employeeId) REFERENCES employee (employeeId)
 );

 

 
 DELIMITER //
CREATE procedure employeesPerDepartment (IN employeeId SMALLINT)
	BEGIN
		SELECT *
		FROM employee
		INNER JOIN salesEmployee using(employeeId)
		WHERE employee.employeeId = specificEmployeeId;
	END //
DELIMITER ;

CREATE VIEW employeesInHr AS
SELECT *
	FROM employee
	INNER JOIN hr using(employeeId);
	
select * from employeesInHr;

CREATE VIEW employeesInFinance AS
SELECT *
	FROM employee
	INNER JOIN finance using(employeeId);

select * from employeesInFinance;





CREATE VIEW employeesInSales AS
SELECT *
	FROM employee
	INNER JOIN salesEmployee using(employeeId);

select * from employeesInSales;

Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Kerrin','Pip','Old Leasowe','Concepción','Abberley','WR6 6BA','737552728048','902043','59996526','OA036597B' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Mady','Ajay','Layer Road','Moscow','Ab Kettleby','CO5 7NT','548595951991','782959','88356974','BU377053B' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Daryl','Atonsah','Stockton Road','Kyoto','Abberley','WR10 2NR','263224075703','123145','69356892','XX054358M' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Catharine','Felizio','Layer Road','Nagpur','Abberton','WR6 6BS','535562227169','861554','59813168','XK334948A' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Madeleine','Poppy','Crocketts Farm','Gdańsk','Abberley','LE14 3HX','183815912004','074066','91289399','ZL392025J' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Diena','Papageno','New England Farm','Nizhny Novgorod','Abberton','LE14 3JG','152453735061','417835','45584691','T1922244I' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Demetris','Devlen','Pensax','Pontianak','Abberley','CO5 7NW','096532076573','090585','11193278','PX089559G' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Clo','Anastatius','Hazeland Barn','Abu Dhabi','Abberton','WR6 6BS','963678352719','643498','64731599','ZW633549V' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Jacquetta','Sidonius','Wartnaby Road','Amman','Abberley','CO5 7NZ','562098671681','616104','94358323','MU042320A' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Katuscha','Bethany','Nottingham Road','Shijiazhuang','Abberley','WR6 6NY','685857393164','041912','85514843','Z12065221' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Karina','Lipson','Glebe Lane','Lima','Abberton','CO5 7NH','697837389814','632728','56212982','PL817265P' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Lucy','Margret','Rectory Lane','Naypyidaw','Abberley','WR6 6AT','599292717110','075874','67911995','Z12065221' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Ninnetta','Malanie','Mill Farm House','Batticaloa','Abberton','WR6 6BX','981089300668','917199','84346389','BU377053B' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Marita','Secrest','Wynniatts Way','Nouakchott','Abberley','WR10 2NR','245519349483','529684','14698641','XK334948A' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Orelia','Ashok','Hazeland Barn','Odessa','Abberley','WR6 6BX','667011565425','556988','53314924','YN980098I' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Rosanne','Talia','Hawkeley Farm','Blantyre','Abberley','WR10 2NP','405732313975','096248','57298662','XK334948A' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Andree','Connelly','Quorn Avenue','Belfast','Abberley','WR6 6BS','886913537184','247142','21824723','ZZ647258P' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Rani','Hubert','Chapel Close','Honiara','Abberley','WR6 6BH','242532797298','320773','65548874','QF365005N' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Nessie','Jehu','Bank Lane','Guatemala City','Abberton','WR6 6BS','576339354300','053960','54866389','WR577502H' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Selma','Sikorski','Abberton Hall','Cuiabá','Abberton','WR6 6BS','012102727569','438341','61493629','CP048994D' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Winny','Bartlett','Stockingfield Farm','Newcastle','Abberley','WR6 6BS','414171145821','722968','87491345','UF368633F' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Di','Bollay','Mersea Road','Gold Coast','Abberley','WR6 6BS','224754125556','230285','22659377','PL817265P' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Linzy','Cutlerr','Mersea Road','Chengdu','Abberton','WR10 2NR','644528058653','262218','63862679','BU377053B' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Gabi','Mullane','Broom Way','Mwanza','Abberley','LE14 3HP','733547895518','997134','37258997','SW977527Z' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Karena','Jena','Great Witley Road','Lomé','Abberley','WR6 6BH','949196252359','540010','71137625','WR577502H' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Karina','Montgomery','Manor Field','Belfast','Ab Kettleby','LE14 3AU','275825217362','899252','12737484','XP938796Y' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Tera','Hebner','The Whoppets','Yaoundé','Ab Kettleby','WR6 6BS','151882479626','038542','13576393','XQ592046O' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Leanna','Pillsbury','The Village','Kingston','Abberley','WR6 6BH','242531629773','013936','39776448','ZL830260J' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Margarette','Kirstin','Apostles Oak','Bilbao','Ab Kettleby','WR6 6AX','342496634816','235440','33333445','EC229995X' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Ethel','Ardra','The Wainhouse','Nicosia','Abberton','LE14 3JG','653420050653','282639','38991645','EC229995X' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Barbara','Cyrie','Home Farm Court','Omsk','Ab Kettleby','CO5 7PG','243806896335','457106','49745751','QF365005N' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Maryellen','Screens','Mersea Road','San Antonio','Abberley','WR6 6BH','920103848589','573153','85254383','NA035384K' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Valli','Yerkovich','Chapel Close','Dar es Salaam','Abberley','WR10 2NR','409787544166','016852','97932358','NA035384K' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Gwyneth','Dorcy','Netherton House','Athens','Abberley','WR6 6DA','315067782415','993022','31118686','ZL392025J' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Cherrita','Cressida','Pensax','Muscat','Ab Kettleby','WR6 6BQ','581323329494','525625','45145974','MU042320A' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Gianina','Douglass','Brookend Farm','Geelong','Abberton','WR10 2NR','802309081379','698185','91942268','YN980098I' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Ninnetta','Trace','Saxilby Road','Chennai','Abberton','CO5 7NR','985748272475','157213','12182838','GN909787K' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Vevay','Dosia','Churchfield Terrace','Magadan','Abberton','WR6 6BS','234752475414','466296','98466313','PX089559G' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Kayla','Brodench','Quorn Avenue','Tehran','Abberton','WR6 6BX','752465700980','236917','48418786','WI454946Q' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Siana','Eno','Mersea Road','Newcastle','Ab Kettleby','WR10 2NR','270092837386','917249','97785835','PJ5963431' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Daune','Chrystel','Meadow Way','Puebla','Abberley','WR6 6BS','792098058824','640796','53811334','UV827262E' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Konstance','Kunin','Clows Top Road','Wollongong','Abberley','WR6 6BU','582674102281','528513','77463584','Z12065221' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Kalina','Heisel','Churchfield Terrace','Mbabane','Abberley','WR6 6BG','719329082706','713747','75769298','RE707523O' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Elmira','Obed','Apostles Oak','Monaco','Ab Kettleby','WR6 6BH','949763238760','381266','44147453','NA035384K' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Max','Nedrud','Hawkeley Farm','Incheon','Abberley','WR6 6BS','849053860782','024394','69365339','UT000508W' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Paule','Bobbee','Great Witley Road','Quito','Abberley','WR10 2NR','374489091998','056174','37124464','WI454946Q' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Kristina','Pearse','Pensax','Saint John','Abberley','WR10 2NR','773879468201','344927','43611317','ZZ647258P' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Katuscha','Thilda','Meadow Way','Hanover','Abberley','WR6 6AB','207742603580','212652','51339267','MU042320A' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Sallie','Krystle','Stockton Road','Sri Jayawardenapura-Kotte','Abberton','WR10 2NR','050332723840','598025','83419756','OA036597B' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Ada','Melleta','Apostles Oak','Ho Chi Minh City','Abberton','WR6 6BE','496685759092','700885','66288165','UT000508W' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Jessamyn','Joeann','Melton Road','Nouakchott','Abberley','CO5 7NY','712878359109','384796','42358284','IU442067P' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Charmaine','Capello','Abberton Mill','Monterrey','Abberley','WR10 2NR','244688056005','854681','15187499','KU203247W' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Maryellen','Minetta','Abberd Lane','Patna','Abberton','LE14 3HX','839697877237','292570','65238374','YE502255B' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Dione','Pip','Mill Farm House','Columbus','Abberton','WR6 6BP','041988407039','771701','25388495','EC229995X' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Ardenia','Nerita','Gables Farm Cottages','Birmingham','Abberley','CO5 7NY','907299315631','087043','17783961','YN980098I' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Georgetta','Japeth','Clawson Lane','Boa Vista','Abberley','CO5 7NT','596282675113','761212','35667241','T1922244I' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Ida','Leonard','Bank Lane','Pago Pago','Abberton','WR10 2NR','078219319668','199633','73825562','UT000508W' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Bibby','Sholley','Abberd Lane','Jaipur','Abberton','LE14 3HX','305178892174','816773','45197534','ZL392025J' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Roxane','Alexandr','Old Leasowe','Melekeok','Abberton','WR6 6AX','620406239631','809736','98986171','PJ5963431' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Dianemarie','Bigner','Abberd Lane','Ashgabat','Ab Kettleby','WR6 6AQ','990104103061','431034','11646243','HJ398997P' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Jobi','Burkle','Old Leasowe Cottage','Brazzaville','Abberton','WR10 2NP','504996538686','391478','93937919','DN344539X' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Damaris','Cavan','Melton Road','Handan','Ab Kettleby','CO5 7NL','967169357813','696297','14331557','KU203247W' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Bee','Rebecka','Mersea Road','Hanga Roa','Abberton','LE14 3AU','553440268142','980420','51898444','UY434603G' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Linzy','Chauncey','Tackroom','Córdoba','Ab Kettleby','WR10 2NR','923139636030','305439','64635235','Z12065221' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Renie','Ellerey','Quorn Avenue','Pekanbaru','Abberley','WR6 6AH','001928072267','466630','19492762','XK334948A' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Wileen','McAdams','Mill Farm House','Sacramento','Abberley','LE14 3HT','860863854530','740835','94613842','AH382669L' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Halette','Suk','Pensax','Omdurman','Abberley','WR10 2NR','279936622977','900239','28955814','OA036597B' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Tiffie','Felecia','Abbots Barn','Algiers','Abberton','WR6 6BS','563299360666','773118','46554222','XQ592046O' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Romona','Riordan','The Wainhouse','Cincinnati','Abberton','WR6 6AA','643125879028','526098','54866983','WI454946Q' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Jaclyn','Love','Pensax','San Carlos de Bariloche','Abberley','WR10 2NR','855239668416','661787','27644949','ZW633549V' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Siana','Suanne','Mersea Road','Ankara','Abberley','WR6 6AR','456499984707','641657','92955337','PN773052Z' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Mara','Center','Rodge Cottage','Tianjin','Abberton','WR6 6BS','288012196197','931252','37613277','YN980098I' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Alleen','Harriman','Gables Farm','Bogotá','Abberley','WR6 6DB','433260365113','497513','49758694','AF730676F' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Minne','Dorine','The Wainhouse','London','Abberton','CO5 7PQ','997834783932','470074','52374399','EY022077Q' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Miquela','Wareing','Mersea Road','Zamboanga City','Abberley','WR10 2NR','363851164988','150193','47239715','TW303527C' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Winifred','Ethban','Providence Cottage','Lagos','Abberley','WR10 2NR','989678610475','850714','94174264','UT000508W' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Justinn','Suzetta','Apostles Oak','Dibrugarh','Abberley','WR6 6BS','711515350117','251805','99742976','UF368633F' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Justinn','Lutero','Furlongs','Chuí','Abberley','CO5 7NL','924286062304','834141','52575963','HJ398997P' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Fanny','Alva','Worsley House','Maracaibo','Abberley','CO5 7NL','303979762837','570615','77778256','PN773052Z' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Alyssa','Torray','Tackroom','Arbil','Abberley','CO5 7NW','492154395034','137177','34838523','PJ5963431' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Tera','Hortensia','Mersea Road','New Orleans','Abberton','WR10 2NP','810791385364','957698','91495567','PK001892I' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Korrie','Lemuela','Hazeland Barn','Providence','Abberley','WR10 2NR','856099734964','812730','41172192','TW303527C' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Nataline','MacIntosh','Suffolk Lane','Guangzhou','Abberley','WR6 6BX','679988240931','311505','68267234','LL593879V' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Vevay','Monk','Gables Farm Cottages','Mashhad','Abberley','LE14 3AU','500459795892','687118','52224112','UY434603G' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Ginnie','Campball','Mersea Road','Rosario','Abberley','CO5 7NH','220875594771','186383','94848687','BU377053B' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Sashenka','Saunderson','Old Leasowe','Fukuoka','Abberley','WR6 6DA','494533344182','863866','61981131','LT889257W' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Clo','Belanger','Glebe Lane','Santa Cruz de la Sierra','Abberley','CO5 7PG','108423980301','470339','37215918','XP938796Y' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Bernardine','Cath','Rectory Lane','Hat Yai','Abberley','CO5 7NW','206289004486','192239','34284372','NA544320D' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Leontine','Delacourt','The Barn','Kingston','Abberley','WR6 6AD','920294242260','288134','87529559','TY702548N' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Misha','Crudden','Broom Way','Turin','Abberton','WR6 6BU','928039565146','131885','54987842','WI454946Q' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Kristina','Sigfrid','Layer Road','Phnom Penh','Ab Kettleby','WR6 6AH','628797245812','688817','15786259','OA036597B');
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Lizzie','Wenda','Quorn Avenue','Suez','Abberton','WR6 6BS','039005172189','993632','13992715','TW303527C' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Vonny','Hirsch','Belvoir Avenue','Avarua','Ab Kettleby','WR6 6BD','391581856850','861419','61983811','UF368633F' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Estell','Carolin','The Common','Miami','Abberley','WR10 2NR','478353235012','533661','59724928','Z12065221' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Jessy','Lanita','Millers Green','Mumbai','Abberley','WR10 2NP','795271603305','128080','71162931','PX089559G' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Elmira','Gaulin','Manor Field','Montevideo','Ab Kettleby','WR10 2NR','109657427991','401590','89439666','LL593879V' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Lory','Phi','Worsley House','Tbilisi','Abberley','LE14 3JA','136629400065','527780','21944399','XP938796Y');
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Pierette','Sheng','Rodge Cottage','Liverpool','Abberley','WR10 2NR','083110781763','164418','23633565','PL817265P' );
Insert Into employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) Values ( 'Starla','Decato','Mersea Road','Jakarta','Abberton','WR6 6BS','952483946653','900991','26373214','XP938796Y');





SELECT * FROM employee;

Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 1,'0.08','15501' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 2,'0.08','66189' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 3,'0.06','58963' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 4,'0.02','18747' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 5,'0.03','16125' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 6,'0.06','10656' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 7,'0.08','32125' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 8,'0.07','45781' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 9,'0.03','98794' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 10,'0.03','54470' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 11,'0.02','11207' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 12,'0.01','48131' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 13,'0.03','34584' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 14,'0.04','33251' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 15,'0.045','15561' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 16,'0.06','49780' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 17,'0.04','26942' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 18,'0.07','72101' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 19,'0.02','48857' );
Insert Into salesEmployee ( employeeId, commissionRate, totalSalesTerm) Values ( 20,'0.02','59734' );

    CREATE TABLE technicalEmployee(
	employeeId smallint UNSIGNED NOT NULL,
	cv text,
	passportPhoto  varchar(70),
    
	PRIMARY KEY (employeeId),
	CONSTRAINT fkEmployeeIdDelivery FOREIGN KEY(employeeId) REFERENCES employee(employeeId)
);

CREATE TABLE project(
projectId SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
projectName VARCHAR(100) NOT NULL,
startDate DATE NOT NULL,
endDate DATE,
PRIMARY KEY (projectId)
);


INSERT INTO project(startDate,endDate) VALUES ('2019-02-02','2021-09-22');
INSERT INTO project(startDate,endDate) VALUES ('2019-07-01','2024-10-13');
INSERT INTO project(startDate,endDate) VALUES ('2017-07-07','2019-07-30');
INSERT INTO project(startDate,endDate) VALUES ('2019-10-14','2021-12-09');
INSERT INTO project(startDate,endDate) VALUES ('2018-04-26','2023-11-05');
INSERT INTO project(startDate,endDate) VALUES ('2017-11-28','2022-06-15');
INSERT INTO project(startDate,endDate) VALUES ('2020-11-03','2023-02-14');
INSERT INTO project(startDate,endDate) VALUES ('2019-04-11','2021-03-04');
INSERT INTO project(startDate,endDate) VALUES ('2020-12-04','2024-12-03');
INSERT INTO project(startDate,endDate) VALUES ('2017-08-29','2020-11-02');
INSERT INTO project(startDate,endDate) VALUES ('2017-04-29','2022-08-06');
INSERT INTO project(startDate,endDate) VALUES ('2017-08-29','2024-12-13');
INSERT INTO project(startDate,endDate) VALUES ('2018-11-17','2023-11-20');
INSERT INTO project(startDate,endDate) VALUES ('2017-12-24','2024-02-02');
INSERT INTO project(startDate,endDate) VALUES ('2017-08-18','2019-10-15');
INSERT INTO project(startDate,endDate) VALUES ('2020-07-06','2019-09-07');
INSERT INTO project(startDate,endDate) VALUES ('2019-03-08','2021-03-12');
INSERT INTO project(startDate,endDate) VALUES ('2019-07-15','2019-08-08');
INSERT INTO project(startDate,endDate) VALUES ('2018-08-31','2019-01-25');
INSERT INTO project(startDate,endDate) VALUES ('2020-04-24','2020-10-25');
INSERT INTO project(startDate,endDate) VALUES ('2017-01-25','2021-10-01');
INSERT INTO project(startDate,endDate) VALUES ('2017-08-06','2023-09-10');
INSERT INTO project(startDate,endDate) VALUES ('2017-02-18','2024-11-01');
INSERT INTO project(startDate,endDate) VALUES ('2019-05-05','2019-03-14');
INSERT INTO project(startDate,endDate) VALUES ('2017-10-29','2020-08-18');
INSERT INTO project(startDate,endDate) VALUES ('2019-09-22','2021-05-27');
INSERT INTO project(startDate,endDate) VALUES ('2020-04-14','2020-05-13');
INSERT INTO project(startDate,endDate) VALUES ('2018-07-04','2023-02-10');
INSERT INTO project(startDate,endDate) VALUES ('2019-03-29','2024-07-19');
INSERT INTO project(startDate,endDate) VALUES ('2019-10-04','2019-12-07');
INSERT INTO project(startDate,endDate) VALUES ('2018-06-06','2023-04-08');
INSERT INTO project(startDate,endDate) VALUES ('2017-07-08','2023-10-06');
INSERT INTO project(startDate,endDate) VALUES ('2017-07-16','2019-08-10');
INSERT INTO project(startDate,endDate) VALUES ('2020-04-21','2021-08-09');
INSERT INTO project(startDate,endDate) VALUES ('2018-06-13','2023-02-15');
INSERT INTO project(startDate,endDate) VALUES ('2019-06-26','2024-06-18');
INSERT INTO project(startDate,endDate) VALUES ('2017-01-19','2020-06-05');
INSERT INTO project(startDate,endDate) VALUES ('2020-06-15','2021-10-11');
INSERT INTO project(startDate,endDate) VALUES ('2020-04-14','2023-09-17');
INSERT INTO project(startDate,endDate) VALUES ('2019-05-21','2020-06-09');
INSERT INTO project(startDate,endDate) VALUES ('2018-06-13','2019-07-02');
INSERT INTO project(startDate,endDate) VALUES ('2020-02-24','2021-05-11');
INSERT INTO project(startDate,endDate) VALUES ('2020-08-25','2020-11-19');
INSERT INTO project(startDate,endDate) VALUES ('2017-10-08','2021-09-06');
INSERT INTO project(startDate,endDate) VALUES ('2020-10-31','2023-08-19');
INSERT INTO project(startDate,endDate) VALUES ('2019-06-22','2019-03-17');
INSERT INTO project(startDate,endDate) VALUES ('2017-11-30','2024-05-12');
INSERT INTO project(startDate,endDate) VALUES ('2018-01-29','2022-12-11');
INSERT INTO project(startDate,endDate) VALUES ('2017-01-15','2022-04-07');
INSERT INTO project(startDate,endDate) VALUES ('2019-02-09','2019-11-01');
INSERT INTO project(startDate,endDate) VALUES ('2020-03-17','2019-12-15');
INSERT INTO project(startDate,endDate) VALUES ('2018-03-25','2024-11-03');
INSERT INTO project(startDate,endDate) VALUES ('2019-08-05','2020-07-26');
INSERT INTO project(startDate,endDate) VALUES ('2018-01-28','2024-08-15');
INSERT INTO project(startDate,endDate) VALUES ('2018-04-21','2021-07-28');
INSERT INTO project(startDate,endDate) VALUES ('2019-06-12','2022-01-24');
INSERT INTO project(startDate,endDate) VALUES ('2019-03-20','2020-05-18');
INSERT INTO project(startDate,endDate) VALUES ('2019-11-26','2023-11-02');
INSERT INTO project(startDate,endDate) VALUES ('2018-02-18','2024-08-29');
INSERT INTO project(startDate,endDate) VALUES ('2018-01-31','2023-04-26');
INSERT INTO project(startDate,endDate) VALUES ('2019-05-22','2021-03-11');
INSERT INTO project(startDate,endDate) VALUES ('2017-09-24','2023-07-17');
INSERT INTO project(startDate,endDate) VALUES ('2017-03-02','2019-12-17');
INSERT INTO project(startDate,endDate) VALUES ('2020-09-30','2022-09-14');
INSERT INTO project(startDate,endDate) VALUES ('2020-01-28','2022-10-17');
INSERT INTO project(startDate,endDate) VALUES ('2019-07-06','2019-12-29');
INSERT INTO project(startDate,endDate) VALUES ('2019-08-29','2020-09-03');
INSERT INTO project(startDate,endDate) VALUES ('2020-04-21','2022-11-11');
INSERT INTO project(startDate,endDate) VALUES ('2019-03-03','2024-12-12');
INSERT INTO project(startDate,endDate) VALUES ('2019-02-22','2020-01-09');
INSERT INTO project(startDate,endDate) VALUES ('2017-12-12','2019-10-24');
INSERT INTO project(startDate,endDate) VALUES ('2019-07-22','2022-06-16');
INSERT INTO project(startDate,endDate) VALUES ('2019-02-23','2023-11-13');
INSERT INTO project(startDate,endDate) VALUES ('2019-01-28','2023-10-30');
INSERT INTO project(startDate,endDate) VALUES ('2017-02-01','2020-04-26');
INSERT INTO project(startDate,endDate) VALUES ('2018-10-11','2021-10-14');
INSERT INTO project(startDate,endDate) VALUES ('2019-12-11','2022-02-07');
INSERT INTO project(startDate,endDate) VALUES ('2018-03-12','2020-10-31');
INSERT INTO project(startDate,endDate) VALUES ('2019-01-11','2020-08-15');
INSERT INTO project(startDate,endDate) VALUES ('2018-05-09','2019-12-24');
INSERT INTO project(startDate,endDate) VALUES ('2018-12-16','2021-10-02');
INSERT INTO project(startDate,endDate) VALUES ('2019-08-01','2024-05-10');
INSERT INTO project(startDate,endDate) VALUES ('2020-11-25','2022-06-24');
INSERT INTO project(startDate,endDate) VALUES ('2019-02-24','2019-04-05');
INSERT INTO project(startDate,endDate) VALUES ('2019-12-11','2024-04-30');
INSERT INTO project(startDate,endDate) VALUES ('2017-08-15','2019-11-25');
INSERT INTO project(startDate,endDate) VALUES ('2018-02-28','2024-09-20');
INSERT INTO project(startDate,endDate) VALUES ('2017-06-24','2022-02-16');
INSERT INTO project(startDate,endDate) VALUES ('2017-08-05','2019-06-05');
INSERT INTO project(startDate,endDate) VALUES ('2018-09-27','2019-07-27');
INSERT INTO project(startDate,endDate) VALUES ('2017-07-26','2021-08-22');
INSERT INTO project(startDate,endDate) VALUES ('2020-12-31','2023-10-21');
INSERT INTO project(startDate,endDate) VALUES ('2020-07-09','2020-05-10');
INSERT INTO project(startDate,endDate) VALUES ('2019-04-17','2022-12-20');
INSERT INTO project(startDate,endDate) VALUES ('2020-04-08','2019-07-13');
INSERT INTO project(startDate,endDate) VALUES ('2017-01-23','2024-08-17');
INSERT INTO project(startDate,endDate) VALUES ('2019-09-21','2020-10-17');
INSERT INTO project(startDate,endDate) VALUES ('2019-08-20','2022-05-26');
INSERT INTO project(startDate,endDate) VALUES ('2017-04-10','2019-06-29');


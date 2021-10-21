DROP DATABASE IF EXISTS `GGDD_declan`;
Create database GGDD_declan;
USE GGDD_declan;


CREATE TABLE Employee (
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
    isBusinessUnitHead boolean not null,
    primary key (employeeId)
    );
    
    
 -- Already done
 INSERT INTO Employee(fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) 
 VALUES ("Darcie smells", "Grace", "32 Woodburn Road", "Belfast", "Antrim", "BT6 8GH", 817216254617, 098675, 15600, "PK091789G", "0");

 -- New Employees
 INSERT INTO Employee(fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) 
 VALUES ("Gillon", "Brown", "02 Pearl Street", "Belfast", "Antrim", "BT9 8FG", 891782678526, 018926, 15600, "PJ017825T", "1");

 INSERT INTO Employee(fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) 
 VALUES ("Gareth", "Moore", "67 Blossom Avenue", "Belfast", "Antrim", "BT8 7FY", 819278165467, 017825, 15600, "PK018925I", "0");

 INSERT INTO Employee(fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) 
 VALUES ("Declan", "White", "89 Falls Road", "Belfast", "Antrim", "BT9 9JH", 819267187654, 817276, 15600, "PL817265P", "1");
 

 CREATE TABLE HR (
 HR_Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 employeeId SMALLINT UNSIGNED NOT NULL,
 CONSTRAINT fkHREmployeeId FOREIGN KEY (employeeId) REFERENCES Employee (employeeId)
 );
 
 -- Post code validation
ALTER TABLE Employee
ADD CONSTRAINT postCodeValidation
	CHECK(REGEXP_LIKE(postalCode, '[A-Z][A-Z][0-9][[:space:]][0-9][A-Z][A-Z]') OR
	REGEXP_LIKE(postalCode, '[A-Z][A-Z][0-9][0-9][[:space:]][0-9][A-Z][A-Z]') OR
	REGEXP_LIKE(postalCode, '[A-Z][0-9][0-9][[:space:]][0-9][A-Z][A-Z]') OR
    REGEXP_LIKE(postalCode, '[A-Z][0-9][[:space:]][0-9][A-Z][A-Z]') or
    REGEXP_LIKE(postalCode, '[A-Z][A-Z][0-9][A-Z][[:space:]][0-9][A-Z][A-Z]')or
    REGEXP_LIKE(postalCode, '[A-Z][0-9][A-Z][[:space:]][0-9][A-Z][A-Z]'));

CREATE TABLE salesEmployee(
salesEmployeeId SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
employeeId SMALLINT UNSIGNED NOT NULL,
commissionRate DECIMAL(5,2),
totalSalesTerm DECIMAL(11,2),
salesManager BOOLEAN,
primary key (salesEmployeeId),
CONSTRAINT fkEmployeeIDSales FOREIGN KEY (employeeId) REFERENCES Employee (employeeId)
);



/*
-- Users and view permissions

CREATE USER 'HR'@'academy2020.cpc8rvmbbd9k.eu-west-2.rds.amazonaws.com' IDENTIFIED BY 'HRpassword';

GRANT INSERT ON GGDD_declan.HR TO 'HR'@'academy2020.cpc8rvmbbd9k.eu-west-2.rds.amazonaws.com';

-- code ran
*/

CREATE TABLE Finance (
 FinanceId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 employeeId SMALLINT UNSIGNED NOT NULL,
 CONSTRAINT fkFinanceEmployeeId FOREIGN KEY (employeeId) REFERENCES Employee (employeeId)
 );

 
 DELIMITER //
CREATE procedure EmployeesPerDepartment (IN employeeId SMALLINT)
	BEGIN
		SELECT *
		FROM employee
		INNER JOIN salesEmployee using(employeeId)
		WHERE employee.employeeId = specificEmployeeId;
	END //
DELIMITER ;

CREATE VIEW EmployeesInHr AS
SELECT *
	FROM Employee
	INNER JOIN HR using(employeeId);
	
select * from EmployeesInHr;

CREATE VIEW EmployeesInFinance AS
SELECT *
	FROM Employee
	INNER JOIN Finance using(employeeId);

select * from EmployeesInFinance;

CREATE VIEW EmployeesInSales AS
SELECT *
	FROM Employee
	INNER JOIN salesEmployee using(employeeId);

select * from EmployeesInSales;

Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Kerrin','Pip','Old Leasowe','Concepción','Abberley','WR6 6BA','737552728048','902043','59996526','OA036597B','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Mady','Ajay','Layer Road','Moscow','Ab Kettleby','CO5 7NT','548595951991','782959','88356974','BU377053B','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Daryl','Atonsah','Stockton Road','Kyoto','Abberley','WR10 2NR','263224075703','123145','69356892','XX054358M','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Catharine','Felizio','Layer Road','Nagpur','Abberton','WR6 6BS','535562227169','861554','59813168','XK334948A','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Madeleine','Poppy','Crocketts Farm','Gdańsk','Abberley','LE14 3HX','183815912004','074066','91289399','ZL392025J','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Diena','Papageno','New England Farm','Nizhny Novgorod','Abberton','LE14 3JG','152453735061','417835','45584691','T1922244I','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Demetris','Devlen','Pensax','Pontianak','Abberley','CO5 7NW','096532076573','090585','11193278','PX089559G','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Clo','Anastatius','Hazeland Barn','Abu Dhabi','Abberton','WR6 6BS','963678352719','643498','64731599','ZW633549V','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Jacquetta','Sidonius','Wartnaby Road','Amman','Abberley','CO5 7NZ','562098671681','616104','94358323','MU042320A','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Katuscha','Bethany','Nottingham Road','Shijiazhuang','Abberley','WR6 6NY','685857393164','041912','85514843','Z12065221','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Karina','Lipson','Glebe Lane','Lima','Abberton','CO5 7NH','697837389814','632728','56212982','PL817265P','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Lucy','Margret','Rectory Lane','Naypyidaw','Abberley','WR6 6AT','599292717110','075874','67911995','Z12065221','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Ninnetta','Malanie','Mill Farm House','Batticaloa','Abberton','WR6 6BX','981089300668','917199','84346389','BU377053B','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Marita','Secrest','Wynniatts Way','Nouakchott','Abberley','WR10 2NR','245519349483','529684','14698641','XK334948A','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Orelia','Ashok','Hazeland Barn','Odessa','Abberley','WR6 6BX','667011565425','556988','53314924','YN980098I','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Rosanne','Talia','Hawkeley Farm','Blantyre','Abberley','WR10 2NP','405732313975','096248','57298662','XK334948A','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Andree','Connelly','Quorn Avenue','Belfast','Abberley','WR6 6BS','886913537184','247142','21824723','ZZ647258P','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Rani','Hubert','Chapel Close','Honiara','Abberley','WR6 6BH','242532797298','320773','65548874','QF365005N','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Nessie','Jehu','Bank Lane','Guatemala City','Abberton','WR6 6BS','576339354300','053960','54866389','WR577502H','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Selma','Sikorski','Abberton Hall','Cuiabá','Abberton','WR6 6BS','012102727569','438341','61493629','CP048994D','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Winny','Bartlett','Stockingfield Farm','Newcastle','Abberley','WR6 6BS','414171145821','722968','87491345','UF368633F','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Di','Bollay','Mersea Road','Gold Coast','Abberley','WR6 6BS','224754125556','230285','22659377','PL817265P','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Linzy','Cutlerr','Mersea Road','Chengdu','Abberton','WR10 2NR','644528058653','262218','63862679','BU377053B','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Gabi','Mullane','Broom Way','Mwanza','Abberley','LE14 3HP','733547895518','997134','37258997','SW977527Z','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Karena','Jena','Great Witley Road','Lomé','Abberley','WR6 6BH','949196252359','540010','71137625','WR577502H','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Karina','Montgomery','Manor Field','Belfast','Ab Kettleby','LE14 3AU','275825217362','899252','12737484','XP938796Y','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Tera','Hebner','The Whoppets','Yaoundé','Ab Kettleby','WR6 6BS','151882479626','038542','13576393','XQ592046O','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Leanna','Pillsbury','The Village','Kingston','Abberley','WR6 6BH','242531629773','013936','39776448','ZL830260J','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Margarette','Kirstin','Apostles Oak','Bilbao','Ab Kettleby','WR6 6AX','342496634816','235440','33333445','EC229995X','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Ethel','Ardra','The Wainhouse','Nicosia','Abberton','LE14 3JG','653420050653','282639','38991645','EC229995X','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Barbara','Cyrie','Home Farm Court','Omsk','Ab Kettleby','CO5 7PG','243806896335','457106','49745751','QF365005N','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Maryellen','Screens','Mersea Road','San Antonio','Abberley','WR6 6BH','920103848589','573153','85254383','NA035384K','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Valli','Yerkovich','Chapel Close','Dar es Salaam','Abberley','WR10 2NR','409787544166','016852','97932358','NA035384K','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Gwyneth','Dorcy','Netherton House','Athens','Abberley','WR6 6DA','315067782415','993022','31118686','ZL392025J','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Cherrita','Cressida','Pensax','Muscat','Ab Kettleby','WR6 6BQ','581323329494','525625','45145974','MU042320A','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Gianina','Douglass','Brookend Farm','Geelong','Abberton','WR10 2NR','802309081379','698185','91942268','YN980098I','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Ninnetta','Trace','Saxilby Road','Chennai','Abberton','CO5 7NR','985748272475','157213','12182838','GN909787K','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Vevay','Dosia','Churchfield Terrace','Magadan','Abberton','WR6 6BS','234752475414','466296','98466313','PX089559G','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Kayla','Brodench','Quorn Avenue','Tehran','Abberton','WR6 6BX','752465700980','236917','48418786','WI454946Q','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Siana','Eno','Mersea Road','Newcastle','Ab Kettleby','WR10 2NR','270092837386','917249','97785835','PJ5963431','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Daune','Chrystel','Meadow Way','Puebla','Abberley','WR6 6BS','792098058824','640796','53811334','UV827262E','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Konstance','Kunin','Clows Top Road','Wollongong','Abberley','WR6 6BU','582674102281','528513','77463584','Z12065221','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Kalina','Heisel','Churchfield Terrace','Mbabane','Abberley','WR6 6BG','719329082706','713747','75769298','RE707523O','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Elmira','Obed','Apostles Oak','Monaco','Ab Kettleby','WR6 6BH','949763238760','381266','44147453','NA035384K','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Max','Nedrud','Hawkeley Farm','Incheon','Abberley','WR6 6BS','849053860782','024394','69365339','UT000508W','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Paule','Bobbee','Great Witley Road','Quito','Abberley','WR10 2NR','374489091998','056174','37124464','WI454946Q','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Kristina','Pearse','Pensax','Saint John','Abberley','WR10 2NR','773879468201','344927','43611317','ZZ647258P','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Katuscha','Thilda','Meadow Way','Hanover','Abberley','WR6 6AB','207742603580','212652','51339267','MU042320A','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Sallie','Krystle','Stockton Road','Sri Jayawardenapura-Kotte','Abberton','WR10 2NR','050332723840','598025','83419756','OA036597B','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Ada','Melleta','Apostles Oak','Ho Chi Minh City','Abberton','WR6 6BE','496685759092','700885','66288165','UT000508W','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Jessamyn','Joeann','Melton Road','Nouakchott','Abberley','CO5 7NY','712878359109','384796','42358284','IU442067P','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Charmaine','Capello','Abberton Mill','Monterrey','Abberley','WR10 2NR','244688056005','854681','15187499','KU203247W','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Maryellen','Minetta','Abberd Lane','Patna','Abberton','LE14 3HX','839697877237','292570','65238374','YE502255B','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Dione','Pip','Mill Farm House','Columbus','Abberton','WR6 6BP','041988407039','771701','25388495','EC229995X','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Ardenia','Nerita','Gables Farm Cottages','Birmingham','Abberley','CO5 7NY','907299315631','087043','17783961','YN980098I','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Georgetta','Japeth','Clawson Lane','Boa Vista','Abberley','CO5 7NT','596282675113','761212','35667241','T1922244I','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Ida','Leonard','Bank Lane','Pago Pago','Abberton','WR10 2NR','078219319668','199633','73825562','UT000508W','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Bibby','Sholley','Abberd Lane','Jaipur','Abberton','LE14 3HX','305178892174','816773','45197534','ZL392025J','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Roxane','Alexandr','Old Leasowe','Melekeok','Abberton','WR6 6AX','620406239631','809736','98986171','PJ5963431','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Dianemarie','Bigner','Abberd Lane','Ashgabat','Ab Kettleby','WR6 6AQ','990104103061','431034','11646243','HJ398997P','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Jobi','Burkle','Old Leasowe Cottage','Brazzaville','Abberton','WR10 2NP','504996538686','391478','93937919','DN344539X','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Damaris','Cavan','Melton Road','Handan','Ab Kettleby','CO5 7NL','967169357813','696297','14331557','KU203247W','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Bee','Rebecka','Mersea Road','Hanga Roa','Abberton','LE14 3AU','553440268142','980420','51898444','UY434603G','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Linzy','Chauncey','Tackroom','Córdoba','Ab Kettleby','WR10 2NR','923139636030','305439','64635235','Z12065221','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Renie','Ellerey','Quorn Avenue','Pekanbaru','Abberley','WR6 6AH','001928072267','466630','19492762','XK334948A','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Bee','Lane','Home Farm Court','Thessaloniki','Ab Kettleby','CO5 7NH','589153561345','082387','34868729','OA036597B','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Wileen','McAdams','Mill Farm House','Sacramento','Abberley','LE14 3HT','860863854530','740835','94613842','AH382669L','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Halette','Suk','Pensax','Omdurman','Abberley','WR10 2NR','279936622977','900239','28955814','OA036597B','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Tiffie','Felecia','Abbots Barn','Algiers','Abberton','WR6 6BS','563299360666','773118','46554222','XQ592046O','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Romona','Riordan','The Wainhouse','Cincinnati','Abberton','WR6 6AA','643125879028','526098','54866983','WI454946Q','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Jaclyn','Love','Pensax','San Carlos de Bariloche','Abberley','WR10 2NR','855239668416','661787','27644949','ZW633549V','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Siana','Suanne','Mersea Road','Ankara','Abberley','WR6 6AR','456499984707','641657','92955337','PN773052Z','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Mara','Center','Rodge Cottage','Tianjin','Abberton','WR6 6BS','288012196197','931252','37613277','YN980098I','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Alleen','Harriman','Gables Farm','Bogotá','Abberley','WR6 6DB','433260365113','497513','49758694','AF730676F','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Minne','Dorine','The Wainhouse','London','Abberton','CO5 7PQ','997834783932','470074','52374399','EY022077Q','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Miquela','Wareing','Mersea Road','Zamboanga City','Abberley','WR10 2NR','363851164988','150193','47239715','TW303527C','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Winifred','Ethban','Providence Cottage','Lagos','Abberley','WR10 2NR','989678610475','850714','94174264','UT000508W','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Justinn','Suzetta','Apostles Oak','Dibrugarh','Abberley','WR6 6BS','711515350117','251805','99742976','UF368633F','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Justinn','Lutero','Furlongs','Chuí','Abberley','CO5 7NL','924286062304','834141','52575963','HJ398997P','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Fanny','Alva','Worsley House','Maracaibo','Abberley','CO5 7NL','303979762837','570615','77778256','PN773052Z','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Alyssa','Torray','Tackroom','Arbil','Abberley','CO5 7NW','492154395034','137177','34838523','PJ5963431','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Tera','Hortensia','Mersea Road','New Orleans','Abberton','WR10 2NP','810791385364','957698','91495567','PK001892I','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Korrie','Lemuela','Hazeland Barn','Providence','Abberley','WR10 2NR','856099734964','812730','41172192','TW303527C','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Nataline','MacIntosh','Suffolk Lane','Guangzhou','Abberley','WR6 6BX','679988240931','311505','68267234','LL593879V','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Vevay','Monk','Gables Farm Cottages','Mashhad','Abberley','LE14 3AU','500459795892','687118','52224112','UY434603G','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Ginnie','Campball','Mersea Road','Rosario','Abberley','CO5 7NH','220875594771','186383','94848687','BU377053B','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Sashenka','Saunderson','Old Leasowe','Fukuoka','Abberley','WR6 6DA','494533344182','863866','61981131','LT889257W','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Clo','Belanger','Glebe Lane','Santa Cruz de la Sierra','Abberley','CO5 7PG','108423980301','470339','37215918','XP938796Y','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Bernardine','Cath','Rectory Lane','Hat Yai','Abberley','CO5 7NW','206289004486','192239','34284372','NA544320D','1' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Leontine','Delacourt','The Barn','Kingston','Abberley','WR6 6AD','920294242260','288134','87529559','TY702548N','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Misha','Crudden','Broom Way','Turin','Abberton','WR6 6BU','928039565146','131885','54987842','WI454946Q','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Kristina','Sigfrid','Layer Road','Phnom Penh','Ab Kettleby','WR6 6AH','628797245812','688817','15786259','OA036597B','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Lizzie','Wenda','Quorn Avenue','Suez','Abberton','WR6 6BS','039005172189','993632','13992715','TW303527C','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Vonny','Hirsch','Belvoir Avenue','Avarua','Ab Kettleby','WR6 6BD','391581856850','861419','61983811','UF368633F','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Estell','Carolin','The Common','Miami','Abberley','WR10 2NR','478353235012','533661','59724928','Z12065221','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Jessy','Lanita','Millers Green','Mumbai','Abberley','WR10 2NP','795271603305','128080','71162931','PX089559G','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Elmira','Gaulin','Manor Field','Montevideo','Ab Kettleby','WR10 2NR','109657427991','401590','89439666','LL593879V','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Lory','Phi','Worsley House','Tbilisi','Abberley','LE14 3JA','136629400065','527780','21944399','XP938796Y','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Pierette','Sheng','Rodge Cottage','Liverpool','Abberley','WR10 2NR','083110781763','164418','23633565','PL817265P','0' );
Insert Into Employee ( fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin, isBusinessUnitHead) Values ( 'Starla','Decato','Mersea Road','Jakarta','Abberton','WR6 6BS','952483946653','900991','26373214','XP938796Y','0' );





SELECT * FROM Employee;

Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 1,'0.08','15501','1' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 2,'0.08','66189','0' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 3,'0.06','58963','0' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 4,'0.02','18747','0' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 5,'0.03','16125','0' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 6,'0.06','10656','0' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 7,'0.08','32125','0' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 8,'0.07','45781','0' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 9,'0.03','98794','0' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 10,'0.03','54470','0' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 11,'0.02','11207','1' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 12,'0.01','48131','0' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 13,'0.03','34584','0' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 14,'0.04','33251','0' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 15,'0.045','15561','1' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 16,'0.06','49780','0' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 17,'0.04','26942','0' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 18,'0.07','72101','0' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 19,'0.02','48857','0' );
Insert Into salesEmployee ( EmployeeId, commissionRate, totalSalesTerm, salesManager) Values ( 20,'0.02','59734','0' );


    

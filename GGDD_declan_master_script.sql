DROP DATABASE IF EXISTS `GGDD_declan`;
Create database GGDD_declan;
USE GGDD_declan;


CREATE TABLE Employee (
employeeId SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    fName varchar(40) NOT NULL,
    lName varchar(40) NOT NULL,
    address varchar(50) NOT NULL,
    city varchar(50) NOT NULL,
    county varchar(50) NOT NULL,
    postalCode VARCHAR(10) DEFAULT NULL,
    accNumber varchar(12),
    sortCode char(6),
    startSalary decimal(11,2) NOT NULL,
    nin char(9) NOT NULL,
    primary key (employeeId)
    );
    
    
 -- Already done
 INSERT INTO Employee(fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) 
 VALUES ("Darcie", "Grace", "32 Woodburn Road", "Belfast", "Antrim", "BT6 8GH", 817216254617, 098675, 15600, "PK091789G");

 -- New Employees
 INSERT INTO Employee(fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) 
 VALUES ("Gillon", "Brown", "02 Pearl Street", "Belfast", "Antrim", "BT9 8FG", 891782678526, 018926, 15600, "PJ017825T");

 INSERT INTO Employee(fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) 
 VALUES ("Gareth", "Moore", "67 Blossom Avenue", "Belfast", "Antrim", "BT8 7FY", 819278165467, 017825, 15600, "PK0018925I");

 INSERT INTO Employee(fName, lName, address, city, county, postalCode, accNumber, sortCode, startSalary, nin) 
 VALUES ("Declan", "White", "89 Falls Road", "Belfast", "Antrim", "BT9 9JH", 819267187654, 817276, 15600, "PL817265P");
 

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
teamNo INT,
salesManager BOOLEAN,
primary key (salesEmployeeId),
CONSTRAINT fkEmployeeIDSales FOREIGN KEY (employeeId) REFERENCES Employee (employeeId)
);


    
    

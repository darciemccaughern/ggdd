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
 VALUES ("Gareth", "Moore", "67 Blossom Avenue", "Belfast", "Antrim", "BT8 7FY", 819278165467, 017825, 15600, "PK0018925I", "0");

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
teamNo INT,
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
	FROM employee
	INNER JOIN HR using(employeeId)
	WHERE employee.employeeId = specificEmployeeId;

Drop procedure EmployeesPerDepartment;



    
    

Create database GGDD_declan;
USE GGDD_declan;
drop table Employee;
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
    
    
     
    
    

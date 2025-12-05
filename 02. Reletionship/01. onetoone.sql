CREATE DATABASE onetoone;
USE onetoone;

CREATE TABLE Passports(
passport_id INT PRIMARY KEY,
passport_number VARCHAR(10) NOT NULL
);

CREATE TABLE Persons(
person_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
Salary DECIMAL(10,2) NULL,
passport_id INT UNIQUE,

FOREIGN KEY(passport_id) 
REFERENCES Passports(passport_id)
ON DELETE CASCADE
);

INSERT INTO Passports(`passport_id`,passport_number) 
VALUES
(101,'N34FG21B'),
(102,'K65LO4R7'),
(103,'ZE657QP2');

INSERT INTO Persons(first_name,Salary,passport_id) 
VALUES
('Roberto',43300.00,102),
('Tom',56100.00,101),
('Yana',60200.00,103);


SELECT *FROM Passports;
SELECT *FROM Persons;

TRUNCATE TABLE Persons;
TRUNCATE TABLE Passports;

DELETE FROM Passports where (passport_id=102);


DROP DATABASE onetoone;
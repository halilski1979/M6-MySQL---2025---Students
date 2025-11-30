CREATE DATABASE People;
USE People;

CREATE TABLE People(
 id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 `name` VARCHAR(200) NOT NULL,
 
 -- Той се използва за файлове или данни, които не са текст, например:
 picture LONGBLOB,
 -- 3 числа, с два знака след десетичната запетая
 height DECIMAL(3,2) NULL,
 weight DECIMAL(5,2) NULL,
 gender ENUM ('m','f') NOT NULL,
 birthdate DATE NOT NULL,
 biography LONGTEXT NULL
);

SELECT * FROM People;

INSERT INTO People (`name`,picture,height, weight,gender,birthdate,biography)
VALUES
('Иван',NULL,1.70,70.50,'m','2000-12-23','svhvopehvopshvpehvpuh'),
('Ivan', NULL, 1.80, 75.20, 'm', '1998-12-05', 'student po informatika'),
('Maria', NULL, 1.65, 55.90, 'f', '2001-03-14', 'raboti v magazin'),
('Georgi', NULL, 1.72, 68.00, 'm', '1999-09-30', 'harresva basketbol'),
('Petq',NULL,1.50,50.40,'f','2000-06-23','svhvopehvopshvpehvpuh');

TRUNCATE TABLE people;

CREATE TABLE Users(
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(30) NOT NULL UNIQUE,
`password` VARCHAR(26) NOT NULL,
 profile_picture MEDIUMBLOB NULL,
 last_login_time DATETIME NOT NULL,
 is_deleted BOOLEAN DEFAULT FALSE
);

INSERT INTO Users (`name`, `password`, profile_picture, last_login_time, is_deleted)
VALUES
('Petya', 'pass123', NULL, '2025-01-12 14:33:00', 0),
('Ivan', 'qwerty', NULL, '2025-02-03 10:20:50', 0),
('Maria', '123456', NULL, '2025-02-03 10:20:50', 0),
('Georgi', 'georgi2025', NULL, '2025-03-25 19:45:10', 0),
('Nikolay', 'nik0!*', NULL, '2025-01-05 08:15:30', 1);

SELECT * FROM Users; 
TRUNCATE Table users;





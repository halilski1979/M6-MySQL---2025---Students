CREATE DATABASE minions;
USE minions;

CREATE TABLE minions(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
age INT NOT NULL  
);

CREATE TABLE towns(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL
);

INSERT INTO minions (id,`name`,age,town_id)
VALUES
(1,'Kevin',22,111),
(2,'Bob',15,115),
(3,'Stewart',23,134);

SELECT * FROM minions;

INSERT INTO minions (`name`,age)
VALUES
('Kevin1',22),
('Bob1',15),
('Stewart1',23);

INSERT INTO towns (`name`)
VALUES
('Sofia'),('Plovdiv'),('Varna');

SELECT * FROM towns;

ALTER TABLE minions
ADD COLUMN town_id INT;




-- ИЗТРИВАНЕ НА ВСИЧКИ ДАНННИ ОТ ТАБЛИЦА
TRUNCATE TABLE minions;

-- ИЗТРИВАНЕ НА ТАБЛИЦА
DROP TABLE minions;

-- ИЗТРИВАНЕ НА БАЗА ДАННИ
DROP DATABASE minions;

ALTER TABLE minions
ADD CONSTRAINT fk_minions_towns
FOREIGN KEY (town_id) REFERENCES towns(id);








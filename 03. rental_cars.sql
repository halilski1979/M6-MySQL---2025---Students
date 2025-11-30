CREATE DATABASE rental_cars;
USE rental_cars;

CREATE TABLE categories(
id INT PRIMARY KEY AUTO_INCREMENT,
category VARCHAR(50) NOT NULL,
daily_rate DECIMAL(7,2) NOT NULL,
monthly_rate DECIMAL(7,2) NOT NULL,
weekend_rate DECIMAL(7,2) NOT NULL
);

INSERT INTO categories (category, daily_rate, monthly_rate, weekend_rate) VALUES
('Economy', 30.00, 600.00, 40.00),
('Compact', 40.00, 800.00, 50.00),
('SUV', 60.00, 1200.00, 75.00),
('Luxury', 100.00, 2000.00, 120.00),
('Van', 70.00, 1400.00, 85.00);


CREATE TABLE cars(
id INT PRIMARY KEY AUTO_INCREMENT,
plate_number VARCHAR(8) NOT NULL UNIQUE,
brand VARCHAR(50) NOT NULL,
model VARCHAR(50) NOT NULL,
car_year YEAR NOT NULL,
category_id INT NOT NULL,
doors TINYINT NOT NULL,
picture LONGBLOB NULL,
car_condition VARCHAR(200) NOT NULL,
available BOOLEAN DEFAULT TRUE,
CONSTRAINT fk_cars_category_id FOREIGN KEY (category_id) REFERENCES categories(id)  
);

INSERT INTO cars (plate_number, brand, model, car_year, category_id, doors, car_condition, available) VALUES
('CA1234AB', 'Toyota', 'Corolla', 2020, 1, 4, 'Good', TRUE),
('CA5678CD', 'Honda', 'Civic', 2019, 2, 4, 'Very Good', TRUE),
('CA9101EF', 'BMW', 'X5', 2021, 3, 5, 'Excellent', TRUE),
('CA1122GH', 'Mercedes', 'S-Class', 2022, 4, 4, 'Excellent', TRUE),
('CA3344IJ', 'Ford', 'Transit', 2018, 5, 5, 'Good', TRUE);



CREATE TABLE employees(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
title VARCHAR(50) NOT NULL,
notes LONGTEXT NOT NULL
);

INSERT INTO employees (first_name, last_name, title, notes) VALUES
('John', 'Doe', 'Manager', 'Experienced in rental management'),
('Jane', 'Smith', 'Sales Agent', 'Handles customer bookings'),
('Mike', 'Johnson', 'Technician', 'Responsible for car maintenance'),
('Emily', 'Davis', 'Accountant', 'Manages financial records'),
('Robert', 'Brown', 'Customer Support', 'Assists with complaints and inquiries');


CREATE TABLE customers(
id INT PRIMARY KEY AUTO_INCREMENT,
driver_licence_number VARCHAR(50) NOT NULL,
full_name VARCHAR(50) NOT NULL,
address VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
zip_code VARCHAR(50) NOT NULL,
notes LONGTEXT NOT NULL
);

INSERT INTO customers (driver_licence_number, full_name, address, city, zip_code, notes) VALUES
('DL123456', 'Alice Green', '123 Main St', 'Sofia', '1000', 'Frequent customer'),
('DL234567', 'Bob White', '456 Oak St', 'Plovdiv', '4000', 'Prefers SUVs'),
('DL345678', 'Charlie Black', '789 Pine St', 'Varna', '9000', 'Rents for business trips'),
('DL456789', 'Diana Blue', '321 Elm St', 'Burgas', '8000', 'Occasional renter'),
('DL567890', 'Evan Gray', '654 Maple St', 'Ruse', '7000', 'Long-term rentals');



CREATE TABLE rental_orders(
id INT PRIMARY KEY AUTO_INCREMENT,
employee_id INT NOT NULL,
customer_id INT NOT NULL,
car_id INT NOT NULL,
car_condition VARCHAR(50) NOT NULL,
tank_level DECIMAL(4,2) NULL,
kilometrage_start INT NOT NULL,
kilometrage_end INT NOT NULL,
total_kilometrage INT NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
total_days INT NOT NULL,
rate_applied DECIMAL(4,2) NULL,
tax_rate DECIMAL(4,2) NOT NULL,
order_status ENUM('Active','Compleeted') NOT NULL,
notes LONGTEXT NOT NULL,


CONSTRAINT fk_rental_orders_employees FOREIGN KEY (employee_id)
REFERENCES employees(id),

CONSTRAINT fk_rental_orders_customers FOREIGN KEY (customer_id)
REFERENCES customers(id),

CONSTRAINT fk_rental_orders_cars FOREIGN KEY (car_id)
REFERENCES cars(id)
); 

INSERT INTO rental_orders (employee_id, customer_id, car_id, car_condition, tank_level, kilometrage_start, kilometrage_end, total_kilometrage, start_date, end_date, total_days, rate_applied, tax_rate, order_status, notes) VALUES
(1, 1, 1, 'Good', 1.00, 15000, 15250, 250, '2025-11-01', '2025-11-05', 5, 30.00, 0.20, 'Active', 'No issues'),
(2, 2, 2, 'Very Good', 0.80, 22000, 22200, 200, '2025-11-02', '2025-11-04', 3, 40.00, 0.20, 'Compleeted', 'Returned on time'),
(3, 3, 3, 'Excellent', 1.00, 5000, 5300, 300, '2025-11-03', '2025-11-07', 5, 60.00, 0.20, 'Active', 'Customer requested GPS'),
(4, 4, 4, 'Excellent', 0.90, 8000, 8200, 200, '2025-11-05', '2025-11-06', 2, 90.00, 0.20, 'Compleeted', 'Luxury car rental'),
(5, 5, 5, 'Good', 0.70, 12000, 12200, 200, '2025-11-06', '2025-11-10', 5, 70.00, 0.20, 'Active', 'Van rental for moving');

SELECT * FROM rental_orders;



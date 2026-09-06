-- Create the database
CREATE DATABASE employee;
USE employee;

-- Departments table
CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(100)
);

-- Location table
CREATE TABLE location (
    location_id INT,
    location VARCHAR(30)
);

-- Employees table
CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(50),
    gender ENUM('M', 'F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2)
);

-- Add "email" column
ALTER TABLE employees ADD COLUMN email VARCHAR(100);

-- Widen "designation" column
ALTER TABLE employees MODIFY COLUMN designation VARCHAR(150);

-- Drop "age" column
ALTER TABLE employees DROP COLUMN age;

-- Rename "hire_date" to "date_of_joining"
ALTER TABLE employees RENAME COLUMN hire_date TO date_of_joining;

TRUNCATE TABLE employees;


DROP TABLE employees;
DROP DATABASE employee;

DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F'),
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),
    CONSTRAINT fk_department FOREIGN KEY (department_id) 
        REFERENCES departments(department_id),
    CONSTRAINT fk_location FOREIGN KEY (location_id) 
        REFERENCES location(location_id)
);
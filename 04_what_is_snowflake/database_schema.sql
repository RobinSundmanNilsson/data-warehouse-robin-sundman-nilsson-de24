SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS demo_database;

USE DATABASE demo_database;

SHOW SCHEMAS;

CREATE SCHEMA IF NOT EXISTS demo_database.staging;

SHOW SCHEMAS IN DATABASE demo_database;

USE SCHEMA demo_database.staging;

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    first_name STRING,
    last_name STRING,
    age INT,
    email VARCHAR(100)
);

SHOW TABLES;

DESCRIBE TABLE customers;

INSERT INTO customers (customer_id, first_name, last_name, age, email) VALUES
(1, 'John', 'Doe', 30, 'john.doe@example.com'),
(2, 'Jane', 'Smith', 25, 'jane.smith@example.com'),
(3, 'Alice', 'Johnson', 40, 'alice.johnson@example.com'),
(4, 'Bob', 'Williams', 35, 'bob.williams@example.com'),
(5, 'Emily', 'Brown', 28, 'emily.brown@example.com');

SELECT * FROM customers;
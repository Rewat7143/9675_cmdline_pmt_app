CREATE DATABASE BankDB;

USE BankDB;

CREATE TABLE BankAccount (
    id INT AUTO_INCREMENT PRIMARY KEY,
    bank_name VARCHAR(255) NOT NULL,
    account_number VARCHAR(20) NOT NULL UNIQUE,
    account_type VARCHAR(50) NOT NULL,
    ifsc_code VARCHAR(20) NOT NULL,
    current_balance DECIMAL(15,2) NOT NULL,
    pin VARCHAR(10) NOT NULL
);

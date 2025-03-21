-- Step 1: Create the Database
CREATE DATABASE IF NOT EXISTS payment_db;
USE payment_db;

-- Step 2: Create Users Table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    account_no VARCHAR(20) UNIQUE NOT NULL,
    account_balance DOUBLE DEFAULT 0.00,
    wallet_balance DOUBLE DEFAULT 0.00
);

-- Step 3: Create Transactions Table
CREATE TABLE transactions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    amount DOUBLE NOT NULL,
    transaction_type ENUM('sent', 'received') NOT NULL,
    recipient VARCHAR(50) NOT NULL,
    txn_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE
);

-- Step 4: Insert Sample User Data
INSERT INTO users (username, account_no, account_balance, wallet_balance) 
VALUES 
('john_doe', '1234567890', 5000.00, 200.00),
('alice_smith', '0987654321', 3000.00, 100.00),
('mike_jones', '1122334455', 10000.00, 500.00);

-- Step 5: Insert Sample Transactions
INSERT INTO transactions (username, amount, transaction_type, recipient) 
VALUES 
('john_doe', 200.00, 'sent', 'alice_smith'),
('john_doe', 150.00, 'received', 'mike_jones'),
('alice_smith', 100.00, 'sent', 'john_doe'),
('mike_jones', 500.00, 'received', 'john_doe'),
('mike_jones', 1000.00, 'sent', 'alice_smith'),
('john_doe', 300.00, 'received', 'alice_smith'),
('alice_smith', 200.00, 'received', 'mike_jones'),
('mike_jones', 400.00, 'sent', 'john_doe'),
('john_doe', 50.00, 'sent', 'alice_smith'),
('alice_smith', 75.00, 'received', 'john_doe');

-- Step 6: Verify Data
SELECT * FROM users;
SELECT * FROM transactions;

CREATE DATABASE payment_gateway_system;
USE payment_gateway_system;

CREATE TABLE user_details (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    address TEXT NOT NULL
);

ALTER TABLE user_details RENAME COLUMN password TO pass_word;


SELECT*FROM user_details;

INSERT INTO user_details (user_name, pass_word, first_name, last_name, phone, email, address) VALUES
('rewat_1', 'password1', 'reddy', 'rewat', '6281783825', 'rewat@gmail.com', 'nad junction, vizag,AP'),
('ramana_1', 'password2', 'Venkat', 'ramana', '9377827371', 'ramana@gmail.com', 'lb nagar,hyderabad , TS'),
('varma', 'password3', 'mahindra', 'varma', '9628452738', 'varma@gmail.com', 'hebal road, banglore, karnataka'),
('yashwanth', 'password4', 'reddy', 'yashwanth', '9502851627', 'yashwanth@mail.com', 'thambaram, chennai, TN'),
('gowthami', 'password5', 'vechalapu', 'gowthami', '9392468016', 'gowthami@mail.com', 'old dairy form, vizag, AP');

CREATE TABLE user_account_details (
    user_account_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    account_open_date DATE NOT NULL,
    account_close_date DATE,
    current_wallet_balance DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    linked_bank_accounts_count INT NOT NULL DEFAULT 0,	
    wallet_pin VARCHAR(4) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user_details(user_id)
);

INSERT INTO user_account_details (user_id, account_open_date, account_close_date, current_wallet_balance, linked_bank_accounts_count, wallet_pin) VALUES
(1, '2023-01-01', NULL, 1000.00, 1, '1234'),
(2, '2023-02-01', NULL, 500.00, 2, '5678'),
(3, '2023-03-01', NULL, 750.00, 1, '9101'),
(4, '2023-04-01', NULL, 1200.00, 3, '1122'),
(5, '2023-05-01', NULL, 300.00, 1, '3344');

SELECT* FROM user_account_details;

# ALTER TABLE user_account_details AUTO_INCREMENT = 101;
# UPDATE user_account_details SET user_account_id=101 WHERE user_account_id=1;

CREATE TABLE bank_accounts (
    bank_account_id INT AUTO_INCREMENT PRIMARY KEY,
    user_account_id INT NOT NULL,
    user_id INT NOT NULL,
    account_number VARCHAR(20) NOT NULL,
    ifsc_code VARCHAR(15) NOT NULL,
    bank_name VARCHAR(100) NOT NULL,
    bank_account_branch_location VARCHAR(100) NOT NULL,
    is_active VARCHAR(10) NOT NULL,
    FOREIGN KEY (user_account_id) REFERENCES user_account_details(user_account_id),
    FOREIGN KEY (user_id) REFERENCES user_details(user_id)
);

INSERT INTO bank_accounts (user_account_id, user_id, account_number, ifsc_code, bank_name, bank_account_branch_location, is_active) VALUES
(1, 1, '123456789012', 'ABCD1234567', 'State Bank', 'City Branch 1', TRUE),
(2, 2, '987654321098', 'EFGH7654321', 'National Bank', 'City Branch 2', TRUE),
(3, 3, '112233445566', 'IJKL1122334', 'Global Bank', 'City Branch 3', TRUE),
(4, 4, '998877665544', 'MNOP9988776', 'City Bank', 'City Branch 4', TRUE),
(5, 5, '556677889900', 'QRST5566778', 'International Bank', 'City Branch 5', TRUE);

SELECT*FROM bank_accounts;

ALTER TABLE bank_accounts CHANGE is_active account_status ENUM('ACTIVE','INACTIVE','FROZEN','CLOSED'); 

UPDATE bank_accounts SET account_status = 'ACTIVE' WHERE user_account_id =1;

CREATE TABLE source_types (
    source_id INT AUTO_INCREMENT PRIMARY KEY,
    source_type_code VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO source_types (source_type_code) VALUES
('Bank Account'),
('Wallet Account'),
('Third Party Transaction');

ALTER TABLE source_types ADD COLUMN source_type_description  VARCHAR(20)NOT NULL ;

#UPDATE source_types SET source_type_description = source_type_code;

#UPDATE source_types SET source_type_description = source_type_code WHERE source_id IS NOT NULL;

ALTER TABLE source_types MODIFY COLUMN source_type_description VARCHAR(100) NOT NULL;

UPDATE source_types  SET source_type_description = source_type_code  WHERE source_id > 0; 

UPDATE source_types SET source_type_code = 'BA' WHERE source_id=1;


UPDATE source_types SET source_type_code = 'WA' WHERE source_id=2;

UPDATE source_types SET source_type_code = 'TPA' WHERE source_id=3;




SELECT*FROM source_types;

CREATE TABLE transaction_details (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_date_time DATETIME NOT NULL,
    source_id INT NOT NULL,
    destination_id INT NOT NULL,
    source_type_id INT NOT NULL,
    destination_type_id INT NOT NULL,
    FOREIGN KEY (source_type_id) REFERENCES source_types(source_id),
    FOREIGN KEY (destination_type_id) REFERENCES source_types(source_id)
);

INSERT INTO transaction_details (transaction_date_time, source_id, destination_id, source_type_id, destination_type_id) VALUES
('2023-09-01 10:00:00', 1, 2, 1, 2),
('2023-09-02 11:30:00', 2, 3, 2, 1),
('2023-09-03 12:45:00', 3, 4, 1, 3),
('2023-09-04 14:15:00', 4, 5, 3, 2),
('2023-09-05 15:30:00', 5, 1, 2, 1);

SELECT*FROM transaction_details;
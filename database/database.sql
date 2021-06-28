CREATE DATABASE pcs_orange;

USE pcs_orange;

-- imposible null by form validation
CREATE TABLE pcso_applicants(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    company_name VARCHAR(255),
    phone_number INT,
    email VARCHAR(255),
    registred_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);


CREATE TABLE pcso_admin(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255),
    password VARCHAR(255),
    ip_computer VARCHAR(255),
    comunicate_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
    registred_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);
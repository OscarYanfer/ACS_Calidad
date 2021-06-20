CREATE DATABASE aseguramiento_calidad;

USE aseguramiento_calidad;

-- imposible null by form validation
CREATE TABLE contact_datas(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(40),
    company_name VARCHAR(40),
    phone_number INT(9),
    email VARCHAR(40),
    registred_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);
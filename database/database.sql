USE `heroku_f8f49523a25a3a5`;

CREATE TABLE states(
	id INT NOT NULL primary KEY AUTO_INCREMENT,
    state VARCHAR(255)
);

INSERT INTO states (id,state) 
VALUES
	(1,'check'),
    (2,'uncheck');

-- imposible null by form validation
CREATE TABLE pcso_applicants(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    company_name VARCHAR(255),
    phone_number INT,
    email VARCHAR(255),
    id_states INT,
    registred_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY (id_states) REFERENCES states(id)
);

CREATE TABLE pcso_admin(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255),
    password VARCHAR(255),
    ip_computer VARCHAR(255),
    comunicate_at TIMESTAMP NOT NULL DEFAULT current_timestamp ,
    registred_at TIMESTAMP NOT NULL DEFAULT current_timestamp
    -- reated_at_time TIME() NOT NULL DEFAULT DATE_FORMAT(NOW( ),"%H:%i:%S") ,
    -- created_at_day DATE NOT NULL DEFAULT CURDATE() 
);
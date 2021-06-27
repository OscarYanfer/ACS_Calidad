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

CREATE TABLE pcso_users(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255),
    password VARCHAR(255),
    registred_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);

CREATE TABLE pcso_admin(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ip_computer VARCHAR(255),
    registred_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);

CREATE TABLE pcso_admin_for_applicant(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_admin INT NOT NULL,
    id_applicant INT NOT NULL,
    registred_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);

ALTER TABLE `pcs_orange`.`pcso_admin_for_applicant` 
ADD INDEX `fk_admin_idx` (`id_admin` ASC) VISIBLE;
;
ALTER TABLE `pcs_orange`.`pcso_admin_for_applicant` 
ADD CONSTRAINT `fk_admin`
  FOREIGN KEY (`id_admin`)
  REFERENCES `pcs_orange`.`pcso_admin` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `pcs_orange`.`pcso_admin_for_applicant` 
ADD INDEX `fk_applicants_idx` (`id_applicant` ASC) VISIBLE;
;
ALTER TABLE `pcs_orange`.`pcso_admin_for_applicant` 
ADD CONSTRAINT `fk_applicants`
  FOREIGN KEY (`id_applicant`)
  REFERENCES `pcs_orange`.`pcso_applicants` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
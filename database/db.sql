CREATE DATABASE algorum;

USE algorum;

CREATE TABLE categoria(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nivel VARCHAR(255) NOT NULL
);

INSERT INTO categoria (id,nivel) VALUES 
(1,'publico'),
(2,'basico'),
(3,'premiun'),
(4,'experto');

CREATE TABLE users (
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(255) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    nombres VARCHAR(225) NOT NULL,
    apellidos VARCHAR(225) NOT NULL,
    categoria int NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY(categoria) REFERENCES categoria(id)
);

CREATE TABLE nivel(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dificultad VARCHAR(255) NOT NULL
);

INSERT INTO nivel (id,dificultad) VALUES 
(1,'novicio'),
(2,'intermedio'),
(3,'avanzado'),
(4,'gotto');

CREATE TABLE lenguajes(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255) NOT NULL
);

INSERT INTO lenguajes (id,tipo) VALUES 
(1,'python'),
(2,'c'),
(3,'c++'),
(4,'javascript'),
(5,'SQL'),
(6,'java');

CREATE TABLE codigo(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    lenguaje INT NOT NULL,
    contenido TEXT NOT NULL,
    nivelC int NOT NULL,
    categoria int NOT NULL,
    id_usuario INT NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY(categoria) REFERENCES categoria(id),
    FOREIGN KEY(nivelC) REFERENCES nivel(id),
    FOREIGN KEY(id_usuario) REFERENCES users(id),
    FOREIGN KEY(lenguaje) REFERENCES lenguajes(id)
);
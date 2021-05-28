CREATE DATABASE Switch;
USE Switch;

CREATE TABLE tbl_problemas(
	id_problema INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(250) NOT NULL DEFAULT 'Ejercicio de programacion',
    descripcion TEXT NOT NULL,
    id_nivel INT NOT NULL,
    id_categoria INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);

CREATE TABLE tbl_lenguajes(
	id_lenguaje INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    descripcion TEXT NOT NULL,
    imagen VARCHAR(30)
);

ALTER TABLE tbl_lenguajes CHANGE imagen imagen LONGBLOB NOT NULL;

CREATE TABLE tbl_soluciones(
	id_solucion INT PRIMARY KEY AUTO_INCREMENT,
	id_problema INT NOT NULL,
    id_lenguaje INT NOT NULL,
    solucion TEXT NOT NULL
);

CREATE TABLE tbl_nivel(
	id_nivel INT PRIMARY KEY AUTO_INCREMENT,
    nivel VARCHAR(15)
);

CREATE TABLE tbl_categoria(
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(20)
);

CREATE TABLE tbl_users(
	id_user INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL,
    pasword VARCHAR(100) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    id_categoria INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);

CREATE TABLE tbl_favoritos(
	id_favorito INT PRIMARY KEY AUTO_INCREMENT,
    id_problema INT NOT NULL,
    id_user INT NOT NULL
);

ALTER TABLE tbl_favoritos ADD created_at TIMESTAMP NOT NULL DEFAULT current_timestamp;

CREATE TABLE tbl_comentarios(
	id_comentario INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT NOT NULL,
    comentario TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);

ALTER TABLE tbl_comentarios ADD id_solucion INT NOT NULL;

CREATE TABLE tbl_etiquetas(
	id_etiqueta INT PRIMARY KEY AUTO_INCREMENT,
    etiqueta VARCHAR(20) NOT NULL
);

CREATE TABLE tbl_etiquetasXproblema(
	id_etqProblema INT PRIMARY KEY AUTO_INCREMENT,
    id_etiqueta INT NOT NULL,
    id_problema INT NOT NULL
);

/* ---- llaves foraneas ---- */

ALTER TABLE tbl_soluciones ADD CONSTRAINT fk_problema FOREIGN KEY 
(id_problema) REFERENCES tbl_problemas(id_problema) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tbl_soluciones ADD CONSTRAINT fk_lenguaje FOREIGN KEY 
(id_lenguaje) REFERENCES tbl_lenguajes(id_lenguaje) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tbl_problemas ADD CONSTRAINT fk_nivel FOREIGN KEY 
(id_nivel) REFERENCES tbl_nivel(id_nivel) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tbl_problemas ADD CONSTRAINT fk_categoria FOREIGN KEY 
(id_categoria) REFERENCES tbl_categoria(id_categoria) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tbl_users ADD CONSTRAINT fk_userCategoria FOREIGN KEY 
(id_categoria) REFERENCES tbl_categoria(id_categoria) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tbl_favoritos ADD CONSTRAINT fk_favProblema FOREIGN KEY 
(id_problema) REFERENCES tbl_problemas(id_problema) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tbl_favoritos ADD CONSTRAINT fk_favUser FOREIGN KEY 
(id_user) REFERENCES tbl_users(id_user) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tbl_comentarios ADD CONSTRAINT fk_userComent FOREIGN KEY 
(id_user) REFERENCES tbl_users(id_user) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tbl_comentarios ADD CONSTRAINT fk_comentSol FOREIGN KEY 
(id_solucion) REFERENCES tbl_soluciones(id_solucion) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tbl_etiquetasXproblema ADD CONSTRAINT fk_etqProblema 
FOREIGN KEY (id_problema) REFERENCES tbl_problemas(id_problema) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tbl_etiquetasXproblema ADD CONSTRAINT fk_etiqueta 
FOREIGN KEY (id_etiqueta) REFERENCES tbl_etiquetas(id_etiqueta) 
ON DELETE CASCADE ON UPDATE CASCADE;

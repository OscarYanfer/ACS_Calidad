-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: switch
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_categoria`
--

DROP TABLE IF EXISTS `tbl_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categoria`
--

LOCK TABLES `tbl_categoria` WRITE;
/*!40000 ALTER TABLE `tbl_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_comentarios`
--

DROP TABLE IF EXISTS `tbl_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_comentarios` (
  `id_comentario` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `comentario` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_solucion` int NOT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `fk_userComent` (`id_user`),
  KEY `fk_comentSol` (`id_solucion`),
  CONSTRAINT `fk_comentSol` FOREIGN KEY (`id_solucion`) REFERENCES `tbl_soluciones` (`id_solucion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_userComent` FOREIGN KEY (`id_user`) REFERENCES `tbl_users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comentarios`
--

LOCK TABLES `tbl_comentarios` WRITE;
/*!40000 ALTER TABLE `tbl_comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_etiquetas`
--

DROP TABLE IF EXISTS `tbl_etiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_etiquetas` (
  `id_etiqueta` int NOT NULL AUTO_INCREMENT,
  `etiqueta` varchar(20) NOT NULL,
  PRIMARY KEY (`id_etiqueta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_etiquetas`
--

LOCK TABLES `tbl_etiquetas` WRITE;
/*!40000 ALTER TABLE `tbl_etiquetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_etiquetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_etiquetasxproblema`
--

DROP TABLE IF EXISTS `tbl_etiquetasxproblema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_etiquetasxproblema` (
  `id_etqProblema` int NOT NULL AUTO_INCREMENT,
  `id_etiqueta` int NOT NULL,
  `id_problema` int NOT NULL,
  PRIMARY KEY (`id_etqProblema`),
  KEY `fk_etqProblema` (`id_problema`),
  KEY `fk_etiqueta` (`id_etiqueta`),
  CONSTRAINT `fk_etiqueta` FOREIGN KEY (`id_etiqueta`) REFERENCES `tbl_etiquetas` (`id_etiqueta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_etqProblema` FOREIGN KEY (`id_problema`) REFERENCES `tbl_problemas` (`id_problema`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_etiquetasxproblema`
--

LOCK TABLES `tbl_etiquetasxproblema` WRITE;
/*!40000 ALTER TABLE `tbl_etiquetasxproblema` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_etiquetasxproblema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_favoritos`
--

DROP TABLE IF EXISTS `tbl_favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_favoritos` (
  `id_favorito` int NOT NULL AUTO_INCREMENT,
  `id_problema` int NOT NULL,
  `id_user` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_favorito`),
  KEY `fk_favProblema` (`id_problema`),
  KEY `fk_favUser` (`id_user`),
  CONSTRAINT `fk_favProblema` FOREIGN KEY (`id_problema`) REFERENCES `tbl_problemas` (`id_problema`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_favUser` FOREIGN KEY (`id_user`) REFERENCES `tbl_users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_favoritos`
--

LOCK TABLES `tbl_favoritos` WRITE;
/*!40000 ALTER TABLE `tbl_favoritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_lenguajes`
--

DROP TABLE IF EXISTS `tbl_lenguajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_lenguajes` (
  `id_lenguaje` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` longblob NOT NULL,
  PRIMARY KEY (`id_lenguaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_lenguajes`
--

LOCK TABLES `tbl_lenguajes` WRITE;
/*!40000 ALTER TABLE `tbl_lenguajes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_lenguajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nivel`
--

DROP TABLE IF EXISTS `tbl_nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_nivel` (
  `id_nivel` int NOT NULL AUTO_INCREMENT,
  `nivel` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nivel`
--

LOCK TABLES `tbl_nivel` WRITE;
/*!40000 ALTER TABLE `tbl_nivel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_problemas`
--

DROP TABLE IF EXISTS `tbl_problemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_problemas` (
  `id_problema` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL DEFAULT 'Ejercicio de programacion',
  `descripcion` text NOT NULL,
  `id_nivel` int NOT NULL,
  `id_categoria` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_problema`),
  KEY `fk_nivel` (`id_nivel`),
  KEY `fk_categoria` (`id_categoria`),
  CONSTRAINT `fk_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categoria` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nivel` FOREIGN KEY (`id_nivel`) REFERENCES `tbl_nivel` (`id_nivel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_problemas`
--

LOCK TABLES `tbl_problemas` WRITE;
/*!40000 ALTER TABLE `tbl_problemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_problemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_soluciones`
--

DROP TABLE IF EXISTS `tbl_soluciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_soluciones` (
  `id_solucion` int NOT NULL AUTO_INCREMENT,
  `id_problema` int NOT NULL,
  `id_lenguaje` int NOT NULL,
  `solucion` text NOT NULL,
  PRIMARY KEY (`id_solucion`),
  KEY `fk_problema` (`id_problema`),
  KEY `fk_lenguaje` (`id_lenguaje`),
  CONSTRAINT `fk_lenguaje` FOREIGN KEY (`id_lenguaje`) REFERENCES `tbl_lenguajes` (`id_lenguaje`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_problema` FOREIGN KEY (`id_problema`) REFERENCES `tbl_problemas` (`id_problema`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_soluciones`
--

LOCK TABLES `tbl_soluciones` WRITE;
/*!40000 ALTER TABLE `tbl_soluciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_soluciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `pasword` varchar(100) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `id_categoria` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`),
  KEY `fk_userCategoria` (`id_categoria`),
  CONSTRAINT `fk_userCategoria` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categoria` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-14 16:57:34

CREATE DATABASE  IF NOT EXISTS `secundaria_db` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `secundaria_db`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: secundaria_db
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellidoPaterno` varchar(45) NOT NULL,
  `apellidoMaterno` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (1,'Maria','Cruz','Hernandez','lda@gmail.com','1234');
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anuncios`
--

DROP TABLE IF EXISTS `anuncios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anuncios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `descripcion` varchar(450) NOT NULL,
  `archivo` varchar(100) NOT NULL,
  `Administradores_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Anuncios_Administradores1_idx` (`Administradores_id`),
  CONSTRAINT `fk_Anuncios_Administradores1` FOREIGN KEY (`Administradores_id`) REFERENCES `administradores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncios`
--

LOCK TABLES `anuncios` WRITE;
/*!40000 ALTER TABLE `anuncios` DISABLE KEYS */;
INSERT INTO `anuncios` VALUES (1,'Inscripciones 2021','En febrero son las preinscripciones, aparta tu lugar.','1647639316698_img_.jpg',1),(2,'Inscripciones 2022','¿Febrero mes del amor y la amistad? Sí, mes del amor a una buena educación; y la secundaria Libertadores de América es la gran opción. Febrero es el mes de las inscripciones, acércate a nosotros para más información.','1647639316699_img_.jpg',1);
/*!40000 ALTER TABLE `anuncios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursoestudiante`
--

DROP TABLE IF EXISTS `cursoestudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursoestudiante` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Cursos_id` int NOT NULL,
  `Estudiantes_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_CursoEstudiante_Cursos1_idx` (`Cursos_id`),
  KEY `fk_CursoEstudiante_Estudiantes1_idx` (`Estudiantes_id`),
  CONSTRAINT `fk_CursoEstudiante_Cursos1` FOREIGN KEY (`Cursos_id`) REFERENCES `cursos` (`id`),
  CONSTRAINT `fk_CursoEstudiante_Estudiantes1` FOREIGN KEY (`Estudiantes_id`) REFERENCES `estudiantes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursoestudiante`
--

LOCK TABLES `cursoestudiante` WRITE;
/*!40000 ALTER TABLE `cursoestudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursoestudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(450) NOT NULL,
  `Maestros_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_Cursos_Maestros1_idx` (`Maestros_id`),
  CONSTRAINT `fk_Cursos_Maestros1` FOREIGN KEY (`Maestros_id`) REFERENCES `maestros` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Español','Español',1),(2,'Matemáticas','Matemáticas',2),(3,'Inglés I','Inglés I',3),(4,'Ciencias I (Biología)','Ciencias I (Biología)',4),(5,'Ciencias II (Física)','Ciencias II (Física)',5),(6,'Historia I','Historia I',6),(7,'Informática','Informática',7),(8,'Formación Cívica y Ética','Formación Cívica y Ética',8),(9,'Educación Física','Educación Física',9),(10,'Artes (Música)','Artes (Música)',10),(11,'Artes (Pintura)','Artes (Pintura)',11),(12,'Artes (Danza Folklórica)','Artes (Danza Folklórica)',12),(13,'Artes (Teatro y Poesía)','Artes (Teatro y Poesía)',13),(14,'Prefectura','Prefectura',14);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `id` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidoPaterno` varchar(45) NOT NULL,
  `apellidoMaterno` varchar(45) NOT NULL,
  `curp` varchar(45) NOT NULL,
  `fecha_Nacimiento` datetime NOT NULL,
  `genero` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Grupos_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `curp_UNIQUE` (`curp`),
  KEY `fk_Estudiantes_Grupos1_idx` (`Grupos_id`),
  CONSTRAINT `fk_Estudiantes_Grupos1` FOREIGN KEY (`Grupos_id`) REFERENCES `grupos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,'Sayuri','Alberto','Toledo','AETS090818MOCLLYA3','2009-08-18 00:00:00','Femenino',1),(2,'Biaani','Antonio','Nava','AONB090615MOCNVNA9','2009-06-15 00:00:00','Femenino',1),(3,'Sebastian','Armenta','Rodriguez','AERS090603HOCRDBA1','2009-06-03 00:00:00','Masculino',1),(4,'Amanda','Barrios','Arelly','BAXA090128MNERXRA7','2009-01-28 00:00:00','Femenino',1),(5,'Daniel','Bramlett','Velazquez','BAVD090808HOCRLNA2','2009-08-08 00:00:00','Masculino',1),(6,'Mariam','Cortes','Reyes','CORM091010MOCRYRA5','2009-10-10 00:00:00','Femenino',1),(7,'Cristian','Cortes','Santos','COSC090922HOCRNRA2','2009-09-22 00:00:00','Masculino',1),(8,'Dylan','Cruz','Mayoral','CUMD090817HOCRYYA4','2009-08-17 00:00:00','Masculino',2),(9,'Sicaru','Esteva','Hernandez','EEHS091206MOCSRCA2','2009-12-06 00:00:00','Femenino',2),(10,'Orestes','Garcia','Moguel','GAMO090202HOCRGRA7','2009-02-02 00:00:00','Masculino',2),(11,'Yael','Garcia','Redondo','GARY091213HOCRDLA3','2009-12-13 00:00:00','Masculino',2),(12,'Camila','Matias','Cruz','MACC090201MOCTRMA3','2009-02-01 00:00:00','Femenino',2),(13,'Aileen','Montoya','Cuevas','MOCA090528MOCNVLA4','2009-05-28 00:00:00','Femenino',2),(14,'Yeshua','Pablo','Dominguez','PADY091119HOCBMSA5','2009-11-19 00:00:00','Masculino',2),(15,'Mia','Ramirez','Barrios','RABM090727MOCMRXA6','2008-07-27 00:00:00','Femenino',3),(16,'Julio','Ramirez','Leon','RALJ090131HMCMNLA1','2008-07-28 00:00:00','Masculino',3),(17,'Nelly','Salinas','Salinas','SASN081113MDFLLLA6','2008-07-29 00:00:00','Femenino',3),(18,'Ayllen','Santiago','Galindo','SAGA090324MOCNLYA9','2008-07-30 00:00:00','Femenino',3),(19,'Jenny','Tapia','Espinosa','TAEJ090803MPLPSNA0','2008-07-31 00:00:00','Femenino',3),(20,'Isaul','Valdivies','Lopez','VALI091020HOCLPSA0','2008-08-01 00:00:00','Masculino',3),(21,'Fernanda','Velasco','Naranjo','VENF091119MOCLRRA8','2008-08-02 00:00:00','Femenino',3),(22,'Danna','Venegas','Morales','VEMD091010MOCNRNA1','2008-08-03 00:00:00','Femenino',3),(23,'Evelyn','Zarate','Perez','ZAPE090619MOCRRVA1','2008-08-04 00:00:00','Femenino',3),(24,'Mia','Juárez','Gómez','ZAPE090619MOCRRVA2','2008-08-05 00:00:00','Femenino',4),(25,'Julio','Narváez','Cruz','ZAPE090619MOCRRVA3','2008-08-06 00:00:00','Masculino',4),(26,'Nelly','Ramírez','Soria','ZAPE090619MOCRRVA4','2008-08-07 00:00:00','Femenino',4),(27,'Ayllen','Peña','Ramírez','ZAPE090619MOCRRVA5','2008-08-08 00:00:00','Masculino',4),(28,'Jenny','Fuentes','Ramírez','ZAPE090619MOCRRVA6','2008-08-09 00:00:00','Femenino',4),(29,'Amanda','Aguilar','Martínez','ZAPE090619MOCRRVA7','2008-08-10 00:00:00','Femenino',4),(30,'Daniel','Marín','Aragón ','ZAPE090619MOCRRVA8','2008-08-11 00:00:00','Masculino',4),(31,'Mariam','Olivera','Gaspar','ZAPE090619MOCRRVA9','2010-06-27 00:00:00','Femenino',5),(32,'Cristian','López','Enrique','ZAPE090619MOCRRVA10','2010-06-28 00:00:00','Masculino',5),(33,'Dylan','Antonio','González','ZAPE090619MOCRRVA11','2010-06-29 00:00:00','Masculino',5),(34,'Sicaru','García','Gordillo','ZAPE090619MOCRRVA12','2010-06-30 00:00:00','Femenino',5),(35,'Orestes','Martínez','López','ZAPE090619MOCRRVA13','2010-07-01 00:00:00','Masculino',5),(36,'Raul','Hernández','Camacho','ZAPE090619MOCRRVA14','2010-07-02 00:00:00','Masculino',6),(37,'Ana','Vásquez','Mijangos','ZAPE090619MOCRRVA15','2010-07-03 00:00:00','Femenino',6),(38,'Alejandra Haydeé','Camacho','Hernández','licl890118moczrn15','2010-07-04 00:00:00','Femenino',6),(39,'Anatolio ','Mijangos','Vásquez','licl890119moczrn16','2010-07-05 00:00:00','Masculino',6),(40,'Edgar','Enrique','López','GAMO090202HOCRGRA5','2010-07-06 00:00:00','Masculino',6),(41,'Nicolás','González','Antonio','GARY091213HOCRDLA4','2010-07-07 00:00:00','Masculino',6),(42,'Martha','Martínez','Aguilar','SAGA090324MOCNLYA8','2010-07-08 00:00:00','Femenino',6);
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantetutor`
--

DROP TABLE IF EXISTS `estudiantetutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantetutor` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Estudiantes_id` int unsigned NOT NULL,
  `Tutores_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_EstudianteTutor_Estudiantes1_idx` (`Estudiantes_id`),
  KEY `fk_EstudianteTutor_Tutores1_idx` (`Tutores_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantetutor`
--

LOCK TABLES `estudiantetutor` WRITE;
/*!40000 ALTER TABLE `estudiantetutor` DISABLE KEYS */;
INSERT INTO `estudiantetutor` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30),(31,31,31),(32,32,32),(33,33,33),(34,34,34),(35,35,35),(36,36,36),(37,37,37),(38,38,38),(39,39,39),(40,40,40),(41,41,41),(42,42,42);
/*!40000 ALTER TABLE `estudiantetutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos` (
  `id` int NOT NULL,
  `Grado` int NOT NULL,
  `Grupo` char(1) NOT NULL,
  `Cupo` int DEFAULT NULL,
  `Maestros_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Grupos_Maestros1_idx` (`Maestros_id`),
  CONSTRAINT `fk_Grupos_Maestros1` FOREIGN KEY (`Maestros_id`) REFERENCES `maestros` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,1,'A',25,1),(2,1,'B',25,2),(3,2,'A',25,3),(4,2,'B',25,4),(5,3,'A',25,5),(6,3,'B',25,6);
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maestros`
--

DROP TABLE IF EXISTS `maestros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maestros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellidoPaterno` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellidoMaterno` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  `curp` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telefono` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `fecha_contratacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `curp_UNIQUE` (`curp`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maestros`
--

LOCK TABLES `maestros` WRITE;
/*!40000 ALTER TABLE `maestros` DISABLE KEYS */;
INSERT INTO `maestros` VALUES (1,'Nayeli de Jesús','Gómez','Juárez','1971-02-19 00:00:00','licl890119moczrn04','1@gmail.com','password1','1','2022-01-03 00:00:00'),(2,'Uriel','Cruz','Narváez','1972-01-25 00:00:00','licl890119moczrn05','2@gmail.com','password2','9541413402','2012-05-05 00:00:00'),(3,'Catalina','Soria','Ramírez','1972-01-26 00:00:00','licl890119moczrn06','3@gmail.com','password3','9541413403','2012-05-06 00:00:00'),(4,'Dora Luz','Ramírez','Peña','1972-01-27 00:00:00','licl890119moczrn07','4@gmail.com','password4','9541413404','2012-05-07 00:00:00'),(5,'Luis','Ramírez','Fuentes','1972-01-28 00:00:00','licl890119moczrn08','5@gmail.com','password5','9541413405','2012-05-08 00:00:00'),(6,'Martha','Martínez','Aguilar','1972-01-29 00:00:00','licl890119moczrn09','6@gmail.com','password6','9541413406','2012-05-09 00:00:00'),(7,'Israel','Aragón ','Marín','1972-01-30 00:00:00','licl890119moczrn10','7@gmail.com','password7','9541413407','2012-05-10 00:00:00'),(8,'Martha Mirsa','Gaspar','Olivera','1972-01-31 00:00:00','licl890119moczrn11','8@gmail.com','password8','9541413408','2012-05-11 00:00:00'),(9,'Edgar','Enrique','López','1972-02-01 00:00:00','licl890119moczrn12','9@gmail.com','password9','9541413409','2012-05-12 00:00:00'),(10,'Nicolás','González','Antonio','1972-02-02 00:00:00','licl890119moczrn13','10@gmail.com','password10','9541413410','2012-05-13 00:00:00'),(11,'Noé Fernando ','Gordillo','García','1972-02-03 00:00:00','licl890119moczrn14','11@gmail.com','password11','9541413411','2012-05-14 00:00:00'),(12,'María Inés','López','Martínez','1972-02-04 00:00:00','licl890119moczrn15','12@gmail.com','password12','9541413412','2012-05-15 00:00:00'),(13,'Alejandra Haydeé','Camacho','Hernández','1972-02-05 00:00:00','licl890119moczrn16','13@gmail.com','password13','9541413413','2012-05-16 00:00:00'),(14,'Anatolio ','Mijangos','Vásquez','1972-02-06 00:00:00','licl890119moczrn17','14@gmail.com','password14','9541413414','2012-05-17 00:00:00');
/*!40000 ALTER TABLE `maestros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutores`
--

DROP TABLE IF EXISTS `tutores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutores` (
  `id` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidoPaterno` varchar(45) NOT NULL,
  `apellidoMaterno` varchar(45) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(45) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutores`
--

LOCK TABLES `tutores` WRITE;
/*!40000 ALTER TABLE `tutores` DISABLE KEYS */;
INSERT INTO `tutores` VALUES (1,'PATRICIA','FLORES ','BRISEÑO','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71980','patricia.flores@correo.buap.mx','password1','9547784520','Tutor@'),(2,'GANTE','AGUILAR','DE','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71981','andrea.aguilardegante@correo.buap.mx','password2','9547784522','Tutor@'),(3,'FELIPE','ARÁMBULA','IBÁÑEZ','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71982','felipe.arambula@correo.buap.mx','password3','9547784524','Tutor@'),(4,'MÓNICA ','BARRIENTOS','SÁNCHEZ','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71983','monica.barrientos@correo.buap.mx','password4','9547784526','Tutor@'),(5,'JOSÉ','BERNAL','SUÁREZ','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71984','carlos.bernal@correo.buap.mx  ','password5','9547784528','Tutor@'),(6,'SANTA','CAMARILLO','REYES','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71985','santa.camarillo@correo.buap.mx','password6','9547784530','Tutor@'),(7,'GUILLERMO ','CARRERA','GARCÍA','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71986','guillermo.carrera@correo.buap.mx','password7','9547784532','Tutor@'),(8,'MIRIAM ','CARRILLO ','RUÍZ','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71987','miriam.carrilloruiz@correo.buap.mx','password8','9547784534','Tutor@'),(9,'SARAHÍ','CASTELLI ','OLVERA','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71988','sarahi.castelli@correo.buap.mx','password9','9547784536','Tutor@'),(10,'JORGE','CASTILLO','DURÁN','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71989','jorge.castillo@correo.buap.mx','password10','9547784538','Tutor@'),(11,'GERMÁN ','CRUZ','GUZMÁN','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71990','german.cruz@correo.buap.mx','password11','9547784540','Tutor@'),(12,'TERESA','CERVANTES ','FIGUEROA','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71991','adriana.cervantes@correo.buap.mx','password12','9547784542','Tutor@'),(13,'NANCY','CISNEROS ','MARTÍNEZ','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71992','nancy.cisneros@correo.buap.mx','password13','9547784544','Tutor@'),(14,'LUIS ','CRUZ','VARELA','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71993','luis.cruzvar@correo.buap.mx','password14','9547784546','Tutor@'),(15,'MARÍA','CURRO ','LAU','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71994','guadalupe.curro@correo.buap.mx','password15','9547784548','Tutor@'),(16,'TORRE','DE','LA','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71995','silvia.delatorre@correo.buap.mx','password16','9547784550','Tutor@'),(17,'SARA','DELOYA','ROBLEDO','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71996','sara.deloya@correo.buap.mx','password17','9547784552','Tutor@'),(18,'PATRICIA ','DURÁN ','BRAVO','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71997','patricia.duran@correo.buap.mx','password18','9547784554','Tutor@'),(19,'MARTÍN','ECHEVERRÍA','VICTORIA-','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71998','martin.echeverria@correo.buap.mx','password19','9547784556','Tutor@'),(20,'OMAR','ESPINOSA','HERRERA','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP71999','omar.espinosa@correo.buap.mx','password20','9547784558','Tutor@'),(21,'JOSÉ','ESTRADA ','RODRÍGUEZ','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72000','jluis.estrada@correo.buap.mx','password21','9547784560','Tutor@'),(22,'ANDREA ','ESTUPIÑÁN','VILLANUEVA','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72001','andrea.estupinan@correo.buap.mx','password22','9547784562','Tutor@'),(23,'ADRIÁN ','FERNÁNDEZ','RODRÍGUEZ','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72002','adrian.fernandez@correo.buap.mx','password23','9547784564','Tutor@'),(24,'BEATRIZ ','FLORES','BAZÁN','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72003','beatriz.bazan@correo.buap.mx','password24','9547784566','Tutor@'),(25,'MARIA','FLORES','GUERRA','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72004','msocorro.flores@correo.buap.mx','password25','9547784568','Tutor@'),(26,'JORGE','GALLEGOS','VARGAS','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72005','jorge.gallegos@correo.buap.mx','password26','9547784570','Tutor@'),(27,'ABRIL','GAMBOA ','ESTEVES','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72006','abril.gamboa@correo.buap.mx','password27','9547784572','Tutor@'),(28,'ALEJANDRO ','GEORGE ','CRUZ','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72007','alejandro.george@correo.buap.mx','password28','9547784574','Tutor@'),(29,'ANAYURI ','GUEMES ','CRUZ','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72008','anayuri.guemes@correo.buap.mx','password29','9547784576','Tutor@'),(30,'VALERIA','GUERRERO','GARDUÑO','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72009','valeria.guerrero@correo.buap.mx','password30','9547784578','Tutor@'),(31,'LUIS','GUTIÉRREZ ','DOMÍNGUEZ','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72010','luis.gutierrezd@correo.buap.mx','password31','9547784580','Tutor@'),(32,'ROBERTO ','GUTIÉRREZ','CASTRO','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72011','roberto.gutierrez@correo.buap.mx','password32','9547784582','Tutor@'),(33,'HERNÁN','HERRERA','BAUTISTA','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72012','hernan.herreraba@correo.buap.mx','password33','9547784584','Tutor@'),(34,'HILDA','HERNÁNDEZ ','FLORES','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72013','hgabriela.hernandez@correo.buap.mx','password34','9547784586','Tutor@'),(35,'JORGE','HERNÁNDEZ','ALCÁNTARA','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72014','martin.hernandeza@correo.buap.mx','password35','9547784588','Tutor@'),(36,'MARÍA','HERNÁNDEZ','NIÑO','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72015','iliana.hernandez@correo.buap.mx','password36','9547784590','Tutor@'),(37,'RICARDO ','IBÁÑEZ','SANDOVAL','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72016','ricardo.ibanez@correo.buap.mx','password37','9547784592','Tutor@'),(38,'MARÍA ','LÓPEZ','AGUILAR','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72017','maria.lopezaguilar@correo.buap.mx','password38','9547784594','Tutor@'),(39,'HUGO','LÓPEZ','CORONEL','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72018','hugo.lopez@correo.buap.mx','password39','9547784596','Tutor@'),(40,'JOSÉ','LÓPEZ','OLEA','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72019','fernando.lopezolea@correo.buap.mx','password40','9547784598','Tutor@'),(41,'ANAYETZY','MARÍN','ESPINOZA','Carretera Costera Km 143, Zicatela, Puerto Escondido, Oax. CP72020','yuriria.marin@correo.buap.mx','password41','9547784600','Tutor@');
/*!40000 ALTER TABLE `tutores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-18 20:56:57

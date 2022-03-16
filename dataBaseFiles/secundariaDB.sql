-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Secundaria_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Secundaria_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Secundaria_db` DEFAULT CHARACTER SET utf8 ;
USE `Secundaria_db` ;

-- -----------------------------------------------------
-- Table `Secundaria_db`.`Maestros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Secundaria_db`.`Maestros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidoPaterno` VARCHAR(45) NOT NULL,
  `apellidoMaterno` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATETIME NULL,
  `curp` VARCHAR(45) NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `telefono` INT(15) NULL,
  `fecha_contratacion` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `curp_UNIQUE` (`curp` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `Secundaria_db`.`Grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Secundaria_db`.`Grupos` (
  `id` INT NOT NULL,
  `Grado` INT NOT NULL,
  `Grupo` CHAR NOT NULL,
  `Cupo` INT NULL,
  `Maestros_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Grupos_Maestros1_idx` (`Maestros_id` ASC) VISIBLE,
  CONSTRAINT `fk_Grupos_Maestros1`
    FOREIGN KEY (`Maestros_id`)
    REFERENCES `Secundaria_db`.`Maestros` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Secundaria_db`.`Estudiantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Secundaria_db`.`Estudiantes` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidoPaterno` VARCHAR(45) NOT NULL,
  `apellidoMaterno` VARCHAR(45) NOT NULL,
  `curp` VARCHAR(45) NOT NULL,
  `fecha_Nacimiento` DATETIME NOT NULL,
  `genero` VARCHAR(10) BINARY NOT NULL,
  `Grupos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `curp_UNIQUE` (`curp` ASC) VISIBLE,
  INDEX `fk_Estudiantes_Grupos1_idx` (`Grupos_id` ASC) VISIBLE,
  CONSTRAINT `fk_Estudiantes_Grupos1`
    FOREIGN KEY (`Grupos_id`)
    REFERENCES `Secundaria_db`.`Grupos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Secundaria_db`.`Tutores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Secundaria_db`.`Tutores` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidoPaterno` VARCHAR(45) NOT NULL,
  `apellidoMaterno` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `telefono` INT(15) NOT NULL,
  `Tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Secundaria_db`.`Administradores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Secundaria_db`.`Administradores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidoPaterno` VARCHAR(45) NOT NULL,
  `apellidoMaterno` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Secundaria_db`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Secundaria_db`.`Cursos` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(450) NOT NULL,
  `Maestros_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  INDEX `fk_Cursos_Maestros1_idx` (`Maestros_id` ASC) VISIBLE,
  CONSTRAINT `fk_Cursos_Maestros1`
    FOREIGN KEY (`Maestros_id`)
    REFERENCES `Secundaria_db`.`Maestros` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Secundaria_db`.`CursoEstudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Secundaria_db`.`CursoEstudiante` (
  `Cursos_id` INT NOT NULL,
  `Estudiantes_id` INT NOT NULL,
  INDEX `fk_CursoEstudiante_Cursos1_idx` (`Cursos_id` ASC) VISIBLE,
  INDEX `fk_CursoEstudiante_Estudiantes1_idx` (`Estudiantes_id` ASC) VISIBLE,
  CONSTRAINT `fk_CursoEstudiante_Cursos1`
    FOREIGN KEY (`Cursos_id`)
    REFERENCES `Secundaria_db`.`Cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CursoEstudiante_Estudiantes1`
    FOREIGN KEY (`Estudiantes_id`)
    REFERENCES `Secundaria_db`.`Estudiantes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Secundaria_db`.`Anuncios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Secundaria_db`.`Anuncios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(450) NOT NULL,
  `Administradores_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Anuncios_Administradores1_idx` (`Administradores_id` ASC) VISIBLE,
  CONSTRAINT `fk_Anuncios_Administradores1`
    FOREIGN KEY (`Administradores_id`)
    REFERENCES `Secundaria_db`.`Administradores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Secundaria_db`.`Archivos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Secundaria_db`.`Archivos` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Secundaria_db`.`AnuncioArchivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Secundaria_db`.`AnuncioArchivo` (
  `Anuncios_id` INT NOT NULL,
  `Archivos_id` INT NOT NULL,
  INDEX `fk_AnuncioArchivo_Anuncios1_idx` (`Anuncios_id` ASC) VISIBLE,
  INDEX `fk_AnuncioArchivo_Archivos1_idx` (`Archivos_id` ASC) VISIBLE,
  CONSTRAINT `fk_AnuncioArchivo_Anuncios1`
    FOREIGN KEY (`Anuncios_id`)
    REFERENCES `Secundaria_db`.`Anuncios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AnuncioArchivo_Archivos1`
    FOREIGN KEY (`Archivos_id`)
    REFERENCES `Secundaria_db`.`Archivos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Secundaria_db`.`EstudianteTutor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Secundaria_db`.`EstudianteTutor` (
  `Estudiantes_id` INT NOT NULL,
  `Tutores_id` INT NOT NULL,
  INDEX `fk_EstudianteTutor_Estudiantes1_idx` (`Estudiantes_id` ASC) VISIBLE,
  INDEX `fk_EstudianteTutor_Tutores1_idx` (`Tutores_id` ASC) VISIBLE,
  CONSTRAINT `fk_EstudianteTutor_Estudiantes1`
    FOREIGN KEY (`Estudiantes_id`)
    REFERENCES `Secundaria_db`.`Estudiantes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EstudianteTutor_Tutores1`
    FOREIGN KEY (`Tutores_id`)
    REFERENCES `Secundaria_db`.`Tutores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

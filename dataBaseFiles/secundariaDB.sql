-- MySQL Workbench Synchronization
-- Generated: 2022-03-16 19:01
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: victo

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `secundaria_db`.`Estudiantes` 
DROP FOREIGN KEY `fk_Estudiantes_Grupos1`;

ALTER TABLE `secundaria_db`.`Cursos` 
DROP FOREIGN KEY `fk_Cursos_Maestros1`;

ALTER TABLE `secundaria_db`.`CursoEstudiante` 
DROP FOREIGN KEY `fk_CursoEstudiante_Cursos1`,
DROP FOREIGN KEY `fk_CursoEstudiante_Estudiantes1`;

ALTER TABLE `secundaria_db`.`Grupos` 
DROP FOREIGN KEY `fk_Grupos_Maestros1`;

ALTER TABLE `secundaria_db`.`Anuncios` 
DROP FOREIGN KEY `fk_Anuncios_Administradores1`;

ALTER TABLE `secundaria_db`.`EstudianteTutor` 
DROP FOREIGN KEY `fk_EstudianteTutor_Estudiantes1`,
DROP FOREIGN KEY `fk_EstudianteTutor_Tutores1`;

ALTER TABLE `secundaria_db`.`Maestros` 
CHANGE COLUMN `telefono` `telefono` INT(15) NULL DEFAULT NULL ;

ALTER TABLE `secundaria_db`.`Estudiantes` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `secundaria_db`.`Tutores` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `telefono` `telefono` INT(15) NOT NULL ;

ALTER TABLE `secundaria_db`.`Administradores` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `secundaria_db`.`Cursos` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `secundaria_db`.`CursoEstudiante` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `secundaria_db`.`Grupos` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `secundaria_db`.`Anuncios` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `secundaria_db`.`EstudianteTutor` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `secundaria_db`.`Estudiantes` 
ADD CONSTRAINT `fk_Estudiantes_Grupos1`
  FOREIGN KEY (`Grupos_id`)
  REFERENCES `secundaria_db`.`Grupos` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `secundaria_db`.`Cursos` 
ADD CONSTRAINT `fk_Cursos_Maestros1`
  FOREIGN KEY (`Maestros_id`)
  REFERENCES `secundaria_db`.`Maestros` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `secundaria_db`.`CursoEstudiante` 
ADD CONSTRAINT `fk_CursoEstudiante_Cursos1`
  FOREIGN KEY (`Cursos_id`)
  REFERENCES `secundaria_db`.`Cursos` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_CursoEstudiante_Estudiantes1`
  FOREIGN KEY (`Estudiantes_id`)
  REFERENCES `secundaria_db`.`Estudiantes` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `secundaria_db`.`Grupos` 
ADD CONSTRAINT `fk_Grupos_Maestros1`
  FOREIGN KEY (`Maestros_id`)
  REFERENCES `secundaria_db`.`Maestros` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `secundaria_db`.`Anuncios` 
ADD CONSTRAINT `fk_Anuncios_Administradores1`
  FOREIGN KEY (`Administradores_id`)
  REFERENCES `secundaria_db`.`Administradores` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `secundaria_db`.`EstudianteTutor` 
ADD CONSTRAINT `fk_EstudianteTutor_Estudiantes1`
  FOREIGN KEY (`Estudiantes_id`)
  REFERENCES `secundaria_db`.`Estudiantes` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_EstudianteTutor_Tutores1`
  FOREIGN KEY (`Tutores_id`)
  REFERENCES `secundaria_db`.`Tutores` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

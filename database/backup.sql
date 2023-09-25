/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - veterinaria
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`veterinaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `veterinaria`;

/*Table structure for table `animales` */

DROP TABLE IF EXISTS `animales`;

CREATE TABLE `animales` (
  `idAnimal` int(11) NOT NULL AUTO_INCREMENT,
  `nombreAnimal` varchar(30) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idAnimal`),
  UNIQUE KEY `uk_nombreanimal_ani` (`nombreAnimal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `animales` */

insert  into `animales`(`idAnimal`,`nombreAnimal`,`create_at`,`update_at`,`estado`) values 
(1,'Perro','2023-09-22 09:41:17',NULL,'1'),
(2,'Gato','2023-09-22 09:41:17',NULL,'1');

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(30) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `dni` char(8) NOT NULL,
  `claveAcceso` varchar(200) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `uk_dni_cli` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `clientes` */

insert  into `clientes`(`idCliente`,`apellidos`,`nombres`,`dni`,`claveAcceso`,`create_at`,`update_at`,`estado`) values 
(1,'Luque Ramos','Johan Alberto','71789712','$2y$10$Cnti6nMp5glSTbDRJy9bAOHWeYXI5uRSvEcKnKFMA8qU2D6jJFNCW','2023-09-22 09:41:19',NULL,'1'),
(2,'Quispe Acevedo','Piero','12345678','$2y$10$Cnti6nMp5glSTbDRJy9bAOHWeYXI5uRSvEcKnKFMA8qU2D6jJFNCW','2023-09-22 09:41:19',NULL,'1'),
(3,'Polo Andrade','Andy Smith','12345677','$2y$10$Cnti6nMp5glSTbDRJy9bAOHWeYXI5uRSvEcKnKFMA8qU2D6jJFNCW','2023-09-22 09:41:19',NULL,'1'),
(4,'Corzo Carbajal','Aldo Alfredo','12345666','$2y$10$Cnti6nMp5glSTbDRJy9bAOHWeYXI5uRSvEcKnKFMA8qU2D6jJFNCW','2023-09-22 09:41:19',NULL,'1'),
(5,'Lopez','Lopez','21790932','$2y$10$qSe.Xtel1ibj6qPJZgcd9.BbS/pCqhg7Hea8zBhmWodrHe4v3pvUm','2023-09-22 09:46:39',NULL,'1'),
(6,'fernando','luis','36963698','12345','2023-09-22 09:48:40',NULL,'1'),
(7,'Lopez','Juana','21790939','$2y$10$tNz5uXmBseQdGQTR1yRPLuR75GStKOAb8i4IXe.oIUigR.lTrx5NS','2023-09-22 09:49:07',NULL,'1');

/*Table structure for table `mascotas` */

DROP TABLE IF EXISTS `mascotas`;

CREATE TABLE `mascotas` (
  `idMascota` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `fotografia` varchar(100) DEFAULT NULL,
  `color` varchar(30) NOT NULL,
  `genero` char(1) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idRaza` int(11) NOT NULL,
  PRIMARY KEY (`idMascota`),
  KEY `fk_idcl_maz` (`idCliente`),
  KEY `fk_idrz_maz` (`idRaza`),
  CONSTRAINT `fk_idcl_maz` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  CONSTRAINT `fk_idrz_maz` FOREIGN KEY (`idRaza`) REFERENCES `razas` (`idRaza`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mascotas` */

insert  into `mascotas`(`idMascota`,`nombre`,`fotografia`,`color`,`genero`,`idCliente`,`idRaza`) values 
(1,'Carrizo','carrizo.jpg','Negro y Rubio','H',1,4),
(2,'Blanca','blanca.jpg','Blanco','H',1,6),
(3,'Conejo','conejo.jpg','Rubio','M',2,8),
(4,'sofi','sofi.jpg','Rubio','H',2,3),
(5,'Garfield','carfield.jpg','Rubio','M',2,12);

/*Table structure for table `razas` */

DROP TABLE IF EXISTS `razas`;

CREATE TABLE `razas` (
  `idRaza` int(11) NOT NULL AUTO_INCREMENT,
  `nombreRaza` varchar(50) NOT NULL,
  `idAnimal` int(11) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idRaza`),
  UNIQUE KEY `fk_nombreRaza_raz` (`nombreRaza`),
  KEY `fk_id_raz` (`idAnimal`),
  CONSTRAINT `fk_id_raz` FOREIGN KEY (`idAnimal`) REFERENCES `animales` (`idAnimal`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `razas` */

insert  into `razas`(`idRaza`,`nombreRaza`,`idAnimal`,`create_at`,`update_at`,`estado`) values 
(1,'Schnauser',1,'2023-09-22 09:41:17',NULL,'1'),
(2,'Dalmata',1,'2023-09-22 09:41:17',NULL,'1'),
(3,'American Bully',1,'2023-09-22 09:41:17',NULL,'1'),
(4,'Pastor aleman',1,'2023-09-22 09:41:17',NULL,'1'),
(5,'Pit bull',1,'2023-09-22 09:41:17',NULL,'1'),
(6,'Mestizo',1,'2023-09-22 09:41:17',NULL,'1'),
(7,'Chinchilla',2,'2023-09-22 09:41:17',NULL,'1'),
(8,'Devon Rex',2,'2023-09-22 09:41:17',NULL,'1'),
(9,'Korat',2,'2023-09-22 09:41:17',NULL,'1'),
(10,'Oriental de pelo largo',2,'2023-09-22 09:41:17',NULL,'1'),
(11,'Ragdoll',2,'2023-09-22 09:41:17',NULL,'1'),
(12,'Ocigato',2,'2023-09-22 09:41:17',NULL,'1');

/* Procedure structure for procedure `spu_buscar_clientes` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_buscar_clientes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_buscar_clientes`(
IN _dni CHAR(8)
)
BEGIN 
	SELECT Mascotas.nombre, Mascotas.color, Mascotas.genero, razas.nombreRaza, animales.nombreAnimal
	FROM Mascotas
	INNER JOIN Clientes ON Mascotas.idCliente = Clientes.idCliente
	INNER JOIN Razas ON Mascotas.idRaza = Razas.idRaza
	INNER JOIN Animales ON Razas.idAnimal = Animales.idAnimal
	WHERE clientes.dni = _dni;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_login_clientes` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_login_clientes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_login_clientes`(
IN _dni CHAR(8)
)
BEGIN
	SELECT *
	FROM clientes
	WHERE dni = _dni;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_clientes` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_clientes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_clientes`(
IN _apellidos		VARCHAR(30),
IN _nombres			VARCHAR(30),
IN _dni				CHAR(8),
IN _claveAcceso	VARCHAR(200)
)
BEGIN
	INSERT INTO Clientes(apellidos, nombres, dni, claveAcceso) VALUES
	(_apellidos, _nombres, _dni, _claveAcceso);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_mascotas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_mascotas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_mascotas`(
IN _nombre 		VARCHAR(30),
IN _fotografia VARCHAR(200),
IN _color		VARCHAR(30),
IN _genero		CHAR(1),
IN _idCliente 	INT,
IN _idRaza		INT 
)
BEGIN
	IF _fotografia = '' THEN SET _fotografia = NULL; END IF;
	
	INSERT INTO Mascotas(nombre, fotografia, color, genero, idCliente, idRaza) VALUES
	(_nombre, _fotografia, _color, _genero, _idCliente, _idRaza);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_search_mascotas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_search_mascotas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_search_mascotas`(
IN _idMascota	INT 
)
BEGIN
	SELECT clientes. Animales.nombreAnimal, razas.nombreRaza, Mascotas.fotografia, Mascotas.nombre, Mascotas.color, Mascotas.genero 
	FROM Mascotas
	INNER JOIN Clientes ON Mascotas.idCliente = Clientes.idCliente
	INNER JOIN Razas ON Mascotas.idRaza = Razas.idRaza
	INNER JOIN Animales ON Razas.idAnimal = Animales.idAnimal
	WHERE Mascotas.idMascota =  _idMascota;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

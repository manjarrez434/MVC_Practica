/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.6.20 : Database - usuario
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`usuario` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `usuario`;

/*Table structure for table `alumno_grupo` */

DROP TABLE IF EXISTS `alumno_grupo`;

CREATE TABLE `alumno_grupo` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `id_alumno` int(6) DEFAULT NULL,
  `id_grupo` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `alumno_grupo` */

LOCK TABLES `alumno_grupo` WRITE;

UNLOCK TABLES;

/*Table structure for table `grupo` */

DROP TABLE IF EXISTS `grupo`;

CREATE TABLE `grupo` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `grupo` */

LOCK TABLES `grupo` WRITE;

insert  into `grupo`(`id`,`nombre`) values (1,'TIC 71'),(2,'TIC 72'),(3,'TIC 73');

UNLOCK TABLES;

/*Table structure for table `maestro_materia` */

DROP TABLE IF EXISTS `maestro_materia`;

CREATE TABLE `maestro_materia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_maestro` int(11) DEFAULT NULL,
  `id_materia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `maestro_materia` */

LOCK TABLES `maestro_materia` WRITE;

insert  into `maestro_materia`(`id`,`id_maestro`,`id_materia`) values (1,4,2),(6,2,0),(11,2,2);

UNLOCK TABLES;

/*Table structure for table `materia` */

DROP TABLE IF EXISTS `materia`;

CREATE TABLE `materia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `avatar` varchar(60) DEFAULT NULL,
  `orden` varchar(60) DEFAULT NULL,
  `estatus` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `materia` */

LOCK TABLES `materia` WRITE;

insert  into `materia`(`id`,`nombre`,`avatar`,`orden`,`estatus`) values (1,'Ciencias',NULL,'0','1'),(2,'Matematicas',NULL,'0','1'),(3,'Historia',NULL,NULL,'1'),(4,'Civismo',NULL,NULL,'1'),(5,'Geografia',NULL,NULL,'1');

UNLOCK TABLES;

/*Table structure for table `pregunta` */

DROP TABLE IF EXISTS `pregunta`;

CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text,
  `answer` varchar(10) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `pregunta` */

LOCK TABLES `pregunta` WRITE;

insert  into `pregunta`(`id`,`question`,`answer`,`status`) values (1,'¿PHP trabaja del lado del servidor?','si',1),(2,'¿HTML es un lenguaje de programación?','no',1),(3,'¿El autobus es el principal medio de transporte en el Edo de Mex?','si',1),(4,'¿Mexico es el mayor productor de maiz a nivel mundial?','si',1),(5,'¿Alemania es una potencia mundial?','si',1),(6,'¿La torre Ifel esta en Italia?','no',1),(7,'¿Brasil esta en el continente americano?','si',1),(8,'¿Los españoles fueron los primeros en invadir america?','si',1),(9,'¿El dia de la independencia de Mexico es el 15 de Septiembre?','si',1),(10,'¿Abraham Lilcon esta en los billetes de 1 dolar?','no',1),(11,'¿Las viboras son reptiles?','si',1),(12,'¿El rinoceronte esta extinto?','no',1),(13,'¿Los oviparos ponen huevos?','si',1),(14,'¿Las hojas son producidas de las rocas?','no',1),(15,'¿El proceso de fotosintesis lo realizan las tortugas?','no',1),(16,'¿Los podologos se encargan de las enfermedades del pie?','si',1),(17,'¿Los otorrinolaringologos se encargan de las enfermedades de la sangre?','no',1),(18,'¿En Mexico, el numero 911 es para llamar a la ambulancia?','no',1),(19,'¿La revolucion industrial fue en Inglaterra?','si',1),(20,'¿La nube es el principal destino para guardar informacion?','si',1);

UNLOCK TABLES;

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(500) DEFAULT NULL,
  `ApellidoPaterno` varchar(500) DEFAULT NULL,
  `ApellidoMaterno` varchar(500) DEFAULT NULL,
  `Telefono` varchar(500) DEFAULT NULL,
  `Calle` varchar(500) DEFAULT NULL,
  `NumeroExterior` int(100) DEFAULT NULL,
  `NumeroInterior` int(100) DEFAULT NULL,
  `Colonia` varchar(500) DEFAULT NULL,
  `Municipio` varchar(500) DEFAULT NULL,
  `Estado` varchar(500) DEFAULT NULL,
  `CP` int(100) DEFAULT NULL,
  `Correo` varchar(500) DEFAULT NULL,
  `Usuario` varchar(500) DEFAULT NULL,
  `Pass` varchar(500) DEFAULT NULL,
  `Nivel` varchar(500) DEFAULT NULL,
  `Estatus` varchar(500) DEFAULT NULL,
  `Aciertos` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

LOCK TABLES `usuario` WRITE;

insert  into `usuario`(`Id`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`Calle`,`NumeroExterior`,`NumeroInterior`,`Colonia`,`Municipio`,`Estado`,`CP`,`Correo`,`Usuario`,`Pass`,`Nivel`,`Estatus`,`Aciertos`) values (1,'Jonathan','Aguilar','Jimenez','123456','Morelos',12,12,'Morelos','Zina','Mexico',51370,'jonagio.12@gmail.com','admin','123456','1','1','8'),(2,'Jose','Morales','Medina','123456','jOLOBKJB',323,23,'Toluca','Toluca','Mexico',45678,'jonagio.12@gmail.com','maestro1','123456','2','1','2'),(3,'Miguel Angel','Manjarrez','Carbajal','1234566789','Fco I Madero',31,1,'San Lucas','Metepec','Mexico',12345,'manjarrez434@gmail.com','alumno1','123456','3','1','5');

UNLOCK TABLES;

/* Procedure structure for procedure `actualizarAciertos` */

/*!50003 DROP PROCEDURE IF EXISTS  `actualizarAciertos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarAciertos`(in _total varchar(2),in _usuarioid int)
begin
UPDATE usuario SET Aciertos = _total WHERE id = _usuarioid;
end */$$
DELIMITER ;

/* Procedure structure for procedure `validateLogin` */

/*!50003 DROP PROCEDURE IF EXISTS  `validateLogin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `validateLogin`(in _usuario varchar(50), in _password varchar(50))
begin
SELECT Id,Nivel,Estatus FROM usuario WHERE usuario = _usuario AND Pass= _password;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

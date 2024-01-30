/*
SQLyog Community v8.71 
MySQL - 5.5.30 : Database - vtjdm13_2022
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`vtjdm13_2022` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `vtjdm13_2022`;

/*Table structure for table `connects` */

DROP TABLE IF EXISTS `connects`;

CREATE TABLE `connects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `demail` varchar(255) DEFAULT NULL,
  `dname` varchar(255) DEFAULT NULL,
  `uemail` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `connects` */

/*Table structure for table `data` */

DROP TABLE IF EXISTS `data`;

CREATE TABLE `data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `shift` varchar(255) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `wm` varchar(50) DEFAULT NULL,
  `bw` varchar(50) DEFAULT NULL,
  `tm` varchar(50) DEFAULT NULL,
  `mat` varchar(50) DEFAULT NULL,
  `mo` varchar(50) DEFAULT NULL,
  `nepresso` varchar(50) DEFAULT NULL,
  `tv` varchar(50) DEFAULT NULL,
  `lap` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `data` */

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `spe` varchar(255) DEFAULT NULL,
  `exp` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`email`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `doctor` */

/*Table structure for table `msg` */

DROP TABLE IF EXISTS `msg`;

CREATE TABLE `msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_from` varchar(255) DEFAULT NULL,
  `msg_to` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `msg` */

/*Table structure for table `ureq` */

DROP TABLE IF EXISTS `ureq`;

CREATE TABLE `ureq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `did` varchar(255) DEFAULT NULL,
  `denaml` varchar(255) DEFAULT NULL,
  `dname` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `uemail` varchar(255) DEFAULT NULL,
  `umobile` varchar(255) DEFAULT NULL,
  `uage` varchar(255) DEFAULT NULL,
  `ugrnder` varchar(255) DEFAULT NULL,
  `udes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ureq` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

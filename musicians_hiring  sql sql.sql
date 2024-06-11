/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - musicians_hiring
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`musicians_hiring` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `musicians_hiring`;

/*Table structure for table `job_application` */

DROP TABLE IF EXISTS `job_application`;

CREATE TABLE `job_application` (
  `application_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` varchar(100) DEFAULT NULL,
  `msc_id` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`application_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `job_application` */

insert  into `job_application`(`application_id`,`job_id`,`msc_id`,`description`,`status`) values 
(1,'1',1,'zsdfghjk','Accept'),
(2,'sdjhfjsjfjhdskjgfhdskjghdskjghs',1,'1','pending');

/*Table structure for table `tbl_application_child` */

DROP TABLE IF EXISTS `tbl_application_child`;

CREATE TABLE `tbl_application_child` (
  `app_cid` int(5) NOT NULL AUTO_INCREMENT,
  `app_mid` int(5) NOT NULL,
  `app_desc` varchar(350) NOT NULL,
  `app_status` varchar(10) NOT NULL,
  `exp_id` int(5) NOT NULL,
  PRIMARY KEY (`app_cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_application_child` */

/*Table structure for table `tbl_application_master` */

DROP TABLE IF EXISTS `tbl_application_master`;

CREATE TABLE `tbl_application_master` (
  `app_mid` int(5) NOT NULL AUTO_INCREMENT,
  `msc_id` int(5) NOT NULL,
  PRIMARY KEY (`app_mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_application_master` */

/*Table structure for table `tbl_employer` */

DROP TABLE IF EXISTS `tbl_employer`;

CREATE TABLE `tbl_employer` (
  `emp_id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `emp_name` varchar(20) NOT NULL,
  `emp_email` varchar(35) NOT NULL,
  `emp_no` decimal(10,0) NOT NULL,
  `emp_aadhar` decimal(12,0) NOT NULL,
  `emp_password` varchar(10) NOT NULL,
  `emp_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_employer` */

insert  into `tbl_employer`(`emp_id`,`username`,`emp_name`,`emp_email`,`emp_no`,`emp_aadhar`,`emp_password`,`emp_status`) values 
(1,'1','zebah','zebah@gmail.com',907414916,654782196378,'zebah123',1),
(2,NULL,'Sneha Ravi','sneha@gmail.com',863145796,654782196123,'sneharav12',1),
(3,NULL,'Sara Roy','sara@gmail.com',9874236514,654782196569,'sara123',1),
(4,NULL,'Mariya Joseph','mariya@gmail.com',7994169860,657456982355,'mariya123',1),
(5,'user','Hiba','hiba@gmail.com',9845632489,654782196566,'hiba123',1);

/*Table structure for table `tbl_experience` */

DROP TABLE IF EXISTS `tbl_experience`;

CREATE TABLE `tbl_experience` (
  `exp_id` int(5) NOT NULL AUTO_INCREMENT,
  `exp_title` varchar(20) NOT NULL,
  `exp_desc` varchar(200) NOT NULL,
  `exp_date` varchar(100) NOT NULL,
  `application_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`exp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_experience` */

insert  into `tbl_experience`(`exp_id`,`exp_title`,`exp_desc`,`exp_date`,`application_id`) values 
(1,'dsfghj','sdfghj','1',20230221),
(2,'sdfghjk','sdfghj','1',20230221),
(3,'sdfghj','sdfghn','2023-02-21',1),
(4,'asdfgh','sdfghn','2023-02-21',1);

/*Table structure for table `tbl_genre` */

DROP TABLE IF EXISTS `tbl_genre`;

CREATE TABLE `tbl_genre` (
  `genre_id` int(5) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(20) NOT NULL,
  `genre_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_genre` */

insert  into `tbl_genre`(`genre_id`,`genre_name`,`genre_status`) values 
(1,'Rock',0),
(2,'RnB',1),
(3,'Hip-Hop',1),
(4,'Soul',1),
(5,'Jazz',1),
(6,'RnB',1);

/*Table structure for table `tbl_job` */

DROP TABLE IF EXISTS `tbl_job`;

CREATE TABLE `tbl_job` (
  `job_id` int(5) NOT NULL AUTO_INCREMENT,
  `emp_id` int(5) NOT NULL,
  `job_title` varchar(25) NOT NULL,
  `job_desc` varchar(100) NOT NULL,
  `type_id` int(5) NOT NULL,
  `genre_id` int(5) NOT NULL,
  `job_rate` int(3) NOT NULL,
  `job_duration` int(3) NOT NULL,
  `job_location` varchar(35) NOT NULL,
  `job_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_job` */

insert  into `tbl_job`(`job_id`,`emp_id`,`job_title`,`job_desc`,`type_id`,`genre_id`,`job_rate`,`job_duration`,`job_location`,`job_status`) values 
(1,5,'aertyuo1','ghjkl1',5,3,4001,11,'ernakulam',1);

/*Table structure for table `tbl_login` */

DROP TABLE IF EXISTS `tbl_login`;

CREATE TABLE `tbl_login` (
  `username` varchar(35) NOT NULL,
  `password` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_login` */

insert  into `tbl_login`(`username`,`password`,`type`,`status`) values 
('admin','admin','admin',1),
('john@gmail.com','john123','musician',1),
('mariya@gmail.com','mariya123','employer',1),
('mu','mu','musician',1),
('sam@gmail.com','sam123','musician',1),
('sara@gmail.com','sara123','employer',1),
('sneha@gmail.com','sneharav12','employer',1),
('user','user','employer',1),
('zebah@gmail.com','zebah123','Employer',1);

/*Table structure for table `tbl_musician` */

DROP TABLE IF EXISTS `tbl_musician`;

CREATE TABLE `tbl_musician` (
  `msc_id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `msc_name` varchar(20) NOT NULL,
  `msc_email` varchar(35) NOT NULL,
  `msc_no` decimal(10,0) NOT NULL,
  `msc_aadhar` decimal(12,0) NOT NULL,
  `msc_password` varchar(10) NOT NULL,
  `msc_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`msc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_musician` */

insert  into `tbl_musician`(`msc_id`,`username`,`msc_name`,`msc_email`,`msc_no`,`msc_aadhar`,`msc_password`,`msc_status`) values 
(1,'mu','ria','ria@gmail.com',9631487569,654782196399,'ria123',1),
(2,NULL,'Sam','sam@gmail.com',9864412134,654782196366,'sam123',1),
(3,NULL,'john','john@gmail.com',9654752136,654782196378,'john123',1);

/*Table structure for table `tbl_type` */

DROP TABLE IF EXISTS `tbl_type`;

CREATE TABLE `tbl_type` (
  `type_id` int(5) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) NOT NULL,
  `type_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_type` */

insert  into `tbl_type`(`type_id`,`type_name`,`type_status`) values 
(1,'Pianist',1),
(2,'Vocalist',0),
(3,'Violinist',1),
(4,'Guitarist',1),
(5,'Drummer',1),
(6,'Bassist',1),
(7,'qwertyuio',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*
SQLyog Community Edition- MySQL GUI v5.2 Beta 10
Host - 5.0.45-community-nt-log : Database - linux_forum
*********************************************************************
Server version : 5.0.45-community-nt-log
*/
 
 
SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `linux_forum`;

USE `linux_forum`;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

/*Table structure for table `ds_developers` */

DROP TABLE IF EXISTS `ds_developers`;

CREATE TABLE `ds_developers` (
  `id_developer` int(11) NOT NULL auto_increment,
  `developer_name` varchar(50) NOT NULL,
  `description` mediumtext,
  PRIMARY KEY  (`id_developer`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=76 ROW_FORMAT=DYNAMIC;

/*Data for the table `ds_developers` */

insert  into `ds_developers`(`id_developer`,`developer_name`,`description`) values (1,'Canonical Ltd./ Ubuntu Foundation','Canonical - ÷àñòíàÿ êîìïàíèÿ');

/*Table structure for table `ds_disk_types` */

DROP TABLE IF EXISTS `ds_disk_types`;

CREATE TABLE `ds_disk_types` (
  `id_type` int(11) NOT NULL auto_increment,
  `type_name` varchar(10) NOT NULL,
  PRIMARY KEY  (`id_type`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=20 ROW_FORMAT=DYNAMIC;

/*Data for the table `ds_disk_types` */

insert  into `ds_disk_types`(`id_type`,`type_name`) values (1,'CD'),(2,'DVD-5'),(3,'DVD-9');

/*Table structure for table `ds_distrib_versions` */

DROP TABLE IF EXISTS `ds_distrib_versions`;

CREATE TABLE `ds_distrib_versions` (
  `id_version` int(11) NOT NULL auto_increment,
  `version_name` varchar(5) NOT NULL,
  `description` mediumtext,
  `id_platform` int(11) NOT NULL,
  `id_distrib` int(11) NOT NULL,
  `id_type` int(11) NOT NULL,
  `codename` varchar(50) default NULL,
  `release_date` date default NULL,
  PRIMARY KEY  (`id_version`),
  KEY `FK_ds_distrib_versions` (`id_type`),
  KEY `FK_ds_distrib_versions2` (`id_platform`),
  KEY `FK_ds_distrib_versions3` (`id_distrib`),
  CONSTRAINT `FK_ds_distrib_versions` FOREIGN KEY (`id_distrib`) REFERENCES `ds_distribs` (`id_distrib`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ds_distrib_versions1` FOREIGN KEY (`id_type`) REFERENCES `ds_disk_types` (`id_type`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ds_distrib_versions2` FOREIGN KEY (`id_platform`) REFERENCES `ds_platforms` (`id_platform`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=28 ROW_FORMAT=DYNAMIC;

/*Data for the table `ds_distrib_versions` */

insert  into `ds_distrib_versions`(`id_version`,`version_name`,`description`,`id_platform`,`id_distrib`,`id_type`,`codename`,`release_date`) values (1,'9.04',NULL,1,1,1,NULL,NULL);

/*Table structure for table `ds_distribs` */

DROP TABLE IF EXISTS `ds_distribs`;

CREATE TABLE `ds_distribs` (
  `id_distrib` int(11) NOT NULL auto_increment,
  `distrib_name` varchar(25) NOT NULL,
  `id_developer` int(11) NOT NULL,
  `description` mediumtext,
  PRIMARY KEY  (`id_distrib`),
  UNIQUE KEY `distrib_name` (`distrib_name`),
  KEY `FK_ds_distribs` (`id_developer`),
  CONSTRAINT `FK_ds_distribs` FOREIGN KEY (`id_developer`) REFERENCES `ds_developers` (`id_developer`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=40 ROW_FORMAT=DYNAMIC;

/*Data for the table `ds_distribs` */

insert  into `ds_distribs`(`id_distrib`,`distrib_name`,`id_developer`,`description`) values (1,'Ubutnu',1,'Äèñòðèáóòèâ Linux');

/*Table structure for table `ds_member_distribs` */

DROP TABLE IF EXISTS `ds_member_distribs`;

CREATE TABLE `ds_member_distribs` (
  `id_member_distrib` int(11) NOT NULL auto_increment,
  `id_member` int(11) NOT NULL,
  `id_version` int(11) NOT NULL,
  `comment` mediumtext,
  PRIMARY KEY  (`id_member_distrib`),
  KEY `FK_ds_member_distribs` (`id_version`),
  CONSTRAINT `FK_ds_member_distribs` FOREIGN KEY (`id_version`) REFERENCES `ds_distrib_versions` (`id_version`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='InnoDB free: 3072 kB';

/*Data for the table `ds_member_distribs` */

/*Table structure for table `ds_platforms` */

DROP TABLE IF EXISTS `ds_platforms`;

CREATE TABLE `ds_platforms` (
  `id_platform` int(11) NOT NULL auto_increment,
  `platform_name` varchar(10) NOT NULL,
  PRIMARY KEY  (`id_platform`),
  UNIQUE KEY `platform_name` (`platform_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=20 ROW_FORMAT=DYNAMIC;

/*Data for the table `ds_platforms` */

insert  into `ds_platforms`(`id_platform`,`platform_name`) values (1,'x86'),(2,'x64');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
      
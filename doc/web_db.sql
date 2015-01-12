/*
SQLyog v10.2 
MySQL - 5.0.90-community-nt : Database - web_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`web_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `web_db`;

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `text` varchar(500) default NULL,
  `topic_id` int(11) default NULL,
  `user_info_id` int(11) default NULL,
  `ip` varchar(32) default NULL,
  `state` varchar(32) default NULL COMMENT '0匿名 1正常',
  PRIMARY KEY  (`id`),
  KEY `fk_comment_topic_topic_id` (`topic_id`),
  KEY `fk_comment_topic_user_info_id` (`user_info_id`),
  CONSTRAINT `fk_comment_topic_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`),
  CONSTRAINT `fk_comment_topic_user_info_id` FOREIGN KEY (`user_info_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(200) default NULL,
  `remark` varchar(500) default NULL,
  `address` varchar(200) default NULL,
  `phone` varchar(32) default NULL,
  `email` varchar(32) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `topic` */

DROP TABLE IF EXISTS `topic`;

CREATE TABLE `topic` (
  `id` int(11) NOT NULL auto_increment,
  `content` text,
  `create_date` datetime default NULL,
  `catalog` varchar(32) default NULL,
  `type` varchar(32) default NULL,
  `user_info_id` int(11) default NULL,
  `title` varchar(200) NOT NULL,
  `visit_count` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_topic_user_info_id` (`user_info_id`),
  CONSTRAINT `fk_topic_user_info_id` FOREIGN KEY (`user_info_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23146 DEFAULT CHARSET=utf8;

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `id` int(11) NOT NULL auto_increment,
  `user_name` varchar(50) default NULL,
  `password` varchar(32) default NULL,
  `register_date` datetime default NULL,
  `open_id` varchar(32) default NULL,
  `token` varchar(32) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

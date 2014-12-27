/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 50090
Source Host           : localhost:3306
Source Database       : web_db

Target Server Type    : MYSQL
Target Server Version : 50090
File Encoding         : 65001

Date: 2014-12-28 01:37:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', null, 'wwwwa', '2', '1', null, null);
INSERT INTO `comment` VALUES ('2', null, 'hhhhhhhhhhh', '2', '1', null, null);
INSERT INTO `comment` VALUES ('3', null, 'cccccc', '2', '1', null, null);
INSERT INTO `comment` VALUES ('4', '2014-12-22 16:19:44', '啊啊啊啊', '2', '1', null, null);
INSERT INTO `comment` VALUES ('5', '2014-12-22 16:20:49', '买买买', '2', '1', 'localhost', '1');
INSERT INTO `comment` VALUES ('6', '2014-12-26 15:00:55', '呃呃呃呃呃呃呃呃呃', '3', '1', 'localhost', '1');
INSERT INTO `comment` VALUES ('7', '2014-12-26 16:38:25', '柔柔弱弱', '4', '1', 'localhost', '1');
INSERT INTO `comment` VALUES ('8', '2014-12-26 16:41:55', '特瑞特人', '4', '1', 'localhost', '1');
INSERT INTO `comment` VALUES ('9', '2014-12-26 16:42:04', '二二额我惹荣荣荣荣荣荣荣荣荣荣荣荣荣荣日方法烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦凤飞飞', '4', '1', 'localhost', '1');
INSERT INTO `comment` VALUES ('10', '2014-12-26 18:02:01', '噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩', '9', '1', 'localhost', '1');
INSERT INTO `comment` VALUES ('11', '2014-12-26 18:02:13', '噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '9', '1', 'localhost', '1');
INSERT INTO `comment` VALUES ('12', '2014-12-26 18:02:19', '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '9', '1', 'localhost', '1');
INSERT INTO `comment` VALUES ('13', '2014-12-26 18:03:34', '啊啊啊啊啊啊啊啊啊\n啊啊啊啊啊啊啊啊啊\n啊啊啊啊啊啊啊啊啊\n啊啊啊啊啊啊啊啊啊\n啊啊啊啊啊啊啊啊啊', '9', '1', 'localhost', '1');
INSERT INTO `comment` VALUES ('14', '2014-12-26 18:55:52', '日日日日日日日', '3', '1', 'localhost', '1');
INSERT INTO `comment` VALUES ('15', '2014-12-26 18:56:04', '特瑞特人如果法国荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣特瑞特人如果法国荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣特瑞特人如果法国荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣特瑞特人如果法国荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣特瑞特人如果法国荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣特瑞特人如果法国荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣特瑞特人如果法国荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣特瑞特人如果法国荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣', '3', '1', 'localhost', '1');
INSERT INTO `comment` VALUES ('16', '2014-12-26 18:56:39', '不白斑病白斑病白斑病不，，，，，不白斑病白斑病白斑病不荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣特瑞特人如果法国荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣特瑞特人如果法国荣荣荣荣荣荣荣荣荣\nlower 2014-12-26 15:00:55\n呃呃呃呃呃呃呃呃呃,\n\nlower 2014-12-26 18:55:52\n日日日日日日日,\nlower 2014-12-26 15:00:55\n呃呃呃呃呃呃呃呃呃,\n\nlower 2014-12-26 18:55:52\n日日日日日日日,荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣特瑞特人如果法国荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣荣，，，，，', '3', '1', 'localhost', '1');
INSERT INTO `comment` VALUES ('17', '2014-12-26 19:12:35', '耶耶耶耶耶耶', '4', '1', 'localhost', '1');

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
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

-- ----------------------------
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL auto_increment,
  `content` text,
  `create_date` datetime default NULL,
  `catalog` varchar(32) default NULL,
  `type` varchar(32) default NULL,
  `user_info_id` int(11) default NULL,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_topic_user_info_id` (`user_info_id`),
  CONSTRAINT `fk_topic_user_info_id` FOREIGN KEY (`user_info_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', '地方帆帆帆帆帆帆', '2014-12-21 10:47:31', '吐槽', '', '1', 'ttttt');
INSERT INTO `topic` VALUES ('2', 'ddddd', '2014-12-22 15:26:22', '吐槽', '', '1', 'dddd');
INSERT INTO `topic` VALUES ('3', '日日日日日日日日日日日日日日日\n哈哈哈哈\n回复\nt66666666', '2014-12-26 14:47:19', '吐槽', '', '1', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `topic` VALUES ('4', '鬼鬼鬼鬼鬼鬼鬼鬼鬼鬼的广泛的灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌鬼鬼鬼鬼鬼\n鬼鬼鬼鬼鬼的广泛的灌灌灌灌灌灌\n灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌\n灌灌灌灌灌灌\n灌灌灌灌灌灌灌', '2014-12-26 16:28:58', '吐槽', '', '1', '灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌');
INSERT INTO `topic` VALUES ('5', '她她她她她她她她她她她她她她她她她她她她她', '2014-12-26 16:29:16', '吐槽', '', '1', '涛涛涛涛涛涛');
INSERT INTO `topic` VALUES ('6', '踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩', '2014-12-26 17:58:48', '吐槽', '', '1', '踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩');
INSERT INTO `topic` VALUES ('7', '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2014-12-26 17:59:03', '吐槽', '', '1', '饿的丰富的顶顶顶顶顶顶顶顶顶');
INSERT INTO `topic` VALUES ('8', '跟鬼鬼鬼鬼鬼鬼鬼鬼鬼鬼鬼鬼', '2014-12-26 17:59:59', '吐槽', '', '1', '涛涛涛涛涛涛涛涛涛涛涛涛涛涛涛涛涛涛');
INSERT INTO `topic` VALUES ('9', '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2014-12-26 18:00:23', '吐槽', '', '1', '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶');
INSERT INTO `topic` VALUES ('10', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '2014-12-26 18:19:30', '吐槽', '', '1', '哈哈哈哈哈哈哈哈哈哈');

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
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

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'lower', 'ddd', '2014-12-19 23:57:22', null, null);

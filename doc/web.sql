CREATE TABLE `comment` (
`id` int(11) NOT NULL,
`create_date` datetime NULL DEFAULT NULL,
`text` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`topic_id` int(11) NULL DEFAULT NULL,
`user_info_id` int(11) NULL DEFAULT NULL,
`ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0匿名 1正常',
PRIMARY KEY (`id`) ,
INDEX `fk_comment_topic_topic_id` (`topic_id`),
INDEX `fk_comment_topic_user_info_id` (`user_info_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='InnoDB free: 4096 kB; (`user_info_id`) REFER `web_db/user_info`(`id`); (`topic_i';

CREATE TABLE `company` (
`id` int(11) NOT NULL,
`name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `topic` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
`create_date` datetime NULL DEFAULT NULL,
`catalog` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`user_info_id` int(11) NULL DEFAULT NULL,
`title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
PRIMARY KEY (`id`) ,
INDEX `fk_topic_user_info_id` (`user_info_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2
COMMENT='InnoDB free: 4096 kB; (`user_info_id`) REFER `web_db/user_info`(`id`) ON UPDATE ';

CREATE TABLE `user_info` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`register_date` datetime NULL DEFAULT NULL,
`open_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2;


ALTER TABLE `comment` ADD CONSTRAINT `fk_comment_topic_user_info_id` FOREIGN KEY (`user_info_id`) REFERENCES `user_info` (`id`);
ALTER TABLE `comment` ADD CONSTRAINT `fk_comment_topic_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`);
ALTER TABLE `topic` ADD CONSTRAINT `fk_topic_user_info_id` FOREIGN KEY (`user_info_id`) REFERENCES `user_info` (`id`);


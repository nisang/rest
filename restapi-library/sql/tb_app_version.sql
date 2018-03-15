/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.22-chesource-1
Source Server Version : 50710
Source Host           : 192.168.1.22:3306
Source Database       : kuaiche

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2017-06-07 14:40:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_app_version`
-- ----------------------------
DROP TABLE IF EXISTS `tb_app_version`;
CREATE TABLE `tb_app_version` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(255) DEFAULT NULL,
  `version_code` varchar(50) DEFAULT NULL,
  `type_` tinyint(255) DEFAULT NULL COMMENT '客户端类型 0：android 1:ios',
  `force_update` tinyint(4) DEFAULT NULL COMMENT '0：不强制更新 1：强制更新',
  `content` varchar(255) DEFAULT NULL COMMENT '更新内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='app版本';

-- ----------------------------
-- Records of tb_app_version
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.22-chesource-1
Source Server Version : 50710
Source Host           : 192.168.1.22:3306
Source Database       : kuaiche

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2017-06-07 14:40:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_auth_validate`
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_validate`;
CREATE TABLE `t_auth_validate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '有效性ID',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '验证码类型 0：短信 1：邮箱',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '发送内容',
  `destination` varchar(50) NOT NULL DEFAULT '' COMMENT '手机号或者 邮箱',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户',
  `source` varchar(10) DEFAULT '' COMMENT '操作来源 0：PC端，1：M站，2：ios，3：android'',',
  `addtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=utf8 COMMENT='短信验证';

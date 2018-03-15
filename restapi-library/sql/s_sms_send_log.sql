/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.22-chesource-1
Source Server Version : 50710
Source Host           : 192.168.1.22:3306
Source Database       : kuaiche

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2017-06-07 14:40:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `s_sms_send_log`
-- ----------------------------
DROP TABLE IF EXISTS `s_sms_send_log`;
CREATE TABLE `s_sms_send_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '短信id',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号码',
  `smsContent` varchar(500) DEFAULT '' COMMENT '短信内容',
  `addTime` datetime DEFAULT NULL,
  `source` int(2) DEFAULT NULL COMMENT '来源：0:PC端，1：M站，2：ios，3：android',
  `isSuccess` varchar(10) DEFAULT '' COMMENT '是否成功：success、fail',
  `remark` varchar(50) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3629 DEFAULT CHARSET=utf8 COMMENT='下发短信日志表';

-- ----------------------------
-- Records of s_sms_send_log
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.22-chesource-1
Source Server Version : 50710
Source Host           : 192.168.1.22:3306
Source Database       : kuaiche

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2017-06-07 14:41:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` bigint(20) unsigned NOT NULL COMMENT '主键',
  `mobile` varchar(40) DEFAULT '' COMMENT '手机号码',
  `account` varchar(50) DEFAULT NULL COMMENT '登录账号',
  `password` varchar(256) DEFAULT '' COMMENT '密码',
  `user_name` varchar(56) DEFAULT '' COMMENT '用户名称',
  `avatar` varchar(256) DEFAULT '' COMMENT '头像',
  `introduce` varchar(256) DEFAULT '' COMMENT '介绍，签名',
  `sex` tinyint(4) DEFAULT '2' COMMENT '0：女 1：男 2：未知',
  `open_id` varchar(100) DEFAULT NULL COMMENT '微信id',
  `open_id_mp` varchar(255) DEFAULT '' COMMENT '公众平台open_id',
  `union_id` varchar(255) DEFAULT NULL COMMENT '微信公众号unionid',
  `province` varchar(30) DEFAULT '' COMMENT '省/直辖市',
  `province_id` int(11) DEFAULT '0' COMMENT '省/直辖市id',
  `city` varchar(30) DEFAULT '' COMMENT '城市/区',
  `city_id` int(11) DEFAULT NULL COMMENT '城市代码',
  `user_status` tinyint(4) DEFAULT '0' COMMENT '用户状态：0正常 1:非正常无法登陆平台',
  `inviter_id` bigint(11) DEFAULT NULL COMMENT '邀请人id',
  `invite_code` varchar(30) DEFAULT '' COMMENT '邀请码',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `hx_username` varchar(255) DEFAULT '' COMMENT '环信用户名',
  `hx_passwd` varchar(255) DEFAULT '' COMMENT '环信密码',
  `source` tinyint(4) DEFAULT '0' COMMENT '注册来源 0:手机端 1:web微信端 2:微信公众号',
  `companyId` int(11) DEFAULT '0' COMMENT '公司Id',
  `mianuser` int(11) DEFAULT '0' COMMENT '0:子账号或者个人账号  1：公司主账户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

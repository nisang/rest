/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.22-chesource-1
Source Server Version : 50710
Source Host           : 192.168.1.22:3306
Source Database       : kuaiche

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2017-06-07 14:40:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `s_area_city`
-- ----------------------------
DROP TABLE IF EXISTS `s_area_city`;
CREATE TABLE `s_area_city` (
  `cityId` int(11) NOT NULL COMMENT '城市ID',
  `code` varchar(50) DEFAULT NULL COMMENT '高德城市code',
  `city` varchar(20) NOT NULL COMMENT '城市名称',
  `fid` int(11) NOT NULL COMMENT '省外键ID',
  `apiCityId` int(11) NOT NULL COMMENT '开户支行外键id,对应p2p_open_account_bank表中的apiCityId',
  `shortName` varchar(20) NOT NULL COMMENT '城市名简称',
  `offencesRulesId` int(11) DEFAULT NULL,
  `isopen` int(1) DEFAULT '1' COMMENT '是否提供服务，1,提供，0不提供',
  `FIRST_NUM` varchar(2) DEFAULT NULL,
  `city_spell` varchar(10) DEFAULT NULL,
  `che300_cityId` int(11) DEFAULT NULL COMMENT 'che300城市Id',
  `che300_city` varchar(20) DEFAULT '' COMMENT 'che300城市名称',
  `initial` varchar(20) DEFAULT '' COMMENT '简拼',
  `lng` varchar(255) DEFAULT '0.000' COMMENT '经度',
  `lat` varchar(255) DEFAULT '0.000' COMMENT '纬度',
  `hot` tinyint(4) DEFAULT '0' COMMENT '0:非热门 1：热门',
  PRIMARY KEY (`cityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市表';

-- ----------------------------
-- Records of s_area_city
-- ----------------------------
INSERT INTO `s_area_city` VALUES ('0', null, '全国', '0', '0', '全国', '0', '1', 'T', 'all', '0', '全国', 'T', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('110100', null, '北京市', '110000', '192', '北京', '60', '1', 'B', 'bj', '1', '北京', 'B', '0.00', '0.00', '1');
INSERT INTO `s_area_city` VALUES ('120100', null, '天津市', '120000', '412', '天津', '340', '1', 'T', 'tj', '2', '天津', 'T', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('130100', null, '石家庄市', '130000', '78', '石家庄', null, '1', 'S', 'sjz', '5', '石家庄', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('130200', null, '唐山市', '130000', '71', '唐山', null, '1', 'T', 'tangshan', '35', '唐山', 'T', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('130300', null, '秦皇岛市', '130000', '68', '秦皇岛', null, '1', 'Q', null, '63', '秦皇岛', 'Q', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('130400', null, '邯郸市', '130000', '75', '邯郸', null, '1', 'H', null, '91', '邯郸', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('130500', null, '邢台市', '130000', '77', '邢台', null, '1', 'X', null, '119', '邢台', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('130600', null, '保定市', '130000', '70', '保定', null, '1', 'B', 'baoding', '147', '保定', 'B', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('130700', null, '张家口市', '130000', '69', '张家口', null, '1', 'Z', null, '174', '张家口', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('130800', null, '承德市', '130000', '76', '承德', null, '1', 'C', null, '201', '承德', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('130900', null, '沧州市', '130000', '73', '沧州', '122', '1', 'C', null, '227', '沧州', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('131000', null, '廊坊市', '130000', '72', '廊坊', null, '1', 'L', null, '252', '廊坊', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('131100', null, '衡水市', '130000', '74', '衡水', null, '1', 'H', null, '274', '衡水', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('140100', null, '太原市', '140000', '447', '太原', null, '1', 'T', 'ty', '6', '太原', 'T', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('140200', null, '大同市', '140000', '443', '大同', null, '1', 'D', null, '36', '大同', 'D', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('140300', null, '阳泉市', '140000', '440', '阳泉', null, '1', 'Y', null, '64', '阳泉', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('140400', null, '长治市', '140000', '442', '长治', null, '1', 'C', null, '92', '长治', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('140500', null, '晋城市', '140000', '444', '晋城', null, '1', 'J', null, '120', '晋城', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('140600', null, '朔州市', '140000', '437', '朔州', null, '1', 'S', null, '148', '朔州', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('140700', null, '晋中市', '140000', '441', '晋中', null, '1', 'J', null, '175', '晋中', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('140800', null, '运城市', '140000', '439', '运城', null, '1', 'Y', null, '202', '运城', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('140900', null, '忻州市', '140000', '438', '忻州', null, '1', 'X', null, '228', '忻州', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('141000', null, '临汾市', '140000', '445', '临汾', null, '1', 'L', null, '253', '临汾', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('141100', null, '吕梁市', '140000', '446', '吕梁', null, '1', 'L', null, '275', '吕梁', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('150100', null, '呼和浩特市', '150000', '199', '呼和浩特', null, '1', 'H', 'hhht', '32', '呼和浩特', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('150200', null, '包头市', '150000', '195', '包头', null, '1', 'B', 'baotou', '62', '包头', 'B', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('150300', null, '乌海市', '150000', '198', '乌海', null, '1', 'W', null, '90', '乌海', 'W', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('150400', null, '赤峰市', '150000', '204', '赤峰', null, '1', 'C', null, '118', '赤峰', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('150500', null, '通辽市', '150000', '197', '通辽', null, '1', 'T', null, '146', '通辽', 'T', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('150600', null, '鄂尔多斯市', '150000', '196', '鄂尔多斯', null, '1', 'E', null, '173', '鄂尔多斯', 'E', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('150700', null, '呼伦贝尔市', '150000', '200', '呼伦贝尔', null, '1', 'H', null, '200', '呼伦贝尔', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('150800', null, '巴彦淖尔市', '150000', '194', '巴彦淖尔', null, '1', 'B', null, '226', '巴彦淖尔', 'B', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('150900', null, '乌兰察布市', '150000', '202', '乌兰察布', null, '1', 'W', null, '251', '乌兰察布', 'W', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('152200', null, '兴安盟市', '150000', '203', '兴安盟', null, '1', 'X', null, '294', '兴安', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('152500', null, '锡林郭勒盟', '150000', '201', '锡林郭勒', null, '1', 'X', null, '273', '锡林郭勒', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('152900', null, '阿拉善盟', '150000', '193', '阿拉善', null, '1', 'A', null, '311', '阿拉善', 'A', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('210100', null, '沈阳市', '210000', '523', '沈阳', null, '1', 'S', 'sy', '8', '沈阳', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('210200', null, '大连市', '210000', '515', '大连', null, '1', 'D', 'dl', '38', '大连', 'D', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('210300', null, '鞍山市', '210000', '511', '鞍山', '225', '1', 'A', null, '66', '鞍山', 'A', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('210400', null, '抚顺市', '210000', '525', '抚顺', null, '1', 'F', null, '94', '抚顺', 'F', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('210500', null, '本溪市', '210000', '512', '本溪', null, '1', 'B', null, '122', '本溪', 'B', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('210600', null, '丹东市', '210000', '518', '丹东', null, '1', 'D', null, '150', '丹东', 'D', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('210700', null, '锦州市', '210000', '514', '锦州', null, '1', 'J', null, '177', '锦州', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('210800', null, '营口市', '210000', '517', '营口', null, '1', 'Y', null, '204', '营口', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('210900', null, '阜新市', '210000', '520', '阜新', null, '1', 'B', null, '230', '阜新', 'F', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('211000', null, '辽阳市', '210000', '516', '辽阳', null, '1', 'L', null, '255', '辽阳', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('211100', null, '盘锦市', '210000', '521', '盘锦', null, '1', 'P', null, '277', '盘锦', 'P', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('211200', null, '铁岭市', '210000', '524', '铁岭', null, '1', 'T', null, '296', '铁岭', 'T', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('211300', null, '朝阳市', '210000', '519', '朝阳', null, '1', 'C', null, '313', '朝阳', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('211400', null, '葫芦岛市', '210000', '522', '葫芦岛', null, '1', 'H', null, '329', '葫芦岛', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('220100', null, '长春市', '220000', '46', '长春', null, '1', 'C', 'cc', '9', '长春', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('220200', null, '吉林市', '220000', '48', '吉林', '237', '1', 'J', null, '39', '吉林', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('220300', null, '四平市', '220000', '50', '四平', null, '1', 'S', null, '67', '四平', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('220400', null, '辽源市', '220000', '45', '辽源', null, '1', 'L', null, '95', '辽源', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('220500', null, '通化市', '220000', '47', '通化', null, '1', 'T', null, '123', '通化', 'T', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('220600', null, '白山市', '220000', '51', '白山', null, '1', 'B', null, '151', '白山', 'B', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('220700', null, '松原市', '220000', '44', '松原', null, '1', 'S', null, '178', '松原', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('220800', null, '白城市', '220000', '49', '白城', null, '1', 'B', null, '205', '白城', 'B', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('222400', null, '延边州', '220000', '43', '延边', null, '1', 'Y', null, '231', '延边', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('230100', null, '哈尔滨市', '230000', '631', '哈尔滨', null, '1', 'H', 'heb', '10', '哈尔滨', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('230200', null, '齐齐哈尔市', '230000', '624', '齐齐哈尔', null, '1', 'Q', 'qqhe', '40', '齐齐哈尔', 'Q', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('230300', null, '鸡西市', '230000', '636', '鸡西', null, '1', 'J', null, '124', '鸡西', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('230400', null, '鹤岗市', '230000', '634', '鹤岗', null, '1', 'H', null, '68', '鹤岗', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('230500', null, '双鸭山市', '230000', '628', '双鸭山', null, '1', 'S', null, '96', '双鸭山', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('230600', null, '大庆市', '230000', '632', '大庆', null, '1', 'D', null, '152', '大庆', 'D', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('230700', null, '伊春市', '230000', '625', '伊春', null, '1', 'Y', null, '179', '伊春', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('230800', null, '佳木斯市', '230000', '629', '佳木斯', null, '1', 'J', null, '232', '佳木斯', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('230900', null, '七台河市', '230000', '630', '七台河', null, '1', 'Q', null, '256', '七台河', 'Q', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('231000', null, '牡丹江市', '230000', '633', '牡丹江', null, '1', 'M', null, '206', '牡丹江', 'M', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('231100', null, '黑河市', '230000', '635', '黑河', null, '1', 'H', null, '278', '黑河', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('231200', null, '绥化市', '230000', '626', '绥化', null, '1', 'S', null, '297', '绥化', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('232700', null, '大兴安岭地区', '230000', '627', '大兴安岭', null, '1', 'D', null, '314', '大兴安岭', 'D', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('310100', '021', '上海市', '310000', '359', '上海', '83', '1', 'S', 'sh', '3', '上海', 'S', '121.473562', '31.230312', '1');
INSERT INTO `s_area_city` VALUES ('320100', null, '南京市', '320000', '104', '南京', null, '1', 'N', 'nj', '11', '南京', 'N', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('320200', null, '无锡市', '320000', '109', '无锡', null, '1', 'W', 'wx', '41', '无锡', 'W', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('320300', null, '徐州市', '320000', '102', '徐州', null, '1', 'X', null, '69', '徐州', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('320400', null, '常州市', '320000', '105', '常州', null, '1', 'C', 'cz', '97', '常州', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('320500', null, '苏州市', '320000', '108', '苏州', null, '1', 'S', 'suzhou', '125', '苏州', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('320600', null, '南通市', '320000', '114', '南通', null, '1', 'N', null, '153', '南通', 'N', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('320700', null, '连云港市', '320000', '110', '连云港', null, '1', 'L', null, '180', '连云港', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('320800', null, '淮安市', '320000', '113', '淮安', null, '1', 'H', null, '207', '淮安', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('320900', null, '盐城市', '320000', '111', '盐城', null, '1', 'Y', null, '233', '盐城', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('321000', null, '扬州市', '320000', '112', '扬州', null, '1', 'Y', null, '257', '扬州', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('321100', null, '镇江市', '320000', '106', '镇江', null, '1', 'Z', null, '279', '镇江', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('321200', null, '泰州市', '320000', '103', '泰州', null, '1', 'T', null, '298', '泰州', 'T', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('321300', null, '宿迁市', '320000', '107', '宿迁', null, '1', 'S', null, '315', '宿迁', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('330100', null, '杭州市', '330000', '143', '杭州', null, '1', 'H', 'hz', '12', '杭州', 'H', '0.00', '0.00', '1');
INSERT INTO `s_area_city` VALUES ('330200', null, '宁波市', '330000', '152', '宁波', null, '1', 'N', 'nb', '42', '宁波', 'N', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('330300', null, '温州市', '330000', '146', '温州', null, '1', 'W', 'wz', '70', '温州', 'W', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('330400', null, '嘉兴市', '330000', '153', '嘉兴', null, '1', 'J', null, '98', '嘉兴', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('330500', null, '湖州市', '330000', '145', '湖州', null, '1', 'H', null, '126', '湖州', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('330600', null, '绍兴市', '330000', '144', '绍兴', null, '1', 'S', null, '154', '绍兴', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('330700', null, '金华市', '330000', '151', '金华', null, '1', 'J', null, '181', '金华', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('330800', null, '衢州市', '330000', '154', '衢州', null, '1', 'Q', null, '208', '衢州', 'Q', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('330900', null, '舟山市', '330000', '149', '舟山', null, '1', 'Z', null, '234', '舟山', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('331000', null, '台州市', '330000', '148', '台州', null, '1', 'T', null, '258', '台州', 'T', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('331100', null, '丽水市', '330000', '150', '丽水', null, '1', 'L', null, '280', '丽水', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('340100', null, '合肥市', '340000', '367', '合肥', null, '1', 'H', 'hf', '13', '合肥', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('340200', null, '芜湖市', '340000', '376', '芜湖', null, '1', 'W', null, '43', '芜湖', 'W', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('340300', null, '蚌埠市', '340000', '373', '蚌埠', null, '1', 'B', null, '71', '蚌埠', 'B', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('340400', null, '淮南市', '340000', '360', '淮南', null, '1', 'H', null, '99', '淮南', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('340500', null, '马鞍山市', '340000', '364', '马鞍山', null, '1', 'M', null, '127', '马鞍山', 'M', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('340600', null, '淮北市', '340000', '371', '淮北', null, '1', 'H', null, '155', '淮北', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('340700', null, '铜陵市', '340000', '375', '铜陵', null, '1', 'T', null, '182', '铜陵', 'T', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('340800', null, '安庆市', '340000', '363', '安庆', null, '1', 'A', 'anqing', '209', '安庆', 'A', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('341000', null, '黄山市', '340000', '372', '黄山', null, '1', 'H', 'huangshan', '235', '黄山', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('341100', null, '滁州市', '340000', '369', '滁州', null, '1', 'C', null, '259', '滁州', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('341200', null, '阜阳市', '340000', '368', '阜阳', null, '1', 'B', null, '281', '阜阳', 'F', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('341300', null, '宿州市', '340000', '362', '宿州', null, '1', 'S', null, '299', '宿州', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('341400', null, '巢湖市', '340000', '365', '巢湖', null, '1', 'C', null, '316', '巢湖', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('341500', null, '六安市', '340000', '374', '六安', null, '1', 'L', 'liuan', '330', '六安', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('341600', null, '亳州市', '340000', '366', '亳州', null, '1', 'B', null, '343', '亳州', 'B', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('341700', null, '池州市', '340000', '361', '池州', null, '1', 'C', null, '353', '池州', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('341800', null, '宣城市', '340000', '370', '宣城', null, '1', 'X', null, '363', '宣城', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('350100', null, '福州市', '350000', '115', '福州', null, '1', 'F', 'fz', '14', '福州', 'F', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('350200', null, '厦门市', '350000', '117', '厦门', null, '1', 'X', 'xm', '44', '厦门', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('350300', null, '莆田市', '350000', '123', '莆田', null, '1', 'P', 'putian', '72', '莆田', 'P', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('350400', null, '三明市', '350000', '119', '三明', null, '1', 'S', null, '100', '三明', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('350500', null, '泉州市', '350000', '118', '泉州', null, '1', 'Q', 'quanzhou', '128', '泉州', 'Q', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('350600', null, '漳州市', '350000', '120', '漳州', null, '1', 'Z', null, '156', '漳州', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('350700', null, '南平市', '350000', '116', '南平', '249', '1', 'N', null, '183', '南平', 'N', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('350800', null, '龙岩市', '350000', '121', '龙岩', null, '1', 'L', null, '210', '龙岩', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('350900', null, '宁德市', '350000', '124', '宁德', null, '1', 'N', null, '236', '宁德', 'N', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('360100', null, '南昌市', '360000', '351', '南昌', '144', '1', 'N', 'nc', '15', '南昌', 'N', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('360200', null, '景德镇市', '360000', '354', '景德镇', null, '1', 'J', null, '45', '景德镇', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('360300', null, '萍乡市', '360000', '349', '萍乡', null, '1', 'P', null, '73', '萍乡', 'P', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('360400', null, '九江市', '360000', '348', '九江', null, '1', 'J', null, '101', '九江', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('360500', null, '新余市', '360000', '353', '新余', null, '1', 'X', null, '129', '新余', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('360600', null, '鹰潭市', '360000', '346', '鹰潭', null, '1', 'Y', null, '157', '鹰潭', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('360700', null, '赣州市', '360000', '355', '赣州', null, '1', 'G', null, '184', '赣州', 'G', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('360800', null, '吉安市', '360000', '347', '吉安', null, '1', 'J', null, '211', '吉安', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('360900', null, '宜春市', '360000', '356', '宜春', null, '1', 'Y', null, '237', '宜春', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('361000', null, '抚州市', '360000', '350', '抚州', null, '1', 'F', null, '260', '抚州', 'F', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('361100', null, '上饶市', '360000', '352', '上饶', null, '1', 'S', null, '282', '上饶', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('370100', null, '济南市', '370000', '530', '济南', null, '1', 'J', 'jn', '16', '济南', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('370200', null, '青岛市', '370000', '534', '青岛', '194', '1', 'Q', 'qd', '46', '青岛', 'Q', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('370300', null, '淄博市', '370000', '526', '淄博', null, '1', 'Z', null, '74', '淄博', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('370400', null, '枣庄市', '370000', '535', '枣庄', null, '1', 'Z', null, '102', '枣庄', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('370500', null, '东营市', '370000', '538', '东营', null, '1', 'D', null, '130', '东营', 'D', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('370600', null, '烟台市', '370000', '528', '烟台', '198', '1', 'Y', 'yantai', '158', '烟台', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('370700', null, '潍坊市', '370000', '533', '潍坊', '199', '1', 'W', null, '185', '潍坊', 'W', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('370800', null, '济宁市', '370000', '541', '济宁', null, '1', 'J', null, '212', '济宁', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('370900', null, '泰安市', '370000', '529', '泰安', null, '1', 'T', null, '238', '泰安', 'T', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('371000', null, '威海市', '370000', '539', '威海', null, '1', 'W', 'weihai', '261', '威海', 'W', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('371100', null, '日照市', '370000', '542', '日照', null, '1', 'R', null, '283', '日照', 'R', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('371200', null, '莱芜市', '370000', '537', '莱芜', null, '1', 'L', null, '300', '莱芜', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('371300', null, '临沂市', '370000', '531', '临沂', null, '1', 'L', null, '317', '临沂', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('371400', null, '德州市', '370000', '536', '德州', null, '1', 'D', null, '331', '德州', 'D', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('371500', null, '聊城市', '370000', '532', '聊城', null, '1', 'L', null, '344', '聊城', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('371600', null, '滨州市', '370000', '527', '滨州', null, '1', 'B', null, '354', '滨州', 'B', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('371700', null, '菏泽市', '370000', '543', '菏泽', null, '1', 'H', null, '364', '菏泽', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('410100', null, '郑州市', '410000', '338', '郑州', null, '1', 'Z', 'zz', '17', '郑州', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('410200', null, '开封市', '410000', '344', '开封', null, '1', 'K', null, '47', '开封', 'K', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('410300', null, '洛阳市', '410000', '330', '洛阳', null, '1', 'L', 'luoyang', '75', '洛阳', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('410400', null, '平顶山市', '410000', '335', '平顶山', null, '1', 'P', null, '103', '平顶山', 'P', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('410500', null, '安阳市', '410000', '333', '安阳', null, '1', 'A', null, '131', '安阳', 'A', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('410600', null, '鹤壁市', '410000', '332', '鹤壁', null, '1', 'H', null, '159', '鹤壁', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('410700', null, '新乡市', '410000', '345', '新乡', null, '1', 'X', null, '186', '新乡', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('410800', null, '焦作市', '410000', '342', '焦作', null, '1', 'J', null, '213', '焦作', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('410900', null, '濮阳市', '410000', '337', '濮阳', null, '1', 'P', null, '239', '濮阳', 'P', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('411000', null, '许昌市', '410000', '343', '许昌', null, '1', 'X', null, '262', '许昌', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('411100', null, '漯河市', '410000', '336', '漯河', null, '1', 'L', null, '284', '漯河', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('411200', null, '三门峡市', '410000', '329', '三门峡', null, '1', 'S', null, '301', '三门峡', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('411300', null, '南阳市', '410000', '341', '南阳', null, '1', 'N', 'nanyang', '318', '南阳', 'N', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('411400', null, '商丘市', '410000', '334', '商丘', null, '1', 'S', null, '332', '商丘', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('411500', null, '信阳市', '410000', '340', '信阳', null, '1', 'X', null, '345', '信阳', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('411600', null, '周口市', '410000', '331', '周口', null, '1', 'Z', null, '355', '周口', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('411700', null, '驻马店市', '410000', '339', '驻马店', null, '1', 'Z', null, '365', '驻马店', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('420100', null, '武汉市', '420000', '265', '武汉', null, '1', 'W', 'wh', '18', '武汉', 'W', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('420200', null, '黄石市', '420000', '263', '黄石', null, '1', 'H', 'huangshi', '48', '黄石', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('420300', null, '十堰市', '420000', '268', '十堰', null, '1', 'S', null, '76', '十堰', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('420500', null, '宜昌市', '420000', '267', '宜昌', null, '1', 'Y', null, '132', '宜昌', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('420600', null, '襄阳市', '420000', '259', '襄阳', null, '1', 'X', null, '160', '襄阳', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('420700', null, '鄂州市', '420000', '258', '鄂州', null, '1', 'E', null, '187', '鄂州', 'E', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('420800', null, '荆门市', '420000', '266', '荆门', null, '1', 'J', null, '214', '荆门', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('420900', null, '孝感市', '420000', '264', '孝感', null, '1', 'X', null, '240', '孝感', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('421000', null, '荆州市', '420000', '260', '荆州', null, '1', 'J', null, '104', '荆州', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('421100', null, '黄冈市', '420000', '261', '黄冈', null, '1', 'H', null, '263', '黄冈', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('421200', null, '咸宁市', '420000', '269', '咸宁', null, '1', 'X', null, '285', '咸宁', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('421300', null, '随州市', '420000', '262', '随州', null, '1', 'S', null, '302', '随州', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('422800', null, '恩施州', '420000', '257', '恩施', null, '1', 'E', null, '366', '恩施', 'E', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('430100', null, '长沙市', '430000', '478', '长沙', null, '1', 'C', 'cs', '19', '长沙', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('430200', null, '株洲市', '430000', '482', '株洲', null, '1', 'Z', null, '49', '株洲', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('430300', null, '湘潭市', '430000', '475', '湘潭', null, '1', 'X', 'xiangtan', '77', '湘潭', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('430400', null, '衡阳市', '430000', '472', '衡阳', null, '1', 'H', null, '105', '衡阳', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('430500', null, '邵阳市', '430000', '483', '邵阳', null, '1', 'S', null, '133', '邵阳', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('430600', null, '岳阳市', '430000', '470', '岳阳', null, '1', 'Y', 'yueyang', '161', '岳阳', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('430700', null, '常德市', '430000', '477', '常德', null, '1', 'C', 'changde', '188', '常德', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('430800', null, '张家界市', '430000', '473', '张家界', null, '1', 'Z', null, '215', '张家界', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('430900', null, '益阳市', '430000', '481', '益阳', null, '1', 'Y', null, '241', '益阳', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('431000', null, '郴州市', '430000', '471', '郴州', null, '1', 'C', null, '264', '郴州', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('431100', null, '永州市', '430000', '480', '永州', null, '1', 'Y', null, '286', '永州', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('431200', null, '怀化市', '430000', '474', '怀化', null, '1', 'H', null, '303', '怀化', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('431300', null, '娄底市', '430000', '476', '娄底', null, '1', 'L', null, '320', '娄底', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('433100', null, '湘西土家族苗族自治州', '430000', '479', '湘西', null, '1', 'X', null, '334', '湘西', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('440100', null, '广州市', '440000', '16', '广州', null, '1', 'G', 'gz', '20', '广州', 'G', '0.00', '0.00', '1');
INSERT INTO `s_area_city` VALUES ('440200', null, '韶关市', '440000', '7', '韶关', null, '1', 'S', null, '134', '韶关', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('440300', null, '深圳市', '440000', '19', '深圳', null, '1', 'S', 'sz', '50', '深圳', 'S', '0.00', '0.00', '1');
INSERT INTO `s_area_city` VALUES ('440400', null, '珠海市', '440000', '4', '珠海', null, '1', 'Z', 'zh', '78', '珠海', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('440500', null, '汕头市', '440000', '20', '汕头', null, '1', 'S', null, '106', '汕头', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('440600', null, '佛山市', '440000', '15', '佛山', null, '1', 'F', 'fs', '162', '佛山', 'F', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('440700', null, '江门市', '440000', '21', '江门', null, '1', 'J', null, '189', '江门', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('440800', null, '湛江市', '440000', '13', '湛江', null, '1', 'Z', 'zhanjiang', '216', '湛江', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('440900', null, '茂名市', '440000', '8', '茂名', null, '1', 'M', null, '242', '茂名', 'M', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('441200', null, '肇庆市', '440000', '11', '肇庆', null, '1', 'Z', null, '265', '肇庆', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('441300', null, '惠州市', '440000', '18', '惠州', null, '1', 'H', null, '287', '惠州', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('441400', null, '梅州市', '440000', '9', '梅州', null, '1', 'M', null, '304', '梅州', 'M', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('441500', null, '汕尾市', '440000', '17', '汕尾', null, '1', 'S', null, '321', '汕尾', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('441600', null, '河源市', '440000', '23', '河源', null, '1', 'H', null, '335', '河源', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('441700', null, '阳江市', '440000', '5', '阳江', null, '1', 'Y', null, '347', '阳江', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('441800', null, '清远市', '440000', '14', '清远', null, '1', 'Q', null, '357', '清远', 'Q', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('441900', null, '东莞市', '440000', '6', '东莞', null, '1', 'D', 'dw', '367', '东莞', 'D', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('442000', null, '中山市', '440000', '12', '中山', null, '1', 'Z', null, '373', '中山', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('445100', null, '潮州市', '440000', '3', '潮州', null, '1', 'C', null, '378', '潮州', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('445200', null, '揭阳市', '440000', '24', '揭阳', null, '1', 'J', null, '382', '揭阳', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('445300', null, '云浮市', '440000', '22', '云浮', null, '1', 'Y', null, '386', '云浮', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('450100', null, '南宁市', '450000', '255', '南宁', null, '1', 'N', 'nn', '28', '南宁', 'N', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('450200', null, '柳州市', '450000', '245', '柳州', null, '1', 'L', null, '58', '柳州', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('450300', null, '桂林市', '450000', '252', '桂林', null, '1', 'G', 'guilin', '86', '桂林', 'G', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('450400', null, '梧州市', '450000', '254', '梧州', null, '1', 'W', null, '114', '梧州', 'W', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('450500', null, '北海市', '450000', '256', '北海', null, '1', 'B', null, '142', '北海', 'B', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('450600', null, '防城港市', '450000', '246', '防城港', null, '1', 'F', null, '170', '防城港', 'F', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('450700', null, '钦州市', '450000', '243', '钦州', null, '1', 'Q', null, '197', '钦州', 'Q', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('450800', null, '贵港市', '450000', '244', '贵港', null, '1', 'G', null, '224', '贵港', 'G', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('450900', null, '玉林市', '450000', '253', '玉林', null, '1', 'Y', null, '249', '玉林', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('451000', null, '百色市', '450000', '250', '百色', null, '1', 'B', null, '271', '百色', 'B', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('451100', null, '贺州市', '450000', '249', '贺州', null, '1', 'H', null, '292', '贺州', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('451200', null, '河池市', '450000', '248', '河池', null, '1', 'H', null, '309', '河池', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('451300', null, '来宾市', '450000', '247', '来宾', null, '1', 'L', null, '326', '来宾', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('451400', null, '崇左市', '450000', '251', '崇左', null, '1', 'C', null, '340', '崇左', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('460100', null, '海口市', '460000', '358', '海口', null, '1', 'H', 'hk', '24', '海口', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('460200', null, '三亚市', '460000', '357', '三亚', null, '1', 'S', null, '54', '三亚', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('460300', null, '三沙市', '460000', '0', '三沙', null, '1', 'S', 'ss', '396', '三沙', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('500100', null, '重庆市', '500000', '80', '重庆', '59', '1', 'C', 'cq', '4', '重庆', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('510100', null, '成都市', '510000', '449', '成都', null, '1', 'C', 'cd', '22', '成都', 'C', '0.00', '0.00', '1');
INSERT INTO `s_area_city` VALUES ('510300', null, '自贡市', '510000', '462', '自贡', null, '1', 'Z', null, '52', '自贡', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('510400', null, '攀枝花市', '510000', '456', '攀枝花', null, '1', 'P', null, '80', '攀枝花', 'P', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('510500', null, '泸州市', '510000', '452', '泸州', null, '1', 'L', null, '108', '泸州', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('510600', null, '德阳市', '510000', '450', '德阳', null, '1', 'D', null, '136', '德阳', 'D', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('510700', null, '绵阳市', '510000', '451', '绵阳', null, '1', 'M', null, '164', '绵阳', 'M', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('510800', null, '广元市', '510000', '454', '广元', null, '1', 'G', null, '191', '广元', 'G', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('510900', null, '遂宁市', '510000', '463', '遂宁', null, '1', 'S', null, '218', '遂宁', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('511000', null, '内江市', '510000', '455', '内江', null, '1', 'N', null, '244', '内江', 'N', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('511100', null, '乐山市', '510000', '458', '乐山', null, '1', 'L', null, '267', '乐山', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('511300', null, '南充市', '510000', '459', '南充', null, '1', 'N', 'nanchong', '289', '南充', 'N', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('511400', null, '眉山市', '510000', '457', '眉山', null, '1', 'M', null, '306', '眉山', 'M', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('511500', null, '宜宾市', '510000', '467', '宜宾', null, '1', 'Y', null, '323', '宜宾', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('511600', null, '广安市', '510000', '465', '广安', null, '1', 'G', null, '337', '广安', 'G', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('511700', null, '达州市', '510000', '469', '达州', null, '1', 'D', null, '348', '达州', 'D', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('511800', null, '雅安市', '510000', '460', '雅安', null, '1', 'Y', null, '358', '雅安', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('511900', null, '巴中市', '510000', '468', '巴中', null, '1', 'B', null, '368', '巴中', 'B', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('512000', null, '资阳市', '510000', '461', '资阳', null, '1', 'Z', null, '374', '资阳', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('513200', null, '阿坝州', '510000', '464', '阿坝', null, '1', 'A', null, '379', '阿坝', 'A', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('513300', null, '甘孜州', '510000', '466', '甘孜', null, '1', 'G', null, '383', '甘孜', 'G', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('513400', null, '凉山州', '510000', '453', '凉山', null, '1', 'L', null, '387', '凉山', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('520100', null, '贵阳市', '520000', '160', '贵阳', null, '1', 'G', 'gy', '23', '贵阳', 'G', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('520200', null, '六盘水市', '520000', '156', '六盘水', null, '1', 'L', 'lps', '53', '六盘水', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('520300', null, '遵义市', '520000', '155', '遵义', null, '1', 'Z', 'zunyi', '81', '遵义', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('520400', null, '安顺市', '520000', '157', '安顺', null, '1', 'A', 'anshun', '109', '安顺', 'A', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('520500', null, '毕节市', '520000', '159', '毕节', null, '1', 'B', null, '165', '毕节', 'B', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('520600', null, '铜仁市', '520000', '161', '铜仁', null, '1', 'T', null, '137', '铜仁', 'T', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('522300', null, '黔西南州', '520000', '163', '黔西南', null, '1', 'Q', null, '192', '黔西南', 'Q', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('522600', null, '黔东南苗族侗族自治州', '520000', '158', '黔东南', null, '1', 'Q', null, '219', '黔东南', 'Q', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('522700', null, '黔南州', '520000', '162', '黔南', null, '1', 'Q', null, '245', '黔南', 'Q', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('530100', null, '昆明市', '530000', '644', '昆明', null, '1', 'K', 'km', '25', '昆明', 'K', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('530300', null, '曲靖市', '530000', '641', '曲靖', null, '1', 'Q', null, '55', '曲靖', 'Q', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('530400', null, '玉溪市', '530000', '642', '玉溪', null, '1', 'Y', null, '83', '玉溪', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('530500', null, '保山市', '530000', '639', '保山', null, '1', 'B', null, '111', '保山', 'B', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('530600', null, '昭通市', '530000', '650', '昭通', null, '1', 'S', null, '139', '昭通', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('530700', null, '丽江市', '530000', '652', '丽江', null, '1', 'L', null, '167', '丽江', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('530800', null, '思茅市', '530000', '651', '思茅', null, '1', 'S', 'sm', '397', '思茅', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('530900', null, '临沧市', '530000', '637', '临沧', null, '1', 'L', null, '221', '临沧', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('532300', null, '楚雄彝族自治州', '530000', '646', '楚雄', null, '1', 'C', null, '308', '楚雄', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('532500', null, '红河哈尼族彝族自治州', '530000', '648', '红河', null, '1', 'H', null, '269', '红河', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('532600', null, '文山壮族苗族自治州', '530000', '647', '文山', null, '1', 'W', null, '247', '文山', 'W', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('532800', null, '西双版纳傣族自治州', '530000', '638', '西双版纳傣族自治州', null, '1', 'X', null, '291', '西双版纳', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('532900', null, '大理白族自治州', '530000', '649', '大理', null, '1', 'D', null, '325', '大理', 'D', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('533100', null, '德宏州', '530000', '640', '德宏', null, '1', 'D', null, '339', '德宏', 'D', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('533300', null, '怒江州', '530000', '645', '怒江', null, '1', 'N', null, '350', '怒江', 'N', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('533400', null, '迪庆藏族自治州', '530000', '643', '迪庆', null, '1', 'D', null, '360', '迪庆', 'D', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('540100', null, '拉萨市', '540000', '241', '拉萨', null, '1', 'L', 'ls', '29', '拉萨', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('542100', null, '昌都地区', '540000', '236', '昌都', null, '1', 'C', null, '87', '昌都', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('542200', null, '山南地区', '540000', '242', '山南', null, '1', 'S', null, '115', '山南', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('542300', null, '日喀则地区', '540000', '238', '日喀则', null, '1', 'R', null, '143', '日喀则', 'R', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('542400', null, '那曲地区', '540000', '239', '那曲', null, '1', 'N', null, '59', '那曲', 'N', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('542500', null, '阿里地区', '540000', '237', '阿里', null, '1', 'A', null, '171', '阿里', 'A', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('542600', null, '林芝地区', '540000', '235', '林芝', null, '1', 'L', null, '198', '林芝', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('610100', null, '西安市', '610000', '326', '西安', '285', '1', 'X', 'xa', '27', '西安', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('610200', null, '铜川市', '610000', '327', '铜川', null, '1', 'T', null, '57', '铜川', 'T', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('610300', null, '宝鸡市', '610000', '320', '宝鸡', null, '1', 'B', null, '85', '宝鸡', 'B', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('610400', null, '咸阳市', '610000', '323', '咸阳', null, '1', 'X', null, '113', '咸阳', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('610500', null, '渭南市', '610000', '319', '渭南', null, '1', 'W', null, '141', '渭南', 'W', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('610600', null, '延安市', '610000', '328', '延安', null, '1', 'Y', null, '169', '延安', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('610700', null, '汉中市', '610000', '322', '汉中', null, '1', 'H', null, '196', '汉中', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('610800', null, '榆林市', '610000', '321', '榆林', null, '1', 'Y', null, '223', '榆林', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('610900', null, '安康市', '610000', '325', '安康', null, '1', 'A', null, '248', '安康', 'A', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('611000', null, '商洛市', '610000', '324', '商洛', null, '1', 'S', null, '270', '商洛', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('620100', null, '兰州市', '620000', '94', '兰州', null, '1', 'L', null, '21', '兰州', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('620200', null, '嘉峪关市', '620000', '87', '嘉峪关', null, '1', 'J', null, '135', '嘉峪关', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('620300', null, '金昌市', '620000', '91', '金昌', null, '1', 'J', null, '51', '金昌', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('620400', null, '白银市', '620000', '84', '白银', null, '1', 'B', null, '79', '白银', 'B', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('620500', null, '天水市', '620000', '89', '天水', null, '1', 'T', null, '107', '天水', 'T', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('620600', null, '武威市', '620000', '85', '武威', null, '1', 'W', null, '163', '武威', 'W', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('620700', null, '张掖市', '620000', '88', '张掖', null, '1', 'Z', null, '190', '张掖', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('620800', null, '平凉市', '620000', '83', '平凉', null, '1', 'P', null, '217', '平凉', 'P', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('620900', null, '酒泉市', '620000', '96', '酒泉', null, '1', 'J', null, '243', '酒泉', 'J', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('621000', null, '庆阳市', '620000', '93', '庆阳', null, '1', 'Q', null, '266', '庆阳', 'Q', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('621100', null, '定西市', '620000', '90', '定西', null, '1', 'D', null, '288', '定西', 'D', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('621200', null, '陇南市', '620000', '86', '陇南', null, '1', 'L', null, '305', '陇南', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('622900', null, '临夏州', '620000', '95', '临夏', null, '1', 'L', null, '322', '临夏', 'L', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('623000', null, '甘南州', '620000', '92', '甘南', null, '1', 'G', null, '336', '甘南', 'G', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('630100', null, '西宁市', '630000', '654', '西宁', null, '1', 'X', null, '26', '西宁', 'X', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('632100', null, '海东地区', '630000', '659', '海东', null, '1', 'H', null, '56', '海东', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('632200', null, '海北藏族自治州', '630000', '657', '海北', null, '1', 'H', null, '84', '海北', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('632300', null, '黄南藏族自治州', '630000', '658', '黄南', null, '1', 'H', null, '112', '黄南', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('632500', null, '海南藏族自治州', '630000', '653', '海南藏族自治州', null, '1', 'H', null, '140', '海南藏族', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('632600', null, '果洛藏族自治州', '630000', '660', '果洛', null, '1', 'G', null, '168', '果洛', 'G', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('632700', null, '玉树藏族自治州', '630000', '655', '玉树', null, '1', 'Y', null, '195', '玉树', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('632800', null, '海西蒙古族藏族自治州', '630000', '656', '海西', '263', '1', 'H', null, '222', '海西', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('640100', null, '银川市', '640000', '101', '银川', null, '1', 'Y', null, '30', '银川', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('640200', null, '石嘴山市', '640000', '100', '石嘴山', null, '1', 'S', null, '60', '石嘴山', 'S', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('640300', null, '吴忠市', '640000', '98', '吴忠', null, '1', 'W', null, '88', '吴忠', 'W', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('640400', null, '固原市', '640000', '99', '固原', null, '1', 'G', null, '116', '固原', 'G', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('640500', null, '中卫市', '640000', '97', '中卫', null, '1', 'Z', null, '144', '中卫', 'Z', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('650100', null, '乌鲁木齐市', '650000', '577', '乌鲁木齐', null, '1', 'W', 'wlmq', '31', '乌鲁木齐', 'W', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('650200', null, '克拉玛依市', '650000', '578', '克拉玛依', null, '1', 'K', null, '61', '克拉玛依', 'K', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('652100', null, '吐鲁番地区', '650000', '582', '吐鲁番', null, '1', 'T', null, '199', '吐鲁番', 'T', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('652200', null, '哈密地区', '650000', '581', '哈密', null, '1', 'H', null, '272', '哈密', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('652300', null, '昌吉回族自治州', '650000', '287', '昌吉', null, '1', 'C', null, '341', '昌吉', 'C', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('652700', null, '博尔塔拉蒙古自治州', '650000', '590', '博尔塔拉', null, '1', 'B', null, '393', '博尔塔拉', 'B', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('652800', null, '巴音郭楞蒙古自治州', '650000', '584', '巴音郭楞', null, '1', 'B', null, '327', '巴音郭楞', 'B', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('652900', null, '阿克苏地区', '650000', '586', '阿克苏', null, '1', 'A', null, '225', '阿克苏', 'A', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('653000', null, '克孜勒苏柯尔克孜自治州', '650000', '587', '克孜勒苏柯尔克孜', null, '1', 'K', null, '395', '克孜勒苏', 'K', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('653100', null, '喀什地区', '650000', '585', '喀什', null, '1', 'K', null, '250', '喀什', 'K', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('653200', null, '和田地区', '650000', '579', '和田', null, '1', 'H', null, '293', '和田', 'H', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('654000', null, '伊犁哈萨克自治州', '650000', '589', '伊犁', null, '1', 'Y', null, '392', '伊犁', 'Y', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('654200', null, '塔城地区', '650000', '580', '塔城', null, '1', 'T', null, '384', '塔城', 'T', '0.00', '0.00', '0');
INSERT INTO `s_area_city` VALUES ('654300', null, '阿勒泰地区', '650000', '588', '阿勒泰', null, '1', 'A', null, '390', '阿勒泰', 'A', '0.00', '0.00', '0');

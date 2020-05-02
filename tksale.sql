/*
Navicat MySQL Data Transfer

Source Server         : app
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tksale

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2020-01-02 15:21:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `LoginName` varchar(64) NOT NULL,
  `Password` varchar(64) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `LoginName` (`LoginName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', 'admin', 'a66abb5684c45962d887564f08346e8d');
INSERT INTO `tb_admin` VALUES ('2', '111', '74e9c9f2de6a1f2f73b8d62727449a5e');

-- ----------------------------
-- Table structure for `tb_ads`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ads`;
CREATE TABLE `tb_ads` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Src` varchar(64) NOT NULL,
  `SortNum` int(11) NOT NULL DEFAULT '100',
  `Enable` tinyint(4) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_ads
-- ----------------------------
INSERT INTO `tb_ads` VALUES ('2', '/upload/file-1568078567575.png', '100', '1');

-- ----------------------------
-- Table structure for `tb_category`
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `Src` varchar(64) NOT NULL,
  `SortNum` int(11) NOT NULL DEFAULT '100',
  `Enable` tinyint(4) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES ('1', '厦门周边', '/upload/head.jpg', '100', '0');
INSERT INTO `tb_category` VALUES ('2', '美食', '/upload/head.jpg', '100', '1');
INSERT INTO `tb_category` VALUES ('5', '你好', '/upload/file-1567560010822.jpg', '55', '1');
INSERT INTO `tb_category` VALUES ('6', '1234', '/upload/file-1567498541221.png', '100', '1');

-- ----------------------------
-- Table structure for `tb_customer`
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AppOpenId` varchar(64) NOT NULL,
  `SessionKey` varchar(64) DEFAULT NULL,
  `NickName` varchar(32) DEFAULT NULL,
  `AvatarUrl` varchar(64) DEFAULT NULL,
  `Sex` tinyint(4) DEFAULT NULL,
  `Country` varchar(32) DEFAULT NULL,
  `Province` varchar(32) DEFAULT NULL,
  `City` varchar(32) DEFAULT NULL,
  `WeChatBindPhone` varchar(16) DEFAULT NULL,
  `Account` decimal(12,2) NOT NULL DEFAULT '0.00',
  `Status` tinyint(4) NOT NULL,
  `RowVersion` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `AppOpenId` (`AppOpenId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_customer
-- ----------------------------
INSERT INTO `tb_customer` VALUES ('1', '11111', null, 'a', '/upload/head.jpg', '1', '中国', '福建', '其他', '18888888888', '0.00', '1', '1');
INSERT INTO `tb_customer` VALUES ('6', '12342134', null, 'b', '/upload/head.jpg', '0', '中国', '福建', '厦门', null, '0.00', '1', '1');
INSERT INTO `tb_customer` VALUES ('7', '123213123', null, 'c', '/upload/head.jpg', '1', '中国', '福建', '厦门', null, '1.00', '1', '1');
INSERT INTO `tb_customer` VALUES ('13', '123333213123', null, 'd', '/upload/head.jpg', '2', '中国', '福建', '厦门', null, '1.00', '1', '1');
INSERT INTO `tb_customer` VALUES ('14', '122343213123', null, 'e', '/upload/head.jpg', '1', '中国', '福建', '宁德', null, '1.00', '1', '1');
INSERT INTO `tb_customer` VALUES ('16', '1213123', null, 'f', '/upload/head.jpg', '1', '中国', '福建', '漳州', null, '1.00', '1', '1');
INSERT INTO `tb_customer` VALUES ('17', '2222', null, 'g', '/upload/head.jpg', '0', null, null, null, null, '1.00', '1', '1');
INSERT INTO `tb_customer` VALUES ('18', '3333', null, 'h', '/upload/head.jpg', '0', null, null, null, null, '1.00', '1', '1');
INSERT INTO `tb_customer` VALUES ('19', '4444', null, 'i', '/upload/head.jpg', '0', '中国', '福建', '莆田', null, '1.00', '1', '1');
INSERT INTO `tb_customer` VALUES ('20', '1235213', null, 'j', '/upload/head.jpg', '0', '中国', '福建', '南平', null, '1.00', '1', '1');

-- ----------------------------
-- Table structure for `tb_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerId` int(11) NOT NULL,
  `TicketId` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Total` decimal(12,2) NOT NULL,
  `Mobile` varchar(12) NOT NULL,
  `ContactName` varchar(16) NOT NULL,
  `UseDate` date DEFAULT NULL,
  `Status` tinyint(4) DEFAULT NULL,
  `CreateTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_order_customer` (`CustomerId`),
  KEY `FK_order_ticket` (`TicketId`),
  CONSTRAINT `FK_order_customer` FOREIGN KEY (`CustomerId`) REFERENCES `tb_customer` (`Id`),
  CONSTRAINT `FK_order_ticket` FOREIGN KEY (`TicketId`) REFERENCES `tb_ticket` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('1', '1', '12', '100.00', '2', '200.00', '18046100000', '李小阳', '2019-11-01', '1', '2019-09-10 10:11:11');

-- ----------------------------
-- Table structure for `tb_ticket`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ticket`;
CREATE TABLE `tb_ticket` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(64) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Stock` int(11) NOT NULL,
  `ShopName` varchar(64) DEFAULT NULL,
  `ShopAddress` varchar(64) DEFAULT NULL,
  `ShopPhone` varchar(12) DEFAULT NULL,
  `Lat` decimal(10,6) DEFAULT NULL,
  `Long` decimal(10,6) DEFAULT NULL,
  `Content` text NOT NULL,
  `Src` varchar(64) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `Enable` tinyint(4) NOT NULL,
  `SortNum` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`Id`),
  KEY `FK_ticket_category` (`CategoryId`),
  CONSTRAINT `FK_ticket_category` FOREIGN KEY (`CategoryId`) REFERENCES `tb_category` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_ticket
-- ----------------------------
INSERT INTO `tb_ticket` VALUES ('12', '软件园开发体验', '11.00', '1111', '厦门励航软件', '厦门市集美区软件园三期A区-01栋', '18888888888', '24.613387', '118.058804', '<h2><span style=\"text-decoration-line: underline;\"></span>啊哈</h2><p>阿斯蒂芬</p>', '/upload/file-1568078400592.png', '1', '1', '100');

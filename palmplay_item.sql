/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50155
Source Host           : localhost:3306
Source Database       : palmplay_item

Target Server Type    : MYSQL
Target Server Version : 50155
File Encoding         : 65001

Date: 2014-08-29 10:21:24
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `category3`
-- ----------------------------
DROP TABLE IF EXISTS `category3`;
CREATE TABLE `category3` (
  `category3` varchar(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category2` varchar(30) NOT NULL,
  `iconID` varchar(200) NOT NULL,
  `ddate` datetime NOT NULL,
  PRIMARY KEY (`category3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category3
-- ----------------------------


-- ----------------------------
-- Table structure for `collection`
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `colID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category1` varchar(30) NOT NULL,
  `category2` varchar(30) NOT NULL,
  `des` varchar(200) NOT NULL,
  `iconID` varchar(40) NOT NULL,
  `sortV` int(11) NOT NULL,
  `ddate` datetime NOT NULL,
  PRIMARY KEY (`colID`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------

-- ----------------------------
-- Table structure for `counter`
-- ----------------------------
DROP TABLE IF EXISTS `counter`;
CREATE TABLE `counter` (
  `counter` varchar(20) NOT NULL,
  `count` bigint(20) NOT NULL,
  PRIMARY KEY (`counter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of counter
-- ----------------------------

-- ----------------------------
-- Table structure for `cp`
-- ----------------------------
DROP TABLE IF EXISTS `cp`;
CREATE TABLE `cp` (
  `cpID` varchar(8) NOT NULL,
  `account` varchar(80) NOT NULL,
  `pw` varchar(32) NOT NULL,
  `name` varchar(200) NOT NULL,
  `cpType` varchar(8) NOT NULL,
  `addr` varchar(250) DEFAULT NULL,
  `contacts` varchar(80) DEFAULT NULL,
  `subSaleRate` float DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `inSalePool` varchar(6) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `unit` varchar(6) NOT NULL,
  `des` varchar(600) NOT NULL,
  `ddate` datetime NOT NULL,
  PRIMARY KEY (`cpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_item_check`
-- ----------------------------
DROP TABLE IF EXISTS `cp_item_check`;
CREATE TABLE `cp_item_check` (
  `checkID` bigint(20) NOT NULL AUTO_INCREMENT,
  `itemID` varchar(40) NOT NULL,
  `submitManagerID` int(11) NOT NULL,
  `status` varchar(16) NOT NULL,
  `testResultFileID` varchar(40) NOT NULL,
  `des` varchar(100) NOT NULL,
  `ddate` datetime NOT NULL,
  PRIMARY KEY (`checkID`),
  KEY `itemID` (`itemID`),
  KEY `submitManagerID` (`submitManagerID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_item_check
-- ----------------------------

-- ----------------------------
-- Table structure for `in_sale_info`
-- ----------------------------
DROP TABLE IF EXISTS `in_sale_info`;
CREATE TABLE `in_sale_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inSalePackageID` int(20) NOT NULL,
  `mccMnc` varchar(8) NOT NULL,
  `port` varchar(30) NOT NULL,
  `cmd` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `rateRMB` float NOT NULL,
  `rateUSD` float NOT NULL,
  `ddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of in_sale_info
-- ----------------------------

-- ----------------------------
-- Table structure for `in_sale_package`
-- ----------------------------
DROP TABLE IF EXISTS `in_sale_package`;
CREATE TABLE `in_sale_package` (
  `inSalePackageID` int(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inSalePackageID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of in_sale_package
-- ----------------------------
INSERT INTO `in_sale_package` VALUES ('1');

-- ----------------------------
-- Table structure for `item`
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `itemID` varchar(40) NOT NULL,
  `itemNum` varchar(40) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL,
  `category1` varchar(30) NOT NULL,
  `category2` varchar(30) NOT NULL,
  `category3` varchar(60) NOT NULL,
  `iconSID` varchar(50) NOT NULL,
  `iconID` varchar(50) NOT NULL,
  `sourceID` varchar(50) NOT NULL,
  `sourceSize` bigint(20) NOT NULL,
  `cpID` varchar(10) NOT NULL,
  `des` text NOT NULL,
  `advBannerID` varchar(50) DEFAULT NULL,
  `advIconID` varchar(50) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `listDate` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item
-- ----------------------------

-- ----------------------------
-- Table structure for `item_collection`
-- ----------------------------
DROP TABLE IF EXISTS `item_collection`;
CREATE TABLE `item_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemID` varchar(40) NOT NULL,
  `colID` int(11) NOT NULL,
  `sortV` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_collection
-- ----------------------------

-- ----------------------------
-- Table structure for `item_country`
-- ----------------------------
DROP TABLE IF EXISTS `item_country`;
CREATE TABLE `item_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemID` varchar(40) NOT NULL,
  `country` varchar(1200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country
-- ----------------------------

-- ----------------------------
-- Table structure for `item_country_ae`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_ae`;
CREATE TABLE `item_country_ae` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_ae
-- ----------------------------

-- ----------------------------
-- Table structure for `item_country_ao`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_ao`;
CREATE TABLE `item_country_ao` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_ao
-- ----------------------------

-- ----------------------------
-- Table structure for `item_country_bh`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_bh`;
CREATE TABLE `item_country_bh` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_bh
-- ----------------------------

-- ----------------------------
-- Table structure for `item_country_bt`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_bt`;
CREATE TABLE `item_country_bt` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_bt
-- ----------------------------

-- ----------------------------
-- Table structure for `item_country_cd`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_cd`;
CREATE TABLE `item_country_cd` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_cd
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_cf`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_cf`;
CREATE TABLE `item_country_cf` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_cf
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_cg`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_cg`;
CREATE TABLE `item_country_cg` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_cg
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_ci`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_ci`;
CREATE TABLE `item_country_ci` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_ci
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_cm`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_cm`;
CREATE TABLE `item_country_cm` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_cm
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_cn`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_cn`;
CREATE TABLE `item_country_cn` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_cn
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_cr`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_cr`;
CREATE TABLE `item_country_cr` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_cr
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_de`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_de`;
CREATE TABLE `item_country_de` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_de
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_dm`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_dm`;
CREATE TABLE `item_country_dm` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_dm
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_do`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_do`;
CREATE TABLE `item_country_do` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_do
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_dz`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_dz`;
CREATE TABLE `item_country_dz` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_dz
-- ----------------------------

-- ----------------------------
-- Table structure for `item_country_ee`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_ee`;
CREATE TABLE `item_country_ee` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_ee
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_eg`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_eg`;
CREATE TABLE `item_country_eg` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_eg
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_er`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_er`;
CREATE TABLE `item_country_er` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_er
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_es`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_es`;
CREATE TABLE `item_country_es` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_es
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_et`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_et`;
CREATE TABLE `item_country_et` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_et
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_fr`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_fr`;
CREATE TABLE `item_country_fr` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_fr
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_ga`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_ga`;
CREATE TABLE `item_country_ga` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_ga
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_gb`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_gb`;
CREATE TABLE `item_country_gb` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_gb
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_ge`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_ge`;
CREATE TABLE `item_country_ge` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_ge
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_gf`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_gf`;
CREATE TABLE `item_country_gf` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_gf
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_gh`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_gh`;
CREATE TABLE `item_country_gh` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_gh
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_gi`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_gi`;
CREATE TABLE `item_country_gi` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_gi
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_gm`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_gm`;
CREATE TABLE `item_country_gm` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_gm
-- ----------------------------



-- ----------------------------
-- Table structure for `item_country_gn`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_gn`;
CREATE TABLE `item_country_gn` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_gn
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_gq`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_gq`;
CREATE TABLE `item_country_gq` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_gq
-- ----------------------------

-- ----------------------------
-- Table structure for `item_country_gw`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_gw`;
CREATE TABLE `item_country_gw` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_gw
-- ----------------------------

-- ----------------------------
-- Table structure for `item_country_hk`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_hk`;
CREATE TABLE `item_country_hk` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_hk
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_hu`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_hu`;
CREATE TABLE `item_country_hu` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_hu
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_in`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_in`;
CREATE TABLE `item_country_in` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_in
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_iq`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_iq`;
CREATE TABLE `item_country_iq` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_iq
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_ir`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_ir`;
CREATE TABLE `item_country_ir` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_ir
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_is`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_is`;
CREATE TABLE `item_country_is` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_is
-- ----------------------------

-- ----------------------------
-- Table structure for `item_country_it`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_it`;
CREATE TABLE `item_country_it` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_it
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_jm`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_jm`;
CREATE TABLE `item_country_jm` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_jm
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_jo`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_jo`;
CREATE TABLE `item_country_jo` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_jo
-- ----------------------------

-- ----------------------------
-- Table structure for `item_country_ke`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_ke`;
CREATE TABLE `item_country_ke` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_ke
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_kw`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_kw`;
CREATE TABLE `item_country_kw` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_kw
-- ----------------------------

-- ----------------------------
-- Table structure for `item_country_kz`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_kz`;
CREATE TABLE `item_country_kz` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_kz
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_lr`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_lr`;
CREATE TABLE `item_country_lr` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_lr
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_ly`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_ly`;
CREATE TABLE `item_country_ly` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_ly
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_mc`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_mc`;
CREATE TABLE `item_country_mc` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_mc
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_mo`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_mo`;
CREATE TABLE `item_country_mo` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_mo
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_mq`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_mq`;
CREATE TABLE `item_country_mq` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_mq
-- ----------------------------

-- ----------------------------
-- Table structure for `item_country_mr`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_mr`;
CREATE TABLE `item_country_mr` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_mr
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_mu`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_mu`;
CREATE TABLE `item_country_mu` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_mu
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_mw`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_mw`;
CREATE TABLE `item_country_mw` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_mw
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_ng`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_ng`;
CREATE TABLE `item_country_ng` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_ng
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_ot`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_ot`;
CREATE TABLE `item_country_ot` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_ot
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_pf`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_pf`;
CREATE TABLE `item_country_pf` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_pf
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_pt`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_pt`;
CREATE TABLE `item_country_pt` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_pt
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_rw`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_rw`;
CREATE TABLE `item_country_rw` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_rw
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_sa`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_sa`;
CREATE TABLE `item_country_sa` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_sa
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_so`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_so`;
CREATE TABLE `item_country_so` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_so
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_td`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_td`;
CREATE TABLE `item_country_td` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_td
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_tg`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_tg`;
CREATE TABLE `item_country_tg` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_tg
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_tj`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_tj`;
CREATE TABLE `item_country_tj` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_tj
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_tn`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_tn`;
CREATE TABLE `item_country_tn` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_tn
-- ----------------------------

-- ----------------------------
-- Table structure for `item_country_tr`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_tr`;
CREATE TABLE `item_country_tr` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_tr
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_tt`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_tt`;
CREATE TABLE `item_country_tt` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_tt
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_tw`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_tw`;
CREATE TABLE `item_country_tw` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_tw
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_tz`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_tz`;
CREATE TABLE `item_country_tz` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_tz
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_ug`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_ug`;
CREATE TABLE `item_country_ug` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_ug
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_us`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_us`;
CREATE TABLE `item_country_us` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_us
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_vg`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_vg`;
CREATE TABLE `item_country_vg` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_vg
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_vi`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_vi`;
CREATE TABLE `item_country_vi` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_vi
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_ws`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_ws`;
CREATE TABLE `item_country_ws` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_ws
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_za`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_za`;
CREATE TABLE `item_country_za` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_za
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_zm`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_zm`;
CREATE TABLE `item_country_zm` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_zm
-- ----------------------------


-- ----------------------------
-- Table structure for `item_country_zw`
-- ----------------------------
DROP TABLE IF EXISTS `item_country_zw`;
CREATE TABLE `item_country_zw` (
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_country_zw
-- ----------------------------


-- ----------------------------
-- Table structure for `item_feature_rank`
-- ----------------------------
DROP TABLE IF EXISTS `item_feature_rank`;
CREATE TABLE `item_feature_rank` (
  `featureType` varchar(50) NOT NULL,
  `itemID0` varchar(40) NOT NULL,
  `itemID1` varchar(40) NOT NULL,
  `itemID2` varchar(40) NOT NULL,
  `itemID3` varchar(40) NOT NULL,
  `itemID4` varchar(40) NOT NULL,
  PRIMARY KEY (`featureType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_feature_rank
-- ----------------------------
INSERT INTO `item_feature_rank` VALUES ('App', '', '', '', '', '');
INSERT INTO `item_feature_rank` VALUES ('Game', '', '', '', '', '');
INSERT INTO `item_feature_rank` VALUES ('Music', '', '', '', '', '');
INSERT INTO `item_feature_rank` VALUES ('Picture', '', '', '', '', '');
INSERT INTO `item_feature_rank` VALUES ('Video', '', '', '', '', '');

-- ----------------------------
-- Table structure for `item_home_rank`
-- ----------------------------
DROP TABLE IF EXISTS `item_home_rank`;
CREATE TABLE `item_home_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemID` varchar(40) NOT NULL,
  `rankID` int(11) NOT NULL,
  `sortV` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itemID` (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_home_rank
-- ----------------------------


-- ----------------------------
-- Table structure for `item_music`
-- ----------------------------
DROP TABLE IF EXISTS `item_music`;
CREATE TABLE `item_music` (
  `itemID` varchar(40) NOT NULL,
  `publicYear` varchar(20) DEFAULT NULL,
  `singer` varchar(250) DEFAULT NULL,
  `publicCountry` varchar(20) DEFAULT NULL,
  `lan` varchar(30) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_music
-- ----------------------------

-- ----------------------------
-- Table structure for `item_offline`
-- ----------------------------
DROP TABLE IF EXISTS `item_offline`;
CREATE TABLE `item_offline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` varchar(20) NOT NULL,
  `itemID` varchar(40) NOT NULL,
  `sortV` int(11) NOT NULL,
  `deviceType` varchar(20) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `ddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_offline
-- ----------------------------


-- ----------------------------
-- Table structure for `item_soft`
-- ----------------------------
DROP TABLE IF EXISTS `item_soft`;
CREATE TABLE `item_soft` (
  `itemID` varchar(40) NOT NULL,
  `versionCode` int(11) NOT NULL,
  `versionName` varchar(40) NOT NULL,
  `packageName` varchar(60) NOT NULL,
  `lan` varchar(30) NOT NULL,
  `img0` varchar(50) NOT NULL,
  `img1` varchar(50) NOT NULL,
  `img2` varchar(50) NOT NULL,
  `img3` varchar(50) NOT NULL,
  `img4` varchar(50) NOT NULL,
  `inSaleID` varchar(10) NOT NULL,
  `isLineUpdate` varchar(1) DEFAULT NULL,
  `isInSale` varchar(4) NOT NULL,
  PRIMARY KEY (`itemID`),
  KEY `inSaleID` (`inSaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_soft
-- ----------------------------

-- ----------------------------
-- Table structure for `item_statics`
-- ----------------------------
DROP TABLE IF EXISTS `item_statics`;
CREATE TABLE `item_statics` (
  `itemNum` varchar(40) NOT NULL,
  `downloadCount` int(11) NOT NULL DEFAULT '0',
  `star` int(11) NOT NULL DEFAULT '0',
  `allStar` int(11) NOT NULL DEFAULT '0',
  `starUserCount` int(11) NOT NULL DEFAULT '0',
  `commentCount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_statics
-- ----------------------------

-- ----------------------------
-- Table structure for `item_tag`
-- ----------------------------
DROP TABLE IF EXISTS `item_tag`;
CREATE TABLE `item_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemID` varchar(40) NOT NULL,
  `tagID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itemID` (`itemID`),
  KEY `tagID` (`tagID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_tag
-- ----------------------------


-- ----------------------------
-- Table structure for `item_video`
-- ----------------------------
DROP TABLE IF EXISTS `item_video`;
CREATE TABLE `item_video` (
  `itemID` varchar(40) NOT NULL,
  `img0` varchar(50) NOT NULL,
  `img1` varchar(50) NOT NULL,
  `img2` varchar(50) NOT NULL,
  `img3` varchar(50) NOT NULL,
  `img4` varchar(50) NOT NULL,
  `shortVideoID` varchar(40) NOT NULL,
  `publicYear` varchar(10) NOT NULL,
  `actor` varchar(200) NOT NULL,
  `director` varchar(200) NOT NULL,
  `publicCountry` varchar(10) NOT NULL,
  `lan` varchar(30) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_video
-- ----------------------------

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `managerID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `account` varchar(30) NOT NULL,
  `pw` varchar(40) NOT NULL,
  `role` varchar(20) NOT NULL,
  `des` varchar(100) DEFAULT NULL,
  `ddate` datetime NOT NULL,
  PRIMARY KEY (`managerID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', '超级管理人', 'admin', '96e79218965eb72c92a549dd5a330112', 'super', '超级管理人员，密码111111', '2014-08-21 11:39:15');
INSERT INTO `manager` VALUES ('2', '测试人员', 'test', '96e79218965eb72c92a549dd5a330112', 'tester', '测试人员，密码111111', '2014-08-28 14:42:16');

-- ----------------------------
-- Table structure for `rank`
-- ----------------------------
DROP TABLE IF EXISTS `rank`;
CREATE TABLE `rank` (
  `rankID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `rankType` varchar(10) NOT NULL,
  `sortV` int(11) NOT NULL,
  `rule` varchar(20) DEFAULT NULL,
  `category1` varchar(30) DEFAULT NULL,
  `category2` varchar(30) DEFAULT NULL,
  `adJson0` varchar(250) NOT NULL DEFAULT '{}',
  `adJson1` varchar(250) NOT NULL DEFAULT '{}',
  `adJson2` varchar(250) NOT NULL DEFAULT '{}',
  `adJson3` varchar(250) NOT NULL DEFAULT '{}',
  `adJson4` varchar(250) NOT NULL DEFAULT '{}',
  `ddate` datetime NOT NULL,
  PRIMARY KEY (`rankID`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of rank
-- ----------------------------
INSERT INTO `rank` VALUES ('100', 'Feature', 'HOME', '1', null, null, null, '{\"imgID\":\"413/f7020a8b323e425b88b00ea27e45f355.png\",\"isIner\":\"T\",\"args\":\"s_8dcd7349f13a45f0924bbce4a4206ae2\"}', '{\"imgID\":\"667/c7771d4bf6014bb8ae5ac04455e489b9.png\",\"isIner\":\"F\",\"args\":\"http://www.baidu.com\"}', '{\"imgID\":\"644/ec8bb6b1904e4c098fbee9e97a118c81.png\",\"isIner\":\"T\",\"args\":\"s_0ea24f0b37974a8884321923e1fba91c\"}', '{\"imgID\":\"410/9012ccb843594d6098e707805a9aac6c.png\",\"isIner\":\"F\",\"args\":\"http://www.baidu.com\"}', '{\"imgID\":\"256/183bc59b114042bfa0e29ece5ee27a28.png\",\"isIner\":\"T\",\"args\":\"d_1301da923c4e4707b10fe54a1f29328d\"}', '2014-08-21 11:28:19');
INSERT INTO `rank` VALUES ('101', 'Collection', 'HOME', '2', null, null, null, '{\"imgID\":\"640/3a2b854731564f1b8814a82919598347.png\",\"isIner\":\"T\",\"args\":\"d_355d2bf6969a47438b89279c88f6ff82\"}', '{\"imgID\":\"534/33883bbec7fa4bd095a7a507913a7afc.png\",\"isIner\":\"F\",\"args\":\"http://www.baidu.com\"}', '{\"imgID\":\"868/97c402696b824d8dbe8e7f7586722b54.png\",\"isIner\":\"T\",\"args\":\"d_a96f19b0982e42d685be6d8265824bcb\"}', '{\"imgID\":\"8/64d592fff5dc43358f2500d4e1300b0a.png\",\"isIner\":\"F\",\"args\":\"http://www.baidu.com\"}', '{\"imgID\":\"321/75f7d30dbb094a5d8b5ce2d49371b980.png\",\"isIner\":\"T\",\"args\":\"d_eeb4bc93831441bbb368004f4ccb0613\"}', '2014-08-21 11:28:19');

-- ----------------------------
-- Table structure for `sale_package_cp_in_sale`
-- ----------------------------
DROP TABLE IF EXISTS `sale_package_cp_in_sale`;
CREATE TABLE `sale_package_cp_in_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inSalePackageID` int(20) NOT NULL,
  `cpInSaleCode` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_package_cp_in_sale
-- ----------------------------

-- ----------------------------
-- Table structure for `search_music`
-- ----------------------------
DROP TABLE IF EXISTS `search_music`;
CREATE TABLE `search_music` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(255) NOT NULL,
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of search_music
-- ----------------------------

-- ----------------------------
-- Table structure for `search_picture`
-- ----------------------------
DROP TABLE IF EXISTS `search_picture`;
CREATE TABLE `search_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(255) NOT NULL,
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of search_picture
-- ----------------------------

-- ----------------------------
-- Table structure for `search_soft`
-- ----------------------------
DROP TABLE IF EXISTS `search_soft`;
CREATE TABLE `search_soft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(255) NOT NULL,
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of search_soft
-- ----------------------------

-- ----------------------------
-- Table structure for `search_video`
-- ----------------------------
DROP TABLE IF EXISTS `search_video`;
CREATE TABLE `search_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(255) NOT NULL,
  `itemID` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of search_video
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_msg`
-- ----------------------------
DROP TABLE IF EXISTS `sys_msg`;
CREATE TABLE `sys_msg` (
  `msgID` bigint(20) NOT NULL AUTO_INCREMENT,
  `cmd` varchar(30) NOT NULL,
  `imgID` varchar(50) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `extJson` varchar(200) DEFAULT NULL,
  `ddate` datetime NOT NULL,
  PRIMARY KEY (`msgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_msg
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_msg_country`
-- ----------------------------
DROP TABLE IF EXISTS `sys_msg_country`;
CREATE TABLE `sys_msg_country` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `msgID` bigint(20) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_msg_country
-- ----------------------------

-- ----------------------------
-- Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tagID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `category3` varchar(50) NOT NULL,
  `ddate` datetime NOT NULL,
  PRIMARY KEY (`tagID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------


-- ----------------------------
-- Table structure for `user_bg_img`
-- ----------------------------
DROP TABLE IF EXISTS `user_bg_img`;
CREATE TABLE `user_bg_img` (
  `bgID` int(11) NOT NULL AUTO_INCREMENT,
  `imgID` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `ddate` datetime NOT NULL,
  PRIMARY KEY (`bgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_bg_img
-- ----------------------------
-- 最后更新时间 2014/08/29 --
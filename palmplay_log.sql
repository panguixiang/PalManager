/*
Navicat MySQL Data Transfer

Source Server         : 172.17.2.83
Source Server Version : 50155
Source Host           : 172.17.2.83:3306
Source Database       : palmplay_log

Target Server Type    : MYSQL
Target Server Version : 50155
File Encoding         : 65001

Date: 2014-08-18 17:43:10
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `coin_trans`
-- ----------------------------
DROP TABLE IF EXISTS `coin_trans`;
CREATE TABLE `coin_trans` (
  `transID` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `transType` varchar(20) NOT NULL,
  `channel` varchar(30) NOT NULL,
  `pcoin` varchar(20) NOT NULL,
  `trans_id` varchar(40) NOT NULL,
  `trans_desc` varchar(40) DEFAULT NULL,
  `prize` float DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `args1` varchar(150) DEFAULT NULL,
  `args2` varchar(150) DEFAULT NULL,
  `ddate` datetime NOT NULL,
  PRIMARY KEY (`transID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coin_trans
-- ----------------------------

-- ----------------------------
-- Table structure for `device_reg`
-- ----------------------------
DROP TABLE IF EXISTS `device_reg`;
CREATE TABLE `device_reg` (
  `imei` varchar(20) NOT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) NOT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(30) NOT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `regDate` datetime NOT NULL,
  PRIMARY KEY (`imei`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_reg
-- ----------------------------

-- ----------------------------
-- Table structure for `download_click_2014_07`
-- ----------------------------
DROP TABLE IF EXISTS `download_click_2014_07`;
CREATE TABLE `download_click_2014_07` (
  `downloadID` varchar(60) NOT NULL,
  `itemID` varchar(40) NOT NULL,
  `itemNum` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category1` varchar(30) NOT NULL,
  `category2` varchar(30) NOT NULL,
  `category3` varchar(50) NOT NULL,
  `sourceSize` varchar(30) NOT NULL,
  `cpID` varchar(8) NOT NULL,
  `cpName` varchar(100) NOT NULL,
  `listDate` datetime NOT NULL,
  `versionCode` int(11) DEFAULT NULL,
  `versionName` varchar(40) DEFAULT NULL,
  `packageName` varchar(60) DEFAULT NULL,
  `isInSale` varchar(4) DEFAULT NULL,
  `inSaleID` varchar(10) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `netType` varchar(20) DEFAULT NULL,
  `channel` varchar(30) NOT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `fromPage` varchar(30) NOT NULL,
  `continueDownCount` int(11) NOT NULL,
  `clickDate` datetime NOT NULL,
  `isSetup` varchar(4) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`downloadID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of download_click_2014_07
-- ----------------------------

-- ----------------------------
-- Table structure for `download_click_2014_08`
-- ----------------------------
DROP TABLE IF EXISTS `download_click_2014_08`;
CREATE TABLE `download_click_2014_08` (
  `downloadID` varchar(60) NOT NULL,
  `itemID` varchar(40) NOT NULL,
  `itemNum` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category1` varchar(30) NOT NULL,
  `category2` varchar(30) NOT NULL,
  `category3` varchar(50) NOT NULL,
  `sourceSize` varchar(30) NOT NULL,
  `cpID` varchar(8) NOT NULL,
  `cpName` varchar(100) NOT NULL,
  `listDate` datetime NOT NULL,
  `versionCode` int(11) DEFAULT NULL,
  `versionName` varchar(40) DEFAULT NULL,
  `packageName` varchar(60) DEFAULT NULL,
  `isInSale` varchar(4) DEFAULT NULL,
  `inSaleID` varchar(10) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `netType` varchar(20) DEFAULT NULL,
  `channel` varchar(30) NOT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `fromPage` varchar(30) NOT NULL,
  `continueDownCount` int(11) NOT NULL,
  `clickDate` datetime NOT NULL,
  `isSetup` varchar(4) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`downloadID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of download_click_2014_08
-- ----------------------------

-- ----------------------------
-- Table structure for `download_finish_2014_07`
-- ----------------------------
DROP TABLE IF EXISTS `download_finish_2014_07`;
CREATE TABLE `download_finish_2014_07` (
  `downloadID` varchar(60) NOT NULL,
  `itemID` varchar(40) NOT NULL,
  `itemNum` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category1` varchar(30) NOT NULL,
  `category2` varchar(30) NOT NULL,
  `category3` varchar(50) NOT NULL,
  `sourceSize` varchar(30) NOT NULL,
  `cpID` varchar(8) NOT NULL,
  `cpName` varchar(100) NOT NULL,
  `listDate` datetime NOT NULL,
  `versionCode` int(11) DEFAULT NULL,
  `versionName` varchar(40) DEFAULT NULL,
  `packageName` varchar(60) DEFAULT NULL,
  `isInSale` varchar(4) DEFAULT NULL,
  `inSaleID` varchar(10) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `netType` varchar(20) DEFAULT NULL,
  `channel` varchar(30) NOT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `finishDate` datetime NOT NULL,
  `fromPage` varchar(30) NOT NULL,
  `continueDownCount` int(11) NOT NULL,
  PRIMARY KEY (`downloadID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of download_finish_2014_07
-- ----------------------------

-- ----------------------------
-- Table structure for `download_finish_2014_08`
-- ----------------------------
DROP TABLE IF EXISTS `download_finish_2014_08`;
CREATE TABLE `download_finish_2014_08` (
  `downloadID` varchar(60) NOT NULL,
  `itemID` varchar(40) NOT NULL,
  `itemNum` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category1` varchar(30) NOT NULL,
  `category2` varchar(30) NOT NULL,
  `category3` varchar(50) NOT NULL,
  `sourceSize` varchar(30) NOT NULL,
  `cpID` varchar(8) NOT NULL,
  `cpName` varchar(100) NOT NULL,
  `listDate` datetime NOT NULL,
  `versionCode` int(11) DEFAULT NULL,
  `versionName` varchar(40) DEFAULT NULL,
  `packageName` varchar(60) DEFAULT NULL,
  `isInSale` varchar(4) DEFAULT NULL,
  `inSaleID` varchar(10) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `netType` varchar(20) DEFAULT NULL,
  `channel` varchar(30) NOT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `finishDate` datetime NOT NULL,
  `fromPage` varchar(30) NOT NULL,
  `continueDownCount` int(11) NOT NULL,
  PRIMARY KEY (`downloadID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of download_finish_2014_08
-- ----------------------------

-- ----------------------------
-- Table structure for `download_offline`
-- ----------------------------
DROP TABLE IF EXISTS `download_offline`;
CREATE TABLE `download_offline` (
  `id` bigint(20) NOT NULL,
  `itemID` varchar(40) NOT NULL,
  `itemNum` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category1` varchar(30) NOT NULL,
  `category2` varchar(30) NOT NULL,
  `category3` varchar(50) NOT NULL,
  `sourceSize` varchar(30) NOT NULL,
  `cpID` varchar(8) NOT NULL,
  `cpName` varchar(100) NOT NULL,
  `listDate` datetime NOT NULL,
  `versionCode` int(11) DEFAULT NULL,
  `versionName` varchar(40) DEFAULT NULL,
  `packageName` varchar(60) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(40) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `netPort` varchar(20) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `downloadDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of download_offline
-- ----------------------------

-- ----------------------------
-- Table structure for `insale_callback_2014_07`
-- ----------------------------
DROP TABLE IF EXISTS `insale_callback_2014_07`;
CREATE TABLE `insale_callback_2014_07` (
  `itemID` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `itemNum` varchar(40) NOT NULL,
  `category1` varchar(30) NOT NULL,
  `category2` varchar(30) NOT NULL,
  `category3` varchar(50) NOT NULL,
  `sourceSize` varchar(20) NOT NULL,
  `cpID` varchar(8) NOT NULL,
  `cpName` varchar(100) NOT NULL,
  `listDate` datetime DEFAULT NULL,
  `versionCode` int(11) DEFAULT NULL,
  `versionName` varchar(40) DEFAULT NULL,
  `packageName` varchar(60) DEFAULT NULL,
  `isInSale` varchar(4) DEFAULT NULL,
  `inSaleID` varchar(10) DEFAULT NULL,
  `phone` varchar(16) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  `RMB` float NOT NULL,
  `USD` float NOT NULL,
  `saleDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of insale_callback_2014_07
-- ----------------------------

-- ----------------------------
-- Table structure for `insale_callback_2014_08`
-- ----------------------------
DROP TABLE IF EXISTS `insale_callback_2014_08`;
CREATE TABLE `insale_callback_2014_08` (
  `itemID` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `itemNum` varchar(40) NOT NULL,
  `category1` varchar(30) NOT NULL,
  `category2` varchar(30) NOT NULL,
  `category3` varchar(50) NOT NULL,
  `sourceSize` varchar(20) NOT NULL,
  `cpID` varchar(8) NOT NULL,
  `cpName` varchar(100) NOT NULL,
  `listDate` datetime DEFAULT NULL,
  `versionCode` int(11) DEFAULT NULL,
  `versionName` varchar(40) DEFAULT NULL,
  `packageName` varchar(60) DEFAULT NULL,
  `isInSale` varchar(4) DEFAULT NULL,
  `inSaleID` varchar(10) DEFAULT NULL,
  `phone` varchar(16) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  `RMB` float NOT NULL,
  `USD` float NOT NULL,
  `saleDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of insale_callback_2014_08
-- ----------------------------

-- ----------------------------
-- Table structure for `insale_callback_2014_09`
-- ----------------------------
DROP TABLE IF EXISTS `insale_callback_2014_09`;
CREATE TABLE `insale_callback_2014_09` (
  `itemID` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `itemNum` varchar(40) NOT NULL,
  `category1` varchar(30) NOT NULL,
  `category2` varchar(30) NOT NULL,
  `category3` varchar(50) NOT NULL,
  `sourceSize` varchar(20) NOT NULL,
  `cpID` varchar(8) NOT NULL,
  `cpName` varchar(100) NOT NULL,
  `listDate` datetime DEFAULT NULL,
  `versionCode` int(11) DEFAULT NULL,
  `versionName` varchar(40) DEFAULT NULL,
  `packageName` varchar(60) DEFAULT NULL,
  `isInSale` varchar(4) DEFAULT NULL,
  `inSaleID` varchar(10) DEFAULT NULL,
  `phone` varchar(16) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  `RMB` float NOT NULL,
  `USD` float NOT NULL,
  `saleDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of insale_callback_2014_09
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_date _base`
-- ----------------------------
DROP TABLE IF EXISTS `mid_date _base`;
CREATE TABLE `mid_date _base` (
  `countryCode` varchar(10) NOT NULL,
  `userCount` int(11) NOT NULL,
  `newUserCount` int(11) NOT NULL,
  `loginUserCount` int(11) NOT NULL,
  `regUserCount` int(11) NOT NULL,
  `newRegUserCount` int(11) NOT NULL,
  `downloadCount` int(11) NOT NULL,
  `downUserCount` int(11) NOT NULL,
  `saleCount` int(11) NOT NULL,
  `moCount` int(11) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_date _base
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_date_client_version`
-- ----------------------------
DROP TABLE IF EXISTS `mid_date_client_version`;
CREATE TABLE `mid_date_client_version` (
  `countryCode` varchar(10) NOT NULL,
  `versionCode` int(11) NOT NULL,
  `userCount` int(11) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_date_client_version
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_date_download_page`
-- ----------------------------
DROP TABLE IF EXISTS `mid_date_download_page`;
CREATE TABLE `mid_date_download_page` (
  `countryCode` varchar(10) NOT NULL,
  `fromPage` varchar(40) NOT NULL,
  `downloadCount` int(11) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_date_download_page
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_date_download_status`
-- ----------------------------
DROP TABLE IF EXISTS `mid_date_download_status`;
CREATE TABLE `mid_date_download_status` (
  `countryCode` varchar(10) NOT NULL,
  `clickDownloadCount` int(11) NOT NULL,
  `downloadCount` int(11) NOT NULL,
  `continueDownCount` int(11) NOT NULL,
  `cancelCount` int(11) NOT NULL,
  `setupCount` int(11) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_date_download_status
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_date_login`
-- ----------------------------
DROP TABLE IF EXISTS `mid_date_login`;
CREATE TABLE `mid_date_login` (
  `countryCode` varchar(10) NOT NULL,
  `loginUserCount` int(11) DEFAULT NULL,
  `loginCount` int(11) DEFAULT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_date_login
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_date_lose_user`
-- ----------------------------
DROP TABLE IF EXISTS `mid_date_lose_user`;
CREATE TABLE `mid_date_lose_user` (
  `countryCode` varchar(255) NOT NULL,
  `loseUserCount` int(11) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_date_lose_user
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_date_new_download`
-- ----------------------------
DROP TABLE IF EXISTS `mid_date_new_download`;
CREATE TABLE `mid_date_new_download` (
  `newUserDownCount` int(11) NOT NULL,
  `downloadCount` int(11) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_date_new_download
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_date_new_sale`
-- ----------------------------
DROP TABLE IF EXISTS `mid_date_new_sale`;
CREATE TABLE `mid_date_new_sale` (
  `countryCode` varchar(10) NOT NULL,
  `saleCount` int(11) NOT NULL,
  `RMB` float NOT NULL,
  `USD` float NOT NULL,
  `newSaleCount` int(11) NOT NULL,
  `newRMB` int(11) NOT NULL,
  `newUSD` int(11) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_date_new_sale
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_date_remain_user_30`
-- ----------------------------
DROP TABLE IF EXISTS `mid_date_remain_user_30`;
CREATE TABLE `mid_date_remain_user_30` (
  `countryCode` varchar(10) NOT NULL,
  `remainCount15` int(11) DEFAULT NULL,
  `remainCount30` int(11) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_date_remain_user_30
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_date_remain_user_7`
-- ----------------------------
DROP TABLE IF EXISTS `mid_date_remain_user_7`;
CREATE TABLE `mid_date_remain_user_7` (
  `countryCode` varchar(10) NOT NULL,
  `remainCount2` int(11) NOT NULL,
  `remainCount3` int(11) DEFAULT NULL,
  `remainCount4` int(11) DEFAULT NULL,
  `remainCount5` int(11) DEFAULT NULL,
  `remainCount6` int(11) DEFAULT NULL,
  `remainCount7` int(11) DEFAULT NULL,
  `remainCount15` int(11) DEFAULT NULL,
  `remainCount30` int(11) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_date_remain_user_7
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_date_sale`
-- ----------------------------
DROP TABLE IF EXISTS `mid_date_sale`;
CREATE TABLE `mid_date_sale` (
  `countryCode` varchar(16) NOT NULL,
  `saleCount` int(11) NOT NULL,
  `RMB` float NOT NULL,
  `USD` float NOT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_date_sale
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_date_user`
-- ----------------------------
DROP TABLE IF EXISTS `mid_date_user`;
CREATE TABLE `mid_date_user` (
  `countryCode` varchar(10) NOT NULL,
  `userCount` int(11) NOT NULL,
  `regUserCount` int(11) NOT NULL,
  `newUserCount` int(11) NOT NULL,
  `newRegUserCount` int(11) NOT NULL,
  `activityUserCount` int(11) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_date_user
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_date_user_page`
-- ----------------------------
DROP TABLE IF EXISTS `mid_date_user_page`;
CREATE TABLE `mid_date_user_page` (
  `countryCode` varchar(10) NOT NULL,
  `page` varchar(40) NOT NULL,
  `visiteCount` int(11) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_date_user_page
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_download_category`
-- ----------------------------
DROP TABLE IF EXISTS `mid_download_category`;
CREATE TABLE `mid_download_category` (
  `category1` varchar(30) NOT NULL,
  `category2` varchar(30) NOT NULL,
  `category3` varchar(50) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  `downloadCount` int(11) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_download_category
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_download_item_2014_07`
-- ----------------------------
DROP TABLE IF EXISTS `mid_download_item_2014_07`;
CREATE TABLE `mid_download_item_2014_07` (
  `itemID` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `itemNum` varchar(40) NOT NULL,
  `category1` varchar(30) NOT NULL,
  `category2` varchar(30) NOT NULL,
  `category3` varchar(50) NOT NULL,
  `sourceSize` varchar(20) NOT NULL,
  `cpID` varchar(8) NOT NULL,
  `cpName` varchar(100) NOT NULL,
  `versionCode` int(11) DEFAULT NULL,
  `versionName` varchar(40) DEFAULT NULL,
  `packageName` varchar(60) DEFAULT NULL,
  `countryCode` varchar(10) NOT NULL,
  `mccMnc` varchar(8) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `saleCount` int(11) NOT NULL,
  `downloadCount` int(11) NOT NULL,
  `RMB` float NOT NULL,
  `USD` float NOT NULL,
  `ddate` datetime NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_download_item_2014_07
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_download_item_2014_08`
-- ----------------------------
DROP TABLE IF EXISTS `mid_download_item_2014_08`;
CREATE TABLE `mid_download_item_2014_08` (
  `itemID` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `itemNum` varchar(40) NOT NULL,
  `category1` varchar(30) NOT NULL,
  `category2` varchar(30) NOT NULL,
  `category3` varchar(50) NOT NULL,
  `sourceSize` varchar(20) NOT NULL,
  `cpID` varchar(8) NOT NULL,
  `cpName` varchar(100) NOT NULL,
  `versionCode` int(11) DEFAULT NULL,
  `versionName` varchar(40) DEFAULT NULL,
  `packageName` varchar(60) DEFAULT NULL,
  `countryCode` varchar(10) NOT NULL,
  `mccMnc` varchar(8) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `saleCount` int(11) NOT NULL,
  `downloadCount` int(11) NOT NULL,
  `RMB` float NOT NULL,
  `USD` float NOT NULL,
  `ddate` datetime NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_download_item_2014_08
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_month _base`
-- ----------------------------
DROP TABLE IF EXISTS `mid_month _base`;
CREATE TABLE `mid_month _base` (
  `countryCode` varchar(10) NOT NULL,
  `userCount` int(11) NOT NULL,
  `newUserCount` int(11) NOT NULL,
  `loginUserCount` int(11) NOT NULL,
  `regUserCount` int(11) NOT NULL,
  `newRegUserCount` int(11) NOT NULL,
  `downloadCount` int(11) NOT NULL,
  `downUserCount` int(11) NOT NULL,
  `saleCount` int(11) NOT NULL,
  `moCount` int(11) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_month _base
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_month_activity_user`
-- ----------------------------
DROP TABLE IF EXISTS `mid_month_activity_user`;
CREATE TABLE `mid_month_activity_user` (
  `countryCode` varchar(10) NOT NULL,
  `activityCount` int(11) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `ddate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_month_activity_user
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_month_login`
-- ----------------------------
DROP TABLE IF EXISTS `mid_month_login`;
CREATE TABLE `mid_month_login` (
  `countryCode` varchar(10) NOT NULL,
  `loginUserCount` int(11) DEFAULT NULL,
  `loginCount` int(11) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_month_login
-- ----------------------------

-- ----------------------------
-- Table structure for `mid_month_lose_user`
-- ----------------------------
DROP TABLE IF EXISTS `mid_month_lose_user`;
CREATE TABLE `mid_month_lose_user` (
  `countryCode` varchar(10) NOT NULL,
  `loseUserCount` int(11) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_month_lose_user
-- ----------------------------

-- ----------------------------
-- Table structure for `offline_activate`
-- ----------------------------
DROP TABLE IF EXISTS `offline_activate`;
CREATE TABLE `offline_activate` (
  `id` bigint(20) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `itemID` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `itemNum` varchar(40) NOT NULL,
  `category1` varchar(30) NOT NULL,
  `category2` varchar(30) NOT NULL,
  `category3` varchar(50) NOT NULL,
  `sourceSize` varchar(30) NOT NULL,
  `cpID` varchar(8) NOT NULL,
  `cpName` varchar(100) NOT NULL,
  `listDate` datetime NOT NULL,
  `versionCode` int(11) DEFAULT NULL,
  `versionName` varchar(40) DEFAULT NULL,
  `packageName` varchar(60) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(40) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `netPort` varchar(20) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `coin` int(11) NOT NULL,
  `activateDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of offline_activate
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_07_26`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_07_26`;
CREATE TABLE `pv_2014_07_26` (
  `id` varchar(32) NOT NULL,
  `sessionID` varchar(40) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `imei` varchar(20) NOT NULL,
  `ua` varchar(300) NOT NULL,
  `imsi` varchar(20) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  `mccMnc` varchar(8) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_07_26
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_07_27`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_07_27`;
CREATE TABLE `pv_2014_07_27` (
  `id` varchar(32) NOT NULL,
  `sessionID` varchar(40) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `imei` varchar(20) NOT NULL,
  `ua` varchar(300) NOT NULL,
  `imsi` varchar(20) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  `mccMnc` varchar(8) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_07_27
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_07_28`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_07_28`;
CREATE TABLE `pv_2014_07_28` (
  `id` varchar(32) NOT NULL,
  `sessionID` varchar(40) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `imei` varchar(20) NOT NULL,
  `ua` varchar(300) NOT NULL,
  `imsi` varchar(20) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  `mccMnc` varchar(8) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_07_28
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_07_29`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_07_29`;
CREATE TABLE `pv_2014_07_29` (
  `id` varchar(32) NOT NULL,
  `sessionID` varchar(40) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `imei` varchar(20) NOT NULL,
  `ua` varchar(300) NOT NULL,
  `imsi` varchar(20) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  `mccMnc` varchar(8) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_07_29
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_07_30`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_07_30`;
CREATE TABLE `pv_2014_07_30` (
  `id` varchar(32) NOT NULL,
  `sessionID` varchar(40) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `imei` varchar(20) NOT NULL,
  `ua` varchar(300) NOT NULL,
  `imsi` varchar(20) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  `mccMnc` varchar(8) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_07_30
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_07_31`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_07_31`;
CREATE TABLE `pv_2014_07_31` (
  `id` varchar(32) NOT NULL,
  `sessionID` varchar(40) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `imei` varchar(20) NOT NULL,
  `ua` varchar(300) NOT NULL,
  `imsi` varchar(20) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  `mccMnc` varchar(8) NOT NULL,
  `channel` varchar(30) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_07_31
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_01`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_01`;
CREATE TABLE `pv_2014_08_01` (
  `id` varchar(32) NOT NULL,
  `sessionID` varchar(40) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `imei` varchar(20) NOT NULL,
  `ua` varchar(300) NOT NULL,
  `imsi` varchar(20) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  `mccMnc` varchar(8) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_01
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_02`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_02`;
CREATE TABLE `pv_2014_08_02` (
  `id` varchar(32) NOT NULL,
  `sessionID` varchar(40) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `imei` varchar(20) NOT NULL,
  `ua` varchar(300) NOT NULL,
  `imsi` varchar(20) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  `mccMnc` varchar(8) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_02
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_04`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_04`;
CREATE TABLE `pv_2014_08_04` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) NOT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_04
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_05`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_05`;
CREATE TABLE `pv_2014_08_05` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_05
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_06`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_06`;
CREATE TABLE `pv_2014_08_06` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_06
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_07`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_07`;
CREATE TABLE `pv_2014_08_07` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_07
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_08`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_08`;
CREATE TABLE `pv_2014_08_08` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_08
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_09`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_09`;
CREATE TABLE `pv_2014_08_09` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_09
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_10`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_10`;
CREATE TABLE `pv_2014_08_10` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_10
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_11`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_11`;
CREATE TABLE `pv_2014_08_11` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_11
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_12`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_12`;
CREATE TABLE `pv_2014_08_12` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_12
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_13`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_13`;
CREATE TABLE `pv_2014_08_13` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_13
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_14`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_14`;
CREATE TABLE `pv_2014_08_14` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_14
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_15`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_15`;
CREATE TABLE `pv_2014_08_15` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_15
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_16`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_16`;
CREATE TABLE `pv_2014_08_16` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_16
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_17`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_17`;
CREATE TABLE `pv_2014_08_17` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_17
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_18`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_18`;
CREATE TABLE `pv_2014_08_18` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_18
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_19`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_19`;
CREATE TABLE `pv_2014_08_19` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_19
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_20`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_20`;
CREATE TABLE `pv_2014_08_20` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_20
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_21`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_21`;
CREATE TABLE `pv_2014_08_21` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_21
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_22`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_22`;
CREATE TABLE `pv_2014_08_22` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_22
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_23`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_23`;
CREATE TABLE `pv_2014_08_23` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_23
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_24`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_24`;
CREATE TABLE `pv_2014_08_24` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_24
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_25`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_25`;
CREATE TABLE `pv_2014_08_25` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_25
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_26`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_26`;
CREATE TABLE `pv_2014_08_26` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_26
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_27`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_27`;
CREATE TABLE `pv_2014_08_27` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_27
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_28`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_28`;
CREATE TABLE `pv_2014_08_28` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_28
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_29`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_29`;
CREATE TABLE `pv_2014_08_29` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_29
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_30`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_30`;
CREATE TABLE `pv_2014_08_30` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_30
-- ----------------------------

-- ----------------------------
-- Table structure for `pv_2014_08_31`
-- ----------------------------
DROP TABLE IF EXISTS `pv_2014_08_31`;
CREATE TABLE `pv_2014_08_31` (
  `id` varchar(40) NOT NULL,
  `sessionID` varchar(40) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `netType` varchar(30) DEFAULT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `visiteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_2014_08_31
-- ----------------------------

-- ----------------------------
-- Table structure for `search_2014_07`
-- ----------------------------
DROP TABLE IF EXISTS `search_2014_07`;
CREATE TABLE `search_2014_07` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `searchContent` varchar(100) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `loginDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of search_2014_07
-- ----------------------------

-- ----------------------------
-- Table structure for `setup_2014_07`
-- ----------------------------
DROP TABLE IF EXISTS `setup_2014_07`;
CREATE TABLE `setup_2014_07` (
  `downloadID` varchar(60) NOT NULL,
  `itemID` varchar(40) NOT NULL,
  `itemNum` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category1` varchar(30) NOT NULL,
  `category2` varchar(30) NOT NULL,
  `category3` varchar(50) NOT NULL,
  `sourceSize` varchar(20) NOT NULL,
  `cpID` varchar(8) NOT NULL,
  `cpName` varchar(100) NOT NULL,
  `listDate` datetime NOT NULL,
  `versionCode` int(11) DEFAULT NULL,
  `versionName` varchar(40) DEFAULT NULL,
  `packageName` varchar(60) DEFAULT NULL,
  `isInSale` varchar(4) DEFAULT NULL,
  `inSaleID` varchar(10) DEFAULT NULL,
  `uid` bigint(20) NOT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `setupDate` datetime NOT NULL,
  PRIMARY KEY (`downloadID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of setup_2014_07
-- ----------------------------

-- ----------------------------
-- Table structure for `setup_2014_08`
-- ----------------------------
DROP TABLE IF EXISTS `setup_2014_08`;
CREATE TABLE `setup_2014_08` (
  `downloadID` varchar(60) NOT NULL,
  `itemID` varchar(40) NOT NULL,
  `itemNum` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category1` varchar(30) NOT NULL,
  `category2` varchar(30) NOT NULL,
  `category3` varchar(50) NOT NULL,
  `sourceSize` varchar(20) NOT NULL,
  `cpID` varchar(8) NOT NULL,
  `cpName` varchar(100) NOT NULL,
  `listDate` datetime NOT NULL,
  `versionCode` int(11) DEFAULT NULL,
  `versionName` varchar(40) DEFAULT NULL,
  `packageName` varchar(60) DEFAULT NULL,
  `isInSale` varchar(4) DEFAULT NULL,
  `inSaleID` varchar(10) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `setupDate` datetime NOT NULL,
  PRIMARY KEY (`downloadID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of setup_2014_08
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_msg_receive`
-- ----------------------------
DROP TABLE IF EXISTS `sys_msg_receive`;
CREATE TABLE `sys_msg_receive` (
  `msgID` bigint(20) NOT NULL,
  `imei` varchar(20) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_msg_receive
-- ----------------------------

-- ----------------------------
-- Table structure for `t_card_setup`
-- ----------------------------
DROP TABLE IF EXISTS `t_card_setup`;
CREATE TABLE `t_card_setup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `packageName` varchar(50) NOT NULL,
  `versionCode` int(11) NOT NULL,
  `ddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_card_setup
-- ----------------------------

-- ----------------------------
-- Table structure for `user_login_2014_07`
-- ----------------------------
DROP TABLE IF EXISTS `user_login_2014_07`;
CREATE TABLE `user_login_2014_07` (
  `id` varchar(32) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `imei` varchar(20) NOT NULL DEFAULT '',
  `ua` varchar(300) NOT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) NOT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `systemVersionCode` int(11) NOT NULL,
  `curClientVersionCode` int(11) NOT NULL,
  `loginDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_login_2014_07
-- ----------------------------

-- ----------------------------
-- Table structure for `user_login_2014_08`
-- ----------------------------
DROP TABLE IF EXISTS `user_login_2014_08`;
CREATE TABLE `user_login_2014_08` (
  `id` varchar(40) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `imei` varchar(20) NOT NULL DEFAULT '',
  `ua` varchar(300) NOT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) NOT NULL,
  `mccMnc` varchar(8) DEFAULT NULL,
  `channel` varchar(50) NOT NULL,
  `systemVersionCode` int(11) NOT NULL,
  `curClientVersionCode` int(11) NOT NULL,
  `loginDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_login_2014_08
-- ----------------------------

-- ----------------------------
-- Table structure for `user_reg`
-- ----------------------------
DROP TABLE IF EXISTS `user_reg`;
CREATE TABLE `user_reg` (
  `uid` bigint(20) NOT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `ua` varchar(300) DEFAULT NULL,
  `imsi` varchar(20) DEFAULT NULL,
  `countryCode` varchar(10) NOT NULL,
  `mccMnc` varchar(8) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `systemVersionCode` int(11) DEFAULT NULL,
  `curClientVersionCode` int(11) DEFAULT NULL,
  `regDate` datetime NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_reg
-- ----------------------------
-- MySQL dump 10.13  Distrib 5.5.62, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sams2db
-- ------------------------------------------------------
-- Server version	5.5.62-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_param`
--

DROP TABLE IF EXISTS `auth_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_param` (
  `s_auth` varchar(4) DEFAULT '',
  `s_param` varchar(50) DEFAULT '',
  `s_value` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cachesum`
--

DROP TABLE IF EXISTS `cachesum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cachesum` (
  `s_proxy_id` int(11) NOT NULL,
  `s_date` date NOT NULL DEFAULT '1980-01-01',
  `s_user` varchar(50) COLLATE utf8_bin NOT NULL,
  `s_domain` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `s_size` bigint(20) NOT NULL DEFAULT '0',
  `s_hit` bigint(20) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_cachesum` (`s_proxy_id`,`s_date`,`s_user`,`s_domain`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `d_link_r`
--

DROP TABLE IF EXISTS `d_link_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `d_link_r` (
  `s_pool_id` int(11) NOT NULL,
  `s_redirect_id` int(11) NOT NULL,
  `s_negative` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `d_link_s`
--

DROP TABLE IF EXISTS `d_link_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `d_link_s` (
  `s_pool_id` int(11) NOT NULL,
  `s_shablon_id` int(11) NOT NULL,
  `s_negative` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `d_link_t`
--

DROP TABLE IF EXISTS `d_link_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `d_link_t` (
  `s_pool_id` int(11) NOT NULL,
  `s_trange_id` int(11) NOT NULL,
  `s_negative` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delaypool`
--

DROP TABLE IF EXISTS `delaypool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delaypool` (
  `s_pool_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `s_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `s_class` int(11) NOT NULL,
  `s_agg1` int(11) NOT NULL DEFAULT '-1',
  `s_agg2` int(11) NOT NULL DEFAULT '-1',
  `s_net1` int(11) NOT NULL DEFAULT '-1',
  `s_net2` int(11) NOT NULL DEFAULT '-1',
  `s_ind1` int(11) NOT NULL DEFAULT '-1',
  `s_ind2` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`s_pool_id`),
  UNIQUE KEY `s_pool_id` (`s_pool_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passwd`
--

DROP TABLE IF EXISTS `passwd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passwd` (
  `s_user` varchar(25) COLLATE utf8_bin NOT NULL,
  `s_pass` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `s_access` int(11) DEFAULT '0',
  `s_autherrorc` smallint(6) DEFAULT '0',
  `s_autherrort` varchar(16) COLLATE utf8_bin DEFAULT '0',
  PRIMARY KEY (`s_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proxy`
--

DROP TABLE IF EXISTS `proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy` (
  `s_proxy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `s_description` varchar(100) COLLATE utf8_bin DEFAULT 'Proxy server',
  `s_endvalue` bigint(20) NOT NULL DEFAULT '0',
  `s_redirect_to` varchar(100) COLLATE utf8_bin DEFAULT 'http://your.ip.address/sams2/icon/classic/blank.gif',
  `s_denied_to` varchar(100) COLLATE utf8_bin DEFAULT 'http://your.ip.address/sams2/messages',
  `s_redirector` varchar(25) COLLATE utf8_bin DEFAULT 'NONE',
  `s_delaypool` smallint(6) DEFAULT '0',
  `s_auth` varchar(4) COLLATE utf8_bin DEFAULT 'ip',
  `s_wbinfopath` varchar(100) COLLATE utf8_bin DEFAULT '/usr/bin',
  `s_separator` varchar(15) COLLATE utf8_bin DEFAULT '+',
  `s_usedomain` smallint(6) DEFAULT '0',
  `s_bigd` smallint(6) DEFAULT '2',
  `s_bigu` smallint(6) DEFAULT '2',
  `s_sleep` int(11) DEFAULT '1',
  `s_parser` smallint(6) DEFAULT '0',
  `s_parser_time` int(11) DEFAULT '1',
  `s_count_clean` smallint(6) DEFAULT '0',
  `s_nameencode` smallint(6) DEFAULT '0',
  `s_realsize` varchar(4) COLLATE utf8_bin DEFAULT 'real',
  `s_checkdns` smallint(6) DEFAULT '0',
  `s_debuglevel` int(11) NOT NULL DEFAULT '0',
  `s_defaultdomain` varchar(25) COLLATE utf8_bin NOT NULL DEFAULT 'workgroup',
  `s_squidbase` int(11) NOT NULL DEFAULT '0',
  `s_udscript` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT 'NONE',
  `s_adminaddr` varchar(60) COLLATE utf8_bin NOT NULL DEFAULT 'root@localhost',
  `s_kbsize` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT '1024',
  `s_mbsize` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT '1048576',
  `s_ldapserver` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '0.0.0.0',
  `s_ldapbasedn` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'workgroup',
  `s_ldapuser` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'Administrator',
  `s_ldappasswd` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `s_ldapusergroup` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'Users',
  `s_autouser` int(11) NOT NULL DEFAULT '0',
  `s_autotpl` int(11) DEFAULT '0',
  `s_autogrp` int(11) DEFAULT '0',
  PRIMARY KEY (`s_proxy_id`),
  UNIQUE KEY `s_proxy_id` (`s_proxy_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reconfig`
--

DROP TABLE IF EXISTS `reconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reconfig` (
  `s_proxy_id` int(11) DEFAULT NULL,
  `s_service` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `s_action` varchar(10) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `redirect`
--

DROP TABLE IF EXISTS `redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirect` (
  `s_redirect_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `s_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `s_type` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `s_dest` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`s_redirect_id`),
  UNIQUE KEY `s_redirect_id` (`s_redirect_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `samslog`
--

DROP TABLE IF EXISTS `samslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `samslog` (
  `s_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `s_issuer` varchar(50) COLLATE utf8_bin NOT NULL,
  `s_date` date NOT NULL,
  `s_time` time NOT NULL,
  `s_value` varchar(60) COLLATE utf8_bin NOT NULL,
  `s_code` char(2) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`s_log_id`),
  UNIQUE KEY `s_log_id` (`s_log_id`),
  KEY `idx_samslog` (`s_code`,`s_issuer`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sconfig`
--

DROP TABLE IF EXISTS `sconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sconfig` (
  `s_shablon_id` int(11) DEFAULT NULL,
  `s_redirect_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sconfig_time`
--

DROP TABLE IF EXISTS `sconfig_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sconfig_time` (
  `s_shablon_id` int(11) DEFAULT NULL,
  `s_trange_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sgroup`
--

DROP TABLE IF EXISTS `sgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sgroup` (
  `s_group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `s_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`s_group_id`),
  UNIQUE KEY `s_group_id` (`s_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shablon`
--

DROP TABLE IF EXISTS `shablon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shablon` (
  `s_shablon_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `s_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `s_auth` varchar(4) COLLATE utf8_bin DEFAULT 'ip',
  `s_quote` int(11) DEFAULT '100',
  `s_period` varchar(3) COLLATE utf8_bin NOT NULL DEFAULT 'M',
  `s_clrdate` date NOT NULL DEFAULT '1980-01-01',
  `s_alldenied` smallint(6) NOT NULL DEFAULT '0',
  `s_shablon_id2` int(11) DEFAULT '-1',
  PRIMARY KEY (`s_shablon_id`),
  UNIQUE KEY `s_shablon_id` (`s_shablon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `squidcache`
--

DROP TABLE IF EXISTS `squidcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `squidcache` (
  `s_cache_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `s_proxy_id` int(11) DEFAULT NULL,
  `s_date` date NOT NULL DEFAULT '1980-01-01',
  `s_time` time NOT NULL DEFAULT '00:00:00',
  `s_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `s_domain` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `s_size` int(11) NOT NULL DEFAULT '0',
  `s_hit` int(11) NOT NULL DEFAULT '0',
  `s_ipaddr` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `s_period` int(11) NOT NULL DEFAULT '0',
  `s_method` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `s_url` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`s_cache_id`),
  UNIQUE KEY `s_cache_id` (`s_cache_id`),
  KEY `idx_squidcache` (`s_user`,`s_proxy_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12762 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `squiduser`
--

DROP TABLE IF EXISTS `squiduser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `squiduser` (
  `s_user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `s_group_id` int(11) DEFAULT NULL,
  `s_shablon_id` int(11) DEFAULT NULL,
  `s_nick` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `s_family` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `s_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `s_soname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `s_domain` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `s_quote` int(11) NOT NULL DEFAULT '0',
  `s_size` bigint(20) NOT NULL DEFAULT '0',
  `s_hit` bigint(20) NOT NULL DEFAULT '0',
  `s_enabled` smallint(6) DEFAULT NULL,
  `s_ip` char(15) COLLATE utf8_bin DEFAULT NULL,
  `s_passwd` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `s_gauditor` smallint(6) DEFAULT '0',
  `s_autherrorc` smallint(6) DEFAULT '0',
  `s_autherrort` varchar(16) COLLATE utf8_bin DEFAULT '0',
  `s_webaccess` varchar(16) COLLATE utf8_bin DEFAULT 'W',
  PRIMARY KEY (`s_user_id`),
  UNIQUE KEY `s_user_id` (`s_user_id`),
  KEY `idx_squiduser` (`s_nick`,`s_name`,`s_shablon_id`,`s_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sysinfo`
--

DROP TABLE IF EXISTS `sysinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysinfo` (
  `s_row_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `s_proxy_id` int(11) NOT NULL,
  `s_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `s_version` varchar(10) COLLATE utf8_bin NOT NULL,
  `s_author` varchar(30) COLLATE utf8_bin DEFAULT 'anonymous',
  `s_info` varchar(1024) COLLATE utf8_bin NOT NULL DEFAULT 'not available',
  `s_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `s_status` int(11) NOT NULL,
  PRIMARY KEY (`s_row_id`),
  UNIQUE KEY `s_row_id` (`s_row_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timerange`
--

DROP TABLE IF EXISTS `timerange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timerange` (
  `s_trange_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `s_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `s_days` varchar(14) COLLATE utf8_bin DEFAULT NULL,
  `s_timestart` time DEFAULT '00:00:00',
  `s_timeend` time DEFAULT '23:59:59',
  PRIMARY KEY (`s_trange_id`),
  UNIQUE KEY `s_trange_id` (`s_trange_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `url`
--

DROP TABLE IF EXISTS `url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url` (
  `s_url_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `s_redirect_id` int(11) DEFAULT NULL,
  `s_url` varchar(132) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`s_url_id`),
  UNIQUE KEY `s_url_id` (`s_url_id`),
  KEY `idx_url` (`s_redirect_id`,`s_url`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `websettings`
--

DROP TABLE IF EXISTS `websettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `websettings` (
  `s_lang` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT 'EN',
  `s_iconset` varchar(25) COLLATE utf8_bin NOT NULL DEFAULT 'classic',
  `s_useraccess` smallint(6) NOT NULL DEFAULT '1',
  `s_urlaccess` smallint(6) NOT NULL DEFAULT '1',
  `s_showutree` smallint(6) NOT NULL DEFAULT '1',
  `s_showname` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'nick',
  `s_showgraph` smallint(6) NOT NULL DEFAULT '0',
  `s_createpdf` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'NONE',
  `s_version` char(5) COLLATE utf8_bin NOT NULL DEFAULT '1.0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-19 18:29:42

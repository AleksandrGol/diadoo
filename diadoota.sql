-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 09, 2016 at 05:32 AM
-- Server version: 5.5.46-0ubuntu0.14.04.2
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `diadoota`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('Sysadmin', '1', 1450523132);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/*', 2, NULL, NULL, NULL, 1450522572, 1450522572),
('/admin/*', 2, NULL, NULL, NULL, 1450676216, 1450676216),
('/admin/assignment/*', 2, NULL, NULL, NULL, 1450522566, 1450522566),
('/admin/assignment/assign', 2, NULL, NULL, NULL, 1450522566, 1450522566),
('/admin/assignment/index', 2, NULL, NULL, NULL, 1450522566, 1450522566),
('/admin/assignment/role-search', 2, NULL, NULL, NULL, 1450522566, 1450522566),
('/admin/assignment/view', 2, NULL, NULL, NULL, 1450522566, 1450522566),
('/admin/default/*', 2, NULL, NULL, NULL, 1450522566, 1450522566),
('/admin/default/index', 2, NULL, NULL, NULL, 1450522566, 1450522566),
('/admin/menu/*', 2, NULL, NULL, NULL, 1450522566, 1450522566),
('/admin/menu/create', 2, NULL, NULL, NULL, 1450522566, 1450522566),
('/admin/menu/delete', 2, NULL, NULL, NULL, 1450522566, 1450522566),
('/admin/menu/index', 2, NULL, NULL, NULL, 1450522566, 1450522566),
('/admin/menu/update', 2, NULL, NULL, NULL, 1450522566, 1450522566),
('/admin/menu/view', 2, NULL, NULL, NULL, 1450522566, 1450522566),
('/admin/permission/*', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/permission/assign', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/permission/create', 2, NULL, NULL, NULL, 1450522566, 1450522566),
('/admin/permission/delete', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/permission/index', 2, NULL, NULL, NULL, 1450522566, 1450522566),
('/admin/permission/role-search', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/permission/update', 2, NULL, NULL, NULL, 1450522566, 1450522566),
('/admin/permission/view', 2, NULL, NULL, NULL, 1450522566, 1450522566),
('/admin/role/*', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/role/assign', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/role/create', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/role/delete', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/role/index', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/role/role-search', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/role/update', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/role/view', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/route/*', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/route/assign', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/route/create', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/route/index', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/route/route-search', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/rule/*', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/rule/create', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/rule/delete', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/rule/index', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/rule/update', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/admin/rule/view', 2, NULL, NULL, NULL, 1450522567, 1450522567),
('/category/*', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/category/create', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/category/delete', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/category/index', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/category/toggle', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/category/update', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/category/view', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/city/*', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/city/create', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/city/delete', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/city/index', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/city/toggle', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/city/update', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/city/view', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/country/*', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/country/create', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/country/delete', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/country/index', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/country/toggle', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/country/update', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/country/view', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/debug/*', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/debug/default/*', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/debug/default/db-explain', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/debug/default/download-mail', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/debug/default/index', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/debug/default/toolbar', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/debug/default/view', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/dependent/*', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/dependent/getcity', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/dependent/getregion', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/gii/*', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/gii/default/*', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/gii/default/action', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/gii/default/diff', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/gii/default/index', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/gii/default/preview', 2, NULL, NULL, NULL, 1450522570, 1450522570),
('/gii/default/view', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/icon-docs/*', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/icon-docs/index', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/main-category/*', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/main-category/create', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/main-category/delete', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/main-category/index', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/main-category/toggle', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/main-category/update', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/main-category/view', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/region/*', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/region/create', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/region/delete', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/region/index', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/region/toggle', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/region/update', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/region/view', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/site/*', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/site/error', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/site/index', 2, NULL, NULL, NULL, 1450522571, 1450522571),
('/subject-report/*', 2, NULL, NULL, NULL, 1450522572, 1450522572),
('/subject-report/create', 2, NULL, NULL, NULL, 1450522572, 1450522572),
('/subject-report/delete', 2, NULL, NULL, NULL, 1450522572, 1450522572),
('/subject-report/index', 2, NULL, NULL, NULL, 1450522572, 1450522572),
('/subject-report/toggle', 2, NULL, NULL, NULL, 1450522572, 1450522572),
('/subject-report/update', 2, NULL, NULL, NULL, 1450522572, 1450522572),
('/subject-report/view', 2, NULL, NULL, NULL, 1450522572, 1450522572),
('/user/*', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/user/admin/*', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/user/admin/assignments', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/user/admin/block', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/user/admin/confirm', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/user/admin/create', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/user/admin/delete', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/user/admin/deleteimg', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/user/admin/index', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/user/admin/info', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/user/admin/update', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/user/admin/update-profile', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/profile/*', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/user/profile/index', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/user/profile/show', 2, NULL, NULL, NULL, 1450522569, 1450522569),
('/user/recovery/*', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/recovery/request', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/recovery/reset', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/registration/*', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/registration/confirm', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/registration/connect', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/registration/register', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/registration/resend', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/security/*', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/security/auth', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/security/login', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/security/logout', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/settings/*', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/settings/account', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/settings/confirm', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/settings/deleteimg', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/settings/disconnect', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/settings/help', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/settings/networks', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('/user/settings/profile', 2, NULL, NULL, NULL, 1450522568, 1450522568),
('Sysadmin', 1, 'AllController', NULL, NULL, 1450522609, 1450522630);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('Sysadmin', '/*'),
('Sysadmin', '/admin/assignment/*'),
('Sysadmin', '/admin/assignment/assign'),
('Sysadmin', '/admin/assignment/index'),
('Sysadmin', '/admin/assignment/role-search'),
('Sysadmin', '/admin/assignment/view'),
('Sysadmin', '/admin/default/*'),
('Sysadmin', '/admin/default/index'),
('Sysadmin', '/admin/menu/*'),
('Sysadmin', '/admin/menu/create'),
('Sysadmin', '/admin/menu/delete'),
('Sysadmin', '/admin/menu/index'),
('Sysadmin', '/admin/menu/update'),
('Sysadmin', '/admin/menu/view'),
('Sysadmin', '/admin/permission/*'),
('Sysadmin', '/admin/permission/assign'),
('Sysadmin', '/admin/permission/create'),
('Sysadmin', '/admin/permission/delete'),
('Sysadmin', '/admin/permission/index'),
('Sysadmin', '/admin/permission/role-search'),
('Sysadmin', '/admin/permission/update'),
('Sysadmin', '/admin/permission/view'),
('Sysadmin', '/admin/role/*'),
('Sysadmin', '/admin/role/assign'),
('Sysadmin', '/admin/role/create'),
('Sysadmin', '/admin/role/delete'),
('Sysadmin', '/admin/role/index'),
('Sysadmin', '/admin/role/role-search'),
('Sysadmin', '/admin/role/update'),
('Sysadmin', '/admin/role/view'),
('Sysadmin', '/admin/route/*'),
('Sysadmin', '/admin/route/assign'),
('Sysadmin', '/admin/route/create'),
('Sysadmin', '/admin/route/index'),
('Sysadmin', '/admin/route/route-search'),
('Sysadmin', '/admin/rule/*'),
('Sysadmin', '/admin/rule/create'),
('Sysadmin', '/admin/rule/delete'),
('Sysadmin', '/admin/rule/index'),
('Sysadmin', '/admin/rule/update'),
('Sysadmin', '/admin/rule/view'),
('Sysadmin', '/category/*'),
('Sysadmin', '/category/create'),
('Sysadmin', '/category/delete'),
('Sysadmin', '/category/index'),
('Sysadmin', '/category/toggle'),
('Sysadmin', '/category/update'),
('Sysadmin', '/category/view'),
('Sysadmin', '/city/*'),
('Sysadmin', '/city/create'),
('Sysadmin', '/city/delete'),
('Sysadmin', '/city/index'),
('Sysadmin', '/city/toggle'),
('Sysadmin', '/city/update'),
('Sysadmin', '/city/view'),
('Sysadmin', '/country/*'),
('Sysadmin', '/country/create'),
('Sysadmin', '/country/delete'),
('Sysadmin', '/country/index'),
('Sysadmin', '/country/toggle'),
('Sysadmin', '/country/update'),
('Sysadmin', '/country/view'),
('Sysadmin', '/debug/*'),
('Sysadmin', '/debug/default/*'),
('Sysadmin', '/debug/default/db-explain'),
('Sysadmin', '/debug/default/download-mail'),
('Sysadmin', '/debug/default/index'),
('Sysadmin', '/debug/default/toolbar'),
('Sysadmin', '/debug/default/view'),
('Sysadmin', '/dependent/*'),
('Sysadmin', '/dependent/getcity'),
('Sysadmin', '/dependent/getregion'),
('Sysadmin', '/gii/*'),
('Sysadmin', '/gii/default/*'),
('Sysadmin', '/gii/default/action'),
('Sysadmin', '/gii/default/diff'),
('Sysadmin', '/gii/default/index'),
('Sysadmin', '/gii/default/preview'),
('Sysadmin', '/gii/default/view'),
('Sysadmin', '/icon-docs/*'),
('Sysadmin', '/icon-docs/index'),
('Sysadmin', '/main-category/*'),
('Sysadmin', '/main-category/create'),
('Sysadmin', '/main-category/delete'),
('Sysadmin', '/main-category/index'),
('Sysadmin', '/main-category/toggle'),
('Sysadmin', '/main-category/update'),
('Sysadmin', '/main-category/view'),
('Sysadmin', '/region/*'),
('Sysadmin', '/region/create'),
('Sysadmin', '/region/delete'),
('Sysadmin', '/region/index'),
('Sysadmin', '/region/toggle'),
('Sysadmin', '/region/update'),
('Sysadmin', '/region/view'),
('Sysadmin', '/site/*'),
('Sysadmin', '/site/error'),
('Sysadmin', '/site/index'),
('Sysadmin', '/subject-report/*'),
('Sysadmin', '/subject-report/create'),
('Sysadmin', '/subject-report/delete'),
('Sysadmin', '/subject-report/index'),
('Sysadmin', '/subject-report/toggle'),
('Sysadmin', '/subject-report/update'),
('Sysadmin', '/subject-report/view'),
('Sysadmin', '/user/*'),
('Sysadmin', '/user/admin/*'),
('Sysadmin', '/user/admin/assignments'),
('Sysadmin', '/user/admin/block'),
('Sysadmin', '/user/admin/confirm'),
('Sysadmin', '/user/admin/create'),
('Sysadmin', '/user/admin/delete'),
('Sysadmin', '/user/admin/deleteimg'),
('Sysadmin', '/user/admin/index'),
('Sysadmin', '/user/admin/info'),
('Sysadmin', '/user/admin/update'),
('Sysadmin', '/user/admin/update-profile'),
('Sysadmin', '/user/profile/*'),
('Sysadmin', '/user/profile/index'),
('Sysadmin', '/user/profile/show'),
('Sysadmin', '/user/recovery/*'),
('Sysadmin', '/user/recovery/request'),
('Sysadmin', '/user/recovery/reset'),
('Sysadmin', '/user/registration/*'),
('Sysadmin', '/user/registration/confirm'),
('Sysadmin', '/user/registration/connect'),
('Sysadmin', '/user/registration/register'),
('Sysadmin', '/user/registration/resend'),
('Sysadmin', '/user/security/*'),
('Sysadmin', '/user/security/auth'),
('Sysadmin', '/user/security/login'),
('Sysadmin', '/user/security/logout'),
('Sysadmin', '/user/settings/*'),
('Sysadmin', '/user/settings/account'),
('Sysadmin', '/user/settings/confirm'),
('Sysadmin', '/user/settings/deleteimg'),
('Sysadmin', '/user/settings/disconnect'),
('Sysadmin', '/user/settings/help'),
('Sysadmin', '/user/settings/networks'),
('Sysadmin', '/user/settings/profile');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  `main_category_id` int(11) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `is_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `main_category_id`, `create_at`, `update_at`, `is_status`) VALUES
(8, 'Mobil Bekas', 6, '2015-12-18 17:46:10', '2015-12-18 17:46:10', 1),
(9, 'Aksesoris', 6, '2015-12-18 17:46:47', '2015-12-18 17:48:40', 1),
(10, 'Audio Mobil', 6, '2015-12-18 17:47:12', '2015-12-18 17:47:12', 1),
(11, 'Sparepart', 6, '2015-12-18 17:47:27', '2015-12-18 17:47:27', 0),
(12, 'Velg dan Ban', 6, '2015-12-18 17:47:38', '2015-12-18 17:47:38', 1),
(13, 'Motor Bekas', 7, '2015-12-18 17:48:00', '2015-12-18 17:48:00', 1),
(14, 'Aksesoris', 7, '2015-12-18 17:48:33', '2015-12-18 17:48:33', 1),
(15, 'Helm', 7, '2015-12-18 17:48:55', '2015-12-18 17:48:55', 1),
(16, 'Sparepart', 7, '2015-12-18 17:49:04', '2015-12-18 17:49:04', 1),
(17, 'Rumah', 8, '2015-12-18 17:49:26', '2015-12-18 17:49:26', 1),
(18, 'Apartment', 8, '2015-12-18 17:49:38', '2015-12-18 17:49:38', 1),
(19, 'Tanah', 8, '2015-12-18 17:49:54', '2015-12-18 17:49:54', 1),
(20, 'Fashion Wanita', 9, '2015-12-18 17:50:10', '2015-12-18 17:50:10', 1),
(21, 'Fashion Pria', 9, '2015-12-18 17:50:21', '2015-12-18 17:50:21', 1),
(22, 'Jam Tangan', 9, '2015-12-18 17:50:40', '2015-12-18 17:50:40', 1),
(23, 'Pakaian Olahraga', 9, '2015-12-18 17:50:55', '2015-12-18 17:50:55', 1),
(24, 'Perhiasan', 9, '2015-12-18 17:51:08', '2015-12-18 17:51:08', 1),
(25, 'Make Up & Parfum', 9, '2015-12-18 17:51:19', '2015-12-18 17:51:19', 1),
(26, 'Handphone', 10, '2015-12-18 17:52:11', '2015-12-18 17:52:11', 1),
(27, 'Tablet', 10, '2015-12-18 17:52:30', '2015-12-18 17:52:30', 1),
(28, 'Aksesoris HP & Tablet', 10, '2015-12-18 17:52:53', '2015-12-18 17:52:53', 1),
(29, 'Elektronik Rumah Tangga', 10, '2015-12-18 17:53:09', '2015-12-18 17:53:09', 1),
(30, 'TV & Audio, Video', 10, '2015-12-18 17:53:30', '2015-12-18 17:53:30', 1),
(31, 'Alat-alat Musik', 11, '2015-12-18 17:54:51', '2015-12-18 17:54:51', 1),
(32, 'Olahraga', 11, '2015-12-18 17:55:16', '2015-12-18 17:55:16', 1),
(33, 'Sepeda & Aksesoris', 11, '2015-12-18 17:55:34', '2015-12-18 17:55:34', 1),
(34, 'Hewan Peliharaan', 11, '2015-12-18 17:55:57', '2015-12-18 17:55:57', 1),
(35, 'Mainan Hobi', 11, '2015-12-18 17:56:10', '2015-12-18 17:56:10', 1),
(36, 'Buku & Majalah', 11, '2015-12-18 17:56:25', '2015-12-18 17:56:25', 1),
(37, 'Makanan & Minuman', 12, '2015-12-18 17:56:52', '2015-12-18 17:56:52', 1),
(38, 'Furniture', 12, '2015-12-18 17:57:13', '2015-12-18 17:57:13', 1),
(39, 'Dekorasi Rumah', 12, '2015-12-18 17:57:23', '2015-12-18 17:57:23', 1),
(40, 'Jam', 12, '2015-12-18 17:57:44', '2015-12-18 17:57:44', 1),
(41, 'Lampu', 12, '2015-12-18 17:57:52', '2015-12-18 17:57:52', 1),
(42, 'Pakaian', 13, '2015-12-18 17:58:13', '2015-12-18 17:58:13', 1),
(43, 'Perlengkapan Bayi', 13, '2015-12-18 17:58:20', '2015-12-18 17:58:20', 1),
(44, 'Perlengkapan Ibu Bayi', 13, '2015-12-18 17:58:32', '2015-12-18 17:58:32', 1),
(45, 'Buku Anak-Anak', 13, '2015-12-18 17:58:44', '2015-12-18 17:58:44', 1),
(46, 'Peralatan Kantor', 14, '2015-12-18 17:59:01', '2015-12-18 17:59:01', 1),
(47, 'Perlengkapan Usaha', 14, '2015-12-18 17:59:12', '2015-12-18 17:59:12', 1),
(48, 'Mesin & Keperluan Industri', 14, '2015-12-18 17:59:25', '2015-12-18 17:59:25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `region_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `is_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `city`, `region_id`, `country_id`, `create_at`, `update_at`, `is_status`) VALUES
(7, 'Bandung', 10, 8, '2015-12-18 15:53:49', '2015-12-18 15:53:49', 1),
(8, 'Batu', 10, 8, '2015-12-18 15:54:04', '2015-12-18 15:54:04', 1),
(9, 'Bekasi', 10, 8, '2015-12-18 15:54:41', '2015-12-18 15:54:41', 1),
(10, 'Blitar', 10, 8, '2015-12-18 15:54:51', '2015-12-18 15:54:51', 1),
(11, 'Bogor', 10, 8, '2015-12-18 15:55:00', '2015-12-18 15:55:00', 1),
(12, 'Cianjur', 10, 8, '2015-12-18 16:13:00', '2015-12-18 16:13:00', 1),
(13, 'Cilegon', 10, 8, '2015-12-18 16:13:28', '2015-12-18 16:13:28', 1),
(14, 'Cimahi', 10, 8, '2015-12-18 16:18:20', '2015-12-18 16:18:20', 1),
(15, 'Jakarta', 10, 8, '2015-12-18 16:18:33', '2015-12-18 16:18:33', 1),
(16, 'Semarang', 10, 8, '2015-12-18 16:18:44', '2015-12-18 16:18:44', 1),
(17, 'Surabaya', 10, 8, '2015-12-18 16:18:55', '2015-12-18 16:18:55', 1),
(18, 'Yogyakarta', 10, 8, '2015-12-18 16:19:07', '2015-12-18 16:19:07', 1),
(19, 'Balikpapan', 11, 8, '2015-12-18 16:19:20', '2015-12-18 16:19:20', 1),
(20, 'Banjarmasin', 11, 8, '2015-12-18 16:19:31', '2015-12-18 16:19:31', 1),
(21, 'Samarinda', 11, 8, '2015-12-18 16:19:44', '2015-12-18 16:19:44', 1),
(22, 'Singkawang', 11, 8, '2015-12-18 16:19:57', '2015-12-18 16:19:57', 1),
(23, 'Ambon', 13, 8, '2015-12-18 16:20:10', '2015-12-18 16:20:10', 1),
(24, 'Tual', 13, 8, '2015-12-18 16:20:21', '2015-12-18 16:20:21', 1),
(25, 'Ternate', 13, 8, '2015-12-18 16:20:34', '2015-12-18 16:20:34', 1),
(26, 'Tidore', 13, 8, '2015-12-18 16:20:43', '2015-12-18 16:20:43', 1),
(27, 'Jayapura', 14, 8, '2015-12-18 16:20:59', '2015-12-18 16:20:59', 1),
(28, 'Merauke', 14, 8, '2015-12-18 16:21:10', '2015-12-18 16:21:10', 1),
(29, 'Bau-Bau', 12, 8, '2015-12-18 16:21:20', '2015-12-18 16:21:20', 1),
(30, 'Gorontalo', 12, 8, '2015-12-18 16:21:29', '2015-12-18 16:21:29', 1),
(31, 'Makassar', 12, 8, '2015-12-18 16:21:40', '2015-12-18 16:21:40', 1),
(32, 'Banda Aceh', 9, 8, '2015-12-18 16:21:51', '2015-12-18 16:21:51', 1),
(33, 'Bandar Lampung', 9, 8, '2015-12-18 16:22:04', '2015-12-18 16:22:04', 1),
(34, 'Bengkulu', 9, 8, '2015-12-18 16:22:12', '2015-12-18 16:22:12', 1),
(35, 'Shah Alam', 20, 9, '2015-12-18 16:23:45', '2015-12-18 16:23:45', 0),
(36, 'Petaling Jaya', 20, 9, '2015-12-18 16:23:55', '2015-12-18 16:23:55', 0),
(37, 'Kuching', 28, 9, '2015-12-18 16:24:10', '2015-12-18 16:24:10', 0),
(38, 'George Town', 16, 9, '2015-12-18 16:24:20', '2015-12-18 16:24:20', 0),
(39, 'Kota Kinabalu', 27, 9, '2015-12-18 16:24:41', '2015-12-18 16:24:41', 0),
(40, 'Kuala Terengganu', 24, 9, '2015-12-18 16:24:58', '2015-12-18 16:24:58', 0),
(41, 'Malacca City', 22, 9, '2015-12-18 16:25:13', '2015-12-18 16:25:13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `classified`
--

CREATE TABLE IF NOT EXISTS `classified` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `main_category_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `price` int(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_status` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=225 ;

--
-- Dumping data for table `classified`
--

INSERT INTO `classified` (`id`, `title`, `description`, `main_category_id`, `category_id`, `country_id`, `region_id`, `city_id`, `price`, `create_at`, `update_at`, `user_id`, `is_status`, `type`) VALUES
(193, 'Kijang Innova V Bensin 2014 Luxury', 'Kijang Innova V Bensin 2014 Luxury TERMURAH !!\r\n\r\nMobil bersih , rapi ,terawat , bebas banjir , tidak pernah tabrakan.\r\nLow KM , mobil siap pakai .\r\nservice record . bisa di periksa di bengkel resmi\r\n\r\n* Tgn 1 dari baru\r\n* KM 19rban\r\n* TV 2\r\n* Pjk bln 4\r\n* Siap pakai\r\n* Good condition\r\n* Service record lengkap\r\n\r\nOTR : 235.000.000\r\nTDP : 82jt-an\r\nAngs: 4jt-an ( 5th allrisk )\r\n\r\nTDP : 67jt-an\r\nAngs: 4jt-an ( 5th Kombinasi )\r\n\r\n*Total DP sudah termasuk dp murni , angsuran pertama , asuransi , dan Assuransi jiwa.\r\n*Proses kredit mudah , data bisa di bantu.\r\n*Terima tukar tambah\r\n\r\nSegera hubungi :\r\n\r\nNATAL TETAP BUKA\r\n\r\nJoni - 0821.2555.8888\r\nPin BB : 51C568F8\r\n\r\nWTC Mangga Dua Lt 5 no 505 \r\nJG Motor', 6, 8, 8, 9, 32, 235000000, '2015-12-31 04:32:40', '2015-12-31 04:32:40', 1131805087, 1, 0),
(194, 'Vw GOLF GTI mk5 2008', 'dijual VW GOLF GTI MK5 2008\r\n\r\n* Odo 66.000 on going\r\n* Brake liner RACING\r\n* Brake PAds racing\r\n* Stage 1 by CK mortosport\r\n* 300HP\r\n* Leather seat\r\n* Velg ori, ban toyo\r\n* Knalpot by ABT\r\n* Service record vw PIK\r\n* mobil tinggal pakai\r\n\r\nKhusus untuk pencinta GOLF tinggal nikamti sensasi tenaga GOLF....\r\n\r\nsegera kunjungin SHOWROM ABBA cars bursa mobil WTC mangga dua lantai 3 no.10\r\n\r\nMobil dijamin tidak bekas tabrakan dan tidak kebanjiran, dan jaminan keaslian BPKB dan dokumen lainnya.', 6, 8, 8, 10, 7, 285000000, '2015-12-31 04:35:32', '2015-12-31 04:35:32', 1161061630, 1, 0),
(195, 'Bmw 318i hitam 2001', 'Bissmilah..\r\n\r\nSaya mau jual mobil kesayangan saya bmw 318i AT warna hitam tahun 2001 dengan spek berikut :\r\n\r\n1. Buljoen baru depan kiri kanan\r\n2. Ac dingin\r\n3. Front bumper like camaro\r\n4. Lampu nyala semua\r\n5. Aki baru\r\n6. Filter udara baru\r\n7. Shock empuk\r\n8. Foglamp kotak\r\n9. Power window depan kiri baru\r\n10. Kelistrikan gk masalah\r\n11. Matic joss\r\n12. Busi baru\r\n14. Ducktail belakang custom\r\n15. Interior woodpanell bawaan asli\r\n\r\nMinus :\r\n1. Pajak mati, kalo mau diperpanjang bisa kok..\r\n2. Tombol lampu buat naik turunin lampu utama gak fungsi\r\n4. Seal klep oli bocor dikit, emang itu penyakitnya jd jangan heran sm e46, bisa diganti kok\r\n5. Tombol power window belakang sebelah kiri hilang gara gara ditekan sama ibu saya kekencengan\r\n\r\nSaya beli mobil ini tangan kedua , jadi belum balik nama.. Kalo mau balik nama nanti bisa dibantuin.. Saya pemakai bukan pedagang..\r\n\r\nMinat serius langsung telfon aja, sms gak dibales.. Open price 100jt nego..\r\nMakasih udah mampir..', 6, 8, 8, 9, 32, 95000000, '2015-12-31 04:38:52', '2015-12-31 04:38:52', 1137670422, 1, 0),
(196, 'CRV 2.4 Silver 2008 istinewa', 'Jok kulit\r\nKaki2 oke\r\nSurat2 lengkap\r\nSiap pakai\r\n\r\nminat..??\r\nPliiss...dehh...jangan tanya harga nett\r\nlangsung aja datang ke TKP !!!!\r\ntawar langsung sampai jadi\r\n\r\nDIAN MOTOR\r\nJl.pahlawan revolusi no.6a\r\nPondok bambu\r\nJakarta Timur\r\n13430\r\nSamping BKT/depan indomaret plus\r\nGooglemap + streetview : http://goo.gl/maps/0d9T7\r\n\r\nWhatsapp 081219950220 (no sms)\r\nCall only 087880805262 (no sms)', 6, 8, 8, 11, 19, 178900000, '2015-12-31 04:40:59', '2015-12-31 04:40:59', 1126611291, 1, 0),
(197, 'Captiva disel AT 2008 hitam', 'Jok kulit\r\nTv dvd\r\nTv headrest\r\nMatic responsif\r\n\r\njangan tanya harga nett, minat..??\r\nlangsung datang ke TKP\r\ntawar langsung sampai jadi\r\n\r\nDIAN MOTOR\r\nJl.pahlawan revolusi no.6a\r\nPondok bambu\r\nJakarta Timur\r\n13430\r\nSamping BKT/depan indomaret plus\r\nTlp/whatsapp 081219950220 (no sms)', 6, 8, 8, 12, 29, 155900000, '2015-12-31 04:43:17', '2015-12-31 04:43:17', 1121066190, 1, 0),
(198, 'Toyota Soluna GLI thn 2001 manual silver bukan ex taksi pakai pribadi', 'Toyota Soluna GLI thn 2001 manual silver terawat pakai pribadi kondisi prima bkn ex taksi', 6, 8, 8, 12, 30, 54000000, '2015-12-31 04:46:14', '2015-12-31 04:46:14', 1127865821, 1, 0),
(199, 'Grand Livina XV AT 2013 silver facelift', 'Tangan pertama\r\nTV plafon\r\nInterior orisinil\r\nExterior orisinil\r\nSiap pakai\r\n\r\nminat..??\r\nPliiss...dehh...jangan tanya harga nett\r\nlangsung aja datang ke TKP !!!!\r\ntawar langsung sampai jadi\r\n\r\nDIAN MOTOR\r\nJl.pahlawan revolusi no.6a\r\nPondok bambu\r\nJakarta Timur\r\n13430\r\nSamping BKT/depan indomaret plus\r\nGooglemap + streetview : http://goo.gl/maps/0d9T7\r\n\r\nWhatsapp 081219950220 (no sms)\r\nCall only 087880805262 (no sms)', 6, 8, 8, 14, 27, 144900000, '2015-12-31 04:48:18', '2015-12-31 04:48:18', 1136922238, 1, 0),
(200, 'Jazz AT 2013 putih KM rendah', 'Tangan pertama\r\nTV DVD\r\nSurat2 lengkap\r\nKM rendah\r\nSiap pakai\r\n\r\nminat..??\r\nPliiss...dehh...jangan tanya harga nett\r\nlangsung aja datang ke TKP !!!!\r\ntawar langsung sampai jadi\r\n\r\nDIAN MOTOR\r\nJl.pahlawan revolusi no.6a\r\nPondok bambu\r\nJakarta Timur\r\n13430\r\nSamping BKT/depan indomaret plus\r\nGooglemap + streetview : http://goo.gl/maps/0d9T7\r\n\r\nWhatsapp 081219950220 (no sms)\r\nCall only 087880805262 (no sms)', 6, 8, 8, 13, 23, 169900000, '2015-12-31 04:50:12', '2015-12-31 04:50:12', 1192354928, 1, 0),
(201, 'Toyota New Vios Full Upgrade Lihat Dan Tes Dulu Pasti Suka', 'Dijual toyota new vios.\r\nmesin sangat halus n garing\r\nKaki kaki nyaman\r\nBody mulus \r\nTv mobil\r\nPower window ory\r\nAlarm n centrallock\r\nSpion sen.\r\nvelg racing \r\nPajak panjang hingga bulan 8 2016.\r\n\r\nLihat dan tes langsung pasti suka.\r\n\r\nHarga 75 juta.\r\nBisa bantu kredit', 6, 8, 8, 10, 9, 75000000, '2015-12-31 04:52:25', '2015-12-31 04:52:25', 1153669787, 1, 0),
(202, 'Inova G MT 2014 silver KM 4.000', 'Surat2 lengkap\r\nKM 4.000 on going\r\nSiap pakai\r\n\r\nminat..??\r\nPliisss...dehh...jangan tanya harga nett\r\nlangsung aja datang ke TKP !!!\r\ntawar langsung sampai jadi\r\n\r\nMy MOTOR 2\r\nJl.pahlawan revolusi no.2a\r\nPondok bambu\r\nJakarta Timur\r\n13430\r\nsamping YAMAHA / depan kelurahan pdk.bambu\r\nGooglemap + streetview : http://goo.gl/maps/DbnuD\r\n\r\nwhatsapp 081219950220 (no sms)\r\nCall only 087880805262 (no sms)', 6, 8, 8, 10, 9, 228000000, '2015-12-31 04:54:43', '2015-12-31 04:54:43', 1209560960, 1, 0),
(203, 'MERCEDES BENZ C180 W202 Tahun 1994 Excelent Condition', 'DIJUAL MERCEDES BENZ C180 W202 Tahun 1994, \r\n\r\nHati2!! Kalau Lihat Pasti TERTARIK..!!\r\n\r\nManual Transmisi, plat no B jakarta selatan, Warna Ungu Gelap metalik (siang kelihatan ungu gelap, malam keliatan hitam) Khusus Kolektor Kondisi sangat amat terawat luar dan dalam, jarang sekali di pakai, kilometer masih kurang dari 115.000, interior di dalam:\r\n1. Sudahfull wood panel (seperti tipe elegance) termasuk stir mobilnya\r\n2. Tempat duduk belakang ada head rest nya\r\n3. Lantai mobil sudah di lapisi full lapisan kulit sintetis, gampang di bersihkan\r\n4. Dasboard masih empuk dan wet look sangat terawat\r\n\r\nYang lihat pasti tertarik, Sparepart banyak sudah di ganti baru, yaitu :\r\n\r\n1. Fan Belt 2013\r\n2. Water Pump Radiator 2013\r\n3. Power Sterring 2013\r\n4. Fuel Pump 2014\r\n5. Radiator satu set 2014\r\n6. Kopling satu set 2014\r\n7. Engine Mounting dan Transmisi Mounting 2014\r\n8. Service All Kaki-kaki 2013\r\n9. Acu 2015\r\n10. Selang2 dan seal power stering (2014)\r\n11. Velg sudah ganti yg kuku macan original germany\r\n12. Service dan ganti oli MobilOil terakhir januari 2015\r\n13. Pajak panjang banget, masih setahun, sampai April 2016\r\n14. Ganti baru shockbreaker depan 2 buah Agustus 2015\r\n15. Ganti kampaa rem 4 roda depan belakang Agustus 2015\r\n16. Ganti ban baru depan 2 buah Agustus 2015\r\n\r\nNB: \r\n1. Selama masih di iklan kan berarti mobil masih dalam status BELUM TERJUAL\r\n2. Tidak melayani pembeli yang tidak serius, dalam arti nego harga setelah lihat barang saja\r\n\r\nHarga : Rp. 88.000.000,- (nego tipis)\r\nPosisi mobil di daerah kebayoran lama, Jakarta Selatan', 6, 8, 8, 9, 33, 88000000, '2015-12-31 04:58:56', '2015-12-31 04:58:56', 1146844642, 1, 0),
(204, 'All New Picanto th 2012 (BONUS motor VARIO MODIFICATION)', 'Assalamualaikum,\r\n\r\nMau dijual Mobil tangan pertama, pemakaian insyaAlloh rapih dan terawat bgt bahan bakar dr pertama keluar dealer pakai Shell dan Total.\r\n\r\nKondisi liat aja digambar, sekedar info aja per belakang sdh baru baru bulan kemarin minta ganti baru krn masih garansi dan per depan jg sdh req ganti tp barang belum ready jd tinggal nunggu aja, ban baru bulan kemarin diganti baru pakai Dunlop. Aki jg baru bulan sept''15 baru ganti ga tanggung"pakai Amaron harga 1jt. Kaca film pakai rinzumint (Masterpeace). Mesin ga ada modifikasi jd masih original.\r\n\r\nBagi yg serius dan utk dipakai sendiri sangat recomended.\r\n\r\nOiya dijual karena sdh inden mobil yg utk keluarga besar (seven seatter).\r\n\r\nBuruan siapa cepat dia dpt !!\r\n\r\nBONUS MOTOR HONDA VARIO MODIFIKASI (Asal nego ga sadis) Cek Gambar terakhir.', 6, 8, 8, 10, 8, 112500000, '2015-12-31 05:01:18', '2015-12-31 05:01:18', 1195489526, 1, 0),
(205, 'Black APV GL Arena 2010', 'Dijual Cepat APV Black GL Arena 2010\r\ndengan kondisi sbb:\r\n- AC Brrrr Dinginnnn\r\n- Jok Terbungkus kulit\r\n- STNK s/d Juni 2016\r\n- Body & Mesin Mulus, Siap tancap Gasss\r\n\r\nDan yg lbh penting : Surat2 Legalitas Lengkap & ORI :-)\r\nHarga diturunkan (lagi dan lagi) menjadi Rp. 90 Jeti saja.\r\nbagi yg berminat, silahkan PM.\r\n\r\natau cekidot ke TKP berikut ini \r\nKomp. Gading Tutuka1, H-1 No.5', 6, 8, 8, 9, 34, 90000000, '2015-12-31 05:03:28', '2015-12-31 05:03:28', 1135823570, 1, 0),
(206, 'Di jual Daihatsu New Sirion AT 2012', 'Warna hitam metalik, mulus, jarang pakai, km 27rb-an, orisinil, plat B sudah mutasi ke Samarinda tinggal tunggu plat jadi(7 blnan), ama bpkb sdh ganti nama sendiri (tunggu 6blnan) dari samsat bisa tukar tambah', 6, 8, 8, 10, 9, 120000000, '2015-12-31 05:05:30', '2015-12-31 05:05:30', 1207280352, 1, 0),
(207, 'Kijang innova type V 2009 gray metallic 2, 0 manual bensin', 'Toyota kijang innova V 2009 bensin 2, 0 manual\r\nwarna gray metalic\r\nnopol BK\r\nSTNK s/d september 2020 \r\nPajak s/d september 2016 ( bebas pajak progresip/pajak ganda)\r\nKM 82.××× (dapat dilihat di picture)\r\nban baru R 15 merk maxxis, pelk standart innova\r\naudio standart innova V (bisa masuk 6 disc)\r\nposisi unit mobil di takengon aceh tengah\r\n\r\nbuat yang serius \r\n\r\nMAAF TIDAK MENERIMA SMS !!!', 6, 8, 8, 10, 10, 173000000, '2015-12-31 05:07:40', '2015-12-31 05:07:40', 1140674134, 1, 0),
(208, 'Toyota kijang innova type V gray metallic 2009 manual bensin 2.0', 'kijang innova type V 2009 bensin 2.0\r\nwarna gray metallic\r\nnopol BK ×5×× ES\r\npajak s/d september 2016\r\nstnk s/d september 2020\r\nKM 82.×××\r\nsound system audio standart innova type V.(bisa masuk 6 disc)\r\nban baru merk maxxis R 15, pelk racing standart innova.\r\nposisi unit mobil di takengon\r\n\r\nbagi yang serius di : nol delapan lima dua satu nol satu nol empat sembilan enam delapan.\r\n\r\nMAAF TIDAK MENERIMA SMS', 6, 8, 8, 10, 10, 173000000, '2015-12-31 05:10:00', '2015-12-31 05:10:00', 1145922945, 1, 0),
(209, 'Daihatsu Grand Max Blind Van 1.3 AC 2015 Putih', 'DIJUAL CEPAT DENGAN HARGA TERJANGKAU \r\n\r\nKondisi Bagus & Istimewa, Original Cat, Tangan Pertama, Kilometer 4 ribuan, Seperti Baru, AC , Bebas Bau Rokok, \r\n\r\nTDP: 20.634.000\r\nANG: 2.904.000 x 35\r\n\r\nTDP: \r\nANG: \r\n\r\nBunga Ringan\r\nSyarat Mudah\r\nProses Cepat\r\n\r\nPersyaratan Kredit :\r\n\r\n- Fotocopy KTP Suami & Istri\r\n- Fotocopy Kartu Keluarga\r\n- Fotocopy PBB Rumah \r\n- Fotocopy Tabungan atau Slip gaji\r\n\r\nTITAN JAYA MOBIL\r\nTERIMA CASH / KREDIT dan TUKAR TAMBAH \r\n\r\nJl. Cipinang Jaya Jaktim\r\n\r\nuntuk info lebih lanjut caal aja ya.', 6, 8, 8, 10, 10, 85000000, '2015-12-31 05:12:27', '2015-12-31 05:12:27', 1146018428, 1, 0),
(210, 'Knalpot racing HKS turbo gronel stainless', 'Mau tampilan mobil makin oke? Yuuk cari aneka jenis knalpot mobil ditoko online Muffler9575. Performa dan penampilan mobil anda akan semakin meningkat\r\n\r\ndijual knalpot racing merk hks turbo gronel \r\nbahan dari stainless dengan panjang knalpot 45cm\r\ninlet 2 inch, suara ngebass\r\nuniversal knalpot \r\ntampilan mobil anda semakin keren/oke.\r\nmenerima pengiriman ke seluruh indonesia.\r\npengiriman via jne\r\nuntuk pembayaran ditransfer ke bca / bank mandiri\r\n\r\nbagi yang ingin cod dilokasi perumnas 1 bekasi dengan membuat janji dulu sebelum datang\r\nHanya jual knalpot nya aja, tidak terima pasang di tempat. \r\n\r\ninfo selanjut silahkan hubungi kami di no hp / wa / bbm yg tertera \r\nHp 087882104560 \r\nPin bb 56F9E7C3', 6, 9, 8, 9, 32, 3500000, '2015-12-31 05:22:42', '2015-12-31 05:22:42', 13, 1, 1),
(211, 'Pemantau kendaraan anda gps tracker gt 06 n', 'GT06N SERVER ORANGE GPS\r\ngaransi 1 tahun\r\npelacak armada dimanapun berada\r\npelacakan mengunakan hp, aplikasi android,iphone web online\r\n\r\nFitur Produk\r\nmenggunakan Chipset fitur III ( Built-in ) yang memiliki sensitivitas tinggi namun konsumsi listrik rendah. Sangat baek untuk menunjukan lokasi bahkan dalam kondisi sinyal lemah Sekalipun.\r\nBekerja baek pada area dengan sudut pandang langit terbatas.\r\nPencarian sinyal dilakukan dengan cepat, tepat, akurat.\r\n\r\nTracking kendaraan dapat dilakukan baik melalui ponsel ( Via SMS ) , atau dari Internet.\r\nDesain bentuk yang sederhana dan ringkas, dapat dipasang dibagian manapun pada kendaraan Anda.\r\nsadap pembicaraan di dalam mobil\r\nGT06N Bisa Mematikan mesin kendaraan, sadap suara kabin sudah lengkap rellay asli bawaan pabrikan\r\nmanual book dalam bahasa indonesia\r\n\r\nHardware Specifications:\r\n" GSM: MHz\r\n" GPRS: Class12, TCP/ IP build in GSM Module\r\n" GSM antenna: built-in quad band\r\n" GPS antenna: built-in GPS high gain ceramics patch antenna.\r\n" GPS Channels: 20\r\n" Tracking sensitivity: -159dBm\r\n" Acquisition sensitivity: -144dBm\r\n" Locating time cost: Hot start: 2 sec(open sky)\r\n> Warm start: 15 sec\r\n> Cold start: 38 sec(open sky)\r\n> Application environment: Operating temperature: -25? to +60?\r\n" Operating humidity: 5% to 95% non-condensing\r\n" Battery: 3.7vDC/450mAh\r\n" Monitoring range: 5M\r\n" Working voltage/current: 9-36 vDC/90mA\r\n" LED indicator: Three LED indicator: GPS-blue, GSM-green, Power-red\r\n" Dimensions: 98.0(L)X52.0(W)15.0(H)mm\r\n" Weight: 80g\r\n" Certifications:e-mark\r\n\r\nAKSESORIS :\r\n* 1 Set socket & kabel\r\n* 1 RELAY untuk mematikan mesin\r\n* 1 SOS Button\r\n* 1 MIC untuk mendengarkan pembicaraan didalam kabin\r\n* manual book bahasa inggris dan indonesia\r\n* simcard perdana\r\n* login dan pasword untuk masuk ke web dan aplikasi', 6, 9, 8, 10, 11, 800000, '2015-12-31 05:23:53', '2015-12-31 05:23:53', 13, 1, 1),
(212, 'Alarm mobil all', 'Alarm mobil berbagai merk. \r\n1. Holywood 250rb\r\n2. Ipf 275rb\r\n3. Security285rb\r\n4.micro 300rb\r\n5. Silicon 450rb\r\n6. Power guard 650rb\r\nHarga termasuk pemasangan / free biaya pasang. \r\n\r\nSedia kaca film dan audio mobil .\r\n\r\nHub 081804185779\r\nPin 7deec793.', 6, 9, 8, 9, 33, 250000, '2015-12-31 05:25:18', '2015-12-31 05:25:18', 13, 1, 1),
(213, 'Selimut Mobil Fashionable', 'Selimut Mobil kami adalah \r\n\r\nSebagai aksesoris dan pelindung untuk indoor dan outdoor bergaya dan stylish di dukung dengan bahan yang melindungi body kendaraan dari bewrbagai macam material yang merusak body mobil.\r\nSeperti air hujan,panas uv,gesekan,dan juga cuaca.\r\n\r\nTerdapat bagian dalam yang halus sehingga aman.\r\nBerbagai macam gaya dan model dapat pilihan dan dapat memvaisi sesuai keinginan.\r\nProduct raja car cover bandung.\r\n\r\nUntuk harga di seuaikan dengan ukuran mobil dan variasi kombinasi,\r\n\r\nNote : Konfirmasi dulu sebelumpemesanan\r\n\r\nContac \r\nSms dan Tlpn = 082115295226\r\nWA = 089694337775\r\nBB = 237d0d5b', 6, 9, 8, 10, 14, 300000, '2015-12-31 05:26:52', '2015-12-31 05:26:52', 13, 1, 1),
(214, 'Alarm mobil all merk', 'Alarm mobil berbagai merk dan harga.\r\nMulai dari 250rb.\r\nSudah termasuk biaya pasang.', 6, 9, 8, 10, 13, 2500000, '2015-12-31 05:28:18', '2015-12-31 05:28:18', 13, 1, 1),
(215, 'Captain Seat untuk Fortuner', 'Captain Set untuk Mobil Toyota Fortuner\r\nOri Toyota\r\nKondisi barang masih seperti baru, dipakai hanya selama 3 bulan. Karena anggota keluarga bertambah, jadi captain seat nya ngak dipakai lagi.\r\nKalau mau sekalian jok covernya warna hitam , gratis !\r\nkalau berminat barang diambil ditempat.', 6, 9, 8, 10, 15, 3500000, '2015-12-31 05:31:13', '2015-12-31 05:31:13', 13, 1, 1),
(216, 'Cover Mobil Mercedes Benz', 'Selimut mobil anti gores bahan lembut', 6, 9, 8, 10, 15, 500000, '2015-12-31 05:32:59', '2015-12-31 05:32:59', 13, 1, 1),
(217, 'Crystalline kaca film kelas premium', 'Crystalline (KS) 40 adalah kaca film yang bebas logam, diproduksi menggunakan multilayer nanoteknologi dengan ratusan lapisan polimer. Memungkinkan 40% cahaya tampak yang ditransmisikan dengan reflektifitas interior yang rendah sehingga membuat pandangan terang, jelas dan memiliki penolakan panas unggul untuk memberikan kenyamanan yang optimal.', 6, 9, 8, 10, 11, 320000, '2015-12-31 05:34:16', '2015-12-31 05:34:16', 13, 1, 1),
(218, 'Towing depan agya', 'Towing depan agya,warna merah,ready stok.\r\nSilahkan di order,harga terjangkau', 6, 9, 8, 9, 32, 150000, '2015-12-31 06:26:22', '2015-12-31 06:26:22', 1139987383, 1, 0),
(219, 'Sarung jok mobil / berkualitas', 'Terbukti....\r\nSpesialis sarung jok mobil pasang langsung di tempat/rumah anda semua.\r\nSegera hubungi kami.', 6, 9, 8, 11, 20, 650000, '2015-12-31 06:28:36', '2015-12-31 06:28:36', 1183945443, 1, 0),
(220, 'Motip buat srung jok brio mobilio', 'motip hanya untuk mo bilio brio tr lihht begitu cocok d lihat tk mmbuat kita bosan warna dominn sesuai dengn motip nya anda minat hubungi kami warna lngkap', 6, 9, 8, 9, 32, 980000, '2015-12-31 06:29:51', '2015-12-31 06:29:51', 1203172281, 1, 0),
(221, 'Cover jok / paten / dan cover jok', 'Terima : paten / semi paten\r\nSiap pasng drmh / kantor\r\n\r\nJln raya serng km 10, pos bitung-tangerng', 7, 14, 8, 13, 24, 650000, '2015-12-31 06:31:32', '2015-12-31 06:31:32', 1139289813, 1, 0),
(222, 'Dvd d.din pioneer avh175+camera hd+pasang termurah di sby', 'Alamat:jl.raya lidah kulon central park b no.1 sby barat dekat ptc supermall/unesa(sebelah lesehan rumadi/sman 13)\r\nT2 car audio\r\nDvd doubledin pioneer avh175dvd\r\nFitur:dvd,vcd,mp3,wav,usb,radio,aux rear layar touch screen\r\nHarga unit saja rp.2.150.000\r\nKlo sama pasang+camera Hd rp.2.400.000\r\nTermurah berkualitas & bergaransi\r\nBisa kirim2 wilayah sby/cod luar kota\r\nNo tipu2 gan\r\nSilahkan hubungi/datang di workshop kami buat bantu pemasangan\r\nTelp.085648475328\r\nPin bb.5c82fd74\r\nThanks olx', 6, 10, 8, 10, 17, 2150000, '2016-01-06 22:37:35', '2016-01-06 22:37:35', 1179541884, 1, 0),
(223, 'Jual tv mobil dobeldin', 'jual dobeldi tv mobil berkualitas bagus Bisa pasang di rumah / datang \r\n\r\nspek dvd : dvd, vcd, cd, mp3, mp4, usb, radio, tv, bluetooth, layar sentuh, logo,\r\n\r\nspek camera : camera ccd, infrared, lampu flazz, gambar tetap warna walaupun di malam hari.\r\n\r\ntelp / sms : 081289771670\r\npin bb :56C31BE6\r\n\r\nalamat : jln daan mogot km 19, pasar ampera depan jembatan ampera poris, sebelah aparteman Avenue, 2km dari kali deres cengkareng )\r\n\r\nhormat saya\r\nAnderi yansah\r\n\r\nNB. menyediakan berbagai macam keperluan audio / variasi mobil anda antara lain :\r\n\r\n-kaca film, talang air, lampu2, sarung jok, karpet dasar, semua jenis variasi lainnya.\r\n\r\n- Tv Mobil ( Tv spion, Tv Ondash, Tv Indash metic,Tv roof, Tv Headrest, dll )\r\n- Double Din\r\n- DVD Mobil\r\n- Power 2chanel, 4chanel\r\n- Monoblock\r\n- Subwoofer 10" & 12"\r\n- Speaker 3", 4", 5", 6", 6,5"\r\n- Speaker Oval\r\n- Tweeter\r\n- Basstube\r\n- Kapasitor bank\r\n- BOX berbagai model dan ukuran ( menerima CUSTOM BOX)\r\n] menyediakan berbagai macam keperluan audio mobil anda antara lain :\r\n- Tv Mobil ( Tv spion, Tv Ondash, Tv Indash metic,Tv roof, Tv Headrest, dll )\r\n- Double Din\r\n- DVD Mobil\r\n- Power 2chanel, 4chanel\r\n- Monoblock\r\n- Subwoofer 10" & 12"\r\n- Speaker 3", 4", 5", 6", 6,5"\r\n- Speaker Oval\r\n- Tweeter\r\n- Basstube\r\n- Kapasitor', 6, 10, 8, 10, 15, 1100000, '2016-01-06 22:39:37', '2016-01-06 22:39:37', 1140724612, 1, 0),
(224, 'Paket audio ads', 'Bagi agan yg pengin pasang paket audio dg harga terjangkau,di sini tempatnya,agan cukup ngocek kantong 1,2 nett,,,agan terima beres,\r\nPaket audio meliputi;\r\n~»subwoofer ads 12in,\r\n~»power ads 4 chanel 8000wat,\r\n~»box\r\n~»kabel RCA\r\n~»kabel audio,\r\n~»sekring audio,plus pemasangan d rumah agan,,,\r\n\r\nMinat hub Guz mad \r\nNo hp 089521792445\r\npin bb 2747C97A \r\n\r\nSedia juga ;\r\n» tv/doubledin,\r\n» tape/singledin,\r\n» camera,\r\n» power,\r\n» subwoofer,\r\n» tweeter, \r\n»speaker,\r\n» karpet dasar , sarung jok,,,', 6, 10, 8, 12, 29, 1200000, '2016-01-06 22:42:40', '2016-01-06 22:42:40', 1128286339, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `classified_guest`
--

CREATE TABLE IF NOT EXISTS `classified_guest` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` int(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classified_guest`
--

INSERT INTO `classified_guest` (`id`, `name`, `email`, `phone`) VALUES
(1114030312, 'buanasumberooo', 'buanasumber@gmail.com', 811118181),
(1116645074, 'buanasumber', 'rino@gmail.com', 811118181),
(1121066190, 'Faisal', 'faisal@gmail.com', 2147483647),
(1126611291, 'Khoir', 'khoir@gmail.com', 2147483647),
(1127865821, 'hendry maruli', 'maruli@gmail.com', 2147483647),
(1128286339, 'guz mad', 'guzmad@gmail.com', 2147483647),
(1131805087, 'JG Motor', 'jgmontor@gmail.com', 2147483647),
(1135823570, 'Yosep Hermawan', 'hermawan@gmail.com', 2147483647),
(1136922238, 'Khoir', 'khoir@gmail.com', 2147483647),
(1137670422, 'Timmy yusuf', 'Timmyyusuf@gmail.com', 2147483647),
(1139289813, 'alex', 'alex@gmail.com', 2147483647),
(1139987383, 'Tris eno', 'eno@gmail.com', 2147483647),
(1140674134, 'ivan gayo', 'gayo@gmail.com', 2147483647),
(1140724612, 'Andre yansah', 'andre@gmail.com', 2147483647),
(1145922945, 'ivan gayo', 'gayo@gmail.com', 2147483647),
(1146018428, 'TitanJayaMobil', 'nayaobil@gmial.com', 2147483647),
(1146844642, 'ronny marpaung', 'marpaung@gmail.com', 2147483647),
(1147238136, 'buanasumber', 'rino@gmail.com', 811118181),
(1150901067, 'buanasumber', 'buanasumber@gmail.com', 811118181),
(1153669787, 'Rino', 'rino@gmail.com', 2147483647),
(1161061630, 'Abbacarsjakarta', 'abbacarsjakarta@gmail.com', 2147483647),
(1163525720, 'Rino Rachmat', 'buanasumber@gmail.com', 34543543),
(1173866705, 'buanasumber', 'buanasumber@gmail.com', 811118181),
(1179380552, 'buanasumber', 'buanasumber@gmail.com', 811118181),
(1179541884, 'Tony', 'tony@gmail.com', 2147483647),
(1183945443, 'Surya', 'surya@gmail.com', 2147483647),
(1185906168, 'buanasumber', 'buanasumber@gmail.com', 811118181),
(1192354928, 'Khoir', 'khoir@gmail.com', 2147483647),
(1195489526, 'Apit Joko Priyono', 'priyono@gmail.com', 2147483647),
(1203172281, 'albet', 'albet@gmail.com', 837487584),
(1207280352, 'Yoga', 'yoga@gmail.com', 2147483647),
(1209560960, 'Khoir', 'khoir@gmail.com', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `classified_image`
--

CREATE TABLE IF NOT EXISTS `classified_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `classified_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=258 ;

--
-- Dumping data for table `classified_image`
--

INSERT INTO `classified_image` (`id`, `image`, `classified_id`) VALUES
(149, 'uploads/classified/n_Jb63PabQ5lhH82I-5NXAn_Ob74uWWT.png', 192),
(150, 'uploads/classified/G15vod4wFYu_mCs9xeFXDnpmxZvwUhmD.jpg', 193),
(151, 'uploads/classified/7Eslj29nqiMbmVfOuNF2PBoa5w1k6r6Z.jpg', 193),
(152, 'uploads/classified/0YH2TTKUD7_7SG34jdLPQFYu7MtQculo.jpg', 193),
(153, 'uploads/classified/QqEshGFbsVyvXwOtN5JVPYo0kGm_S1A-.jpg', 193),
(154, 'uploads/classified/_R8Tkb4XNX2-FvV2KaDn_1hSrHEI_DZr.jpg', 194),
(155, 'uploads/classified/rpmqjOaawJmXIe_yAK7W-LBi02ioU21W.jpg', 194),
(156, 'uploads/classified/dgURyGSIKJr_jT7SBsQFR20r9a4OwEC8.jpg', 194),
(157, 'uploads/classified/NDqwAWv0QN4IKYR6AW98WtnFLdGYuiVm.jpg', 194),
(158, 'uploads/classified/HmtHLE1FWDg-IFho6NSCuyr4WRrLCJbW.jpg', 195),
(159, 'uploads/classified/1a4jfEFuf_E8EBD6t4_7foeQLXolOnOX.jpg', 195),
(160, 'uploads/classified/Q2v-TUMCk23dVMwMuGFP5HWTO6esZ9Ci.jpg', 195),
(161, 'uploads/classified/01_GJRgRJZ0MOp_NMh_mK5HbA70-oxVb.jpg', 196),
(162, 'uploads/classified/5zts9PsHD--UE56xgMeEA0Rz-3VAEjfh.jpg', 196),
(163, 'uploads/classified/pq58EN_nRi5KjdWP7tSXSTy1LepconTI.jpg', 196),
(164, 'uploads/classified/noyd75YnkAMrB-unIwi-ypYpCpeMOaSc.jpg', 196),
(165, 'uploads/classified/tLSicilzwVmAk0r3f_zz3s4pktDletNH.jpg', 197),
(166, 'uploads/classified/0rw8L8TJAw8Rs51u7mT0rLQidm1TYNUw.jpg', 197),
(167, 'uploads/classified/Q2KlDuPh0437lRTpwk5quc23yjWH9z0u.jpg', 197),
(168, 'uploads/classified/EU5NBiz_OgjCy9TLIOLEDdpmwr81HYub.jpg', 197),
(169, 'uploads/classified/2j10JEuBW4Rw64VsDheLgvA2ddaG1DGA.jpg', 198),
(170, 'uploads/classified/C8aVDCDM8ZglX0IJKWVMp7xJn90PAUrc.jpg', 198),
(171, 'uploads/classified/6eVQM_sGp_zq0dIxoCrs1DopBeZKM4w-.jpg', 198),
(172, 'uploads/classified/ccCoBk4W3m7YnBGLKhKv_PTTHhubD4SM.jpg', 198),
(173, 'uploads/classified/zE4d8Cdve7bO2vGhl1_UZcUzIG0zpWws.jpg', 199),
(174, 'uploads/classified/lCUgM1cgCz_DJj5lcrKkL8LiUvY3EG9R.jpg', 199),
(175, 'uploads/classified/k01bUtubo_4ZMxj6Tk0V0EOpCCDszcSK.jpg', 199),
(176, 'uploads/classified/4b44xOh1EjOZsD07W1p5ke9jsuoUUrvM.jpg', 199),
(177, 'uploads/classified/rfY6BNpHMDyfkDsFCHa5s5Tza4yCDgjo.jpg', 200),
(178, 'uploads/classified/D2IWeIC5tWSmDpHlSuoO5h6fReXwV2Aa.jpg', 200),
(179, 'uploads/classified/qDLu0bqXPrDvzPI0OppgLcZgWHbRnoXU.jpg', 200),
(180, 'uploads/classified/1xG8DrAynvXppZ4WZSpC_CBspGKm1SIR.jpg', 200),
(181, 'uploads/classified/HLfsI2DANpfjt2zwbpe0LmrCDp89kRla.jpg', 201),
(182, 'uploads/classified/qxNXbZgMwX75a1Ekc53jTuJWh9a_Zhct.jpg', 201),
(183, 'uploads/classified/yO0jmWc627VdG6lYCZ0U8q94V0w8pxUe.jpg', 201),
(184, 'uploads/classified/46eystM4bMVT9hFQSMSrnrM_lu6qMrqe.jpg', 201),
(185, 'uploads/classified/yg_fByTjY37raG6QZdZzL2bqstvNdMex.jpg', 202),
(186, 'uploads/classified/LrYQuZL5fjglI0FcQGj_rw2bzxgPOSi6.jpg', 202),
(187, 'uploads/classified/prb6QBPJ6EvgXatUefWMJCHZPoHFLoMM.jpg', 202),
(188, 'uploads/classified/gQpG-QqN-iUoW-QoH69Di72F59EvIkAL.jpg', 202),
(189, 'uploads/classified/JPh8MQGq2m5PS39o3y0KHcFQ6bPh-1NA.jpg', 203),
(190, 'uploads/classified/ZpGpI2K7cZ49raYshWTAxm9k9g9eB3rG.jpg', 203),
(191, 'uploads/classified/tN9RzPH4_IFmQQCmQaW4SZmWybV-1bPW.jpg', 203),
(192, 'uploads/classified/qfXyAyrTeTTD9qKov1_Akm-EWmpGfmdp.jpg', 203),
(193, 'uploads/classified/wIln9tXRB1uDqezZsY9-8Fct39GPNkAM.jpg', 204),
(194, 'uploads/classified/ImkPv0udVaVYfRt_VMb0gOTGhrAOGmRI.jpg', 204),
(195, 'uploads/classified/c2KN-ZEBKfQygl3cm_CUcuzhpGnC-NDi.jpg', 204),
(196, 'uploads/classified/DluPCDoc70KPYUXXR_O6mjA1Dlo9nleF.jpg', 204),
(197, 'uploads/classified/XwrE5tjMX-4Yn0W-sBZMy1tdlo_zH4ve.jpg', 205),
(198, 'uploads/classified/Rem5zYyrXvPdFcvtjVJ1imL9UdaA6QRq.jpg', 205),
(199, 'uploads/classified/vwzHYISMcF-5NVL0p-cShoByQSj6_2bf.jpg', 205),
(200, 'uploads/classified/VqkpB5k9Q-bwRGCa6W1Nc142Ea5WUuW4.jpg', 205),
(201, 'uploads/classified/xmCKBDw1UlwTdWjtwol29fiSNRVic4t4.jpg', 206),
(202, 'uploads/classified/WBxKhPT9xFn8AIHPv3AWvEYI0UBtNKOb.jpg', 206),
(203, 'uploads/classified/mVahRW_oyPcb9ly4aN-AgIy-_nWPGSR8.jpg', 206),
(204, 'uploads/classified/T-eJyMc2dc-eKdfymXy4jXkNiI8EZqdm.jpg', 206),
(205, 'uploads/classified/aewU3l5yP37VUcp5ohxImqHZRldkdCgS.jpg', 207),
(206, 'uploads/classified/aH1-XTy3fTcEBz4e0zXz9fEK4Wp399d1.jpg', 207),
(207, 'uploads/classified/Dci90urHPVq3oyp3KPNf9X6Bm50nUkqx.jpg', 207),
(208, 'uploads/classified/bX2RPH2vovzjhM1vjQa_-Rqbojunot9P.jpg', 207),
(209, 'uploads/classified/QW-vefCPAlotluPyEVhTmGWMyApUhtGu.jpg', 208),
(210, 'uploads/classified/5C-5MZDGTQesXDUAdkj1IvsEjAlIyy8H.jpg', 208),
(211, 'uploads/classified/HDEui3oYQ_76fE512GLbHxczN8mHlZ9A.jpg', 208),
(212, 'uploads/classified/LDbzoxeN6MEfLxW77IeL6QK5xU2QWj-3.jpg', 208),
(213, 'uploads/classified/LZgx1sJ65t5RcYvGLq1rOsdHA4bI1hVd.jpg', 209),
(214, 'uploads/classified/ad-CafIWixOylT6M3XB2-X5E9VJQpOmW.jpg', 209),
(215, 'uploads/classified/DvBECWvG4EuOgLC4fMjW1SR1j8qIEbM3.jpg', 209),
(216, 'uploads/classified/p3cXl71atnykuYUkpzQKOk8FZUKAHep2.jpg', 209),
(217, 'uploads/classified/Rh-VOLlHVFEf3P_TMEOhchVAvM_byLZq.jpg', 210),
(218, 'uploads/classified/b6Ee8Jc9WQelH3MS4WCi9E654JrtfqE5.jpg', 210),
(219, 'uploads/classified/NG3bm_82TF6biY4_8sotVrZmEBMqmPkr.jpg', 210),
(220, 'uploads/classified/PCtzytZ7XheWpPPSjKVJjDYleICtPje1.jpg', 211),
(221, 'uploads/classified/06KXynUQDFai8BK8vvT64-tuEHrOFiOS.jpg', 212),
(222, 'uploads/classified/gdpsae-WZ4Gy7i-w6Ax7kyp24iYsqkmL.jpg', 212),
(223, 'uploads/classified/1BheDq0utLommU_PePJuNMvKznUBNHeN.jpg', 212),
(224, 'uploads/classified/qm_AzHGuEAx8rn7nc33geqp7B5uNHoco.jpg', 213),
(225, 'uploads/classified/42p6PihwB5esleLYeioLacV8qFA9T7Pk.jpg', 213),
(226, 'uploads/classified/qhluygG41DNcmraEnxfXpRjJBT1E6eyf.jpg', 213),
(227, 'uploads/classified/oEqpthMeQBThYcnz6A1hqi8O59bfwhvM.jpg', 213),
(228, 'uploads/classified/OBbqLThFiOgCNyKjcoI0zMMKz6gVk_u_.jpg', 214),
(229, 'uploads/classified/yK-2qimuSuzH5YYXVpohRHXItSenKi2_.jpg', 214),
(230, 'uploads/classified/eFFPJsZG5rwV9yWwT3tPnWPkwYM-izkA.jpg', 214),
(231, 'uploads/classified/uIho2vjrL-b2C5qpVit6tNzWoGSxOS-9.jpg', 214),
(232, 'uploads/classified/HMQ0T-5k92Y8BmRGipLhlznWqf--i1zR.jpg', 215),
(233, 'uploads/classified/2ZAVj2Yf5PxbQR3IHeM7r0ywm2Jyu0lG.jpg', 215),
(234, 'uploads/classified/Z7WUbTeiONBRZ65We8eh9v_Uh3ZUfVnb.jpg', 215),
(235, 'uploads/classified/qQD91bSxft9bl_eaQADiV8yITX3WAtNZ.jpg', 215),
(236, 'uploads/classified/D14GoDRcLso28wT__YqpGwiK9xQyCjKK.jpg', 216),
(237, 'uploads/classified/GJph4kKGRXhJDyG3IT3M60b7ed6aFq9E.jpg', 216),
(238, 'uploads/classified/TLezPxB5EtzdUbQXZBfDMXHLFEtiGTNv.jpg', 216),
(239, 'uploads/classified/xDrqFd2B2mTIJZddyJsxow26SqnTWWkc.jpg', 217),
(240, 'uploads/classified/uAP7w5_IBhdlpp0esXLUq-IJG5WqKS-n.jpg', 217),
(241, 'uploads/classified/FWZeIiwkm77XvEXZTqRtVwKcdDdQ6diQ.jpg', 217),
(242, 'uploads/classified/ZO81rcRXbypHcwxy88xyWuXOjpp5p_wC.jpg', 218),
(243, 'uploads/classified/bPfX74GZXvJFDBhnS3weK8Ma3iZzEMDG.jpg', 218),
(244, 'uploads/classified/sxKxnKT3d1DzjxYmZX6TQatMK5tqf05S.jpg', 219),
(245, 'uploads/classified/AoV1-uAq17w08jcKt4y4A8RuKwWdgN5-.jpg', 219),
(246, 'uploads/classified/CQ3FT6MPprtWUoJ9vSsAB9iwOKLGV-zn.jpg', 220),
(247, 'uploads/classified/3YT2BvJXx1zFp45zGfQeZ4MJIRExVPB3.jpg', 221),
(248, 'uploads/classified/yiO6AlTrnogm9tMb1orUJ0Xd-2gDkhr2.jpg', 221),
(249, 'uploads/classified/8v9_QrmLjnEJUpQb5WPT_ih8wg4CvZ6l.jpg', 222),
(250, 'uploads/classified/mT1_rv_420GPZRQH3uy4v_SfvLhTtGES.jpg', 222),
(251, 'uploads/classified/yWBnuGjNZoTR40e1T8LzD82zaz_6cyir.jpg', 222),
(252, 'uploads/classified/1q0ihvTW3APVzfNyFmlqoEtRcbGyh_dp.jpg', 222),
(253, 'uploads/classified/Kekd8yS5qhyJqrPoQr4J3avI_Xkc8R_m.jpg', 223),
(254, 'uploads/classified/FiqrWAIhz-wGqP75RhO08rq4R4zHSysB.jpg', 223),
(255, 'uploads/classified/UL9wuOr2OEgD7412qrZ8QaDLWT4O2Axe.jpg', 224),
(256, 'uploads/classified/F9DT9nUADlIilyPyUToxtwCnx5J8z48F.jpg', 224),
(257, 'uploads/classified/mB-DvB9fy914sYgNK_b7gvm1K2gDyOFY.jpg', 224);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `is_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `country`, `create_at`, `update_at`, `is_status`) VALUES
(8, 'Indonesia', '2015-12-18 15:26:54', '2015-12-18 15:26:54', 1),
(9, 'Malaysia', '2015-12-18 15:27:01', '2015-12-18 15:27:01', 0),
(10, 'Japan', '2015-12-18 15:27:17', '2015-12-18 15:27:17', 0),
(11, 'Philippines', '2015-12-18 15:28:19', '2015-12-18 15:28:19', 0),
(12, 'India', '2015-12-18 15:28:32', '2015-12-18 15:28:32', 0),
(13, 'Myanmar', '2015-12-18 15:28:43', '2015-12-18 15:28:43', 0),
(14, 'Russia', '2015-12-18 15:28:50', '2015-12-18 15:28:50', 0),
(15, 'Singapore', '2015-12-18 15:29:03', '2015-12-18 15:29:03', 0),
(16, 'United Arab Emirates', '2015-12-18 15:29:23', '2015-12-18 15:29:23', 0),
(17, 'China', '2015-12-18 15:29:34', '2015-12-18 15:29:34', 0),
(18, 'South Korea', '2015-12-18 15:29:42', '2015-12-18 15:29:42', 0),
(19, 'Lebanon', '2015-12-18 15:29:57', '2015-12-18 15:29:57', 0),
(20, 'Afghanistan', '2015-12-18 15:30:19', '2015-12-18 15:30:19', 0),
(21, 'Armenia', '2015-12-18 15:30:23', '2015-12-18 15:30:23', 0),
(22, 'Azerbaijan', '2015-12-18 15:30:27', '2015-12-18 15:30:27', 0),
(23, 'Bahrain', '2015-12-18 15:30:32', '2015-12-18 15:30:32', 0),
(24, 'Bangladesh', '2015-12-18 15:30:37', '2015-12-18 15:30:37', 0),
(25, 'Bhutan', '2015-12-18 15:30:40', '2015-12-18 15:30:40', 0),
(26, 'Brunei', '2015-12-18 15:30:45', '2015-12-18 15:30:45', 0),
(27, 'Cambodia', '2015-12-18 15:30:49', '2015-12-18 15:30:49', 0),
(28, 'Cyprus', '2015-12-18 15:30:58', '2015-12-18 15:30:58', 0),
(29, 'Georgia', '2015-12-18 15:31:03', '2015-12-18 15:31:03', 0),
(30, 'Iran', '2015-12-18 15:31:09', '2015-12-18 15:31:09', 0),
(31, 'Iraq', '2015-12-18 15:31:14', '2015-12-18 15:31:14', 0),
(32, 'Israel', '2015-12-18 15:31:18', '2015-12-18 15:31:18', 0),
(33, 'Kazakhstan', '2015-12-18 15:31:23', '2015-12-18 15:31:23', 0),
(34, 'Kuwait', '2015-12-18 15:31:28', '2015-12-18 15:31:28', 0),
(35, 'Kyrgyzstan', '2015-12-18 15:31:33', '2015-12-18 15:31:33', 0),
(36, 'Laos', '2015-12-18 15:31:38', '2015-12-18 15:31:38', 0),
(37, 'Maldives', '2015-12-18 15:31:47', '2015-12-18 15:31:47', 0),
(38, 'Mongolia', '2015-12-18 15:31:51', '2015-12-18 15:31:51', 0),
(39, 'Nepal', '2015-12-18 15:31:57', '2015-12-18 15:31:57', 0),
(40, 'North Korea', '2015-12-18 15:32:02', '2015-12-18 15:32:02', 0),
(41, 'Oman', '2015-12-18 15:32:08', '2015-12-18 15:32:08', 0),
(42, 'Palestine', '2015-12-18 15:32:14', '2015-12-18 15:32:14', 0),
(43, 'Pakistan', '2015-12-18 15:32:19', '2015-12-18 15:32:19', 0),
(44, 'Qatar', '2015-12-18 15:32:29', '2015-12-18 15:32:29', 0),
(45, 'Sri Lanka', '2015-12-18 15:32:50', '2015-12-18 15:32:50', 0),
(46, 'Syria', '2015-12-18 15:32:54', '2015-12-18 15:32:54', 0),
(47, 'Taiwan', '2015-12-18 15:32:59', '2015-12-18 15:32:59', 0),
(48, 'Tajikistan', '2015-12-18 15:33:02', '2015-12-18 15:33:02', 0),
(49, 'Thailand', '2015-12-18 15:33:07', '2015-12-18 15:33:07', 0),
(50, 'Timor-Leste', '2015-12-18 15:33:14', '2015-12-18 15:33:14', 0),
(51, 'Turkey', '2015-12-18 15:33:19', '2015-12-18 15:33:19', 0),
(52, 'Turkmenistan', '2015-12-18 15:33:24', '2015-12-18 15:33:24', 0),
(53, 'Uzbekistan', '2015-12-18 15:33:31', '2015-12-18 15:33:31', 0),
(54, 'Vietnam', '2015-12-18 15:33:35', '2015-12-18 15:33:35', 0),
(55, 'Yemen', '2015-12-18 15:33:39', '2015-12-18 15:33:39', 0);

-- --------------------------------------------------------

--
-- Table structure for table `main_category`
--

CREATE TABLE IF NOT EXISTS `main_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_category` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `is_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `main_category`
--

INSERT INTO `main_category` (`id`, `main_category`, `icon`, `create_at`, `update_at`, `is_status`) VALUES
(6, 'Mobil', 'fa-car', '2015-12-18 16:40:46', '2015-12-18 16:40:46', 1),
(7, 'Motor', 'fa-motorcycle', '2015-12-18 16:41:04', '2015-12-18 17:10:15', 1),
(8, 'Properti', 'fa-institution', '2015-12-18 16:41:28', '2015-12-18 17:43:00', 1),
(9, 'Keperluan Pribadi', 'fa-ship', '2015-12-18 16:41:43', '2015-12-18 17:43:29', 1),
(10, 'Elektronik & Gadget', 'fa fa-mobile', '2015-12-18 16:42:06', '2015-12-18 17:34:13', 1),
(11, 'Hobi & Olahraga', 'fa-futbol-o', '2015-12-18 16:42:26', '2015-12-18 17:33:39', 1),
(12, 'Rumah Tangga', 'fa-hotel', '2015-12-18 16:42:34', '2015-12-18 17:44:17', 1),
(13, 'Perlengkapan Anak', 'fa-paw', '2015-12-18 16:42:46', '2015-12-18 17:44:46', 1),
(14, 'Kantor & Industri', 'fa-cogs', '2015-12-18 16:42:56', '2015-12-18 17:45:19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1450245279),
('m140209_132017_init', 1450245283),
('m140403_174025_create_account_table', 1450245284),
('m140504_113157_update_tables', 1450245287),
('m140504_130429_create_token_table', 1450245287),
('m140506_102106_rbac_init', 1450247798),
('m140830_171933_fix_ip_field', 1450245288),
('m140830_172703_change_account_table_name', 1450245288),
('m141222_110026_update_ip_field', 1450245288),
('m141222_135246_alter_username_length', 1450245288),
('m150614_103145_update_social_account_table', 1450245292),
('m150623_212711_fix_username_notnull', 1450245293);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gender` tinyint(1) NOT NULL,
  `public_email` varchar(255) DEFAULT NULL,
  `phone_number` int(15) NOT NULL,
  `gravatar_email` varchar(255) DEFAULT NULL,
  `gravatar_id` varchar(32) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `image_profile` varchar(255) NOT NULL,
  `image_header` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `bio` text,
  `facebook_url` varchar(100) NOT NULL,
  `twitter_url` varchar(100) NOT NULL,
  `instagram_url` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `gender`, `public_email`, `phone_number`, `gravatar_email`, `gravatar_id`, `country_id`, `region_id`, `city_id`, `image_profile`, `image_header`, `location`, `website`, `bio`, `facebook_url`, `twitter_url`, `instagram_url`) VALUES
(1, 'Devi Aridana v', 1, 'deviardana@gmail.com', 2147483647, NULL, NULL, 0, 0, 0, 'uploads/profile/15-12313628_1031195613570374_798426123380433029_n.png', '', NULL, 'http://localhost.com', 'no comment', 'http://localhost.com', 'http://localhost.com', 'http://localhost.com'),
(13, 'Devi Ardiana', 1, 'deviarn@gmail.com', 2147483647, NULL, NULL, 8, 10, 18, 'uploads/profile/77-mom-loving-her-child-image (copy).jpg', 'uploads/header/28-Corporate_Sunrise (copy).png', NULL, 'http://diadoo.dev/', 'Nothing', 'https://www.facebook.com/depidollar', 'https://twitter.com/deviardn', ''),
(20, NULL, 0, NULL, 0, NULL, NULL, 0, 0, 0, '', '', NULL, NULL, NULL, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE IF NOT EXISTS `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(50) NOT NULL,
  `country_id` int(11) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `is_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`id`, `region`, `country_id`, `create_at`, `update_at`, `is_status`) VALUES
(9, 'Sumatra', 8, '2015-12-18 15:38:21', '2015-12-18 15:38:21', 1),
(10, 'Java', 8, '2015-12-18 15:38:30', '2015-12-18 15:38:30', 1),
(11, 'Kalimantan', 8, '2015-12-18 15:38:40', '2015-12-18 15:38:40', 1),
(12, 'Sulawesi', 8, '2015-12-18 15:38:55', '2015-12-18 15:38:55', 1),
(13, 'Maluku', 8, '2015-12-18 15:39:03', '2015-12-18 15:39:03', 1),
(14, 'Papua', 8, '2015-12-18 15:39:10', '2015-12-18 15:39:10', 1),
(15, 'Kedah', 9, '2015-12-18 15:39:56', '2015-12-18 15:39:56', 0),
(16, 'Penang', 9, '2015-12-18 15:40:06', '2015-12-18 15:40:06', 0),
(17, 'Perak', 9, '2015-12-18 15:40:22', '2015-12-18 15:40:22', 0),
(18, 'Perlis ', 9, '2015-12-18 15:40:32', '2015-12-18 15:40:32', 0),
(19, 'Kuala Lumpur', 9, '2015-12-18 15:40:48', '2015-12-18 15:40:48', 0),
(20, 'Selangor', 9, '2015-12-18 15:40:57', '2015-12-18 15:40:57', 0),
(21, 'Negeri Sembilan', 9, '2015-12-18 15:41:20', '2015-12-18 15:41:20', 0),
(22, 'Malacca', 9, '2015-12-18 15:41:35', '2015-12-18 15:41:35', 0),
(23, 'Johor', 9, '2015-12-18 15:41:45', '2015-12-18 15:41:45', 0),
(24, 'Terengganu', 9, '2015-12-18 15:41:58', '2015-12-18 15:41:58', 0),
(25, 'Pahang', 9, '2015-12-18 15:42:07', '2015-12-18 15:42:07', 0),
(26, 'KELANTAN', 9, '2015-12-18 15:42:28', '2015-12-18 15:42:28', 0),
(27, 'Sabah', 9, '2015-12-18 15:42:39', '2015-12-18 15:42:39', 0),
(28, 'Sarawak', 9, '2015-12-18 15:43:02', '2015-12-18 15:43:02', 0),
(30, 'Bukit Merah', 15, '2015-12-18 15:49:24', '2015-12-18 15:49:24', 0),
(31, 'Bedok', 15, '2015-12-18 15:49:33', '2015-12-18 15:49:33', 0),
(32, 'Woodlands', 15, '2015-12-18 15:49:42', '2015-12-18 15:49:42', 0),
(33, 'Hougang', 15, '2015-12-18 15:49:50', '2015-12-18 15:49:50', 0),
(34, 'Jurong West', 15, '2015-12-18 15:50:01', '2015-12-18 15:50:01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `report_classified`
--

CREATE TABLE IF NOT EXISTS `report_classified` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `classified_id` int(11) NOT NULL,
  `email_reporter` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `type` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `social_account`
--

CREATE TABLE IF NOT EXISTS `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `data` text,
  `code` varchar(32) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  UNIQUE KEY `account_unique_code` (`code`),
  KEY `fk_user_account` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `social_account`
--

INSERT INTO `social_account` (`id`, `user_id`, `provider`, `client_id`, `data`, `code`, `created_at`, `email`, `username`) VALUES
(1, 13, 'facebook', '814113642031990', '{"name":"Devi Ardiana","email":"deppi86@ymail.com","id":"814113642031990"}', NULL, NULL, NULL, NULL),
(3, NULL, 'twitter', '3130603349', '{"id":3130603349,"id_str":"3130603349","name":"Devi Ardiana","screen_name":"deviardn","location":"","description":"","url":null,"entities":{"description":{"urls":[]}},"protected":false,"followers_count":6,"friends_count":47,"listed_count":0,"created_at":"Tue Mar 31 09:29:28 +0000 2015","favourites_count":0,"utc_offset":null,"time_zone":null,"geo_enabled":true,"verified":false,"statuses_count":5,"lang":"en","status":{"created_at":"Wed Dec 30 03:26:29 +0000 2015","id":6.8204002977487e+17,"id_str":"682040029774872580","text":"diadoo https:\\/\\/t.co\\/oNf8JIAL2x","source":"<a href=\\"http:\\/\\/twitter.com\\" rel=\\"nofollow\\">Twitter Web Client<\\/a>","truncated":false,"in_reply_to_status_id":null,"in_reply_to_status_id_str":null,"in_reply_to_user_id":null,"in_reply_to_user_id_str":null,"in_reply_to_screen_name":null,"geo":null,"coordinates":null,"place":null,"contributors":null,"retweet_count":0,"favorite_count":0,"entities":{"hashtags":[],"symbols":[],"user_mentions":[],"urls":[{"url":"https:\\/\\/t.co\\/oNf8JIAL2x","expanded_url":"http:\\/\\/diadoo.dev\\/ta\\/diadoo\\/frontend\\/web\\/index.php?r=classified%2Fdetail-classified&id=192","display_url":"diadoo.dev\\/ta\\/diadoo\\/fron\\u2026","indices":[7,30]}]},"favorited":false,"retweeted":false,"possibly_sensitive":false,"lang":"es"},"contributors_enabled":false,"is_translator":false,"is_translation_enabled":false,"profile_background_color":"C0DEED","profile_background_image_url":"http:\\/\\/abs.twimg.com\\/images\\/themes\\/theme1\\/bg.png","profile_background_image_url_https":"https:\\/\\/abs.twimg.com\\/images\\/themes\\/theme1\\/bg.png","profile_background_tile":false,"profile_image_url":"http:\\/\\/abs.twimg.com\\/sticky\\/default_profile_images\\/default_profile_6_normal.png","profile_image_url_https":"https:\\/\\/abs.twimg.com\\/sticky\\/default_profile_images\\/default_profile_6_normal.png","profile_link_color":"0084B4","profile_sidebar_border_color":"C0DEED","profile_sidebar_fill_color":"DDEEF6","profile_text_color":"333333","profile_use_background_image":true,"has_extended_profile":false,"default_profile":true,"default_profile_image":true,"following":false,"follow_request_sent":false,"notifications":false}', 'c8e439513d08ac56bdb08d8d09a2371a', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject_report`
--

CREATE TABLE IF NOT EXISTS `subject_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `is_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `subject_report`
--

INSERT INTO `subject_report` (`id`, `subject`, `description`, `create_at`, `update_at`, `is_status`) VALUES
(4, 'sadfas sss', 'dd', '2015-12-17 17:27:02', '2015-12-17 17:27:02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE IF NOT EXISTS `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`user_id`, `code`, `created_at`, `type`) VALUES
(20, '0UGNzKvgT57XjymjEQx3EyYLt5zNnBd8', 1451516480, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_email` (`email`),
  UNIQUE KEY `user_unique_username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`) VALUES
(1, 'sysadmin', 'sysadmin@localhost.com', '$2y$10$g1bdv/lUplKCSGsAYTxzsum4cwRQE44fsVMqptNB8f3m2sWb8alnG', 'aW7nWSxRC88yJJ8UtgDryeUJacb-yxmV', 1447122037, NULL, NULL, '127.0.0.1', 1447121988, 1447121988, 0),
(13, 'deviardiana', 'deppi86@ymail.com', '$2y$10$glCqfF1L8tyOe29WLp3mN.bXqN8oA/xWPrEHiPkY/xuvmgJgKR7qi', 'Wy_2_5XEAY3Wc9Y-eonhz3PR_gBRYrm_', 1451436436, NULL, NULL, '127.0.0.1', 1451436436, 1451436436, 0),
(20, 'deviardn', 'deviardn@gmail.com', '$2y$10$ZZNuk1yxGr8zKCN659ZDauFRs87VYDoAr22y9FPYxcb5Pc4sY0Tmu', 'hNwjpJwunf1-6VNQaKyN4mmte5qSVBsv', NULL, NULL, NULL, '127.0.0.1', 1451516479, 1451516479, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_account`
--
ALTER TABLE `social_account`
  ADD CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

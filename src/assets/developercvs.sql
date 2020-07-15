-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for developercvs
CREATE DATABASE IF NOT EXISTS `developercvs` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `developercvs`;

-- Dumping structure for table developercvs.companies
DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `id` varchar(50) NOT NULL,
  `title` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table developercvs.companies: ~0 rows (approximately)
DELETE FROM `companies`;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;

-- Dumping structure for table developercvs.countries
DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table developercvs.countries: ~0 rows (approximately)
DELETE FROM `countries`;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;

-- Dumping structure for table developercvs.jobroles
DROP TABLE IF EXISTS `jobroles`;
CREATE TABLE IF NOT EXISTS `jobroles` (
  `id` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table developercvs.jobroles: ~0 rows (approximately)
DELETE FROM `jobroles`;
/*!40000 ALTER TABLE `jobroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobroles` ENABLE KEYS */;

-- Dumping structure for table developercvs.job_skills
DROP TABLE IF EXISTS `job_skills`;
CREATE TABLE IF NOT EXISTS `job_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userjob_id` int(11) DEFAULT NULL,
  `skill_id` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Project` (`userjob_id`),
  KEY `Skill` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table developercvs.job_skills: ~0 rows (approximately)
DELETE FROM `job_skills`;
/*!40000 ALTER TABLE `job_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_skills` ENABLE KEYS */;

-- Dumping structure for table developercvs.projecttypes
DROP TABLE IF EXISTS `projecttypes`;
CREATE TABLE IF NOT EXISTS `projecttypes` (
  `id` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table developercvs.projecttypes: ~0 rows (approximately)
DELETE FROM `projecttypes`;
/*!40000 ALTER TABLE `projecttypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `projecttypes` ENABLE KEYS */;

-- Dumping structure for table developercvs.project_skills
DROP TABLE IF EXISTS `project_skills`;
CREATE TABLE IF NOT EXISTS `project_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userproject_id` int(11) DEFAULT NULL,
  `skill_id` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Project` (`userproject_id`),
  KEY `Skill` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table developercvs.project_skills: ~0 rows (approximately)
DELETE FROM `project_skills`;
/*!40000 ALTER TABLE `project_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_skills` ENABLE KEYS */;

-- Dumping structure for table developercvs.skills
DROP TABLE IF EXISTS `skills`;
CREATE TABLE IF NOT EXISTS `skills` (
  `id` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table developercvs.skills: ~0 rows (approximately)
DELETE FROM `skills`;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;

-- Dumping structure for table developercvs.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `country` varchar(5) DEFAULT NULL,
  `address` text,
  `whatsapp` varchar(50) DEFAULT NULL,
  `skype` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Country` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table developercvs.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table developercvs.user_jobs
DROP TABLE IF EXISTS `user_jobs`;
CREATE TABLE IF NOT EXISTS `user_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `company_id` varchar(50) NOT NULL DEFAULT '0',
  `jobrole_id` varchar(50) NOT NULL DEFAULT '0',
  `year_started` smallint(6) NOT NULL DEFAULT '0',
  `year_left` smallint(6) NOT NULL DEFAULT '0',
  `responsibilities` text,
  `achievements` text,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `User` (`user_id`),
  KEY `Company` (`company_id`),
  KEY `Role` (`jobrole_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table developercvs.user_jobs: ~0 rows (approximately)
DELETE FROM `user_jobs`;
/*!40000 ALTER TABLE `user_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_jobs` ENABLE KEYS */;

-- Dumping structure for table developercvs.user_projects
DROP TABLE IF EXISTS `user_projects`;
CREATE TABLE IF NOT EXISTS `user_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `projecttype_id` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `repository` varchar(255) DEFAULT NULL,
  `description` text,
  `year_start` smallint(6) DEFAULT NULL,
  `year_completed` smallint(6) DEFAULT NULL,
  `ongoing` varchar(1) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `User` (`user_id`),
  KEY `Project Type` (`projecttype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table developercvs.user_projects: ~0 rows (approximately)
DELETE FROM `user_projects`;
/*!40000 ALTER TABLE `user_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_projects` ENABLE KEYS */;

-- Dumping structure for table developercvs.user_skills
DROP TABLE IF EXISTS `user_skills`;
CREATE TABLE IF NOT EXISTS `user_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `skill_id` varchar(50) NOT NULL DEFAULT '0',
  `level` tinyint(4) NOT NULL DEFAULT '0',
  `years_of_experience` tinyint(4) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `User` (`user_id`),
  KEY `Skill` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table developercvs.user_skills: ~0 rows (approximately)
DELETE FROM `user_skills`;
/*!40000 ALTER TABLE `user_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_skills` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

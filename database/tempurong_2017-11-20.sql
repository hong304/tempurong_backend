# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.18-0ubuntu0.16.04.1)
# Database: tempurong
# Generation Time: 2017-11-20 05:09:00 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table reservation_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reservation_details`;

CREATE TABLE `reservation_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `no_of_people` int(11) DEFAULT NULL,
  `add_bed` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `refund_status` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status_time` timestamp NULL DEFAULT NULL,
  `refund_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `reservation_details` WRITE;
/*!40000 ALTER TABLE `reservation_details` DISABLE KEYS */;

INSERT INTO `reservation_details` (`id`, `room_id`, `room_type_id`, `reservation_id`, `price`, `capacity`, `no_of_people`, `add_bed`, `status`, `refund_status`, `start_date`, `end_date`, `status_time`, `refund_time`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,1,1,1,250,4,4,0,NULL,NULL,'2017-12-01','2017-12-03',NULL,NULL,NULL,'2017-11-20 05:08:12',NULL),
	(2,2,1,1,250,4,4,0,NULL,NULL,'2017-12-01','2017-12-02',NULL,NULL,NULL,'2017-11-20 05:08:12',NULL),
	(3,3,1,2,250,4,4,0,NULL,NULL,'2017-12-01','2017-12-05',NULL,NULL,NULL,'2017-11-20 05:08:12',NULL),
	(4,12,1,3,250,4,4,0,NULL,NULL,'2017-12-02','2017-12-05',NULL,NULL,NULL,'2017-11-20 05:08:12',NULL),
	(5,11,1,4,250,4,4,0,NULL,NULL,'2017-12-04','2017-12-07',NULL,NULL,NULL,'2017-11-20 05:08:12',NULL),
	(6,12,1,5,250,4,4,0,NULL,NULL,'2017-12-08','2017-12-11',NULL,NULL,NULL,'2017-11-20 05:08:12',NULL),
	(7,11,1,5,250,4,4,0,NULL,NULL,'2017-12-07','2017-12-11',NULL,NULL,NULL,'2017-11-20 05:08:12',NULL),
	(8,12,1,6,250,4,4,0,NULL,NULL,'2017-12-05','2017-12-08',NULL,NULL,NULL,'2017-11-20 05:08:12',NULL),
	(9,3,1,7,250,4,4,0,NULL,NULL,'2017-12-06','2017-12-09',NULL,NULL,NULL,'2017-11-20 05:08:12',NULL),
	(10,5,1,5,250,4,4,0,NULL,NULL,'2017-12-04','2017-12-07',NULL,NULL,NULL,'2017-11-20 05:08:12',NULL),
	(11,1,1,5,250,4,4,0,NULL,NULL,'2017-11-28','2017-11-30',NULL,NULL,NULL,NULL,NULL),
	(12,13,1,5,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-03','2017-12-11',NULL,NULL,NULL,'2017-11-20 05:08:12',NULL);

/*!40000 ALTER TABLE `reservation_details` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table reservations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reservations`;

CREATE TABLE `reservations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `guests` int(2) DEFAULT NULL,
  `check_in` date DEFAULT NULL,
  `check_out` date DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `addition_note` text,
  `amount` int(11) DEFAULT NULL,
  `payment_method` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;

INSERT INTO `reservations` (`id`, `first_name`, `last_name`, `transaction_id`, `email`, `guests`, `check_in`, `check_out`, `language`, `addition_note`, `amount`, `payment_method`, `created_at`, `updated_at`, `deleted_at`, `status`)
VALUES
	(1,NULL,NULL,'5467890','test@test.com',NULL,NULL,NULL,'en',NULL,500,'paypal',NULL,NULL,NULL,NULL),
	(2,NULL,NULL,'4567890','test2@test.com',NULL,NULL,NULL,'en',NULL,250,'paypal',NULL,NULL,NULL,NULL),
	(3,NULL,NULL,'7652679','test3@test.com',NULL,NULL,NULL,'sc',NULL,250,'paypal',NULL,NULL,NULL,NULL),
	(4,NULL,NULL,'6578877','test4@test.com',NULL,NULL,NULL,'en',NULL,250,'paypal',NULL,NULL,NULL,NULL),
	(5,NULL,NULL,'7658809','test5@test.com',NULL,NULL,NULL,'en',NULL,500,'paypal',NULL,NULL,NULL,NULL),
	(6,NULL,NULL,'6876425','test6@test.com',NULL,NULL,NULL,'sc',NULL,250,'paypal',NULL,NULL,NULL,NULL),
	(7,NULL,NULL,'4761909','test7@test.com',NULL,NULL,NULL,'en',NULL,250,'paypal',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table room_images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `room_images`;

CREATE TABLE `room_images` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `cover_photo` tinyint(1) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table room_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `room_types`;

CREATE TABLE `room_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL,
  `name_sc` varchar(255) DEFAULT NULL,
  `capacity` int(10) DEFAULT NULL,
  `add_bed` tinyint(1) DEFAULT '0',
  `queen_bed` int(10) DEFAULT '0',
  `bunk_bed` int(10) DEFAULT '0',
  `price` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `room_types` WRITE;
/*!40000 ALTER TABLE `room_types` DISABLE KEYS */;

INSERT INTO `room_types` (`id`, `name_en`, `name_sc`, `capacity`, `add_bed`, `queen_bed`, `bunk_bed`, `price`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'sea view','海景房',4,1,2,NULL,250,NULL,NULL,NULL),
	(2,'river view (big)','河景房（大）',6,0,1,2,274,NULL,NULL,NULL),
	(3,'river view (small)','河景房（小）',4,1,1,1,250,NULL,NULL,NULL);

/*!40000 ALTER TABLE `room_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rooms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `room_type_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;

INSERT INTO `rooms` (`id`, `room_type_id`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,1,NULL,NULL,NULL),
	(2,1,NULL,NULL,NULL),
	(3,1,NULL,NULL,NULL),
	(4,1,NULL,NULL,NULL),
	(5,1,NULL,NULL,NULL),
	(6,1,NULL,NULL,NULL),
	(7,1,NULL,NULL,NULL),
	(8,1,NULL,NULL,NULL),
	(9,2,NULL,NULL,NULL),
	(10,2,NULL,NULL,NULL),
	(11,2,NULL,NULL,NULL),
	(12,3,NULL,NULL,NULL),
	(13,3,NULL,NULL,NULL);

/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

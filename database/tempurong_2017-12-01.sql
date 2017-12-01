# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.18-0ubuntu0.16.04.1)
# Database: tempurong
# Generation Time: 2017-12-01 08:06:36 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table activities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activities`;

CREATE TABLE `activities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL,
  `name_sc` varchar(255) DEFAULT NULL,
  `duration` int(10) DEFAULT NULL,
  `distance` int(10) DEFAULT NULL,
  `difficulty` float DEFAULT NULL,
  `introduction` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;

INSERT INTO `activities` (`id`, `name_en`, `name_sc`, `duration`, `distance`, `difficulty`, `introduction`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Spiritual Tree',NULL,5,200,NULL,'Just a 5-minute walk away, there is a towering tree that dates back over 400 years, to a time when two young lovers, one Christian and one Muslim, ran away after their relationship was forbidden by their families. Eventually they came upon the tree, and a spirit in the tree spoke to them, directing them onward. Travelers can visit the large and ancient tree, which still grows sourly fruit to this day. ',NULL,NULL,NULL),
	(2,'Healing Well',NULL,5,200,NULL,'Over 400 years ago, there was a devastating drought in the area. Villagers were directed to dig a well in a location that was thought to have a water source underground. The villagers tasked with digging the well were skeptical, but with little choice they kept digging anyways. Amazingly, the well they dug was able to provide enough water for the whole village for a long time to come. The water was known to have healing properties, so when elders fell ill, they would bathe in and drink from the well.  This well is now known as the Wellness Healing Well and is a 5-minute walk away from the resort.',NULL,NULL,NULL),
	(3,'Love Rock',NULL,25,1000,NULL,'Known locally as Batu Luang, Love rock is a bell-shaped rock located on a beautiful strip of beach in Kuala Penyu. Surrounded by mossy rocks, caves, and set to the backdrop of the ocean behind it, you can see one of the most beautiful sunsets in all of Sabah. Love Rock is located 1KM from the resort and is a 25-minute walk away.',NULL,NULL,NULL);

/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table activity_images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activity_images`;

CREATE TABLE `activity_images` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `activity_images` WRITE;
/*!40000 ALTER TABLE `activity_images` DISABLE KEYS */;

INSERT INTO `activity_images` (`id`, `activity_id`, `cover_image`, `image_path`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,1,'/static/img/demo-about-01.jpg','',NULL,NULL,NULL),
	(2,2,'/static/img/demo-about-01.jpg','',NULL,NULL,NULL),
	(3,3,'/static/img/demo-about-01.jpg','',NULL,NULL,NULL);

/*!40000 ALTER TABLE `activity_images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



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
  `mattress` int(11) DEFAULT NULL,
  `breakfast` int(11) DEFAULT NULL,
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

INSERT INTO `reservation_details` (`id`, `room_id`, `room_type_id`, `reservation_id`, `price`, `capacity`, `no_of_people`, `mattress`, `breakfast`, `status`, `refund_status`, `start_date`, `end_date`, `status_time`, `refund_time`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,13,1,1,250,4,4,0,NULL,NULL,NULL,'2017-12-01','2017-12-03',NULL,NULL,NULL,'2017-12-01 07:59:44',NULL),
	(2,12,1,1,250,4,4,0,NULL,NULL,NULL,'2017-12-01','2017-12-02',NULL,NULL,NULL,'2017-12-01 07:59:44',NULL),
	(3,11,1,2,250,4,4,0,NULL,NULL,NULL,'2017-12-01','2017-12-05',NULL,NULL,NULL,'2017-12-01 07:59:44',NULL),
	(4,12,1,3,250,4,4,0,NULL,NULL,NULL,'2017-12-02','2017-12-05',NULL,NULL,NULL,'2017-12-01 07:59:44',NULL),
	(5,7,1,4,250,4,4,0,NULL,NULL,NULL,'2017-12-04','2017-12-07',NULL,NULL,NULL,'2017-12-01 07:24:12',NULL),
	(6,12,1,5,250,4,4,0,NULL,NULL,NULL,'2017-12-08','2017-12-11',NULL,NULL,NULL,'2017-12-01 07:59:44',NULL),
	(7,11,1,5,250,4,4,0,NULL,NULL,NULL,'2017-12-07','2017-12-11',NULL,NULL,NULL,'2017-12-01 07:59:44',NULL),
	(8,12,1,6,250,4,4,0,NULL,NULL,NULL,'2017-12-05','2017-12-08',NULL,NULL,NULL,'2017-12-01 07:59:44',NULL),
	(9,13,1,7,250,4,4,0,NULL,NULL,NULL,'2017-12-06','2017-12-09',NULL,NULL,NULL,'2017-12-01 07:59:44',NULL),
	(10,8,1,5,250,4,4,0,NULL,NULL,NULL,'2017-12-04','2017-12-07',NULL,NULL,NULL,'2017-12-01 07:24:12',NULL),
	(11,1,1,5,250,4,4,0,NULL,NULL,NULL,'2017-11-28','2017-11-30',NULL,NULL,NULL,'2017-11-30 12:08:11',NULL),
	(12,6,1,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-03','2017-12-11',NULL,NULL,NULL,'2017-12-01 07:59:44',NULL),
	(38,13,1,42,560,5,NULL,1,1,'waiting_for_payment',NULL,'2017-12-03','2017-12-05',NULL,NULL,'2017-12-01 07:17:57','2017-12-01 07:59:44',NULL),
	(39,4,1,42,536,5,NULL,1,0,'waiting_for_payment',NULL,'2017-12-03','2017-12-05',NULL,NULL,'2017-12-01 07:17:57','2017-12-01 07:59:44',NULL),
	(40,5,2,42,572,6,NULL,0,1,'waiting_for_payment',NULL,'2017-12-03','2017-12-05',NULL,NULL,'2017-12-01 07:17:57','2017-12-01 07:59:44',NULL),
	(41,7,1,43,560,5,NULL,1,1,'waiting_for_payment',NULL,'2017-12-04','2017-12-06',NULL,NULL,'2017-12-01 07:25:29','2017-12-01 07:59:44',NULL),
	(42,8,2,43,572,6,NULL,0,1,'waiting_for_payment',NULL,'2017-12-04','2017-12-06',NULL,NULL,'2017-12-01 07:25:29','2017-12-01 07:59:44',NULL);

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
  `adults` int(2) DEFAULT NULL,
  `children` int(2) DEFAULT NULL,
  `check_in` date DEFAULT NULL,
  `check_out` date DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `remarks` text,
  `addition_note` text,
  `amount` int(11) DEFAULT NULL,
  `payment_method` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `session` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;

INSERT INTO `reservations` (`id`, `first_name`, `last_name`, `transaction_id`, `email`, `adults`, `children`, `check_in`, `check_out`, `language`, `remarks`, `addition_note`, `amount`, `payment_method`, `created_at`, `updated_at`, `deleted_at`, `status`, `session`)
VALUES
	(1,NULL,NULL,'5467890','test@test.com',NULL,NULL,NULL,NULL,'en',NULL,NULL,500,'paypal',NULL,NULL,NULL,NULL,NULL),
	(2,NULL,NULL,'4567890','test2@test.com',NULL,NULL,NULL,NULL,'en',NULL,NULL,250,'paypal',NULL,NULL,NULL,NULL,NULL),
	(3,NULL,NULL,'7652679','test3@test.com',NULL,NULL,NULL,NULL,'sc',NULL,NULL,250,'paypal',NULL,NULL,NULL,NULL,NULL),
	(4,NULL,NULL,'6578877','test4@test.com',NULL,NULL,NULL,NULL,'en',NULL,NULL,250,'paypal',NULL,NULL,NULL,NULL,NULL),
	(5,NULL,NULL,'7658809','test5@test.com',NULL,NULL,NULL,NULL,'en',NULL,NULL,500,'paypal',NULL,NULL,NULL,NULL,NULL),
	(6,NULL,NULL,'6876425','test6@test.com',NULL,NULL,NULL,NULL,'sc',NULL,NULL,250,'paypal',NULL,NULL,NULL,NULL,NULL),
	(7,NULL,NULL,'4761909','test7@test.com',NULL,NULL,NULL,NULL,'en',NULL,NULL,250,'paypal',NULL,NULL,NULL,NULL,NULL),
	(42,'Cleo','Chan',NULL,'cc@buildonauts.com',2,0,'2017-12-03','2017-12-05','en',NULL,NULL,1668,'paypal','2017-12-01 07:17:57','2017-12-01 07:17:57',NULL,'waiting_for_payment','5a2102253ae56192'),
	(43,'Cleo','Chan',NULL,'cc@buildonauts.com',2,0,'2017-12-04','2017-12-06','en',NULL,NULL,1132,'paypal','2017-12-01 07:25:29','2017-12-01 07:25:29',NULL,'waiting_for_payment','5a2103e990140259');

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
  `room_title_en` varchar(255) DEFAULT NULL,
  `room_title_sc` varchar(255) DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `description` text,
  `capacity` int(2) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `add_bed` tinyint(1) DEFAULT '0',
  `queen_bed` int(2) DEFAULT '0',
  `bunk_bed` int(2) DEFAULT '0',
  `price` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `room_types` WRITE;
/*!40000 ALTER TABLE `room_types` DISABLE KEYS */;

INSERT INTO `room_types` (`id`, `name_en`, `name_sc`, `room_title_en`, `room_title_sc`, `cover_image`, `description`, `capacity`, `size`, `add_bed`, `queen_bed`, `bunk_bed`, `price`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'sea view','海景房','Family Rooms','家庭房',NULL,'Just 20 steps from the sandy beach, our Sea View rooms are private lodgings capable of accommodating anyone from a small family to a single traveler who just wants a space to call their own. Each one comes complete with two queen sized beds, an air conditioning unit, a fan, mosquito nets, and a bathroom with western flushing toilets and hot water for showers. The rooms face out onto a beautiful spread of beach where guests can enjoy hammocks and our sunset bar. \n',4,'16 sq. ft by 15 sq ft = 240 square feet',1,2,NULL,250,NULL,NULL,NULL),
	(2,'river view','河景房','Large Family Rooms','大家庭房',NULL,'3 mix dormitory river view rooms with 2 double decker &amp; 1 queen bed (6pax)\n',6,'16 sq. ft by 15 sq ft = 240 square feet',0,1,2,274,NULL,NULL,NULL),
	(3,'river view','河景房','Family Rooms','家庭房',NULL,'2 family rooms river view rooms with 1 double decker &amp; 1 queen bed (4pax)\n',4,'16 sq. ft by 15 sq ft = 240 square feet',1,1,1,250,NULL,NULL,NULL);

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

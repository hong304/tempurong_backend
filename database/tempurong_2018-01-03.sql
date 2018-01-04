# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.20-0ubuntu0.16.04.1)
# Database: tempurong
# Generation Time: 2018-01-03 10:33:08 +0000
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
  `subtitle_en` varchar(255) DEFAULT NULL,
  `subtitle_sc` varchar(255) DEFAULT NULL,
  `duration` int(10) DEFAULT NULL,
  `distance` int(10) DEFAULT NULL,
  `difficulty` float DEFAULT NULL,
  `description_en` text,
  `description_sc` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;

INSERT INTO `activities` (`id`, `name_en`, `name_sc`, `subtitle_en`, `subtitle_sc`, `duration`, `distance`, `difficulty`, `description_en`, `description_sc`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Spiritual Tree',NULL,NULL,NULL,5,200,NULL,'A 5-minute wander from the resort there is a towering tree that dates back over 400 years, to a time when two young lovers ran away after their relationship was forbidden by their families. Eventually they came upon the tree, and a spirit in the tree spoke to them, directing them onward despite the challenges. Travelers can visit the large and ancient tree, which still grows fruit to this day. ',NULL,NULL,NULL,NULL),
	(2,'Healing Well',NULL,NULL,NULL,5,200,NULL,'Over 400 years ago, there was a devastating drought in the area. Villagers were directed to dig a well in a location that was thought to have a water source underground. The villagers tasked with digging the well were skeptical, but with little choice they kept digging anyways. Amazingly, the well they dug was able to provide enough water for the whole village for a long time to come. The water was known to have healing properties, so when elders fell ill, they would bathe in and drink from the well.  This well is now known as the Wellness Healing Well and is a 5-minute walk from the resort.',NULL,NULL,NULL,NULL),
	(3,'Love Rock',NULL,NULL,NULL,25,1000,NULL,'Known locally as Batu Luang （meaning free rock in Malay), Love rock is a bell-shaped rock located on a beautiful strip of beach in Kuala Penyu. Surrounded by mossy rocks, caves, and set to the backdrop of the ocean behind it, you can see one of the most beautiful sunsets in all of Sabah. Love Rock is located 1KM from the resort and is a 25-minute walk away. Here lies a poignant love story with this everlasting concentric rock.',NULL,NULL,NULL,NULL),
	(4,'Pulau Tiga Day Trip','生还者之岛一日游','Snorkeling and Volcano Mud Bath','迪迦岛浮潜及火山泥浴',25,1000,3.5,'Pulau Tiga is an island off the coast of Borneo that is most well known as “Survivor Island”, as it was the location where the debut season of Survivor was filmed. On this day trip you will depart from the resort by 8:30AM and travel to the beautiful waters off the coast of the island for swimming and snorkeling at various locations. Marvelous sights of giant clams, families of tropical fish, and other beautiful ocean life are common amongst the coral reefs.\n<br><br>\nYou will also have the option of dipping into the volcano mud baths of Pulau Tiga, which are a leisurely 20-minute hike inland from the island’s shore, and enjoy a fun experience said to be good for the skin (Be sure to bring footwear that you won’t mind getting muddy if you opt for the hike!). The length of stay is up to you but we are usually back at the resort by 2:00PM where you can enjoy the rest of the afternoon at your leisure!','迪迦岛是位于婆罗洲海岸的一个岛屿，它也誉名为“生还者之岛”（Survivor Island），基于它因美国拍摄了生还者电视剧而火红的地方。在这一天的行程中，您将于上午8:30离开度假村，前往岛上海岸的美丽水域，在不同的地点游泳和浮潜。在海底世界可以观赏到巨大的蛤蜊，色彩兵纷的珊瑚礁环境里有许许多多热带鱼的家庭和其他美丽的海洋生物。\n<br><br>\n您也可以选择在岛上岸边徒步20分钟到热带岛屿的火山泥浴，并享受一个有趣的体验，据说火山泥对皮肤有滋润美白的功效（选择徒步旅行者请务必携带鞋子，除非你不介意变得浑浊！）。您将投奔大海边清洗边游泳，沉醉在大海的拥抱中。我们通常在下午2:00之前回到休闲亦有隐私的度假村享用美味道地午餐。',NULL,NULL,NULL),
	(5,'Mangrove River Cruise','红树林游船','Proboscis Monkeys and Fireflies','长鼻猴和萤火虫',25,1000,3.5,'The River Cruise offers opportunities to see the wildlife of Borneo’s wetland jungles. The trip would begin by traveling to the Klias River, about a half hour away from the resort. Upon arrival, there would be a tea break before embarking on a boat ride in search of the Proboscis monkeys, an endangered species that are native to Sabah and are most known for their signature long noses and protruding bellies. Proboscis monkey is our national treasure and only found in Borneo Island. Have you ever seen monkey that does not eat banana? Well, this is the only species! Come and find out more about this interesting monkey!\n<br><br>\nAfter a one and a half hour cruise, we enjoy a break and eat dinner so that you can enjoy the local tastes before embarking on the Firefly Cruise. The evening cruise becomes a mystical ride through the mangroves where fireflies light up the darkness like magical specks and the sounds of nature surround you. Please note that sightings are common, but not guaranteed.','红树林游船提供了看到婆罗洲湿地丛林野生动物在它们自然状态的机会。这个克利亚斯河景点距离度假村大约半小时的车程。抵达后，乘船游览长鼻猴，这是一种原产于沙巴的濒危物种，以其长长的鼻子和突出的腹部而闻名。长鼻猴是马来西亚国宝。它是世界仅有也只生长在婆罗洲岛。有没有见过不吃香蕉的猴子？来吧！在这里你可以寻觅探索观赏到这非常特别的猴子品种。\n<br><br>\n经过一个半小时的巡航，我们休息片刻然后享用当地的风味晚餐。晚餐后，开始萤火虫巡航。晚上的巡游变成了神秘的红树林，在这里，萤火虫像魔法般的斑点照亮黑暗，自然的音律环绕着你。这种生态是常见的，当然气候不好则另当别论。',NULL,NULL,NULL),
	(6,'Escorted Jungle Trekking ','陪同的丛林徒步旅行',NULL,NULL,25,1000,3.5,'Enjoy some of the world’s dwindling rain forests by doing a leisurely jungle trek - about an hour long. Trek through the low land forest where you may see different kinds of reptiles, birds, plants, bamboo, rattan, and more. Visitors are advised to wear sandals or a good pair of walking shoes, insect repellent, sun screen, a small bottle of water will be provided.\n<br><br>\nThe Healing Well and Love Rock (also known as Space Rock) are also nearby so these additional areas could be tied into after your trek. The sunset is especially gorgeous from the beach by Space Rock as there are rarely any people around. Enjoy the rich colors as the sky changes from golds and oranges to deep reds.','通过一个长达一小时的悠闲丛林徒步旅行，享受世界上一些日益减少的热带雨林。跋涉在低地森林中，您可以看到各种爬行动物，鸟类，植物，竹子，藤条等等。建议游客穿凉鞋或者一双好的步行鞋，驱蚊剂，防晒霜，提供一小瓶水。客人可以自由自在各自徒步。若需陪同，则要另外付费。\n<br><br>\n疗愈水池和同心岩石（太空岩石）也是附近的周边景点，陪同森林徒步后也可以额外到这些地区跋涉。漫步到太岩石的海滩上看日落特别美丽。在这里周围环境的人很稀少。随着天空从黄金和橘子变成深红色，享受无际天空海洋色泽渐变丰富的色彩。。。真是人生一大享受！！！',NULL,NULL,NULL);

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
	(1,1,'/static/img/activities/tree.jpg','',NULL,NULL,NULL),
	(2,2,'/static/img/activities/well.jpg','',NULL,NULL,NULL),
	(3,3,'/static/img/activities/rock.jpg','',NULL,NULL,NULL),
	(4,4,'/static/img/activities/PULAU_TIGA_DAY_TRIP/cover.jpg','',NULL,NULL,NULL),
	(5,4,NULL,'/static/img/activities/PULAU_TIGA_DAY_TRIP/01.jpg',NULL,NULL,NULL),
	(6,4,NULL,'/static/img/activities/PULAU_TIGA_DAY_TRIP/02.jpg',NULL,NULL,NULL),
	(7,5,'/static/img/activities/MANGROVE_RIVER_CRUISE/cover.jpg','',NULL,NULL,NULL),
	(8,5,NULL,'/static/img/activities/MANGROVE_RIVER_CRUISE/01.jpg',NULL,NULL,NULL),
	(9,5,NULL,'/static/img/activities/MANGROVE_RIVER_CRUISE/01.jpg',NULL,NULL,NULL),
	(10,6,'/static/img/activities/ESCORTED_JUNGLE_TREKKING/cover.jpg','',NULL,NULL,NULL),
	(11,6,NULL,'/static/img/activities/ESCORTED_JUNGLE_TREKKING/cover.jpg',NULL,NULL,NULL),
	(12,6,NULL,'/static/img/activities/ESCORTED_JUNGLE_TREKKING/cover.jpg',NULL,NULL,NULL);

/*!40000 ALTER TABLE `activity_images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table enquiries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `enquiries`;

CREATE TABLE `enquiries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `enquiries` WRITE;
/*!40000 ALTER TABLE `enquiries` DISABLE KEYS */;

INSERT INTO `enquiries` (`id`, `first_name`, `last_name`, `email`, `message`, `created_at`, `updated_at`)
VALUES
	(1,'test a','name b','abc@buildonauts.com','testing','2017-12-13 05:30:51','2017-12-13 05:30:51'),
	(2,'test a','name b','abc@buildonauts.com','testing','2017-12-13 08:38:08','2017-12-13 08:38:08'),
	(3,'test a','name b','abc@buildonauts.com','testing','2017-12-13 08:39:37','2017-12-13 08:39:37'),
	(4,'test a','name b','abc@buildonauts.com','testing','2017-12-13 08:41:22','2017-12-13 08:41:22'),
	(5,'testing','test','test@buildonauts.com','test dev','2017-12-13 08:45:04','2017-12-13 08:45:04'),
	(6,'hi','world','hi@buildonauts.com','testing','2017-12-14 06:30:13','2017-12-14 06:30:13'),
	(7,'test a','name b','abc@buildonauts.com','testing','2017-12-14 06:31:52','2017-12-14 06:31:52'),
	(8,'testing','test','kl@buildonauts.com','sajdhajskhdkajsdh','2017-12-14 06:34:45','2017-12-14 06:34:45'),
	(9,'abc','test','abc@buildonauts.com','sadhj sahdjsa hdj as','2017-12-14 06:39:12','2017-12-14 06:39:12'),
	(10,'abc','abc','hsajdhajks@yahoo.com.hk','sdahjkdhak sad as das','2017-12-14 06:40:24','2017-12-14 06:40:24'),
	(11,'test a','name b','abc@buildonauts.com','testing','2017-12-14 06:40:51','2017-12-14 06:40:51'),
	(12,'test a','name b','abc@buildonauts.com','testing','2017-12-14 06:42:14','2017-12-14 06:42:14'),
	(13,'test','test','hello@buildonauts.com','testing mail','2017-12-14 06:50:27','2017-12-14 06:50:27'),
	(14,'test again','again','kay@buildonauts.com','hskadhjkashdjska hsja khasjk hd','2017-12-14 06:53:09','2017-12-14 06:53:09'),
	(15,'ggg','ggkkk','gg@buildonauts.com','ggah ash jdas das dsa das','2017-12-14 07:04:05','2017-12-14 07:04:05'),
	(16,'abc','again','test@abc.com','asdsadsadsads','2017-12-14 07:37:24','2017-12-14 07:37:24'),
	(17,'test','asdas','test@hello.com','hsajkdhajskhdjkashdisa sad as','2017-12-14 07:41:14','2017-12-14 07:41:14');

/*!40000 ALTER TABLE `enquiries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table foods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `foods`;

CREATE TABLE `foods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL,
  `name_sc` varchar(255) DEFAULT NULL,
  `subtitle_en` varchar(255) DEFAULT NULL,
  `subtitle_sc` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `description_en` text,
  `description_sc` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;

INSERT INTO `foods` (`id`, `name_en`, `name_sc`, `subtitle_en`, `subtitle_sc`, `image_path`, `description_en`, `description_sc`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Barbeque',NULL,'Most popular for sunset dinners',NULL,'/static/img/food/bbq.jpg','Guests love having BBQs on our Sunset Terrace, where we’re on the long flat beach with few people and Mother Nature’s glorious sunset show. You can request certain types of seafood or meats and we will do our best to accommodate!',NULL,NULL,NULL,NULL),
	(2,'Steamboat Hotpot',NULL,'Great for families and groups',NULL,'/static/img/food/hotpot.jpg','With all these amazing ingredients, it’s no surprise that Steamboat is one of our most requested meals. We have two different stocks (one can be a spicy option) where all kinds of meats and vegetables can be dipped and feasted on. At the very end, the most delicious soup will be ready to finish off the meal!',NULL,NULL,NULL,NULL),
	(3,'Fresh Seafood',NULL,'Sabah must-try!',NULL,'/static/img/food/seafood.jpg','If you visit Kota Kinabalu, you must indulge in the seafood! We can offer large, juicy tiger prawns, skate, clams, crab and a variety of delicious fish to be served up fried, grilled, or steamed. We can create a customize menu as long as we have some notice. Yum!',NULL,NULL,NULL,NULL),
	(4,'Vegetarian',NULL,'Organic, fresh, and locally grown',NULL,'/static/img/food/vegetable.jpg','Vegetarians rejoice, there is plenty for you to enjoy in such a plentiful region! There are lots of local and wild vegetation that aren’t found anywhere else, with great textures to enjoy. Some have delicate, flavorsome leaves, some with a nice crunch, and some that are best when just cut.',NULL,NULL,NULL,NULL),
	(5,'Wild Chicken',NULL,'Truly “free-range” and locally caught',NULL,'/static/img/food/wildchicken.jpg','Did you know that different kinds of chickens taste slightly different? Wild chickens roam around and we can catch and prepare them for you fresh. Talk about free range! Ask us about our choice in chickens.',NULL,NULL,NULL,NULL),
	(6,'Western Style Breakfast',NULL,'Comfortable and familiar',NULL,'/static/img/food/breakfast.jpg','If you’re craving a light breakfast, we also have the option for eggs, omelettes, sausages and toast with fresh fruit. If you would prefer something specific, please let us know so that we can stock the kitchen for your comfort!',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
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

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),
	(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),
	(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),
	(6,'2016_06_01_000004_create_oauth_clients_table',1),
	(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`)
VALUES
	('0186593f5833a931af482f213020017c1eb5428a62ddcc406de3c3950feac0451ed4bbbf0bc434a8',1,1,'MyApp','[]',0,'2018-01-03 04:08:04','2018-01-03 04:08:04','2019-01-03 04:08:04'),
	('0221ef689ba5476658a1788dbbd5c7d61a515694e506726191b6e83050d3250d8d04ca7cff49f954',1,1,'kay','[]',0,'2018-01-03 04:41:44','2018-01-03 04:41:44','2019-01-03 04:41:44'),
	('1dd8f68b10485479c2170ff17fb7fbb8b5611cf9053fcd27fc4592cedf891cf459112eb5c8de51b4',1,1,'MyApp','[]',0,'2018-01-03 04:07:16','2018-01-03 04:07:16','2019-01-03 04:07:16'),
	('25fcf21019642406fa74584c66d6becb89f1f341a1d006afb3c8a7d71a927a317ef9568da635307f',1,1,'MyApp','[]',0,'2018-01-03 04:08:52','2018-01-03 04:08:52','2019-01-03 04:08:52'),
	('2d77a70ba998d32bac64e7e06fcca93282c4a980b1dc172c21b0870d0a6615e9d3afa38b9a826459',1,1,'MyApp','[]',0,'2018-01-03 04:08:05','2018-01-03 04:08:05','2019-01-03 04:08:05'),
	('36a660eedfdf27c4f458c2a92ad7676f24ae27f52585d2b8db1d2b33a314201cd680ce34fe278c3d',1,1,'MyApp','[]',0,'2018-01-03 04:07:52','2018-01-03 04:07:52','2019-01-03 04:07:52'),
	('4bd56d90fb901edf1c5ce52bb9d439ef27ea94a69c4bd0aa25fe9bb5143209114bcc37c1e6939b61',1,1,'MyApp','[]',0,'2018-01-03 04:02:55','2018-01-03 04:02:55','2019-01-03 04:02:55'),
	('5c09c46de549eddfe956665ef57727d680a82eaecab9c5a807c3922e0a4fa1ac201a1797addf1aa4',1,1,'MyApp','[]',0,'2018-01-03 04:07:12','2018-01-03 04:07:12','2019-01-03 04:07:12'),
	('5dd79daa6600b633937c9da3eb266403db411453c4b4f8643258be3a0a0310f491f6a380153f71bb',1,1,'MyApp','[]',0,'2018-01-03 04:07:51','2018-01-03 04:07:51','2019-01-03 04:07:51'),
	('62d6811a8cc178c07be3e81051cf2facf06a1b9d5602eea702bc262ce9178987a522f76d7698c494',1,1,'MyApp','[]',0,'2018-01-03 04:09:44','2018-01-03 04:09:44','2019-01-03 04:09:44'),
	('6fd766b9136e7ff986ab185ccafba6beda963d4e7ab6000ad7c284c321279c4cb0d4bece1e4f5aa9',1,1,'kay','[]',0,'2018-01-03 04:43:51','2018-01-03 04:43:51','2019-01-03 04:43:51'),
	('7a1ef933b6c3fc816049b0a56acb7778e37df84fe9b2380a5d5a0e355e7b00acad803e1314222be0',1,1,'kay','[]',0,'2018-01-03 07:57:56','2018-01-03 07:57:56','2019-01-03 07:57:56'),
	('88a7a4942c41e83ac7e9dd5c8a97de353be6b0260e3a26083cecd30d7ed895ad12823be822ae3abd',1,1,'MyApp','[]',0,'2018-01-03 04:09:09','2018-01-03 04:09:09','2019-01-03 04:09:09'),
	('9731d925138cb15fb15ae949b99d87e8eec9a14dfea74d0c23aa87a448ca846e2901796206ea2072',1,1,'kay','[]',0,'2018-01-03 04:42:03','2018-01-03 04:42:03','2019-01-03 04:42:03'),
	('98182b24fbaf125e8d42dcb43dbbf9dd6b08b201e776b56f3c3df3e7b9ca8edb73702d8f0a993d1b',1,1,'MyApp','[]',0,'2018-01-03 04:03:06','2018-01-03 04:03:06','2019-01-03 04:03:06'),
	('9e9dbdc8dfbc172e074821db7849d4533aca438043862604a1a9cf12b4eb08d7f94ede05d526dca9',1,1,'MyApp','[]',0,'2018-01-03 03:26:05','2018-01-03 03:26:05','2019-01-03 03:26:05'),
	('a203eda1e89a47671d9077c0c9210ba18ab1d7d6430b55729de39cf7b9523abcbedd1183623dac3e',1,1,'MyApp','[]',0,'2018-01-03 04:08:53','2018-01-03 04:08:53','2019-01-03 04:08:53'),
	('c8c4e18af2455550458ea4dfa3274d7cf93f15742ab1fa9b7d764f69a6da13fe8f7a60c593d1d83d',1,1,'MyApp','[]',0,'2018-01-03 04:09:42','2018-01-03 04:09:42','2019-01-03 04:09:42'),
	('df1ae240eac66dbcad172c3d210e2ff1b62b98b004fe7b4ff8131977929c7370a001ce4615ca32be',1,1,'kay','[]',0,'2018-01-03 07:31:52','2018-01-03 07:31:52','2019-01-03 07:31:52'),
	('e10f7eeb60fdcd8918e1a141144e9bf42c1781a34ff27ec4801499a98e5a44e131873df7694f0ead',1,1,'MyApp','[]',0,'2018-01-03 03:28:34','2018-01-03 03:28:34','2019-01-03 03:28:34'),
	('edd57e962b334d60acdca007f78f9f42c411444e8f35ee31d21f97a1d8c5f6dba2ad51ec3152c0b4',1,1,'MyApp','[]',0,'2018-01-03 04:07:59','2018-01-03 04:07:59','2019-01-03 04:07:59'),
	('f90568ff51f5c179a53521d38b756ac82c100bf50de7d5649d2de471e64984c8528d83939898bc6b',1,1,'MyApp','[]',0,'2018-01-03 04:07:44','2018-01-03 04:07:44','2019-01-03 04:07:44');

/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_auth_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'Laravel Personal Access Client','Cc9HjMXycxN5hVESSEyfdEDu8H6zQjhtVoT7z78q','http://localhost',1,0,0,'2018-01-03 03:02:42','2018-01-03 03:02:42'),
	(2,NULL,'Laravel Password Grant Client','tpiYDSSeoOmMoVGHX0UrDbqCyoq8nK1BXgbf6npy','http://localhost',0,1,0,'2018-01-03 03:02:42','2018-01-03 03:02:42');

/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_personal_access_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'2018-01-03 03:02:42','2018-01-03 03:02:42');

/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
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
	(1,13,1,1,250,4,4,0,NULL,NULL,NULL,'2017-12-01','2017-12-03',NULL,NULL,NULL,'2017-12-01 09:50:17',NULL),
	(2,12,1,1,250,4,4,0,NULL,NULL,NULL,'2017-12-01','2017-12-02',NULL,NULL,NULL,'2017-12-01 09:50:17',NULL),
	(3,11,1,2,250,4,4,0,NULL,NULL,NULL,'2017-12-01','2017-12-05',NULL,NULL,NULL,'2017-12-04 09:06:03',NULL),
	(4,12,1,3,250,4,4,0,NULL,NULL,NULL,'2017-12-02','2017-12-05',NULL,NULL,NULL,'2017-12-04 09:06:03',NULL),
	(5,12,1,4,250,4,4,0,NULL,NULL,NULL,'2017-12-04','2017-12-07',NULL,NULL,NULL,'2017-12-04 09:06:03',NULL),
	(6,13,1,5,250,4,4,0,NULL,NULL,NULL,'2017-12-08','2017-12-11',NULL,NULL,NULL,'2017-12-04 09:06:03',NULL),
	(7,12,1,5,250,4,4,0,NULL,NULL,NULL,'2017-12-07','2017-12-11',NULL,NULL,NULL,'2017-12-04 09:06:03',NULL),
	(8,11,1,6,250,4,4,0,NULL,NULL,NULL,'2017-12-05','2017-12-08',NULL,NULL,NULL,'2017-12-04 09:06:03',NULL),
	(9,4,1,7,250,4,4,0,NULL,NULL,NULL,'2017-12-06','2017-12-09',NULL,NULL,NULL,'2017-12-04 09:06:03',NULL),
	(10,13,1,5,250,4,4,0,NULL,NULL,NULL,'2017-12-04','2017-12-07',NULL,NULL,NULL,'2017-12-04 09:06:03',NULL),
	(11,1,1,5,250,4,4,0,NULL,NULL,NULL,'2017-11-28','2017-11-30',NULL,NULL,NULL,'2017-11-30 12:08:11',NULL),
	(12,6,1,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-03','2017-12-11',NULL,NULL,NULL,'2017-12-04 09:06:03',NULL),
	(13,12,2,8,2466,6,NULL,0,0,'waiting_for_payment',NULL,'2017-12-20','2017-12-29',NULL,NULL,'2017-12-12 09:20:44','2017-12-18 04:36:27',NULL),
	(14,12,1,9,2500,4,NULL,0,0,'waiting_for_payment',NULL,'2017-12-12','2017-12-22',NULL,NULL,'2017-12-12 09:35:42','2017-12-18 04:36:27',NULL);

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
	(1,'world one','holle','5467890','test@test.com',2,1,'2017-12-01','2017-12-07','en',NULL,NULL,500,'paypal',NULL,NULL,NULL,NULL,NULL),
	(2,'test','holle','4567890','test2@test.com',4,0,'2017-12-05','2017-12-08','en',NULL,NULL,250,'paypal',NULL,NULL,NULL,NULL,NULL),
	(3,'holle','test','7652679','test3@test.com',3,1,'2017-12-03','2017-12-05','sc',NULL,NULL,250,'paypal',NULL,NULL,NULL,NULL,NULL),
	(4,'world','test','6578877','test4@test.com',4,0,'2017-12-03','2017-12-08','en',NULL,NULL,250,'paypal',NULL,NULL,NULL,NULL,NULL),
	(5,'test','world','7658809','test5@test.com',2,2,'2017-12-06','2017-12-11','en',NULL,NULL,500,'paypal',NULL,NULL,NULL,NULL,NULL),
	(6,'helloworld','testing','6876425','test6@test.com',3,0,'2017-12-11','2017-12-14','sc',NULL,NULL,250,'paypal',NULL,NULL,NULL,NULL,NULL),
	(7,'test','yeah','4761909','test7@test.com',2,1,'2017-12-04','2017-12-06','en',NULL,NULL,250,'paypal',NULL,NULL,NULL,NULL,NULL),
	(8,'kay','test',NULL,'kl@buildonauts.com',3,0,'2017-12-20','2017-12-29','en','testing testing',NULL,2466,'paypal','2017-12-12 09:20:44','2017-12-12 09:20:44',NULL,'waiting_for_payment','5a2f9f6c5c05c591'),
	(9,'kay','lun',NULL,'kl@buildonauts.com',3,0,'2017-12-12','2017-12-22','en','testing',NULL,2500,'paypal','2017-12-12 09:35:42','2017-12-12 09:35:42',NULL,'waiting_for_payment','5a2fa2ee0894f507');

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
	(1,'sea view','海景房','Family Rooms','家庭房','/static/img/room_type/sea-view.jpg','Just 20 steps from the sandy beach, our Sea View rooms are private lodgings capable of accommodating anyone from a small family to a single traveler who just wants a space to call their own. Each one comes complete with two queen sized beds, an air conditioning unit, a fan, mosquito nets, and a bathroom with western flushing toilets and hot water for showers. The rooms face out onto a beautiful spread of beach where guests can enjoy hammocks and our sunset bar. \n',4,'16 sq. ft by 15 sq ft = 240 square feet',1,2,NULL,250,NULL,NULL,NULL),
	(2,'river view','河景房','Large Family Rooms','大家庭房','/static/img/room_type/river-view-large.jpg','3 mix dormitory river view rooms with 2 double decker &amp; 1 queen bed (6pax)\n',6,'16 sq. ft by 15 sq ft = 240 square feet',0,1,2,274,NULL,NULL,NULL),
	(3,'river view','河景房','Family Rooms','家庭房','/static/img/room_type/river-view-family.jpg','2 family rooms river view rooms with 1 double decker &amp; 1 queen bed (4pax)\n',4,'16 sq. ft by 15 sq ft = 240 square feet',1,1,1,250,NULL,NULL,NULL);

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'kay','kl@buildonauts.com','$2y$10$ysoVB3APBJL6ouRIZbMbPO8hTQD3P35ikyRBjHMNNZTrf13SVu3Zq',NULL,NULL,NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
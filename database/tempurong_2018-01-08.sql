# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.18-0ubuntu0.16.04.1)
# Database: tempurong
# Generation Time: 2018-01-08 09:41:03 +0000
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
  `image_path` varchar(255) DEFAULT NULL,
  `icon_list` tinyint(1) NOT NULL DEFAULT '0',
  `description_en` text,
  `description_sc` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;

INSERT INTO `activities` (`id`, `name_en`, `name_sc`, `image_path`, `icon_list`, `description_en`, `description_sc`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Row Boats','划船','/static/img/icons/activities/row-boats.png',1,NULL,NULL,NULL,NULL,NULL),
	(2,'Fishing','钓鱼','/static/img/icons/activities/fishing.png',1,NULL,NULL,NULL,NULL,NULL),
	(3,'Crabbing','钓螃蟹','/static/img/icons/activities/crabbing.png',1,NULL,NULL,NULL,NULL,NULL),
	(4,'Sea Kayaking','海上划皮艇','/static/img/icons/activities/sea-kayaking.png',1,NULL,NULL,NULL,NULL,NULL),
	(5,'Beach Volleyball','沙滩排球','/static/img/icons/activities/beach-volleyball.png',1,NULL,NULL,NULL,NULL,NULL),
	(6,'Hammock','海沙浴','/static/img/icons/activities/hammock.png',1,NULL,NULL,NULL,NULL,NULL),
	(7,'Coral Reef Snorkeling','Coral Reef Snorkeling','/static/img/landing/CoralReefSnorkeling.jpg',0,'The corals in Sabah are breathtaking, but don’t worry, you’ll have your snorkel on! If you’re lucky, you might spot a sea turtle.','The corals in Sabah are breathtaking, but don’t worry, you’ll have your snorkel on! If you’re lucky, you might spot a sea turtle.',NULL,NULL,NULL),
	(8,'Volcano Mud Bath','Volcano Mud Bath','/static/img/landing/VolcanoMudBath.jpg',0,'Famed for its skin nutrient benefits, this mud bath is fun and popular! Did you know, the mud makes you float?','Famed for its skin nutrient benefits, this mud bath is fun and popular! Did you know, the mud makes you float?',NULL,NULL,NULL),
	(9,'The Rare Proboscis Monkey','The Rare Proboscis Monkey','/static/img/landing/TheRareProboscisMonkey.jpg',0,'Seen only in Borneo, the Proboscis monkey is one of the largest monkey species native to Asia. Enjoy a day out viewing these wonderful creatures in their natural habitat.','Seen only in Borneo, the Proboscis monkey is one of the largest monkey species native to Asia. Enjoy a day out viewing these wonderful creatures in their natural habitat.',NULL,NULL,NULL),
	(10,'Magical Fireflies in Nature','Magical Fireflies in Nature','/static/img/landing/MagicalFirefliesInNature.jpg',0,'Fireflies only thrive in areas away from urban cities and with clean, flowing water. Enjoy a beautiful evening cruising through the mangroves as they light up the night.','Fireflies only thrive in areas away from urban cities and with clean, flowing water. Enjoy a beautiful evening cruising through the mangroves as they light up the night.',NULL,NULL,NULL);

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
	(9,5,NULL,'/static/img/activities/MANGROVE_RIVER_CRUISE/02.jpg',NULL,NULL,NULL),
	(10,6,'/static/img/activities/ESCORTED_JUNGLE_TREKKING/cover.jpg','',NULL,NULL,NULL),
	(11,6,NULL,'/static/img/activities/ESCORTED_JUNGLE_TREKKING/01.jpg',NULL,NULL,NULL),
	(12,6,NULL,'/static/img/activities/ESCORTED_JUNGLE_TREKKING/02.jpg',NULL,NULL,NULL);

/*!40000 ALTER TABLE `activity_images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table adventure_images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `adventure_images`;

CREATE TABLE `adventure_images` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `adventure_id` int(11) DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `adventure_images` WRITE;
/*!40000 ALTER TABLE `adventure_images` DISABLE KEYS */;

INSERT INTO `adventure_images` (`id`, `adventure_id`, `cover_image`, `image_path`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(4,4,'/static/img/activities/PULAU_TIGA_DAY_TRIP/cover.jpg','',NULL,NULL,NULL),
	(5,4,NULL,'/static/img/activities/PULAU_TIGA_DAY_TRIP/01.jpg',NULL,NULL,NULL),
	(6,4,NULL,'/static/img/activities/PULAU_TIGA_DAY_TRIP/02.jpg',NULL,NULL,NULL),
	(7,5,'/static/img/activities/MANGROVE_RIVER_CRUISE/cover.jpg','',NULL,NULL,NULL),
	(8,5,NULL,'/static/img/activities/MANGROVE_RIVER_CRUISE/01.jpg',NULL,NULL,NULL),
	(9,5,NULL,'/static/img/activities/MANGROVE_RIVER_CRUISE/02.jpg',NULL,NULL,NULL),
	(10,6,'/static/img/activities/ESCORTED_JUNGLE_TREKKING/cover.jpg','',NULL,NULL,NULL),
	(11,6,NULL,'/static/img/activities/ESCORTED_JUNGLE_TREKKING/01.jpg',NULL,NULL,NULL),
	(12,6,NULL,'/static/img/activities/ESCORTED_JUNGLE_TREKKING/02.jpg',NULL,NULL,NULL);

/*!40000 ALTER TABLE `adventure_images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table adventures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `adventures`;

CREATE TABLE `adventures` (
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

LOCK TABLES `adventures` WRITE;
/*!40000 ALTER TABLE `adventures` DISABLE KEYS */;

INSERT INTO `adventures` (`id`, `name_en`, `name_sc`, `subtitle_en`, `subtitle_sc`, `duration`, `distance`, `difficulty`, `description_en`, `description_sc`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(4,'Pulau Tiga Day Trip','生还者之岛一日游','Snorkeling and Volcano Mud Bath','迪迦岛浮潜及火山泥浴',25,1000,3.5,'Pulau Tiga is an island off the coast of Borneo that is most well known as “Survivor Island”, as it was the location where the debut season of Survivor was filmed. On this day trip you will depart from the resort by 8:30AM and travel to the beautiful waters off the coast of the island for swimming and snorkeling at various locations. Marvelous sights of giant clams, families of tropical fish, and other beautiful ocean life are common amongst the coral reefs.\n\nYou will also have the option of dipping into the volcano mud baths of Pulau Tiga, which are a leisurely 20-minute hike inland from the island’s shore, and enjoy a fun experience said to be good for the skin (Be sure to bring footwear that you won’t mind getting muddy if you opt for the hike!). The length of stay is up to you but we are usually back at the resort by 2:00PM where you can enjoy the rest of the afternoon at your leisure!','迪迦岛是位于婆罗洲海岸的一个岛屿，它也誉名为「生还者之岛」（Survivor Island），因美国在这里拍摄了生还者电视剧而有名。在这一天的行程中，您将于上午8:30离开度假村，前往迪迦岛附近的美丽水域，在不同的地点游泳和浮潜。在海底世界可以观赏到巨大的蛤蜊，色彩缤纷的珊瑚礁，还有许多不同种类的热带鱼 和其他美丽的海洋生物。\n\n您也可以选择在岸边徒步20分钟到迪迦岛的火山泥浴，并享受一个有趣的体验，据说火山泥对皮肤有滋润美白的功效（选择徒步旅行者请务必脱下并携带鞋子，除非你不介意弄脏鞋子！）。享受火山泥浴後，您可以投奔大海边清洗边游泳，沉醉在大海的拥抱中。我们通常在下午2:00之前回到悠闲的度假村享用美味的地道午餐。',NULL,NULL,NULL),
	(5,'Mangrove River Cruise','红树林游船','Proboscis Monkeys and Fireflies','长鼻猴和萤火虫',25,1000,3.5,'The River Cruise offers opportunities to see the wildlife of Borneo’s wetland jungles. The trip would begin by traveling to the Klias River, about a half hour away from the resort. Upon arrival, there would be a tea break before embarking on a boat ride in search of the Proboscis monkeys, an endangered species that are native to Sabah and are most known for their signature long noses and protruding bellies. Proboscis monkey is our national treasure and only found in Borneo Island. Have you ever seen monkey that does not eat banana? Well, this is the only species! Come and find out more about this interesting monkey!\n\nAfter a one and a half hour cruise, we enjoy a break and eat dinner so that you can enjoy the local tastes before embarking on the Firefly Cruise. The evening cruise becomes a mystical ride through the mangroves where fireflies light up the darkness like magical specks and the sounds of nature surround you. Please note that sightings are common, but not guaranteed. ','红树林游船提供了观看婆罗洲湿地丛林野生动物的机会。这个克利亚斯河景点距离度假村大约半小时的车程，抵达后将乘船游览长鼻猴。长鼻猴，是一种原产于沙巴的濒危物种，以其长长的鼻子和突出的腹部而闻名。长鼻猴是马来西亚的国宝，它们只生长在婆罗洲岛。有没有见过不吃香蕉的猴子？来吧！在这里你可以探寻观赏到这品种非常特别的猴子。\n\n在一个半小时的巡航后，我们会休息片刻，然后享用当地的风味晚餐。晚餐后，将会继续乘船，开始萤火虫的巡航。晚上变得神秘的红树林，萤火虫像魔法般一点点照亮黑暗，整个人都被自然的音律环绕着。虽然萤火虫是常见的，但气候不好时则另当别论。',NULL,NULL,NULL),
	(6,'Escorted Jungle Trekking ','丛林徒步旅行',NULL,NULL,25,1000,3.5,'Enjoy some of the world’s dwindling rain forests by doing a leisurely jungle trek - about an hour long. Trek through the low land forest where you may see different kinds of reptiles, birds, plants, bamboo, rattan, and more. Visitors are advised to wear sandals or a good pair of walking shoes and bring insect repellent and sun screen.  A  small bottle of water will be provided.\n\nThe Healing Well and Love Rock (also known as Space Rock) are also nearby so these additional areas could be tied into after your trek. The sunset is especially gorgeous from the beach by Space Rock as there are rarely any people around. Enjoy the rich colors as the sky changes from golds and oranges to deep reds.','通过一个长达一小时的悠闲丛林徒步旅行，享受世界上一些日益减少的热带雨林。跋涉在低地森林中，您可以看到各种爬行动物，鸟类，植物，竹子，藤条等等。建议游客穿凉鞋或者一双好的步行鞋，涂上驱蚊剂和防晒霜，我们会提供一小瓶水。客人可以自由自在各自徒步。若需导游陪同，则要另外付费。\n\n疗愈水池和永结同心石（太空岩石）也是附近的景点， 森林徒步后也可以另外到这些地区游览。漫步到太空岩石的海滩，周围的人烟稀少，在这里观看日落会特别美丽。随着天空从黄金和橘子变成深红色，无际的海洋色泽也渐变成丰富的色彩⋯⋯绝对是人生一大享受！！！',NULL,NULL,NULL);

/*!40000 ALTER TABLE `adventures` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table amenities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `amenities`;

CREATE TABLE `amenities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL,
  `name_sc` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;

INSERT INTO `amenities` (`id`, `name_en`, `name_sc`, `image_path`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Hot Shower',NULL,'/static/img/icons/shower.png',NULL,NULL,NULL),
	(2,'Shower Towel',NULL,'/static/img/icons/towel.png',NULL,NULL,NULL),
	(3,'Air Conditioning',NULL,'/static/img/icons/air-con.png',NULL,NULL,NULL),
	(4,'Fan',NULL,'/static/img/icons/fan.png',NULL,NULL,NULL);

/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
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


# Dump of table faqs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `faqs`;

CREATE TABLE `faqs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(255) DEFAULT NULL,
  `title_sc` varchar(255) DEFAULT NULL,
  `content_en` text,
  `content_sc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;

INSERT INTO `faqs` (`id`, `title_en`, `title_sc`, `content_en`, `content_sc`)
VALUES
	(1,'Why am I being charged a “tourism tax”?','为何我需要缴纳旅游税？','Beginning on September 1, 2017, the Government of Malaysia now requires hotel guests that are not Malaysian citizens or long-term/permanent residents of Malaysia to be levied a tourism tax of 10 RM per room per night stay. Please be prepared to pay the additional taxes during checkout (at this time we can only accept cash on site).','从2017年9月1日起，马来西亚政府限制非马来西亚公民或永久居民，需缴每间房间每晚MYR10的旅游税。请在入住时自行准备现金缴付此税。（目前我们只能够当场收现金）'),
	(2,'Is this resort kid-friendly?','这个度假村合适小孩居住吗？','Absolutely. Of course, do keep an eye on them but our property is relatively small, flat and covered in grass or powdery sand.\n\nWhen making your reservation, you will be able to list how many adults and how many children will be in your party. Children are considered ages 3-11, while infants that are 2 years old and below are free.','绝对合适！我们的度假村不大，地平坦也被草或沙子围绕。当然也需要您稍微看顾孩子。\n\n当您订房时，请列出有几位大人小孩一同入宿。小孩是指年龄在3到11岁之间。2岁或以下属于婴儿是免费的。'),
	(3,'What should I bring?','我该带些什么？','Be sure to bring sun screen, bug repellent, bathing suit and your camera.','防嗮霜，防蚊剂，泳装和相机。 '),
	(4,'When is the best time to visit?','何时是最佳游览时间？','In general, Kota Kinabalu and Sabah in general is lush and tropical, so a fair amount of rain can be expected all year round, but it’s not usually an all-day affair. The “best time” to visit is from January to March because the climate is relatively cooler and drier.\n\nOctober is usually wetter, however weather patterns have been changing in recent years so you can often still have very clear days (as in 2017). May and April are extremely humid and hot, so be prepared and plan a visit to swim around the islands or up to the cooler mountains!','一般来说，沙巴四季如春。全年都有阵雨但不是连绵不断。最佳月份应该是一月到三月，因为气候比较凉快和干爽。\n\n十月份气候通常比较湿。可是近来全球气候的改变，2017年的十月份并没有常常下雨。四月和五月非常湿熟，这时候最好就是先计划到海岛游泳和上山乘凉！'),
	(5,'How do I get to your resort?','我如何到您的度假村？','You can get here by bus or car, though it is much easier by car! We are happy to pick up and drop off from Kota Kinabalu Airport (BKI) or from Kota Kinabalu City for an additional service charge. You can find specific instructions <a href=\"/contact\" class=\"content-link\">HERE</a>.','您可以坐巴士或汽车，但汽车比较方便！我们非常乐意提供机场接送服务但需要另外付费。您可以依照这里的<a href=\"/contact\" class=\"content-link\">指示</a>'),
	(6,'What is there to do there?','到哪可以做些什么？','As much or as little as you’d like!\n\nSome come to decompress and escape from the city. For this we have hammocks and a long stretch of beach where you can enjoy the beauty and sounds of Mother Nature. There are also some local sights and neighboring beaches to wander through. We enjoy feeding our guests and have them enjoy all the locally grown and caught foods we have to offer. We also love to set up sunset dinners where you can enjoys all these things at once!\n\nWe enjoy feeding our guests and have them enjoy all the locally grown and caught foods we have to offer. We also love to set up sunset dinners where you can enjoys all these things at once!\n\nOthers crave a bit of adventure, and we have several activities like island hopping, seeing the probiscus monkeys, searching for fireflies and so much more. Let us know your interests and we’re sure you’ll find something you love about Malaysia.','随心所欲！\n\n很多人到此地尽情放松和减压。我们有吊床，钓鱼，捕红鲟，划船等。还有长长的白色海滩，可享受大自然的海浪声，鸟语花香 。 这里还有一些有趣景点可以游览。\n\n我们喜欢「喂养」我们的客人，让他们享受我们所提供的所有当地种植和捕捉到的食物。我们也很喜欢设立日落晚餐，你可以一次享受所有这些东西！\n\n还有一些人喜欢冒险，我们有几个活动，比如海岛一日游，观赏长鼻猴及自然生态，寻找萤火虫等等。让我们知道您的兴趣，我们会贴心找到可以迎合您的马来西亚风情，口味和喜好。'),
	(7,'Do you have wifi?','网络供应如何？','There is no wifi or television - we do have air conditioning and hot showers, though! Enjoy being unplugged for a bit and have a bit of a digital detox.\n\nIf you’re really desperate, make sure to grab a Malaysian sim card in the city; we receive a data signal so you’re still able to post all those Instaworthy photos.','在这里没有电视和网络，但我们有空调和热水炉！享受与世隔绝的放空，让自己真正的放松，回归大自然。给自己一个“电子”排毒的机会。\n\n如果您真的很日却渴望有电讯联络，您必须在城市或机场购买马来西亚电话卡；这里是可以收到电话信号的，所以你仍然可以立刻发布所有美拍的照片。'),
	(8,'Do you accept credit cards?','有没有收信用卡？','At this time we can only accept credit cards through our online booking system. Since we are quite remote, we can only accept cash on site.','目前我们只能通过我们的在线预订系统使用信用卡。由于我们地点相当偏远，所以度假村现场只接受现金。'),
	(9,'What if I need to cancel my booking?','如果我要取消我的预约？','It takes a lot of planning to ensure your visit is comfortable yet authentic, but things happen and we understand that! Our cancellation policy, as mentioned in our Resort Policy, is as follows:\n\n60 - 31 days prior to arrival a 75% refund will apply\n30 - 15 days prior to arrival a 50% refund will apply\n14 - 0 days prior to arrival a 0% refund will apply\n\nPlease be sure to also read our entire <a href=\"/policy\" class=\"content-link\">RESORT POLICY</a> (It’s not that long, promise.).','为了确保顾客的入住时的舒适，我们需要很多时间计划和安排，以迎合客人的需求。若实在没有办法或遇到不能避免的事情而必须取消预订房间和服务，我们也可以理解！我们度假村的取消政策如下：\n\n抵达前60  -  31天取消，将退还75％的费用\r\n抵达前30  -  15日取消，将退款50％的费用\r\n抵达前14 天內取消，将不退还任何的费用\n\n请务必阅读我们整个<a href=\"/policy\" class=\"content-link\">度假村政策</a>（请放心，不会很长）。'),
	(10,'Why can’t I pay for everything on the website?','为何我不能够把所有费用都在网站一次付清？','The website is built to collect payment of basic room bookings (as it’s quite straight-forward), however additional meals or tour packages are dependent on many factors so it’s much better for both sides to arrange directly. This also allows us to get to know you and your preferences so that we can create the perfect experience for you and your party.<br><br>\n\nAlso, by legal requirement, we have to check if you have a Malaysian passport in order to waive the 10% tourism tax, so this is also easier to settled in cash at the resort. This fee and any outstanding costs for extra mattresses, meals and tour packages will be settled in cash at the resort, so please come prepared as there are no ATMs on this side of paradise!','这个网站的目的是收取基本的房间预订费用（因为它的设计非常简单），但是额外的餐饮或旅游套餐建基于很多因素，因此双方直接进行安排会更好。这也让我们了解你和你的喜好，以便我们可以为您和您的旅伴创造完美的体验。<br><br>此外，根据法定要求，我们必须检查您是否拥有马来西亚护照，以豁免10％的旅游税，因此在度假村以现金结算也更容易。这笔费用以及额外床垫，餐饮和旅游套餐的任何费用将在度假村以现金结算，请预先准备好，因为这里没有自动提款机。');

/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
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
	(1,'Barbeque','烧烤','Most popular for sunset dinners','最受欢迎的日落晚餐','/static/img/food/bbq.jpg','Guests love having BBQs on our Sunset Terrace, where we’re on the long flat beach with few people and Mother Nature’s glorious sunset show. You can request certain types of seafood or meats and we will do our best to accommodate!','客人喜欢在露台上享用烧烤美食，在长长平坦的海滩上，观赏宁静的大自然和色彩英辉的日落，很是美丽！。你可以要求不同种类的食材，我们可以尽量地迎合您的饮食需求！',NULL,NULL,NULL),
	(2,'Steamboat Hotpot','海鲜火锅','Great for families and groups','非常适合家庭和团体','/static/img/food/hotpot.jpg','With all these amazing ingredients, it’s no surprise that Steamboat is one of our most requested meals. We have two different stocks (one can be a spicy option) where all kinds of meats and vegetables can be dipped and feasted on. At the very end, the most delicious soup will be ready to finish off the meal!','凭借所有这些丰富的材料，火锅成为了我们最受欢迎的餐点之一。我们有两种不同的选择（鲜味与辣味），各种肉类和蔬菜都可以放进锅里享用。最后，当所有精华鲜味都沉淀在这锅汤底，最美味可口的汤将为您结束这顿饭！',NULL,NULL,NULL),
	(3,'Fresh Seafood','新鲜的海鲜','Sabah must-try!','来沙巴一定要吃！','/static/img/food/seafood.jpg','If you visit Kota Kinabalu, you must indulge in the seafood! We can offer large, juicy tiger prawns, skate, clams, crab and a variety of delicious fish to be served up fried, grilled, or steamed. We can create a customize menu as long as we have some notice. Yum!','来哥打京那巴鲁旅游的您必定会沉迷于这里的海鲜！我们提供又大而多汁的老虎虾，蛤蜊，螃蟹和各种美味的鱼，可以炸，烤或蒸，可口美味！若提早预订，我们可以让您自订菜单。',NULL,NULL,NULL),
	(4,'Vegetarian','素食者','Organic, fresh, and locally grown','有机，新鲜，当地种植','/static/img/food/vegetable.jpg','Vegetarians rejoice, there is plenty for you to enjoy in such a plentiful region! There are lots of local and wild vegetation that aren’t found anywhere else, with great textures to enjoy. Some have delicate, flavorsome leaves, some with a nice crunch, and some that are best when just cut.','素食者在这样一个充满朝气和很多新鲜食材选择的地方，可以尽情享受美食！有许多野生植物是在其他地方很难找到的。特别是刚刚摘下来蔬菜水果；味道鲜甜特美味！',NULL,NULL,NULL),
	(5,'Wild Chicken','放养鸡','Truly “free-range” and locally caught','真正的“自由放养”和现捕的鸡只','/static/img/food/wildchicken.jpg','Did you know that different kinds of chickens taste slightly different? Wild chickens roam around and we can catch and prepare them for you fresh. Talk about free range! Ask us about our choice in chickens.','你知道不同种类的鸡在肉质上，略有不同的味道和口感吗？待品尝了才知道箇中滋味。现捕的放养鸡别有一番風味！',NULL,NULL,NULL),
	(6,'Western Style Breakfast','西式早餐','Comfortable and familiar','舒适而简单的早餐','/static/img/food/breakfast.jpg','If you’re craving a light breakfast, we also have the option for eggs, omelettes, sausages and toast with fresh fruit. If you would prefer something specific, please let us know so that we can stock the kitchen for your comfort!','简单滋味的美式早餐既有营养也足够提供一天的热量。若有其他需求，也不妨提前让我们知道，以便提供合适您口味的餐饮。',NULL,NULL,NULL);

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


# Dump of table policies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `policies`;

CREATE TABLE `policies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(255) DEFAULT NULL,
  `title_sc` varchar(255) DEFAULT NULL,
  `content_en` text,
  `content_sc` text,
  `sub_content_en` text,
  `sub_content_sc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `policies` WRITE;
/*!40000 ALTER TABLE `policies` DISABLE KEYS */;

INSERT INTO `policies` (`id`, `title_en`, `title_sc`, `content_en`, `content_sc`, `sub_content_en`, `sub_content_sc`)
VALUES
	(1,'Check-in and Check-out','入住及退房','Check in is 2PM\nCheckout is 12PM','入住时间是下午2点\r\n退房时间是中午12点\r\n',NULL,NULL),
	(2,'Tourism Tax','旅游税','A tourist tax of RM 10 per room per night is applied to all foreign guests by federal law. This tax is not included in the room rate and must be paid upon check-in. Guests with a valid Malaysian Identity Card or valid permanent residents MY PR Card are exempted.','马来西亚法律规定，所有外国客人必需缴付每间客房每晚MYR10的旅游税。这笔税费不包含在房价内，且必须在办理入住时支付。持有有效的马来西亚身份证或有效的永久居民身份证的客人可获得豁免。',NULL,NULL),
	(3,'Payment for Accommodation Booking','支付住宿预订','Our website is built to handle transactions for accommodation only. You may pay by PayPal, credit card (Visa and Mastercard only). Any outstanding charges may be settled in cash on-site, PayPal or direct bank transfer.<br><br>\n\nPlease review and verify your booking invoice thoroughly and contact us immediately if your invoice appears to be incorrect or incomplete, as it may not be possible to make changes later. TGBR cannot accept responsibility if we are not notified of inaccuracies within 5 days of sending out the invoice. In the case of billing errors, TGBR reserves the right to re-invoice you with correct pricing. If you’d like to add more people, mattresses, rooms, meals, etc. please contact us directly and we will do our best to accommodate.<br><br>\n\nIf you arrive with more people and/or require more services than paid for, you will be expected to settle the correct and remaining amount in person with cash (we are unable to process credit cards on-site).','我们的网站是专为处理住宿交易而设计的。您可以通过PayPal，维萨信用卡（ Visa）或万事达卡（Mastercard）付款。任何未支付的费用可通过现场支付，PayPal或直接银行转账。\n\n请仔细查看并验证您的预订发票，如果您的发票看起来不正确或不完整，请立即与我们联系，因为稍后可能无法进行更改。如果我们在发货后5天内没有收到错误通知，金沙龙虾湾度假村不承担任何责任。在计费错误的情况下，金沙龙虾湾度假村保留以正确的价格重新发票的权利。\n\n如果你想添加更多的人，床垫，房间，餐食等，请直接与我们联系，我们将尽我们所能安排。 如果您抵达的人数更多，并且/或者需要更多的服务，您将需要现金支付（我们无法在现场处理信用卡支付）。',NULL,NULL),
	(4,'Deposit and Final Payment for Tours','订金和旅游配套的最终付款事项','Any additional tours or services require a non-refundable, non-transferable deposit of 25%. Note that bookings are not confirmed nor secure until TGBR receives this deposit and you receive a confirmation invoice. TGBR reserves the right to release or cancel any bookings being held where this required deposit has not been received by the deposit due date. Payment of the deposit indicates you have read and accepted these Terms and Conditions.<br><br>\n\nPlease review and verify your booking invoice thoroughly and contact us immediately if your invoice appears to be incorrect or incomplete, as it may not be possible to make changes later. TGBR cannot accept responsibility if we are not notified of inaccuracies within 5 days of sending out the invoice. In the case of billing errors, TGBR reserves the right to re-invoice you with correct pricing.<br><br>\n\nFinal payment for your booking is due 30 days prior to commencement of services. If final payment is not received by the due date, your reservation will be cancelled and TGBR will retain your full deposit. TGBR is not responsible for cancelled land and/or air reservations in the event payment is not received by the final payment date. If a booking is made within 30 days prior to arrival, full payment will be required at the time of booking.<br><br>\n\nAll payments shall be made either by credit card or telegraphic transfer to the appropriate account:','任何额外的旅行或服务都需要缴付25％的押金，押金不可退款和不可转让。请注意，只有在金沙龙虾湾度假村收到这笔押金后，您才能获得确认发票。金沙龙虾湾度假村保留取消任何在存款到期日前仍未缴的押金的预订的权利。支付押金表示您已经阅读并接受这些条款及细则。\n\n请仔细查看并验证您的预订发票，如果您的发票看起来不正确或不完整，请立即与我们联系，因为稍后可能无法进行更改。如果我们在发出预订发票后5天内没有收到错误通知，金沙龙虾湾度假村将不承担任何责任。在计费错误的情况下，金沙龙虾湾度假村保留以正确的价格重新发票的权利。\n\n您的预订的最后付款日期应在服务开始前30天。如果到期日未收到最终付款，您的预订将被取消，金沙龙虾湾度假村将沒收您的全额押金。如果在最后付款日期没有收到付款，金沙龙虾湾度假村不会负责因没有付款而被取消的服务和房间预订。如果客人在抵达前30天内预订，则需在预订时支付全额费用。\n\n所有的付款都应通过信用卡或电汇转账到度假村的账户：','Account Name: THE GOLDEN BEACH RESORT\nAccount Number: 3192745920\nSWIFT code: PBBEMYKL\nBank Name: PUBLIC BANK BERHAD','Account Name: THE GOLDEN BEACH RESORT\nAccount Number: 3192745920\nSWIFT code: PBBEMYKL\nBank Name: PUBLIC BANK BERHAD'),
	(5,'Cancellation By You','您取消的预订服务','If Tempurong Golden Beach Resort receives a booking cancellation prior to the final payment date of your vacation, your non-refundable deposit will be retained. Standard cancellation fees as stated apply to all booking cancellations.','如果金沙龙虾湾度假村在您该支付余款的截止日期之前收到取消预订服务，您的押金将不会退还。标准取消费如以下所述：','60 - 31 days prior to arrival a 75% refund will apply\n30 - 15 days prior to arrival a 50% refund will apply\n14 - 0 days prior to arrival a 0% refund will apply\n\nIf you cancel more than 60 days ahead of time, we will still retain your non-refundable 25% deposit. ','抵达前60  -  31天取消，将退还75％的费用\r\n抵达前30  -  15日取消，将退还50％的费用\r\n将在抵达前14  -  0天取消，将不会退还任何的费用\n\nIf you cancel more than 60 days ahead of time, we will still retain your non-refundable 25% deposit. '),
	(6,'Refund of Unused Services','未使用的服务的退款','No refunds or exchanges can be made in respect of accommodation, meals, sightseeing tours, transport or any other services that are included in the tour pieces but not utilized by the tour member.','在旅游项目中包括的未被旅游团成员使用的住宿，餐饮，观光旅游，交通或任何其他服务，将不予退款或换成任何其他服务。',NULL,NULL),
	(7,'Force Majeure','不可抗力','If as a consequence of \'Force Majeure\' as defined below, TGBR is obliged to curtail, alter, extend or cancel the tour, the customer shall not be at liberty to maintain a claim for compensation or otherwise for any loss arising as a consequence of said curtailment, alteration, extension or cancellation of the tour. \'Force Majeure\' means Acts of God, natural disasters, adverse weather conditions, fire or other destruction of any vessel, craft or vehicle to be used in connection with a holiday, destruction or damage to holiday accommodation, riots, acts of war, civil commotion, exercise of legislative or government action, municipal or military or other authority, strikes, industrial action, requisition of equipment, mechanical breakdown, shortage of fuel, insolvency or default of any carrier or service connected with the tour, fraud perpetrated against TGBR.','如果是因为下面定义的「不可抗力」，金沙龙虾湾度假村有义务限制、更改、延长或取消旅程，而客户不可向金沙龙虾湾度假村索取赔偿，或因其他原因造成的任何损失而削减，改变，延长或取消行程。 「不可抗力」是指自然灾害，不利的天气条件，火灾或其他任何与度假有关的船只，船只或车辆的毁坏，假日住宿的破坏或损坏，骚乱，战争行为，民事行政，立法或政府行动，市政或军事或其他权力，罢工，工业行为，设备的征用，机械故障，燃料短缺，破产或任何与旅游有关的承运人或服务的拖延，对金沙龙虾湾度假村的欺诈行为。',NULL,NULL),
	(8,'Customers with Special Needs','有特殊需求的客户','It shall be the guest’s responsibility to disclose, prior to booking, to TGBR any physical or mental condition of a member of his party that may be relevant. TGBR reserves the right to decline to provide the accommodation, services or tour for a person where, in the opinion of the company, that the mentioned would be inconsistent with the special needs of that person. No liability shall attach to TGBR for the provision of an unsuitable service, accommodation or tour for any person where that person\'s special needs have not been disclosed at the time of booking.','客人有责任在预订前向金沙龙虾湾度假村披露其自己的身体或精神状况，或任何相关可能的情况。金沙龙虾湾度假村有权拒绝为它认为所提供的住宿，服务或旅游不符合该人的特殊需要。如果您在预订时并未透露您及您的同行旅伴的特殊需求，则不应向金沙龙虾湾度假村要求提供不适当的服务，住宿或旅游的责任。',NULL,NULL),
	(9,'Passport, Visa and Immigration Requirements','护照，签证和移民局要求','It is your responsibility to fulfil the passport, visa and other immigration requirements applicable to your itinerary. You should confirm these with the relevant embassies and/or consulates. We do not accept any responsibility in the case of you being unable to travel due to not complying with any such requirements.','您有责任准备您的护照、签证和履行其他移民局要求。您应该向有关的使领馆和/或领事馆确认。如果您因不遵守任何此类要求而无法出行，我们不承担任何责任。',NULL,NULL);

/*!40000 ALTER TABLE `policies` ENABLE KEYS */;
UNLOCK TABLES;


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
	(14,12,1,9,2500,4,NULL,0,0,'waiting_for_payment',NULL,'2017-12-12','2017-12-22',NULL,NULL,'2017-12-12 09:35:42','2017-12-18 04:36:27',NULL),
	(15,11,1,10,750,4,NULL,0,0,'waiting_for_payment',NULL,'2018-01-09','2018-01-12',NULL,NULL,'2018-01-05 06:46:13','2018-01-05 11:21:17',NULL),
	(16,4,1,10,750,4,NULL,0,0,'waiting_for_payment',NULL,'2018-01-09','2018-01-12',NULL,NULL,'2018-01-05 06:46:13','2018-01-05 11:21:17',NULL),
	(17,5,1,11,750,4,NULL,0,0,'waiting_for_payment',NULL,'2018-01-09','2018-01-12',NULL,NULL,'2018-01-05 06:48:01','2018-01-05 11:21:17',NULL),
	(18,6,1,11,750,4,NULL,0,0,'waiting_for_payment',NULL,'2018-01-09','2018-01-12',NULL,NULL,'2018-01-05 06:48:01','2018-01-05 11:21:17',NULL),
	(19,7,1,12,750,4,NULL,0,0,'waiting_for_payment',NULL,'2018-01-09','2018-01-12',NULL,NULL,'2018-01-05 06:48:12','2018-01-05 11:21:17',NULL),
	(20,8,1,12,750,4,NULL,0,0,'waiting_for_payment',NULL,'2018-01-09','2018-01-12',NULL,NULL,'2018-01-05 06:48:12','2018-01-05 11:21:17',NULL),
	(21,7,1,13,750,4,NULL,0,0,'waiting_for_payment',NULL,'2018-01-09','2018-01-12',NULL,NULL,'2018-01-05 06:48:14','2018-01-05 09:29:09',NULL),
	(22,8,1,13,750,4,NULL,0,0,'waiting_for_payment',NULL,'2018-01-09','2018-01-12',NULL,NULL,'2018-01-05 06:48:14','2018-01-05 09:29:09',NULL),
	(23,1,1,14,750,4,NULL,0,0,'waiting_for_payment',NULL,'2018-01-09','2018-01-12',NULL,NULL,'2018-01-05 06:50:53','2018-01-05 06:50:53',NULL),
	(24,2,1,14,750,4,NULL,0,0,'waiting_for_payment',NULL,'2018-01-09','2018-01-12',NULL,NULL,'2018-01-05 06:50:53','2018-01-05 06:50:53',NULL),
	(25,1,1,15,750,4,NULL,0,0,'waiting_for_payment',NULL,'2018-01-09','2018-01-12',NULL,NULL,'2018-01-05 06:51:32','2018-01-05 06:51:32',NULL),
	(26,2,1,15,750,4,NULL,0,0,'waiting_for_payment',NULL,'2018-01-09','2018-01-12',NULL,NULL,'2018-01-05 06:51:32','2018-01-05 06:51:32',NULL),
	(27,1,1,16,2250,4,NULL,0,0,'waiting_for_payment',NULL,'2018-01-09','2018-01-18',NULL,NULL,'2018-01-05 09:09:32','2018-01-05 09:09:32',NULL),
	(28,1,1,17,2250,4,NULL,0,0,'completed',NULL,'2018-01-09','2018-01-18','2018-01-05 09:28:05',NULL,'2018-01-05 09:27:03','2018-01-05 09:28:05',NULL),
	(29,12,1,18,500,4,NULL,0,0,'completed',NULL,'2018-01-09','2018-01-11','2018-01-05 09:29:42',NULL,'2018-01-05 09:29:22','2018-01-05 11:21:17',NULL),
	(30,13,1,18,500,4,NULL,0,0,'completed',NULL,'2018-01-09','2018-01-11','2018-01-05 09:29:42',NULL,'2018-01-05 09:29:22','2018-01-05 11:21:17',NULL),
	(31,1,1,19,250,4,NULL,0,0,'waiting_for_payment',NULL,'2018-04-12','2018-04-13',NULL,NULL,'2018-01-05 11:22:03','2018-01-05 11:22:03',NULL),
	(32,1,1,20,262,4,NULL,0,1,'waiting_for_payment',NULL,'2018-03-01','2018-03-02',NULL,NULL,'2018-01-05 11:29:39','2018-01-05 11:29:39',NULL),
	(33,1,1,21,262,4,NULL,0,1,'waiting_for_payment',NULL,'2018-03-01','2018-03-02',NULL,NULL,'2018-01-05 11:30:14','2018-01-05 11:30:14',NULL),
	(34,1,1,22,250,4,NULL,0,0,'waiting_for_payment',NULL,'2018-04-12','2018-04-13',NULL,NULL,'2018-01-05 11:37:30','2018-01-05 11:37:30',NULL),
	(35,9,2,22,274,6,NULL,0,0,'waiting_for_payment',NULL,'2018-04-12','2018-04-13',NULL,NULL,'2018-01-05 11:37:30','2018-01-05 11:37:30',NULL),
	(36,10,2,22,274,6,NULL,0,0,'waiting_for_payment',NULL,'2018-04-12','2018-04-13',NULL,NULL,'2018-01-05 11:37:30','2018-01-05 11:37:30',NULL),
	(37,12,3,22,250,4,NULL,0,0,'waiting_for_payment',NULL,'2018-04-12','2018-04-13',NULL,NULL,'2018-01-05 11:37:30','2018-01-05 11:37:30',NULL),
	(38,13,3,22,250,4,NULL,0,0,'waiting_for_payment',NULL,'2018-04-12','2018-04-13',NULL,NULL,'2018-01-05 11:37:30','2018-01-05 11:37:30',NULL);

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
	(9,'kay','lun',NULL,'kl@buildonauts.com',3,0,'2017-12-12','2017-12-22','en','testing',NULL,2500,'paypal','2017-12-12 09:35:42','2017-12-12 09:35:42',NULL,'waiting_for_payment','5a2fa2ee0894f507'),
	(10,'kay','lun',NULL,'kl@buildonauts.com',3,0,'2018-01-09','2018-01-12','en','sadasd','asdsad',1500,'paypal','2018-01-05 06:46:13','2018-01-05 06:46:13',NULL,'waiting_for_payment','5a4f1f353d9b9562'),
	(11,'kay','lun',NULL,'kl@buildonauts.com',3,0,'2018-01-09','2018-01-12','en','sadasd','asdsad',1500,'paypal','2018-01-05 06:48:01','2018-01-05 06:48:01',NULL,'waiting_for_payment','5a4f1fa1e073e876'),
	(12,'kay','lun',NULL,'kl@buildonauts.com',3,0,'2018-01-09','2018-01-12','en','sadasd','asdsad',1500,'paypal','2018-01-05 06:48:12','2018-01-05 06:48:12',NULL,'waiting_for_payment','5a4f1fac54abb332'),
	(13,'kay','lun',NULL,'kl@buildonauts.com',3,0,'2018-01-09','2018-01-12','en','sadasd','asdsad',1500,'paypal','2018-01-05 06:48:14','2018-01-05 06:48:14',NULL,'waiting_for_payment','5a4f1faee3ff1729'),
	(14,'kay','lun',NULL,'kl@buildonauts.com',3,0,'2018-01-09','2018-01-12','en','sadasd','asdsad',1500,'paypal','2018-01-05 06:50:53','2018-01-05 06:50:53',NULL,'waiting_for_payment','5a4f204de85d2653'),
	(15,'kay','lun',NULL,'kl@buildonauts.com',3,0,'2018-01-09','2018-01-12','en','sadasd','asdsad',1500,'paypal','2018-01-05 06:51:32','2018-01-05 06:51:32',NULL,'waiting_for_payment','5a4f2074afbbf132'),
	(16,'kay','lun',NULL,'kl@buildonauts.com',2,0,'2018-01-09','2018-01-18','sc','hasjdhasjkdh','hjsahdjksahjdk',2250,'paypal','2018-01-05 09:09:32','2018-01-05 09:09:32',NULL,'waiting_for_payment','5a4f40cc01e60247'),
	(17,'kay','lun','PAY-62862408B81867603LJHUJ7Q','kl@buildonauts.com',2,0,'2018-01-09','2018-01-18','en','testing','testtesyeasyue',2250,'paypal','2018-01-05 09:27:03','2018-01-05 09:28:05',NULL,'completed','5a4f44e72689c561'),
	(18,'kay','lun','PAY-91S079360K816242VLJHUK6A','kl@buildonauts.com',2,0,'2018-01-09','2018-01-11','en','jksajkldjka','jksadjkdsaj',1000,'paypal','2018-01-05 09:29:22','2018-01-05 09:29:42',NULL,'completed','5a4f457281fb2960'),
	(19,'C','CCC',NULL,'cc@rytuiop.com',2,0,'2018-04-12','2018-04-13','sc',NULL,'Test',250,'paypal','2018-01-05 11:22:03','2018-01-05 11:22:03',NULL,'waiting_for_payment','5a4f5fdba090f294'),
	(20,'Cleo','Chan',NULL,'cc@buildonauts.com',2,0,'2018-03-01','2018-03-02','en',NULL,NULL,262,'paypal','2018-01-05 11:29:39','2018-01-05 11:29:39',NULL,'waiting_for_payment','5a4f61a3966cc702'),
	(21,'Cleo','Chan',NULL,'cc@buildonauts.com',2,0,'2018-03-01','2018-03-02','en',NULL,NULL,262,'paypal','2018-01-05 11:30:14','2018-01-05 11:30:14',NULL,'waiting_for_payment','5a4f61c6641da446'),
	(22,'Test','test',NULL,'test@test.com',2,0,'2018-04-12','2018-04-13','en','456789fghjkl','43567890',1298,'paypal','2018-01-05 11:37:30','2018-01-05 11:37:30',NULL,'waiting_for_payment','5a4f637a72153651');

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
  `room_subtitle_en` varchar(255) DEFAULT NULL,
  `room_subtitle_sc` varchar(255) DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `description_en` text,
  `description_sc` text,
  `capacity` int(2) DEFAULT NULL,
  `size_en` varchar(255) DEFAULT NULL,
  `size_sc` varchar(255) DEFAULT NULL,
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

INSERT INTO `room_types` (`id`, `name_en`, `name_sc`, `room_title_en`, `room_title_sc`, `room_subtitle_en`, `room_subtitle_sc`, `cover_image`, `description_en`, `description_sc`, `capacity`, `size_en`, `size_sc`, `add_bed`, `queen_bed`, `bunk_bed`, `price`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'sea view','海景房','8 Family Rooms','八间家庭房型',NULL,NULL,'/static/img/room_type/sea-view.jpg','Just 20 steps from the sandy beach, our Sea View rooms are private lodgings capable of accommodating anyone from a small family to a single traveler who just wants a space to call their own. Each one comes complete with two queen sized beds, an air conditioning unit, a fan, mosquito nets, and a bathroom with western flushing toilets and hot water for showers. The rooms face out onto a beautiful spread of beach where guests can enjoy hammocks and our sunset bar. \n','我们的海景房距离沙滩仅有20步之遥，能够容纳从小家庭到单身旅客的任何人，顾客可以拥有自己的理想空间。每间房都配备了两张大床，一个空调机组，一个风扇，一个带西式冲水厕所和热水淋浴的浴室。客房面向美丽的海滩，客人可以享受在吊床吹海风和看夕阳海景等。',4,'16 sq. ft by 15 sq ft = 240 square feet','每间房16平方英呎 X 15平方英呎= 240平方英呎',1,2,NULL,250,NULL,NULL,NULL),
	(2,'river view','河景房','3 Mixed-Dormitory Rooms','3间混合房型','3 mix dormitory river view rooms with 2 double decker & 1 queen bed (6pax)','3间河景房，各有2张双层床和1张双人大床（6人房）','/static/img/room_type/river-view-large.jpg','The River View Mixed-Dormitory Rooms can accommodate up to six people with double-decker beds. Located above the main entrance and dining area, the main differences between the two types of River View rooms are the amount of beds and the maximum number of guests it allows. It is still very close to the beach, about a 15-second walk over a small bridge.','The River View Mixed-Dormitory Rooms can accommodate up to six people with double-decker beds. Located above the main entrance and dining area, the main differences between the two types of River View rooms are the amount of beds and the maximum number of guests it allows. It is still very close to the beach, about a 15-second walk over a small bridge.',6,'16 sq. ft by 15 sq ft = 240 square feet','每间房16平方英呎 X 15平方英呎= 240平方英呎',0,1,2,274,NULL,NULL,NULL),
	(3,'river view','河景房','2 Family Rooms','两间家庭式房型','2 family rooms river view rooms with 1 double decker & 1 queen bed (4pax)','2间家庭河景房，各有1张双层床位和1张双人大床（4人房）','/static/img/room_type/river-view-family.jpg','The River View Family Room accommodates four people comfortably with the option to add a single floor-mattress for a maximum of five. It is located above the dining area and is a 15-second skip over a small bridge from the beach. ','The River View Family Room accommodates four people comfortably with the option to add a single floor-mattress for a maximum of five. It is located above the dining area and is a 15-second skip over a small bridge from the beach. ',4,'16 sq. ft by 15 sq ft = 240 square feet','每间房16平方英呎 X 15平方英呎= 240平方英呎',1,1,1,250,NULL,NULL,NULL);

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


# Dump of table testimonials
# ------------------------------------------------------------

DROP TABLE IF EXISTS `testimonials`;

CREATE TABLE `testimonials` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` text,
  `from` varchar(255) DEFAULT '',
  `chinese` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;

INSERT INTO `testimonials` (`id`, `content`, `from`, `chinese`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'They helped us arrange all our activities based on our interests even though we came without a real plan. Very family-friendly and lots of space to run around on grass or sand.','- Emily L. (UK)',0,'2018-01-03 04:08:04','2018-01-03 04:08:04',NULL),
	(2,'Such a charming, low-key place to stay in Sabah. I felt like I went back to a time when the beaches were pristine and undisturbed. They even rehabilitate baby turtles! Truly special.','- Laura W. (USA)',0,'2018-01-03 04:08:04','2018-01-03 04:08:04',NULL),
	(3,'Came here to get away from work, the city and noise. This place was what I needed. Zero noise pollution, I felt like I could actually relax, read, and enjoy nature.','- Vincent H. (Hong Kong)',0,'2018-01-03 04:08:04','2018-01-03 04:08:04',NULL),
	(4,'在海邊過了一個很不錯的假期～！食物的種類很多，特別的是龍蝦真的新鮮又美味！會再回來的！','-  王芝穎（台灣）',1,'2018-01-03 04:08:04','2018-01-03 04:08:04',NULL),
	(5,'這邊的日落真的名不虛傳，拍了很多照片，又跟家人一起留下了很多回憶！','-  李朗洋（香港）',1,'2018-01-03 04:08:04','2018-01-03 04:08:04',NULL),
	(6,'本以為在這裡沒什麼好玩的，沒想到活動還挺多的，水上活動、陸上活動！晚上還一可以在海邊一邊看日落一邊燒烤呢！','-  張志強（台灣）',1,'2018-01-03 04:08:04','2018-01-03 04:08:04',NULL);

/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'kay','kl@buildonauts.com','$2y$10$ysoVB3APBJL6ouRIZbMbPO8hTQD3P35ikyRBjHMNNZTrf13SVu3Zq',NULL,NULL,NULL,NULL),
	(2,'cleo','cc@buildonauts.com','$2y$10$Tjhl9LbUOPHZmiSOzO7QVea/VguBRrcBuppzZRpb0iKBNTg3pSKYq','RX0VXfyzDz0ozfim1J2l5mWU10p046rQ3VqEtoMkfiChLtIPNndYzTV4fwpX',NULL,NULL,NULL),
	(3,'hilton','hl@buildonauts.com','$2y$10$Tjhl9LbUOPHZmiSOzO7QVea/VguBRrcBuppzZRpb0iKBNTg3pSKYq',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table walking_distances
# ------------------------------------------------------------

DROP TABLE IF EXISTS `walking_distances`;

CREATE TABLE `walking_distances` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL,
  `name_sc` varchar(255) DEFAULT NULL,
  `duration` int(10) DEFAULT NULL,
  `distance` int(10) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `description_en` text,
  `description_sc` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `walking_distances` WRITE;
/*!40000 ALTER TABLE `walking_distances` DISABLE KEYS */;

INSERT INTO `walking_distances` (`id`, `name_en`, `name_sc`, `duration`, `distance`, `image_path`, `description_en`, `description_sc`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Spiritual Tree','百年灵树',5,200,'/static/img/activities/tree.jpg','A 5-minute wander from the resort there is a towering tree that dates back over 400 years, to a time when two young lovers ran away after their relationship was forbidden by their families. Eventually they came upon the tree, and a spirit in the tree spoke to them, directing them onward despite the challenges. Travelers can visit the large and ancient tree, which still grows fruit to this day. ','距离度假村只有五分钟的步行路程，有一棵400多年的高耸古树。传说有一对年轻的恋人，一位是基督教徒，一位是穆斯林，因宗教问题，他们的家人禁止他们交往，于是他们就私奔了。最后他们逃到了这棵大树前，树上的精灵引导着他们到自由之石，也就是「永结同心石」，请求大自然之女神的协助。在大自然之女神的帮助下，终于有情人终成眷属。旅客可以前往参观这棵参天古树，古树至今仍然生长着带酸味的水果。',NULL,NULL,NULL),
	(2,'Healing Well','疗愈水池',5,200,'/static/img/activities/well.jpg','Over 400 years ago, there was a devastating drought in the area. Villagers were directed to dig a well in a location that was thought to have a water source underground. The villagers tasked with digging the well were skeptical, but with little choice they kept digging anyways. Amazingly, the well they dug was able to provide enough water for the whole village for a long time to come. The water was known to have healing properties, so when elders fell ill, they would bathe in and drink from the well.  This well is now known as the Wellness Healing Well and is a 5-minute walk from the resort.','400多年前，该地区发生了一场严重的旱灾。村民被指示在一个被认为有地下水源的地方挖井。负责挖井的村民对此持怀疑态度，但也别无选择地必须继续挖掘。但令人惊讶的是，他们挖出的井在之后很长的时间仍能够为整个村庄提供足够的水。据说这水具有治疗的功能，所以年长的乡民生病时，他们会到此洗澡并从喝井里的水。这口井现在被称为康复疗愈水池（Wellness Healing Well）， 与度假村只距离5分钟的步行路程。',NULL,NULL,NULL),
	(3,'Love Rock','永结同心石',25,1000,'/static/img/activities/rock.jpg','Known locally as Batu Luang （meaning free rock in Malay), Love rock is a bell-shaped rock located on a beautiful strip of beach in Kuala Penyu. Surrounded by mossy rocks, caves, and set to the backdrop of the ocean behind it, you can see one of the most beautiful sunsets in all of Sabah. Love Rock is located 1KM from the resort and is a 25-minute walk away. Here lies a poignant love story with this everlasting concentric rock.','永结同心石（Love Rock）是一个钟形的岩石，位于瓜啦奔优美丽的海滩上，被称为「Batu Luang」，在马来语的意思为自由之石。被奇形怪状的岩石和洞穴所包围，以大海作陪衬，你可以看到沙巴最美丽的日落之一。永结同心石和度假村的距离大约1公里，从度假村沿细白沙滩漫步，大概是25分钟的路程。据说这个永结同心石拥有一个凄美的爱情故事，故事请观看「百年灵树」的部分。',NULL,NULL,NULL);

/*!40000 ALTER TABLE `walking_distances` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

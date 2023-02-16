/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.27-MariaDB : Database - testdb1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`testdb1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `testdb1`;

/*Table structure for table `answers` */

DROP TABLE IF EXISTS `answers`;

CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `result` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `questionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionId` (`questionId`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `questions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `answers` */

insert  into `answers`(`id`,`description`,`result`,`createdAt`,`updatedAt`,`questionId`) values 
(1,'React is frontend javascript language',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',7);

/*Table structure for table `articlecategories` */

DROP TABLE IF EXISTS `articlecategories`;

CREATE TABLE `articlecategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `articlecategories` */

insert  into `articlecategories`(`id`,`title`,`description`,`createdAt`,`updatedAt`) values 
(1,'Software','Software','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(2,'Notification','Notification','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(3,'Science','Science','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(4,'Knowledge','Knowledge','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(5,'Language','Language','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(6,'Others','Others','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `articles` */

DROP TABLE IF EXISTS `articles`;

CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `attach_url` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `recommends` int(11) DEFAULT NULL,
  `oppositions` int(11) DEFAULT NULL,
  `browingcount` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `articleCategoryId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articleCategoryId` (`articleCategoryId`),
  KEY `userId` (`userId`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`articleCategoryId`) REFERENCES `articlecategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `articles` */

insert  into `articles`(`id`,`name`,`description`,`contact_number`,`attach_url`,`source`,`recommends`,`oppositions`,`browingcount`,`createdAt`,`updatedAt`,`articleCategoryId`,`userId`) values 
(12,'William','William Han','2345234534','','W3 School',12,1,321,'2023-02-08 01:28:11','2023-02-08 04:06:04',3,2),
(15,'Jack','Jack Smith','191-000-000','','Magazine',23,1,122,'2023-02-08 04:07:03','2023-02-08 04:07:03',5,2),
(16,'Engeneering','','195-000-0000','','new science magazine',333,22,32,'2023-02-08 17:25:23','2023-02-08 17:25:23',6,7);

/*Table structure for table `avatars` */

DROP TABLE IF EXISTS `avatars`;

CREATE TABLE `avatars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `avatars` */

insert  into `avatars`(`id`,`name`,`cost`,`file_url`,`createdAt`,`updatedAt`) values 
(1,'qqq',342,'1675889167208images (1).jpeg','2023-02-08 19:49:20','2023-02-08 20:46:07'),
(2,'234',23,'1675920645036index.js','2023-02-09 05:30:45','2023-02-09 05:30:45');

/*Table structure for table `browsehistories` */

DROP TABLE IF EXISTS `browsehistories`;

CREATE TABLE `browsehistories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `campusId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `campusId` (`campusId`),
  CONSTRAINT `browsehistories_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `browsehistories_ibfk_2` FOREIGN KEY (`campusId`) REFERENCES `campuses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `browsehistories` */

insert  into `browsehistories`(`id`,`date`,`count`,`createdAt`,`updatedAt`,`userId`,`campusId`) values 
(1,'2023-02-15',34,'0000-00-00 00:00:00','0000-00-00 00:00:00',13,4);

/*Table structure for table `campuscategories` */

DROP TABLE IF EXISTS `campuscategories`;

CREATE TABLE `campuscategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `campuscategories` */

insert  into `campuscategories`(`id`,`title`,`description`,`parentId`,`createdAt`,`updatedAt`) values 
(1,'Frontend','Frontend client',0,'0000-00-00 00:00:00','2023-02-08 02:44:18'),
(2,'Backend','Backend api',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(3,'React.js','React javascript ',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(4,'Vue.js','Vue javascript',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(5,'Node.js','Node javascript',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(6,'Redux','React element',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(7,'HTML','Frontend element',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(13,'HTML','HTML element',7,'2023-02-08 13:02:47','2023-02-08 03:11:18');

/*Table structure for table `campuses` */

DROP TABLE IF EXISTS `campuses`;

CREATE TABLE `campuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `browses` int(11) DEFAULT NULL,
  `recommends` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `campusCategoryId` int(11) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campusCategoryId` (`campusCategoryId`),
  CONSTRAINT `campuses_ibfk_1` FOREIGN KEY (`campusCategoryId`) REFERENCES `campuscategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `campuses` */

insert  into `campuses`(`id`,`name`,`description`,`cost`,`browses`,`recommends`,`createdAt`,`updatedAt`,`campusCategoryId`,`level`) values 
(1,'React','React is trend frontend framework',1000,100,100,'2023-02-08 00:36:38','2023-02-08 00:36:38',3,'1'),
(2,'Node ','Node is trend backend framework',2000,200,200,'0000-00-00 00:00:00','0000-00-00 00:00:00',5,'2'),
(3,'Vue','Vue is trend frontend framework',1000,100,120,'0000-00-00 00:00:00','0000-00-00 00:00:00',4,'3'),
(4,'\'p\' tag','HTML element',1000,10,10,'0000-00-00 00:00:00','0000-00-00 00:00:00',7,'4'),
(8,'\'h1\' tag','HTML element',12,1,1,'2023-02-08 00:47:22','2023-02-08 00:47:22',7,'3'),
(9,'\'h2\' tag ','HTML element',15,5,5,'2023-02-08 01:46:35','2023-02-08 02:23:40',7,'3');

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `articleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `articleId` (`articleId`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`articleId`) REFERENCES `articles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `comments` */

/*Table structure for table `datacategories` */

DROP TABLE IF EXISTS `datacategories`;

CREATE TABLE `datacategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `datacategories` */

insert  into `datacategories`(`id`,`title`,`description`,`parentId`,`createdAt`,`updatedAt`) values 
(1,'Ship Data','aaa',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(2,'Load Data','bbb',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(3,'Product','ccc',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(4,'Good','ddd',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `datapurchasehistoies` */

DROP TABLE IF EXISTS `datapurchasehistoies`;

CREATE TABLE `datapurchasehistoies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `dataId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `dataId` (`dataId`),
  CONSTRAINT `datapurchasehistoies_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `datapurchasehistoies_ibfk_2` FOREIGN KEY (`dataId`) REFERENCES `datas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `datapurchasehistoies` */

insert  into `datapurchasehistoies`(`id`,`type`,`title`,`date`,`createdAt`,`updatedAt`,`userId`,`dataId`) values 
(1,'engineer','math','2023-02-22',NULL,NULL,13,2),
(2,'game','tet','2023-02-15',NULL,NULL,13,1);

/*Table structure for table `datas` */

DROP TABLE IF EXISTS `datas`;

CREATE TABLE `datas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `data_type` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `port` varchar(255) DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `visit` int(11) DEFAULT NULL,
  `licence` varchar(255) DEFAULT NULL,
  `plan_port` varchar(255) DEFAULT NULL,
  `dataCategoryId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `runner` varchar(255) DEFAULT NULL,
  `load_weight` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `current_height` varchar(255) DEFAULT NULL,
  `full_load` varchar(255) DEFAULT NULL,
  `engine` varchar(255) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `factory` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `specification` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `recommends` int(11) DEFAULT NULL,
  `datacol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dataCategoryId` (`dataCategoryId`),
  CONSTRAINT `datas_ibfk_1` FOREIGN KEY (`dataCategoryId`) REFERENCES `datacategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `datas` */

insert  into `datas`(`id`,`name`,`file_url`,`data_type`,`amount`,`unit`,`port`,`limit`,`date`,`price`,`from`,`to`,`visit`,`licence`,`plan_port`,`dataCategoryId`,`status`,`total_weight`,`owner`,`runner`,`load_weight`,`weight`,`width`,`length`,`current_height`,`full_load`,`engine`,`created`,`factory`,`location`,`specification`,`createdAt`,`updatedAt`,`recommends`,`datacol`) values 
(0,'','','',0,0,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-08 18:41:40','2023-02-08 18:41:40',NULL,'4'),
(1,'aaaa','C:\\fakepath\\auth-one-bg.jpg','',0,0,'aaaa',12,'0000-00-00',123112,'','',4,'rwetrqr','china',1,'aaaa',1111,'aaaa','aaaa',1111,1111,1111,1111,'1111','1111','aaaa','0000-00-00','aaaa','aaaa',NULL,NULL,'2023-02-08 01:36:47',NULL,'5'),
(2,'bbbeee','bbbee','bbbexsdsa',2342,123,'fasdf',123,'2023-02-21',123,'qwe','wertwet',2342,'weqwer','hongkong',2,'hard',300,'aaa','bbb',232,2342,342,342,'342','234','2321','2023-02-02','HHHH','UUUU',NULL,NULL,NULL,NULL,'6'),
(5,'adfdgadsfdsfs','dsfdsfadsfs','sadfsdfsdf',1234,123,'safasdfsdaf',123,'0000-00-00',123,'we','rwtwerewq',6456,'werqwer','tokyo',3,'normal',244,'aaa','bbb',1124,34,222,342,'123','234','21311','2023-02-16','VVVV','JJJJ',NULL,NULL,NULL,NULL,'34'),
(7,'qqqq','C:\\fakepath\\bg-auth.jpg','',0,0,'qqqq',NULL,'0000-00-00',1111,'','',NULL,NULL,NULL,NULL,'qqqq',1111,'qqqq','qqqq',1111,1111,1111,1111,'1111','1111','qqqq','0000-00-00','qqqq','qqqq',NULL,'2023-02-07 15:51:49','2023-02-07 15:51:49',NULL,'5'),
(9,'','','',0,0,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-08 18:41:54','2023-02-08 18:41:54',NULL,'5');

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `notifications` */

insert  into `notifications`(`id`,`date`,`description`,`type`,`createdAt`,`updatedAt`) values 
(1,'2022-01-04','New article is created','Article','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(3,'2022-01-11','Macro app was updated','Software','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(4,'0000-00-00','ddddddddd','select1','2023-02-08 01:14:49','2023-02-08 01:14:49'),
(5,'0000-00-00','our password was changed successfully.','select1','2023-02-08 01:24:38','2023-02-08 01:24:38'),
(7,'2023-02-10','Fire Warning','notification1','2023-02-09 00:54:16','2023-02-09 00:54:16'),
(10,'2023-02-01','You entered successfully.','notification2','2023-02-09 01:14:45','2023-02-09 01:14:45'),
(11,'2023-02-01','You entered successfully.','notification2','2023-02-09 01:15:20','2023-02-09 01:15:20'),
(15,'2023-02-09','You are manager','','2023-02-09 01:33:56','2023-02-09 01:33:56'),
(16,'2023-02-09','','','2023-02-09 01:34:14','2023-02-09 01:34:14'),
(17,'2023-02-09','Disney is good cartoon company','','2023-02-09 04:56:10','2023-02-09 04:56:10');

/*Table structure for table `passedtests` */

DROP TABLE IF EXISTS `passedtests`;

CREATE TABLE `passedtests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `testing_counter` int(11) DEFAULT NULL,
  `passed_counter` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `campusCategoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `campusCategoryId` (`campusCategoryId`),
  CONSTRAINT `passedtests_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `passedtests_ibfk_2` FOREIGN KEY (`campusCategoryId`) REFERENCES `campuscategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `passedtests` */

insert  into `passedtests`(`id`,`level`,`testing_counter`,`passed_counter`,`createdAt`,`updatedAt`,`userId`,`campusCategoryId`) values 
(1,1,23,34,'0000-00-00 00:00:00','0000-00-00 00:00:00',13,6);

/*Table structure for table `programcategories` */

DROP TABLE IF EXISTS `programcategories`;

CREATE TABLE `programcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `programcategories` */

insert  into `programcategories`(`id`,`title`,`description`,`parentId`,`createdAt`,`updatedAt`) values 
(1,'All','All',0,'2023-02-08 00:56:52','2023-02-08 01:00:59'),
(2,'Windows','Windows Applications and Games',1,'2023-02-08 00:56:59','2023-02-08 01:00:29'),
(3,'Android','Android Applications and Games',1,'2023-02-08 00:58:52','2023-02-08 01:01:30'),
(4,'Diary','This is Diary App',2,'2023-02-08 01:01:56','2023-02-08 01:01:56'),
(5,'Anti Virus','Kulak Bird',2,'2023-02-08 13:35:15','0000-00-00 00:00:00'),
(6,'Tetris Games','Tetris',3,'2023-02-08 13:35:17','0000-00-00 00:00:00'),
(7,'English Learning','English Learning App',3,'2023-02-08 13:35:18','0000-00-00 00:00:00');

/*Table structure for table `programs` */

DROP TABLE IF EXISTS `programs`;

CREATE TABLE `programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `requirement` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `purchases` int(11) DEFAULT NULL,
  `recommends` int(11) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `programCategoryId` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `programCategoryId` (`programCategoryId`),
  CONSTRAINT `programs_ibfk_1` FOREIGN KEY (`programCategoryId`) REFERENCES `programcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `programs` */

insert  into `programs`(`id`,`name`,`description`,`requirement`,`date`,`purchases`,`recommends`,`file_url`,`cost`,`createdAt`,`updatedAt`,`programCategoryId`,`image_url`) values 
(1,'CS','This is cs','window','2000-12-14',3,3,'',200,'2023-02-08 01:02:45','2023-02-09 00:45:28',4,NULL),
(2,'Card','This is card game','window','2023-02-14',9,9,'',100,'2023-02-08 01:03:28','2023-02-09 00:45:11',5,NULL),
(3,'English Dictionary','This is dictionary','windows/android','2000-12-21',10,10,'',700,'2023-02-08 01:04:39','2023-02-09 00:44:44',6,NULL),
(6,'Sniper','This is sniper','android 8.0','2000-12-22',3,3,'',300,'2023-02-08 01:06:26','2023-02-08 19:06:35',7,NULL),
(7,'Hockey','This is hockey','android 8.0','2023-02-09',6,6,'',200,'2023-02-08 01:07:05','2023-02-08 19:05:11',4,NULL),
(8,'Snowman','This is snowman','android 8.0','2000-12-29',5,5,'',200,'2023-02-08 01:07:08','2023-02-08 19:04:29',5,NULL);

/*Table structure for table `questions` */

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `campusCategoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campusCategoryId` (`campusCategoryId`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`campusCategoryId`) REFERENCES `campuscategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `questions` */

insert  into `questions`(`id`,`description`,`createdAt`,`updatedAt`,`campusCategoryId`) values 
(7,'React?','2023-02-08 01:11:16','2023-02-08 01:11:16',1),
(10,'Vue?','2023-02-08 01:34:26','2023-02-08 01:38:38',4),
(11,'Next?','2023-02-08 01:39:22','2023-02-08 01:39:22',1),
(12,'Node?','2023-02-08 01:42:58','2023-02-08 05:43:22',5);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`createdAt`,`updatedAt`) values 
(1,'user','2023-02-07 22:59:20','2023-02-07 22:59:20'),
(2,'moderator','2023-02-07 22:59:20','2023-02-07 22:59:20'),
(3,'admin','2023-02-07 22:59:20','2023-02-07 22:59:20');

/*Table structure for table `suggestions` */

DROP TABLE IF EXISTS `suggestions`;

CREATE TABLE `suggestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `attach_url` varchar(255) DEFAULT NULL,
  `draft` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `suggestions_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `suggestions` */

insert  into `suggestions`(`id`,`name`,`description`,`contact_number`,`attach_url`,`draft`,`createdAt`,`updatedAt`,`userId`) values 
(1,'','','111-111-1111','','','2023-02-08 01:12:59','2023-02-08 01:12:59',NULL),
(2,'','','111-111-1111','','','2023-02-08 01:13:00','2023-02-08 01:13:00',NULL),
(3,'','','111-111-1111','','','2023-02-08 01:13:00','2023-02-08 01:13:00',NULL),
(4,'','','111-111-1111','','','2023-02-08 01:13:01','2023-02-08 01:13:01',NULL),
(5,'','','111-111-1111','','','2023-02-08 01:13:01','2023-02-08 01:13:01',NULL),
(6,'','','111-111-1111','','','2023-02-08 01:13:01','2023-02-08 01:13:01',NULL);

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user_roles` */

insert  into `user_roles`(`createdAt`,`updatedAt`,`roleId`,`userId`) values 
('2023-02-08 00:46:36','2023-02-08 00:46:36',1,1),
('2023-02-08 00:50:54','2023-02-08 00:50:54',1,2),
('2023-02-08 12:45:14','2023-02-08 12:45:14',1,6),
('2023-02-08 18:00:40','2023-02-08 18:00:40',1,7),
('2023-02-08 20:37:43','2023-02-08 20:37:43',1,8),
('2023-02-08 20:57:44','2023-02-08 20:57:44',1,9),
('2023-02-08 21:21:48','2023-02-08 21:21:48',1,10),
('2023-02-08 21:31:56','2023-02-08 21:31:56',1,11),
('2023-02-09 00:55:22','2023-02-09 00:55:22',1,12),
('2023-02-09 03:17:51','2023-02-09 03:17:51',1,13),
('2023-02-09 04:55:18','2023-02-09 04:55:18',1,14);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `free_balance` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `user_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`name`,`email`,`gender`,`birthday`,`balance`,`free_balance`,`password`,`createdAt`,`updatedAt`,`user_image`) values 
(1,'maria','Maria Balabanova','S@gamil.com','male','2023-02-02',NULL,NULL,'','2023-02-08 00:46:36','2023-02-08 19:50:07',NULL),
(2,'a707','William Han','KS@gmail.com','male','2020-02-01',NULL,NULL,'','2023-02-08 00:50:54','2023-02-08 07:00:49',NULL),
(6,'a703','Paramount','paramountsky7@gmail.com',NULL,NULL,0,0,'$2a$08$BK3./RfG/jqpHAYtjU2JbeQQ12/MSPUtgzKCspYdS4FkjP3tJ37Ne','2023-02-08 12:45:14','2023-02-08 12:45:14',NULL),
(7,'smith','Smith Jackson','fff@gmail.com',NULL,'1970-01-01',0,0,'$2a$08$MNOJn7/NSCAmvdkYbzLNZOOivX92PO8EDWG7k3pXo92aHXC2DMPQW','2023-02-08 18:00:40','2023-02-08 19:00:54',NULL),
(8,'ddd@email.com',NULL,'ddd@email.com',NULL,NULL,0,0,'$2a$08$uGXduvc50x4zOw4eOLGCr.dcxa5PZ1.7WGy9NRsj9m3ln41yzsB8.','2023-02-08 20:37:43','2023-02-08 20:37:43',NULL),
(9,'sdafas','sdafas','sadfdas','sdafas',NULL,NULL,NULL,NULL,'2023-02-08 20:57:44','2023-02-08 20:57:44',NULL),
(10,'robin@gmail.com',NULL,'robin@gmail.com',NULL,NULL,0,0,'$2a$08$qLkOjH1z1LzE/eRzGJinVuP04yr7wU79u/T32NPHT9L6cBayAeuxG','2023-02-08 21:21:48','2023-02-08 21:21:48',NULL),
(11,'ds','dfsdsd','aaaaaaaaa2','male','2023-02-08',NULL,NULL,'','2023-02-08 21:31:56','2023-02-08 21:31:56',NULL),
(12,'jon',NULL,'guard@gmail.com',NULL,'1970-01-01',0,0,'$2a$08$SmrXLwraXSsesomF.yooX.IYBVatCwBCEvJIHmrCFWzrE7wIWSZxG','2023-02-09 00:55:22','2023-02-09 02:16:42',NULL),
(13,'webtopc2021@gmail.com',NULL,'webtopc2021@gmail.com',NULL,NULL,0,0,'$2a$08$8sqGNmcnzaTtyzl0vvKh8.YvhAEZipkw87uPCEyVdKgwwo3kW8MCW','2023-02-09 03:17:51','2023-02-09 03:17:51',NULL),
(14,'admin',NULL,'admin@admin.com',NULL,NULL,0,0,'$2a$08$1qffTjJ8eijWd1kfpC0Yn.zxzqAlX5KiNZ7HzQj3tC/vagJKtMJMW','2023-02-09 04:55:18','2023-02-09 04:55:18',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

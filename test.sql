/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.23 : Database - payment_and_transaction
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`payment_and_transaction` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `payment_and_transaction`;

/*Table structure for table `tax` */

DROP TABLE IF EXISTS `tax`;

CREATE TABLE `tax` (
  `pk_tax_id` int NOT NULL AUTO_INCREMENT,
  `tax_type` varchar(20) DEFAULT NULL,
  `tax_percentage` int DEFAULT NULL,
  PRIMARY KEY (`pk_tax_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tax` */

insert  into `tax`(`pk_tax_id`,`tax_type`,`tax_percentage`) values 
(1,'service tax',18),
(2,'abc tax',20);

/*Table structure for table `transaction` */

DROP TABLE IF EXISTS `transaction`;

CREATE TABLE `transaction` (
  `pk_transaction_id` int NOT NULL AUTO_INCREMENT,
  `fk_driver_id` int NOT NULL,
  `fk_passenger_id` int NOT NULL,
  `payment_method` varchar(30) DEFAULT NULL,
  `fk_tax_id` int DEFAULT NULL,
  `amount_paid_by_passenger` int DEFAULT NULL,
  `percentage_paid_to_driver` int DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  PRIMARY KEY (`pk_transaction_id`),
  KEY `fk_tax_id` (`fk_tax_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`fk_tax_id`) REFERENCES `tax` (`pk_tax_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `transaction` */

insert  into `transaction`(`pk_transaction_id`,`fk_driver_id`,`fk_passenger_id`,`payment_method`,`fk_tax_id`,`amount_paid_by_passenger`,`percentage_paid_to_driver`,`transaction_date`) values 
(1,1,2,'Credit Card',1,100,15,'2021-03-01'),
(2,1,2,'Wallet',1,100,15,'2021-03-02'),
(3,1,2,'Credit Card',1,500,15,'2021-03-04'),
(4,1,2,'Credit Card',1,1000,15,'2021-03-07'),
(5,1,2,'Credit Card',1,200,15,'2021-03-12'),
(6,1,2,'Credit Card',1,100,15,'2021-03-14'),
(7,1,2,'Credit Card',1,100,15,'2021-03-19');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

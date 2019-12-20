/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.48 : Database - p2p
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`p2p` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `p2p`;

/*Table structure for table `t_balance` */

DROP TABLE IF EXISTS `t_balance`;

CREATE TABLE `t_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资金id',
  `user_Id` int(11) NOT NULL COMMENT '用户id标识',
  `money` double NOT NULL COMMENT '可用资金',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `t_balance` */

insert  into `t_balance`(`id`,`user_Id`,`money`) values (4,7,101257.6),(5,19,99200);

/*Table structure for table `t_bid` */

DROP TABLE IF EXISTS `t_bid`;

CREATE TABLE `t_bid` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户投标表',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `user_Id` int(11) NOT NULL COMMENT '用户id',
  `bid_money` double NOT NULL COMMENT '投标金额',
  `bid_time` datetime NOT NULL COMMENT '投标时间',
  `bid_state` int(11) NOT NULL COMMENT '投标状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

/*Data for the table `t_bid` */

insert  into `t_bid`(`id`,`product_id`,`user_Id`,`bid_money`,`bid_time`,`bid_state`) values (1,1,7,1000,'2019-12-18 01:05:26',1),(2,1,7,10000,'2019-12-18 01:05:58',1),(3,1,7,10000,'2019-12-18 01:10:00',1),(4,1,7,10000,'2019-12-18 07:32:35',1),(5,1,7,10000,'2019-12-18 07:32:42',1),(6,1,7,10000,'2019-12-18 07:32:45',1),(7,1,7,10000,'2019-12-18 07:32:47',1),(8,1,7,10000,'2019-12-18 07:32:48',1),(9,1,7,9000,'2019-12-18 07:33:00',1),(10,9,7,500,'2019-12-18 09:12:41',1),(11,9,7,1000,'2019-12-18 11:33:20',1),(12,9,7,5000,'2019-12-18 11:33:32',1),(13,9,7,500,'2019-12-18 11:33:41',1),(14,9,7,100,'2019-12-18 12:22:51',1),(15,9,7,200,'2019-12-18 21:07:27',1),(16,9,7,200,'2019-12-18 21:15:35',1),(17,9,7,200,'2019-12-18 21:17:36',1),(18,2,7,5000,'2019-12-19 13:36:39',1),(19,2,7,100,'2019-12-19 13:38:05',1),(20,2,19,5000,'2019-12-20 07:45:00',1),(21,12,19,6000,'2019-12-20 07:46:48',1),(22,1,7,10000,'2019-12-20 11:31:01',1),(23,1,7,10000,'2019-12-20 11:31:08',1),(24,1,7,2000,'2019-12-20 11:31:12',1),(25,11,7,5000,'2019-12-20 11:58:25',1),(26,11,7,1000,'2019-12-20 11:58:27',1),(27,11,7,100,'2019-12-20 11:58:33',1),(28,10,7,100,'2019-12-20 11:59:08',1),(29,10,7,1900,'2019-12-20 11:59:12',1),(30,10,7,1900,'2019-12-20 11:59:14',1),(31,10,7,1900,'2019-12-20 11:59:16',1),(32,10,7,1900,'2019-12-20 11:59:17',1),(33,10,7,1900,'2019-12-20 11:59:18',1),(34,10,7,1900,'2019-12-20 11:59:19',1),(35,10,7,1900,'2019-12-20 11:59:25',1),(36,10,7,1900,'2019-12-20 11:59:42',1),(37,10,7,100,'2019-12-20 11:59:49',1),(38,10,7,2000,'2019-12-20 12:00:08',1),(39,10,7,2000,'2019-12-20 12:00:10',1),(40,10,7,2100,'2019-12-20 12:00:21',1),(41,12,7,2000,'2019-12-20 12:00:47',1),(42,12,7,5000,'2019-12-20 12:00:52',1),(43,12,7,5000,'2019-12-20 12:00:54',1),(44,12,7,5000,'2019-12-20 12:00:56',1),(45,12,7,5000,'2019-12-20 12:00:57',1),(46,12,7,5000,'2019-12-20 12:00:59',1),(47,12,7,5000,'2019-12-20 12:01:00',1),(48,12,7,5000,'2019-12-20 12:01:02',1),(49,12,7,5000,'2019-12-20 12:01:04',1),(50,12,7,5000,'2019-12-20 12:01:05',1),(51,12,7,5000,'2019-12-20 12:01:07',1);

/*Table structure for table `t_earnings` */

DROP TABLE IF EXISTS `t_earnings`;

CREATE TABLE `t_earnings` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收益id',
  `user_Id` int(11) NOT NULL COMMENT '用户id',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `bid_id` int(11) NOT NULL COMMENT '投标记录id',
  `earnings_time` datetime DEFAULT NULL COMMENT '收益时间',
  `earnings_money` double NOT NULL COMMENT '收益金额',
  `earnings_state` int(11) NOT NULL COMMENT '收益状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `t_earnings` */

insert  into `t_earnings`(`id`,`user_Id`,`product_id`,`bid_id`,`earnings_time`,`earnings_money`,`earnings_state`) values (1,7,9,16,'2019-12-20 00:00:00',209.6,2),(2,7,9,17,'2019-12-20 00:00:00',209.6,2),(3,7,2,18,'2020-06-12 00:00:00',5240,1),(4,7,2,19,'2020-06-12 00:00:00',104.8,1),(5,19,2,20,'2020-06-12 00:00:00',5240,1),(6,19,12,21,'2020-06-12 00:00:00',6288,1),(7,7,1,22,'2020-12-09 00:00:00',10980,1),(8,7,1,23,'2020-12-09 00:00:00',10980,1),(9,7,1,24,'2020-12-09 00:00:00',2196,1),(10,7,11,25,'2020-06-12 00:00:00',5240,1),(11,7,11,26,'2020-06-12 00:00:00',1048,1),(12,7,11,27,'2020-06-12 00:00:00',104.8,1),(13,7,10,28,'2020-06-12 00:00:00',104.8,1),(14,7,10,29,'2020-06-12 00:00:00',1991.2,1),(15,7,10,30,'2020-06-12 00:00:00',1991.2,1),(16,7,10,31,'2020-06-12 00:00:00',1991.2,1),(17,7,10,32,'2020-06-12 00:00:00',1991.2,1),(18,7,10,33,'2020-06-12 00:00:00',1991.2,1),(19,7,10,34,'2020-06-12 00:00:00',1991.2,1),(20,7,10,35,'2020-06-12 00:00:00',1991.2,1),(21,7,10,36,'2020-06-12 00:00:00',1991.2,1),(22,7,10,37,'2020-06-12 00:00:00',104.8,1),(23,7,10,38,'2020-06-12 00:00:00',2096,1),(24,7,10,39,'2020-06-12 00:00:00',2096,1),(25,7,10,40,'2020-06-12 00:00:00',2200.8,1),(26,7,12,41,'2020-06-12 00:00:00',2096,1),(27,7,12,42,'2020-06-12 00:00:00',5240,1),(28,7,12,43,'2020-06-12 00:00:00',5240,1),(29,7,12,44,'2020-06-12 00:00:00',5240,1),(30,7,12,45,'2020-06-12 00:00:00',5240,1),(31,7,12,46,'2020-06-12 00:00:00',5240,1),(32,7,12,47,'2020-06-12 00:00:00',5240,1),(33,7,12,48,'2020-06-12 00:00:00',5240,1),(34,7,12,49,'2020-06-12 00:00:00',5240,1),(35,7,12,50,'2020-06-12 00:00:00',5240,1),(36,7,12,51,'2020-06-12 00:00:00',5240,1);

/*Table structure for table `t_loan` */

DROP TABLE IF EXISTS `t_loan`;

CREATE TABLE `t_loan` (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '借出id表',
  `user_id` int(11) NOT NULL COMMENT '出借人id',
  `sc_id` int(11) NOT NULL COMMENT '散标id',
  `loan_money` double NOT NULL COMMENT '借出金额',
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_loan` */

/*Table structure for table `t_product` */

DROP TABLE IF EXISTS `t_product`;

CREATE TABLE `t_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `product_Name` varchar(50) NOT NULL COMMENT '产品名称',
  `rate` double NOT NULL COMMENT '产品利率',
  `period` int(11) NOT NULL COMMENT '产品周期',
  `publish_time` datetime NOT NULL COMMENT '产品发布时间',
  `type` int(11) NOT NULL COMMENT '产品类型',
  `identifying` varchar(50) NOT NULL COMMENT '产品编号',
  `sum_money` double NOT NULL COMMENT '产品募捐金额',
  `balance` double NOT NULL COMMENT '产品余额',
  `min_money` double NOT NULL COMMENT '最少起投数',
  `max_money` double NOT NULL COMMENT '最大起投数',
  `state` int(11) NOT NULL COMMENT '产品状态,1.未满标，2.满标',
  `finish_time` datetime DEFAULT NULL COMMENT '产品满标时间',
  `describe` text COMMENT '产品描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `t_product` */

insert  into `t_product`(`id`,`product_Name`,`rate`,`period`,`publish_time`,`type`,`identifying`,`sum_money`,`balance`,`min_money`,`max_money`,`state`,`finish_time`,`describe`) values (1,'U享服务',9.8,12,'2019-12-15 17:38:18',1,'20191215173818',100000,58000,100,10000,1,'2019-12-18 07:33:00','U享服务是人人贷为您提供的本金自动循环出借及到期自动转让退出的自动投标服务，自动投标授权服务期限自授权出借之日起至固定服务期届满日止。 当您选择U享服务时，将授权人人贷为您选择符合以下条件的标的并为您进行分散投标、循环出借：人人贷平台上发布的实地认证标、机构担保标及其他借款需求或被转让债权。 您出借所获得的利息可选择循环出借（到期一次性领取本金和利息）或每月领取利息（到期领取本金），不同的利息处理方式对应的扣费后年利率不同，具体以您在进行授权出借时页面展示的相应扣费后年利率为准。 固定服务期内不支持提前退出，服务期限届满后平台将通过债权转让的形式帮助您实现资金退出，但平台不保证退出时效，如债权转让未达成，则您需持有该等债权直至对应的借款到期清偿或提前结清。 按扣费后年利率计算的利息不代表对实际回报的承诺，出借人需自行承担资金出借的风险与责任；网贷有风险，出借需谨慎。'),(2,'薪享服务',9.6,6,'2019-12-15 17:42:40',2,'20191215174240',50000,39900,100,5000,1,NULL,'薪享服务是人人贷针对工薪族出借需求量身打造的高效自动投标服务。自动投标授权服务期限内，用户可在每月固定日期支付固定金额的出借资金（每月出借资金金额由首期授权出借时确定，后续月份不支持修改）。 当您选择薪享服务时，将授权人人贷为您选择符合以下条件的标的为您进行分散投标、循环出借：人人贷平台上发布的实地认证标、机构担保标及其他借款需求或被转让债权。 服务期限届满后，自动投标服务终止，平台根据您的授权通过债权转让系统进行转让退出。但平台不保证退出时效，如债权转让未达成，则您需持有该等债权直至对应的借款到期清偿或提前结清。 按扣费后年利率计算的利息不代表对实际回报的承诺，出借人需自行承担资金出借的风险与责任；网贷有风险，出借需谨慎。'),(3,'薪享服务',9.6,6,'2019-12-15 20:42:40',2,'20191215204240',80000,80000,200,6000,1,NULL,'大苏打事实上大师傅但是官方'),(4,'薪享服务',9.6,6,'2019-12-15 21:42:40',2,'20191215214240',90000,80000,200,6000,1,NULL,'大苏打事实上大师傅但是官方'),(5,'薪享服务',9.6,6,'2019-12-15 21:42:40',2,'20191215214240',90000,80000,200,6000,1,NULL,'大苏打事实上大师傅但是官方'),(6,'薪享服务',9.6,6,'2019-12-15 21:42:40',2,'20191215214240',90000,80000,200,6000,1,NULL,'大苏打事实上大师傅但是官方'),(7,'薪享服务',9.6,6,'2019-12-15 21:42:40',2,'20191215214240',90000,80000,200,6000,1,NULL,'大苏打事实上大师傅但是官方'),(8,'薪享服务',9.6,6,'2019-12-15 21:42:40',2,'20191215214240',90000,80000,200,6000,1,NULL,'大苏打事实上大师傅但是官方'),(9,'薪享服务',9.6,6,'2019-12-15 21:42:40',1,'20191215214240',90000,72300,200,6000,1,NULL,'大苏打事实上大师傅但是官方'),(10,'薪享服务',9.6,6,'2019-12-15 21:42:40',1,'20191215214240',90000,58500,200,6000,1,NULL,'大苏打事实上大师傅但是官方'),(11,'薪享服务',9.6,6,'2019-12-15 21:42:40',1,'20191215214240',90000,73900,200,6000,1,NULL,'大苏打事实上大师傅但是官方'),(12,'薪享服务',9.6,6,'2019-12-15 21:42:40',1,'20191215214240',90000,22000,200,6000,1,NULL,'大苏打事实上大师傅但是官方'),(13,'薪享服务',9.6,6,'2019-12-15 21:42:40',1,'20191215214240',90000,80000,200,6000,1,NULL,'大苏打事实上大师傅但是官方'),(14,'薪享服务',9.6,6,'2019-12-15 21:42:40',1,'20191215214240',90000,80000,200,6000,1,NULL,'大苏打事实上大师傅但是官方'),(15,'薪享服务',9.6,6,'2019-12-15 21:42:40',1,'20191215214240',90000,80000,200,6000,1,NULL,'大苏打事实上大师傅但是官方'),(16,'薪享服务',9.6,6,'2019-12-15 21:42:40',1,'20191215214240',90000,80000,200,6000,1,NULL,'大苏打事实上大师傅但是官方');

/*Table structure for table `t_repayment` */

DROP TABLE IF EXISTS `t_repayment`;

CREATE TABLE `t_repayment` (
  `rep_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '还款id表',
  `sc_id` int(11) NOT NULL COMMENT '散标id',
  `due_time` date NOT NULL COMMENT '还款日',
  `nex_time` date NOT NULL COMMENT '下次还款日',
  `practical_time` date NOT NULL COMMENT '实际还款日',
  `repay_money` double NOT NULL COMMENT '还款金额',
  `surplus_monry` double NOT NULL COMMENT '剩余还款金额',
  `repay_user_id` int(11) NOT NULL COMMENT '还款人id',
  `payee_user_id` int(11) NOT NULL COMMENT '收款人id',
  `periods` int(11) NOT NULL COMMENT '还款剩余期数',
  `state` int(11) NOT NULL COMMENT '1.还款中,2.已还清',
  PRIMARY KEY (`rep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_repayment` */

/*Table structure for table `t_scattered` */

DROP TABLE IF EXISTS `t_scattered`;

CREATE TABLE `t_scattered` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '散标id',
  `user_id` int(11) NOT NULL COMMENT '发起散标的用户',
  `rent_money` double NOT NULL COMMENT '借款金额',
  `residue_money` double NOT NULL COMMENT '剩余金额',
  `periods` int(11) NOT NULL COMMENT '还款周期',
  `state` int(11) NOT NULL COMMENT '1,未满标,2，还款中',
  `annotation` text COMMENT '借款说明',
  PRIMARY KEY (`sc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_scattered` */

/*Table structure for table `t_storage` */

DROP TABLE IF EXISTS `t_storage`;

CREATE TABLE `t_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '充值id',
  `user_Id` int(11) NOT NULL COMMENT '用户id标识',
  `order_number` varchar(50) NOT NULL COMMENT '订单号',
  `state` varchar(50) NOT NULL COMMENT '订单状态',
  `money` double NOT NULL COMMENT '充值金额',
  `storage_time` datetime NOT NULL COMMENT '充值时间',
  `annotation` varchar(50) DEFAULT NULL COMMENT '充值描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `t_storage` */

insert  into `t_storage`(`id`,`user_Id`,`order_number`,`state`,`money`,`storage_time`,`annotation`) values (11,6,'20191213185236879','已充值',100,'2019-12-13 18:52:38',''),(12,6,'20191214181826510','已充值',100,'2019-12-14 18:18:27',''),(13,6,'20191214181935751','已充值',100,'2019-12-14 18:19:38','充值'),(17,7,'20191214194849656','已充值',100,'2019-12-14 19:48:51','充值'),(18,6,'20191214195342724','已充值',10000,'2019-12-14 19:53:53','充值'),(19,6,'20191214195522373','已充值',10000,'2019-12-14 19:55:34','充值10000'),(20,6,'201912142062233','已充值',100,'2019-12-14 20:06:05',''),(21,7,'2019121722353393','已充值',10000,'2019-12-17 22:35:42','充值10000'),(22,7,'201912189167213','已充值',10000,'2019-12-18 09:16:24','今天心情好'),(23,7,'2019121892927779','已充值',10000,'2019-12-18 09:29:40','hhh'),(24,19,'20191219164841442','已充值',10000,'2019-12-19 16:49:02','充值消费'),(25,19,'20191219165742393','已充值',100000,'2019-12-19 16:57:45','今天心情好'),(26,19,'20191219165839443','已充值',100,'2019-12-19 16:58:40',''),(27,19,'2019121917242270','已充值',100,'2019-12-19 17:24:35','我想充钱试试'),(28,7,'2019122018355410','已充值',100000,'2019-12-20 18:35:20','重新充值');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `user_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_Phone` varchar(11) NOT NULL COMMENT '用户是手机号',
  `user_Pwd` varchar(32) NOT NULL COMMENT '用户登录密码',
  `user_Name` varchar(16) DEFAULT NULL COMMENT '用户名称',
  `user_Card` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `user_register_time` datetime NOT NULL COMMENT '用户注册时间',
  `user_login_time` datetime DEFAULT NULL COMMENT '用户最近登录时间',
  `user_img` varchar(50) DEFAULT NULL COMMENT '用户头像路径',
  PRIMARY KEY (`user_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`user_Id`,`user_Phone`,`user_Pwd`,`user_Name`,`user_Card`,`user_register_time`,`user_login_time`,`user_img`) values (6,'123','202cb962ac59075b964b07152d234b70',NULL,NULL,'2019-12-13 18:33:47','2019-12-16 16:01:01','touxiang.png'),(7,'18736823860','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,'2019-12-14 19:15:38','2019-12-20 18:34:34','touxiang.png'),(9,'122','123',NULL,NULL,'2019-12-16 15:16:53','2019-12-16 15:16:56',NULL),(10,'211','2131',NULL,NULL,'2019-12-16 15:17:02','2019-12-16 15:17:04','2123'),(11,'12','12',NULL,NULL,'2019-12-16 15:17:23','2019-12-16 15:17:25','21312'),(12,'1212','123',NULL,NULL,'2019-12-16 15:17:32','2019-12-16 15:17:33','3123'),(13,'213','2312',NULL,NULL,'2019-12-16 15:17:43','2019-12-16 15:17:44','12312'),(14,'21312','23',NULL,NULL,'2019-12-16 15:17:53','2019-12-16 15:17:54','21312'),(15,'21312','2312',NULL,NULL,'2019-12-16 15:18:02','2019-12-16 15:18:05',NULL),(16,'123','2131',NULL,NULL,'2019-12-16 15:18:10','2019-12-16 15:18:12','21321'),(17,'213123','12312',NULL,NULL,'2019-12-16 15:18:18','2019-12-16 15:18:20','2312'),(18,'123','3221',NULL,NULL,'2019-12-16 15:18:29','2019-12-16 15:18:32',NULL),(19,'1234567','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,'2019-12-19 13:43:55','2019-12-20 07:44:31','moren.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

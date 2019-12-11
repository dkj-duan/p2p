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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_balance` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_bid` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_earnings` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_product` */

/*Table structure for table `t_storage` */

DROP TABLE IF EXISTS `t_storage`;

CREATE TABLE `t_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '充值id',
  `user_Id` int(11) NOT NULL COMMENT '用户id标识',
  `order_number` varchar(50) NOT NULL COMMENT '订单号',
  `state` varchar(50) NOT NULL COMMENT '订单状态',
  `money` double NOT NULL COMMENT '充值金额',
  `storage_time` datetime NOT NULL COMMENT '充值时间',
  `explain` varchar(50) DEFAULT NULL COMMENT '充值描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_storage` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

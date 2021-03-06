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

/*Table structure for table `t_admin` */

DROP TABLE IF EXISTS `t_admin`;

CREATE TABLE `t_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `admin_name` varchar(30) NOT NULL COMMENT '管理用户名',
  `admin_pwd` varchar(40) NOT NULL COMMENT '密码',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_admin` */

/*Table structure for table `t_balance` */

DROP TABLE IF EXISTS `t_balance`;

CREATE TABLE `t_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资金id',
  `user_Id` int(11) NOT NULL COMMENT '用户id标识',
  `money` double NOT NULL COMMENT '可用资金',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `t_balance` */

insert  into `t_balance`(`id`,`user_Id`,`money`) values (26,40,12046.02),(27,41,11153.98),(28,42,900);

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

/*Table structure for table `t_loan` */

DROP TABLE IF EXISTS `t_loan`;

CREATE TABLE `t_loan` (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '借出id表',
  `user_id` int(11) NOT NULL COMMENT '借款人id',
  `loan_user_Id` int(11) NOT NULL COMMENT '出借人id',
  `sc_id` int(11) NOT NULL COMMENT '散标id',
  `loan_money` double NOT NULL COMMENT '借出金额',
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `t_loan` */

insert  into `t_loan`(`loan_id`,`user_id`,`loan_user_Id`,`sc_id`,`loan_money`) values (34,41,40,26,1000);

/*Table structure for table `t_message` */

DROP TABLE IF EXISTS `t_message`;

CREATE TABLE `t_message` (
  `messId` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息信息',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `message` varchar(200) DEFAULT NULL COMMENT '消息',
  `state` int(11) NOT NULL COMMENT '读取状态',
  PRIMARY KEY (`messId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_message` */

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `t_product` */

insert  into `t_product`(`id`,`product_Name`,`rate`,`period`,`publish_time`,`type`,`identifying`,`sum_money`,`balance`,`min_money`,`max_money`,`state`,`finish_time`,`describe`) values (17,'U享2011期',9.8,6,'2019-12-25 02:12:33',1,'20191225021233',500000,500000,200,10000,1,NULL,'U享服务是人人贷为您提供的本金自动循环出借及到期自动转让退出的自动投标服务，自动投标授权服务期限自授权出借之日起至固定服务期届满日止。 当您选择U享服务时，将授权人人贷为您选择符合以下条件的标的并为您进行分散投标、循环出借：人人贷平台上发布的实地认证标、机构担保标及其他借款需求或被转让债权。 您出借所获得的利息可选择循环出借（到期一次性领取本金和利息）或每月领取利息（到期领取本金），不同的利息处理方式对应的扣费后年利率不同，具体以您在进行授权出借时页面展示的相应扣费后年利率为准。 固定服务期内不支持提前退出，服务期限届满后平台将通过债权转让的形式帮助您实现资金退出，但平台不保证退出时效，如债权转让未达成，则您需持有该等债权直至对应的借款到期清偿或提前结清。 按扣费后年利率计算的利息不代表对实际回报的承诺，出借人需自行承担资金出借的风险与责任；网贷有风险，出借需谨慎。'),(18,'U享2012期',9.9,12,'2019-12-25 02:14:16',1,'20191225021416',100000,100000,100,5000,1,NULL,'U享服务是人人贷为您提供的本金自动循环出借及到期自动转让退出的自动投标服务，自动投标授权服务期限自授权出借之日起至固定服务期届满日止。 当您选择U享服务时，将授权人人贷为您选择符合以下条件的标的并为您进行分散投标、循环出借：人人贷平台上发布的实地认证标、机构担保标及其他借款需求或被转让债权。 您出借所获得的利息可选择循环出借（到期一次性领取本金和利息）或每月领取利息（到期领取本金），不同的利息处理方式对应的扣费后年利率不同，具体以您在进行授权出借时页面展示的相应扣费后年利率为准。 固定服务期内不支持提前退出，服务期限届满后平台将通过债权转让的形式帮助您实现资金退出，但平台不保证退出时效，如债权转让未达成，则您需持有该等债权直至对应的借款到期清偿或提前结清。 按扣费后年利率计算的利息不代表对实际回报的承诺，出借人需自行承担资金出借的风险与责任；网贷有风险，出借需谨慎。'),(19,'U享2013期',9.6,24,'2019-12-25 02:17:10',1,'20191225021710',2000000,2000000,1000,100000,1,NULL,'U享服务是人人贷为您提供的本金自动循环出借及到期自动转让退出的自动投标服务，自动投标授权服务期限自授权出借之日起至固定服务期届满日止。 当您选择U享服务时，将授权人人贷为您选择符合以下条件的标的并为您进行分散投标、循环出借：人人贷平台上发布的实地认证标、机构担保标及其他借款需求或被转让债权。 您出借所获得的利息可选择循环出借（到期一次性领取本金和利息）或每月领取利息（到期领取本金），不同的利息处理方式对应的扣费后年利率不同，具体以您在进行授权出借时页面展示的相应扣费后年利率为准。 固定服务期内不支持提前退出，服务期限届满后平台将通过债权转让的形式帮助您实现资金退出，但平台不保证退出时效，如债权转让未达成，则您需持有该等债权直至对应的借款到期清偿或提前结清。 按扣费后年利率计算的利息不代表对实际回报的承诺，出借人需自行承担资金出借的风险与责任；网贷有风险，出借需谨慎。'),(20,'U享2014期',9.7,3,'2019-12-25 02:18:37',1,'20191225021837',100000,100000,100,2000,1,NULL,'U享服务是人人贷为您提供的本金自动循环出借及到期自动转让退出的自动投标服务，自动投标授权服务期限自授权出借之日起至固定服务期届满日止。 当您选择U享服务时，将授权人人贷为您选择符合以下条件的标的并为您进行分散投标、循环出借：人人贷平台上发布的实地认证标、机构担保标及其他借款需求或被转让债权。 您出借所获得的利息可选择循环出借（到期一次性领取本金和利息）或每月领取利息（到期领取本金），不同的利息处理方式对应的扣费后年利率不同，具体以您在进行授权出借时页面展示的相应扣费后年利率为准。 固定服务期内不支持提前退出，服务期限届满后平台将通过债权转让的形式帮助您实现资金退出，但平台不保证退出时效，如债权转让未达成，则您需持有该等债权直至对应的借款到期清偿或提前结清。 按扣费后年利率计算的利息不代表对实际回报的承诺，出借人需自行承担资金出借的风险与责任；网贷有风险，出借需谨慎。'),(21,'U享2015期',9.5,6,'2019-12-25 02:19:57',1,'20191225021957',850000,850000,500,5000,1,NULL,'U享服务是人人贷为您提供的本金自动循环出借及到期自动转让退出的自动投标服务，自动投标授权服务期限自授权出借之日起至固定服务期届满日止。 当您选择U享服务时，将授权人人贷为您选择符合以下条件的标的并为您进行分散投标、循环出借：人人贷平台上发布的实地认证标、机构担保标及其他借款需求或被转让债权。 您出借所获得的利息可选择循环出借（到期一次性领取本金和利息）或每月领取利息（到期领取本金），不同的利息处理方式对应的扣费后年利率不同，具体以您在进行授权出借时页面展示的相应扣费后年利率为准。 固定服务期内不支持提前退出，服务期限届满后平台将通过债权转让的形式帮助您实现资金退出，但平台不保证退出时效，如债权转让未达成，则您需持有该等债权直至对应的借款到期清偿或提前结清。 按扣费后年利率计算的利息不代表对实际回报的承诺，出借人需自行承担资金出借的风险与责任；网贷有风险，出借需谨慎。'),(22,'U享2016期',9,1,'2019-12-25 02:21:31',1,'20191225022131',500000,500000,300,3000,1,NULL,'U享服务是人人贷为您提供的本金自动循环出借及到期自动转让退出的自动投标服务，自动投标授权服务期限自授权出借之日起至固定服务期届满日止。 当您选择U享服务时，将授权人人贷为您选择符合以下条件的标的并为您进行分散投标、循环出借：人人贷平台上发布的实地认证标、机构担保标及其他借款需求或被转让债权。 您出借所获得的利息可选择循环出借（到期一次性领取本金和利息）或每月领取利息（到期领取本金），不同的利息处理方式对应的扣费后年利率不同，具体以您在进行授权出借时页面展示的相应扣费后年利率为准。 固定服务期内不支持提前退出，服务期限届满后平台将通过债权转让的形式帮助您实现资金退出，但平台不保证退出时效，如债权转让未达成，则您需持有该等债权直至对应的借款到期清偿或提前结清。 按扣费后年利率计算的利息不代表对实际回报的承诺，出借人需自行承担资金出借的风险与责任；网贷有风险，出借需谨慎。'),(23,'U享2017期',10,36,'2019-12-25 02:22:40',1,'20191225022240',1000000,1000000,3000,200000,1,NULL,'U享服务是人人贷为您提供的本金自动循环出借及到期自动转让退出的自动投标服务，自动投标授权服务期限自授权出借之日起至固定服务期届满日止。 当您选择U享服务时，将授权人人贷为您选择符合以下条件的标的并为您进行分散投标、循环出借：人人贷平台上发布的实地认证标、机构担保标及其他借款需求或被转让债权。 您出借所获得的利息可选择循环出借（到期一次性领取本金和利息）或每月领取利息（到期领取本金），不同的利息处理方式对应的扣费后年利率不同，具体以您在进行授权出借时页面展示的相应扣费后年利率为准。 固定服务期内不支持提前退出，服务期限届满后平台将通过债权转让的形式帮助您实现资金退出，但平台不保证退出时效，如债权转让未达成，则您需持有该等债权直至对应的借款到期清偿或提前结清。 按扣费后年利率计算的利息不代表对实际回报的承诺，出借人需自行承担资金出借的风险与责任；网贷有风险，出借需谨慎。'),(24,'薪享2011期',8,3,'2019-12-25 02:24:20',2,'20191225022420',400000,400000,200,50000,1,NULL,'薪享服务是人人贷针对工薪族出借需求量身打造的高效自动投标服务。自动投标授权服务期限内，用户可在每月固定日期支付固定金额的出借资金（每月出借资金金额由首期授权出借时确定，后续月份不支持修改）。 当您选择薪享服务时，将授权人人贷为您选择符合以下条件的标的为您进行分散投标、循环出借：人人贷平台上发布的实地认证标、机构担保标及其他借款需求或被转让债权。 服务期限届满后，自动投标服务终止，平台根据您的授权通过债权转让系统进行转让退出。但平台不保证退出时效，如债权转让未达成，则您需持有该等债权直至对应的借款到期清偿或提前结清。 按扣费后年利率计算的利息不代表对实际回报的承诺，出借人需自行承担资金出借的风险与责任；网贷有风险，出借需谨慎。'),(25,'薪享2012期',8.6,6,'2019-12-25 02:25:33',2,'20191225022533',500000,500000,100,3000,1,NULL,'薪享服务是人人贷针对工薪族出借需求量身打造的高效自动投标服务。自动投标授权服务期限内，用户可在每月固定日期支付固定金额的出借资金（每月出借资金金额由首期授权出借时确定，后续月份不支持修改）。 当您选择薪享服务时，将授权人人贷为您选择符合以下条件的标的为您进行分散投标、循环出借：人人贷平台上发布的实地认证标、机构担保标及其他借款需求或被转让债权。 服务期限届满后，自动投标服务终止，平台根据您的授权通过债权转让系统进行转让退出。但平台不保证退出时效，如债权转让未达成，则您需持有该等债权直至对应的借款到期清偿或提前结清。 按扣费后年利率计算的利息不代表对实际回报的承诺，出借人需自行承担资金出借的风险与责任；网贷有风险，出借需谨慎。'),(26,'薪享2013期',8.8,8,'2019-12-25 02:26:45',2,'20191225022645',100000,100000,100,1000,1,NULL,'薪享服务是人人贷针对工薪族出借需求量身打造的高效自动投标服务。自动投标授权服务期限内，用户可在每月固定日期支付固定金额的出借资金（每月出借资金金额由首期授权出借时确定，后续月份不支持修改）。 当您选择薪享服务时，将授权人人贷为您选择符合以下条件的标的为您进行分散投标、循环出借：人人贷平台上发布的实地认证标、机构担保标及其他借款需求或被转让债权。 服务期限届满后，自动投标服务终止，平台根据您的授权通过债权转让系统进行转让退出。但平台不保证退出时效，如债权转让未达成，则您需持有该等债权直至对应的借款到期清偿或提前结清。 按扣费后年利率计算的利息不代表对实际回报的承诺，出借人需自行承担资金出借的风险与责任；网贷有风险，出借需谨慎。'),(27,'薪享2014期',8.2,1,'2019-12-25 02:27:45',2,'20191225022745',300000,300000,300,5000,1,NULL,'薪享服务是人人贷针对工薪族出借需求量身打造的高效自动投标服务。自动投标授权服务期限内，用户可在每月固定日期支付固定金额的出借资金（每月出借资金金额由首期授权出借时确定，后续月份不支持修改）。 当您选择薪享服务时，将授权人人贷为您选择符合以下条件的标的为您进行分散投标、循环出借：人人贷平台上发布的实地认证标、机构担保标及其他借款需求或被转让债权。 服务期限届满后，自动投标服务终止，平台根据您的授权通过债权转让系统进行转让退出。但平台不保证退出时效，如债权转让未达成，则您需持有该等债权直至对应的借款到期清偿或提前结清。 按扣费后年利率计算的利息不代表对实际回报的承诺，出借人需自行承担资金出借的风险与责任；网贷有风险，出借需谨慎。'),(28,'薪享2015期',8.4,12,'2019-12-25 02:28:42',2,'20191225022842',500000,500000,100,6000,1,NULL,'薪享服务是人人贷针对工薪族出借需求量身打造的高效自动投标服务。自动投标授权服务期限内，用户可在每月固定日期支付固定金额的出借资金（每月出借资金金额由首期授权出借时确定，后续月份不支持修改）。 当您选择薪享服务时，将授权人人贷为您选择符合以下条件的标的为您进行分散投标、循环出借：人人贷平台上发布的实地认证标、机构担保标及其他借款需求或被转让债权。 服务期限届满后，自动投标服务终止，平台根据您的授权通过债权转让系统进行转让退出。但平台不保证退出时效，如债权转让未达成，则您需持有该等债权直至对应的借款到期清偿或提前结清。 按扣费后年利率计算的利息不代表对实际回报的承诺，出借人需自行承担资金出借的风险与责任；网贷有风险，出借需谨慎。'),(29,'薪享2016期',8.5,3,'2019-12-25 02:29:33',2,'20191225022933',70000,70000,100,3000,1,NULL,'薪享服务是人人贷针对工薪族出借需求量身打造的高效自动投标服务。自动投标授权服务期限内，用户可在每月固定日期支付固定金额的出借资金（每月出借资金金额由首期授权出借时确定，后续月份不支持修改）。 当您选择薪享服务时，将授权人人贷为您选择符合以下条件的标的为您进行分散投标、循环出借：人人贷平台上发布的实地认证标、机构担保标及其他借款需求或被转让债权。 服务期限届满后，自动投标服务终止，平台根据您的授权通过债权转让系统进行转让退出。但平台不保证退出时效，如债权转让未达成，则您需持有该等债权直至对应的借款到期清偿或提前结清。 按扣费后年利率计算的利息不代表对实际回报的承诺，出借人需自行承担资金出借的风险与责任；网贷有风险，出借需谨慎。'),(30,'薪享2017期',8.9,6,'2019-12-25 02:30:24',2,'20191225023024',800000,800000,300,5000,1,NULL,'薪享服务是人人贷针对工薪族出借需求量身打造的高效自动投标服务。自动投标授权服务期限内，用户可在每月固定日期支付固定金额的出借资金（每月出借资金金额由首期授权出借时确定，后续月份不支持修改）。 当您选择薪享服务时，将授权人人贷为您选择符合以下条件的标的为您进行分散投标、循环出借：人人贷平台上发布的实地认证标、机构担保标及其他借款需求或被转让债权。 服务期限届满后，自动投标服务终止，平台根据您的授权通过债权转让系统进行转让退出。但平台不保证退出时效，如债权转让未达成，则您需持有该等债权直至对应的借款到期清偿或提前结清。 按扣费后年利率计算的利息不代表对实际回报的承诺，出借人需自行承担资金出借的风险与责任；网贷有风险，出借需谨慎。');

/*Table structure for table `t_record` */

DROP TABLE IF EXISTS `t_record`;

CREATE TABLE `t_record` (
  `re_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '还款记录id',
  `repay_user_id` int(11) NOT NULL COMMENT '还款人id',
  `user_id` int(11) NOT NULL COMMENT '收款人id',
  `sc_id` int(11) NOT NULL COMMENT '散标id',
  `repay_money` double NOT NULL COMMENT '还款金额',
  `repay_time` date NOT NULL COMMENT '还款时间',
  PRIMARY KEY (`re_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `t_record` */

insert  into `t_record`(`re_id`,`repay_user_id`,`user_id`,`sc_id`,`repay_money`,`repay_time`) values (14,40,41,26,175.67,'2020-01-05'),(15,40,41,26,175.67,'2020-01-06'),(16,40,41,26,175.67,'2020-01-06'),(17,40,41,26,175.67,'2020-01-06'),(18,40,41,26,175.65,'2020-01-06'),(19,40,41,26,175.65,'2020-01-06');

/*Table structure for table `t_repayment` */

DROP TABLE IF EXISTS `t_repayment`;

CREATE TABLE `t_repayment` (
  `rep_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '还款id表',
  `sc_id` int(11) NOT NULL COMMENT '散标id',
  `due_time` date NOT NULL COMMENT '还款日',
  `nex_time` date NOT NULL COMMENT '下次还款日',
  `practical_time` date DEFAULT NULL COMMENT '实际还款日',
  `repay_money` double NOT NULL COMMENT '还款金额',
  `surplus_monry` double NOT NULL COMMENT '剩余还款金额',
  `repay_user_id` int(11) NOT NULL COMMENT '还款人id',
  `payee_user_id` int(11) NOT NULL COMMENT '收款人id',
  `periods` int(11) NOT NULL COMMENT '还款剩余期数',
  `state` int(11) NOT NULL COMMENT '1.还款中,2.已还清',
  PRIMARY KEY (`rep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `t_repayment` */

insert  into `t_repayment`(`rep_id`,`sc_id`,`due_time`,`nex_time`,`practical_time`,`repay_money`,`surplus_monry`,`repay_user_id`,`payee_user_id`,`periods`,`state`) values (29,26,'2020-08-02','2020-09-01','2020-01-06',175.65,0,40,41,0,2);

/*Table structure for table `t_scattered` */

DROP TABLE IF EXISTS `t_scattered`;

CREATE TABLE `t_scattered` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '散标id',
  `user_id` int(11) NOT NULL COMMENT '发起散标的用户',
  `rent_money` double NOT NULL COMMENT '借款金额',
  `residue_money` double NOT NULL COMMENT '剩余金额',
  `periods` int(11) NOT NULL COMMENT '还款周期',
  `rate` double NOT NULL DEFAULT '10.8' COMMENT '利率',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '1,未满标,2，还款中',
  `annotation` text COMMENT '借款说明',
  PRIMARY KEY (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `t_scattered` */

insert  into `t_scattered`(`sc_id`,`user_id`,`rent_money`,`residue_money`,`periods`,`rate`,`state`,`annotation`) values (26,40,1000,0,6,10.8,2,'测试');

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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

/*Data for the table `t_storage` */

insert  into `t_storage`(`id`,`user_Id`,`order_number`,`state`,`money`,`storage_time`,`annotation`) values (45,41,'202015201221249','已充值',10000,'2020-01-05 20:12:25','充值1W'),(46,40,'2020168149300','已充值',100,'2020-01-06 08:02:00','充值100'),(47,40,'2020168259391','已充值',100,'2020-01-06 08:03:06','再充值100'),(48,40,'2020168337602','已充值',100,'2020-01-06 08:03:44','充值100'),(49,41,'202016141430829','已充值',100,'2020-01-06 14:14:42','充值100'),(50,40,'20201614278177','已充值',100,'2020-01-06 14:27:12','充值100'),(51,40,'20201614313919','已充值',100,'2020-01-06 14:31:05',''),(52,40,'202016143435511','已充值',100,'2020-01-06 14:34:43','冲个澡'),(53,40,'202016143730550','已充值',1000,'2020-01-06 14:37:37','充值'),(54,40,'202016143943386','已充值',200,'2020-01-06 14:39:52','充值200'),(55,40,'202016145051786','已充值',1000,'2020-01-06 14:50:52',''),(56,40,'202016145133802','已充值',1000,'2020-01-06 14:51:34',''),(57,40,'202016145556639','已充值',1000,'2020-01-06 14:55:57',''),(58,40,'202016145722530','已充值',1000,'2020-01-06 14:57:23',''),(59,40,'20201615102390','已充值',100,'2020-01-06 15:10:04',''),(60,40,'20201615205776','已充值',5000,'2020-01-06 15:20:58',''),(61,40,'202016152953665','已充值',100,'2020-01-06 15:29:54',''),(62,40,'202016153027502','已充值',100,'2020-01-06 15:30:28',''),(63,40,'20201615316995','已充值',1000,'2020-01-06 15:31:08',''),(64,42,'202016162214526','已充值',100,'2020-01-06 16:22:16',''),(65,42,'20201714221254','已充值',100,'2020-01-07 14:22:51',NULL),(66,42,'2020171428502','已充值',200,'2020-01-07 14:29:17',NULL),(67,42,'202017143254203','已充值',100,'2020-01-07 14:33:20',NULL),(68,42,'2020010722001405611000315766','已充值',200,'2020-01-07 14:37:19',NULL),(69,42,'2020010722001405611000312599','已充值',200,'2020-01-07 14:38:06',NULL),(70,41,'2020010922001405611000318392','已充值',1000,'2020-01-09 12:00:47',NULL);

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
  `user_img` varchar(200) DEFAULT NULL COMMENT '用户头像路径',
  PRIMARY KEY (`user_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`user_Id`,`user_Phone`,`user_Pwd`,`user_Name`,`user_Card`,`user_register_time`,`user_login_time`,`user_img`) values (40,'18736823866','e10adc3949ba59abbe56e057f20f883e','张三','411421199807228888','2020-01-05 20:11:27','2020-01-07 14:21:31','04e595626d69409c9f4350f331449152_xxx.jpg'),(41,'18736823860','e10adc3949ba59abbe56e057f20f883e','段康家','411421199807226666','2020-01-05 20:11:41','2020-01-09 12:05:19','1dd731a39b9d4017a176e21989c25b9d_x.jpg'),(42,'18736823868','e10adc3949ba59abbe56e057f20f883e','哈哈','411421199807777633','2020-01-06 16:21:53','2020-01-07 14:36:20','2dd0c38d0ed041d29d2cbfb52ded8923_xxx.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

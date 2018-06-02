# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 192.168.0.12 (MySQL 5.7.17)
# Database: survey
# Generation Time: 2018-06-02 14:40:43 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table dept
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '部门名称',
  `code` varchar(20) DEFAULT '0000' COMMENT '部门编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `i_dept_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;

INSERT INTO `dept` (`id`, `name`, `code`, `create_time`)
VALUES
	(1,'研发部','1001','2018-05-05 09:42:17'),
	(2,'测试部','1002','2018-05-05 09:45:06'),
	(3,'市场部','1003','2018-05-05 09:46:30');

/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table employee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '员工姓名',
  `phone` varchar(20) NOT NULL COMMENT '员工手机号',
  `sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别，1：男孩，0：女孩',
  `nickname` varchar(64) DEFAULT NULL COMMENT '员工昵称',
  `code` varchar(20) DEFAULT '0000' COMMENT '部门编号',
  `total_score` int(11) NOT NULL DEFAULT '0' COMMENT '总得分',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='雇员表';

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;

INSERT INTO `employee` (`id`, `name`, `phone`, `sex`, `nickname`, `code`, `total_score`, `create_time`, `update_time`)
VALUES
	(1,'张三','18710001000',0,'小三','1001',0,'2018-05-05 10:38:03','2018-05-05 10:38:03'),
	(3,'weiteng','18710945778',1,NULL,'1001',10,'2018-05-06 05:59:32','2018-05-06 05:59:32');

/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table topic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `topic`;

CREATE TABLE `topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_content` text NOT NULL COMMENT '题目的内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `score` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='题目表';

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;

INSERT INTO `topic` (`topic_id`, `topic_content`, `create_time`, `score`)
VALUES
	(6,'你知道中国有多少个民族？','2018-05-05 22:46:49',2),
	(8,'“男孩”对“男子”，正如女孩对*','2018-05-06 11:52:25',2),
	(9,'下面是对这首诗内容的理解，不准确的一项是（    ）\r\n最爱湖东行不足，绿杨阴里白沙堤。','2018-05-06 14:35:28',2),
	(10,'河姆渡和半坡原始居民分别种植水稻和粟，决定我国南北方种植农作物不同的最主要原因是','2018-05-06 18:13:51',2),
	(11,'西周末年，周幽王上演了一场“烽火戏诸侯”的闹剧。诸侯率兵前往护卫周王是遵守了','2018-05-06 18:14:44',2),
	(12,'秦朝统治者打击儒学，西汉统治者却推崇儒学，导致这一变化的原因是：','2018-05-06 18:19:59',2),
	(13,'某同学读到唐代诗人杜甫诗：“闻道寻源使，从此天路回。牵猪去几许？宛马至今来。”关于“寻源使”，下列人物最符合这一称谓的是','2018-05-06 22:17:27',2),
	(14,'公元207年，曹操曾写诗明志：“老骥伏枥，志在千里。烈士暮年，壮心不已。”结合所学知识判断，当时曹操“志”在何处','2018-05-06 22:18:07',2),
	(15,'在这条公路上行驶的最高速度不能超过多少？','2018-06-02 15:37:55',1),
	(16,'摧毁统治中国22年之久的国民党政权的历史事件是','2018-06-02 15:40:28',2),
	(17,'20世纪50年代，在农村的某个地方传唱着这样一首民歌：“稻谷赶黄豆，黄豆像地瓜，芝麻赛玉米，玉米比人大。”你认为这首民歌创作的年代是','2018-06-02 15:41:09',2);

/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table topic_answer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `topic_answer`;

CREATE TABLE `topic_answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_content` text NOT NULL COMMENT '答案的内容',
  `topic_id` int(11) NOT NULL COMMENT '题目的ID',
  `option_id` int(11) NOT NULL COMMENT '选项的ID',
  `option_code` varchar(2) NOT NULL COMMENT '答案的选项',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`answer_id`),
  KEY `i_answer_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='题目表';

LOCK TABLES `topic_answer` WRITE;
/*!40000 ALTER TABLE `topic_answer` DISABLE KEYS */;

INSERT INTO `topic_answer` (`answer_id`, `answer_content`, `topic_id`, `option_id`, `option_code`, `create_time`, `update_time`)
VALUES
	(1,'56个',6,974626259,'A','2018-05-05 14:46:48','2018-05-05 14:46:48'),
	(3,'姑娘',8,718915403,'B','2018-05-05 17:59:24','2018-05-05 17:59:24'),
	(4,'颔联、颈联写莺、燕、花、草四种最能体现春色的景物。',9,2119695669,'B','2018-05-05 20:20:16','2018-05-05 20:20:16'),
	(5,'自然条件',10,1961819592,'B','2018-05-06 00:16:55','2018-05-06 00:16:55'),
	(6,'分封制的义务',11,1426229153,'C','2018-05-06 00:17:53','2018-05-06 00:17:53'),
	(7,'国情的变化需要',12,971480969,'A','2018-05-06 00:23:34','2018-05-06 00:23:34'),
	(8,'张骞',13,1790325392,'D','2018-05-06 04:06:16','2018-05-06 04:06:16'),
	(9,'统一天下',14,2009593673,'A','2018-05-06 04:06:59','2018-05-06 04:06:59'),
	(10,'40公里/小时',15,8115601,'C','2018-06-02 07:37:55','2018-06-02 07:37:55'),
	(11,'辽沈战役',16,972332955,'A','2018-06-02 07:40:27','2018-06-02 07:40:27'),
	(12,'大跃进”时期',17,2020202906,'A','2018-06-02 07:41:09','2018-06-02 07:41:09');

/*!40000 ALTER TABLE `topic_answer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table topic_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `topic_option`;

CREATE TABLE `topic_option` (
  `option_id` int(11) NOT NULL,
  `option_code` varchar(2) NOT NULL COMMENT '题目选项code',
  `option_content` text NOT NULL COMMENT '题目的内容',
  `topic_id` int(11) NOT NULL COMMENT '题目的ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`option_id`),
  KEY `i_topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='题目表';

LOCK TABLES `topic_option` WRITE;
/*!40000 ALTER TABLE `topic_option` DISABLE KEYS */;

INSERT INTO `topic_option` (`option_id`, `option_code`, `option_content`, `topic_id`, `create_time`, `update_time`)
VALUES
	(8115601,'C','40公里/小时',15,'2018-06-02 07:37:55','2018-06-02 07:37:55'),
	(181040892,'A','封建制的法规',11,'2018-05-06 00:17:53','2018-05-06 00:17:53'),
	(204218773,'D','渡江战役',16,'2018-06-02 07:40:27','2018-06-02 07:40:27'),
	(225313115,'C','孝文帝',13,'2018-05-06 04:06:16','2018-05-06 04:06:16'),
	(426109252,'B','平津战役',16,'2018-06-02 07:40:27','2018-06-02 07:40:27'),
	(482404091,'D','禅让制的规则',11,'2018-05-06 00:17:53','2018-05-06 00:17:53'),
	(569077736,'B','54个',6,'2018-05-05 14:46:48','2018-05-05 14:46:48'),
	(613236554,'D','统治者个人的喜好',12,'2018-05-06 00:23:34','2018-05-06 00:23:34'),
	(657839173,'C','抗美援朝时期　',17,'2018-06-02 07:41:09','2018-06-02 07:41:09'),
	(670885883,'C','儒学自身的发展',12,'2018-05-06 00:23:34','2018-05-06 00:23:34'),
	(708555563,'B','商鞅',13,'2018-05-06 04:06:16','2018-05-06 04:06:16'),
	(718915403,'B','姑娘',8,'2018-05-05 17:59:24','2018-05-05 17:59:24'),
	(750482664,'A','秦始皇',13,'2018-05-06 04:06:16','2018-05-06 04:06:16'),
	(770780127,'B','消灭袁绍',14,'2018-05-06 04:06:59','2018-05-06 04:06:59'),
	(905566088,'C','妇女',8,'2018-05-05 17:59:24','2018-05-05 17:59:24'),
	(928734166,'D','尾联详细描写了“白沙堤”的美丽景色。',9,'2018-05-05 20:20:16','2018-05-05 20:20:16'),
	(971480969,'A','国情的变化需要',12,'2018-05-06 00:23:34','2018-05-06 00:23:34'),
	(972332955,'A','辽沈战役',16,'2018-06-02 07:40:27','2018-06-02 07:40:27'),
	(974626259,'A','56个',6,'2018-05-05 14:46:48','2018-05-05 14:46:48'),
	(1018444943,'D','夫人',8,'2018-05-05 17:59:24','2018-05-05 17:59:24'),
	(1076731817,'C','饮食习惯',10,'2018-05-06 00:16:55','2018-05-06 00:16:55'),
	(1096461510,'A','这首诗从总体着眼描绘了钱塘湖蓬勃的春意。',9,'2018-05-05 20:20:16','2018-05-05 20:20:16'),
	(1205578659,'D','建立魏国',14,'2018-05-06 04:06:59','2018-05-06 04:06:59'),
	(1223392220,'B','世袭制的传统',11,'2018-05-06 00:17:53','2018-05-06 00:17:53'),
	(1224730695,'D','72个',6,'2018-05-05 14:46:48','2018-05-05 14:46:48'),
	(1335870028,'C','淮海战役',16,'2018-06-02 07:40:27','2018-06-02 07:40:27'),
	(1415498437,'A','50公里/小时',15,'2018-06-02 07:37:55','2018-06-02 07:37:55'),
	(1426229153,'C','分封制的义务',11,'2018-05-06 00:17:53','2018-05-06 00:17:53'),
	(1556864600,'A','孩子',8,'2018-05-05 17:59:24','2018-05-05 17:59:24'),
	(1610184119,'C','55个',6,'2018-05-05 14:46:48','2018-05-05 14:46:48'),
	(1638119720,'B','60公里/小时',15,'2018-06-02 07:37:55','2018-06-02 07:37:55'),
	(1751440500,'A','劳动工具',10,'2018-05-06 00:16:55','2018-05-06 00:16:55'),
	(1790325392,'D','张骞',13,'2018-05-06 04:06:16','2018-05-06 04:06:16'),
	(1855817685,'D','70公里/小时',15,'2018-06-02 07:37:55','2018-06-02 07:37:55'),
	(1867103226,'D','生产技术',10,'2018-05-06 00:16:55','2018-05-06 00:16:55'),
	(1880535603,'D','三大改造时期',17,'2018-06-02 07:41:09','2018-06-02 07:41:09'),
	(1920067479,'C','废汉称帝',14,'2018-05-06 04:06:59','2018-05-06 04:06:59'),
	(1961819592,'B','自然条件',10,'2018-05-06 00:16:55','2018-05-06 00:16:55'),
	(1963073218,'B','土地改革时期',17,'2018-06-02 07:41:09','2018-06-02 07:41:09'),
	(2009593673,'A','统一天下',14,'2018-05-06 04:06:59','2018-05-06 04:06:59'),
	(2020202906,'A','大跃进”时期',17,'2018-06-02 07:41:09','2018-06-02 07:41:09'),
	(2084776782,'B','农民战争的推动 ',12,'2018-05-06 00:23:34','2018-05-06 00:23:34'),
	(2119695669,'B','颔联、颈联写莺、燕、花、草四种最能体现春色的景物。',9,'2018-05-05 20:20:16','2018-05-05 20:20:16'),
	(2124554013,'C','诗人善于把握景物特征，运用最准确、最具有表现力的词语加以描绘和渲染。',9,'2018-05-05 20:20:16','2018-05-05 20:20:16');

/*!40000 ALTER TABLE `topic_option` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

# Host: localhost  (Version: 5.6.17)
# Date: 2016-01-05 16:23:01
# Generator: MySQL-Front 5.3  (Build 4.271)

/*!40101 SET NAMES gb2312 */;

#
# Structure for table "think_contact"
#

DROP TABLE IF EXISTS `think_contact`;
CREATE TABLE `think_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `letter` varchar(50) NOT NULL DEFAULT '' COMMENT '拼音',
  `company` varchar(30) NOT NULL DEFAULT '' COMMENT '公司',
  `dept` varchar(20) NOT NULL DEFAULT '' COMMENT '部门',
  `position` varchar(20) NOT NULL DEFAULT '' COMMENT '职位',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮件',
  `office_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '办公电话',
  `mobile_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '移动电话',
  `website` varchar(50) NOT NULL DEFAULT '' COMMENT '网站',
  `im` varchar(20) NOT NULL DEFAULT '' COMMENT '即时通讯',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `remark` text COMMENT '备注',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='think_user_info';

#
# Data for table "think_contact"
#

INSERT INTO `think_contact` VALUES (1,'test','TEST','','001','','3223323@qq.com','2222222','','','','',1,'',1),(2,'asd sad','ASDSAD','sad','sd','sad','sad@qqq.com','asdsad','asd','sad','asd','dsa',1,'asdsad',1),(3,'1','','','','1','111@qq.com','1','','','','',1,'',1);

#
# Structure for table "think_crm_activity"
#

DROP TABLE IF EXISTS `think_crm_activity`;
CREATE TABLE `think_crm_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_type` varchar(20) DEFAULT NULL COMMENT '信访类型',
  `content` text COMMENT '内容',
  `add_file` varchar(255) DEFAULT NULL COMMENT '附件',
  `contact_id` int(11) DEFAULT NULL COMMENT '联系人id',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `is_del` tinyint(3) DEFAULT '0' COMMENT '删除标记',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_crm_activity"
#


#
# Structure for table "think_crm_company"
#

DROP TABLE IF EXISTS `think_crm_company`;
CREATE TABLE `think_crm_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '公司名',
  `add_file` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '上传附件',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_name` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户名',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `udf_data` text CHARACTER SET utf8 COMMENT '扩展字段',
  `remark` text CHARACTER SET utf8 COMMENT '备注',
  `website` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '网站',
  `address` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '地址',
  `contacts` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '负责人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "think_crm_company"
#


#
# Structure for table "think_crm_contact"
#

DROP TABLE IF EXISTS `think_crm_contact`;
CREATE TABLE `think_crm_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `company_id` varchar(30) NOT NULL DEFAULT '' COMMENT '公司',
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名',
  `dept` varchar(20) NOT NULL DEFAULT '' COMMENT '部门',
  `position` varchar(20) NOT NULL DEFAULT '' COMMENT '职位',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮件',
  `office_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '办公电话',
  `mobile_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '移动电话',
  `im` varchar(20) NOT NULL DEFAULT '' COMMENT '即时通讯',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户名',
  `remark` text COMMENT '备注',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `udf_data` text COMMENT '扩展字段',
  `salesman_id` int(11) DEFAULT NULL COMMENT '业务员id',
  `salesman_name` varchar(20) DEFAULT '' COMMENT '业务员名',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `product` varchar(20) DEFAULT '' COMMENT '产品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_crm_contact"
#


#
# Structure for table "think_customer"
#

DROP TABLE IF EXISTS `think_customer`;
CREATE TABLE `think_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `letter` varchar(50) NOT NULL DEFAULT '' COMMENT '拼音',
  `biz_license` varchar(30) NOT NULL DEFAULT '' COMMENT '营业许可',
  `short` varchar(20) NOT NULL DEFAULT '' COMMENT '简称',
  `contact` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮件地址',
  `office_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '办公电话',
  `mobile_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '移动电话',
  `fax` varchar(20) NOT NULL DEFAULT '' COMMENT '传真',
  `salesman` varchar(50) NOT NULL DEFAULT '' COMMENT '业务员',
  `im` varchar(20) NOT NULL DEFAULT '' COMMENT '即时通讯',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `remark` text COMMENT '备注',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `payment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "think_customer"
#

INSERT INTO `think_customer` VALUES (1,'1','','1','','1','11@qq.com','1','','','','','',0,'1',1,'');

#
# Structure for table "think_demo"
#

DROP TABLE IF EXISTS `think_demo`;
CREATE TABLE `think_demo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "think_demo"
#

INSERT INTO `think_demo` VALUES (1,'name',1111);

#
# Structure for table "think_dept"
#

DROP TABLE IF EXISTS `think_dept`;
CREATE TABLE `think_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `dept_no` varchar(20) NOT NULL DEFAULT '' COMMENT '部门编号',
  `dept_grade_id` int(11) NOT NULL DEFAULT '0' COMMENT '部门等级ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `short` varchar(20) NOT NULL DEFAULT '' COMMENT '简称',
  `sort` varchar(20) NOT NULL DEFAULT '' COMMENT '排序',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

#
# Data for table "think_dept"
#

INSERT INTO `think_dept` VALUES (1,0,'A2',18,'小微企业','小微','','',0),(2,1,'YYB',18,'运营部','运营','5','',0),(3,1,'XXB',18,'IT部','IT','4','',0),(5,1,'ZJB',18,'总经办','总经','1','',0),(6,1,'GLB',18,'管理部','管理','2','',0),(7,1,'XSB',18,'销售部','销售','3','',0),(8,1,'CWB',18,'财务部','财务','2','',0),(21,1,'XSB',18,'采购部','采购','3','',0),(23,6,'HR',16,'人事科','人事','','',0),(24,6,'ZWK',16,'总务科','总务','','',0),(25,8,'KJK',16,'会计科','会计','','',0),(26,8,'JRK',16,'金融科','金融','','',0),(27,1,'',0,'测试部门','测试部门','123','',0);

#
# Structure for table "think_dept_grade"
#

DROP TABLE IF EXISTS `think_dept_grade`;
CREATE TABLE `think_dept_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_no` varchar(10) NOT NULL DEFAULT '' COMMENT '部门级别编码',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` varchar(10) NOT NULL DEFAULT '' COMMENT '排序',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

#
# Data for table "think_dept_grade"
#

INSERT INTO `think_dept_grade` VALUES (16,'DG1','科','1',0),(18,'DG2','部','2',0);

#
# Structure for table "think_doc"
#

DROP TABLE IF EXISTS `think_doc`;
CREATE TABLE `think_doc` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(20) NOT NULL DEFAULT '' COMMENT '文档编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `content` text NOT NULL COMMENT '内容',
  `folder` int(11) NOT NULL DEFAULT '0' COMMENT '文件夹',
  `add_file` varchar(200) NOT NULL DEFAULT '' COMMENT '附件',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名称',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "think_doc"
#

INSERT INTO `think_doc` VALUES (1,'2015-0001','das','<p>dsa</p>',85,'',1,'管理员',1451371550,0,1),(2,'2015-0002','qwe','<p>请问</p>',85,'',1,'管理员',1451371967,0,1);

#
# Structure for table "think_duty"
#

DROP TABLE IF EXISTS `think_duty`;
CREATE TABLE `think_duty` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `duty_no` varchar(20) NOT NULL DEFAULT '' COMMENT '职责编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` varchar(20) NOT NULL DEFAULT '' COMMENT '排序',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# Data for table "think_duty"
#

INSERT INTO `think_duty` VALUES (14,'P001','普通员工','',0,''),(15,'S001','财务','',0,''),(16,'W001','人事','',0,'');

#
# Structure for table "think_file"
#

DROP TABLE IF EXISTS `think_file`;
CREATE TABLE `think_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8 COMMENT='文件表';

#
# Data for table "think_file"
#

INSERT INTO `think_file` VALUES (238,'小薇OAlogo确定稿(CS6版本)1-01.jpg','563ad55d15442.jpg','govdoc/2015-11/','jpg','',212600,'263336f2505b5c6be6e744d6208afa1b','57408d75d13f2b5854cd2a3580c34f383b482f61',0,'',1446696284),(239,'corel.png','567cfcce2f57d.png','task/2015-12/','png','image/png',10581,'13611624e466155c492a23b97d6be76b','85d5f9947ef18701e6b3a432ca6a9f7828659bc3',0,'',1451031757),(240,'paint.png','567cfcee153b5.png','task/2015-12/','png','image/png',7023,'05730ee494da5e9bc3636370d4538567','bf705f7468a070a1115374b80e0707cd86872a36',0,'',1451031789),(241,'fallout.png','567cfd3407580.png','task/2015-12/','png','image/png',5366,'45cda10c71ece33e0524a7732ccf4109','bd33e9d68ca294ce9050786b3d2d25ec762cb8be',0,'',1451031859),(242,'clock.png','567cfd4ada984.png','task/2015-12/','png','image/png',9740,'c137932b12e39466fd05b71e9a7c583a','64c43cb2e2914dd08e6007290a15efc824904456',0,'',1451031882),(243,'user.xls','567cff0b21291.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',30208,'721be5983e81b5496125ce2f6eae389e','97cd12abf0c0be5e930fa7065c55b85df1b4fb3b',0,'',1451032330),(244,'user.xls','567cff85f2654.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',30208,'721be5983e81b5496125ce2f6eae389e','97cd12abf0c0be5e930fa7065c55b85df1b4fb3b',0,'',1451032453),(245,'paint.png','567cffeb8706e.png','form/2015-12/','png','image/png',7023,'05730ee494da5e9bc3636370d4538567','bf705f7468a070a1115374b80e0707cd86872a36',0,'',1451032555),(246,'network-places.png','567cfffa4dad4.png','form/2015-12/','png','image/png',12650,'0a91632b22c36fabfa5920a43a176882','b31bdbafc1d2f8e55d4533e2948a850f380a83fb',0,'',1451032569),(247,'user.xls','567cfff4dcc04.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',30208,'721be5983e81b5496125ce2f6eae389e','97cd12abf0c0be5e930fa7065c55b85df1b4fb3b',0,'',1451032564),(248,'network-places.png','567d004f30304.png','form/2015-12/','png','image/png',12650,'0a91632b22c36fabfa5920a43a176882','b31bdbafc1d2f8e55d4533e2948a850f380a83fb',0,'',1451032654),(249,'user.xls','567d03e5a929f.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'b3b3555bda116c66a13a2704cf03fe85','a17fa9ebfd1ebe1891aac97fdea44530e1e57ba5',0,'',1451033573),(250,'演示文稿1.pptx','567d07475caeb.pptx','task/2015-12/','pptx','',3037329,'435c26f98d1d8a950095c75bd53f116c','a72ed138882545c1ec567ff7b99901e6571d597d',0,'',1451034439),(251,'user - 副本.xls','567d0755655ec.xls','crmcontact/2015-12/','xls','application/vnd.ms-office',11264,'48f6a7e2661463d158711c9427b3ed66','2658e0a8b840c35b4eea130bfdad3fd135c62acc',0,'',1451034453),(252,'演示文稿1.pptx','567d076f1f31a.pptx','task/2015-12/','pptx','',3037329,'435c26f98d1d8a950095c75bd53f116c','a72ed138882545c1ec567ff7b99901e6571d597d',0,'',1451034478),(253,'新建 Microsoft Excel 工作表.xls','567d07d9cb512.xls','crmcontact/2015-12/','xls','application/vnd.ms-office',7680,'4f14e65872b0fb5660a3a43cb309ffca','427c624e4ff2d9f89337a6055759c83f6a00bbb7',0,'',1451034585),(254,'演示文稿1.pptx','567d08e1ee22c.pptx','task/2015-12/','pptx','',3037329,'435c26f98d1d8a950095c75bd53f116c','a72ed138882545c1ec567ff7b99901e6571d597d',0,'',1451034849),(255,'演示文稿1.pptx','567d0a9c3480f.pptx','form/2015-12/','pptx','',3037329,'435c26f98d1d8a950095c75bd53f116c','a72ed138882545c1ec567ff7b99901e6571d597d',0,'',1451035291),(256,'演示文稿1.pptx','567d0ac17705d.pptx','form/2015-12/','pptx','',3037329,'435c26f98d1d8a950095c75bd53f116c','a72ed138882545c1ec567ff7b99901e6571d597d',0,'',1451035329),(257,'user.xls','5680e9932a2d8.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451288978),(258,'user.xls','5680e9b1e9c51.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451289009),(259,'user.xls','5680e9e3cde6e.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451289059),(260,'user.xls','5680e9ecdd2a5.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451289068),(261,'user.xls','5680e9f403fab.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451289075),(262,'user.xls','5680ea0d1a8bf.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451289100),(263,'user.xls','5680eb08c02ba.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451289352),(264,'user.xls','5680eb19c4507.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451289369),(265,'user.xls','5681f0fb19f8a.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451356410),(266,'user - 副本.xls','5681f11a9dc26.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11264,'48f6a7e2661463d158711c9427b3ed66','2658e0a8b840c35b4eea130bfdad3fd135c62acc',0,'',1451356442),(267,'user - 副本.xls','5681f18e6c59d.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11264,'48f6a7e2661463d158711c9427b3ed66','2658e0a8b840c35b4eea130bfdad3fd135c62acc',0,'',1451356558),(268,'user.xls','5681f1988c799.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451356568),(269,'user.xls','5681f1ed1412a.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451356652),(270,'user.xls','5681f20096b78.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451356672),(271,'user.xls','5681f20ec5ca4.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451356686),(272,'user.xls','5681f227cb05b.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451356711),(273,'user.xls','5681f43543898.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451357237),(274,'user.xls','5681f81b22d73.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451358234),(275,'user.xls','5681f85710257.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451358294),(276,'user.xls','56820665f16ae.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451361888),(277,'user.xls','5682067b4d2a2.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451361914),(278,'user.xls','568206e63b206.xls','crmcontact/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451362022),(279,'user.xls','568206f8855b4.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451362040),(280,'user.xls','5682072fba9e3.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'be0a437f9934d662f0f86eefaa199bf5','ccdbf6c2af905b0a0931ebf4b667fd7e4d6013be',0,'',1451362095),(281,'user.xls','56820a64792ca.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'be0a437f9934d662f0f86eefaa199bf5','ccdbf6c2af905b0a0931ebf4b667fd7e4d6013be',0,'',1451362916);

#
# Structure for table "think_finance"
#

DROP TABLE IF EXISTS `think_finance`;
CREATE TABLE `think_finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(10) DEFAULT NULL COMMENT '单据编号',
  `remark` varchar(255) DEFAULT NULL,
  `input_date` date DEFAULT NULL COMMENT '录入日期',
  `account_id` int(11) DEFAULT NULL COMMENT '帐号ID',
  `account_name` varchar(20) DEFAULT NULL COMMENT '帐号名',
  `income` int(11) DEFAULT NULL COMMENT '收入',
  `payment` int(11) DEFAULT NULL COMMENT '支出',
  `amount` int(11) DEFAULT NULL COMMENT '合计',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `partner` varchar(50) DEFAULT NULL COMMENT '来往处',
  `actor_name` varchar(10) DEFAULT NULL COMMENT '经办人',
  `user_id` int(11) DEFAULT NULL COMMENT '登陆人',
  `user_name` varchar(10) DEFAULT NULL COMMENT '登录名',
  `create_time` int(11) DEFAULT NULL COMMENT '创建日期',
  `update_time` int(11) DEFAULT NULL COMMENT '更新日期',
  `add_file` varchar(255) DEFAULT NULL COMMENT '附件',
  `doc_type` tinyint(3) DEFAULT NULL COMMENT '类型',
  `is_del` tinyint(3) DEFAULT '0' COMMENT '删除标记',
  `related_account_id` int(11) DEFAULT NULL COMMENT '相关帐号ID',
  `related_account_name` varchar(20) DEFAULT NULL COMMENT '相关帐号名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_finance"
#


#
# Structure for table "think_finance_account"
#

DROP TABLE IF EXISTS `think_finance_account`;
CREATE TABLE `think_finance_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '帐号名称',
  `bank` varchar(20) DEFAULT NULL COMMENT '银行',
  `no` varchar(50) DEFAULT NULL COMMENT '银行帐号',
  `init` int(11) DEFAULT NULL COMMENT '初始帐号',
  `balance` int(11) DEFAULT NULL COMMENT '余额',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `is_del` tinyint(3) DEFAULT '0' COMMENT '删除标记',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_finance_account"
#


#
# Structure for table "think_flow"
#

DROP TABLE IF EXISTS `think_flow`;
CREATE TABLE `think_flow` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(20) NOT NULL DEFAULT '' COMMENT '文档编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `content` text COMMENT '内容',
  `confirm` varchar(200) NOT NULL DEFAULT '' COMMENT '裁决数据',
  `confirm_name` text NOT NULL COMMENT '裁决显示内容',
  `consult` varchar(200) NOT NULL DEFAULT '' COMMENT '协商数据',
  `consult_name` text NOT NULL COMMENT '协商显示内容',
  `refer` varchar(200) DEFAULT '' COMMENT '抄送数据',
  `refer_name` text COMMENT '抄送显示内容',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '流程类型',
  `add_file` varchar(200) NOT NULL DEFAULT '' COMMENT '附件',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `emp_no` varchar(20) DEFAULT NULL COMMENT '员工编号',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名称',
  `dept_id` int(11) NOT NULL DEFAULT '0' COMMENT '部门ID',
  `dept_name` varchar(20) NOT NULL DEFAULT '' COMMENT '部门名称',
  `create_date` varchar(10) NOT NULL DEFAULT '' COMMENT '创建日期',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `step` int(11) NOT NULL DEFAULT '0' COMMENT '目前阶段状态',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `udf_data` text COMMENT '用户自定义数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_flow"
#


#
# Structure for table "think_flow_log"
#

DROP TABLE IF EXISTS `think_flow_log`;
CREATE TABLE `think_flow_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` int(11) NOT NULL DEFAULT '0' COMMENT '流程ID',
  `emp_no` varchar(20) NOT NULL DEFAULT '' COMMENT '员工编号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(20) DEFAULT '' COMMENT '用户名称',
  `step` int(11) NOT NULL DEFAULT '0' COMMENT '当前步骤',
  `result` int(11) DEFAULT NULL COMMENT '审批结果',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `comment` text COMMENT '意见',
  `is_read` tinyint(3) NOT NULL DEFAULT '0' COMMENT '已读',
  `from` varchar(20) DEFAULT NULL COMMENT '传阅人',
  `is_del` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_flow_log"
#


#
# Structure for table "think_flow_type"
#

DROP TABLE IF EXISTS `think_flow_type`;
CREATE TABLE `think_flow_type` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(20) NOT NULL DEFAULT '' COMMENT '分组',
  `doc_no_format` varchar(50) NOT NULL DEFAULT '' COMMENT '文档编码格式',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `short` varchar(20) NOT NULL DEFAULT '' COMMENT '简称',
  `content` text NOT NULL COMMENT '内容',
  `confirm` varchar(100) NOT NULL DEFAULT '' COMMENT '裁决数据',
  `confirm_name` text NOT NULL COMMENT '裁决显示内容',
  `consult` varchar(100) NOT NULL DEFAULT '' COMMENT '协商数据',
  `consult_name` text NOT NULL COMMENT '协商显示内容',
  `refer` varchar(100) NOT NULL DEFAULT '' COMMENT '抄送数据',
  `refer_name` text NOT NULL COMMENT '抄送显示内容',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_edit` tinyint(3) NOT NULL DEFAULT '0' COMMENT '可编辑标记',
  `is_lock` tinyint(3) NOT NULL DEFAULT '0' COMMENT '锁定标记',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `request_duty` int(11) DEFAULT NULL COMMENT '申请权限',
  `report_duty` int(11) DEFAULT NULL COMMENT '报告权限',
  `udf_tpl` varchar(20) DEFAULT NULL,
  `is_show` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

#
# Data for table "think_flow_type"
#

INSERT INTO `think_flow_type` VALUES (19,'72','{YYYY}-{M}-{D}','招待费用报销单','招待','<table border=\"1\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t姓????名\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t职务\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待事由\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"9\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td rowspan=\"11\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t附件\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t张\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t部???门\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"10\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待对象\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待人数\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t客人???人，陪同???人\r\n\t\t\t\t</p>%0','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1391698060,1432191286,1,1,0,0,14,14,NULL,NULL),(33,'69','{YYYY}-{M}-{D}','离职申请单','LZ','<p>\r\n\t<br />\r\n</p>','dp_23_2|dp_6_4|dp_23_1|dp_1_5|dp_24_2|','<span id=\"dp_23_2\" data=\"dp_23_2\"><nobr><b title=\"人事科-经理\">人事科-经理</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span id=\"dp_6_4\" data=\"dp_6_4\"><nobr><b title=\"管理部-副总\">管理部-副总</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span id=\"dp_23_1\" data=\"dp_23_1\"><nobr><b title=\"人事科-主管\">人事科-主管</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span id=\"dp_1_5\" data=\"dp_1_5\"><nobr><b title=\"小微企业-总经理\">小微企业-总经理</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span id=\"dp_24_2\" data=\"dp_24_2\"><nobr><b title=\"总务科-经理\">总务科-经理</b></nobr></span>','','','','',1399709992,1435896413,0,0,1,0,14,16,'',1),(34,'82','{YYYY}-{M}-{D}','个人请假单','QJ','请假申请样式','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1401288825,1428632816,1,10,1,0,14,14,NULL,NULL),(35,'82','{YYYY}-{M}-{D}','调薪申请单','TX','<p>\r\n\t调薪理由\r\n</p>','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1408251287,1428633864,3,10,0,0,15,14,NULL,NULL),(36,'82','{YYYY}-{M}-{D}','外出申请','WC','<p>\r\n\t外出申请目的：\r\n</p>\r\n<p>\r\n\t外出申请事由：\r\n</p>','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1412777631,1428641269,2,11,0,0,14,14,NULL,NULL),(37,'69','20150312601','系统变更申请','运营维护部','好好使用xxxxxxxxxxxxxx?','emp_1002|emp_1001|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"李白/副总<>\">李白/副总&lt;&gt;</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"总经理1001/总经理<>\">总经理1001/总经理&lt;&gt;</b></nobr></span>','','','','',1426127753,1432707586,0,1,0,0,14,14,'',1),(38,'82','{YYYY}-{M}-{D}','离职申请单','离职','离职','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1427940431,1428633879,4,11,0,0,14,14,NULL,NULL),(39,'71','{YYYY}-{M}-{D}','原材料采购申请单','采购','采购申请单','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1427942142,1430806363,1,1,0,0,14,14,NULL,NULL),(40,'88','{YYYY}-{M}-{D}','个人请假单','个人请假单','巅峰时代','','','','','','',1428649355,1430715743,1,1,0,0,20,17,NULL,NULL),(41,'88','{YYYY}-{M}-{D}','出差申请','差旅','出差申请','','','','','','',1430201444,1430709554,2,1,0,0,20,18,NULL,NULL),(42,'70','{YYYY}-{M}-{D}','办公用品申请','办公用品','办公用品申请','','','','','','',1430202319,1432191240,3,1,0,0,14,14,NULL,NULL),(43,'80','{YYYY}-{M}-{D}','轿车使用申请','轿车','轿车使用申请','','','','','','',1430203160,1432191262,0,1,0,0,14,14,NULL,NULL),(44,'88','{YYYY}-{M}-{D}','离职申请单','离职申请','<p>\r\n\t<br />\r\n</p>','dgp_16_2|dgp_18_8|','<span id=\"dgp_16_2\" data=\"dgp_16_2\"><nobr><b title=\"科-经理\">科-经理</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span id=\"dgp_18_8\" data=\"dgp_18_8\"><nobr><b title=\"部-部长\">部-部长</b></nobr></span>','emp_2001|','<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"张三/部长<>\">张三/部长&lt;&gt;</b></nobr></span>','','',1430285006,1430707786,4,1,1,0,20,17,NULL,NULL),(45,'72','{YYYY}-{M}-{D}','差旅费用报销申请','差旅报销','出差费用报销申请','','','','','','',1430286645,1432191277,2,1,0,0,14,14,NULL,NULL),(46,'70','{YYYY}-{M}-{D}','通讯费用报销申请','通讯费报销','通讯费用报销','','','','','','',1430286713,1432191250,4,1,0,0,14,14,NULL,NULL),(47,'70','{YYYY}-{M}-{D}','交通费用报销申请','交通费报销','交通费用报销申请','','','','','','',1430286784,1432191325,5,11,0,0,14,14,NULL,NULL),(48,'70','{YYYY}-{M}-{D}','餐费报销申请','餐费报销','餐费报销申请','','','','','','',1430286877,1432191310,6,1,0,0,14,14,NULL,NULL),(49,'70','{YYYY}-{M}-{D}','会议室使用申请','会议室使用申请','会议室使用申请单','','','','','','',1430286961,1432191227,2,1,0,0,14,14,NULL,NULL),(50,'70','{YYYY}-{M}-{D}','机票预订申请','机票预订申请','机票预订申请','','','','','','',1430287073,1432191212,1,1,0,0,14,14,NULL,NULL),(51,'71','{YYYY}-{M}-{D}','设备采购申请','设备采购','设备采购申请单','','','','','','',1430287359,1430795702,3,1,0,0,14,17,NULL,NULL),(52,'71','{YYYY}-{M}-{D}','辅助材料采购申请单','辅材申请','辅材采购申请单','','','','','','',1430287428,1430804969,2,1,0,0,14,17,NULL,NULL),(53,'71','{YYYY}-{M}-{D}','辅助设备采购申请','设备零件采购申请','辅助设备采购申请','','','','','','',1430287546,1430795115,4,1,0,0,14,17,NULL,NULL),(54,'88','{YYYY}-{M}-{D}','员工培训/教育申请','培训申请','员工培训教育申请','','','','','','',1430288450,1430708546,3,1,0,0,18,17,NULL,NULL),(55,'72','{YYYY}-{M}-{D}','年度预算申请','年度预算申请','年度预算申请','','','','','','',1430289142,1432191269,3,1,0,0,14,14,NULL,NULL),(56,'71','{DEPT}{####}','物料申请单','物料申请单','2','dgp_16_2|dgp_18_3|','<span data=\"dgp_16_2\" id=\"dgp_16_2\"><nobr><b title=\"科-经理\">科-经理</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"dgp_18_3\" id=\"dgp_18_3\"><nobr><b title=\"部-总监\">部-总监</b></nobr></span>','dp_21_2|dp_21_3|','<span data=\"dp_21_2\" id=\"dp_21_2\"><nobr><b title=\"采购部-经理\">采购部-经理</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"dp_21_3\" id=\"dp_21_3\"><nobr><b title=\"采购部-总监\">采购部-总监</b></nobr></span>','','',1439969612,1439970190,0,0,0,0,14,14,'',0),(57,'72','####','测试','测试','<p>你好</p>','dept_7|emp_2|emp_3|emp_1|','<span data=\"dept_7\" id=\"dept_7\"><nobr><b title=\"销售部\">销售部</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"emp_2\" id=\"emp_2\"><nobr><b title=\"2/副总<>\">2/副总&lt;&gt;</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"emp_3\" id=\"emp_3\"><nobr><b title=\"3/总监<>\">3/总监&lt;&gt;</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"emp_1\" id=\"emp_1\"><nobr><b title=\"1/总经理<123>\">1/总经理&lt;123&gt;</b></nobr><b><i class=\"fa\"></i></b></span>','dp_7_5|emp_5|','<span data=\"dp_7_5\" id=\"dp_7_5\"><nobr><b title=\"销售部-总经理\">销售部-总经理</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"emp_5\" id=\"emp_5\"><nobr><b title=\"5/副总<>\">5/副总&lt;&gt;</b></nobr><b><i class=\"fa\"></i></b></span>','','',1451281563,1451284501,0,0,1,0,14,14,'',1);

#
# Structure for table "think_form"
#

DROP TABLE IF EXISTS `think_form`;
CREATE TABLE `think_form` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(20) NOT NULL DEFAULT '' COMMENT '文档编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `content` text NOT NULL COMMENT '内容',
  `folder` int(11) NOT NULL DEFAULT '0' COMMENT '文件夹',
  `add_file` varchar(200) NOT NULL DEFAULT '' COMMENT '附件',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名称',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `udf_data` text COMMENT '自定义字段数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_form"
#


#
# Structure for table "think_gov_doc"
#

DROP TABLE IF EXISTS `think_gov_doc`;
CREATE TABLE `think_gov_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `doc_no` varchar(50) DEFAULT NULL COMMENT '文件编号',
  `doc_type` tinyint(3) DEFAULT '0' COMMENT '文档类型(0:一般文件，1：普通文件)',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `add_file` varchar(255) DEFAULT NULL COMMENT '附件',
  `suggestion` text COMMENT '意见*',
  `finish_time` int(11) DEFAULT NULL COMMENT '完成时间',
  `is_save` tinyint(3) DEFAULT '0' COMMENT '保存',
  `is_agent` tinyint(3) DEFAULT '0' COMMENT '代执',
  `is_read` tinyint(3) DEFAULT '0' COMMENT '审阅(文电管理用到)',
  `is_over` tinyint(3) DEFAULT '0' COMMENT '完成',
  `is_del` tinyint(3) DEFAULT '0' COMMENT '删除',
  `issuer` varchar(50) DEFAULT NULL COMMENT '发布人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_gov_doc"
#


#
# Structure for table "think_gov_doc_auth"
#

DROP TABLE IF EXISTS `think_gov_doc_auth`;
CREATE TABLE `think_gov_doc_auth` (
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `set_auth` varchar(50) DEFAULT NULL COMMENT '权限设置'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_gov_doc_auth"
#


#
# Structure for table "think_gov_doc_log"
#

DROP TABLE IF EXISTS `think_gov_doc_log`;
CREATE TABLE `think_gov_doc_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gov_doc_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '接收人的用户id',
  `type` tinyint(3) DEFAULT '0' COMMENT '类别',
  `remarks` text COMMENT '批语',
  `state` tinyint(3) DEFAULT '0' COMMENT '批示',
  `pishiren_id` int(11) DEFAULT NULL COMMENT '批示人id',
  `pishiren_qianming` varchar(50) DEFAULT NULL COMMENT '批示人签名',
  `shenpi_time` int(11) DEFAULT NULL COMMENT '审批时间',
  `is_first` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_gov_doc_log"
#


#
# Structure for table "think_group"
#

DROP TABLE IF EXISTS `think_group`;
CREATE TABLE `think_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `is_public` tinyint(3) DEFAULT NULL COMMENT '是否公开',
  `remark` text COMMENT '备注',
  `user_id` int(11) DEFAULT NULL COMMENT '登陆人ID',
  `user_name` varchar(20) DEFAULT NULL COMMENT '登录用户名称',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `sort` varchar(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_group"
#


#
# Structure for table "think_group_user"
#

DROP TABLE IF EXISTS `think_group_user`;
CREATE TABLE `think_group_user` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_group_user"
#


#
# Structure for table "think_info"
#

DROP TABLE IF EXISTS `think_info`;
CREATE TABLE `think_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(20) NOT NULL DEFAULT '' COMMENT '文档编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `content` text NOT NULL COMMENT '内容',
  `folder` int(11) NOT NULL DEFAULT '0' COMMENT '分类',
  `is_sign` tinyint(3) DEFAULT '0' COMMENT '是否需要签收',
  `is_public` tinyint(3) DEFAULT NULL COMMENT '是否公开',
  `scope_user_id` text COMMENT '发布范围ID',
  `scope_user_name` text COMMENT '发布范围名称',
  `add_file` varchar(200) NOT NULL DEFAULT '' COMMENT '附件',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '登陆人ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '登陆人名称',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `dept_name` varchar(20) DEFAULT NULL COMMENT '部门名称',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_info"
#


#
# Structure for table "think_info_scope"
#

DROP TABLE IF EXISTS `think_info_scope`;
CREATE TABLE `think_info_scope` (
  `info_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `info_id` (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_info_scope"
#


#
# Structure for table "think_info_sign"
#

DROP TABLE IF EXISTS `think_info_sign`;
CREATE TABLE `think_info_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_id` int(11) NOT NULL DEFAULT '0' COMMENT '信息ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '登录用户ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '登录用户名称',
  `is_sign` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否签收',
  `sign_time` int(11) unsigned DEFAULT NULL COMMENT '签收时间',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `dept_name` varchar(20) DEFAULT NULL COMMENT '部门名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_info_sign"
#


#
# Structure for table "think_mail"
#

DROP TABLE IF EXISTS `think_mail`;
CREATE TABLE `think_mail` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `folder` int(11) NOT NULL DEFAULT '0' COMMENT '文件夹',
  `mid` varchar(200) DEFAULT NULL COMMENT '邮件唯一id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `content` text NOT NULL COMMENT '内容',
  `add_file` varchar(200) DEFAULT NULL COMMENT '附件',
  `from` varchar(255) DEFAULT NULL COMMENT '发件人',
  `to` varchar(255) DEFAULT NULL COMMENT '收件人',
  `reply_to` varchar(255) DEFAULT NULL COMMENT '回复到',
  `cc` varchar(255) DEFAULT NULL COMMENT '抄送',
  `read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '已读',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名称',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_mail"
#


#
# Structure for table "think_mail_account"
#

DROP TABLE IF EXISTS `think_mail_account`;
CREATE TABLE `think_mail_account` (
  `id` mediumint(6) NOT NULL,
  `email` varchar(50) DEFAULT NULL COMMENT '邮件地址',
  `mail_name` varchar(50) NOT NULL DEFAULT '' COMMENT '邮件显示名称',
  `pop3svr` varchar(50) NOT NULL DEFAULT '' COMMENT 'pop服务器',
  `smtpsvr` varchar(50) NOT NULL DEFAULT '' COMMENT 'smtp服务器',
  `mail_id` varchar(50) NOT NULL DEFAULT '' COMMENT '邮件ID',
  `mail_pwd` varchar(50) NOT NULL DEFAULT '' COMMENT '邮件密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='think_user_info';

#
# Data for table "think_mail_account"
#

INSERT INTO `think_mail_account` VALUES (1,'gdsresrere','uut','tyftyry','drtrdt','admin','admin');

#
# Structure for table "think_mail_organize"
#

DROP TABLE IF EXISTS `think_mail_organize`;
CREATE TABLE `think_mail_organize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `sender_check` int(11) NOT NULL DEFAULT '0' COMMENT '是否确认发件人',
  `sender_option` int(11) NOT NULL DEFAULT '0' COMMENT '发件人选项',
  `sender_key` varchar(50) NOT NULL DEFAULT '' COMMENT '确认发件人值',
  `domain_check` int(11) NOT NULL DEFAULT '0' COMMENT '是否确认域名',
  `domain_option` int(11) NOT NULL DEFAULT '0' COMMENT '域名选项',
  `domain_key` varchar(50) NOT NULL DEFAULT '' COMMENT '确认域名值',
  `recever_check` int(11) NOT NULL DEFAULT '0' COMMENT '是否确认收件人',
  `recever_option` int(11) NOT NULL DEFAULT '0' COMMENT '收件人选项',
  `recever_key` varchar(50) NOT NULL DEFAULT '' COMMENT '确认收信人值',
  `title_check` int(11) NOT NULL DEFAULT '0' COMMENT '是否确认标题',
  `title_option` int(11) NOT NULL DEFAULT '0' COMMENT '确认标题选项',
  `title_key` varchar(50) NOT NULL DEFAULT '' COMMENT '确认标题值',
  `to` int(11) NOT NULL DEFAULT '0' COMMENT '移动到',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_mail_organize"
#


#
# Structure for table "think_message"
#

DROP TABLE IF EXISTS `think_message`;
CREATE TABLE `think_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COMMENT '内容',
  `add_file` varchar(200) DEFAULT NULL COMMENT '附件',
  `sender_id` int(11) DEFAULT NULL COMMENT '发送人',
  `sender_name` varchar(20) DEFAULT NULL COMMENT '发送人名称',
  `receiver_id` int(11) DEFAULT NULL COMMENT '接收人',
  `receiver_name` varchar(20) DEFAULT NULL COMMENT '接收人名称',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `owner_id` int(11) DEFAULT NULL COMMENT '拥有者',
  `is_del` tinyint(3) DEFAULT '0' COMMENT '删除标记',
  `is_read` tinyint(3) DEFAULT '0' COMMENT '是否已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_message"
#


#
# Structure for table "think_node"
#

DROP TABLE IF EXISTS `think_node`;
CREATE TABLE `think_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT 'URL地址',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `sub_folder` varchar(20) DEFAULT NULL COMMENT '子文件夹',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` varchar(20) DEFAULT NULL COMMENT '排序',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `badge_function` varchar(50) DEFAULT NULL COMMENT '统计函数',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`is_del`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8;

#
# Data for table "think_node"
#

INSERT INTO `think_node` VALUES (84,'管理','System/index','fa fa-cogs','','','999',0,0,''),(85,'邮件','Mail/index','fa fa-envelope-o bc-mail','','','11',0,0,'badge_sum'),(87,'审批','Flow/index','fa fa-pencil bc-flow','','','2',0,0,'badge_sum'),(88,'信息','Info/index##','fa fa-file-o','InfoFolder','','4',0,0,'badge_sum'),(91,'日程','Schedule/index','fa fa-calendar bc-personal-schedule','','','9',198,0,'badge_count_schedule'),(94,'职位','Position/index',NULL,NULL,'','',1,0,NULL),(100,'写信','Mail/add',NULL,'','','1',85,0,NULL),(101,'收件箱','Mail/folder?fid=inbox','bc-mail-inbox','','','3',85,0,'badge_count_mail_inbox'),(102,'邮件设置','',NULL,NULL,NULL,'9',85,0,NULL),(104,'垃圾箱','Mail/folder?fid=spambox','','','','5',85,0,NULL),(105,'发件箱','Mail/folder?fid=outbox','','','','6',85,0,NULL),(106,'已删除','Mail/folder?fid=delbox','','','','4',85,0,NULL),(107,'草稿箱','Mail/folder?fid=darftbox','','','','7',85,0,NULL),(108,'邮件帐户设置','MailAccount/index',NULL,'','','1',102,0,NULL),(110,'公司信息管理','',NULL,NULL,'','1',84,0,NULL),(112,'权限管理','',NULL,NULL,'','3',84,0,NULL),(113,'系统设定','',NULL,NULL,'','4',84,0,NULL),(114,'系统参数设置','SystemConfig/index','','','','2',113,0,''),(115,'组织图','Dept/index','','','','1',110,0,NULL),(116,'员工登记','User/index',NULL,'','','5',110,0,NULL),(118,'权限组管理','Role/index','','','','1',112,0,NULL),(119,'权限设置','Role/node','','','','2',112,0,NULL),(120,'权限分配','Role/user','','','','3',112,0,NULL),(121,'菜单管理','Node/index','','','','1',113,0,NULL),(123,'职位','Position/index',NULL,'','','2',110,0,NULL),(124,'文件夹设置','Mail/folder_manage','','','','2',102,0,''),(125,'联系人','Contact/index','','','','1',198,0,NULL),(126,'信息搜索','Info/index','','','','1',88,0,NULL),(143,'邮件分类','MailOrganize/index',NULL,'','','',102,0,NULL),(144,'发起','Flow/index','','','','1',87,0,NULL),(146,'流程管理','FlowType/index','','','','9',87,0,NULL),(147,'待审批','Flow/folder?fid=confirm','bc-flow-confirm','','','4',87,0,'badge_count_flow_todo'),(148,'已审批','Flow/folder?fid=finish','','','','5',87,0,''),(149,'草稿箱','Flow/folder?fid=darft','','','','2',87,0,''),(150,'已提交','Flow/folder?fid=submit','','','','3',87,0,''),(152,'待办','Todo/index','fa fa-tasks bc-personal-todo','','','9',198,0,'badge_count_todo'),(153,'部门级别','DeptGrade/index','','','','4',110,0,NULL),(156,'客户','Customer/index',NULL,'','','2',157,0,NULL),(157,'通讯录','Staff/index','fa fa-group','','','7',0,0,'badge_sum'),(158,'供应商','Supplier/index',NULL,'','','3',157,0,NULL),(169,'职员','Staff/index',NULL,'','','',157,0,NULL),(177,'我的文件夹','##mail','bc-mail-myfolder','MailFolder','','8',85,0,'badge_count_mail_user_folder'),(184,'流程分组','FlowType/tag_manage','','','','8',87,0,NULL),(185,'审批报告','Flow/folder?fid=report','bc-flow-receive','','','6',87,0,''),(189,'信息分类','Info/folder_manage','','','','C1',88,0,''),(190,'消息','Message/index','fa fa-inbox bc-message','','','1',198,0,'badge_count_message'),(191,'用户设置','','','','','99',198,0,''),(192,'用户资料','Profile/index','','','','',191,0,NULL),(193,'修改密码','Profile/password','','','','',191,0,NULL),(194,'用户设置','UserConfig/index','','','','999',191,0,NULL),(198,'个人','Contact/index','fa fa-user bc-personal','','','9',0,0,'badge_sum'),(205,'业务角色管理','Duty/index','','','','4',112,0,''),(206,'业务权限分配','Role/duty','','','','5',112,0,''),(214,'记账','Finance/index','fa fa-jpy','','','3',217,0,''),(216,'日报','WorkLog/index','fa fa-book','','','1',217,0,''),(217,'工作','WorkLog/index','fa fa-book','','','6',0,0,'badge_sum'),(219,'我的信息','Info/my_info','','','','B1',88,0,NULL),(220,'我的签收','Info/my_sign','','','','B2',88,0,NULL),(221,'文档','Doc/index##','fa fa-inbox','DocFolder','','41',0,0,'badge_sum'),(222,'文档管理','Doc/folder_manage','fa fa-inbox','','','4',221,0,'badge_sum'),(226,'报表','Form/index##','fa fa-table','FormFolder','','5',0,0,'badge_sum'),(227,'报表管理','Form/folder_manage','fa fa-inbox','','','4',226,0,'badge_sum'),(228,'报表字段类型','Form/field_type','fa fa-inbox','','','5',226,0,'badge_sum'),(229,'群组','Group/index','fa fa-group','','','7',157,0,'badge_sum'),(230,'考勤查看','Sign/index','fa fa-book','','','4',235,0,'badge_sum'),(231,'考勤统计','Sign/report','fa fa-book','','','5',235,0,'badge_sum'),(234,'参阅箱','Flow/folder?fid=receive','bc-flow-receive','','','6',87,0,'badge_count_flow_receive'),(235,'商业','Sign/index','fa fa-home','','','1',0,0,''),(242,'CRM','CrmContact/index','fa fa-line-chart','','','0',0,0,''),(244,'公司自定义字段管理','CrmCompany/company_field_manage','fa fa-line-chart','','','0',247,0,''),(245,'客户自定义字段管理','CrmContact/contact_field_manage','fa fa-line-chart','','','0',247,0,''),(246,'客户','CrmContact/index','fa fa-line-chart','','','1',242,0,''),(247,'设置','','','','','3',242,0,''),(248,'产品','Product/index##','','ProductFolder','','4',242,0,''),(249,'商品分类','Product/folder_manage','','','','5',242,0,''),(250,'商品自定义属性','Product/field_type','','','','6',242,0,''),(252,'任务','Task/index','','','','2',217,0,'badge_count_task'),(253,'工资查询','UdfSalary/index','','',NULL,'',235,0,''),(255,'公文','GovDoc/index','fa fa-suitcase','',NULL,'',0,0,'badge_count_gov_doc'),(256,'公文','GovDoc/index','','',NULL,'',255,0,''),(257,'权限设置','GovDocAuth/index','','',NULL,'',255,0,''),(258,'公司','CrmCompany/index','fa fa-line-chart','','','0',242,0,'');

#
# Structure for table "think_position"
#

DROP TABLE IF EXISTS `think_position`;
CREATE TABLE `think_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_no` varchar(10) NOT NULL DEFAULT '' COMMENT '编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` varchar(10) NOT NULL DEFAULT '' COMMENT '排序',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "think_position"
#

INSERT INTO `think_position` VALUES (1,'011','主管','5',0),(2,'04','经理','4',0),(3,'03','总监','3',0),(4,'02','副总','2',0),(5,'01','总经理','1',0),(6,'06','助理','6',0);

#
# Structure for table "think_product"
#

DROP TABLE IF EXISTS `think_product`;
CREATE TABLE `think_product` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(20) NOT NULL DEFAULT '' COMMENT '文档编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `content` text NOT NULL COMMENT '内容',
  `folder` int(11) NOT NULL DEFAULT '0' COMMENT '文件夹',
  `add_file` varchar(200) NOT NULL DEFAULT '' COMMENT '附件',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名称',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `udf_data` text COMMENT '自定义字段数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

#
# Data for table "think_product"
#

INSERT INTO `think_product` VALUES (97,'2015-0001','BBBBBBBBB','<p>BBBBBBBBBBBBBBBBBBBB</p>',79,'',1,'管理员',1441096153,0,1,NULL),(98,'2015-0002','BBBBBBBB','<p>BBBBBBBBBBBBBBBBBBBBB</p>',79,'',1,'管理员',1441096175,0,1,NULL),(99,'2015-0003','BBBBBBBBBBBB','<p>BBBBBBBBBBBBBBBBBBBBBBBB</p>',79,'',1,'管理员',1441096185,0,1,NULL),(100,'XM-001','小米手机4','<p>XM-001</p>',79,'',1,'管理员',1441157763,0,0,NULL),(101,'01','25825','<p>32</p>',81,'',1,'管理员',1441796567,0,0,NULL);

#
# Structure for table "think_push"
#

DROP TABLE IF EXISTS `think_push`;
CREATE TABLE `think_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `data` text NOT NULL,
  `status` int(11) DEFAULT '0',
  `time` int(11) DEFAULT '0',
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3218 DEFAULT CHARSET=utf8;

#
# Data for table "think_push"
#

INSERT INTO `think_push` VALUES (3188,42,'{\"type\":\"签批\",\"action\":\"\",\"title\":\"11111111111111\",\"content\":\"发送人：小微企业-管理员\",\"url\":\"\\/index.php?m=&c=GovDoc&a=index&return_url=GovDoc%2Findex\"}',0,1446696291,NULL),(3190,42,'{\"type\":\"签批\",\"action\":\"\",\"title\":\"11111111111111\",\"content\":\"发送人：小微企业-管理员\",\"url\":\"\\/xiaowei\\/index.php?m=&c=GovDoc&a=index&return_url=GovDoc%2Findex\"}',0,1451031653,NULL),(3194,42,'{\"type\":\"消息\",\"action\":\"\",\"title\":\"来自：总经办-101的消息\",\"content\":\"dsadasdsa\",\"url\":\"\\/xiaowei\\/index.php?m=&c=Message&a=index&return_url=Message%2Findex\"}',0,1451279340,NULL),(3195,42,'{\"type\":\"消息\",\"action\":\"\",\"title\":\"来自：总经办-101的消息\",\"content\":\"dsa dsa dsa\",\"url\":\"\\/xiaowei\\/index.php?m=&c=Message&a=index&return_url=Message%2Findex\"}',0,1451279349,NULL),(3197,44,'{\"type\":\"任务\",\"action\":\"需要执行\",\"title\":\"来自：总经办-101\",\"content\":\"标题：sadasd\",\"url\":\"\\/xiaowei\\/index.php?m=&c=Task&a=read&id=36&return_url=Task%2Findex\"}',0,1451279473,NULL),(3207,42,'{\"type\":\"消息\",\"action\":\"\",\"title\":\"来自：销售部-1的消息\",\"content\":\"；；；\",\"url\":\"\\/xiaowei\\/index.php?m=&c=Message&a=index&return_url=Message%2Findex\"}',0,1451285661,NULL),(3208,42,'{\"type\":\"消息\",\"action\":\"\",\"title\":\"来自：小微企业-管理员的消息\",\"content\":\"asd\",\"url\":\"\\/index.php?m=&c=Message&a=index&return_url=Message%2Findex\"}',0,1451286292,NULL),(3209,44,'{\"type\":\"消息\",\"action\":\"\",\"title\":\"来自：小微企业-管理员的消息\",\"content\":\"123\",\"url\":\"\\/xiaowei\\/index.php?m=&c=Message&a=index&return_url=Message%2Findex\"}',0,1451368088,NULL),(3211,43,'{\"type\":\"任务\",\"action\":\"需要执行\",\"title\":\"来自：小微企业-管理员\",\"content\":\"标题：123\",\"url\":\"\\/xiaowei\\/index.php?m=&c=Task&a=read&id=37&return_url=Task%2Findex\"}',0,1451369732,NULL),(3212,44,'{\"type\":\"任务\",\"action\":\"需要执行\",\"title\":\"来自：小微企业-管理员\",\"content\":\"标题：123\",\"url\":\"\\/xiaowei\\/index.php?m=&c=Task&a=read&id=37&return_url=Task%2Findex\"}',0,0,NULL),(3213,43,'{\"type\":\"任务\",\"action\":\"需要执行\",\"title\":\"来自：小微企业-管理员\",\"content\":\"标题：123\",\"url\":\"\\/xiaowei\\/index.php?m=&c=Task&a=read&id=37&return_url=Task%2Findex\"}',0,1451369749,NULL),(3214,44,'{\"type\":\"任务\",\"action\":\"需要执行\",\"title\":\"来自：小微企业-管理员\",\"content\":\"标题：123\",\"url\":\"\\/xiaowei\\/index.php?m=&c=Task&a=read&id=37&return_url=Task%2Findex\"}',0,0,NULL),(3217,42,'{\"type\":\"签批\",\"action\":\"\",\"title\":\"请问\",\"content\":\"发送人：小微企业-管理员\",\"url\":\"\\/xiaowei\\/index.php?m=&c=GovDoc&a=index&return_url=GovDoc%2Findex\"}',0,1451374547,NULL);

#
# Structure for table "think_rank"
#

DROP TABLE IF EXISTS `think_rank`;
CREATE TABLE `think_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_no` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `sort` varchar(10) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "think_rank"
#

INSERT INTO `think_rank` VALUES (1,'RG40','部长','1',0),(2,'RG30','科长','2',0),(3,'RG20','主管','3',0),(4,'RG10','助理','4',0),(5,'RG00','总经理','0',0),(6,'RG401','部长1','1',0);

#
# Structure for table "think_role"
#

DROP TABLE IF EXISTS `think_role`;
CREATE TABLE `think_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `pid` smallint(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sort` varchar(20) DEFAULT NULL,
  `create_time` int(11) unsigned DEFAULT '0',
  `update_time` int(11) unsigned DEFAULT '0',
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `ename` (`sort`),
  KEY `status` (`is_del`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "think_role"
#

INSERT INTO `think_role` VALUES (1,'公司管理员',0,'','1',1208784792,1451291148,0),(2,'基本权限',0,'','2',1215496283,1368507164,0),(7,'领导',0,'','2',1254325787,1401288337,0);

#
# Structure for table "think_role_duty"
#

DROP TABLE IF EXISTS `think_role_duty`;
CREATE TABLE `think_role_duty` (
  `role_id` smallint(6) unsigned NOT NULL,
  `duty_id` smallint(6) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_role_duty"
#

INSERT INTO `think_role_duty` VALUES (1,15),(7,14),(1,14),(7,15),(2,14),(2,15);

#
# Structure for table "think_role_node"
#

DROP TABLE IF EXISTS `think_role_node`;
CREATE TABLE `think_role_node` (
  `role_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `write` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_role_node"
#

INSERT INTO `think_role_node` VALUES (2,136,NULL,NULL,NULL),(2,135,NULL,NULL,NULL),(1,94,NULL,NULL,NULL),(1,97,NULL,NULL,NULL),(1,98,NULL,NULL,NULL),(1,99,NULL,NULL,NULL),(1,69,NULL,NULL,NULL),(1,6,NULL,NULL,NULL),(1,2,NULL,NULL,NULL),(1,7,NULL,NULL,NULL),(1,131,1,1,1),(1,130,NULL,NULL,NULL),(1,133,NULL,NULL,NULL),(1,132,NULL,NULL,NULL),(1,135,NULL,NULL,NULL),(1,136,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,134,NULL,NULL,NULL),(2,103,NULL,NULL,NULL),(2,133,NULL,NULL,NULL),(2,130,NULL,NULL,NULL),(2,134,NULL,NULL,NULL),(2,132,NULL,NULL,NULL),(2,103,NULL,NULL,NULL),(2,103,NULL,NULL,NULL),(2,109,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,103,NULL,NULL,NULL),(1,109,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,163,NULL,NULL,NULL),(1,170,NULL,NULL,NULL),(1,164,NULL,NULL,NULL),(1,155,NULL,NULL,NULL),(1,154,1,1,1),(1,111,NULL,NULL,NULL),(1,168,NULL,NULL,NULL),(1,162,NULL,NULL,NULL),(1,166,NULL,NULL,NULL),(1,161,NULL,NULL,NULL),(1,171,NULL,NULL,NULL),(1,165,NULL,NULL,NULL),(1,174,NULL,NULL,NULL),(1,172,NULL,NULL,NULL),(1,173,NULL,NULL,NULL),(1,160,NULL,NULL,NULL),(1,175,NULL,NULL,NULL),(1,176,NULL,NULL,NULL),(1,167,NULL,NULL,NULL),(1,128,NULL,NULL,NULL),(2,85,1,1,1),(2,100,NULL,NULL,NULL),(2,101,NULL,NULL,NULL),(2,106,NULL,NULL,NULL),(2,104,NULL,NULL,NULL),(2,105,NULL,NULL,NULL),(2,107,NULL,NULL,NULL),(2,177,1,1,1),(2,102,NULL,NULL,NULL),(2,143,1,1,1),(2,108,1,1,1),(2,124,NULL,NULL,NULL),(2,88,NULL,1,1),(2,126,NULL,1,1),(2,219,NULL,NULL,NULL),(2,220,NULL,NULL,NULL),(2,226,NULL,1,1),(2,217,NULL,1,1),(2,216,NULL,1,1),(2,230,NULL,1,1),(2,157,1,1,1),(2,169,1,1,1),(2,156,1,1,1),(2,158,1,1,1),(2,229,NULL,1,1),(2,198,1,1,1),(2,191,NULL,NULL,NULL),(2,193,NULL,NULL,NULL),(2,192,1,1,1),(2,194,1,1,1),(2,125,1,1,1),(2,91,1,1,1),(2,152,1,1,1),(2,190,1,1,1),(2,87,1,1,1),(2,144,1,1,1),(2,149,NULL,NULL,NULL),(2,150,NULL,NULL,NULL),(2,147,NULL,NULL,NULL),(2,148,NULL,NULL,NULL),(2,185,NULL,NULL,NULL),(2,221,NULL,1,NULL),(1,255,1,1,1),(1,256,1,1,1),(1,257,1,1,1),(1,242,1,1,1),(1,258,1,1,1),(1,246,1,1,1),(1,247,NULL,NULL,NULL),(1,244,NULL,NULL,NULL),(1,245,NULL,NULL,NULL),(1,248,1,1,1),(1,249,NULL,NULL,NULL),(1,250,NULL,NULL,NULL),(1,235,1,1,1),(1,253,1,1,1),(1,230,1,1,1),(1,231,NULL,NULL,NULL),(1,85,1,1,1),(1,100,NULL,NULL,NULL),(1,101,NULL,NULL,NULL),(1,106,NULL,NULL,NULL),(1,104,NULL,NULL,NULL),(1,105,NULL,NULL,NULL),(1,107,NULL,NULL,NULL),(1,177,1,1,1),(1,102,NULL,NULL,NULL),(1,143,1,1,1),(1,108,1,1,1),(1,124,NULL,NULL,NULL),(1,87,1,1,1),(1,144,1,1,1),(1,149,NULL,NULL,NULL),(1,150,NULL,NULL,NULL),(1,147,NULL,NULL,NULL),(1,148,NULL,NULL,NULL),(1,185,NULL,NULL,NULL),(1,234,NULL,NULL,NULL),(1,184,NULL,NULL,NULL),(1,146,1,1,1),(1,88,1,1,1),(1,126,1,1,1),(1,219,NULL,NULL,NULL),(1,220,NULL,NULL,NULL),(1,189,NULL,NULL,NULL),(1,221,1,1,1),(1,222,NULL,NULL,NULL),(1,226,1,1,1),(1,227,NULL,NULL,NULL),(1,228,NULL,NULL,NULL),(1,217,1,1,1),(1,216,1,1,1),(1,252,1,1,1),(1,214,1,1,1),(1,157,1,1,1),(1,169,1,1,1),(1,156,1,1,1),(1,158,1,1,1),(1,229,1,1,1),(1,198,1,1,1),(1,125,1,1,1),(1,190,1,1,1),(1,91,1,1,1),(1,152,1,1,1),(1,191,NULL,NULL,NULL),(1,192,1,1,1),(1,193,NULL,NULL,NULL),(1,194,1,1,1),(1,84,1,1,1),(1,110,NULL,NULL,NULL),(1,115,1,1,1),(1,123,1,1,1),(1,153,1,1,1),(1,116,1,1,1),(1,112,NULL,NULL,NULL),(1,118,1,1,1),(1,119,NULL,NULL,NULL),(1,120,NULL,NULL,NULL),(1,205,1,1,1),(1,206,NULL,NULL,NULL),(1,113,NULL,NULL,NULL),(1,121,1,1,1),(1,114,1,1,1),(7,255,1,1,1),(7,100,NULL,NULL,NULL),(7,101,NULL,NULL,NULL),(7,106,NULL,NULL,NULL),(7,104,NULL,NULL,NULL),(7,105,NULL,NULL,NULL),(7,107,NULL,NULL,NULL),(7,108,NULL,NULL,NULL),(7,124,NULL,NULL,NULL),(7,125,NULL,NULL,NULL);

#
# Structure for table "think_role_user"
#

DROP TABLE IF EXISTS `think_role_user`;
CREATE TABLE `think_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_role_user"
#

INSERT INTO `think_role_user` VALUES (4,'27'),(4,'26'),(5,'31'),(3,'22'),(1,'4'),(1,'3'),(1,'35'),(1,'36'),(1,'54'),(2,'3'),(1,'53'),(7,'36'),(1,'2'),(2,'2'),(7,'2'),(1,'63'),(1,'64'),(2,'41'),(2,'68'),(1,'44'),(2,'44'),(7,'44'),(1,'67'),(2,'67'),(7,'67'),(1,'51'),(2,'51'),(7,'51'),(1,'52'),(2,'52'),(7,'52'),(1,'55'),(2,'55'),(7,'55'),(1,'57'),(2,'57'),(7,'57'),(1,'58'),(2,'58'),(7,'58'),(1,'59'),(2,'59'),(7,'59'),(1,'60'),(2,'60'),(7,'60'),(1,'61'),(2,'61'),(7,'61'),(1,'56'),(2,'56'),(7,'56'),(1,'62'),(2,'62'),(7,'62'),(1,'65'),(2,'65'),(7,'65'),(1,'66'),(2,'66'),(7,'66'),(2,'83'),(2,'84'),(2,'87'),(2,'88'),(2,'89'),(2,'91'),(2,'92'),(2,'93'),(2,'95'),(2,'96'),(2,'97'),(2,'98'),(1,'1'),(1,'90'),(2,'90'),(7,'90'),(9,'90'),(10,'90'),(11,'90'),(1,'94'),(2,'94'),(7,'94'),(9,'94'),(10,'94'),(11,'94'),(2,'42'),(2,'43'),(7,'43'),(1,'43'),(2,'46'),(7,'46'),(1,'46'),(2,'47'),(7,'47'),(1,'47'),(2,'48'),(7,'48'),(1,'48'),(2,'49'),(7,'49'),(1,'49'),(2,'50'),(7,'50'),(1,'50');

#
# Structure for table "think_schedule"
#

DROP TABLE IF EXISTS `think_schedule`;
CREATE TABLE `think_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `content` text,
  `location` varchar(50) DEFAULT '',
  `priority` int(11) DEFAULT NULL,
  `actor` varchar(200) DEFAULT '',
  `user_id` int(11) DEFAULT '0',
  `start_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `add_file` varchar(200) DEFAULT '',
  `is_del` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_schedule"
#


#
# Structure for table "think_sign"
#

DROP TABLE IF EXISTS `think_sign`;
CREATE TABLE `think_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `emp_no` varchar(10) DEFAULT NULL COMMENT '员工编号',
  `create_time` int(11) DEFAULT NULL,
  `latitude` varchar(10) DEFAULT NULL,
  `longitude` varchar(10) DEFAULT NULL,
  `precision` varchar(10) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `is_real_time` tinyint(3) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `sign_date` datetime DEFAULT NULL,
  `content` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "think_sign"
#


#
# Structure for table "think_songji"
#

DROP TABLE IF EXISTS `think_songji`;
CREATE TABLE `think_songji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(10) DEFAULT NULL,
  `flight_no` varchar(10) DEFAULT NULL,
  `depart_time` datetime DEFAULT NULL,
  `depart_location` varchar(200) DEFAULT NULL,
  `passenger_qty` tinyint(3) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `passenger` varchar(10) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `message` text,
  `task_no` varchar(20) DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  `executor` varchar(200) DEFAULT NULL,
  `is_del` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_songji"
#


#
# Structure for table "think_songji_log"
#

DROP TABLE IF EXISTS `think_songji_log`;
CREATE TABLE `think_songji_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `type` tinyint(3) DEFAULT NULL,
  `assigner` int(11) DEFAULT NULL COMMENT '分配任务的人',
  `executor` varchar(20) DEFAULT NULL COMMENT '执行人',
  `executor_name` varchar(20) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `plan_time` datetime DEFAULT NULL,
  `transactor_name` varchar(20) DEFAULT NULL,
  `transactor` int(11) DEFAULT NULL COMMENT '由谁处理的',
  `finish_rate` tinyint(3) DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `feed_back` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_songji_log"
#


#
# Structure for table "think_supplier"
#

DROP TABLE IF EXISTS `think_supplier`;
CREATE TABLE `think_supplier` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `letter` varchar(50) DEFAULT '',
  `short` varchar(30) DEFAULT '',
  `account` varchar(20) DEFAULT '',
  `tax_no` varchar(20) DEFAULT '',
  `payment` varchar(20) DEFAULT NULL,
  `contact` varchar(20) NOT NULL DEFAULT '',
  `office_tel` varchar(20) DEFAULT NULL,
  `mobile_tel` varchar(20) DEFAULT '',
  `email` varchar(50) DEFAULT '',
  `im` varchar(20) DEFAULT '',
  `address` varchar(50) DEFAULT '',
  `user_id` int(11) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `remark` text,
  `fax` varchar(255) DEFAULT NULL,
  `user_name` varchar(21) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "think_supplier"
#

INSERT INTO `think_supplier` VALUES (1,'XXXX','XXXX','X','XX','XX','X','XXX',NULL,'X','X','XXX','XX',1,0,'XX','XX',NULL);

#
# Structure for table "think_system_config"
#

DROP TABLE IF EXISTS `think_system_config`;
CREATE TABLE `think_system_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `val` varchar(255) DEFAULT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `sort` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT '0',
  `data_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

#
# Data for table "think_system_config"
#

INSERT INTO `think_system_config` VALUES (86,'system_name','','小微OA',0,NULL,0,'system'),(87,'system_license','','112dsa52a5rra53ar535fa32er13',0,NULL,0,'system'),(88,'upload_file_ext','','doc,docx,xls,xlsx,ppt,pptx,pdf,gif,png,tif,zip,rar,jpg,jpeg,txt',0,NULL,0,'system'),(89,'login_verify_code','','',0,NULL,0,'system'),(90,'weixin_corp_id','','wx4124a601419ba115',0,NULL,0,'weixin'),(91,'weixin_secret','','TlnidZYom5z8T-pE0y_O7IXm7dSPgPDtI3nQ7RyqLQePiyUXzWo8F-qum1n4i_QM',0,NULL,0,'weixin'),(92,'weixin_token','','xiaowei',0,NULL,0,'weixin'),(93,'weixin_encoding_aes_key','','lsBzWprOjjdbkMatbg54wwMC2H9ZXmi1aEdDmUQ2nPq',0,NULL,0,'weixin'),(94,'weixin_set_url','','http://xiaowei.smeoa.com',0,NULL,0,'weixin'),(97,'ws_push_config','','审批,任务,信息,工资查询,日报,日程,个人,CRM,通讯录,邮件',0,NULL,0,'push'),(98,'weixin_push_config','','审批,任务,信息,工资查询,日报,日程,个人,CRM,通讯录,邮件',0,NULL,0,'push'),(99,'msg_push_config','','审批=17;任务=8;信息=18;工资查询=19;日报=20;日程=21;个人=22;CRM=15;通讯录=9;',0,NULL,0,'push'),(101,'weixin_site_url','','http://xiaowei.smeoa.com/',0,NULL,0,'weixin'),(102,'记账-支出','记账-支出','记账-支出',0,'1',0,'common'),(103,'FINANCE_PAYMENT_TYPE','餐费','餐费',0,'1',102,'common'),(104,'FINANCE_PAYMENT_TYPE','通讯费','通讯费',0,'2',102,'common'),(105,'FINANCE_PAYMENT_TYPE','办公费','办公费',0,'3',102,'common'),(106,'跟进类型','跟进类型','跟进类型',0,'2',0,'common'),(107,'CRM_VISIT_TYPE','咨询','咨询',0,'1',106,'common'),(108,'CRM_VISIT_TYPE','介绍','介绍',0,'2',106,'common'),(109,'SIGN_AGENT_ID','SIGN_AGENT_ID','6',0,'3',0,'common'),(110,'OA_AGENT_ID','OA_AGENT_ID','5',0,'4',0,'common');

#
# Structure for table "think_system_folder"
#

DROP TABLE IF EXISTS `think_system_folder`;
CREATE TABLE `think_system_folder` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `controller` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL,
  `admin` varchar(200) NOT NULL,
  `write` varchar(200) NOT NULL,
  `read` varchar(200) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

#
# Data for table "think_system_folder"
#

INSERT INTO `think_system_folder` VALUES (78,0,'Form','登记表','小微企业|dept_1;','','','',0,''),(79,0,'Product','手机','小微企业|dept_1;','','','',0,'');

#
# Structure for table "think_system_log"
#

DROP TABLE IF EXISTS `think_system_log`;
CREATE TABLE `think_system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `data` float DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "think_system_log"
#

INSERT INTO `think_system_log` VALUES (1,1,1451551272,44,NULL),(2,2,1451551272,15.1434,NULL),(3,1,1451873031,44,NULL),(4,2,1451873031,15.1434,NULL);

#
# Structure for table "think_system_tag"
#

DROP TABLE IF EXISTS `think_system_tag`;
CREATE TABLE `think_system_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `controller` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sort` varchar(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

#
# Data for table "think_system_tag"
#

INSERT INTO `think_system_tag` VALUES (69,0,'FlowType','人事','1',''),(70,0,'FlowType','行政','2',''),(71,0,'FlowType','采购','3',''),(72,0,'FlowType','出差','4',''),(80,0,'FlowType','车辆管理','5',''),(81,0,'Supplier','嘻嘻嘻','','');

#
# Structure for table "think_system_tag_data"
#

DROP TABLE IF EXISTS `think_system_tag_data`;
CREATE TABLE `think_system_tag_data` (
  `row_id` int(11) NOT NULL DEFAULT '0',
  `tag_id` int(11) NOT NULL DEFAULT '0',
  `controller` varchar(20) NOT NULL DEFAULT '',
  KEY `row_id` (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_system_tag_data"
#

INSERT INTO `think_system_tag_data` VALUES (17,70,'FlowType'),(23,72,'FlowType'),(22,72,'FlowType'),(21,72,'FlowType'),(20,72,'FlowType'),(24,70,'FlowType'),(18,71,'FlowType'),(19,71,'FlowType'),(33,71,'FlowType'),(34,71,'FlowType'),(35,71,'FlowType'),(36,71,'FlowType'),(42,70,'FlowType'),(46,70,'FlowType'),(47,70,'FlowType'),(48,70,'FlowType'),(49,70,'FlowType'),(50,70,'FlowType'),(56,71,'FlowType'),(1,81,'Supplier');

#
# Structure for table "think_task"
#

DROP TABLE IF EXISTS `think_task`;
CREATE TABLE `think_task` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `task_no` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COMMENT '内容',
  `executor` varchar(200) DEFAULT NULL,
  `add_file` varchar(255) DEFAULT NULL,
  `expected_time` datetime DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT '0',
  `user_name` varchar(20) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `update_user_name` varchar(20) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `is_del` tinyint(3) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_task"
#


#
# Structure for table "think_task_log"
#

DROP TABLE IF EXISTS `think_task_log`;
CREATE TABLE `think_task_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `type` tinyint(3) DEFAULT NULL,
  `assigner` int(11) DEFAULT NULL COMMENT '分配任务的人',
  `executor` varchar(20) DEFAULT NULL COMMENT '执行人',
  `executor_name` varchar(20) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `plan_time` datetime DEFAULT NULL,
  `transactor_name` varchar(20) DEFAULT NULL,
  `transactor` int(11) DEFAULT NULL COMMENT '由谁处理的',
  `finish_rate` tinyint(3) DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `feed_back` text,
  `add_file` text CHARACTER SET latin1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_task_log"
#


#
# Structure for table "think_todo"
#

DROP TABLE IF EXISTS `think_todo`;
CREATE TABLE `think_todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `end_date` varchar(10) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `add_file` varchar(200) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_todo"
#


#
# Structure for table "think_udf_field"
#

DROP TABLE IF EXISTS `think_udf_field`;
CREATE TABLE `think_udf_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `row_type` int(11) NOT NULL,
  `sort` varchar(20) NOT NULL DEFAULT '0',
  `msg` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `validate` varchar(20) DEFAULT NULL,
  `controller` varchar(20) DEFAULT NULL,
  `is_del` tinyint(3) DEFAULT '0',
  `config` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;

#
# Data for table "think_udf_field"
#

INSERT INTO `think_udf_field` VALUES (56,'A11',1,'','','text','3','','','Flow',0,NULL),(57,'A2',1,'','','select','4','','','Flow',0,NULL),(58,'呵 3 ',1,'','','select','1','','','Flow',0,NULL),(59,'姓名',33,'','','text','1','','','Flow',0,''),(60,'申请日期',33,'','','date','1','','','Flow',0,''),(61,'所属部门',33,'','','text','1','','','Flow',0,''),(62,'所属科室',33,'','','select','1','SYSTEM_CONFIG:FINANCE_INCOME_TYPE','','Flow',0,''),(64,'B1',76,'','','text','1','','','Flow',0,NULL),(65,'B2',76,'','','text','1','','','Flow',0,NULL),(66,'兑现日期',76,'','','datetime','1','','','Form',0,'show|col-10'),(67,'剩余期限',76,'','','text','1','','','Form',0,'show|col-10'),(68,'项目状态',76,'','','radio','2','提交|提交,审核中|审核中,审核失败|审核失败','','Form',0,'show|col-10'),(69,'姓名',34,'','请填写姓名','datetime','1','','require','Flow',0,''),(71,'申请日期',34,'','请填写联系电话','text','1','','require','Flow',0,''),(72,'请假开始时间',34,'','请选择开始时间','datetime','1','','require','Flow',0,''),(73,'请假结束时间',34,'','请选择束时间','datetime','1','','require','Flow',0,''),(74,'请假原因',34,'','请填写请假原因','textarea','2','','require','Flow',0,''),(76,'姓名',38,'','','text','1','','','Flow',0,''),(77,'申请日期',38,'','','date','1','','','Flow',0,''),(78,'所属部门',38,'','','text','1','','','Flow',0,''),(79,'所属科室',38,'','','text','1','','','Flow',0,''),(80,'姓名',36,'','','text','1','','','Flow',0,''),(82,'申请日期',36,'','','date','1','','','Flow',0,''),(83,'所属部门、科室',36,'','','text','1','','','Flow',0,''),(85,'姓名',44,'','','text','1','','','Flow',0,''),(86,'部门/科室',44,'','','text','1','','','Flow',0,''),(87,'离职申请日期',44,'','','date','2','','','Flow',0,''),(88,'离职理由',44,'','','editor','2','','','Flow',0,''),(89,'培训申请人',54,'1','','text','1','','','Flow',0,''),(90,'部门/科室',54,'2','','text','1','','','Flow',0,''),(91,'培训地点',54,'3','','text','1','','','Flow',0,''),(92,'培训开始时间',54,'4','','datetime','1','','','Flow',0,''),(93,'培训目的',54,'6','','editor','2','','','Flow',0,''),(94,'培训内容',54,'7','','editor','2','','','Flow',0,''),(95,'姓名',41,'1','','text','1','','','Flow',0,''),(96,'部门/科室',41,'2','','text','1','','','Flow',0,''),(97,'出差地点',41,'3','','text','1','','','Flow',0,''),(98,'出差开始时间',41,'5','','datetime','1','','','Flow',0,''),(99,'预计费用',41,'4','','text','1','','','Flow',0,''),(100,'出差事由/目的',41,'7','','editor','2','','','Flow',0,''),(103,'姓名',40,'','','text','1','','','Flow',0,''),(104,'部门/科室',40,'','','text','1','','','Flow',0,''),(105,'请假开始时间',40,'','','datetime','1','','','Flow',0,''),(106,'请假结束时间',40,'','','datetime','1','','','Flow',0,''),(107,'请假事由',40,'','','editor','2','','','Flow',0,''),(108,'培训结束时间',54,'5','','datetime','2','','','Flow',0,''),(109,'出差结束时间',41,'6','','datetime','1','','','Flow',0,''),(110,'申请人',43,'','','text','1','','','Flow',0,''),(112,'部门/科室',43,'2','','text','1','','','Flow',0,''),(114,'用途',43,'3','','editor','2','','','Flow',0,''),(115,'申请人',55,'1','','text','1','','','Flow',0,''),(116,'部门/科室',55,'2','','text','1','','','Flow',0,''),(117,'预算依据',55,'4','','editor','2','','','Flow',0,''),(118,'预算用途',55,'3','','editor','2','','','Flow',0,''),(119,'预算明细请参考附件',55,'5','','text','2','','','Flow',0,''),(120,'申请人',45,'1','','text','1','','','Flow',0,''),(121,'部门/科室',45,'2','','text','1','','','Flow',0,''),(122,'出差地点',45,'4','','text','1','','','Flow',0,''),(123,'出差开始时间',45,'5','','datetime','1','','','Flow',0,''),(124,'出差结束时间',45,'6','','datetime','1','','','Flow',0,''),(125,'住宿费用',45,'7','','text','1','','','Flow',0,''),(126,'交通费用',45,'8','','text','1','','','Flow',0,''),(127,'餐费',45,'9','','text','1','','','Flow',0,''),(128,'补贴',45,'91','','text','1','','','Flow',0,''),(129,'申请人',19,'1','','text','1','','','Flow',0,''),(130,'部门/科室',19,'2','','text','1','','','Flow',0,''),(131,'招待地点',19,'4','','text','1','','','Flow',0,''),(132,'招待时间',19,'5','','datetime','1','','','Flow',0,''),(133,'招待费用',19,'7','','text','2','','','Flow',0,''),(134,'招待目的',19,'8','','editor','2','','','Flow',0,''),(135,'招待对象',19,'3','','text','1','','','Flow',0,''),(136,'参加人员',19,'6','','text','1','','','Flow',0,''),(137,'出差目的',45,'3','','text','1','','','Flow',0,''),(138,'申请人',53,'1','','text','1','','','Flow',0,''),(139,'部门/科室',53,'2','','text','1','','','Flow',0,''),(140,'辅设备名',53,'3','','text','1','','','Flow',0,''),(141,'数量',53,'4','','text','1','','','Flow',0,''),(142,'型号规格',53,'5','','text','1','','','Flow',0,''),(143,'预计费用',53,'6','','text','1','','','Flow',0,''),(144,'申请理由',53,'7','','editor','2','','','Flow',0,''),(145,'申请人',51,'1','','text','1','','','Flow',0,''),(146,'部门/科室',51,'2','','text','1','','','Flow',0,''),(147,'设备名称',51,'3','','text','1','','','Flow',0,''),(148,'数量',51,'4','','text','1','','','Flow',0,''),(149,'型号规格',51,'5','','text','1','','','Flow',0,''),(150,'预计费用',51,'6','','text','1','','','Flow',0,''),(151,'申请理由',51,'7','','editor','2','','','Flow',0,''),(152,'申请人',52,'1','','text','1','','','Flow',0,''),(153,'部门/科室',52,'2','','text','1','','','Flow',0,''),(154,'辅材名称',52,'3','','text','1','','','Flow',0,''),(155,'数量',52,'4','','text','1','','','Flow',0,''),(156,'型号规格',52,'5','','text','1','','','Flow',0,''),(157,'预计费用',52,'6','','text','1','','','Flow',0,''),(158,'申请理由',52,'7','','editor','2','','','Flow',0,''),(159,'申请人',39,'1','','text','1','','','Flow',0,''),(160,'部门/科室',39,'2','','text','1','','','Flow',0,''),(161,'原材料名称',39,'3','','text','1','','','Flow',0,''),(162,'数量',39,'4','','text','1','','','Flow',0,''),(163,'型号规格',39,'5','','text','1','','','Flow',0,''),(164,'预计费用',39,'6','','text','1','','','Flow',0,''),(165,'申请理由',39,'7','','editor','2','','','Flow',0,''),(166,'申请人',50,'1','','text','1','','','Flow',0,''),(167,'部门/科室',50,'2','','text','1','','','Flow',0,''),(168,'申请时间',50,'3','','datetime','1','','','Flow',0,''),(169,'出差地点',50,'4','','text','1','','','Flow',0,''),(170,'出差事由',50,'9','','editor','2','','','Flow',0,''),(171,'去程',50,'6','','text','1','','','Flow',0,''),(172,'回程',50,'7','','text','1','','','Flow',0,''),(173,'出差开始时间',50,'51','','datetime','1','','','Flow',0,''),(176,'出差结束时间',50,'52','','datetime','1','','','Flow',0,''),(177,'申请人',49,'1','','text','1','','','Flow',0,''),(178,'部门/科室',49,'2','','text','1','','','Flow',0,''),(179,'目的/用途',49,'3','','text','1','','','Flow',0,''),(180,'使用开始时间',49,'4','','datetime','1','','','Flow',0,''),(181,'使用结束时间',49,'5','','datetime','1','','','Flow',0,''),(182,'申请时间',49,'21','','datetime','1','','','Flow',0,''),(183,'参会人',49,'6','','text','2','','','Flow',0,''),(184,'申请人',42,'1','','text','1','','','Flow',0,''),(185,'部门/科室',42,'2','','text','1','','','Flow',0,''),(186,'申请理由',42,'3','','text','1','','','Flow',0,''),(187,'办公用品名称以及数量',42,'4','','editor','2','','','Flow',0,''),(189,'申请时间',42,'21','','text','1','','','Flow',0,''),(190,'申请人',46,'1','','text','1','','','Flow',0,''),(191,'部门/科室',46,'2','','text','1','','','Flow',0,''),(192,'申请时间',46,'3','','datetime','1','','','Flow',0,''),(193,'申请事由',46,'5','','text','2','','','Flow',0,''),(194,'通讯报销金额',46,'4','','text','1','','','Flow',0,''),(195,'申请人',47,'1','','text','1','','','Flow',0,''),(196,'部门/科室',47,'2','','text','1','','','Flow',0,''),(197,'申请日期',47,'3','','datetime','1','','','Flow',0,''),(199,'出差开始时间',47,'4','','datetime','1','','','Flow',0,''),(200,'出差结束时间',47,'5','','datetime','1','','','Flow',0,''),(201,'出差事由',47,'31','','text','1','','','Flow',0,''),(202,'实际使用费用',47,'6','','text','1','','','Flow',0,''),(203,'标准费用',47,'7','','text','1','','','Flow',0,''),(204,'交通费用明细',47,'8','','editor','2','','','Flow',0,''),(205,'申请人',48,'1','','text','1','','','Flow',0,''),(206,'部门/科室',48,'2','','text','1','','','Flow',0,''),(207,'申请时间',48,'3','','datetime','1','','','Flow',0,''),(208,'实际费用',48,'4','','text','1','','','Flow',0,''),(209,'参加人员',48,'5','','text','2','','','Flow',0,''),(210,'申请事由',48,'41','','text','2','','','Flow',0,''),(211,'11111',37,'','','link_select','1','dept','','Flow',0,''),(213,'自定义字段',2,'','','text','1','自定义字段','','Crm',0,''),(214,'预算范围',56,'','','text','1','','','Flow',0,''),(215,'物料种类',56,'','','text','1','','','Flow',0,''),(216,'数量',56,'','','text','2','','','Flow',0,''),(217,'物料用途',56,'','','simple','2','','','Flow',0,''),(218,'目标受众',56,'','','simple','2','','','Flow',0,''),(219,'内容方向',56,'','','editor','2','','','Flow',0,''),(220,'其他要求',56,'','','simple','2','','','Flow',0,''),(221,'格式要求',56,'','','simple','2','','','Flow',0,''),(222,'方案确认时间',56,'','','datetime','1','','','Flow',0,''),(223,'初稿时间',56,'','','datetime','1','','','Flow',0,''),(224,'二稿时间',56,'','','datetime','1','','','Flow',0,''),(225,'最终确认时间',56,'','','datetime','1','','','Flow',0,''),(226,'AAAAAAA',78,'','','text','1','121321','','Form',0,''),(227,'ssss',33,'','','select','2','FINANCE_INCOME_TYPE:FINANCE_INCOME_TYPE','','Flow',0,''),(228,'sad0s000',33,'','','select','2','SYSTEM_CONFIG:FINANCE_INCOME_TYPE','','Flow',0,''),(229,'002111',2,'','','text','1','','','Crm',0,''),(230,'asd',0,'sad','asd','text','1','asd','','CrmCompany',0,'asd'),(232,'123',0,'123','','text','1','123','','CrmCompany',0,'123'),(233,'阿诗丹顿',1,'','','text','1','玩儿','','CrmContact',0,''),(234,'爱妃',1,'','','text','1','情人网v','','CrmContact',0,''),(235,'123',79,'','','text','1','123','','Product',0,'123'),(237,'asd',83,'asd','','text','2','阿斯达asd','','Form',0,'asd');

#
# Structure for table "think_udf_renew"
#

DROP TABLE IF EXISTS `think_udf_renew`;
CREATE TABLE `think_udf_renew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `renew_date` date DEFAULT NULL,
  `shop_no` varchar(10) DEFAULT NULL,
  `shop_name` varchar(20) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_udf_renew"
#


#
# Structure for table "think_udf_salary"
#

DROP TABLE IF EXISTS `think_udf_salary`;
CREATE TABLE `think_udf_salary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `A` varchar(20) DEFAULT '',
  `B` varchar(20) DEFAULT '',
  `C` varchar(20) DEFAULT '',
  `D` varchar(20) DEFAULT '',
  `E` varchar(20) DEFAULT '',
  `F` varchar(20) DEFAULT '',
  `G` varchar(20) DEFAULT '',
  `H` varchar(20) DEFAULT '',
  `I` varchar(20) DEFAULT '',
  `J` varchar(20) DEFAULT '',
  `K` varchar(20) DEFAULT '',
  `L` varchar(20) DEFAULT '',
  `M` varchar(20) DEFAULT '',
  `N` varchar(20) DEFAULT '',
  `O` varchar(20) DEFAULT '',
  `P` varchar(20) DEFAULT '',
  `Q` varchar(20) DEFAULT '',
  `R` varchar(20) DEFAULT '',
  `S` varchar(20) DEFAULT '',
  `T` varchar(20) DEFAULT '',
  `U` varchar(20) DEFAULT '',
  `V` varchar(20) DEFAULT '',
  `W` varchar(20) DEFAULT '',
  `X` varchar(20) DEFAULT '',
  `Y` varchar(20) DEFAULT '',
  `Z` varchar(20) DEFAULT '',
  `AA` varchar(20) DEFAULT '',
  `AB` varchar(20) DEFAULT '',
  `AC` varchar(20) DEFAULT '',
  `AD` varchar(20) DEFAULT '',
  `AE` varchar(20) DEFAULT '',
  `AF` varchar(20) DEFAULT '',
  `AG` varchar(20) DEFAULT '',
  `AH` varchar(20) DEFAULT '',
  `AI` varchar(20) DEFAULT '',
  `emp_no` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_udf_salary"
#


#
# Structure for table "think_udf_sales"
#

DROP TABLE IF EXISTS `think_udf_sales`;
CREATE TABLE `think_udf_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_date` date DEFAULT NULL,
  `shop_no` varchar(10) DEFAULT NULL,
  `shop_name` varchar(20) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_udf_sales"
#


#
# Structure for table "think_udf_shop"
#

DROP TABLE IF EXISTS `think_udf_shop`;
CREATE TABLE `think_udf_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `shop_no` varchar(20) NOT NULL DEFAULT '' COMMENT '部门编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `short` varchar(20) NOT NULL DEFAULT '' COMMENT '简称',
  `sort` varchar(20) NOT NULL DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `duty` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_udf_shop"
#


#
# Structure for table "think_udf_target"
#

DROP TABLE IF EXISTS `think_udf_target`;
CREATE TABLE `think_udf_target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(10) DEFAULT NULL,
  `shop_no` varchar(10) DEFAULT NULL,
  `shop_name` varchar(20) DEFAULT NULL,
  `renew_target` float DEFAULT NULL,
  `sales_target` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_udf_target"
#


#
# Structure for table "think_user"
#

DROP TABLE IF EXISTS `think_user`;
CREATE TABLE `think_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emp_no` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL DEFAULT '',
  `letter` varchar(10) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `last_login_ip` varchar(40) DEFAULT NULL,
  `login_count` int(8) DEFAULT NULL,
  `pic` varchar(200) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `duty` varchar(2000) DEFAULT NULL,
  `office_tel` varchar(20) DEFAULT NULL,
  `mobile_tel` varchar(20) DEFAULT NULL,
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `openid` varchar(50) DEFAULT NULL,
  `westatus` tinyint(3) DEFAULT '0',
  `init_pwd` tinyint(3) DEFAULT NULL,
  `pay_pwd` varchar(32) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`emp_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "think_user"
#

INSERT INTO `think_user` VALUES (1,'admin','管理员','GLY','21232f297a57a5a743894a0e4a801fc3',1,1,'male','2013-09-18','127.0.0.1',3269,'Uploads/emp_pic/1.jpeg','gdsresrere','1231254123123asd','5086-2222-2222','12123123',1222907803,1451368432,0,'',1,1,'c81e728d9d4c2f636f067f89cc14862c','admin');

#
# Structure for table "think_user_config"
#

DROP TABLE IF EXISTS `think_user_config`;
CREATE TABLE `think_user_config` (
  `id` int(11) NOT NULL DEFAULT '0',
  `home_sort` varchar(255) DEFAULT NULL,
  `list_rows` int(11) DEFAULT '20',
  `readed_info` text,
  `push_web` varchar(255) DEFAULT NULL,
  `push_wechat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_user_config"
#

INSERT INTO `think_user_config` VALUES (1,'undefined11,22,|12,21,',10,'139','mail,flow,message','mail,flow,message');

#
# Structure for table "think_user_folder"
#

DROP TABLE IF EXISTS `think_user_folder`;
CREATE TABLE `think_user_folder` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `controller` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `sort` varchar(20) DEFAULT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_user_folder"
#


#
# Structure for table "think_user_tag"
#

DROP TABLE IF EXISTS `think_user_tag`;
CREATE TABLE `think_user_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `controller` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `sort` varchar(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

#
# Data for table "think_user_tag"
#

INSERT INTO `think_user_tag` VALUES (22,0,'Contact',1,'asd','',''),(23,0,'Contact',1,'sad','','');

#
# Structure for table "think_user_tag_data"
#

DROP TABLE IF EXISTS `think_user_tag_data`;
CREATE TABLE `think_user_tag_data` (
  `row_id` int(11) NOT NULL DEFAULT '0',
  `tag_id` int(11) NOT NULL DEFAULT '0',
  `controller` varchar(20) DEFAULT NULL,
  KEY `row_id` (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_user_tag_data"
#


#
# Structure for table "think_weixin_config"
#

DROP TABLE IF EXISTS `think_weixin_config`;
CREATE TABLE `think_weixin_config` (
  `corp_id` varchar(20) NOT NULL DEFAULT '',
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`corp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_weixin_config"
#


#
# Structure for table "think_weixin_menu"
#

DROP TABLE IF EXISTS `think_weixin_menu`;
CREATE TABLE `think_weixin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL COMMENT '????',
  `name` varchar(255) DEFAULT NULL COMMENT '??',
  `url` varchar(255) DEFAULT NULL COMMENT '????',
  `key` varchar(255) DEFAULT '' COMMENT 'key',
  `pid` int(11) DEFAULT NULL COMMENT '??id',
  `sort` varchar(20) DEFAULT NULL COMMENT '??',
  `option_id` int(11) DEFAULT NULL COMMENT '??id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

#
# Data for table "think_weixin_menu"
#

INSERT INTO `think_weixin_menu` VALUES (9,'view','微信办公','index.php?m=&c=index&a=index','',0,'1',3),(10,'view','发布任务','index.php?m=&c=Task&a=add','',0,'1',5),(11,'view','我未完成','index.php?m=&c=Task&a=folder&fid=no_finish','',0,'2',5),(12,'click','查看任务','','chakanrenwu',0,'3',5),(13,'view','部门任务','index.php?m=&c=Task&a=folder&fid=dept','',12,'1',5),(14,'view','机动任务','index.php?m=&c=Task&a=folder&fid=no_assign','',12,'2',5),(15,'view','我发布的','index.php?m=&c=Task&a=folder&fid=my_task','',12,'3',5),(16,'view','我已完成','index.php?m=&c=Task&a=folder&fid=finished','',12,'4',5),(17,'view','所有任务','index.php?m=&c=Task&a=folder&fid=all','',12,'5',5),(18,'view','发起审批','index.php?m=&c=Flow&a=index','',0,'1',6),(19,'view','待我审批','m=&c=Flow&a=folder&fid=confirm','',0,'2',6),(20,'click','其他','','shenpiqita',0,'3',6),(21,'view','草稿箱','index.php?m=&c=Flow&a=folder&fid=darft','',20,'1',6),(22,'view','已提交','index.php?m=&c=Flow&a=folder&fid=submit','',20,'2',6),(23,'view','审批报告','index.php?m=&c=Flow&a=folder&fid=report','',20,'3',6),(24,'view','参阅箱','index.php?m=&c=Flow&a=folder&fid=receive','',20,'4',6),(25,'view','已审批','index.php?m=&c=Flow&a=folder&fid=finish','',20,'5',6),(26,'view','我的信息','index.php?m=&c=Info&a=my_info','',0,'1',7),(27,'view','我的签收','index.php?m=&c=Info&a=my_sign','',0,'2',7),(28,'view','我的客户','index.php?m=&c=CrmContact&a=index','',0,'1',8),(29,'view','新建客户','index.php?m=&c=CrmContact&a=add_contact','',0,'2',8),(30,'view','职员','index.php?m=&c=Staff&a=index','',0,'1',9),(31,'view','客户','index.php?m=&c=Customer&a=index','',0,'2',9),(32,'view','供应商','index.php?m=&c=Supplier&a=index','',0,'3',9),(33,'view','新建日报','index.php?m=&c=WorkLog&a=add','',0,'1',11),(34,'view','查看日报','index.php?m=&c=WorkLog&a=index','',0,'2',11),(35,'view','新建日程','index.php?m=&c=Schedule&a=add','',0,'1',12),(36,'view','查看日程','index.php?m=&c=Schedule&a=index','',0,'2',12),(37,'view','消息','index.php?m=&c=Message&a=index','',0,'1',13),(38,'view','待办','index.php?m=&c=Todo&a=index','',0,'2',13),(39,'view','联系人','index.php?m=&c=Contact&a=index','',0,'3',13),(40,'view','签到','index.php?m=Weixin&c=Sign&a=index&state=sign_in','',0,'1',14),(41,'view','签退','index.php?m=Weixin&c=Sign&a=index&state=sign_in','',0,'2',14),(42,'view','外勤','index.php?m=Weixin&c=Sign&a=index&state=outside','',0,'3',14);

#
# Structure for table "think_weixin_option"
#

DROP TABLE IF EXISTS `think_weixin_option`;
CREATE TABLE `think_weixin_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '??',
  `sort` varchar(20) DEFAULT NULL COMMENT '??',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Data for table "think_weixin_option"
#

/*!40000 ALTER TABLE `think_weixin_option` DISABLE KEYS */;
INSERT INTO `think_weixin_option` VALUES (3,'微信办公','1'),(5,'任务','2'),(6,'审批','3'),(7,'信息','4'),(8,'客户关系','5'),(9,'通讯录','6'),(11,'日报','8'),(12,'日程','9'),(13,'个人','9a'),(14,'微信考勤','2');
/*!40000 ALTER TABLE `think_weixin_option` ENABLE KEYS */;

#
# Structure for table "think_work_log"
#

DROP TABLE IF EXISTS `think_work_log`;
CREATE TABLE `think_work_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(20) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `content` text,
  `plan` text,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `add_file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "think_work_log"
#

INSERT INTO `think_work_log` VALUES (1,1,'管理员',1,'小微企业',1441077332,'阿阿首都发生','1231231231','2015-09-01','2015-09-11',0,'');

#
# Structure for table "think_work_order"
#

DROP TABLE IF EXISTS `think_work_order`;
CREATE TABLE `think_work_order` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `task_no` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COMMENT '内容',
  `executor` varchar(200) DEFAULT NULL,
  `actor` varchar(200) DEFAULT '',
  `add_file` varchar(255) DEFAULT NULL,
  `request_arrive_time` datetime DEFAULT NULL,
  `request_finish_time` datetime DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT '0',
  `user_name` varchar(20) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `update_user_name` varchar(20) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `is_del` tinyint(3) DEFAULT '0',
  `other` varchar(20) DEFAULT NULL,
  `arrive_time` int(11) DEFAULT NULL,
  `finish_time` int(11) DEFAULT NULL,
  `arrive_lat` varchar(10) DEFAULT NULL,
  `arrive_lng` varchar(10) DEFAULT NULL,
  `finish_lat` varchar(10) DEFAULT NULL,
  `finish_lng` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_work_order"
#


#
# Structure for table "think_work_order_log"
#

DROP TABLE IF EXISTS `think_work_order_log`;
CREATE TABLE `think_work_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `type` tinyint(3) DEFAULT NULL,
  `assigner` int(11) DEFAULT NULL COMMENT '分配任务的人',
  `executor` varchar(20) DEFAULT NULL COMMENT '执行人',
  `executor_name` varchar(20) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `arrive_time` int(11) DEFAULT NULL,
  `transactor_name` varchar(20) DEFAULT NULL,
  `transactor` int(11) DEFAULT NULL COMMENT '由谁处理的',
  `finish_rate` tinyint(3) DEFAULT NULL,
  `finish_time` int(11) DEFAULT NULL,
  `feed_back` text,
  `arrive_lat` varchar(10) DEFAULT NULL,
  `arrive_lng` varchar(10) DEFAULT NULL,
  `finish_lat` varchar(10) DEFAULT NULL,
  `finish_lng` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_work_order_log"
#


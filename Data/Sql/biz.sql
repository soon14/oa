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
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '����',
  `letter` varchar(50) NOT NULL DEFAULT '' COMMENT 'ƴ��',
  `company` varchar(30) NOT NULL DEFAULT '' COMMENT '��˾',
  `dept` varchar(20) NOT NULL DEFAULT '' COMMENT '����',
  `position` varchar(20) NOT NULL DEFAULT '' COMMENT 'ְλ',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '�ʼ�',
  `office_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '�칫�绰',
  `mobile_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '�ƶ��绰',
  `website` varchar(50) NOT NULL DEFAULT '' COMMENT '��վ',
  `im` varchar(20) NOT NULL DEFAULT '' COMMENT '��ʱͨѶ',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '��ַ',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `remark` text COMMENT '��ע',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
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
  `visit_type` varchar(20) DEFAULT NULL COMMENT '�ŷ�����',
  `content` text COMMENT '����',
  `add_file` varchar(255) DEFAULT NULL COMMENT '����',
  `contact_id` int(11) DEFAULT NULL COMMENT '��ϵ��id',
  `create_time` int(11) DEFAULT NULL COMMENT '����ʱ��',
  `update_time` int(11) DEFAULT NULL COMMENT '����ʱ��',
  `is_del` tinyint(3) DEFAULT '0' COMMENT 'ɾ�����',
  `user_id` int(11) DEFAULT NULL COMMENT '�û�id',
  `user_name` varchar(20) DEFAULT NULL COMMENT '�û���',
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
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '��˾��',
  `add_file` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '�ϴ�����',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '�û�id',
  `user_name` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '�û���',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
  `udf_data` text CHARACTER SET utf8 COMMENT '��չ�ֶ�',
  `remark` text CHARACTER SET utf8 COMMENT '��ע',
  `website` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '��վ',
  `address` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '��ַ',
  `contacts` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '������',
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
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '����',
  `company_id` varchar(30) NOT NULL DEFAULT '' COMMENT '��˾',
  `company_name` varchar(50) DEFAULT NULL COMMENT '��˾��',
  `dept` varchar(20) NOT NULL DEFAULT '' COMMENT '����',
  `position` varchar(20) NOT NULL DEFAULT '' COMMENT 'ְλ',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '�ʼ�',
  `office_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '�칫�绰',
  `mobile_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '�ƶ��绰',
  `im` varchar(20) NOT NULL DEFAULT '' COMMENT '��ʱͨѶ',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `user_name` varchar(20) DEFAULT NULL COMMENT '�û���',
  `remark` text COMMENT '��ע',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
  `udf_data` text COMMENT '��չ�ֶ�',
  `salesman_id` int(11) DEFAULT NULL COMMENT 'ҵ��Աid',
  `salesman_name` varchar(20) DEFAULT '' COMMENT 'ҵ��Ա��',
  `create_time` int(11) DEFAULT NULL COMMENT '����ʱ��',
  `update_time` int(11) DEFAULT NULL COMMENT '����ʱ��',
  `product` varchar(20) DEFAULT '' COMMENT '��Ʒ',
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
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '����',
  `letter` varchar(50) NOT NULL DEFAULT '' COMMENT 'ƴ��',
  `biz_license` varchar(30) NOT NULL DEFAULT '' COMMENT 'Ӫҵ���',
  `short` varchar(20) NOT NULL DEFAULT '' COMMENT '���',
  `contact` varchar(20) NOT NULL DEFAULT '' COMMENT '��ϵ������',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '�ʼ���ַ',
  `office_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '�칫�绰',
  `mobile_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '�ƶ��绰',
  `fax` varchar(20) NOT NULL DEFAULT '' COMMENT '����',
  `salesman` varchar(50) NOT NULL DEFAULT '' COMMENT 'ҵ��Ա',
  `im` varchar(20) NOT NULL DEFAULT '' COMMENT '��ʱͨѶ',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '��ַ',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `remark` text COMMENT '��ע',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
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
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '����ID',
  `dept_no` varchar(20) NOT NULL DEFAULT '' COMMENT '���ű��',
  `dept_grade_id` int(11) NOT NULL DEFAULT '0' COMMENT '���ŵȼ�ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `short` varchar(20) NOT NULL DEFAULT '' COMMENT '���',
  `sort` varchar(20) NOT NULL DEFAULT '' COMMENT '����',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '��ע',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

#
# Data for table "think_dept"
#

INSERT INTO `think_dept` VALUES (1,0,'A2',18,'С΢��ҵ','С΢','','',0),(2,1,'YYB',18,'��Ӫ��','��Ӫ','5','',0),(3,1,'XXB',18,'IT��','IT','4','',0),(5,1,'ZJB',18,'�ܾ���','�ܾ�','1','',0),(6,1,'GLB',18,'����','����','2','',0),(7,1,'XSB',18,'���۲�','����','3','',0),(8,1,'CWB',18,'����','����','2','',0),(21,1,'XSB',18,'�ɹ���','�ɹ�','3','',0),(23,6,'HR',16,'���¿�','����','','',0),(24,6,'ZWK',16,'�����','����','','',0),(25,8,'KJK',16,'��ƿ�','���','','',0),(26,8,'JRK',16,'���ڿ�','����','','',0),(27,1,'',0,'���Բ���','���Բ���','123','',0);

#
# Structure for table "think_dept_grade"
#

DROP TABLE IF EXISTS `think_dept_grade`;
CREATE TABLE `think_dept_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_no` varchar(10) NOT NULL DEFAULT '' COMMENT '���ż������',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `sort` varchar(10) NOT NULL DEFAULT '' COMMENT '����',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

#
# Data for table "think_dept_grade"
#

INSERT INTO `think_dept_grade` VALUES (16,'DG1','��','1',0),(18,'DG2','��','2',0);

#
# Structure for table "think_doc"
#

DROP TABLE IF EXISTS `think_doc`;
CREATE TABLE `think_doc` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(20) NOT NULL DEFAULT '' COMMENT '�ĵ����',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `content` text NOT NULL COMMENT '����',
  `folder` int(11) NOT NULL DEFAULT '0' COMMENT '�ļ���',
  `add_file` varchar(200) NOT NULL DEFAULT '' COMMENT '����',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '�û�����',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "think_doc"
#

INSERT INTO `think_doc` VALUES (1,'2015-0001','das','<p>dsa</p>',85,'',1,'����Ա',1451371550,0,1),(2,'2015-0002','qwe','<p>����</p>',85,'',1,'����Ա',1451371967,0,1);

#
# Structure for table "think_duty"
#

DROP TABLE IF EXISTS `think_duty`;
CREATE TABLE `think_duty` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `duty_no` varchar(20) NOT NULL DEFAULT '' COMMENT 'ְ����',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `sort` varchar(20) NOT NULL DEFAULT '' COMMENT '����',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '��ע',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# Data for table "think_duty"
#

INSERT INTO `think_duty` VALUES (14,'P001','��ͨԱ��','',0,''),(15,'S001','����','',0,''),(16,'W001','����','',0,'');

#
# Structure for table "think_file"
#

DROP TABLE IF EXISTS `think_file`;
CREATE TABLE `think_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '�ļ�ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT 'ԭʼ�ļ���',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '��������',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '�ļ�����·��',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '�ļ���׺',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '�ļ�mime����',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�ļ���С',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '�ļ�md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '�ļ� sha1����',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '�ļ�����λ��',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'Զ�̵�ַ',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�ϴ�ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8 COMMENT='�ļ���';

#
# Data for table "think_file"
#

INSERT INTO `think_file` VALUES (238,'СޱOAlogoȷ����(CS6�汾)1-01.jpg','563ad55d15442.jpg','govdoc/2015-11/','jpg','',212600,'263336f2505b5c6be6e744d6208afa1b','57408d75d13f2b5854cd2a3580c34f383b482f61',0,'',1446696284),(239,'corel.png','567cfcce2f57d.png','task/2015-12/','png','image/png',10581,'13611624e466155c492a23b97d6be76b','85d5f9947ef18701e6b3a432ca6a9f7828659bc3',0,'',1451031757),(240,'paint.png','567cfcee153b5.png','task/2015-12/','png','image/png',7023,'05730ee494da5e9bc3636370d4538567','bf705f7468a070a1115374b80e0707cd86872a36',0,'',1451031789),(241,'fallout.png','567cfd3407580.png','task/2015-12/','png','image/png',5366,'45cda10c71ece33e0524a7732ccf4109','bd33e9d68ca294ce9050786b3d2d25ec762cb8be',0,'',1451031859),(242,'clock.png','567cfd4ada984.png','task/2015-12/','png','image/png',9740,'c137932b12e39466fd05b71e9a7c583a','64c43cb2e2914dd08e6007290a15efc824904456',0,'',1451031882),(243,'user.xls','567cff0b21291.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',30208,'721be5983e81b5496125ce2f6eae389e','97cd12abf0c0be5e930fa7065c55b85df1b4fb3b',0,'',1451032330),(244,'user.xls','567cff85f2654.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',30208,'721be5983e81b5496125ce2f6eae389e','97cd12abf0c0be5e930fa7065c55b85df1b4fb3b',0,'',1451032453),(245,'paint.png','567cffeb8706e.png','form/2015-12/','png','image/png',7023,'05730ee494da5e9bc3636370d4538567','bf705f7468a070a1115374b80e0707cd86872a36',0,'',1451032555),(246,'network-places.png','567cfffa4dad4.png','form/2015-12/','png','image/png',12650,'0a91632b22c36fabfa5920a43a176882','b31bdbafc1d2f8e55d4533e2948a850f380a83fb',0,'',1451032569),(247,'user.xls','567cfff4dcc04.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',30208,'721be5983e81b5496125ce2f6eae389e','97cd12abf0c0be5e930fa7065c55b85df1b4fb3b',0,'',1451032564),(248,'network-places.png','567d004f30304.png','form/2015-12/','png','image/png',12650,'0a91632b22c36fabfa5920a43a176882','b31bdbafc1d2f8e55d4533e2948a850f380a83fb',0,'',1451032654),(249,'user.xls','567d03e5a929f.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'b3b3555bda116c66a13a2704cf03fe85','a17fa9ebfd1ebe1891aac97fdea44530e1e57ba5',0,'',1451033573),(250,'��ʾ�ĸ�1.pptx','567d07475caeb.pptx','task/2015-12/','pptx','',3037329,'435c26f98d1d8a950095c75bd53f116c','a72ed138882545c1ec567ff7b99901e6571d597d',0,'',1451034439),(251,'user - ����.xls','567d0755655ec.xls','crmcontact/2015-12/','xls','application/vnd.ms-office',11264,'48f6a7e2661463d158711c9427b3ed66','2658e0a8b840c35b4eea130bfdad3fd135c62acc',0,'',1451034453),(252,'��ʾ�ĸ�1.pptx','567d076f1f31a.pptx','task/2015-12/','pptx','',3037329,'435c26f98d1d8a950095c75bd53f116c','a72ed138882545c1ec567ff7b99901e6571d597d',0,'',1451034478),(253,'�½� Microsoft Excel ������.xls','567d07d9cb512.xls','crmcontact/2015-12/','xls','application/vnd.ms-office',7680,'4f14e65872b0fb5660a3a43cb309ffca','427c624e4ff2d9f89337a6055759c83f6a00bbb7',0,'',1451034585),(254,'��ʾ�ĸ�1.pptx','567d08e1ee22c.pptx','task/2015-12/','pptx','',3037329,'435c26f98d1d8a950095c75bd53f116c','a72ed138882545c1ec567ff7b99901e6571d597d',0,'',1451034849),(255,'��ʾ�ĸ�1.pptx','567d0a9c3480f.pptx','form/2015-12/','pptx','',3037329,'435c26f98d1d8a950095c75bd53f116c','a72ed138882545c1ec567ff7b99901e6571d597d',0,'',1451035291),(256,'��ʾ�ĸ�1.pptx','567d0ac17705d.pptx','form/2015-12/','pptx','',3037329,'435c26f98d1d8a950095c75bd53f116c','a72ed138882545c1ec567ff7b99901e6571d597d',0,'',1451035329),(257,'user.xls','5680e9932a2d8.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451288978),(258,'user.xls','5680e9b1e9c51.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451289009),(259,'user.xls','5680e9e3cde6e.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451289059),(260,'user.xls','5680e9ecdd2a5.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451289068),(261,'user.xls','5680e9f403fab.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451289075),(262,'user.xls','5680ea0d1a8bf.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451289100),(263,'user.xls','5680eb08c02ba.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451289352),(264,'user.xls','5680eb19c4507.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451289369),(265,'user.xls','5681f0fb19f8a.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451356410),(266,'user - ����.xls','5681f11a9dc26.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11264,'48f6a7e2661463d158711c9427b3ed66','2658e0a8b840c35b4eea130bfdad3fd135c62acc',0,'',1451356442),(267,'user - ����.xls','5681f18e6c59d.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11264,'48f6a7e2661463d158711c9427b3ed66','2658e0a8b840c35b4eea130bfdad3fd135c62acc',0,'',1451356558),(268,'user.xls','5681f1988c799.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451356568),(269,'user.xls','5681f1ed1412a.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451356652),(270,'user.xls','5681f20096b78.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451356672),(271,'user.xls','5681f20ec5ca4.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451356686),(272,'user.xls','5681f227cb05b.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451356711),(273,'user.xls','5681f43543898.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451357237),(274,'user.xls','5681f81b22d73.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451358234),(275,'user.xls','5681f85710257.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451358294),(276,'user.xls','56820665f16ae.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451361888),(277,'user.xls','5682067b4d2a2.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451361914),(278,'user.xls','568206e63b206.xls','crmcontact/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451362022),(279,'user.xls','568206f8855b4.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'aa7f9279418cca95343d4facc283f68e','2c32949cfd2f3428809342244ff20b1535e865ab',0,'',1451362040),(280,'user.xls','5682072fba9e3.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'be0a437f9934d662f0f86eefaa199bf5','ccdbf6c2af905b0a0931ebf4b667fd7e4d6013be',0,'',1451362095),(281,'user.xls','56820a64792ca.xls','crmcompany/2015-12/','xls','application/vnd.ms-office',11776,'be0a437f9934d662f0f86eefaa199bf5','ccdbf6c2af905b0a0931ebf4b667fd7e4d6013be',0,'',1451362916);

#
# Structure for table "think_finance"
#

DROP TABLE IF EXISTS `think_finance`;
CREATE TABLE `think_finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(10) DEFAULT NULL COMMENT '���ݱ��',
  `remark` varchar(255) DEFAULT NULL,
  `input_date` date DEFAULT NULL COMMENT '¼������',
  `account_id` int(11) DEFAULT NULL COMMENT '�ʺ�ID',
  `account_name` varchar(20) DEFAULT NULL COMMENT '�ʺ���',
  `income` int(11) DEFAULT NULL COMMENT '����',
  `payment` int(11) DEFAULT NULL COMMENT '֧��',
  `amount` int(11) DEFAULT NULL COMMENT '�ϼ�',
  `type` varchar(20) DEFAULT NULL COMMENT '����',
  `partner` varchar(50) DEFAULT NULL COMMENT '������',
  `actor_name` varchar(10) DEFAULT NULL COMMENT '������',
  `user_id` int(11) DEFAULT NULL COMMENT '��½��',
  `user_name` varchar(10) DEFAULT NULL COMMENT '��¼��',
  `create_time` int(11) DEFAULT NULL COMMENT '��������',
  `update_time` int(11) DEFAULT NULL COMMENT '��������',
  `add_file` varchar(255) DEFAULT NULL COMMENT '����',
  `doc_type` tinyint(3) DEFAULT NULL COMMENT '����',
  `is_del` tinyint(3) DEFAULT '0' COMMENT 'ɾ�����',
  `related_account_id` int(11) DEFAULT NULL COMMENT '����ʺ�ID',
  `related_account_name` varchar(20) DEFAULT NULL COMMENT '����ʺ�����',
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
  `name` varchar(20) DEFAULT NULL COMMENT '�ʺ�����',
  `bank` varchar(20) DEFAULT NULL COMMENT '����',
  `no` varchar(50) DEFAULT NULL COMMENT '�����ʺ�',
  `init` int(11) DEFAULT NULL COMMENT '��ʼ�ʺ�',
  `balance` int(11) DEFAULT NULL COMMENT '���',
  `remark` varchar(200) DEFAULT NULL COMMENT '��ע',
  `is_del` tinyint(3) DEFAULT '0' COMMENT 'ɾ�����',
  `create_time` int(11) DEFAULT NULL COMMENT '����ʱ��',
  `update_time` int(11) DEFAULT NULL COMMENT '����ʱ��',
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
  `doc_no` varchar(20) NOT NULL DEFAULT '' COMMENT '�ĵ����',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `content` text COMMENT '����',
  `confirm` varchar(200) NOT NULL DEFAULT '' COMMENT '�þ�����',
  `confirm_name` text NOT NULL COMMENT '�þ���ʾ����',
  `consult` varchar(200) NOT NULL DEFAULT '' COMMENT 'Э������',
  `consult_name` text NOT NULL COMMENT 'Э����ʾ����',
  `refer` varchar(200) DEFAULT '' COMMENT '��������',
  `refer_name` text COMMENT '������ʾ����',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '��������',
  `add_file` varchar(200) NOT NULL DEFAULT '' COMMENT '����',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `emp_no` varchar(20) DEFAULT NULL COMMENT 'Ա�����',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '�û�����',
  `dept_id` int(11) NOT NULL DEFAULT '0' COMMENT '����ID',
  `dept_name` varchar(20) NOT NULL DEFAULT '' COMMENT '��������',
  `create_date` varchar(10) NOT NULL DEFAULT '' COMMENT '��������',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `step` int(11) NOT NULL DEFAULT '0' COMMENT 'Ŀǰ�׶�״̬',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
  `udf_data` text COMMENT '�û��Զ�������',
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
  `flow_id` int(11) NOT NULL DEFAULT '0' COMMENT '����ID',
  `emp_no` varchar(20) NOT NULL DEFAULT '' COMMENT 'Ա�����',
  `user_id` int(11) DEFAULT NULL COMMENT '�û�ID',
  `user_name` varchar(20) DEFAULT '' COMMENT '�û�����',
  `step` int(11) NOT NULL DEFAULT '0' COMMENT '��ǰ����',
  `result` int(11) DEFAULT NULL COMMENT '�������',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `comment` text COMMENT '���',
  `is_read` tinyint(3) NOT NULL DEFAULT '0' COMMENT '�Ѷ�',
  `from` varchar(20) DEFAULT NULL COMMENT '������',
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
  `tag` varchar(20) NOT NULL DEFAULT '' COMMENT '����',
  `doc_no_format` varchar(50) NOT NULL DEFAULT '' COMMENT '�ĵ������ʽ',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `short` varchar(20) NOT NULL DEFAULT '' COMMENT '���',
  `content` text NOT NULL COMMENT '����',
  `confirm` varchar(100) NOT NULL DEFAULT '' COMMENT '�þ�����',
  `confirm_name` text NOT NULL COMMENT '�þ���ʾ����',
  `consult` varchar(100) NOT NULL DEFAULT '' COMMENT 'Э������',
  `consult_name` text NOT NULL COMMENT 'Э����ʾ����',
  `refer` varchar(100) NOT NULL DEFAULT '' COMMENT '��������',
  `refer_name` text NOT NULL COMMENT '������ʾ����',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '����',
  `is_edit` tinyint(3) NOT NULL DEFAULT '0' COMMENT '�ɱ༭���',
  `is_lock` tinyint(3) NOT NULL DEFAULT '0' COMMENT '�������',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
  `request_duty` int(11) DEFAULT NULL COMMENT '����Ȩ��',
  `report_duty` int(11) DEFAULT NULL COMMENT '����Ȩ��',
  `udf_tpl` varchar(20) DEFAULT NULL,
  `is_show` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

#
# Data for table "think_flow_type"
#

INSERT INTO `think_flow_type` VALUES (19,'72','{YYYY}-{M}-{D}','�д����ñ�����','�д�','<table border=\"1\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t��????��\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\tְ��\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t�д�����\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"9\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td rowspan=\"11\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t����\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t��\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t��???��\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"10\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t�д�����\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t�д�����\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t����???�ˣ���ͬ???��\r\n\t\t\t\t</p>%0','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"�����/�ܾ���<>\">�����/�ܾ���&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"������/����<>\">������/����&lt;&gt;</b><a title=\"ɾ��\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1391698060,1432191286,1,1,0,0,14,14,NULL,NULL),(33,'69','{YYYY}-{M}-{D}','��ְ���뵥','LZ','<p>\r\n\t<br />\r\n</p>','dp_23_2|dp_6_4|dp_23_1|dp_1_5|dp_24_2|','<span id=\"dp_23_2\" data=\"dp_23_2\"><nobr><b title=\"���¿�-����\">���¿�-����</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span id=\"dp_6_4\" data=\"dp_6_4\"><nobr><b title=\"����-����\">����-����</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span id=\"dp_23_1\" data=\"dp_23_1\"><nobr><b title=\"���¿�-����\">���¿�-����</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span id=\"dp_1_5\" data=\"dp_1_5\"><nobr><b title=\"С΢��ҵ-�ܾ���\">С΢��ҵ-�ܾ���</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span id=\"dp_24_2\" data=\"dp_24_2\"><nobr><b title=\"�����-����\">�����-����</b></nobr></span>','','','','',1399709992,1435896413,0,0,1,0,14,16,'',1),(34,'82','{YYYY}-{M}-{D}','������ٵ�','QJ','���������ʽ','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"�����/�ܾ���<>\">�����/�ܾ���&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"������/����<>\">������/����&lt;&gt;</b><a title=\"ɾ��\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1401288825,1428632816,1,10,1,0,14,14,NULL,NULL),(35,'82','{YYYY}-{M}-{D}','��н���뵥','TX','<p>\r\n\t��н����\r\n</p>','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"�����/�ܾ���<>\">�����/�ܾ���&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"������/����<>\">������/����&lt;&gt;</b><a title=\"ɾ��\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1408251287,1428633864,3,10,0,0,15,14,NULL,NULL),(36,'82','{YYYY}-{M}-{D}','�������','WC','<p>\r\n\t�������Ŀ�ģ�\r\n</p>\r\n<p>\r\n\t����������ɣ�\r\n</p>','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"�����/�ܾ���<>\">�����/�ܾ���&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"������/����<>\">������/����&lt;&gt;</b><a title=\"ɾ��\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1412777631,1428641269,2,11,0,0,14,14,NULL,NULL),(37,'69','20150312601','ϵͳ�������','��Ӫά����','�ú�ʹ��xxxxxxxxxxxxxx?','emp_1002|emp_1001|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"���/����<>\">���/����&lt;&gt;</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"�ܾ���1001/�ܾ���<>\">�ܾ���1001/�ܾ���&lt;&gt;</b></nobr></span>','','','','',1426127753,1432707586,0,1,0,0,14,14,'',1),(38,'82','{YYYY}-{M}-{D}','��ְ���뵥','��ְ','��ְ','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"�����/�ܾ���<>\">�����/�ܾ���&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"������/����<>\">������/����&lt;&gt;</b><a title=\"ɾ��\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1427940431,1428633879,4,11,0,0,14,14,NULL,NULL),(39,'71','{YYYY}-{M}-{D}','ԭ���ϲɹ����뵥','�ɹ�','�ɹ����뵥','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"�����/�ܾ���<>\">�����/�ܾ���&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"������/����<>\">������/����&lt;&gt;</b><a title=\"ɾ��\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1427942142,1430806363,1,1,0,0,14,14,NULL,NULL),(40,'88','{YYYY}-{M}-{D}','������ٵ�','������ٵ�','�۷�ʱ��','','','','','','',1428649355,1430715743,1,1,0,0,20,17,NULL,NULL),(41,'88','{YYYY}-{M}-{D}','��������','����','��������','','','','','','',1430201444,1430709554,2,1,0,0,20,18,NULL,NULL),(42,'70','{YYYY}-{M}-{D}','�칫��Ʒ����','�칫��Ʒ','�칫��Ʒ����','','','','','','',1430202319,1432191240,3,1,0,0,14,14,NULL,NULL),(43,'80','{YYYY}-{M}-{D}','�γ�ʹ������','�γ�','�γ�ʹ������','','','','','','',1430203160,1432191262,0,1,0,0,14,14,NULL,NULL),(44,'88','{YYYY}-{M}-{D}','��ְ���뵥','��ְ����','<p>\r\n\t<br />\r\n</p>','dgp_16_2|dgp_18_8|','<span id=\"dgp_16_2\" data=\"dgp_16_2\"><nobr><b title=\"��-����\">��-����</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span id=\"dgp_18_8\" data=\"dgp_18_8\"><nobr><b title=\"��-����\">��-����</b></nobr></span>','emp_2001|','<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"����/����<>\">����/����&lt;&gt;</b></nobr></span>','','',1430285006,1430707786,4,1,1,0,20,17,NULL,NULL),(45,'72','{YYYY}-{M}-{D}','���÷��ñ�������','���ñ���','������ñ�������','','','','','','',1430286645,1432191277,2,1,0,0,14,14,NULL,NULL),(46,'70','{YYYY}-{M}-{D}','ͨѶ���ñ�������','ͨѶ�ѱ���','ͨѶ���ñ���','','','','','','',1430286713,1432191250,4,1,0,0,14,14,NULL,NULL),(47,'70','{YYYY}-{M}-{D}','��ͨ���ñ�������','��ͨ�ѱ���','��ͨ���ñ�������','','','','','','',1430286784,1432191325,5,11,0,0,14,14,NULL,NULL),(48,'70','{YYYY}-{M}-{D}','�ͷѱ�������','�ͷѱ���','�ͷѱ�������','','','','','','',1430286877,1432191310,6,1,0,0,14,14,NULL,NULL),(49,'70','{YYYY}-{M}-{D}','������ʹ������','������ʹ������','������ʹ�����뵥','','','','','','',1430286961,1432191227,2,1,0,0,14,14,NULL,NULL),(50,'70','{YYYY}-{M}-{D}','��ƱԤ������','��ƱԤ������','��ƱԤ������','','','','','','',1430287073,1432191212,1,1,0,0,14,14,NULL,NULL),(51,'71','{YYYY}-{M}-{D}','�豸�ɹ�����','�豸�ɹ�','�豸�ɹ����뵥','','','','','','',1430287359,1430795702,3,1,0,0,14,17,NULL,NULL),(52,'71','{YYYY}-{M}-{D}','�������ϲɹ����뵥','��������','���Ĳɹ����뵥','','','','','','',1430287428,1430804969,2,1,0,0,14,17,NULL,NULL),(53,'71','{YYYY}-{M}-{D}','�����豸�ɹ�����','�豸����ɹ�����','�����豸�ɹ�����','','','','','','',1430287546,1430795115,4,1,0,0,14,17,NULL,NULL),(54,'88','{YYYY}-{M}-{D}','Ա����ѵ/��������','��ѵ����','Ա����ѵ��������','','','','','','',1430288450,1430708546,3,1,0,0,18,17,NULL,NULL),(55,'72','{YYYY}-{M}-{D}','���Ԥ������','���Ԥ������','���Ԥ������','','','','','','',1430289142,1432191269,3,1,0,0,14,14,NULL,NULL),(56,'71','{DEPT}{####}','�������뵥','�������뵥','2','dgp_16_2|dgp_18_3|','<span data=\"dgp_16_2\" id=\"dgp_16_2\"><nobr><b title=\"��-����\">��-����</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"dgp_18_3\" id=\"dgp_18_3\"><nobr><b title=\"��-�ܼ�\">��-�ܼ�</b></nobr></span>','dp_21_2|dp_21_3|','<span data=\"dp_21_2\" id=\"dp_21_2\"><nobr><b title=\"�ɹ���-����\">�ɹ���-����</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"dp_21_3\" id=\"dp_21_3\"><nobr><b title=\"�ɹ���-�ܼ�\">�ɹ���-�ܼ�</b></nobr></span>','','',1439969612,1439970190,0,0,0,0,14,14,'',0),(57,'72','####','����','����','<p>���</p>','dept_7|emp_2|emp_3|emp_1|','<span data=\"dept_7\" id=\"dept_7\"><nobr><b title=\"���۲�\">���۲�</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"emp_2\" id=\"emp_2\"><nobr><b title=\"2/����<>\">2/����&lt;&gt;</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"emp_3\" id=\"emp_3\"><nobr><b title=\"3/�ܼ�<>\">3/�ܼ�&lt;&gt;</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"emp_1\" id=\"emp_1\"><nobr><b title=\"1/�ܾ���<123>\">1/�ܾ���&lt;123&gt;</b></nobr><b><i class=\"fa\"></i></b></span>','dp_7_5|emp_5|','<span data=\"dp_7_5\" id=\"dp_7_5\"><nobr><b title=\"���۲�-�ܾ���\">���۲�-�ܾ���</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"emp_5\" id=\"emp_5\"><nobr><b title=\"5/����<>\">5/����&lt;&gt;</b></nobr><b><i class=\"fa\"></i></b></span>','','',1451281563,1451284501,0,0,1,0,14,14,'',1);

#
# Structure for table "think_form"
#

DROP TABLE IF EXISTS `think_form`;
CREATE TABLE `think_form` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(20) NOT NULL DEFAULT '' COMMENT '�ĵ����',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `content` text NOT NULL COMMENT '����',
  `folder` int(11) NOT NULL DEFAULT '0' COMMENT '�ļ���',
  `add_file` varchar(200) NOT NULL DEFAULT '' COMMENT '����',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '�û�����',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
  `udf_data` text COMMENT '�Զ����ֶ�����',
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
  `title` varchar(50) DEFAULT NULL COMMENT '����',
  `doc_no` varchar(50) DEFAULT NULL COMMENT '�ļ����',
  `doc_type` tinyint(3) DEFAULT '0' COMMENT '�ĵ�����(0:һ���ļ���1����ͨ�ļ�)',
  `create_time` int(11) DEFAULT NULL COMMENT '����ʱ��',
  `add_file` varchar(255) DEFAULT NULL COMMENT '����',
  `suggestion` text COMMENT '���*',
  `finish_time` int(11) DEFAULT NULL COMMENT '���ʱ��',
  `is_save` tinyint(3) DEFAULT '0' COMMENT '����',
  `is_agent` tinyint(3) DEFAULT '0' COMMENT '��ִ',
  `is_read` tinyint(3) DEFAULT '0' COMMENT '����(�ĵ�����õ�)',
  `is_over` tinyint(3) DEFAULT '0' COMMENT '���',
  `is_del` tinyint(3) DEFAULT '0' COMMENT 'ɾ��',
  `issuer` varchar(50) DEFAULT NULL COMMENT '������',
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
  `user_id` int(11) DEFAULT NULL COMMENT '�û�id',
  `set_auth` varchar(50) DEFAULT NULL COMMENT 'Ȩ������'
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
  `user_id` int(11) DEFAULT NULL COMMENT '�����˵��û�id',
  `type` tinyint(3) DEFAULT '0' COMMENT '���',
  `remarks` text COMMENT '����',
  `state` tinyint(3) DEFAULT '0' COMMENT '��ʾ',
  `pishiren_id` int(11) DEFAULT NULL COMMENT '��ʾ��id',
  `pishiren_qianming` varchar(50) DEFAULT NULL COMMENT '��ʾ��ǩ��',
  `shenpi_time` int(11) DEFAULT NULL COMMENT '����ʱ��',
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
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `is_public` tinyint(3) DEFAULT NULL COMMENT '�Ƿ񹫿�',
  `remark` text COMMENT '��ע',
  `user_id` int(11) DEFAULT NULL COMMENT '��½��ID',
  `user_name` varchar(20) DEFAULT NULL COMMENT '��¼�û�����',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
  `sort` varchar(10) DEFAULT NULL COMMENT '����',
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
  `doc_no` varchar(20) NOT NULL DEFAULT '' COMMENT '�ĵ����',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `content` text NOT NULL COMMENT '����',
  `folder` int(11) NOT NULL DEFAULT '0' COMMENT '����',
  `is_sign` tinyint(3) DEFAULT '0' COMMENT '�Ƿ���Ҫǩ��',
  `is_public` tinyint(3) DEFAULT NULL COMMENT '�Ƿ񹫿�',
  `scope_user_id` text COMMENT '������ΧID',
  `scope_user_name` text COMMENT '������Χ����',
  `add_file` varchar(200) NOT NULL DEFAULT '' COMMENT '����',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '��½��ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '��½������',
  `dept_id` int(11) DEFAULT NULL COMMENT '����ID',
  `dept_name` varchar(20) DEFAULT NULL COMMENT '��������',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
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
  `info_id` int(11) NOT NULL DEFAULT '0' COMMENT '��ϢID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '��¼�û�ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '��¼�û�����',
  `is_sign` tinyint(3) NOT NULL DEFAULT '0' COMMENT '�Ƿ�ǩ��',
  `sign_time` int(11) unsigned DEFAULT NULL COMMENT 'ǩ��ʱ��',
  `dept_id` int(11) DEFAULT NULL COMMENT '����ID',
  `dept_name` varchar(20) DEFAULT NULL COMMENT '��������',
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
  `folder` int(11) NOT NULL DEFAULT '0' COMMENT '�ļ���',
  `mid` varchar(200) DEFAULT NULL COMMENT '�ʼ�Ψһid',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `content` text NOT NULL COMMENT '����',
  `add_file` varchar(200) DEFAULT NULL COMMENT '����',
  `from` varchar(255) DEFAULT NULL COMMENT '������',
  `to` varchar(255) DEFAULT NULL COMMENT '�ռ���',
  `reply_to` varchar(255) DEFAULT NULL COMMENT '�ظ���',
  `cc` varchar(255) DEFAULT NULL COMMENT '����',
  `read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ѷ�',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '�û�����',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
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
  `email` varchar(50) DEFAULT NULL COMMENT '�ʼ���ַ',
  `mail_name` varchar(50) NOT NULL DEFAULT '' COMMENT '�ʼ���ʾ����',
  `pop3svr` varchar(50) NOT NULL DEFAULT '' COMMENT 'pop������',
  `smtpsvr` varchar(50) NOT NULL DEFAULT '' COMMENT 'smtp������',
  `mail_id` varchar(50) NOT NULL DEFAULT '' COMMENT '�ʼ�ID',
  `mail_pwd` varchar(50) NOT NULL DEFAULT '' COMMENT '�ʼ�����',
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
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '����',
  `sender_check` int(11) NOT NULL DEFAULT '0' COMMENT '�Ƿ�ȷ�Ϸ�����',
  `sender_option` int(11) NOT NULL DEFAULT '0' COMMENT '������ѡ��',
  `sender_key` varchar(50) NOT NULL DEFAULT '' COMMENT 'ȷ�Ϸ�����ֵ',
  `domain_check` int(11) NOT NULL DEFAULT '0' COMMENT '�Ƿ�ȷ������',
  `domain_option` int(11) NOT NULL DEFAULT '0' COMMENT '����ѡ��',
  `domain_key` varchar(50) NOT NULL DEFAULT '' COMMENT 'ȷ������ֵ',
  `recever_check` int(11) NOT NULL DEFAULT '0' COMMENT '�Ƿ�ȷ���ռ���',
  `recever_option` int(11) NOT NULL DEFAULT '0' COMMENT '�ռ���ѡ��',
  `recever_key` varchar(50) NOT NULL DEFAULT '' COMMENT 'ȷ��������ֵ',
  `title_check` int(11) NOT NULL DEFAULT '0' COMMENT '�Ƿ�ȷ�ϱ���',
  `title_option` int(11) NOT NULL DEFAULT '0' COMMENT 'ȷ�ϱ���ѡ��',
  `title_key` varchar(50) NOT NULL DEFAULT '' COMMENT 'ȷ�ϱ���ֵ',
  `to` int(11) NOT NULL DEFAULT '0' COMMENT '�ƶ���',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
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
  `content` text COMMENT '����',
  `add_file` varchar(200) DEFAULT NULL COMMENT '����',
  `sender_id` int(11) DEFAULT NULL COMMENT '������',
  `sender_name` varchar(20) DEFAULT NULL COMMENT '����������',
  `receiver_id` int(11) DEFAULT NULL COMMENT '������',
  `receiver_name` varchar(20) DEFAULT NULL COMMENT '����������',
  `create_time` int(11) DEFAULT '0' COMMENT '����ʱ��',
  `owner_id` int(11) DEFAULT NULL COMMENT 'ӵ����',
  `is_del` tinyint(3) DEFAULT '0' COMMENT 'ɾ�����',
  `is_read` tinyint(3) DEFAULT '0' COMMENT '�Ƿ��Ѷ�',
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
  `name` varchar(50) DEFAULT NULL COMMENT '����',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT 'URL��ַ',
  `icon` varchar(255) DEFAULT NULL COMMENT 'ͼ��',
  `sub_folder` varchar(20) DEFAULT NULL COMMENT '���ļ���',
  `remark` varchar(255) DEFAULT NULL COMMENT '��ע',
  `sort` varchar(20) DEFAULT NULL COMMENT '����',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '��ID',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
  `badge_function` varchar(50) DEFAULT NULL COMMENT 'ͳ�ƺ���',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`is_del`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8;

#
# Data for table "think_node"
#

INSERT INTO `think_node` VALUES (84,'����','System/index','fa fa-cogs','','','999',0,0,''),(85,'�ʼ�','Mail/index','fa fa-envelope-o bc-mail','','','11',0,0,'badge_sum'),(87,'����','Flow/index','fa fa-pencil bc-flow','','','2',0,0,'badge_sum'),(88,'��Ϣ','Info/index##','fa fa-file-o','InfoFolder','','4',0,0,'badge_sum'),(91,'�ճ�','Schedule/index','fa fa-calendar bc-personal-schedule','','','9',198,0,'badge_count_schedule'),(94,'ְλ','Position/index',NULL,NULL,'','',1,0,NULL),(100,'д��','Mail/add',NULL,'','','1',85,0,NULL),(101,'�ռ���','Mail/folder?fid=inbox','bc-mail-inbox','','','3',85,0,'badge_count_mail_inbox'),(102,'�ʼ�����','',NULL,NULL,NULL,'9',85,0,NULL),(104,'������','Mail/folder?fid=spambox','','','','5',85,0,NULL),(105,'������','Mail/folder?fid=outbox','','','','6',85,0,NULL),(106,'��ɾ��','Mail/folder?fid=delbox','','','','4',85,0,NULL),(107,'�ݸ���','Mail/folder?fid=darftbox','','','','7',85,0,NULL),(108,'�ʼ��ʻ�����','MailAccount/index',NULL,'','','1',102,0,NULL),(110,'��˾��Ϣ����','',NULL,NULL,'','1',84,0,NULL),(112,'Ȩ�޹���','',NULL,NULL,'','3',84,0,NULL),(113,'ϵͳ�趨','',NULL,NULL,'','4',84,0,NULL),(114,'ϵͳ��������','SystemConfig/index','','','','2',113,0,''),(115,'��֯ͼ','Dept/index','','','','1',110,0,NULL),(116,'Ա���Ǽ�','User/index',NULL,'','','5',110,0,NULL),(118,'Ȩ�������','Role/index','','','','1',112,0,NULL),(119,'Ȩ������','Role/node','','','','2',112,0,NULL),(120,'Ȩ�޷���','Role/user','','','','3',112,0,NULL),(121,'�˵�����','Node/index','','','','1',113,0,NULL),(123,'ְλ','Position/index',NULL,'','','2',110,0,NULL),(124,'�ļ�������','Mail/folder_manage','','','','2',102,0,''),(125,'��ϵ��','Contact/index','','','','1',198,0,NULL),(126,'��Ϣ����','Info/index','','','','1',88,0,NULL),(143,'�ʼ�����','MailOrganize/index',NULL,'','','',102,0,NULL),(144,'����','Flow/index','','','','1',87,0,NULL),(146,'���̹���','FlowType/index','','','','9',87,0,NULL),(147,'������','Flow/folder?fid=confirm','bc-flow-confirm','','','4',87,0,'badge_count_flow_todo'),(148,'������','Flow/folder?fid=finish','','','','5',87,0,''),(149,'�ݸ���','Flow/folder?fid=darft','','','','2',87,0,''),(150,'���ύ','Flow/folder?fid=submit','','','','3',87,0,''),(152,'����','Todo/index','fa fa-tasks bc-personal-todo','','','9',198,0,'badge_count_todo'),(153,'���ż���','DeptGrade/index','','','','4',110,0,NULL),(156,'�ͻ�','Customer/index',NULL,'','','2',157,0,NULL),(157,'ͨѶ¼','Staff/index','fa fa-group','','','7',0,0,'badge_sum'),(158,'��Ӧ��','Supplier/index',NULL,'','','3',157,0,NULL),(169,'ְԱ','Staff/index',NULL,'','','',157,0,NULL),(177,'�ҵ��ļ���','##mail','bc-mail-myfolder','MailFolder','','8',85,0,'badge_count_mail_user_folder'),(184,'���̷���','FlowType/tag_manage','','','','8',87,0,NULL),(185,'��������','Flow/folder?fid=report','bc-flow-receive','','','6',87,0,''),(189,'��Ϣ����','Info/folder_manage','','','','C1',88,0,''),(190,'��Ϣ','Message/index','fa fa-inbox bc-message','','','1',198,0,'badge_count_message'),(191,'�û�����','','','','','99',198,0,''),(192,'�û�����','Profile/index','','','','',191,0,NULL),(193,'�޸�����','Profile/password','','','','',191,0,NULL),(194,'�û�����','UserConfig/index','','','','999',191,0,NULL),(198,'����','Contact/index','fa fa-user bc-personal','','','9',0,0,'badge_sum'),(205,'ҵ���ɫ����','Duty/index','','','','4',112,0,''),(206,'ҵ��Ȩ�޷���','Role/duty','','','','5',112,0,''),(214,'����','Finance/index','fa fa-jpy','','','3',217,0,''),(216,'�ձ�','WorkLog/index','fa fa-book','','','1',217,0,''),(217,'����','WorkLog/index','fa fa-book','','','6',0,0,'badge_sum'),(219,'�ҵ���Ϣ','Info/my_info','','','','B1',88,0,NULL),(220,'�ҵ�ǩ��','Info/my_sign','','','','B2',88,0,NULL),(221,'�ĵ�','Doc/index##','fa fa-inbox','DocFolder','','41',0,0,'badge_sum'),(222,'�ĵ�����','Doc/folder_manage','fa fa-inbox','','','4',221,0,'badge_sum'),(226,'����','Form/index##','fa fa-table','FormFolder','','5',0,0,'badge_sum'),(227,'�������','Form/folder_manage','fa fa-inbox','','','4',226,0,'badge_sum'),(228,'�����ֶ�����','Form/field_type','fa fa-inbox','','','5',226,0,'badge_sum'),(229,'Ⱥ��','Group/index','fa fa-group','','','7',157,0,'badge_sum'),(230,'���ڲ鿴','Sign/index','fa fa-book','','','4',235,0,'badge_sum'),(231,'����ͳ��','Sign/report','fa fa-book','','','5',235,0,'badge_sum'),(234,'������','Flow/folder?fid=receive','bc-flow-receive','','','6',87,0,'badge_count_flow_receive'),(235,'��ҵ','Sign/index','fa fa-home','','','1',0,0,''),(242,'CRM','CrmContact/index','fa fa-line-chart','','','0',0,0,''),(244,'��˾�Զ����ֶι���','CrmCompany/company_field_manage','fa fa-line-chart','','','0',247,0,''),(245,'�ͻ��Զ����ֶι���','CrmContact/contact_field_manage','fa fa-line-chart','','','0',247,0,''),(246,'�ͻ�','CrmContact/index','fa fa-line-chart','','','1',242,0,''),(247,'����','','','','','3',242,0,''),(248,'��Ʒ','Product/index##','','ProductFolder','','4',242,0,''),(249,'��Ʒ����','Product/folder_manage','','','','5',242,0,''),(250,'��Ʒ�Զ�������','Product/field_type','','','','6',242,0,''),(252,'����','Task/index','','','','2',217,0,'badge_count_task'),(253,'���ʲ�ѯ','UdfSalary/index','','',NULL,'',235,0,''),(255,'����','GovDoc/index','fa fa-suitcase','',NULL,'',0,0,'badge_count_gov_doc'),(256,'����','GovDoc/index','','',NULL,'',255,0,''),(257,'Ȩ������','GovDocAuth/index','','',NULL,'',255,0,''),(258,'��˾','CrmCompany/index','fa fa-line-chart','','','0',242,0,'');

#
# Structure for table "think_position"
#

DROP TABLE IF EXISTS `think_position`;
CREATE TABLE `think_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_no` varchar(10) NOT NULL DEFAULT '' COMMENT '���',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `sort` varchar(10) NOT NULL DEFAULT '' COMMENT '����',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "think_position"
#

INSERT INTO `think_position` VALUES (1,'011','����','5',0),(2,'04','����','4',0),(3,'03','�ܼ�','3',0),(4,'02','����','2',0),(5,'01','�ܾ���','1',0),(6,'06','����','6',0);

#
# Structure for table "think_product"
#

DROP TABLE IF EXISTS `think_product`;
CREATE TABLE `think_product` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(20) NOT NULL DEFAULT '' COMMENT '�ĵ����',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `content` text NOT NULL COMMENT '����',
  `folder` int(11) NOT NULL DEFAULT '0' COMMENT '�ļ���',
  `add_file` varchar(200) NOT NULL DEFAULT '' COMMENT '����',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '�û�����',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
  `udf_data` text COMMENT '�Զ����ֶ�����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

#
# Data for table "think_product"
#

INSERT INTO `think_product` VALUES (97,'2015-0001','BBBBBBBBB','<p>BBBBBBBBBBBBBBBBBBBB</p>',79,'',1,'����Ա',1441096153,0,1,NULL),(98,'2015-0002','BBBBBBBB','<p>BBBBBBBBBBBBBBBBBBBBB</p>',79,'',1,'����Ա',1441096175,0,1,NULL),(99,'2015-0003','BBBBBBBBBBBB','<p>BBBBBBBBBBBBBBBBBBBBBBBB</p>',79,'',1,'����Ա',1441096185,0,1,NULL),(100,'XM-001','С���ֻ�4','<p>XM-001</p>',79,'',1,'����Ա',1441157763,0,0,NULL),(101,'01','25825','<p>32</p>',81,'',1,'����Ա',1441796567,0,0,NULL);

#
# Structure for table "think_push"
#

DROP TABLE IF EXISTS `think_push`;
CREATE TABLE `think_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `data` text NOT NULL,
  `status` int(11) DEFAULT '0',
  `time` int(11) DEFAULT '0',
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3218 DEFAULT CHARSET=utf8;

#
# Data for table "think_push"
#

INSERT INTO `think_push` VALUES (3188,42,'{\"type\":\"ǩ��\",\"action\":\"\",\"title\":\"11111111111111\",\"content\":\"�����ˣ�С΢��ҵ-����Ա\",\"url\":\"\\/index.php?m=&c=GovDoc&a=index&return_url=GovDoc%2Findex\"}',0,1446696291,NULL),(3190,42,'{\"type\":\"ǩ��\",\"action\":\"\",\"title\":\"11111111111111\",\"content\":\"�����ˣ�С΢��ҵ-����Ա\",\"url\":\"\\/xiaowei\\/index.php?m=&c=GovDoc&a=index&return_url=GovDoc%2Findex\"}',0,1451031653,NULL),(3194,42,'{\"type\":\"��Ϣ\",\"action\":\"\",\"title\":\"���ԣ��ܾ���-101����Ϣ\",\"content\":\"dsadasdsa\",\"url\":\"\\/xiaowei\\/index.php?m=&c=Message&a=index&return_url=Message%2Findex\"}',0,1451279340,NULL),(3195,42,'{\"type\":\"��Ϣ\",\"action\":\"\",\"title\":\"���ԣ��ܾ���-101����Ϣ\",\"content\":\"dsa dsa dsa\",\"url\":\"\\/xiaowei\\/index.php?m=&c=Message&a=index&return_url=Message%2Findex\"}',0,1451279349,NULL),(3197,44,'{\"type\":\"����\",\"action\":\"��Ҫִ��\",\"title\":\"���ԣ��ܾ���-101\",\"content\":\"���⣺sadasd\",\"url\":\"\\/xiaowei\\/index.php?m=&c=Task&a=read&id=36&return_url=Task%2Findex\"}',0,1451279473,NULL),(3207,42,'{\"type\":\"��Ϣ\",\"action\":\"\",\"title\":\"���ԣ����۲�-1����Ϣ\",\"content\":\"������\",\"url\":\"\\/xiaowei\\/index.php?m=&c=Message&a=index&return_url=Message%2Findex\"}',0,1451285661,NULL),(3208,42,'{\"type\":\"��Ϣ\",\"action\":\"\",\"title\":\"���ԣ�С΢��ҵ-����Ա����Ϣ\",\"content\":\"asd\",\"url\":\"\\/index.php?m=&c=Message&a=index&return_url=Message%2Findex\"}',0,1451286292,NULL),(3209,44,'{\"type\":\"��Ϣ\",\"action\":\"\",\"title\":\"���ԣ�С΢��ҵ-����Ա����Ϣ\",\"content\":\"123\",\"url\":\"\\/xiaowei\\/index.php?m=&c=Message&a=index&return_url=Message%2Findex\"}',0,1451368088,NULL),(3211,43,'{\"type\":\"����\",\"action\":\"��Ҫִ��\",\"title\":\"���ԣ�С΢��ҵ-����Ա\",\"content\":\"���⣺123\",\"url\":\"\\/xiaowei\\/index.php?m=&c=Task&a=read&id=37&return_url=Task%2Findex\"}',0,1451369732,NULL),(3212,44,'{\"type\":\"����\",\"action\":\"��Ҫִ��\",\"title\":\"���ԣ�С΢��ҵ-����Ա\",\"content\":\"���⣺123\",\"url\":\"\\/xiaowei\\/index.php?m=&c=Task&a=read&id=37&return_url=Task%2Findex\"}',0,0,NULL),(3213,43,'{\"type\":\"����\",\"action\":\"��Ҫִ��\",\"title\":\"���ԣ�С΢��ҵ-����Ա\",\"content\":\"���⣺123\",\"url\":\"\\/xiaowei\\/index.php?m=&c=Task&a=read&id=37&return_url=Task%2Findex\"}',0,1451369749,NULL),(3214,44,'{\"type\":\"����\",\"action\":\"��Ҫִ��\",\"title\":\"���ԣ�С΢��ҵ-����Ա\",\"content\":\"���⣺123\",\"url\":\"\\/xiaowei\\/index.php?m=&c=Task&a=read&id=37&return_url=Task%2Findex\"}',0,0,NULL),(3217,42,'{\"type\":\"ǩ��\",\"action\":\"\",\"title\":\"����\",\"content\":\"�����ˣ�С΢��ҵ-����Ա\",\"url\":\"\\/xiaowei\\/index.php?m=&c=GovDoc&a=index&return_url=GovDoc%2Findex\"}',0,1451374547,NULL);

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

INSERT INTO `think_rank` VALUES (1,'RG40','����','1',0),(2,'RG30','�Ƴ�','2',0),(3,'RG20','����','3',0),(4,'RG10','����','4',0),(5,'RG00','�ܾ���','0',0),(6,'RG401','����1','1',0);

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

INSERT INTO `think_role` VALUES (1,'��˾����Ա',0,'','1',1208784792,1451291148,0),(2,'����Ȩ��',0,'','2',1215496283,1368507164,0),(7,'�쵼',0,'','2',1254325787,1401288337,0);

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
  `emp_no` varchar(10) DEFAULT NULL COMMENT 'Ա�����',
  `create_time` int(11) DEFAULT NULL,
  `latitude` varchar(10) DEFAULT NULL,
  `longitude` varchar(10) DEFAULT NULL,
  `precision` varchar(10) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `is_real_time` tinyint(3) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `sign_date` datetime DEFAULT NULL,
  `content` text COMMENT '��ע',
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
  `assigner` int(11) DEFAULT NULL COMMENT '�����������',
  `executor` varchar(20) DEFAULT NULL COMMENT 'ִ����',
  `executor_name` varchar(20) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `plan_time` datetime DEFAULT NULL,
  `transactor_name` varchar(20) DEFAULT NULL,
  `transactor` int(11) DEFAULT NULL COMMENT '��˭�����',
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

INSERT INTO `think_system_config` VALUES (86,'system_name','','С΢OA',0,NULL,0,'system'),(87,'system_license','','112dsa52a5rra53ar535fa32er13',0,NULL,0,'system'),(88,'upload_file_ext','','doc,docx,xls,xlsx,ppt,pptx,pdf,gif,png,tif,zip,rar,jpg,jpeg,txt',0,NULL,0,'system'),(89,'login_verify_code','','',0,NULL,0,'system'),(90,'weixin_corp_id','','wx4124a601419ba115',0,NULL,0,'weixin'),(91,'weixin_secret','','TlnidZYom5z8T-pE0y_O7IXm7dSPgPDtI3nQ7RyqLQePiyUXzWo8F-qum1n4i_QM',0,NULL,0,'weixin'),(92,'weixin_token','','xiaowei',0,NULL,0,'weixin'),(93,'weixin_encoding_aes_key','','lsBzWprOjjdbkMatbg54wwMC2H9ZXmi1aEdDmUQ2nPq',0,NULL,0,'weixin'),(94,'weixin_set_url','','http://xiaowei.smeoa.com',0,NULL,0,'weixin'),(97,'ws_push_config','','����,����,��Ϣ,���ʲ�ѯ,�ձ�,�ճ�,����,CRM,ͨѶ¼,�ʼ�',0,NULL,0,'push'),(98,'weixin_push_config','','����,����,��Ϣ,���ʲ�ѯ,�ձ�,�ճ�,����,CRM,ͨѶ¼,�ʼ�',0,NULL,0,'push'),(99,'msg_push_config','','����=17;����=8;��Ϣ=18;���ʲ�ѯ=19;�ձ�=20;�ճ�=21;����=22;CRM=15;ͨѶ¼=9;',0,NULL,0,'push'),(101,'weixin_site_url','','http://xiaowei.smeoa.com/',0,NULL,0,'weixin'),(102,'����-֧��','����-֧��','����-֧��',0,'1',0,'common'),(103,'FINANCE_PAYMENT_TYPE','�ͷ�','�ͷ�',0,'1',102,'common'),(104,'FINANCE_PAYMENT_TYPE','ͨѶ��','ͨѶ��',0,'2',102,'common'),(105,'FINANCE_PAYMENT_TYPE','�칫��','�칫��',0,'3',102,'common'),(106,'��������','��������','��������',0,'2',0,'common'),(107,'CRM_VISIT_TYPE','��ѯ','��ѯ',0,'1',106,'common'),(108,'CRM_VISIT_TYPE','����','����',0,'2',106,'common'),(109,'SIGN_AGENT_ID','SIGN_AGENT_ID','6',0,'3',0,'common'),(110,'OA_AGENT_ID','OA_AGENT_ID','5',0,'4',0,'common');

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

INSERT INTO `think_system_folder` VALUES (78,0,'Form','�ǼǱ�','С΢��ҵ|dept_1;','','','',0,''),(79,0,'Product','�ֻ�','С΢��ҵ|dept_1;','','','',0,'');

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

INSERT INTO `think_system_tag` VALUES (69,0,'FlowType','����','1',''),(70,0,'FlowType','����','2',''),(71,0,'FlowType','�ɹ�','3',''),(72,0,'FlowType','����','4',''),(80,0,'FlowType','��������','5',''),(81,0,'Supplier','������','','');

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
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '����',
  `content` text COMMENT '����',
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
  `assigner` int(11) DEFAULT NULL COMMENT '�����������',
  `executor` varchar(20) DEFAULT NULL COMMENT 'ִ����',
  `executor_name` varchar(20) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `plan_time` datetime DEFAULT NULL,
  `transactor_name` varchar(20) DEFAULT NULL,
  `transactor` int(11) DEFAULT NULL COMMENT '��˭�����',
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

INSERT INTO `think_udf_field` VALUES (56,'A11',1,'','','text','3','','','Flow',0,NULL),(57,'A2',1,'','','select','4','','','Flow',0,NULL),(58,'�� 3 ',1,'','','select','1','','','Flow',0,NULL),(59,'����',33,'','','text','1','','','Flow',0,''),(60,'��������',33,'','','date','1','','','Flow',0,''),(61,'��������',33,'','','text','1','','','Flow',0,''),(62,'��������',33,'','','select','1','SYSTEM_CONFIG:FINANCE_INCOME_TYPE','','Flow',0,''),(64,'B1',76,'','','text','1','','','Flow',0,NULL),(65,'B2',76,'','','text','1','','','Flow',0,NULL),(66,'��������',76,'','','datetime','1','','','Form',0,'show|col-10'),(67,'ʣ������',76,'','','text','1','','','Form',0,'show|col-10'),(68,'��Ŀ״̬',76,'','','radio','2','�ύ|�ύ,�����|�����,���ʧ��|���ʧ��','','Form',0,'show|col-10'),(69,'����',34,'','����д����','datetime','1','','require','Flow',0,''),(71,'��������',34,'','����д��ϵ�绰','text','1','','require','Flow',0,''),(72,'��ٿ�ʼʱ��',34,'','��ѡ��ʼʱ��','datetime','1','','require','Flow',0,''),(73,'��ٽ���ʱ��',34,'','��ѡ����ʱ��','datetime','1','','require','Flow',0,''),(74,'���ԭ��',34,'','����д���ԭ��','textarea','2','','require','Flow',0,''),(76,'����',38,'','','text','1','','','Flow',0,''),(77,'��������',38,'','','date','1','','','Flow',0,''),(78,'��������',38,'','','text','1','','','Flow',0,''),(79,'��������',38,'','','text','1','','','Flow',0,''),(80,'����',36,'','','text','1','','','Flow',0,''),(82,'��������',36,'','','date','1','','','Flow',0,''),(83,'�������š�����',36,'','','text','1','','','Flow',0,''),(85,'����',44,'','','text','1','','','Flow',0,''),(86,'����/����',44,'','','text','1','','','Flow',0,''),(87,'��ְ��������',44,'','','date','2','','','Flow',0,''),(88,'��ְ����',44,'','','editor','2','','','Flow',0,''),(89,'��ѵ������',54,'1','','text','1','','','Flow',0,''),(90,'����/����',54,'2','','text','1','','','Flow',0,''),(91,'��ѵ�ص�',54,'3','','text','1','','','Flow',0,''),(92,'��ѵ��ʼʱ��',54,'4','','datetime','1','','','Flow',0,''),(93,'��ѵĿ��',54,'6','','editor','2','','','Flow',0,''),(94,'��ѵ����',54,'7','','editor','2','','','Flow',0,''),(95,'����',41,'1','','text','1','','','Flow',0,''),(96,'����/����',41,'2','','text','1','','','Flow',0,''),(97,'����ص�',41,'3','','text','1','','','Flow',0,''),(98,'���ʼʱ��',41,'5','','datetime','1','','','Flow',0,''),(99,'Ԥ�Ʒ���',41,'4','','text','1','','','Flow',0,''),(100,'��������/Ŀ��',41,'7','','editor','2','','','Flow',0,''),(103,'����',40,'','','text','1','','','Flow',0,''),(104,'����/����',40,'','','text','1','','','Flow',0,''),(105,'��ٿ�ʼʱ��',40,'','','datetime','1','','','Flow',0,''),(106,'��ٽ���ʱ��',40,'','','datetime','1','','','Flow',0,''),(107,'�������',40,'','','editor','2','','','Flow',0,''),(108,'��ѵ����ʱ��',54,'5','','datetime','2','','','Flow',0,''),(109,'�������ʱ��',41,'6','','datetime','1','','','Flow',0,''),(110,'������',43,'','','text','1','','','Flow',0,''),(112,'����/����',43,'2','','text','1','','','Flow',0,''),(114,'��;',43,'3','','editor','2','','','Flow',0,''),(115,'������',55,'1','','text','1','','','Flow',0,''),(116,'����/����',55,'2','','text','1','','','Flow',0,''),(117,'Ԥ������',55,'4','','editor','2','','','Flow',0,''),(118,'Ԥ����;',55,'3','','editor','2','','','Flow',0,''),(119,'Ԥ����ϸ��ο�����',55,'5','','text','2','','','Flow',0,''),(120,'������',45,'1','','text','1','','','Flow',0,''),(121,'����/����',45,'2','','text','1','','','Flow',0,''),(122,'����ص�',45,'4','','text','1','','','Flow',0,''),(123,'���ʼʱ��',45,'5','','datetime','1','','','Flow',0,''),(124,'�������ʱ��',45,'6','','datetime','1','','','Flow',0,''),(125,'ס�޷���',45,'7','','text','1','','','Flow',0,''),(126,'��ͨ����',45,'8','','text','1','','','Flow',0,''),(127,'�ͷ�',45,'9','','text','1','','','Flow',0,''),(128,'����',45,'91','','text','1','','','Flow',0,''),(129,'������',19,'1','','text','1','','','Flow',0,''),(130,'����/����',19,'2','','text','1','','','Flow',0,''),(131,'�д��ص�',19,'4','','text','1','','','Flow',0,''),(132,'�д�ʱ��',19,'5','','datetime','1','','','Flow',0,''),(133,'�д�����',19,'7','','text','2','','','Flow',0,''),(134,'�д�Ŀ��',19,'8','','editor','2','','','Flow',0,''),(135,'�д�����',19,'3','','text','1','','','Flow',0,''),(136,'�μ���Ա',19,'6','','text','1','','','Flow',0,''),(137,'����Ŀ��',45,'3','','text','1','','','Flow',0,''),(138,'������',53,'1','','text','1','','','Flow',0,''),(139,'����/����',53,'2','','text','1','','','Flow',0,''),(140,'���豸��',53,'3','','text','1','','','Flow',0,''),(141,'����',53,'4','','text','1','','','Flow',0,''),(142,'�ͺŹ��',53,'5','','text','1','','','Flow',0,''),(143,'Ԥ�Ʒ���',53,'6','','text','1','','','Flow',0,''),(144,'��������',53,'7','','editor','2','','','Flow',0,''),(145,'������',51,'1','','text','1','','','Flow',0,''),(146,'����/����',51,'2','','text','1','','','Flow',0,''),(147,'�豸����',51,'3','','text','1','','','Flow',0,''),(148,'����',51,'4','','text','1','','','Flow',0,''),(149,'�ͺŹ��',51,'5','','text','1','','','Flow',0,''),(150,'Ԥ�Ʒ���',51,'6','','text','1','','','Flow',0,''),(151,'��������',51,'7','','editor','2','','','Flow',0,''),(152,'������',52,'1','','text','1','','','Flow',0,''),(153,'����/����',52,'2','','text','1','','','Flow',0,''),(154,'��������',52,'3','','text','1','','','Flow',0,''),(155,'����',52,'4','','text','1','','','Flow',0,''),(156,'�ͺŹ��',52,'5','','text','1','','','Flow',0,''),(157,'Ԥ�Ʒ���',52,'6','','text','1','','','Flow',0,''),(158,'��������',52,'7','','editor','2','','','Flow',0,''),(159,'������',39,'1','','text','1','','','Flow',0,''),(160,'����/����',39,'2','','text','1','','','Flow',0,''),(161,'ԭ��������',39,'3','','text','1','','','Flow',0,''),(162,'����',39,'4','','text','1','','','Flow',0,''),(163,'�ͺŹ��',39,'5','','text','1','','','Flow',0,''),(164,'Ԥ�Ʒ���',39,'6','','text','1','','','Flow',0,''),(165,'��������',39,'7','','editor','2','','','Flow',0,''),(166,'������',50,'1','','text','1','','','Flow',0,''),(167,'����/����',50,'2','','text','1','','','Flow',0,''),(168,'����ʱ��',50,'3','','datetime','1','','','Flow',0,''),(169,'����ص�',50,'4','','text','1','','','Flow',0,''),(170,'��������',50,'9','','editor','2','','','Flow',0,''),(171,'ȥ��',50,'6','','text','1','','','Flow',0,''),(172,'�س�',50,'7','','text','1','','','Flow',0,''),(173,'���ʼʱ��',50,'51','','datetime','1','','','Flow',0,''),(176,'�������ʱ��',50,'52','','datetime','1','','','Flow',0,''),(177,'������',49,'1','','text','1','','','Flow',0,''),(178,'����/����',49,'2','','text','1','','','Flow',0,''),(179,'Ŀ��/��;',49,'3','','text','1','','','Flow',0,''),(180,'ʹ�ÿ�ʼʱ��',49,'4','','datetime','1','','','Flow',0,''),(181,'ʹ�ý���ʱ��',49,'5','','datetime','1','','','Flow',0,''),(182,'����ʱ��',49,'21','','datetime','1','','','Flow',0,''),(183,'�λ���',49,'6','','text','2','','','Flow',0,''),(184,'������',42,'1','','text','1','','','Flow',0,''),(185,'����/����',42,'2','','text','1','','','Flow',0,''),(186,'��������',42,'3','','text','1','','','Flow',0,''),(187,'�칫��Ʒ�����Լ�����',42,'4','','editor','2','','','Flow',0,''),(189,'����ʱ��',42,'21','','text','1','','','Flow',0,''),(190,'������',46,'1','','text','1','','','Flow',0,''),(191,'����/����',46,'2','','text','1','','','Flow',0,''),(192,'����ʱ��',46,'3','','datetime','1','','','Flow',0,''),(193,'��������',46,'5','','text','2','','','Flow',0,''),(194,'ͨѶ�������',46,'4','','text','1','','','Flow',0,''),(195,'������',47,'1','','text','1','','','Flow',0,''),(196,'����/����',47,'2','','text','1','','','Flow',0,''),(197,'��������',47,'3','','datetime','1','','','Flow',0,''),(199,'���ʼʱ��',47,'4','','datetime','1','','','Flow',0,''),(200,'�������ʱ��',47,'5','','datetime','1','','','Flow',0,''),(201,'��������',47,'31','','text','1','','','Flow',0,''),(202,'ʵ��ʹ�÷���',47,'6','','text','1','','','Flow',0,''),(203,'��׼����',47,'7','','text','1','','','Flow',0,''),(204,'��ͨ������ϸ',47,'8','','editor','2','','','Flow',0,''),(205,'������',48,'1','','text','1','','','Flow',0,''),(206,'����/����',48,'2','','text','1','','','Flow',0,''),(207,'����ʱ��',48,'3','','datetime','1','','','Flow',0,''),(208,'ʵ�ʷ���',48,'4','','text','1','','','Flow',0,''),(209,'�μ���Ա',48,'5','','text','2','','','Flow',0,''),(210,'��������',48,'41','','text','2','','','Flow',0,''),(211,'11111',37,'','','link_select','1','dept','','Flow',0,''),(213,'�Զ����ֶ�',2,'','','text','1','�Զ����ֶ�','','Crm',0,''),(214,'Ԥ�㷶Χ',56,'','','text','1','','','Flow',0,''),(215,'��������',56,'','','text','1','','','Flow',0,''),(216,'����',56,'','','text','2','','','Flow',0,''),(217,'������;',56,'','','simple','2','','','Flow',0,''),(218,'Ŀ������',56,'','','simple','2','','','Flow',0,''),(219,'���ݷ���',56,'','','editor','2','','','Flow',0,''),(220,'����Ҫ��',56,'','','simple','2','','','Flow',0,''),(221,'��ʽҪ��',56,'','','simple','2','','','Flow',0,''),(222,'����ȷ��ʱ��',56,'','','datetime','1','','','Flow',0,''),(223,'����ʱ��',56,'','','datetime','1','','','Flow',0,''),(224,'����ʱ��',56,'','','datetime','1','','','Flow',0,''),(225,'����ȷ��ʱ��',56,'','','datetime','1','','','Flow',0,''),(226,'AAAAAAA',78,'','','text','1','121321','','Form',0,''),(227,'ssss',33,'','','select','2','FINANCE_INCOME_TYPE:FINANCE_INCOME_TYPE','','Flow',0,''),(228,'sad0s000',33,'','','select','2','SYSTEM_CONFIG:FINANCE_INCOME_TYPE','','Flow',0,''),(229,'002111',2,'','','text','1','','','Crm',0,''),(230,'asd',0,'sad','asd','text','1','asd','','CrmCompany',0,'asd'),(232,'123',0,'123','','text','1','123','','CrmCompany',0,'123'),(233,'��ʫ����',1,'','','text','1','���','','CrmContact',0,''),(234,'����',1,'','','text','1','������v','','CrmContact',0,''),(235,'123',79,'','','text','1','123','','Product',0,'123'),(237,'asd',83,'asd','','text','2','��˹��asd','','Form',0,'asd');

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
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '����ID',
  `shop_no` varchar(20) NOT NULL DEFAULT '' COMMENT '���ű��',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `short` varchar(20) NOT NULL DEFAULT '' COMMENT '���',
  `sort` varchar(20) NOT NULL DEFAULT '0' COMMENT '����',
  `remark` varchar(255) DEFAULT NULL COMMENT '��ע',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
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

INSERT INTO `think_user` VALUES (1,'admin','����Ա','GLY','21232f297a57a5a743894a0e4a801fc3',1,1,'male','2013-09-18','127.0.0.1',3269,'Uploads/emp_pic/1.jpeg','gdsresrere','1231254123123asd','5086-2222-2222','12123123',1222907803,1451368432,0,'',1,1,'c81e728d9d4c2f636f067f89cc14862c','admin');

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

INSERT INTO `think_weixin_menu` VALUES (9,'view','΢�Ű칫','index.php?m=&c=index&a=index','',0,'1',3),(10,'view','��������','index.php?m=&c=Task&a=add','',0,'1',5),(11,'view','��δ���','index.php?m=&c=Task&a=folder&fid=no_finish','',0,'2',5),(12,'click','�鿴����','','chakanrenwu',0,'3',5),(13,'view','��������','index.php?m=&c=Task&a=folder&fid=dept','',12,'1',5),(14,'view','��������','index.php?m=&c=Task&a=folder&fid=no_assign','',12,'2',5),(15,'view','�ҷ�����','index.php?m=&c=Task&a=folder&fid=my_task','',12,'3',5),(16,'view','�������','index.php?m=&c=Task&a=folder&fid=finished','',12,'4',5),(17,'view','��������','index.php?m=&c=Task&a=folder&fid=all','',12,'5',5),(18,'view','��������','index.php?m=&c=Flow&a=index','',0,'1',6),(19,'view','��������','m=&c=Flow&a=folder&fid=confirm','',0,'2',6),(20,'click','����','','shenpiqita',0,'3',6),(21,'view','�ݸ���','index.php?m=&c=Flow&a=folder&fid=darft','',20,'1',6),(22,'view','���ύ','index.php?m=&c=Flow&a=folder&fid=submit','',20,'2',6),(23,'view','��������','index.php?m=&c=Flow&a=folder&fid=report','',20,'3',6),(24,'view','������','index.php?m=&c=Flow&a=folder&fid=receive','',20,'4',6),(25,'view','������','index.php?m=&c=Flow&a=folder&fid=finish','',20,'5',6),(26,'view','�ҵ���Ϣ','index.php?m=&c=Info&a=my_info','',0,'1',7),(27,'view','�ҵ�ǩ��','index.php?m=&c=Info&a=my_sign','',0,'2',7),(28,'view','�ҵĿͻ�','index.php?m=&c=CrmContact&a=index','',0,'1',8),(29,'view','�½��ͻ�','index.php?m=&c=CrmContact&a=add_contact','',0,'2',8),(30,'view','ְԱ','index.php?m=&c=Staff&a=index','',0,'1',9),(31,'view','�ͻ�','index.php?m=&c=Customer&a=index','',0,'2',9),(32,'view','��Ӧ��','index.php?m=&c=Supplier&a=index','',0,'3',9),(33,'view','�½��ձ�','index.php?m=&c=WorkLog&a=add','',0,'1',11),(34,'view','�鿴�ձ�','index.php?m=&c=WorkLog&a=index','',0,'2',11),(35,'view','�½��ճ�','index.php?m=&c=Schedule&a=add','',0,'1',12),(36,'view','�鿴�ճ�','index.php?m=&c=Schedule&a=index','',0,'2',12),(37,'view','��Ϣ','index.php?m=&c=Message&a=index','',0,'1',13),(38,'view','����','index.php?m=&c=Todo&a=index','',0,'2',13),(39,'view','��ϵ��','index.php?m=&c=Contact&a=index','',0,'3',13),(40,'view','ǩ��','index.php?m=Weixin&c=Sign&a=index&state=sign_in','',0,'1',14),(41,'view','ǩ��','index.php?m=Weixin&c=Sign&a=index&state=sign_in','',0,'2',14),(42,'view','����','index.php?m=Weixin&c=Sign&a=index&state=outside','',0,'3',14);

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
INSERT INTO `think_weixin_option` VALUES (3,'΢�Ű칫','1'),(5,'����','2'),(6,'����','3'),(7,'��Ϣ','4'),(8,'�ͻ���ϵ','5'),(9,'ͨѶ¼','6'),(11,'�ձ�','8'),(12,'�ճ�','9'),(13,'����','9a'),(14,'΢�ſ���','2');
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

INSERT INTO `think_work_log` VALUES (1,1,'����Ա',1,'С΢��ҵ',1441077332,'�����׶�����','1231231231','2015-09-01','2015-09-11',0,'');

#
# Structure for table "think_work_order"
#

DROP TABLE IF EXISTS `think_work_order`;
CREATE TABLE `think_work_order` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `task_no` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '����',
  `content` text COMMENT '����',
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
  `assigner` int(11) DEFAULT NULL COMMENT '�����������',
  `executor` varchar(20) DEFAULT NULL COMMENT 'ִ����',
  `executor_name` varchar(20) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `arrive_time` int(11) DEFAULT NULL,
  `transactor_name` varchar(20) DEFAULT NULL,
  `transactor` int(11) DEFAULT NULL COMMENT '��˭�����',
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


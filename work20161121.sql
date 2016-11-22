/*
MySQL Data Transfer
Source Host: localhost
Source Database: work
Target Host: localhost
Target Database: work
Date: 2016/11/21 23:58:38
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for acct_authority
-- ----------------------------
CREATE TABLE `acct_authority` (
  `id` varchar(36) NOT NULL COMMENT '权限Id',
  `name` varchar(255) NOT NULL COMMENT '权限名称',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acct_role
-- ----------------------------
CREATE TABLE `acct_role` (
  `id` varchar(36) NOT NULL COMMENT '角色Id',
  `name` varchar(255) NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acct_role_authority
-- ----------------------------
CREATE TABLE `acct_role_authority` (
  `role_id` varchar(36) NOT NULL COMMENT '角色id',
  `authority_id` varchar(36) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`role_id`,`authority_id`),
  KEY `role_id` (`role_id`),
  KEY `authority_id` (`authority_id`),
  CONSTRAINT `acct_role_authority_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `acct_role` (`id`),
  CONSTRAINT `acct_role_authority_ibfk_2` FOREIGN KEY (`authority_id`) REFERENCES `acct_authority` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acct_user
-- ----------------------------
CREATE TABLE `acct_user` (
  `id` varchar(36) NOT NULL COMMENT '用户ID',
  `nick_name` varchar(255) NOT NULL COMMENT '昵称',
  `telephone` varchar(255) DEFAULT NULL COMMENT '电话',
  `register_time` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`),
  KEY `nick_name` (`nick_name`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acct_user_role
-- ----------------------------
CREATE TABLE `acct_user_role` (
  `user_id` varchar(36) NOT NULL COMMENT '用户Id',
  `role_id` varchar(36) NOT NULL COMMENT '角色Id',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `acct_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `acct_user` (`id`),
  CONSTRAINT `acct_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `acct_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hx_job
-- ----------------------------
CREATE TABLE `hx_job` (
  `cmd` varchar(20) DEFAULT NULL,
  `jobID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`jobID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hx_model
-- ----------------------------
CREATE TABLE `hx_model` (
  `jobID` bigint(20) DEFAULT NULL,
  `id` char(9) NOT NULL,
  `pid` char(9) DEFAULT NULL,
  `modelname` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `savepath` varchar(255) DEFAULT NULL,
  `modelversion` int(11) DEFAULT NULL,
  `lastmodify` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_T_MODEL_REFERENCE_T_MODEL` (`pid`),
  KEY `jobID` (`jobID`),
  CONSTRAINT `FK_T_MODEL_REFERENCE_T_MODEL` FOREIGN KEY (`pid`) REFERENCES `hx_model` (`id`),
  CONSTRAINT `hx_model_ibfk_1` FOREIGN KEY (`jobID`) REFERENCES `hx_job` (`jobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hx_param
-- ----------------------------
CREATE TABLE `hx_param` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `modelid` char(9) DEFAULT NULL,
  `paramname` varchar(100) DEFAULT NULL,
  `paramtype` char(2) DEFAULT NULL,
  `paramvalue` float DEFAULT NULL,
  `paramorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_T_PARAM_REFERENCE_T_MODEL` (`modelid`),
  CONSTRAINT `FK_T_PARAM_REFERENCE_T_MODEL` FOREIGN KEY (`modelid`) REFERENCES `hx_model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xx_log
-- ----------------------------
CREATE TABLE `xx_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `content` longtext,
  `ip` varchar(255) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `parameter` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `acct_authority` VALUES ('b6d3ceb9-eae9-43a6-9064-424db8c53208', '查看用户');
INSERT INTO `acct_authority` VALUES ('29a366b9-bbbf-47e4-a0c2-26eec58b1822', '添加用户');
INSERT INTO `acct_role` VALUES ('b432d31d-ebd2-4e91-9184-1b3769e6686b', 'admin');
INSERT INTO `acct_role` VALUES ('121', '游客');
INSERT INTO `acct_role_authority` VALUES ('b432d31d-ebd2-4e91-9184-1b3769e6686b', '29a366b9-bbbf-47e4-a0c2-26eec58b1822');
INSERT INTO `acct_role_authority` VALUES ('b432d31d-ebd2-4e91-9184-1b3769e6686b', 'b6d3ceb9-eae9-43a6-9064-424db8c53208');
INSERT INTO `acct_user` VALUES ('14ff5253-5912-4a3f-b51b-f50d9da0271d', 'zty', '13022221111', '2015-02-06 17:13:55');
INSERT INTO `acct_user` VALUES ('6e5afb1d-50e1-45fe-b6fe-b9e399415387', 'andy', '15147174722', '2015-02-06 17:06:36');
INSERT INTO `acct_user` VALUES ('7162fc4f-780a-403d-bb5f-485cf768ff4e', 'andy', '13022221111', '2016-10-26 00:00:17');
INSERT INTO `acct_user_role` VALUES ('14ff5253-5912-4a3f-b51b-f50d9da0271d', 'b432d31d-ebd2-4e91-9184-1b3769e6686b');
INSERT INTO `acct_user_role` VALUES ('6e5afb1d-50e1-45fe-b6fe-b9e399415387', 'b432d31d-ebd2-4e91-9184-1b3769e6686b');
INSERT INTO `hx_job` VALUES ('generate', '1');
INSERT INTO `hx_job` VALUES ('generate', '2');
INSERT INTO `hx_job` VALUES (null, '3');
INSERT INTO `hx_job` VALUES (null, '4');
INSERT INTO `hx_job` VALUES (null, '5');
INSERT INTO `hx_job` VALUES (null, '6');
INSERT INTO `hx_job` VALUES (null, '7');
INSERT INTO `hx_job` VALUES (null, '8');
INSERT INTO `hx_job` VALUES (null, '13');
INSERT INTO `hx_model` VALUES ('2', '000000001', '000000005', 'Box', '简易长方体', null, null, null);
INSERT INTO `hx_model` VALUES (null, '000000002', '000000005', 'Bottle', 'OCC瓶子', null, null, null);
INSERT INTO `hx_model` VALUES ('1', '000000005', null, 'GroupTest', 'Group测试', null, null, null);
INSERT INTO `hx_param` VALUES ('1', '000000001', '长', 'd', '10', null);
INSERT INTO `hx_param` VALUES ('2', '000000001', '宽', 'd', '10', null);
INSERT INTO `hx_param` VALUES ('3', '000000001', '高', 'd', '1.2', null);
INSERT INTO `hx_param` VALUES ('4', '000000002', '宽', 'd', '50', null);
INSERT INTO `hx_param` VALUES ('5', '000000002', '高', 'd', '100', null);
INSERT INTO `hx_param` VALUES ('6', '000000002', '瓶子厚度', 'd', '30', null);
INSERT INTO `hx_param` VALUES ('7', '000000005', '宽', 'd', '50', null);

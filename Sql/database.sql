/*
 Navicat MySQL Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : vpn

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 19/06/2019 16:23:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for vpn_admin
-- ----------------------------
DROP TABLE IF EXISTS `vpn_admin`;
CREATE TABLE `vpn_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';

-- ----------------------------
-- Records of vpn_admin
-- ----------------------------
BEGIN;
INSERT INTO `vpn_admin` VALUES (1, 'admin', 'Admin', '95ac2707fe58b2fbc93d40d7d1ab5cd1', 'fa73be', '/assets/img/avatar.png', 'admin@admin.com', 0, 1560909282, 1492186163, 1560909282, '83ebbada-059f-4e75-b5a8-29538ba389e8', 'normal');
COMMIT;

-- ----------------------------
-- Table structure for vpn_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `vpn_admin_log`;
CREATE TABLE `vpn_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员日志表';

-- ----------------------------
-- Records of vpn_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `vpn_admin_log` VALUES (1, 1, 'admin', '/index.php/admin/index/login', '登录', '{\"__token__\":\"337f5e664088901bf4dd220eef17f55a\",\"username\":\"admin\",\"captcha\":\"bhux\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560243333);
INSERT INTO `vpn_admin_log` VALUES (2, 1, 'admin', '/index.php/admin/addon/install', '插件管理 安装', '{\"name\":\"faems\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.0\",\"faversion\":\"1.0.0.20190510_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560243729);
INSERT INTO `vpn_admin_log` VALUES (3, 1, 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560243729);
INSERT INTO `vpn_admin_log` VALUES (4, 1, 'admin', '/index.php/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"faems\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560243754);
INSERT INTO `vpn_admin_log` VALUES (5, 1, 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560243754);
INSERT INTO `vpn_admin_log` VALUES (6, 1, 'admin', '/index.php/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"faems\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560243756);
INSERT INTO `vpn_admin_log` VALUES (7, 1, 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560243756);
INSERT INTO `vpn_admin_log` VALUES (8, 1, 'admin', '/index.php/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"1\",\"mail_smtp_host\":\"smtp.qq.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"admin\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@qq.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560243830);
INSERT INTO `vpn_admin_log` VALUES (9, 1, 'admin', '/index.php/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"1\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560243908);
INSERT INTO `vpn_admin_log` VALUES (10, 1, 'admin', '/index.php/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"1\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"0\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560243952);
INSERT INTO `vpn_admin_log` VALUES (11, 1, 'admin', '/index.php/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"1\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560243994);
INSERT INTO `vpn_admin_log` VALUES (12, 1, 'admin', '/index.php/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"1\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560244018);
INSERT INTO `vpn_admin_log` VALUES (13, 1, 'admin', '/index.php/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"1\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"25\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"0\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560244185);
INSERT INTO `vpn_admin_log` VALUES (14, 1, 'admin', '/index.php/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"25\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"0\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560244312);
INSERT INTO `vpn_admin_log` VALUES (15, 1, 'admin', '/index.php/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560244352);
INSERT INTO `vpn_admin_log` VALUES (16, 1, 'admin', '/index.php/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560244402);
INSERT INTO `vpn_admin_log` VALUES (17, 1, 'admin', '/index.php/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560244508);
INSERT INTO `vpn_admin_log` VALUES (18, 1, 'admin', '/index.php/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560244577);
INSERT INTO `vpn_admin_log` VALUES (19, 1, 'admin', '/index.php/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560244706);
INSERT INTO `vpn_admin_log` VALUES (20, 1, 'admin', '/index.php/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560244782);
INSERT INTO `vpn_admin_log` VALUES (21, 1, 'admin', '/index.php/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560244889);
INSERT INTO `vpn_admin_log` VALUES (22, 1, 'admin', '/index.php/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560245135);
INSERT INTO `vpn_admin_log` VALUES (23, 1, 'admin', '/index.php/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560245174);
INSERT INTO `vpn_admin_log` VALUES (24, 1, 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"ca0e0cbf6d681ae1d290e31438e8a6a1\",\"username\":\"admin\",\"captcha\":\"eft5\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560408797);
INSERT INTO `vpn_admin_log` VALUES (25, 1, 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"513fc59c4b7ee1b4c57dab3b06bb9bb4\",\"username\":\"admin\",\"captcha\":\"x8re\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560476841);
INSERT INTO `vpn_admin_log` VALUES (26, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"order\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa fa-jpy\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560477083);
INSERT INTO `vpn_admin_log` VALUES (27, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560477083);
INSERT INTO `vpn_admin_log` VALUES (28, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"85\",\"name\":\"order\\/index\",\"title\":\"\\u8ba2\\u5355\\u5217\\u8868\",\"icon\":\"fa fa-bars\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560477154);
INSERT INTO `vpn_admin_log` VALUES (29, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560477154);
INSERT INTO `vpn_admin_log` VALUES (30, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"test\",\"title\":\"\\u6d4b\\u8bd5\\u9875\\u9762\",\"icon\":\"fa fa-ambulance\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560477741);
INSERT INTO `vpn_admin_log` VALUES (31, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560477741);
INSERT INTO `vpn_admin_log` VALUES (32, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"test\\/index\",\"title\":\"\\u6d4b\\u8bd5\",\"icon\":\"fa fa-balance-scale\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560477765);
INSERT INTO `vpn_admin_log` VALUES (33, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560477765);
INSERT INTO `vpn_admin_log` VALUES (34, 1, 'admin', '/admin/auth/rule/edit/ids/87?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"test\",\"title\":\"\\u6d4b\\u8bd5\",\"icon\":\"fa fa-ambulance\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"87\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560477772);
INSERT INTO `vpn_admin_log` VALUES (35, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560477772);
INSERT INTO `vpn_admin_log` VALUES (36, 1, 'admin', '/admin/auth/rule/edit/ids/88?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"test\\/index\",\"title\":\"\\u6d4b\\u8bd5\\u9875\\u9762\",\"icon\":\"fa fa-balance-scale\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"88\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560477778);
INSERT INTO `vpn_admin_log` VALUES (37, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560477779);
INSERT INTO `vpn_admin_log` VALUES (38, 1, 'admin', '/admin/auth/rule/edit/ids/88?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"87\",\"name\":\"test\\/index\",\"title\":\"\\u6d4b\\u8bd5\\u9875\\u9762\",\"icon\":\"fa fa-balance-scale\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"88\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560477801);
INSERT INTO `vpn_admin_log` VALUES (39, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560477801);
INSERT INTO `vpn_admin_log` VALUES (40, 1, 'admin', '/admin/test/del/ids/1', '', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560482061);
INSERT INTO `vpn_admin_log` VALUES (41, 1, 'admin', '/admin/test/restore/ids/1', '', '{\"action\":\"restore\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560482067);
INSERT INTO `vpn_admin_log` VALUES (42, 1, 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560493263);
INSERT INTO `vpn_admin_log` VALUES (43, 1, 'admin', '/admin/auth/group/edit/ids/2?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"1,2,4,6,7,8,9,10,11,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,85,86,5\",\"pid\":\"1\",\"name\":\"\\u4e8c\\u7ea7\\u7ba1\\u7406\\u7ec4\",\"status\":\"normal\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560493283);
INSERT INTO `vpn_admin_log` VALUES (44, 1, 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560493286);
INSERT INTO `vpn_admin_log` VALUES (45, 1, 'admin', '/admin/auth/group/edit/ids/2?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"1,2,4,6,7,8,9,10,11,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5\",\"pid\":\"1\",\"name\":\"\\u4e8c\\u7ea7\\u7ba1\\u7406\\u7ec4\",\"status\":\"normal\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560493304);
INSERT INTO `vpn_admin_log` VALUES (46, 1, 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560493308);
INSERT INTO `vpn_admin_log` VALUES (47, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"vps\",\"title\":\"VPS\\u4e3b\\u673a\\u7ba1\\u7406\",\"icon\":\"fa fa-server\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560494342);
INSERT INTO `vpn_admin_log` VALUES (48, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560494343);
INSERT INTO `vpn_admin_log` VALUES (49, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"89\",\"name\":\"vps\\/index\",\"title\":\"\\u865a\\u62df\\u4e3b\\u673a\\u5217\\u8868\",\"icon\":\"fa fa-list-ul\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560494384);
INSERT INTO `vpn_admin_log` VALUES (50, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560494384);
INSERT INTO `vpn_admin_log` VALUES (51, 1, 'admin', '/admin/vps/add?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"account\":\"test2\",\"password\":\"test3\",\"location\":\"\\u975e\\u6d32\",\"provider\":\"Tencent\",\"address\":\"1.1.1.1\",\"start_time\":\"2019-06-14\",\"end_time\":\"2019-06-14\",\"price\":\"10000\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560500702);
INSERT INTO `vpn_admin_log` VALUES (52, 1, 'admin', '/admin/vps/add?dialog=1', '', '{\"dialog\":\"1\",\"account\":\"test3\",\"location\":\"test3\",\"provider\":\"test3\",\"address\":\"test3\",\"start_time\":\"2019-06-14\",\"end_time\":\"2019-06-14\",\"price\":\"100000\",\"status\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560501653);
INSERT INTO `vpn_admin_log` VALUES (53, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560501832);
INSERT INTO `vpn_admin_log` VALUES (54, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12,13\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12,13\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560501832);
INSERT INTO `vpn_admin_log` VALUES (55, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560501881);
INSERT INTO `vpn_admin_log` VALUES (56, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12,13\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12,13\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560501881);
INSERT INTO `vpn_admin_log` VALUES (57, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12,13\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12,13\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560502103);
INSERT INTO `vpn_admin_log` VALUES (58, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560502103);
INSERT INTO `vpn_admin_log` VALUES (59, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560502117);
INSERT INTO `vpn_admin_log` VALUES (60, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12,13\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12,13\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560502118);
INSERT INTO `vpn_admin_log` VALUES (61, 1, 'admin', '/admin/vps/del/ids/1', '', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560502312);
INSERT INTO `vpn_admin_log` VALUES (62, 1, 'admin', '/admin/test/restore', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560502340);
INSERT INTO `vpn_admin_log` VALUES (63, 1, 'admin', '/admin/vps/edit/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"account\":\"test6\",\"location\":\"\\u6df1\\u5733\",\"provider\":\"\\u963f\\u91cc\\u4e91\",\"address\":\"192.168.1.114\",\"start_time\":\"2019-06-14\",\"end_time\":\"2019-06-14\",\"price\":\"1000.00\",\"status\":\"1\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560505046);
INSERT INTO `vpn_admin_log` VALUES (64, 1, 'admin', '/admin/vps/edit/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"account\":\"test6\",\"location\":\"\\u6df1\\u5733\",\"provider\":\"\\u963f\\u91cc\\u4e91\",\"address\":\"192.168.1.114\",\"start_time\":\"2019-06-14\",\"end_time\":\"2019-06-14\",\"price\":\"1000.00\",\"status\":\"1\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560505054);
INSERT INTO `vpn_admin_log` VALUES (65, 1, 'admin', '/admin/vps/edit/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"account\":\"test6\",\"location\":\"\\u6df1\\u5733\",\"provider\":\"\\u963f\\u91cc\\u4e91\",\"address\":\"192.168.1.114\",\"start_time\":\"2019-06-14\",\"end_time\":\"2019-06-14\",\"price\":\"1000.00\",\"status\":\"1\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560505279);
INSERT INTO `vpn_admin_log` VALUES (66, 1, 'admin', '/admin/vps/edit/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"account\":\"test6\",\"password\":\"test6\",\"location\":\"\\u6df1\\u5733\",\"provider\":\"\\u963f\\u91cc\\u4e91\",\"address\":\"192.168.1.114\",\"start_time\":\"2019-06-14\",\"end_time\":\"2019-06-14\",\"price\":\"1000.00\",\"status\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560505307);
INSERT INTO `vpn_admin_log` VALUES (67, 1, 'admin', '/admin/vps/edit/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"account\":\"test6\",\"password\":\"test6\",\"location\":\"\\u6df1\\u5733\",\"provider\":\"\\u963f\\u91cc\\u4e91\",\"address\":\"192.168.1.114\",\"start_time\":\"2019-06-14\",\"end_time\":\"2019-06-14\",\"price\":\"1000.00\",\"status\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560505354);
INSERT INTO `vpn_admin_log` VALUES (68, 1, 'admin', '/admin/vps/edit/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"account\":\"test6\",\"password\":\"test6\",\"location\":\"\\u6df1\\u5733\",\"provider\":\"\\u963f\\u91cc\\u4e91\",\"address\":\"192.168.1.114\",\"start_time\":\"2019-06-14\",\"end_time\":\"2019-06-14\",\"price\":\"1000.00\",\"status\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560505760);
INSERT INTO `vpn_admin_log` VALUES (69, 1, 'admin', '/admin/vps/edit/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"account\":\"test6\",\"password\":\"test6\",\"location\":\"\\u6df1\\u5733\",\"provider\":\"\\u963f\\u91cc\\u4e91\",\"address\":\"192.168.1.114\",\"start_time\":\"2019-06-14\",\"end_time\":\"2019-06-14\",\"price\":\"1000.00\",\"status\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560506991);
INSERT INTO `vpn_admin_log` VALUES (70, 1, 'admin', '/admin/vps/edit/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"account\":\"test6\",\"password\":\"test6\",\"location\":\"\\u6df1\\u5733\",\"provider\":\"\\u963f\\u91cc\\u4e91\",\"address\":\"192.168.1.114\",\"start_time\":\"2019-06-14\",\"end_time\":\"2019-06-14\",\"price\":\"1000.00\",\"status\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560507185);
INSERT INTO `vpn_admin_log` VALUES (71, 1, 'admin', '/admin/vps/edit/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"account\":\"test6\",\"password\":\"test6\",\"location\":\"\\u6df1\\u5733\",\"provider\":\"\\u963f\\u91cc\\u4e91\",\"address\":\"192.168.1.114\",\"start_time\":\"2019-06-14\",\"end_time\":\"2019-06-14\",\"price\":\"1000.00\",\"status\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560507740);
INSERT INTO `vpn_admin_log` VALUES (72, 1, 'admin', '/admin/test/del/ids/1', '', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560508101);
INSERT INTO `vpn_admin_log` VALUES (73, 1, 'admin', '/admin/test/restore/ids/1', '', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560508186);
INSERT INTO `vpn_admin_log` VALUES (74, 1, 'admin', '/admin/test/del/ids/2', '', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560523499);
INSERT INTO `vpn_admin_log` VALUES (75, 1, 'admin', '/admin/test/restore/ids/1', '', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560528693);
INSERT INTO `vpn_admin_log` VALUES (76, 1, 'admin', '/admin/test/restore/ids/1', '', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560528707);
INSERT INTO `vpn_admin_log` VALUES (77, 1, 'admin', '/admin/vps/restore/ids/1', '', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560528734);
INSERT INTO `vpn_admin_log` VALUES (78, 1, 'admin', '/admin/vps/multi/ids/1', '', '{\"ids\":\"1\",\"params\":\"status=hidden\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560529771);
INSERT INTO `vpn_admin_log` VALUES (79, 1, 'admin', '/admin/vps/multi/ids/1', '', '{\"ids\":\"1\",\"params\":\"status=hidden\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560529789);
INSERT INTO `vpn_admin_log` VALUES (80, 1, 'admin', '/admin/vps/multi/ids/1', '', '{\"ids\":\"1\",\"params\":\"status=hidden\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560530260);
INSERT INTO `vpn_admin_log` VALUES (81, 1, 'admin', '/admin/vps/multi/ids/1,2', '', '{\"ids\":\"1,2\",\"params\":\"status=normal\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560530275);
INSERT INTO `vpn_admin_log` VALUES (82, 1, 'admin', '/admin/test/restore', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560530296);
INSERT INTO `vpn_admin_log` VALUES (83, 1, 'admin', '/admin/test/multi/ids/1', '', '{\"ids\":\"1\",\"params\":\"status=hidden\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560530306);
INSERT INTO `vpn_admin_log` VALUES (84, 1, 'admin', '/admin/test/multi/ids/1', '', '{\"ids\":\"1\",\"params\":\"status=normal\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560530311);
INSERT INTO `vpn_admin_log` VALUES (85, 1, 'admin', '/admin/test/multi/ids/1', '', '{\"ids\":\"1\",\"params\":\"status=hidden\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560530763);
INSERT INTO `vpn_admin_log` VALUES (86, 1, 'admin', '/admin/vps/multi/ids/1,2,3', '', '{\"ids\":\"1,2,3\",\"params\":\"status=hidden\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560531088);
INSERT INTO `vpn_admin_log` VALUES (87, 1, 'admin', '/admin/vps/multi/ids/1,2,3', '', '{\"ids\":\"1,2,3\",\"params\":\"status=normal\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560531363);
INSERT INTO `vpn_admin_log` VALUES (88, 1, 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"8a1fed024a2088de296f8232131744e3\",\"username\":\"admin\",\"captcha\":\"px66\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560757041);
INSERT INTO `vpn_admin_log` VALUES (89, 1, 'admin', '/admin/auth/rule/edit/ids/89?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"vps\",\"title\":\"VPS\\u4e3b\\u673a\",\"icon\":\"fa fa-server\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"89\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560757226);
INSERT INTO `vpn_admin_log` VALUES (90, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560757227);
INSERT INTO `vpn_admin_log` VALUES (91, 1, 'admin', '/admin/auth/rule/edit/ids/90?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"89\",\"name\":\"vps\\/index\",\"title\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"icon\":\"fa fa-list-ul\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"90\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560757235);
INSERT INTO `vpn_admin_log` VALUES (92, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560757235);
INSERT INTO `vpn_admin_log` VALUES (93, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"vpn\",\"title\":\"VPN\",\"icon\":\"fa fa-cloud\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560757311);
INSERT INTO `vpn_admin_log` VALUES (94, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560757311);
INSERT INTO `vpn_admin_log` VALUES (95, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"91\",\"name\":\"vpn\\/index\",\"title\":\"vpn\\u8d26\\u53f7\",\"icon\":\"fa fa-bar-chart\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560757336);
INSERT INTO `vpn_admin_log` VALUES (96, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560757336);
INSERT INTO `vpn_admin_log` VALUES (97, 1, 'admin', '/admin/auth/rule/edit/ids/92?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"91\",\"name\":\"vpn\\/index\",\"title\":\"VPN\\u8d26\\u53f7\",\"icon\":\"fa fa-bar-chart\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"92\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560759096);
INSERT INTO `vpn_admin_log` VALUES (98, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560759096);
INSERT INTO `vpn_admin_log` VALUES (99, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"91\",\"name\":\"vpn\\/test\",\"title\":\"\\u8bd5\\u7528\\u8d26\\u53f7\",\"icon\":\"fa fa-blind\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560759476);
INSERT INTO `vpn_admin_log` VALUES (100, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560759476);
INSERT INTO `vpn_admin_log` VALUES (101, 1, 'admin', '/admin/auth/rule/edit/ids/92?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"91\",\"name\":\"vpn\\/vpn\\/index\",\"title\":\"VPN\\u8d26\\u53f7\",\"icon\":\"fa fa-bar-chart\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"92\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560760685);
INSERT INTO `vpn_admin_log` VALUES (102, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560760685);
INSERT INTO `vpn_admin_log` VALUES (103, 1, 'admin', '/admin/auth/rule/edit/ids/93?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"91\",\"name\":\"vpn\\/vpn\\/test\",\"title\":\"\\u8bd5\\u7528\\u8d26\\u53f7\",\"icon\":\"fa fa-blind\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"93\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560760725);
INSERT INTO `vpn_admin_log` VALUES (104, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560760725);
INSERT INTO `vpn_admin_log` VALUES (105, 1, 'admin', '/admin/auth/rule/edit/ids/93?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"91\",\"name\":\"vpn\\/test\\/index\",\"title\":\"\\u8bd5\\u7528\\u8d26\\u53f7\",\"icon\":\"fa fa-blind\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"93\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560760893);
INSERT INTO `vpn_admin_log` VALUES (106, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560760893);
INSERT INTO `vpn_admin_log` VALUES (107, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"product\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa fa-modx\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560764874);
INSERT INTO `vpn_admin_log` VALUES (108, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560764874);
INSERT INTO `vpn_admin_log` VALUES (109, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"product\\/index\",\"title\":\"\\u5546\\u54c1\\u5217\\u8868\",\"icon\":\"fa fa-asterisk\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560764902);
INSERT INTO `vpn_admin_log` VALUES (110, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560764903);
INSERT INTO `vpn_admin_log` VALUES (111, 1, 'admin', '/admin/auth/rule/edit/ids/95?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"94\",\"name\":\"product\\/index\",\"title\":\"\\u5546\\u54c1\\u5217\\u8868\",\"icon\":\"fa fa-asterisk\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"95\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560764913);
INSERT INTO `vpn_admin_log` VALUES (112, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560764913);
INSERT INTO `vpn_admin_log` VALUES (113, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"BrowserPreview_tmp-240.png\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560828016);
INSERT INTO `vpn_admin_log` VALUES (114, 1, 'admin', '/admin/product/add?dialog=1', '', '{\"dialog\":\"1\",\"namedesc\":\"name\",\"desc\":\"desc\",\"row\":{\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"json\":\"{\\\"\\u91cd\\u91cf\\\":\\\"10g,20g,30g\\\"}\"},\"weigh\":\"0\",\"state\":\"0\",\"product\":[{\"\'sku\'\":\"10g\",\"\'stock\'\":\"100\",\"\'sales\'\":\"100\",\"\'price\'\":\"50\"},{\"\'sku\'\":\"20g\",\"\'stock\'\":\"200\",\"\'sales\'\":\"200\",\"\'price\'\":\"100\"},{\"\'sku\'\":\"30g\",\"\'stock\'\":\"300\",\"\'sales\'\":\"300\",\"\'price\'\":\"150\"}]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560828038);
INSERT INTO `vpn_admin_log` VALUES (115, 1, 'admin', '/admin/product/add?dialog=1', '', '{\"dialog\":\"1\",\"namedesc\":\"name\",\"desc\":\"desc\",\"row\":{\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"json\":\"{\\\"\\u91cd\\u91cf\\\":\\\"10g,20g,30g\\\"}\"},\"weigh\":\"0\",\"state\":\"0\",\"product\":[{\"\'sku\'\":\"10g\",\"\'stock\'\":\"100\",\"\'sales\'\":\"100\",\"\'price\'\":\"50\"},{\"\'sku\'\":\"20g\",\"\'stock\'\":\"200\",\"\'sales\'\":\"200\",\"\'price\'\":\"100\"},{\"\'sku\'\":\"30g\",\"\'stock\'\":\"300\",\"\'sales\'\":\"300\",\"\'price\'\":\"150\"}]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560828047);
INSERT INTO `vpn_admin_log` VALUES (116, 1, 'admin', '/admin/product/add?dialog=1', '', '{\"dialog\":\"1\",\"namedesc\":\"name\",\"desc\":\"desc\",\"row\":{\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"json\":\"{\\\"\\u91cd\\u91cf\\\":\\\"10g,20g,30g\\\"}\"},\"weigh\":\"0\",\"state\":\"0\",\"product\":[{\"\'sku\'\":\"10g\",\"\'stock\'\":\"100\",\"\'sales\'\":\"100\",\"\'price\'\":\"50\"},{\"\'sku\'\":\"20g\",\"\'stock\'\":\"200\",\"\'sales\'\":\"200\",\"\'price\'\":\"100\"},{\"\'sku\'\":\"30g\",\"\'stock\'\":\"300\",\"\'sales\'\":\"300\",\"\'price\'\":\"150\"}]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560828063);
INSERT INTO `vpn_admin_log` VALUES (117, 1, 'admin', '/admin/product/add?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"test\",\"desc\":\"test\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"state\":\"1\",\"row\":{\"json\":\"{\\\"\\u91cd\\u91cf\\\":\\\"10g,20g,30g\\\"}\"},\"product\":[{\"sku\":\"10g\",\"stock\":\"100\",\"sales\":\"200\",\"price\":\"100\"},{\"sku\":\"20g\",\"stock\":\"100\",\"sales\":\"200\",\"price\":\"150\"},{\"sku\":\"30g\",\"stock\":\"100\",\"sales\":\"200\",\"price\":\"200\"}]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560828365);
INSERT INTO `vpn_admin_log` VALUES (118, 1, 'admin', '/admin/product/add?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"demo\",\"desc\":\"desc\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"state\":\"0\",\"row\":{\"json\":\"{\\\"\\u91cd\\u91cf\\\":\\\"10g,20g,30g\\\"}\"},\"product\":[{\"sku\":\"10g\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"20g\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"30g\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"}]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560829062);
INSERT INTO `vpn_admin_log` VALUES (119, 1, 'admin', '/admin/product/add?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"demo\",\"desc\":\"desc\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"state\":\"0\",\"row\":{\"json\":\"{\\\"\\u91cd\\u91cf\\\":\\\"10g,20g,30g\\\"}\"},\"product\":[{\"sku\":\"10g\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"20g\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"30g\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"}]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560829075);
INSERT INTO `vpn_admin_log` VALUES (120, 1, 'admin', '/admin/product/add?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"demo\",\"desc\":\"desc\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"state\":\"0\",\"row\":{\"json\":\"[{\\\"key\\\":\\\"\\u91cd\\u91cf\\\",\\\"value\\\":[\\\"10g\\\",\\\"20g\\\",\\\"30g\\\"]}]\"},\"product\":[{\"sku\":\"10g\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"20g\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"30g\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"}]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560829142);
INSERT INTO `vpn_admin_log` VALUES (121, 1, 'admin', '/admin/product/add?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"demo\",\"desc\":\"desc\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"state\":\"0\",\"row\":{\"json\":\"[{\\\"key\\\":\\\"\\u91cd\\u91cf\\\",\\\"value\\\":[\\\"10g\\\",\\\"20g\\\",\\\"30g\\\"]},{\\\"key\\\":\\\"\\u989c\\u8272\\\",\\\"value\\\":[\\\"\\u767d\\u8272\\\",\\\"\\u7ea2\\u8272\\\"]}]\"},\"product\":[{\"sku\":\"10g,\\u767d\\u8272\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"10g,\\u7ea2\\u8272\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"20g,\\u767d\\u8272\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"20g,\\u7ea2\\u8272\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"30g,\\u767d\\u8272\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"30g,\\u7ea2\\u8272\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"}]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560829156);
INSERT INTO `vpn_admin_log` VALUES (122, 1, 'admin', '/admin/product/add?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"demo\",\"desc\":\"desc\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"state\":\"0\",\"row\":{\"json\":\"[{\\\"key\\\":\\\"\\u91cd\\u91cf\\\",\\\"value\\\":[\\\"10g\\\",\\\"20g\\\",\\\"30g\\\"]},{\\\"key\\\":\\\"\\u989c\\u8272\\\",\\\"value\\\":[\\\"\\u767d\\u8272\\\",\\\"\\u7ea2\\u8272\\\"]}]\"},\"product\":[{\"sku\":\"10g,\\u767d\\u8272\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"10g,\\u7ea2\\u8272\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"20g,\\u767d\\u8272\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"20g,\\u7ea2\\u8272\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"30g,\\u767d\\u8272\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"30g,\\u7ea2\\u8272\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"}]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560829237);
INSERT INTO `vpn_admin_log` VALUES (123, 1, 'admin', '/admin/product/add?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"demo\",\"desc\":\"desc\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"state\":\"0\",\"row\":{\"json\":\"[{\\\"key\\\":\\\"\\u91cd\\u91cf\\\",\\\"value\\\":[\\\"10g\\\",\\\"20g\\\",\\\"30g\\\"]},{\\\"key\\\":\\\"\\u989c\\u8272\\\",\\\"value\\\":[\\\"\\u767d\\u8272\\\",\\\"\\u7ea2\\u8272\\\"]}]\"},\"product\":[{\"sku\":\"10g,\\u767d\\u8272\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"10g,\\u7ea2\\u8272\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"20g,\\u767d\\u8272\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"20g,\\u7ea2\\u8272\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"30g,\\u767d\\u8272\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"30g,\\u7ea2\\u8272\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"}]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560829737);
INSERT INTO `vpn_admin_log` VALUES (124, 1, 'admin', '/admin/product/add?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"product\",\"desc\":\"desc\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"state\":\"0\",\"row\":{\"json\":\"[{\\\"key\\\":\\\"\\u91cd\\u91cf\\\",\\\"value\\\":[\\\"10g\\\",\\\"20g\\\",\\\"30g\\\"]},{\\\"key\\\":\\\"\\u989c\\u8272\\\",\\\"value\\\":[\\\"\\u767d\\u8272\\\",\\\"\\u7ea2\\u8272\\\"]}]\"},\"product\":[{\"sku\":\"10g,\\u767d\\u8272\",\"stock\":\"100\",\"sales\":\"100\",\"price\":\"100\"},{\"sku\":\"10g,\\u7ea2\\u8272\",\"stock\":\"200\",\"sales\":\"200\",\"price\":\"200\"},{\"sku\":\"20g,\\u767d\\u8272\",\"stock\":\"300\",\"sales\":\"300\",\"price\":\"300\"},{\"sku\":\"20g,\\u7ea2\\u8272\",\"stock\":\"400\",\"sales\":\"400\",\"price\":\"400\"},{\"sku\":\"30g,\\u767d\\u8272\",\"stock\":\"500\",\"sales\":\"500\",\"price\":\"500\"},{\"sku\":\"30g,\\u7ea2\\u8272\",\"stock\":\"600\",\"sales\":\"600\",\"price\":\"600\"}]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560830002);
INSERT INTO `vpn_admin_log` VALUES (125, 1, 'admin', '/admin/product/add?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"demo\",\"desc\":\"desc\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"state\":\"1\",\"row\":{\"json\":\"[{\\\"key\\\":\\\"\\u91cd\\u91cf\\\",\\\"value\\\":[\\\"10g\\\",\\\"20g\\\",\\\"30g\\\"]}]\"},\"product\":[{\"sku\":\"10g\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"20g\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"},{\"sku\":\"30g\",\"stock\":\"0\",\"sales\":\"0\",\"price\":\"0\"}]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560830450);
INSERT INTO `vpn_admin_log` VALUES (126, 1, 'admin', '/admin/product/add?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"test2\",\"desc\":\"desc\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"state\":\"0\",\"row\":{\"json\":\"[{\\\"key\\\":\\\"\\u91cd\\u91cf\\\",\\\"value\\\":[\\\"10g\\\",\\\"20g\\\",\\\"30g\\\"]},{\\\"key\\\":\\\"\\u989c\\u8272\\\",\\\"value\\\":[\\\"\\u767d\\u8272\\\",\\\"\\u7ea2\\u8272\\\"]}]\"},\"product\":[{\"sku\":\"10g,\\u767d\\u8272\",\"stock\":\"100\",\"sales\":\"100\",\"price\":\"100\"},{\"sku\":\"10g,\\u7ea2\\u8272\",\"stock\":\"200\",\"sales\":\"200\",\"price\":\"200\"},{\"sku\":\"20g,\\u767d\\u8272\",\"stock\":\"300\",\"sales\":\"300\",\"price\":\"300\"},{\"sku\":\"20g,\\u7ea2\\u8272\",\"stock\":\"400\",\"sales\":\"400\",\"price\":\"400\"},{\"sku\":\"30g,\\u767d\\u8272\",\"stock\":\"500\",\"sales\":\"500\",\"price\":\"500\"},{\"sku\":\"30g,\\u7ea2\\u8272\",\"stock\":\"600\",\"sales\":\"600\",\"price\":\"600\"}]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560830652);
INSERT INTO `vpn_admin_log` VALUES (127, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560835309);
INSERT INTO `vpn_admin_log` VALUES (128, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12,13\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12,13\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560835309);
INSERT INTO `vpn_admin_log` VALUES (129, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560835488);
INSERT INTO `vpn_admin_log` VALUES (130, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12,13\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12,13\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560835488);
INSERT INTO `vpn_admin_log` VALUES (131, 1, 'admin', '/admin/product/add?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"testProduct\",\"desc\":\"testProduct\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"state\":\"0\",\"row\":{\"json\":\"{\\\"\\u91cd\\u91cf\\\":\\\"10g,20g,30g\\\"}\"},\"result\":\"[{\\\"key\\\":\\\"\\u91cd\\u91cf\\\",\\\"value\\\":[\\\"10g\\\",\\\"20g\\\",\\\"30g\\\"]}]\",\"product\":[{\"sku\":\"10g\",\"stock\":\"10000\",\"sales\":\"10000\",\"price\":\"10000\"},{\"sku\":\"20g\",\"stock\":\"2000\",\"sales\":\"20\",\"price\":\"20\"},{\"sku\":\"30g\",\"stock\":\"30\",\"sales\":\"30\",\"price\":\"30\"}]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560839664);
INSERT INTO `vpn_admin_log` VALUES (132, 1, 'admin', '/admin/product/edit/ids/14?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"testProduct\",\"id\":\"14\",\"desc\":\"testProduct\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"state\":\"0\",\"row\":{\"status\":\"normal\",\"json\":\"{\\\"\\u91cd\\u91cf\\\":\\\"10g,20g,30g\\\"}\"},\"result\":\"[{\\\"key\\\":\\\"\\u91cd\\u91cf\\\",\\\"value\\\":[\\\"10g\\\",\\\"20g\\\",\\\"30g\\\"]}]\",\"product\":[{\"sku\":\"10g\",\"product_id\":\"14\",\"unique\":\"aece02a0\",\"stock\":\"10000\",\"sales\":\"10000\",\"price\":\"10000.00\"},{\"sku\":\"20g\",\"product_id\":\"14\",\"unique\":\"21b44f07\",\"stock\":\"2000\",\"sales\":\"20\",\"price\":\"20.00\"},{\"sku\":\"30g\",\"product_id\":\"14\",\"unique\":\"4f9ed9b2\",\"stock\":\"30\",\"sales\":\"30\",\"price\":\"30.00\"}],\"ids\":\"14\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560842852);
INSERT INTO `vpn_admin_log` VALUES (133, 1, 'admin', '/admin/product/edit/ids/14?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"testProduct\",\"id\":\"14\",\"desc\":\"testProduct\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"state\":\"0\",\"row\":{\"status\":\"normal\",\"json\":\"{\\\"\\u91cd\\u91cf\\\":\\\"10g,20g\\\"}\"},\"result\":\"[{\\\"key\\\":\\\"\\u91cd\\u91cf\\\",\\\"value\\\":[\\\"10g\\\",\\\"20g\\\"]}]\",\"product\":[{\"sku\":\"10g\",\"stock\":\"2000\",\"sales\":\"3000\",\"price\":\"4000\"},{\"sku\":\"20g\",\"stock\":\"1000\",\"sales\":\"2000\",\"price\":\"3000\"}],\"ids\":\"14\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560843041);
INSERT INTO `vpn_admin_log` VALUES (134, 1, 'admin', '/admin/product/edit/ids/14?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"testProduct\",\"id\":\"14\",\"desc\":\"testProduct\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"state\":\"0\",\"row\":{\"status\":\"normal\",\"json\":\"{\\\"\\u91cd\\u91cf\\\":\\\"10g,20g\\\"}\"},\"result\":\"[{\\\"key\\\":\\\"\\u91cd\\u91cf\\\",\\\"value\\\":[\\\"10g\\\",\\\"20g\\\"]}]\",\"product\":[{\"sku\":\"10g\",\"product_id\":\"14\",\"unique\":\"aece02a0\",\"stock\":\"10000\",\"sales\":\"10000\",\"price\":\"10000.00\"},{\"sku\":\"20g\",\"product_id\":\"14\",\"unique\":\"21b44f07\",\"stock\":\"2000\",\"sales\":\"20\",\"price\":\"20.00\"},{\"sku\":\"30g\",\"product_id\":\"14\",\"unique\":\"4f9ed9b2\",\"stock\":\"30\",\"sales\":\"30\",\"price\":\"333\"}],\"ids\":\"14\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560843495);
INSERT INTO `vpn_admin_log` VALUES (135, 1, 'admin', '/admin/product/del/ids/1', '', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560843592);
INSERT INTO `vpn_admin_log` VALUES (136, 1, 'admin', '/admin/product/restore/ids/1', '', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560843653);
INSERT INTO `vpn_admin_log` VALUES (137, 1, 'admin', '/admin/product/edit/ids/14?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"testProduct\",\"id\":\"14\",\"desc\":\"testProduct\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"state\":\"1\",\"row\":{\"status\":\"normal\",\"json\":\"{\\\"\\u91cd\\u91cf\\\":\\\"10g,20g\\\"}\"},\"result\":\"[{\\\"key\\\":\\\"\\u91cd\\u91cf\\\",\\\"value\\\":[\\\"10g\\\",\\\"20g\\\"]}]\",\"product\":[{\"sku\":\"10g\",\"product_id\":\"14\",\"unique\":\"aece02a0\",\"stock\":\"10000\",\"sales\":\"10000\",\"price\":\"10000.00\"},{\"sku\":\"20g\",\"product_id\":\"14\",\"unique\":\"21b44f07\",\"stock\":\"2000\",\"sales\":\"20\",\"price\":\"20.00\"},{\"sku\":\"30g\",\"product_id\":\"14\",\"unique\":\"4f9ed9b2\",\"stock\":\"30\",\"sales\":\"30\",\"price\":\"333.00\"}],\"ids\":\"14\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560844894);
INSERT INTO `vpn_admin_log` VALUES (138, 1, 'admin', '/admin/auth/rule/multi/ids/87', '', '{\"action\":\"\",\"ids\":\"87\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560846322);
INSERT INTO `vpn_admin_log` VALUES (139, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560846322);
INSERT INTO `vpn_admin_log` VALUES (140, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"banner\",\"title\":\"\\u5e7f\\u544a\\u7ba1\\u7406\",\"icon\":\"fa fa-archive\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560847120);
INSERT INTO `vpn_admin_log` VALUES (141, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560847120);
INSERT INTO `vpn_admin_log` VALUES (142, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"96\",\"name\":\"banner\\/index\",\"title\":\"\\u5e7f\\u544a\\u5217\\u8868\",\"icon\":\"fa fa-forumbee\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560847178);
INSERT INTO `vpn_admin_log` VALUES (143, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560847178);
INSERT INTO `vpn_admin_log` VALUES (144, 1, 'admin', '/admin/banner/add?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"demo\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"status\":\"normal\",\"state\":\"1\",\"type\":\"1\",\"context\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560849376);
INSERT INTO `vpn_admin_log` VALUES (145, 1, 'admin', '/admin/banner/add?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"demo\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"status\":\"normal\",\"state\":\"1\",\"type\":\"1\",\"context\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560849388);
INSERT INTO `vpn_admin_log` VALUES (146, 1, 'admin', '/admin/banner/add?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"demo\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"status\":\"normal\",\"state\":\"1\",\"type\":\"1\",\"context\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560849501);
INSERT INTO `vpn_admin_log` VALUES (147, 1, 'admin', '/admin/banner/add?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"name\":\"order\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"status\":\"normal\",\"state\":\"1\",\"type\":\"1\",\"context\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560849618);
INSERT INTO `vpn_admin_log` VALUES (148, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"feedback\",\"title\":\"\\u53cd\\u9988\\u7ba1\\u7406\",\"icon\":\"fa fa-commenting-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560850308);
INSERT INTO `vpn_admin_log` VALUES (149, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560850308);
INSERT INTO `vpn_admin_log` VALUES (150, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"98\",\"name\":\"feedback\\/index\",\"title\":\"\\u53cd\\u9988\\u5217\\u8868\",\"icon\":\"fa fa-asterisk\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560850341);
INSERT INTO `vpn_admin_log` VALUES (151, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560850341);
INSERT INTO `vpn_admin_log` VALUES (152, 1, 'admin', '/admin/feedback/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"user\":\"wencongsheng\",\"contexts\":\"\\u7528\\u6237\\u63d0\\u95ee\",\"context\":\"\\u4f60\\u8001\\u7238\",\"id\":\"1\",\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560853066);
INSERT INTO `vpn_admin_log` VALUES (153, 1, 'admin', '/admin/feedback/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"user\":\"wencongsheng\",\"contexts\":\"\\u7528\\u6237\\u63d0\\u95ee\",\"context\":\"66666\",\"id\":\"1\",\"pid\":\"0\",\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560853155);
INSERT INTO `vpn_admin_log` VALUES (154, 1, 'admin', '/admin/feedback/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"user\":\"wencongsheng\",\"contexts\":\"\\u7528\\u6237\\u63d0\\u95ee\",\"context\":\"\",\"id\":\"1\",\"pid\":\"0\",\"user_id\":\"4\",\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560853442);
INSERT INTO `vpn_admin_log` VALUES (155, 1, 'admin', '/admin/feedback/del/ids/6', '', '{\"action\":\"del\",\"ids\":\"6\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560853453);
INSERT INTO `vpn_admin_log` VALUES (156, 1, 'admin', '/admin/feedback/destroy/ids/6', '', '{\"ids\":\"6\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560853597);
INSERT INTO `vpn_admin_log` VALUES (157, 1, 'admin', '/admin/feedback/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"user\":\"wencongsheng\",\"contexts\":\"\\u7528\\u6237\\u63d0\\u95ee\",\"context\":\"\\u4f60\\u8001\\u7238\",\"id\":\"1\",\"pid\":\"0\",\"user_id\":\"4\",\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560853605);
INSERT INTO `vpn_admin_log` VALUES (158, 1, 'admin', '/admin/feedback/del/ids/7', '', '{\"action\":\"del\",\"ids\":\"7\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560853685);
INSERT INTO `vpn_admin_log` VALUES (159, 1, 'admin', '/admin/test/destroy/ids/7', '', '{\"action\":\"destroy\",\"ids\":\"7\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560853688);
INSERT INTO `vpn_admin_log` VALUES (160, 1, 'admin', '/admin/feedback/destroy/ids/7', '', '{\"ids\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560853690);
INSERT INTO `vpn_admin_log` VALUES (161, 1, 'admin', '/admin/feedback/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"user\":\"wencongsheng\",\"contexts\":\"\\u7528\\u6237\\u63d0\\u95ee\",\"context\":\"\\u4f60\\u8001\\u7238\",\"id\":\"1\",\"pid\":\"0\",\"user_id\":\"4\",\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560853698);
INSERT INTO `vpn_admin_log` VALUES (162, 1, 'admin', '/admin/index/login?url=%2Fadmin%2F', '登录', '{\"url\":\"\\/admin\\/\",\"__token__\":\"f6a3ac8d8791ee5809d35a49b647ad36\",\"username\":\"admin\",\"captcha\":\"decx\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560909282);
INSERT INTO `vpn_admin_log` VALUES (163, 1, 'admin', '/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560909324);
INSERT INTO `vpn_admin_log` VALUES (164, 1, 'admin', '/admin/general/config/emailtest?receiver=916826526@163.com', '', '{\"receiver\":\"916826526@163.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560911327);
INSERT INTO `vpn_admin_log` VALUES (165, 1, 'admin', '/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560911350);
INSERT INTO `vpn_admin_log` VALUES (166, 1, 'admin', '/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826525@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560911396);
INSERT INTO `vpn_admin_log` VALUES (167, 1, 'admin', '/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"ssl:\\/\\/smtp.gmail.com:465\",\"mail_smtp_port\":\"25\",\"mail_smtp_user\":\"JsetSo\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"w916826526@gmail.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560911494);
INSERT INTO `vpn_admin_log` VALUES (168, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"ssl:\\/\\/smtp.gmail.com:465\",\"mail_smtp_port\":\"25\",\"mail_smtp_user\":\"JsetSo\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"w916826526@gmail.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560911519);
INSERT INTO `vpn_admin_log` VALUES (169, 1, 'admin', '/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912132);
INSERT INTO `vpn_admin_log` VALUES (170, 1, 'admin', '/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912142);
INSERT INTO `vpn_admin_log` VALUES (171, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912148);
INSERT INTO `vpn_admin_log` VALUES (172, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"25\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912200);
INSERT INTO `vpn_admin_log` VALUES (173, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"25\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"0\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912204);
INSERT INTO `vpn_admin_log` VALUES (174, 1, 'admin', '/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"25\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"0\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912214);
INSERT INTO `vpn_admin_log` VALUES (175, 1, 'admin', '/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"25\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"0\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912224);
INSERT INTO `vpn_admin_log` VALUES (176, 1, 'admin', '/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912308);
INSERT INTO `vpn_admin_log` VALUES (177, 1, 'admin', '/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912315);
INSERT INTO `vpn_admin_log` VALUES (178, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912317);
INSERT INTO `vpn_admin_log` VALUES (179, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"faems\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912379);
INSERT INTO `vpn_admin_log` VALUES (180, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912379);
INSERT INTO `vpn_admin_log` VALUES (181, 1, 'admin', '/admin/addon/uninstall', '插件管理 卸载', '{\"name\":\"faems\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912382);
INSERT INTO `vpn_admin_log` VALUES (182, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912382);
INSERT INTO `vpn_admin_log` VALUES (183, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"faems\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.0\",\"faversion\":\"1.0.0.20190510_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912386);
INSERT INTO `vpn_admin_log` VALUES (184, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912386);
INSERT INTO `vpn_admin_log` VALUES (185, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912399);
INSERT INTO `vpn_admin_log` VALUES (186, 1, 'admin', '/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912411);
INSERT INTO `vpn_admin_log` VALUES (187, 1, 'admin', '/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"2\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"25\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912436);
INSERT INTO `vpn_admin_log` VALUES (188, 1, 'admin', '/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"1\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"25\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912469);
INSERT INTO `vpn_admin_log` VALUES (189, 1, 'admin', '/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"1\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912484);
INSERT INTO `vpn_admin_log` VALUES (190, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"mail_type\":\"1\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912496);
INSERT INTO `vpn_admin_log` VALUES (191, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"mail_type\":\"1\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"JestSo\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912749);
INSERT INTO `vpn_admin_log` VALUES (192, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"mail_type\":\"1\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560912797);
INSERT INTO `vpn_admin_log` VALUES (193, 1, 'admin', '/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"1\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560913355);
INSERT INTO `vpn_admin_log` VALUES (194, 1, 'admin', '/admin/general/config/emailtest?receiver=916826526@qq.com', '', '{\"receiver\":\"916826526@qq.com\",\"row\":{\"mail_type\":\"1\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"916826526@163.com\",\"mail_smtp_pass\":\"Wen8637633\",\"mail_verify_type\":\"2\",\"mail_from\":\"916826526@163.com\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560913372);
INSERT INTO `vpn_admin_log` VALUES (195, 1, 'admin', '/admin/feedback/edit/ids/9?dialog=1', '', '{\"dialog\":\"1\",\"user\":\"wencongsheng\",\"contexts\":\"\\u4f60\\u8001\\u7238\",\"context\":\"66666\",\"id\":\"9\",\"pid\":\"0\",\"user_id\":\"5\",\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560925240);
INSERT INTO `vpn_admin_log` VALUES (196, 1, 'admin', '/admin/feedback/edit/ids/11?dialog=1', '', '{\"dialog\":\"1\",\"user\":\"wencongsheng\",\"contexts\":\"\\u5403\\u5c4e\\u5566\",\"context\":\"66666\",\"id\":\"11\",\"pid\":\"9\",\"user_id\":\"5\",\"ids\":\"11\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560925331);
INSERT INTO `vpn_admin_log` VALUES (197, 1, 'admin', '/admin/feedback/edit/ids/11?dialog=1', '', '{\"dialog\":\"1\",\"user\":\"wencongsheng\",\"contexts\":\"\\u5403\\u5c4e\\u5566\",\"context\":\"66666\",\"id\":\"11\",\"pid\":\"9\",\"user_id\":\"5\",\"ids\":\"11\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560925467);
INSERT INTO `vpn_admin_log` VALUES (198, 1, 'admin', '/admin/feedback/edit/ids/15?dialog=1', '', '{\"dialog\":\"1\",\"user\":\"wencongsheng\",\"contexts\":\"\\u5403\\u5c4e\\u5566\",\"context\":\"66666\",\"id\":\"15\",\"pid\":\"0\",\"user_id\":\"5\",\"ids\":\"15\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560925657);
INSERT INTO `vpn_admin_log` VALUES (199, 1, 'admin', '/admin/feedback/edit/ids/17?dialog=1', '', '{\"dialog\":\"1\",\"user\":\"wencongsheng\",\"contexts\":\"\\u53fc\\u4f60\\u5594\",\"context\":\"\\u4f60\\u8001\\u7238\",\"id\":\"17\",\"pid\":\"15\",\"user_id\":\"5\",\"ids\":\"17\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560925691);
INSERT INTO `vpn_admin_log` VALUES (200, 1, 'admin', '/admin/product/add?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"vpn\",\"desc\":\"\\u4e00\\u4e2a\\u80fd\\u81ea\\u7531\\u4e0a\\u7f51\\u7684vpn\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"state\":\"1\",\"row\":{\"json\":\"{\\\"\\u671f\\u9650\\\":\\\"\\u6708,\\u5e74,\\u4e00\\u5b63,\\u4e8c\\u5b63,\\u4e09\\u5b63\\\"}\"},\"result\":\"[{\\\"key\\\":\\\"\\u671f\\u9650\\\",\\\"value\\\":[\\\"\\u4e00\\u5b63\\\",\\\"\\u4e09\\u5b63\\\",\\\"\\u4e8c\\u5b63\\\",\\\"\\u5e74\\\",\\\"\\u6708\\\"]}]\",\"product\":[{\"sku\":\"\\u4e00\\u5b63\",\"stock\":\"10\",\"sales\":\"10\",\"price\":\"100\"},{\"sku\":\"\\u4e09\\u5b63\",\"stock\":\"10\",\"sales\":\"10\",\"price\":\"300\"},{\"sku\":\"\\u4e8c\\u5b63\",\"stock\":\"10\",\"sales\":\"101\",\"price\":\"200\"},{\"sku\":\"\\u5e74\",\"stock\":\"10\",\"sales\":\"10\",\"price\":\"400\"},{\"sku\":\"\\u6708\",\"stock\":\"10\",\"sales\":\"10\",\"price\":\"30\"}]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560925887);
INSERT INTO `vpn_admin_log` VALUES (201, 1, 'admin', '/admin/product/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"name\":\"vpn\",\"id\":\"1\",\"desc\":\"\\u4e00\\u4e2a\\u80fd\\u81ea\\u7531\\u4e0a\\u7f51\\u7684vpn\",\"image\":\"\\/uploads\\/20190618\\/8024b36b2e4d767f7278dce95d549f60.png\",\"weigh\":\"0\",\"state\":\"0\",\"row\":{\"status\":\"normal\",\"json\":\"{\\\"\\u671f\\u9650\\\":\\\"\\u6708,\\u5e74,\\u4e00\\u5b63,\\u4e8c\\u5b63,\\u4e09\\u5b63\\\"}\"},\"result\":\"[{\\\"key\\\":\\\"\\u671f\\u9650\\\",\\\"value\\\":[\\\"\\u4e00\\u5b63\\\",\\\"\\u4e09\\u5b63\\\",\\\"\\u4e8c\\u5b63\\\",\\\"\\u5e74\\\",\\\"\\u6708\\\"]}]\",\"product\":[{\"sku\":\"\\u4e00\\u5b63\",\"product_id\":\"1\",\"unique\":\"86f5d223\",\"stock\":\"10\",\"sales\":\"10\",\"day\":\"90\",\"price\":\"100.00\"},{\"sku\":\"\\u4e09\\u5b63\",\"product_id\":\"1\",\"unique\":\"0f18e613\",\"stock\":\"10\",\"sales\":\"10\",\"day\":\"270\",\"price\":\"300.00\"},{\"sku\":\"\\u4e8c\\u5b63\",\"product_id\":\"1\",\"unique\":\"adb4a2e5\",\"stock\":\"10\",\"sales\":\"101\",\"day\":\"180\",\"price\":\"200.00\"},{\"sku\":\"\\u5e74\",\"product_id\":\"1\",\"unique\":\"f0311e42\",\"stock\":\"10\",\"sales\":\"10\",\"day\":\"365\",\"price\":\"400.00\"},{\"sku\":\"\\u6708\",\"product_id\":\"1\",\"unique\":\"77e48ceb\",\"stock\":\"10\",\"sales\":\"10\",\"day\":\"30\",\"price\":\"30.00\"}],\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1560926123);
COMMIT;

-- ----------------------------
-- Table structure for vpn_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vpn_attachment`;
CREATE TABLE `vpn_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='附件表';

-- ----------------------------
-- Records of vpn_attachment
-- ----------------------------
BEGIN;
INSERT INTO `vpn_attachment` VALUES (1, 1, 0, '/assets/img/qrcode.png', '150', '150', 'png', 0, 21859, 'image/png', '', 1499681848, 1499681848, 1499681848, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `vpn_attachment` VALUES (2, 1, 0, '/uploads/20190618/8024b36b2e4d767f7278dce95d549f60.png', '240', '228', 'png', 0, 34253, 'image/png', '{\"name\":\"BrowserPreview_tmp-240.png\"}', 1560828016, 1560828016, 1560828016, 'local', '52c95b78a9bc01ca0d29ca606d27e7420b1b5c3e');
COMMIT;

-- ----------------------------
-- Table structure for vpn_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `vpn_auth_group`;
CREATE TABLE `vpn_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分组表';

-- ----------------------------
-- Records of vpn_auth_group
-- ----------------------------
BEGIN;
INSERT INTO `vpn_auth_group` VALUES (1, 0, 'Admin group', '*', 1490883540, 149088354, 'normal');
INSERT INTO `vpn_auth_group` VALUES (2, 1, '二级管理组', '1,2,4,6,7,8,9,10,11,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1490883540, 1560493304, 'normal');
INSERT INTO `vpn_auth_group` VALUES (3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1490883540, 1502205322, 'normal');
INSERT INTO `vpn_auth_group` VALUES (4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1490883540, 1502205350, 'normal');
INSERT INTO `vpn_auth_group` VALUES (5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1490883540, 1502205344, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for vpn_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `vpn_auth_group_access`;
CREATE TABLE `vpn_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限分组表';

-- ----------------------------
-- Records of vpn_auth_group_access
-- ----------------------------
BEGIN;
INSERT INTO `vpn_auth_group_access` VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for vpn_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `vpn_auth_rule`;
CREATE TABLE `vpn_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';

-- ----------------------------
-- Records of vpn_auth_rule
-- ----------------------------
BEGIN;
INSERT INTO `vpn_auth_rule` VALUES (1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', 1, 1497429920, 1497429920, 143, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', 1, 1497429920, 1497430169, 137, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (3, 'file', 0, 'category', 'Category', 'fa fa-leaf', '', 'Category tips', 1, 1497429920, 1497429920, 119, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', 1, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', 1, 1497429920, 1497430092, 99, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', 1, 1497429920, 1497430683, 60, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', 1, 1497429920, 1497430699, 53, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', 1, 1497429920, 1497429920, 34, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', 1, 1497429920, 1497430320, 118, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', 1, 1497429920, 1497430307, 113, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', 1, 1497429920, 1497429920, 109, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', 1, 1497429920, 1497430581, 104, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 136, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 135, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 133, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 134, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 132, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 52, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 51, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 50, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 49, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 48, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', 0, 1497429920, 1497429920, 59, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 58, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 57, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 56, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 55, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 54, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 33, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 32, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 31, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 30, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 29, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 28, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', 0, 1497429920, 1497429920, 142, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 141, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 140, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 139, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 138, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', 0, 1497429920, 1497429920, 117, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 116, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 115, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 114, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', 0, 1497429920, 1497429920, 112, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 111, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 110, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', 0, 1497429920, 1497429920, 108, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 107, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 106, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 105, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', 0, 1497429920, 1497429920, 103, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 102, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 101, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 100, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (59, 'file', 4, 'addon/local', 'Local install', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (61, 'file', 4, 'addon/install', 'Install', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (62, 'file', 4, 'addon/uninstall', 'Uninstall', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (66, 'file', 0, 'user', 'User', 'fa fa-list', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (85, 'file', 0, 'order', '订单管理', 'fa fa-jpy', '', '', 1, 1560477083, 1560477083, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (86, 'file', 85, 'order/index', '订单列表', 'fa fa-bars', '', '', 1, 1560477154, 1560477154, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (87, 'file', 0, 'test', '测试', 'fa fa-ambulance', '', '', 0, 1560477741, 1560846322, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (88, 'file', 87, 'test/index', '测试页面', 'fa fa-balance-scale', '', '', 1, 1560477765, 1560477801, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (89, 'file', 0, 'vps', 'VPS主机', 'fa fa-server', '', '', 1, 1560494342, 1560757226, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (90, 'file', 89, 'vps/index', '虚拟主机', 'fa fa-list-ul', '', '', 1, 1560494384, 1560757235, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (91, 'file', 0, 'vpn', 'VPN', 'fa fa-cloud', '', '', 1, 1560757311, 1560757311, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (92, 'file', 91, 'vpn/vpn/index', 'VPN账号', 'fa fa-bar-chart', '', '', 1, 1560757336, 1560760685, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (93, 'file', 91, 'vpn/test/index', '试用账号', 'fa fa-blind', '', '', 1, 1560759476, 1560760893, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (94, 'file', 0, 'product', '商品管理', 'fa fa-modx', '', '', 1, 1560764874, 1560764874, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (95, 'file', 94, 'product/index', '商品列表', 'fa fa-asterisk', '', '', 1, 1560764902, 1560764913, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (96, 'file', 0, 'banner', '广告管理', 'fa fa-archive', '', '', 1, 1560847120, 1560847120, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (97, 'file', 96, 'banner/index', '广告列表', 'fa fa-forumbee', '', '', 1, 1560847178, 1560847178, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (98, 'file', 0, 'feedback', '反馈管理', 'fa fa-commenting-o', '', '', 1, 1560850308, 1560850308, 0, 'normal');
INSERT INTO `vpn_auth_rule` VALUES (99, 'file', 98, 'feedback/index', '反馈列表', 'fa fa-asterisk', '', '', 1, 1560850341, 1560850341, 0, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for vpn_banner
-- ----------------------------
DROP TABLE IF EXISTS `vpn_banner`;
CREATE TABLE `vpn_banner` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '广告表id',
  `name` varchar(64) DEFAULT NULL COMMENT '广告名称',
  `image` varchar(512) DEFAULT NULL COMMENT '图片地址',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'normal' COMMENT '图片状态',
  `state` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '图片状态值',
  `weigh` int(10) DEFAULT NULL COMMENT '权重',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `type` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '1' COMMENT '1 商品id 2 链接 3 图片',
  `context` varchar(512) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of vpn_banner
-- ----------------------------
BEGIN;
INSERT INTO `vpn_banner` VALUES (1, 'test', '/uploads/20190618/8024b36b2e4d767f7278dce95d549f60.png', 'normal', '0', 1, NULL, '1', '4');
INSERT INTO `vpn_banner` VALUES (2, 'order', '/uploads/20190618/8024b36b2e4d767f7278dce95d549f60.png', 'normal', '1', 0, NULL, '1', '1');
COMMIT;

-- ----------------------------
-- Table structure for vpn_category
-- ----------------------------
DROP TABLE IF EXISTS `vpn_category`;
CREATE TABLE `vpn_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分类表';

-- ----------------------------
-- Records of vpn_category
-- ----------------------------
BEGIN;
INSERT INTO `vpn_category` VALUES (1, 0, 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', 1495262190, 1495262190, 1, 'normal');
INSERT INTO `vpn_category` VALUES (2, 0, 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', 1495262244, 1495262244, 2, 'normal');
INSERT INTO `vpn_category` VALUES (3, 2, 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', 1495262288, 1495262288, 3, 'normal');
INSERT INTO `vpn_category` VALUES (4, 2, 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', 1495262317, 1495262317, 4, 'normal');
INSERT INTO `vpn_category` VALUES (5, 0, 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', 1495262336, 1499681850, 5, 'normal');
INSERT INTO `vpn_category` VALUES (6, 5, 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', 1495262357, 1495262357, 6, 'normal');
INSERT INTO `vpn_category` VALUES (7, 5, 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', 1495262391, 1495262391, 7, 'normal');
INSERT INTO `vpn_category` VALUES (8, 6, 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', 1495262424, 1495262424, 8, 'normal');
INSERT INTO `vpn_category` VALUES (9, 6, 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', 1495262456, 1495262456, 9, 'normal');
INSERT INTO `vpn_category` VALUES (10, 7, 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', 1495262487, 1495262487, 10, 'normal');
INSERT INTO `vpn_category` VALUES (11, 7, 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', 1495262515, 1495262515, 11, 'normal');
INSERT INTO `vpn_category` VALUES (12, 0, 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', 1497015727, 1497015727, 12, 'normal');
INSERT INTO `vpn_category` VALUES (13, 0, 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', 1497015738, 1497015738, 13, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for vpn_config
-- ----------------------------
DROP TABLE IF EXISTS `vpn_config`;
CREATE TABLE `vpn_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统配置';

-- ----------------------------
-- Records of vpn_config
-- ----------------------------
BEGIN;
INSERT INTO `vpn_config` VALUES (1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', 'FastAdmin', '', 'required', '');
INSERT INTO `vpn_config` VALUES (2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '');
INSERT INTO `vpn_config` VALUES (3, 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `vpn_config` VALUES (4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '');
INSERT INTO `vpn_config` VALUES (5, 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `vpn_config` VALUES (6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `vpn_config` VALUES (7, 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '');
INSERT INTO `vpn_config` VALUES (8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '');
INSERT INTO `vpn_config` VALUES (9, 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '');
INSERT INTO `vpn_config` VALUES (10, 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '');
INSERT INTO `vpn_config` VALUES (11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', '');
INSERT INTO `vpn_config` VALUES (12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.163.com', '', '', '');
INSERT INTO `vpn_config` VALUES (13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '');
INSERT INTO `vpn_config` VALUES (14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '916826526@163.com', '', '', '');
INSERT INTO `vpn_config` VALUES (15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'Wen8637633', '', '', '');
INSERT INTO `vpn_config` VALUES (16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', '');
INSERT INTO `vpn_config` VALUES (17, 'mail_from', 'email', 'Mail from', '', 'string', '916826526@163.com', '', '', '');
COMMIT;

-- ----------------------------
-- Table structure for vpn_ems
-- ----------------------------
DROP TABLE IF EXISTS `vpn_ems`;
CREATE TABLE `vpn_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱验证码表';

-- ----------------------------
-- Records of vpn_ems
-- ----------------------------
BEGIN;
INSERT INTO `vpn_ems` VALUES (15, 'send', '916826526@qq.com', '4247', 0, '127.0.0.1', 1560911547);
INSERT INTO `vpn_ems` VALUES (16, 'send', '916826526@qq.com', '2655', 0, '127.0.0.1', 1560911947);
INSERT INTO `vpn_ems` VALUES (17, 'send', '916826526@qq.com', '2955', 0, '127.0.0.1', 1560912321);
INSERT INTO `vpn_ems` VALUES (18, 'send', '916826526@qq.com', '9720', 1, '127.0.0.1', 1560912499);
INSERT INTO `vpn_ems` VALUES (19, 'send', 'w916826526@gmail.com', '6569', 0, '127.0.0.1', 1560912667);
INSERT INTO `vpn_ems` VALUES (20, 'send', '916826526@qq.com', '7467', 1, '127.0.0.1', 1560912698);
INSERT INTO `vpn_ems` VALUES (21, 'send', '916826526@qq.com', '7781', 0, '127.0.0.1', 1560912776);
INSERT INTO `vpn_ems` VALUES (22, 'send', 'w916826526@gmail.com', '1565', 0, '127.0.0.1', 1560913298);
INSERT INTO `vpn_ems` VALUES (23, 'send', 'w916826526@gmail.com', '4553', 0, '127.0.0.1', 1560913622);
INSERT INTO `vpn_ems` VALUES (24, 'send', '916826526@qq.com', '9749', 0, '127.0.0.1', 1560913661);
INSERT INTO `vpn_ems` VALUES (25, 'send', '916826526@qq.com', '2876', 0, '127.0.0.1', 1560913778);
INSERT INTO `vpn_ems` VALUES (26, 'send', 'w916826526@gmail.com', '4035', 0, '127.0.0.1', 1560914016);
INSERT INTO `vpn_ems` VALUES (27, 'send', 'w916826526@gmail.com', '6876', 0, '127.0.0.1', 1560915630);
COMMIT;

-- ----------------------------
-- Table structure for vpn_feedback
-- ----------------------------
DROP TABLE IF EXISTS `vpn_feedback`;
CREATE TABLE `vpn_feedback` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '反馈id',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `context` text COLLATE utf8mb4_bin COMMENT '反馈内容',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '提交时间',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'normal' COMMENT '''normal'',''hidden'' 状态 答',
  `pid` int(10) DEFAULT NULL COMMENT '问题pid',
  `state` enum('0','1','2','3','4') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '0 待回答 1 已回答 2 追加反馈 3 追加回',
  `weigh` int(10) DEFAULT NULL COMMENT '排序',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='feedback 用户反馈表';

-- ----------------------------
-- Records of vpn_feedback
-- ----------------------------
BEGIN;
INSERT INTO `vpn_feedback` VALUES (18, 5, '你老爸', 1560925690, 'normal', 17, '4', 18, NULL);
INSERT INTO `vpn_feedback` VALUES (17, 5, '叼你喔', 1560925681, 'normal', 15, '3', 17, NULL);
INSERT INTO `vpn_feedback` VALUES (16, 5, '66666', 1560925657, 'normal', 15, '2', 16, NULL);
INSERT INTO `vpn_feedback` VALUES (15, 5, '吃屎啦', 1560925634, 'normal', 0, '1', 15, NULL);
COMMIT;

-- ----------------------------
-- Table structure for vpn_machine
-- ----------------------------
DROP TABLE IF EXISTS `vpn_machine`;
CREATE TABLE `vpn_machine` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '机器可用端口id',
  `machine` int(10) DEFAULT NULL COMMENT '机器id',
  `port` int(10) DEFAULT NULL COMMENT '端口',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='机器配置表';

-- ----------------------------
-- Records of vpn_machine
-- ----------------------------
BEGIN;
INSERT INTO `vpn_machine` VALUES (7, 1, 30001);
INSERT INTO `vpn_machine` VALUES (6, 1, 30000);
INSERT INTO `vpn_machine` VALUES (8, 1, 30002);
COMMIT;

-- ----------------------------
-- Table structure for vpn_member_vpn
-- ----------------------------
DROP TABLE IF EXISTS `vpn_member_vpn`;
CREATE TABLE `vpn_member_vpn` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户vpn 表id',
  `ip` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ip 地址',
  `port` varchar(8) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '端口',
  `password` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `method` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '加密方式',
  `name` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '实列名称',
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `start_time` int(10) DEFAULT NULL COMMENT '开始使用时间',
  `end_time` int(10) DEFAULT NULL COMMENT '结束时间',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'normal' COMMENT '''normal'',''hidden''',
  `machine` int(10) DEFAULT NULL COMMENT '机器id',
  `weigh` int(10) DEFAULT NULL COMMENT '排序',
  `state` enum('1','2') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '2' COMMENT 'vpn状态 1 开启 2 停止',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户vpn配置表';

-- ----------------------------
-- Records of vpn_member_vpn
-- ----------------------------
BEGIN;
INSERT INTO `vpn_member_vpn` VALUES (1, '0.0.0.0', '10000', 'x2c6B9g9U5', 'aes-256-cfb', 'vpn_338029012218023936', 4, 1560758862, 1560762462, 'normal', 1, NULL, '2', NULL);
COMMIT;

-- ----------------------------
-- Table structure for vpn_order
-- ----------------------------
DROP TABLE IF EXISTS `vpn_order`;
CREATE TABLE `vpn_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `member_id` int(10) DEFAULT NULL COMMENT '用户id',
  `order_id` varchar(256) COLLATE utf8mb4_bin NOT NULL COMMENT '订单号',
  `order_create_time` int(11) DEFAULT NULL COMMENT '订单创建时间',
  `state` enum('0','1','2','3') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '0 未支付 1 已支付 2 退款 3 取消',
  `product_id` int(10) NOT NULL COMMENT '产品id',
  `start_time` int(11) DEFAULT NULL COMMENT '服务开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '服务结束时间',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `product_info` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品详情',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'normal' COMMENT '''normal'',''hidden''',
  `weigh` int(10) DEFAULT NULL COMMENT '权重',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `day` int(10) DEFAULT NULL COMMENT '服务时间',
  `unique` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品sku',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单表';

-- ----------------------------
-- Records of vpn_order
-- ----------------------------
BEGIN;
INSERT INTO `vpn_order` VALUES (1, 4, 'order201906131560395967416651', 1560395967, '0', 1, 1560395967, 1560395967, 100.00, NULL, 'normal', NULL, NULL, 90, NULL);
INSERT INTO `vpn_order` VALUES (3, 5, 'order201906191560927356591937', 1560927356, '0', 1, NULL, NULL, 300.00, NULL, '', NULL, NULL, 270, NULL);
INSERT INTO `vpn_order` VALUES (4, 5, 'order201906191560928058556996', 1560928058, '0', 1, NULL, NULL, 100.00, NULL, '', NULL, NULL, 90, '86f5d223');
COMMIT;

-- ----------------------------
-- Table structure for vpn_product
-- ----------------------------
DROP TABLE IF EXISTS `vpn_product`;
CREATE TABLE `vpn_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `name` varchar(256) COLLATE utf8mb4_bin NOT NULL COMMENT '产品名称',
  `desc` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品描述',
  `image` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品图片',
  `state` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '0 未上架、1 销售中、2 已下架',
  `up_time` int(11) DEFAULT NULL COMMENT '上架时间',
  `down_time` int(11) DEFAULT NULL COMMENT '下架时间',
  `up_admin` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '上架用户',
  `down_admin` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '下架用户',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(11) DEFAULT NULL COMMENT '排序',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'normal' COMMENT '''normal'',''hidden''',
  `result` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'suk参数',
  `attr` text COLLATE utf8mb4_bin COMMENT '前端属性',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='产品表\n\n';

-- ----------------------------
-- Records of vpn_product
-- ----------------------------
BEGIN;
INSERT INTO `vpn_product` VALUES (1, 'vpn', '一个能自由上网的vpn', '/uploads/20190618/8024b36b2e4d767f7278dce95d549f60.png', '0', 1560925887, NULL, NULL, NULL, NULL, 0, 'normal', '[{\"key\":\"期限\",\"value\":[\"一季\",\"三季\",\"二季\",\"年\",\"月\"]}]', '{\"期限\":\"月,年,一季,二季,三季\"}');
COMMIT;

-- ----------------------------
-- Table structure for vpn_product_attr
-- ----------------------------
DROP TABLE IF EXISTS `vpn_product_attr`;
CREATE TABLE `vpn_product_attr` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `attr_name` varchar(32) NOT NULL COMMENT '属性名',
  `attr_values` varchar(256) NOT NULL COMMENT '属性值',
  KEY `store_id` (`product_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品属性表';

-- ----------------------------
-- Records of vpn_product_attr
-- ----------------------------
BEGIN;
INSERT INTO `vpn_product_attr` VALUES (1, '期限', '一季,三季,二季,年,月');
COMMIT;

-- ----------------------------
-- Table structure for vpn_product_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `vpn_product_attr_value`;
CREATE TABLE `vpn_product_attr_value` (
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `sku` varchar(128) NOT NULL DEFAULT '0' COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) unsigned NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `price` decimal(8,2) unsigned NOT NULL COMMENT '属性金额',
  `unique` char(8) NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8,2) unsigned DEFAULT NULL COMMENT '成本价',
  `day` int(10) DEFAULT NULL COMMENT '天数',
  UNIQUE KEY `unique` (`unique`,`sku`) USING BTREE,
  KEY `store_id` (`product_id`,`sku`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品属性值表';

-- ----------------------------
-- Records of vpn_product_attr_value
-- ----------------------------
BEGIN;
INSERT INTO `vpn_product_attr_value` VALUES (1, '一季', 10, 10, 100.00, '86f5d223', NULL, 90);
INSERT INTO `vpn_product_attr_value` VALUES (1, '三季', 10, 10, 300.00, '0f18e613', NULL, 270);
INSERT INTO `vpn_product_attr_value` VALUES (1, '二季', 10, 101, 200.00, 'adb4a2e5', NULL, 180);
INSERT INTO `vpn_product_attr_value` VALUES (1, '年', 10, 10, 400.00, 'f0311e42', NULL, 365);
INSERT INTO `vpn_product_attr_value` VALUES (1, '月', 10, 10, 30.00, '77e48ceb', NULL, 30);
COMMIT;

-- ----------------------------
-- Table structure for vpn_sms
-- ----------------------------
DROP TABLE IF EXISTS `vpn_sms`;
CREATE TABLE `vpn_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='短信验证码表';

-- ----------------------------
-- Table structure for vpn_test
-- ----------------------------
DROP TABLE IF EXISTS `vpn_test`;
CREATE TABLE `vpn_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `json` varchar(255) DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='测试表';

-- ----------------------------
-- Records of vpn_test
-- ----------------------------
BEGIN;
INSERT INTO `vpn_test` VALUES (1, 0, 12, '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '{\"a\":\"1\",\"b\":\"2\"}', 0.00, 0, '2017-07-10', '2017-07-10 18:24:45', 2017, '18:24:45', 1499682285, 1499682526, 1560530763, NULL, 0, 1, 'hidden', '1');
INSERT INTO `vpn_test` VALUES (2, 0, 12, '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '{\"a\":\"1\",\"b\":\"2\"}', 0.00, 0, '2017-07-10', '2017-07-10 18:24:45', 2017, '18:24:45', 1499682285, 1499682526, 1560523499, NULL, 0, 1, 'normal', '1');
COMMIT;

-- ----------------------------
-- Table structure for vpn_test_vpn
-- ----------------------------
DROP TABLE IF EXISTS `vpn_test_vpn`;
CREATE TABLE `vpn_test_vpn` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户vpn 表id',
  `ip` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ip 地址',
  `port` varchar(8) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '端口',
  `password` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `method` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '加密方式',
  `name` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '实列名称',
  `user_id` int(10) NOT NULL DEFAULT '1' COMMENT '用户id',
  `start_time` int(10) DEFAULT NULL COMMENT '开始使用时间',
  `end_time` int(10) DEFAULT NULL COMMENT '结束时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'normal' COMMENT '''normal'',''hidden''',
  `state` enum('1','2') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '1' COMMENT '''1''启动,''2''暂停',
  `weigh` int(10) DEFAULT NULL COMMENT '排序',
  `type` tinyint(1) DEFAULT NULL COMMENT '1 默认 2 自定义过期时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='测试vpn配置表';

-- ----------------------------
-- Records of vpn_test_vpn
-- ----------------------------
BEGIN;
INSERT INTO `vpn_test_vpn` VALUES (1, '192.168.1.113', '29999', 'w9A7H6z2F9', 'aes-256-cfb', 'vpn_0', 1, 1560762311, 1560848711, NULL, 'normal', '1', NULL, NULL);
INSERT INTO `vpn_test_vpn` VALUES (2, '192.168.1.113', '29998', 's4E8C2J8z4', 'aes-256-cfb', 'vpn_1', 1, 1560762311, 1560848711, NULL, 'normal', '1', NULL, NULL);
INSERT INTO `vpn_test_vpn` VALUES (3, '192.168.1.113', '29997', 'A9E6B9x6a2', 'aes-256-cfb', 'vpn_2', 1, 1560762311, 1560848711, NULL, 'normal', '1', NULL, NULL);
INSERT INTO `vpn_test_vpn` VALUES (4, '192.168.1.113', '29996', 'U6b4b7p8q3', 'aes-256-cfb', 'vpn_3', 1, 1560762311, 1560848711, NULL, 'normal', '1', NULL, NULL);
INSERT INTO `vpn_test_vpn` VALUES (5, '192.168.1.113', '29995', 'B5B3h7Q6f6', 'aes-256-cfb', 'vpn_4', 1, 1560762311, 1560848711, NULL, 'normal', '1', NULL, NULL);
INSERT INTO `vpn_test_vpn` VALUES (6, '192.168.1.113', '29994', 'p9e9p9Z7X7', 'aes-256-cfb', 'vpn_5', 1, 1560762311, 1560848711, NULL, 'normal', '1', NULL, NULL);
INSERT INTO `vpn_test_vpn` VALUES (7, '192.168.1.113', '29993', 'Y6f3b2t3J4', 'aes-256-cfb', 'vpn_6', 1, 1560762311, 1560848711, NULL, 'normal', '1', NULL, NULL);
INSERT INTO `vpn_test_vpn` VALUES (8, '192.168.1.113', '29992', 'f8c3B3X8f5', 'aes-256-cfb', 'vpn_7', 1, 1560762311, 1560848711, NULL, 'normal', '1', NULL, NULL);
INSERT INTO `vpn_test_vpn` VALUES (9, '192.168.1.113', '29991', 'R6d6h4q4a3', 'aes-256-cfb', 'vpn_8', 1, 1560762311, 1560848711, NULL, 'normal', '1', NULL, NULL);
INSERT INTO `vpn_test_vpn` VALUES (10, '192.168.1.113', '29990', 't7B6b8U9E9', 'aes-256-cfb', 'vpn_9', 1, 1560762311, 1560848711, NULL, 'normal', '1', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for vpn_user
-- ----------------------------
DROP TABLE IF EXISTS `vpn_user`;
CREATE TABLE `vpn_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) NOT NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) NOT NULL DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员表';

-- ----------------------------
-- Records of vpn_user
-- ----------------------------
BEGIN;
INSERT INTO `vpn_user` VALUES (1, 1, 'admin', 'admin', 'c13f62012fd6a8fdf06b3452a94430e5', 'rpR6Bv', 'admin@163.com', '13888888888', '', 0, 0, '2017-04-15', '', 0.00, 0, 1, 1, 1516170492, 1516171614, '127.0.0.1', 0, '127.0.0.1', 1491461418, 0, 1516171614, '', 'normal', '');
INSERT INTO `vpn_user` VALUES (5, 0, 'wencongsheng', 'wencongsheng', '67671f7312d97fe0827f0ebbe49aec1e', 'jK1hAD', '916826526@qq.com', NULL, '', 1, 0, NULL, '', 0.00, 0, 1, 1, 1560924448, 1560924448, '127.0.0.1', 0, '127.0.0.1', 1560924448, 1560924448, 1560924448, '', 'normal', '');
COMMIT;

-- ----------------------------
-- Table structure for vpn_user_group
-- ----------------------------
DROP TABLE IF EXISTS `vpn_user_group`;
CREATE TABLE `vpn_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '组名',
  `rules` text COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员组表';

-- ----------------------------
-- Records of vpn_user_group
-- ----------------------------
BEGIN;
INSERT INTO `vpn_user_group` VALUES (1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1515386468, 1516168298, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for vpn_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `vpn_user_money_log`;
CREATE TABLE `vpn_user_money_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员余额变动表';

-- ----------------------------
-- Table structure for vpn_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `vpn_user_rule`;
CREATE TABLE `vpn_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员规则表';

-- ----------------------------
-- Records of vpn_user_rule
-- ----------------------------
BEGIN;
INSERT INTO `vpn_user_rule` VALUES (1, 0, 'index', '前台', '', 1, 1516168079, 1516168079, 1, 'normal');
INSERT INTO `vpn_user_rule` VALUES (2, 0, 'api', 'API接口', '', 1, 1516168062, 1516168062, 2, 'normal');
INSERT INTO `vpn_user_rule` VALUES (3, 1, 'user', '会员模块', '', 1, 1515386221, 1516168103, 12, 'normal');
INSERT INTO `vpn_user_rule` VALUES (4, 2, 'user', '会员模块', '', 1, 1515386221, 1516168092, 11, 'normal');
INSERT INTO `vpn_user_rule` VALUES (5, 3, 'index/user/login', '登录', '', 0, 1515386247, 1515386247, 5, 'normal');
INSERT INTO `vpn_user_rule` VALUES (6, 3, 'index/user/register', '注册', '', 0, 1515386262, 1516015236, 7, 'normal');
INSERT INTO `vpn_user_rule` VALUES (7, 3, 'index/user/index', '会员中心', '', 0, 1516015012, 1516015012, 9, 'normal');
INSERT INTO `vpn_user_rule` VALUES (8, 3, 'index/user/profile', '个人资料', '', 0, 1516015012, 1516015012, 4, 'normal');
INSERT INTO `vpn_user_rule` VALUES (9, 4, 'api/user/login', '登录', '', 0, 1515386247, 1515386247, 6, 'normal');
INSERT INTO `vpn_user_rule` VALUES (10, 4, 'api/user/register', '注册', '', 0, 1515386262, 1516015236, 8, 'normal');
INSERT INTO `vpn_user_rule` VALUES (11, 4, 'api/user/index', '会员中心', '', 0, 1516015012, 1516015012, 10, 'normal');
INSERT INTO `vpn_user_rule` VALUES (12, 4, 'api/user/profile', '个人资料', '', 0, 1516015012, 1516015012, 3, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for vpn_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `vpn_user_score_log`;
CREATE TABLE `vpn_user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员积分变动表';

-- ----------------------------
-- Table structure for vpn_user_token
-- ----------------------------
DROP TABLE IF EXISTS `vpn_user_token`;
CREATE TABLE `vpn_user_token` (
  `token` varchar(50) NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员Token表';

-- ----------------------------
-- Records of vpn_user_token
-- ----------------------------
BEGIN;
INSERT INTO `vpn_user_token` VALUES ('0f39bfaa347492d4b973a293f9c9b8c341f0d0f7', 4, 1560394113, 1562986113);
INSERT INTO `vpn_user_token` VALUES ('2ba55c745c77c2a0de3682fb2bb3bec80481d601', 5, 1560924448, 1563516448);
INSERT INTO `vpn_user_token` VALUES ('63ade028531e6114868b26bf6aa89732f8069e49', 3, 1560310601, 1562902601);
INSERT INTO `vpn_user_token` VALUES ('9c0b10248389cbbf7904369d6b5b3b3bdeabb3dd', 4, 1560320937, 1562912937);
INSERT INTO `vpn_user_token` VALUES ('bb65bfbf0e79c5b2dc9574b2226d47df4dd56177', 4, 1560322427, 1562914427);
INSERT INTO `vpn_user_token` VALUES ('c5d4886d5c3ddb00d8199be12ef4fee6b229e14b', 3, 1560310694, 1562902694);
INSERT INTO `vpn_user_token` VALUES ('d5d8ad4c12db17d20f54dbd3f4c711b74cd29e92', 2, 1560304056, 1562896056);
INSERT INTO `vpn_user_token` VALUES ('db38f6251d107a1e1686edb03a81d1d5e30618a6', 4, 1560742599, 1563334599);
INSERT INTO `vpn_user_token` VALUES ('eb0eea11390b95d32a23af8bee48e21cf1c59c9e', 4, 1560320168, 1562912168);
COMMIT;

-- ----------------------------
-- Table structure for vpn_version
-- ----------------------------
DROP TABLE IF EXISTS `vpn_version`;
CREATE TABLE `vpn_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) NOT NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) NOT NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) NOT NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) NOT NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='版本表';

-- ----------------------------
-- Records of vpn_version
-- ----------------------------
BEGIN;
INSERT INTO `vpn_version` VALUES (1, '1.1.1,2', '1.2.1', '20M', '更新内容', 'https://www.fastadmin.net/download.html', 1, 1520425318, 0, 0, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for vpn_vps
-- ----------------------------
DROP TABLE IF EXISTS `vpn_vps`;
CREATE TABLE `vpn_vps` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'vps id',
  `location` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '主机地址',
  `provider` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '主机提供方',
  `price` decimal(10,2) DEFAULT NULL COMMENT '租金',
  `address` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址',
  `defaults` tinyint(10) DEFAULT NULL COMMENT '1 默认 0不是',
  `account` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'vps账号',
  `password` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'vps密码',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'normal' COMMENT '0 down 1 up 2 scale ',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(11) DEFAULT NULL COMMENT '排序',
  `start_time` int(11) DEFAULT NULL COMMENT '开始使用时间',
  `end_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `state` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '0 down 1 up 2 scale ',
  `port` int(10) NOT NULL DEFAULT '10000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='vps 表';

-- ----------------------------
-- Records of vpn_vps
-- ----------------------------
BEGIN;
INSERT INTO `vpn_vps` VALUES (1, '广州', '阿里云', 1000.00, '192.168.1.113', 1, 'test1', 'test1', 'normal', NULL, 0, 1560497997, 1560497997, '1', 10000);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

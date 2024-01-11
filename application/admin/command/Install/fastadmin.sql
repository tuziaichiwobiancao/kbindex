/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : index

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 06/01/2024 23:04:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fa_admin
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin`;
CREATE TABLE `fa_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号码',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `logintime` bigint(16) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录IP',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_admin
-- ----------------------------
INSERT INTO `fa_admin` VALUES (1, 'admin', 'adminaa', 'c5ebca776e00180663b7ae38f98f8b6e', 'fa5de2', '/uploads/20230127/f94cf90891d4b51ff438be9383c58065.png', 'admin@admin.com', '', 0, 1704552658, '127.0.0.1', 1491635035, 1704552658, 'ff5f3425-372a-4b71-bc6f-ee9d2059d29f', 'normal');
INSERT INTO `fa_admin` VALUES (2, 'test', '测试管理员禁用配置选项', '9ddf8b766b1680278be3126fa4f9e76e', 'eI8fJ1', '/assets/img/avatar.png', '110@qq.com', '13800138000', 1, 1686134465, '223.74.42.61', 1674021643, 1699279906, 'cca08b29-8700-463d-ad16-2a77d51a0fb0', 'normal');

-- ----------------------------
-- Table structure for fa_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin_log`;
CREATE TABLE `fa_admin_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '日志标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_adv
-- ----------------------------
DROP TABLE IF EXISTS `fa_adv`;
CREATE TABLE `fa_adv`  (
  `adv_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `advtype_id` int(11) NOT NULL COMMENT '广告类型',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '广告内容',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '跳转的url',
  `addtime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '添加时间',
  `endtime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`adv_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '广告列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_adv
-- ----------------------------
INSERT INTO `fa_adv` VALUES (2, 1, 7, '测试广告', 'https://google.com', '2023-01-27 18:33:54', '2024-11-03 07:50:14');

-- ----------------------------
-- Table structure for fa_advorder
-- ----------------------------
DROP TABLE IF EXISTS `fa_advorder`;
CREATE TABLE `fa_advorder`  (
  `advorder_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告订单id',
  `advorderno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '广告订单号',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `advtype` int(11) NOT NULL COMMENT '广告类型id',
  `money` float(11, 2) NOT NULL COMMENT '金额',
  `other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '其他信息,预留使用',
  `addtime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`advorder_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '广告订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_advtype
-- ----------------------------
DROP TABLE IF EXISTS `fa_advtype`;
CREATE TABLE `fa_advtype`  (
  `advtype_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '广告类型id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '广告类型名称',
  `money` float NOT NULL DEFAULT 100 COMMENT '广告金额',
  `tisp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '提示文字',
  `addtime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`advtype_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '广告类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_advtype
-- ----------------------------
INSERT INTO `fa_advtype` VALUES (4, '搜索页顶部广告', 100, '这是搜索页顶部广告', '1673826245');
INSERT INTO `fa_advtype` VALUES (5, '搜索页底部广告', 100, '这是搜索页底部广告', '1673826264');
INSERT INTO `fa_advtype` VALUES (7, '搜索页按钮广告', 100, '这是搜索页按钮广告', '1673826284');
INSERT INTO `fa_advtype` VALUES (8, '进群广告', 100, '这是进群广告内容', '1674115256');
INSERT INTO `fa_advtype` VALUES (9, '定时广告', 100, '这是定时广告内容', '1674120007');
INSERT INTO `fa_advtype` VALUES (10, '置顶广告', 100, '这是置顶广告的内容', '1674713452');

-- ----------------------------
-- Table structure for fa_area
-- ----------------------------
DROP TABLE IF EXISTS `fa_area`;
CREATE TABLE `fa_area`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) NULL DEFAULT NULL COMMENT '父id',
  `shortname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简称',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `mergename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '全称',
  `level` tinyint(4) NULL DEFAULT NULL COMMENT '层级:1=省,2=市,3=区/县',
  `pinyin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '拼音',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '长途区号',
  `zip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮编',
  `first` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '首字母',
  `lng` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '地区表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_attachment
-- ----------------------------
DROP TABLE IF EXISTS `fa_attachment`;
CREATE TABLE `fa_attachment`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '类别',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片帧数',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '文件名称',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `mimetype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '透传数据',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建日期',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `uploadtime` bigint(16) NULL DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group`;
CREATE TABLE `fa_auth_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父组别',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则ID',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_auth_group
-- ----------------------------
INSERT INTO `fa_auth_group` VALUES (1, 0, 'Admin group', '*', 1491635035, 1491635035, 'normal');
INSERT INTO `fa_auth_group` VALUES (6, 1, '管理员', '1,13,14,16,15,17,2,6,18,19,20,21,22,7,23,24,25,26,27,28,8,29,30,31,32,33,34,5,9,40,41,42,43,10,44,45,46,11,47,48,49,50,12,51,52,53,54,220,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,115,116,117,118,119,120,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,225,226,227,228,229,230,231,232', 1674021601, 1682833331, 'normal');

-- ----------------------------
-- Table structure for fa_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group_access`;
CREATE TABLE `fa_auth_group_access`  (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID',
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '权限分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_auth_group_access
-- ----------------------------
INSERT INTO `fa_auth_group_access` VALUES (1, 1);
INSERT INTO `fa_auth_group_access` VALUES (2, 6);

-- ----------------------------
-- Table structure for fa_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_rule`;
CREATE TABLE `fa_auth_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图标',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '规则URL',
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为菜单',
  `menutype` enum('addtabs','blank','dialog','ajax') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单类型',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '扩展属性',
  `py` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '拼音首字母',
  `pinyin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '拼音',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 239 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_auth_rule
-- ----------------------------
INSERT INTO `fa_auth_rule` VALUES (1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', '', 'Dashboard tips', 1, NULL, '', 'kzt', 'kongzhitai', 1491635035, 1491635035, 143, 'normal');
INSERT INTO `fa_auth_rule` VALUES (2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', '', 1, NULL, '', 'cggl', 'changguiguanli', 1491635035, 1491635035, 137, 'normal');
INSERT INTO `fa_auth_rule` VALUES (5, 'file', 0, 'auth', '权限管理', 'fa fa-group', '', '', '', 1, 'addtabs', '', 'qxgl', 'quanxianguanli', 1491635035, 1677063678, 99, 'normal');
INSERT INTO `fa_auth_rule` VALUES (6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', '', 'Config tips', 1, NULL, '', 'xtpz', 'xitongpeizhi', 1491635035, 1491635035, 60, 'normal');
INSERT INTO `fa_auth_rule` VALUES (7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', '', 'Attachment tips', 1, NULL, '', 'fjgl', 'fujianguanli', 1491635035, 1491635035, 53, 'normal');
INSERT INTO `fa_auth_rule` VALUES (8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', '', 1, NULL, '', 'grzl', 'gerenziliao', 1491635035, 1491635035, 34, 'normal');
INSERT INTO `fa_auth_rule` VALUES (9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', '', 'Admin tips', 1, NULL, '', 'glygl', 'guanliyuanguanli', 1491635035, 1491635035, 118, 'normal');
INSERT INTO `fa_auth_rule` VALUES (10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', '', 'Admin log tips', 1, NULL, '', 'glyrz', 'guanliyuanrizhi', 1491635035, 1491635035, 113, 'normal');
INSERT INTO `fa_auth_rule` VALUES (11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', '', 'Group tips', 1, NULL, '', 'jsz', 'juesezu', 1491635035, 1491635035, 109, 'normal');
INSERT INTO `fa_auth_rule` VALUES (12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', '', 'Rule tips', 1, NULL, '', 'cdgz', 'caidanguize', 1491635035, 1491635035, 104, 'normal');
INSERT INTO `fa_auth_rule` VALUES (13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 136, 'normal');
INSERT INTO `fa_auth_rule` VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 135, 'normal');
INSERT INTO `fa_auth_rule` VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 133, 'normal');
INSERT INTO `fa_auth_rule` VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 134, 'normal');
INSERT INTO `fa_auth_rule` VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 132, 'normal');
INSERT INTO `fa_auth_rule` VALUES (18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 52, 'normal');
INSERT INTO `fa_auth_rule` VALUES (19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 51, 'normal');
INSERT INTO `fa_auth_rule` VALUES (20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 50, 'normal');
INSERT INTO `fa_auth_rule` VALUES (21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 49, 'normal');
INSERT INTO `fa_auth_rule` VALUES (22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 48, 'normal');
INSERT INTO `fa_auth_rule` VALUES (23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', '', 'Attachment tips', 0, NULL, '', '', '', 1491635035, 1491635035, 59, 'normal');
INSERT INTO `fa_auth_rule` VALUES (24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 58, 'normal');
INSERT INTO `fa_auth_rule` VALUES (25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 57, 'normal');
INSERT INTO `fa_auth_rule` VALUES (26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 56, 'normal');
INSERT INTO `fa_auth_rule` VALUES (27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 55, 'normal');
INSERT INTO `fa_auth_rule` VALUES (28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 54, 'normal');
INSERT INTO `fa_auth_rule` VALUES (29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 33, 'normal');
INSERT INTO `fa_auth_rule` VALUES (30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 32, 'normal');
INSERT INTO `fa_auth_rule` VALUES (31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 31, 'normal');
INSERT INTO `fa_auth_rule` VALUES (32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 30, 'normal');
INSERT INTO `fa_auth_rule` VALUES (33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 29, 'normal');
INSERT INTO `fa_auth_rule` VALUES (34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 28, 'normal');
INSERT INTO `fa_auth_rule` VALUES (40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', '', 'Admin tips', 0, NULL, '', '', '', 1491635035, 1491635035, 117, 'normal');
INSERT INTO `fa_auth_rule` VALUES (41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 116, 'normal');
INSERT INTO `fa_auth_rule` VALUES (42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 115, 'normal');
INSERT INTO `fa_auth_rule` VALUES (43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 114, 'normal');
INSERT INTO `fa_auth_rule` VALUES (44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', '', 'Admin log tips', 0, NULL, '', '', '', 1491635035, 1491635035, 112, 'normal');
INSERT INTO `fa_auth_rule` VALUES (45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 111, 'normal');
INSERT INTO `fa_auth_rule` VALUES (46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 110, 'normal');
INSERT INTO `fa_auth_rule` VALUES (47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', '', 'Group tips', 0, NULL, '', '', '', 1491635035, 1491635035, 108, 'normal');
INSERT INTO `fa_auth_rule` VALUES (48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 107, 'normal');
INSERT INTO `fa_auth_rule` VALUES (49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 106, 'normal');
INSERT INTO `fa_auth_rule` VALUES (50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 105, 'normal');
INSERT INTO `fa_auth_rule` VALUES (51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', '', 'Rule tips', 0, NULL, '', '', '', 1491635035, 1491635035, 103, 'normal');
INSERT INTO `fa_auth_rule` VALUES (52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 102, 'normal');
INSERT INTO `fa_auth_rule` VALUES (53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 101, 'normal');
INSERT INTO `fa_auth_rule` VALUES (54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 100, 'normal');
INSERT INTO `fa_auth_rule` VALUES (66, 'file', 0, 'user', 'User', 'fa fa-user-circle', '', '', '', 0, NULL, '', 'hygl', 'huiyuanguanli', 1491635035, 1673832647, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', '', 1, NULL, '', 'hygl', 'huiyuanguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', '', 1, NULL, '', 'hyfz', 'huiyuanfenzu', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'hygz', 'huiyuanguize', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (115, 'file', 0, 'member', '会员管理', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'hygl', 'huiyuanguanli', 1672580429, 1673832822, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (116, 'file', 115, 'member/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1672580429, 1674808304, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (117, 'file', 115, 'member/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1672580429, 1674808304, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (118, 'file', 115, 'member/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1672580429, 1674808304, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (119, 'file', 115, 'member/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1672580429, 1674808304, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (120, 'file', 115, 'member/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1672580429, 1674808304, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (127, 'file', 0, 'page', '自定义按钮', 'fa fa-circle-o\r', '', '', '', 1, NULL, '', 'zdyan', 'zidingyianniu', 1672581737, 1672581737, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (128, 'file', 127, 'page/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1672581737, 1672581737, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (129, 'file', 127, 'page/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hsz', 'huishouzhan', 1672581737, 1672581737, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (130, 'file', 127, 'page/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1672581737, 1672581737, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (131, 'file', 127, 'page/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1672581737, 1672581737, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (132, 'file', 127, 'page/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1672581737, 1672581737, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (133, 'file', 127, 'page/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zssc', 'zhenshishanchu', 1672581737, 1672581737, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (134, 'file', 127, 'page/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hy', 'huanyuan', 1672581737, 1672581737, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (135, 'file', 127, 'page/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1672581737, 1672581737, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (136, 'file', 0, 'group', '群组管理', 'fa fa-group', '', '', '', 1, 'addtabs', '', 'qzgl', 'qunzuguanli', 1672583612, 1673832717, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (137, 'file', 136, 'group/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1672583612, 1674808724, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (138, 'file', 136, 'group/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1672583612, 1674808724, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (139, 'file', 136, 'group/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1672583612, 1674808724, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (140, 'file', 136, 'group/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1672583612, 1674808724, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (141, 'file', 136, 'group/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1672583612, 1674808724, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (142, 'file', 0, 'keyword', '关键词管理', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'gjcgl', 'guanjianciguanli', 1672583658, 1673832730, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (143, 'file', 142, 'keyword/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1672583658, 1672583658, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (144, 'file', 142, 'keyword/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1672583658, 1672583658, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (145, 'file', 142, 'keyword/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1672583658, 1672583658, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (146, 'file', 142, 'keyword/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1672583658, 1672583658, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (147, 'file', 142, 'keyword/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1672583658, 1672583658, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (148, 'file', 0, 'weight', '权重管理', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'qzgl', 'quanzhongguanli', 1672583789, 1673832743, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (149, 'file', 148, 'weight/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1672583789, 1672583789, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (150, 'file', 148, 'weight/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1672583789, 1672583789, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (151, 'file', 148, 'weight/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1672583789, 1672583789, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (152, 'file', 148, 'weight/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1672583789, 1672583789, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (153, 'file', 148, 'weight/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1672583789, 1672583789, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (154, 'file', 0, 'functions', '功能页面设置', 'fa fa-circle-o\r', '', '', '', 1, NULL, '', 'gnymsz', 'gongnengyemianshezhi', 1672585143, 1672585143, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (155, 'file', 154, 'functions/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1672585143, 1674808871, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (156, 'file', 154, 'functions/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1672585143, 1674808871, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (157, 'file', 154, 'functions/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1672585143, 1674808871, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (158, 'file', 154, 'functions/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1672585143, 1674808871, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (159, 'file', 154, 'functions/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1672585143, 1674808871, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (160, 'file', 0, 'order', '充值订单', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'czdd', 'chongzhidingdan', 1673558173, 1675312975, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (161, 'file', 160, 'order/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1673558173, 1673558297, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (162, 'file', 160, 'order/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1673558173, 1673558297, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (163, 'file', 160, 'order/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1673558173, 1673558297, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (164, 'file', 160, 'order/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1673558173, 1673558297, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (165, 'file', 160, 'order/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1673558173, 1673558297, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (166, 'file', 0, 'advtype', '广告类型', 'fa fa-circle-o\r', '', '', '', 1, NULL, '', 'gglx', 'guanggaoleixing', 1673560235, 1673560235, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (167, 'file', 166, 'advtype/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1673560235, 1674133440, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (168, 'file', 166, 'advtype/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1673560235, 1674133440, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (169, 'file', 166, 'advtype/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1673560235, 1674133440, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (170, 'file', 166, 'advtype/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1673560235, 1674133440, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (171, 'file', 166, 'advtype/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1673560235, 1674133440, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (172, 'file', 0, 'adv', '广告管理', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'gggl', 'guanggaoguanli', 1673560253, 1673832760, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (173, 'file', 172, 'adv/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1673560253, 1673560253, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (174, 'file', 172, 'adv/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1673560253, 1673560253, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (175, 'file', 172, 'adv/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1673560253, 1673560253, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (176, 'file', 172, 'adv/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1673560253, 1673560253, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (177, 'file', 172, 'adv/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1673560253, 1673560253, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (178, 'file', 0, 'message', '消息管理', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'xxgl', 'xiaoxiguanli', 1673562058, 1673832791, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (179, 'file', 178, 'message/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1673562058, 1673822498, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (180, 'file', 178, 'message/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1673562058, 1673822498, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (181, 'file', 178, 'message/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1673562058, 1673822498, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (182, 'file', 178, 'message/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1673562058, 1673822498, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (183, 'file', 178, 'message/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1673562058, 1673822498, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (190, 'file', 0, 'coin', '积分明细', 'fa fa-circle-o\r', '', '', '', 1, NULL, '', 'jfmx', 'jifenmingxi', 1674809343, 1674809343, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (191, 'file', 190, 'coin/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1674809343, 1674809343, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (192, 'file', 190, 'coin/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1674809343, 1674809343, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (193, 'file', 190, 'coin/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1674809343, 1674809343, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (194, 'file', 190, 'coin/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1674809343, 1674809343, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (195, 'file', 190, 'coin/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1674809343, 1674809343, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (196, 'file', 0, 'cash', '提现列管理', 'fa fa-circle-o\r', '', '', '', 1, NULL, '', 'txlgl', 'tixianlieguanli', 1674809745, 1674809745, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (197, 'file', 196, 'cash/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1674809745, 1675259547, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (198, 'file', 196, 'cash/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1674809745, 1675259547, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (199, 'file', 196, 'cash/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1674809745, 1675259547, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (200, 'file', 196, 'cash/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1674809745, 1675259547, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (201, 'file', 196, 'cash/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1674809745, 1675259547, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (202, 'file', 0, 'advorder', '广告订单', 'fa fa-circle-o\r', '', '', '', 1, NULL, '', 'ggdd', 'guanggaodingdan', 1675318083, 1675318083, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (203, 'file', 202, 'advorder/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1675318083, 1675318083, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (204, 'file', 202, 'advorder/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1675318083, 1675318083, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (205, 'file', 202, 'advorder/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1675318083, 1675318083, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (206, 'file', 202, 'advorder/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1675318083, 1675318083, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (207, 'file', 202, 'advorder/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1675318083, 1675318083, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (208, 'file', 0, 'balan', '余额明细', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'yemx', 'yuemingxi', 1676353234, 1676353272, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (209, 'file', 208, 'balan/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1676353234, 1677159502, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (210, 'file', 208, 'balan/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1676353234, 1677159502, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (211, 'file', 208, 'balan/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1676353234, 1677159502, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (212, 'file', 208, 'balan/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1676353234, 1677159502, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (213, 'file', 208, 'balan/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1676353234, 1677159502, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (214, 'file', 0, 'supply', '供需列表', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'gxlb', 'gongxuliebiao', 1677312150, 1677312183, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (215, 'file', 214, 'supply/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1677312150, 1677312150, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (216, 'file', 214, 'supply/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1677312150, 1677312150, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (217, 'file', 214, 'supply/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1677312150, 1677312150, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (218, 'file', 214, 'supply/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1677312150, 1677312150, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (219, 'file', 214, 'supply/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1677312150, 1677312150, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (220, 'file', 5, 'addon', '插件管理', 'fa fa-rocket', '', '', '', 1, 'addtabs', '', 'cjgl', 'chajianguanli', 1682831720, 1682831902, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (225, 'file', 0, 'command', '在线命令管理', 'fa fa-terminal', '', '', '', 1, NULL, '', 'zxmlgl', 'zaixianminglingguanli', 1682833182, 1682833182, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (226, 'file', 225, 'command/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1682833182, 1682833182, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (227, 'file', 225, 'command/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1682833182, 1682833182, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (228, 'file', 225, 'command/detail', '详情', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xq', 'xiangqing', 1682833182, 1682833182, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (229, 'file', 225, 'command/command', '生成并执行命令', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'scbzxml', 'shengchengbingzhixingmingling', 1682833182, 1682833182, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (230, 'file', 225, 'command/execute', '再次执行命令', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zczxml', 'zaicizhixingmingling', 1682833182, 1682833182, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (231, 'file', 225, 'command/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1682833182, 1682833182, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (232, 'file', 225, 'command/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1682833182, 1682833182, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (233, 'file', 0, 'search', '搜索日志', 'fa fa-search', '', '', '', 1, NULL, '', 'ssrz', 'sousuorizhi', 1704190689, 1704190689, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (234, 'file', 233, 'search/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1704190689, 1704190689, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (235, 'file', 233, 'search/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1704190689, 1704190689, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (236, 'file', 233, 'search/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1704190689, 1704190689, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (237, 'file', 233, 'search/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1704190689, 1704190689, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (238, 'file', 233, 'search/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1704190689, 1704190689, 0, 'normal');

-- ----------------------------
-- Table structure for fa_balan
-- ----------------------------
DROP TABLE IF EXISTS `fa_balan`;
CREATE TABLE `fa_balan`  (
  `balan_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `money` float NOT NULL DEFAULT 0 COMMENT '消费金额',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `addtime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`balan_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_buy
-- ----------------------------
DROP TABLE IF EXISTS `fa_buy`;
CREATE TABLE `fa_buy`  (
  `buy_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购买记录id',
  `member_id` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`buy_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '购买记录' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for fa_cash
-- ----------------------------
DROP TABLE IF EXISTS `fa_cash`;
CREATE TABLE `fa_cash`  (
  `cash_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提现id',
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `money` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '提现金额',
  `actualmoney` float NOT NULL COMMENT '充值金额',
  `surplus` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '提现后剩余金额',
  `status` enum('-1','0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态:-1=提现失败,0=提现中,1=提现成功',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提示内容',
  `utoken` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '提现到账token',
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提现到账凭证',
  `addtime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '添加时间',
  `updatetime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`cash_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '提现列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_category
-- ----------------------------
DROP TABLE IF EXISTS `fa_category`;
CREATE TABLE `fa_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `flag` set('hot','index','recommend') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `weigh`(`weigh`, `id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_coin
-- ----------------------------
DROP TABLE IF EXISTS `fa_coin`;
CREATE TABLE `fa_coin`  (
  `coin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分详情id',
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `type` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '类型:0=减少,1=增加',
  `number` int(11) NOT NULL COMMENT '数量',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '说明',
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态:0=未到账,1=已到账',
  `addtime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`coin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '积分明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_command
-- ----------------------------
DROP TABLE IF EXISTS `fa_command`;
CREATE TABLE `fa_command`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型',
  `params` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  `command` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '命令',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '返回结果',
  `executetime` bigint(16) UNSIGNED NULL DEFAULT NULL COMMENT '执行时间',
  `createtime` bigint(16) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) UNSIGNED NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('successed','failured') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'failured' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '在线命令表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_config
-- ----------------------------
DROP TABLE IF EXISTS `fa_config`;
CREATE TABLE `fa_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `visible` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '可见条件',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '变量值',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '变量字典数据',
  `rule` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '扩展属性',
  `setting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '配置',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_config
-- ----------------------------
INSERT INTO `fa_config` VALUES (1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', '', '我的网站', '', 'required', '', NULL);
INSERT INTO `fa_config` VALUES (2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '', '', NULL);
INSERT INTO `fa_config` VALUES (3, 'cdnurl', 'basic', 'Cdn url', '如果全站静态资源使用第三方云储存请配置该值', 'string', '', '', '', '', '', '');
INSERT INTO `fa_config` VALUES (4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '', '2.6.2', '', 'required', '', NULL);
INSERT INTO `fa_config` VALUES (5, 'timezone', 'basic', 'Timezone', '', 'string', '', 'Asia/Shanghai', '', 'required', '', NULL);
INSERT INTO `fa_config` VALUES (6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '', '', NULL);
INSERT INTO `fa_config` VALUES (7, 'languages', 'basic', 'Languages', '', 'array', '', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '', NULL);
INSERT INTO `fa_config` VALUES (8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', '', 'dashboard', '', 'required', '', NULL);
INSERT INTO `fa_config` VALUES (9, 'categorytype', 'dictionary', 'Category type', '', 'array', '', '{\"default\":\"默认\",\"page\":\"单页\",\"article\":\"文章\",\"test\":\"Test\"}', '', '', '', NULL);
INSERT INTO `fa_config` VALUES (10, 'configgroup', 'dictionary', 'Config group', '', 'array', '', '{\"basic\":\"基础配置\",\"email\":\"邮件配置\",\"dictionary\":\"字典配置\",\"pay\":\"支付配置\",\"botconfig\":\"机器人配置\",\"other\":\"其他设置\",\"kefu\":\"客服设置\",\"wenzi\":\"文字设置\",\"save\":\"存储配置\",\"shouquan\":\"授权管理\"}', '', '', '', NULL);
INSERT INTO `fa_config` VALUES (11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '', '1', '[\"请选择\",\"SMTP\"]', '', '', '');
INSERT INTO `fa_config` VALUES (12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', '', 'smtp.qq.com', '', '', '', '');
INSERT INTO `fa_config` VALUES (13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '', '465', '', '', '', '');
INSERT INTO `fa_config` VALUES (14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '', '10000', '', '', '', '');
INSERT INTO `fa_config` VALUES (15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码或授权码）', 'string', '', 'password', '', '', '', '');
INSERT INTO `fa_config` VALUES (16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '', '2', '[\"无\",\"TLS\",\"SSL\"]', '', '', '');
INSERT INTO `fa_config` VALUES (17, 'mail_from', 'email', 'Mail from', '', 'string', '', '10000@qq.com', '', '', '', '');
INSERT INTO `fa_config` VALUES (18, 'attachmentcategory', 'dictionary', 'Attachment category', '', 'array', '', '{\"image\":\"图片\",\"video\":\"视频\",\"other\":\"其他\"}', '', '', '', NULL);
INSERT INTO `fa_config` VALUES (19, 'payurl', 'pay', '支付链接', '支付搭建地址:https://github.com/assimon/epusdt', 'string', '', 'https://pay.hyperindex.tk/api/v1/order/create-transaction', '', 'url', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (20, 'paytoken', 'pay', '支付key', '支付搭建地址:https://github.com/assimon/epusdt', 'string', '', 'qwe12345', '', 'required', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (22, 'deftopadv', 'botconfig', '默认顶部广告', '机器人顶部广告配置', 'text', '', '<a href=\'https://t.me/i\'>TG机器人演示群组</a>', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (23, 'deffootadv', 'botconfig', '默认底部广告配置', '机器人底部广告配置', 'text', '', '指数 - 今日:{day} 本周:{weed} 本月:{moon} 今年:{year} 共计:{all}\r\n\r\n<a href=\"tg://setlanguage?lang=zhcncc\"> 【简体中文】- 语言包</a>    <a href=\"https://t.me/HFID111\">购买广告</a>', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (24, 'collecttoken', 'collect', '采集token', '', 'string', '', '', '', 'required', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (25, 'content', 'botconfig', '顶部展示内容', '顶部展示内容', 'text', '', '@HFID111', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (27, 'entertype', 'botconfig', '进群欢迎类型', '', 'radio', '', '2', '[\"关闭\",\"纯文本\",\"文本加图片\",\"文本加视频\"]', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (28, 'entertext', 'botconfig', '进群欢迎文本', '支持html', 'text', '', '欢迎{nick}进群,本机器人为专属索引演示机器人,定制开发 @HFID111', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (29, 'enterfileurl', 'botconfig', '进群欢迎文件地址', '如果文本加图片上传图片,如果文本加视频上传视频', 'file', '', '/uploads/20230119/ef2f0faba913fc3f3ab12fb331dd311a.jpg', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (30, 'enterbutton', 'botconfig', '进群按钮组', '', 'text', '', '', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (31, 'enteradv', 'botconfig', '进群欢迎是否开启广告', '进群欢迎广告', 'switch', '', '0', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (32, 'timeadv', 'botconfig', '定时广告时间', '定时广告时间设置,为0则不发送,以秒为单位', 'number', '', '3600', '', 'digits', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (33, 'lenght', 'botconfig', '关键词字数', '允许最大查询关键词字数', 'number', '', '20', '', 'required;digits', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (34, 'keyword', 'botconfig', '屏蔽关键词', '屏蔽的关键词列表以|分割(|为英文的)', 'text', '', '', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (35, 'rate', 'pay', '汇率', '', 'number', '', '7.35', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (37, 'toptext', 'other', '文字标识', '搜索页顶部广告标识', 'string', '', '[广告]', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (38, 'findshop', 'other', '找商品', '找商品展示的文字', 'string', '', '⚱️找商品', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (39, 'findshopurl', 'other', '找商品跳转链接', '找商品跳转链接', 'string', '', 'https://t.me/HFID111', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (40, 'uppage', 'other', '上一页展示文字', '', 'string', '', '上一页', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (41, 'nextpage', 'other', '下一页展示文字', '', 'string', '', '下一页', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (42, 'wyzq', 'other', '我要赚钱展示文字', '搜索页第一排中间的文字', 'string', '', '⚱️ 我要赚钱', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (43, 'wyzqurl', 'other', '我要赚钱链接', '搜索页第一排中间按钮跳转地址', 'string', '', 'https://t.me/HFID111', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (44, 'issearch', 'botconfig', '私信搜索', '是否开启机器人私信搜索功能', 'switch', '', '1', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (45, 'prigroups', 'botconfig', '私群搜索', '设置私群搜索功能是否开启,该设置作用与所有私群,不能单独设置', 'switch', '', '1', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (46, 'advother', 'botconfig', '顶部广告其他', '顶部广告其他配置', 'text', '', '广告 <a href=\"https://t.me/HFID111\">开发定制同款机器人</a>', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (47, 'cachetime', 'other', '缓存时间', '广告缓存时间(减少服务器请求)', 'number', '', '3600', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (48, 'blocktime', 'other', '禁言时间', '群组内发广告或违反规则禁言时间,单位秒', 'number', '', '3600', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (49, 'tgkf1', 'kefu', 'TG客服1', 'TG的客服信息,用于用户的更新,以及TG内用户的咨询', 'string', '', 'https://t.me/HFID111', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (50, 'tgkf2', 'kefu', 'TG客服2', 'TG的客服信息,用于用户的更新,以及TG内用户的咨询', 'string', '', 'https://t.me/HFID111', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (59, 'otherdata', 'botconfig', '操作他人查询', '操作他人查询结果的按钮提示文字', 'string', '', '请勿操作他人数据', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (60, 'nullfunctionspage', 'botconfig', '没找到功能页面提示', '没有找到功能页面提示的文字', 'string', '', '没有找到该功能页面,建议联系管理员更改', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (61, 'returnhome', 'botconfig', '返回首页按钮文字', '返回首页按钮文字', 'string', '', '返回首页', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (62, 'retnrunuppage', 'botconfig', '返回上一页按钮文字', '返回上一页按钮文字', 'string', '', '返回上一页', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (63, 'defweladv', 'botconfig', '默认进群广告', '默认的进群广告', 'string', '', '@HFID111- 这是默认的进群广告', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (64, 'timetasktoken', 'botconfig', '定时广告机器人token', '定时广告机器人token', 'string', '', '6786795549:AAGcK3A2sqpPQw2_zqBG6Zu1QIC3MlWVRLA', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (65, 'deftimetaskadv', 'botconfig', '定时默认广告', '定时默认广告', 'text', '', '<strong>本系统严禁违法使用,仅供学习研究使用哦!</strong>\r\n<strong>购买系统l联系TG:@HFID111</strong>\r\n<strong>机器人定制开发 @HFID111</strong>\r\n<strong>工作时间:19:00---24:00</strong>\r\n<strong>演示地址:.c</strong>\r\n<strong>演示用户名:test</strong>\r\n<strong>演示密码:123456</strong>\r\n<strong>机器人定制开发 @HFID111</strong>\r\n<strong>自助搭建教程htt</strong>\r\n<strong>每天19点才会自动发送本消息</strong>', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (66, 'myadv', 'wenzi', '我的广告', '我的广告展示文字', 'string', '', '我的广告', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (67, 'advtypetext', 'wenzi', '广告类型', '广告类型提示文字', 'string', '', '广告类型', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (68, 'advtypemoney', 'wenzi', '广告金额', '广告金额提示文字', 'string', '', '广告金额', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (69, 'buyadv', 'wenzi', '立即购买', '立即购买按钮提示文字', 'string', '', '立即购买', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (70, 'crateordererror', 'wenzi', '订单创建失败', '订单创建失败提示文字', 'string', '', '订单创建失败', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (71, 'crateordersuccess', 'wenzi', '订单创建成功', '订单创建成功提示文字', 'string', '', '订单创建成功', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (72, 'advcontent', 'wenzi', '广告内容', '提示文字广告内容', 'string', '', '广告内容', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (73, 'linkadd', 'wenzi', '链接地址', '提示信息链接地址', 'string', '', '链接地址', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (74, 'endtime', 'wenzi', '到期时间', '提示文字到期时间', 'string', '', '到期时间', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (75, 'advtypename', 'wenzi', '所属类型', '提示信息所属类型', 'string', '', '所属类型', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (76, 'buymoney', 'wenzi', '购买金额', '购买金额提示文字', 'string', '', '购买金额', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (77, 'renewaladv', 'wenzi', '续费广告', '续费广告提示文字', 'string', '', '续费广告', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (78, 'editadv', 'wenzi', '编辑广告', '编辑广告提示文字', 'string', '', '编辑广告', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (79, 'actioneditadv', 'wenzi', '正在编辑广告', '正在编辑广告提示文字', 'string', '', '您正在编辑的广告如下:', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (81, 'clickcopy', 'wenzi', '点击复制格式', '点击复制格式提示文字', 'string', '', '点击复制格式', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (82, 'copycontent', 'wenzi', '复制格式内容', '复制格式内容提示文字', 'string', '', '这是一个测试广告|https://www.baidu.com', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (83, 'plaseadvcontent', 'wenzi', '回复广告内容', '回复广告内容文字提示', 'string', '', '请复制上面格式回复广告内容', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (84, 'botusername', 'botconfig', '机器人用户名', '机器人用户名用于判断机器人是否在群组或频道中是否是管理员', 'string', '', 'index_test001bot', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (85, 'noadminmsg', 'botconfig', '管理员提示', '机器人不在群组或机器人不是管理员的提示文字', 'string', '', '请将机器人拉进群组或频道并给予管理员权限后再提交', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (87, 'topadvdefcon', 'botconfig', '置顶广告默认内容', '置顶广告默认内容,没有广告时展示的内容', 'text', '', '这是置顶的广告内容', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (89, 'topadvdefcontime', 'botconfig', '置顶广告时间频率', '置顶广告时间频率', 'number', '', '3600', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (90, 'bili', 'pay', '积分兑换U比例', '积分兑换U比例,比如1积分兑换0.1U则填写0.1', 'number', '', '10', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (91, 'membertop', 'wenzi', '账户信息顶部', '账户信息顶部提示文字', 'string', '', '✨✨✨✨✨账户信息✨✨✨✨✨', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (92, 'memberusername', 'wenzi', '账户信息用户名', '账户信息用户名提示文字', 'string', '', '用户名', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (93, 'membermoney', 'wenzi', '账户信息余额', '账户信息余额提示文字', 'string', '', '余额', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (94, 'membercoin', 'wenzi', '账户信息积分', '账户信息积分提示文字', 'string', '', '宜搜币', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (95, 'memberlink', 'wenzi', '账户信息推广链接', '账户信息推广链接提示文字', 'string', '', '推广链接', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (96, 'memberrech', 'wenzi', '账户中心充值按钮', '账户中心充值按钮提示文字', 'string', '', '充值', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (97, 'membertx', 'wenzi', '账户中心提现按钮', '账户中心提现按钮提示文字', 'string', '', '提现', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (98, 'memberdh', 'wenzi', '账户中心兑换按钮', '账户中心兑换按钮提示文字', 'string', '', '兑换', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (99, 'memberyemx', 'wenzi', '账户中心余额明细按钮', '账户中心余额明细按钮提示文字', 'string', '', '余额明细', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (100, 'memberjfmx', 'wenzi', '账户中心积分明细按钮', '账户中心积分明细按钮提示文字', 'string', '', '宜搜币明细', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (101, 'membersafe', 'wenzi', '账户中心账户按钮按钮', '账户中心账户按钮按钮提示文字', 'string', '', '账户安全', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (102, 'memberdhbl', 'wenzi', '账户中心兑换比例', '账户中心兑换比例提示文字', 'string', '', '当前兑换比例', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (103, 'memberrechmoney', 'wenzi', '回复充值金额', '回复充值金额提示文字', 'string', '', '请回复需要充值的金额', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (105, 'txje', 'wenzi', '提现金额回复', '提现金额回复提示语', 'string', '', '请回复您需要提现的金额', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (106, 'cashsx', 'botconfig', '提现手续费', '提现手续费比如3%则填写0.03', 'number', '', '0.03', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (107, 'settoken', 'wenzi', '回复token文字', '回复token提示文字', 'string', '', '请回复您的提现钱包token', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (108, 'newmember', 'botconfig', '邀请新用户奖励积分', '邀请新用户奖励的积分数', 'number', '', '2', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (109, 'hfkeyword', 'wenzi', '回复标签', '群组管理中设置标签回复语', 'string', '', '请回复您的标签,每个标签以小写逗号隔开,最多不超过5个', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (110, 'adminlink', 'other', '屏蔽后台联系方式', '后台登录的时的联系客服屏蔽开关', 'switch', '', '0', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (111, 'isadmin', 'botconfig', '收录是否开启管理员权限', '用户私信机器人提交收录时是否验证机器人再群里并验证是否是管理员', 'switch', '', '0', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (113, 'least', 'pay', '最少提现多少U', '最少提现多少U', 'number', '', '10', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (114, 'nogroup', 'wenzi', '没有搜索到群组提示', '没有搜索到群组提示内容', 'text', '', '暂未搜索到相关群组喔', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (115, 'addmoney', 'botconfig', '关键词广告最少递增金额', '关键词广告最少递增金额', 'number', '', '10', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (116, 's3ak', 'save', '亚马逊云ak', '亚马逊云ak', 'string', '', 'AKIAYM6CXGJEAD45S4UM', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (117, 's3sk', 'save', '亚马逊云sk', '亚马逊云sk', 'string', '', 'AKIAYM6CXGJEAD45S4UM', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (118, 'bucket', 'save', '亚马逊云桶名称', '亚马逊云桶名称', 'string', '', 'datafilenew', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (119, 'supply', 'other', '发布供需价格', '发布供需价格', 'number', '', '10', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (120, 'gxgroupid', 'other', '供需发布得群组id', '供需发布得群组id', 'string', '', '-1001854716442', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (121, 'gxgroupuser', 'other', '供需发布得群组用户名', '供需发布得群组用户名用于后期修改搜索引擎可直接搜索供需列表', 'string', '', 'testltgroup', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (124, 'licenses', 'shouquan', '授权码', '授权码', 'string', '', '', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (125, 'username', 'shouquan', 'TG用户名', '填写TG用户名,维护时要验证', 'string', '', '', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');

-- ----------------------------
-- Table structure for fa_crontab
-- ----------------------------
DROP TABLE IF EXISTS `fa_crontab`;
CREATE TABLE `fa_crontab`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '事件类型',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '事件标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事件内容',
  `schedule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Crontab格式',
  `sleep` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '延迟秒数执行',
  `maximums` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大执行次数 0为不限',
  `executes` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已经执行的次数',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `begintime` bigint(16) NULL DEFAULT NULL COMMENT '开始时间',
  `endtime` bigint(16) NULL DEFAULT NULL COMMENT '结束时间',
  `executetime` bigint(16) NULL DEFAULT NULL COMMENT '最后执行时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` enum('completed','expired','hidden','normal') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_crontab_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_crontab_log`;
CREATE TABLE `fa_crontab_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `crontab_id` int(10) NULL DEFAULT NULL COMMENT '任务ID',
  `executetime` bigint(16) NULL DEFAULT NULL COMMENT '执行时间',
  `completetime` bigint(16) NULL DEFAULT NULL COMMENT '结束时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '执行结果',
  `status` enum('success','failure') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'failure' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crontab_id`(`crontab_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_ems
-- ----------------------------
DROP TABLE IF EXISTS `fa_ems`;
CREATE TABLE `fa_ems`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'IP',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '邮箱验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_functions
-- ----------------------------
DROP TABLE IF EXISTS `fa_functions`;
CREATE TABLE `fa_functions`  (
  `functions_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '功能页面key(不能更改)',
  `tisp` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '提示文字',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '提示',
  `button` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '按钮组(仅能改文字)',
  `addtime` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '添加时间',
  `update` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`functions_id`) USING BTREE,
  UNIQUE INDEX `key`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '功能页面设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_functions
-- ----------------------------
INSERT INTO `fa_functions` VALUES (2, 'advtypelist', '这是aaaa按钮功能', '广告类型列表,按钮不可编辑,可独立使用', '1', '1674820001', '');
INSERT INTO `fa_functions` VALUES (3, 'advtype', '这是点击购买时的按钮', '广告类型详情,按钮不可编辑,不可独立使用', '1', '1674820081', '');
INSERT INTO `fa_functions` VALUES (4, 'buy', '这是购买按钮哦', '广告购买按钮,按钮不能更改,不可独立使用', '1', '1674820112', '');
INSERT INTO `fa_functions` VALUES (5, 'myadv', '我的广告功能页面', '我的广告按钮,按钮不可编辑,可独立使用', '1', '1674820135', '');
INSERT INTO `fa_functions` VALUES (6, 'advinfo', '这是广告详情页面', '我的广告详情,按钮不可编辑,不可独立使用', '1', '1674820175', '');
INSERT INTO `fa_functions` VALUES (7, 'editadv', '请回复广告信息', '编辑广告按钮,按钮不可修改,不可独立使用', '1', '1674820209', '');
INSERT INTO `fa_functions` VALUES (8, 'member', '这是个人中心哦', '个人中心页面,按钮不可更改,可独立使用', '1', '1674819761', '');
INSERT INTO `fa_functions` VALUES (9, 'recharge', '这里是充值页面哦', '充值中心页面,按钮不可更改,可独立使用', '1', '1674819876', '');
INSERT INTO `fa_functions` VALUES (10, 'rech', '1122', '充值功能,按钮不可修改,不可独立使用', '1', '1674819904', '');
INSERT INTO `fa_functions` VALUES (11, 'cash', '提现回复', '提现回复,按钮和文字都不可修改,可单独使用', '文字和按钮都不能修改', '1674823759', '');
INSERT INTO `fa_functions` VALUES (12, 'settoken', '设置token', '设置token,按钮和文字都不可修改,可单独使用', '1', '1674825462', '');
INSERT INTO `fa_functions` VALUES (13, 'membersafe', '账户安全提示文字', '账户安全,文字可修改,按钮不可更改,可独立使用', '1', '1674827532', '');
INSERT INTO `fa_functions` VALUES (14, 'groupman', '这是群管理页面', '群管页面,不可修改按钮,可更改提示,可单独使用', '1', '1674997186', '');
INSERT INTO `fa_functions` VALUES (15, 'group', '这是群设置的页面', '群设置,不可独立使用,不能修改按钮,可修改文字', '1', '1674999454', '');
INSERT INTO `fa_functions` VALUES (16, 'deletegroup', '删除页面', '删除页面,不可更改按钮,不可独立使用', '1', '1675005800', '');
INSERT INTO `fa_functions` VALUES (17, 'updategroup', '已发送更新通知,等待更新结果', '更新群组,文字可更改,按钮不可更改,不能独立使用', '1', '1675005935', '');
INSERT INTO `fa_functions` VALUES (18, 'setkey', '自定义标签页面', '自定义标签页面,按钮文字都不可更改,不能独立使用', '1', '1675006056', '');
INSERT INTO `fa_functions` VALUES (19, 'jfmx', '这是积分明细页面', '可以单独使用,不能修改按钮', '1', '1676129435', '');
INSERT INTO `fa_functions` VALUES (20, 'duihuan', '这是兑换页面', '文字可修改,按钮不可修改', '1', '1676132261', '');
INSERT INTO `fa_functions` VALUES (21, 'cooperation', '关键词列表', '文字可修改,按钮不可修改,可独立使用', '1', '1676875636', '');
INSERT INTO `fa_functions` VALUES (22, 'keyword', '这是关键词详情页面', '文字可更改,按钮不可更改,不可单独使用', 'adfasd', '1676967734', '');
INSERT INTO `fa_functions` VALUES (23, 'selectgroup', '选择需要绑定的群组', '只能修改文字,按钮不能更改,不能独立使用', '1', '1677135771', '');
INSERT INTO `fa_functions` VALUES (24, 'buykey', '购买关键词功能', '文字可修改,按钮不可修改,不可独立使用', '1', '1677137259', '');
INSERT INTO `fa_functions` VALUES (25, 'seemoney', '查看关键词历史价格', '可修改文字,不可修改按钮,不可独立使用', '1', '1677154803', '');
INSERT INTO `fa_functions` VALUES (26, 'memberyemx', '余额明细页面', '文字可更改,按钮不可更改,可独立使用', '1', '1677155659', '');

-- ----------------------------
-- Table structure for fa_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_group`;
CREATE TABLE `fa_group`  (
  `group_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `tggroup_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'TG群组id',
  `group_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'TG群组用户名',
  `group_type` enum('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '类型:0=频道,1=群组',
  `group_nick` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'TG群组名称',
  `group_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT 'TG群组介绍',
  `group_count` int(11) NOT NULL COMMENT 'TG群组总人数',
  `group_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '群组头像',
  `iscj` enum('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '是否采集:0=不是,1=是',
  `issearch` enum('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '搜索功能:0=关闭,1=开启',
  `istop` enum('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '置顶广告:0=关闭,1=开启',
  `isshield` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '2' COMMENT '关键词屏蔽:0=关闭,1=自定义,2=系统定义',
  `shieldkeyword` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '关键词列表',
  `keywordtisp` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '触发关键词提示语',
  `isenter` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '2' COMMENT '进群欢迎:0=关闭,1=自定义,2=系统定义',
  `entertype` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '欢迎类型:0=纯文本,1=图片加文本,2=视频加文本',
  `entertext` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '文本内容',
  `fileurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件地址',
  `button` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '按钮列表',
  `isenteradv` enum('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '进群广告:0=关闭,1=开启',
  `timeadv` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '2' COMMENT '定时广告:0=关闭,1=自定义,2=系统定义',
  `timetype` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '定时类型:0=纯文本,1=图片加文本,2=视频加文本',
  `timetext` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '定时广告文本内容',
  `timefileurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '定时广告文件地址',
  `timebutton` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '按钮列表',
  `handle` enum('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '是否处理:0=未处理,1=已处理',
  `searchcount` int(11) NOT NULL DEFAULT 0 COMMENT '搜索次数',
  `group_status` enum('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '群组状态:0=禁用,1=启用',
  `addtime` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '添加时间',
  `updatetime` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`group_id`) USING BTREE,
  UNIQUE INDEX `tggroup_id`(`tggroup_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '群组列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_keyword
-- ----------------------------
DROP TABLE IF EXISTS `fa_keyword`;
CREATE TABLE `fa_keyword`  (
  `keyword_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '关键词',
  `money` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '购买金额',
  `sea` int(11) NOT NULL DEFAULT '0' COMMENT '被搜索次数',
  `addtime` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`keyword_id`) USING BTREE,
  UNIQUE INDEX `name`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '关键词列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_lang
-- ----------------------------
DROP TABLE IF EXISTS `fa_lang`;
CREATE TABLE `fa_lang`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件目录',
  `raw_lang_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '原记录',
  `lang_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '改记录',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '状态:1=成功,0=失败',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_member
-- ----------------------------
DROP TABLE IF EXISTS `fa_member`;
CREATE TABLE `fa_member`  (
  `member` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `tg_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TG用户ID',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TG用户名',
  `firstname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓',
  `lastname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名',
  `headimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `money` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `coin` int(11) NOT NULL DEFAULT 0 COMMENT '积分',
  `utoken` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提现TOKEN',
  `ishhr` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否合伙人:0=不是,1=是',
  `member_id` int(11) NULL DEFAULT NULL COMMENT '上一级用户id',
  `addtime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `updatetime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`member`) USING BTREE,
  UNIQUE INDEX `tgid`(`tg_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_message
-- ----------------------------
DROP TABLE IF EXISTS `fa_message`;
CREATE TABLE `fa_message`  (
  `message_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT 1 COMMENT '用户id',
  `msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `addtime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_oldmoney
-- ----------------------------
DROP TABLE IF EXISTS `fa_oldmoney`;
CREATE TABLE `fa_oldmoney`  (
  `old_id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_id` int(11) NOT NULL COMMENT '关键词id',
  `money` float NOT NULL COMMENT '历史价格',
  `addtime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '添加时间',
  `group_id` int(11) NOT NULL COMMENT '群组id',
  PRIMARY KEY (`old_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_order
-- ----------------------------
DROP TABLE IF EXISTS `fa_order`;
CREATE TABLE `fa_order`  (
  `order_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `orderno` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `trade_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '平台订单',
  `amount` float(11, 2) NOT NULL COMMENT '人民币金额',
  `actual_amount` float(11, 2) NOT NULL COMMENT 'USDT金额',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支付USDT地址',
  `payment_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支付链接',
  `other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '其他信息',
  `status` enum('-1','0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态:-1=订单已取消,0=未支付,1=已支付',
  `addtime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `orderno`(`orderno`) USING BTREE COMMENT '订单号唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '充值管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_page
-- ----------------------------
DROP TABLE IF EXISTS `fa_page`;
CREATE TABLE `fa_page`  (
  `page_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '页面id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '键名(按钮跳转关键词,不能重复)',
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '提示文字',
  `button` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '按钮组',
  `addtime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '开始时间',
  `updatetime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`page_id`) USING BTREE,
  UNIQUE INDEX `key`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_page
-- ----------------------------
INSERT INTO `fa_page` VALUES (1, '开始按钮', 'start', '发送群组链接或@群组用户名即可实现收录\r\n必须是公开群 <a href=\"https://t.me/index_test001bot?startgroup=grpselect\">【添加群组】</a>', '[\r\n	[\r\n        \r\n         {\r\n		\"text\": \"管理我的群组\",\r\n		\"callback_data\": \"groupman\"\r\n	}],\r\n	[{\r\n		\"text\": \"广告服务\",\r\n		\"callback_data\": \"advtypelist\"\r\n	}, {\r\n		\"text\": \"商品搜索\",\r\n		\"url\": \"https:\\/\\/t.me\\/+6J78aLtaLyw0MjRk\"\r\n	}],\r\n	[{\r\n		\"text\": \"个人中心\",\r\n		\"callback_data\": \"member\"\r\n	}, {\r\n		\"text\": \"来啊赚一个亿U点这\",\r\n		\"callback_data\": \"adv\"\r\n	}],\r\n	[{\r\n		\"text\": \"关键词查询\",\r\n		\"callback_data\": \"cooperation\"\r\n	}, {\r\n		\"text\": \"我的信息\",\r\n		\"callback_data\": \"my\"\r\n	}],\r\n	[{\r\n		\"text\": \"⚙️ 设置\",\r\n		\"callback_data\": \"setting\"\r\n	}, {\r\n		\"text\": \"三方服务\",\r\n		\"callback_data\": \"other\"\r\n	}]\r\n]', '2023-01-16 04:11:42', '1696917861', NULL);
INSERT INTO `fa_page` VALUES (2, '我的', 'myurl', '这是管理我的群组按钮', 'ads', '2023-01-19 13:17:46', '1696917815', NULL);

-- ----------------------------
-- Table structure for fa_search
-- ----------------------------
DROP TABLE IF EXISTS `fa_search`;
CREATE TABLE `fa_search`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '搜索的关键词',
  `uid` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '搜索的用户id',
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '搜索的用户名',
  `nick` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '搜索的用户昵称',
  `gid` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '搜索的群组',
  `gusername` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '搜索的群组名',
  `gnick` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '搜索的群组昵称',
  `type` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '搜索类型:0=私信,1=群组',
  `addtime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '搜索日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_sms
-- ----------------------------
DROP TABLE IF EXISTS `fa_sms`;
CREATE TABLE `fa_sms`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'IP',
  `createtime` bigint(16) UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '短信验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_supply
-- ----------------------------
DROP TABLE IF EXISTS `fa_supply`;
CREATE TABLE `fa_supply`  (
  `supply_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `moneyqj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '价格区间',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片地址',
  `messid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息id',
  `desu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '供需id',
  `type` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型:0=供应,1=需求',
  `addtime` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`supply_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_user`;
CREATE TABLE `fa_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '组别ID',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `score` int(10) NOT NULL DEFAULT 0 COMMENT '积分',
  `successions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '连续登录天数',
  `maxsuccessions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '最大连续登录天数',
  `prevtime` bigint(16) NULL DEFAULT NULL COMMENT '上次登录时间',
  `logintime` bigint(16) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `joinip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '加入IP',
  `jointime` bigint(16) NULL DEFAULT NULL COMMENT '加入时间',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user
-- ----------------------------
INSERT INTO `fa_user` VALUES (1, 1, 'admin', 'admin', '752cc1464d93c7082710637673b70752', '81617a', 'admin@163.com', '13888888888', 'http://127.0.0.1/assets/img/avatar.png', 0, 0, '2017-04-08', '', 0.00, 0, 1, 1, 1491635035, 1491635035, '127.0.0.1', 0, '127.0.0.1', 1491635035, 0, 1491635035, '', 'normal', '');
INSERT INTO `fa_user` VALUES (2, 0, 'qq123456', 'qq123456', 'f80a06cb038485077c539605f36a4071', 'QTPk2L', '12da3sad213@qq.com', '13413413413', '', 1, 0, NULL, '', 0.00, 0, 1, 1, 1685730817, 1685730817, '38.126.55.41', 0, '38.126.55.41', 1685730817, 1685730817, 1685730817, '', 'normal', '');
INSERT INTO `fa_user` VALUES (3, 0, 'admin1', 'admin1', 'a0eb9a1dedda30bc3ea8de91e933461a', 'vbC9TI', '1161839630@qq.com', '15528261503', '', 1, 0, NULL, '', 0.00, 0, 1, 1, 1696899473, 1696899473, '103.156.184.181', 0, '103.156.184.181', 1696899473, 1696899473, 1696899473, '', 'normal', '');

-- ----------------------------
-- Table structure for fa_user_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_group`;
CREATE TABLE `fa_user_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '权限节点',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_group
-- ----------------------------
INSERT INTO `fa_user_group` VALUES (1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1491635035, 1491635035, 'normal');

-- ----------------------------
-- Table structure for fa_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_money_log`;
CREATE TABLE `fa_user_money_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更余额',
  `before` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更前余额',
  `after` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更后余额',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员余额变动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_rule`;
CREATE TABLE `fa_user_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) NULL DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '标题',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) NULL DEFAULT NULL COMMENT '是否菜单',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NULL DEFAULT 0 COMMENT '权重',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_rule
-- ----------------------------
INSERT INTO `fa_user_rule` VALUES (1, 0, 'index', 'Frontend', '', 1, 1491635035, 1491635035, 1, 'normal');
INSERT INTO `fa_user_rule` VALUES (2, 0, 'api', 'API Interface', '', 1, 1491635035, 1491635035, 2, 'normal');
INSERT INTO `fa_user_rule` VALUES (3, 1, 'user', 'User Module', '', 1, 1491635035, 1491635035, 12, 'normal');
INSERT INTO `fa_user_rule` VALUES (4, 2, 'user', 'User Module', '', 1, 1491635035, 1491635035, 11, 'normal');
INSERT INTO `fa_user_rule` VALUES (5, 3, 'index/user/login', 'Login', '', 0, 1491635035, 1491635035, 5, 'normal');
INSERT INTO `fa_user_rule` VALUES (6, 3, 'index/user/register', 'Register', '', 0, 1491635035, 1491635035, 7, 'normal');
INSERT INTO `fa_user_rule` VALUES (7, 3, 'index/user/index', 'User Center', '', 0, 1491635035, 1491635035, 9, 'normal');
INSERT INTO `fa_user_rule` VALUES (8, 3, 'index/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 4, 'normal');
INSERT INTO `fa_user_rule` VALUES (9, 4, 'api/user/login', 'Login', '', 0, 1491635035, 1491635035, 6, 'normal');
INSERT INTO `fa_user_rule` VALUES (10, 4, 'api/user/register', 'Register', '', 0, 1491635035, 1491635035, 8, 'normal');
INSERT INTO `fa_user_rule` VALUES (11, 4, 'api/user/index', 'User Center', '', 0, 1491635035, 1491635035, 10, 'normal');
INSERT INTO `fa_user_rule` VALUES (12, 4, 'api/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 3, 'normal');

-- ----------------------------
-- Table structure for fa_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_score_log`;
CREATE TABLE `fa_user_score_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT 0 COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT 0 COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT 0 COMMENT '变更后积分',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员积分变动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_user_token
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_token`;
CREATE TABLE `fa_user_token`  (
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `expiretime` bigint(16) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员Token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_version
-- ----------------------------
DROP TABLE IF EXISTS `fa_version`;
CREATE TABLE `fa_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '强制更新',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '版本表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_version
-- ----------------------------
INSERT INTO `fa_version` VALUES (1, '1.1.1,2', '1.2.1', '20M', '更新内容', 'http://www.fastadmin.net/download.html', 1, 1520425318, 0, 0, 'normal');

-- ----------------------------
-- Table structure for fa_weight
-- ----------------------------
DROP TABLE IF EXISTS `fa_weight`;
CREATE TABLE `fa_weight`  (
  `weight_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '群组id',
  `keyword_id` int(11) NOT NULL COMMENT '关键词id',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `payadv` int(11) NOT NULL DEFAULT 0 COMMENT '购买广告排序',
  `addtime` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`weight_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '权重列表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

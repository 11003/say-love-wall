/*
 Navicat Premium Data Transfer

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : love

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 29/05/2020 20:37:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gk_articles
-- ----------------------------
DROP TABLE IF EXISTS `gk_articles`;
CREATE TABLE `gk_articles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章描述',
  `keywords` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章关键字',
  `thumbnail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章缩略图',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章内容',
  `add_time` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gk_articles
-- ----------------------------

-- ----------------------------
-- Table structure for gk_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `gk_blacklist`;
CREATE TABLE `gk_blacklist`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `remarks` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `status` tinyint(3) NULL DEFAULT 2 COMMENT '1启用，2禁用',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  `mtime` int(11) NULL DEFAULT NULL,
  `appeal_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gk_blacklist
-- ----------------------------

-- ----------------------------
-- Table structure for gk_comments
-- ----------------------------
DROP TABLE IF EXISTS `gk_comments`;
CREATE TABLE `gk_comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posts_id` int(11) NOT NULL,
  `contents` varchar(140) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mtime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gk_comments
-- ----------------------------
INSERT INTO `gk_comments` VALUES (1, 7, '123', '183.210.65.108', 1584090043);
INSERT INTO `gk_comments` VALUES (2, 7, '123', '183.210.65.108', 1584090048);
INSERT INTO `gk_comments` VALUES (3, 8, '评论', '117.139.133.25', 1584164581);
INSERT INTO `gk_comments` VALUES (4, 8, '评论', '117.139.133.25', 1584164582);
INSERT INTO `gk_comments` VALUES (5, 8, '评论', '117.139.133.25', 1584164583);
INSERT INTO `gk_comments` VALUES (6, 8, '<p><br></p>', '117.139.133.25', 1584240418);
INSERT INTO `gk_comments` VALUES (7, 9, '<p>11111</p>', '117.139.133.25', 1584243398);
INSERT INTO `gk_comments` VALUES (8, 9, '<p><br></p>', '117.139.133.25', 1584243449);
INSERT INTO `gk_comments` VALUES (9, 9, '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '117.139.133.25', 1584243486);
INSERT INTO `gk_comments` VALUES (10, 13, '<p>好的</p>', '121.32.158.123', 1584784904);
INSERT INTO `gk_comments` VALUES (11, 13, '<p>hello</p>', '117.139.132.198', 1585104292);
INSERT INTO `gk_comments` VALUES (12, 13, '<p><br></p>', '27.212.144.40', 1585297138);
INSERT INTO `gk_comments` VALUES (13, 13, '<p><br></p>', '27.212.144.40', 1585297143);
INSERT INTO `gk_comments` VALUES (14, 13, '<p><br></p>', '27.212.144.40', 1585297144);
INSERT INTO `gk_comments` VALUES (15, 13, '<p><br></p>', '182.148.15.51', 1589507698);
INSERT INTO `gk_comments` VALUES (16, 20, '<p>这什么东西</p>', '112.96.70.119', 1590371131);
INSERT INTO `gk_comments` VALUES (17, 20, '<p>表白墙</p>', '182.148.13.127', 1590396537);

-- ----------------------------
-- Table structure for gk_config
-- ----------------------------
DROP TABLE IF EXISTS `gk_config`;
CREATE TABLE `gk_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `color` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '',
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `href` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `href_id` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `is_del` tinyint(3) UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gk_config
-- ----------------------------
INSERT INTO `gk_config` VALUES (1, '我要表白', '#0E6EB8', 'https://i.loli.net/2020/03/14/twW8AlpdGKL1qoI.png', '/saylove', '', 1);
INSERT INTO `gk_config` VALUES (2, '首页', '#FE9A76', 'https://i.loli.net/2020/03/14/UqJerws3gFBNW1C.png', '/', '', 1);
INSERT INTO `gk_config` VALUES (3, '排序', '#B03060', 'https://i.loli.net/2020/03/14/a64VXLiY97o53fJ.png', '#myPanel', '', 1);
INSERT INTO `gk_config` VALUES (4, '搜索', '#016936', 'https://i.loli.net/2020/03/14/S6UnombZY7gTJhu.png', '/search', '', 1);
INSERT INTO `gk_config` VALUES (6, '最新表白（默认）', '', 'https://i.loli.net/2020/03/14/rCgLa6f2zROx4Nb.png', '#myPanel', 'new-posts', 1);
INSERT INTO `gk_config` VALUES (7, '最早表白', '', 'https://i.loli.net/2020/03/14/rbxLUAtODGMnhp8.png', '#myPanel', 'old-posts', 1);
INSERT INTO `gk_config` VALUES (8, '点赞数最多', '', 'https://i.loli.net/2020/03/14/jsKvV4ZLrmQP8Eh.png', '#myPanel', 'most-liked', 1);
INSERT INTO `gk_config` VALUES (9, '点赞数最少', '', 'https://i.loli.net/2020/03/14/JrCUiMv9apZPtd5.png', '#myPanel', 'less-liked', 1);
INSERT INTO `gk_config` VALUES (10, '随机显示', '', 'https://i.loli.net/2020/03/14/TCoqyXthcYwbNSW.png', '#myPanel', 'random-posts', 1);
INSERT INTO `gk_config` VALUES (11, '返回顶部', '', 'https://i.loli.net/2020/03/14/mz9IjstrPaAXwyR.png', '', '', 1);
INSERT INTO `gk_config` VALUES (13, '网站首页', '', '', '', '', 1);
INSERT INTO `gk_config` VALUES (14, 'logo', '', '/upload/20200116/e84aa9adc567a54a91677e6114c6c007.jpg', NULL, '1', 1);
INSERT INTO `gk_config` VALUES (18, 'footer-logo', '', 'https://i.loli.net/2020/03/14/xB9OfTDdIZ47bol.jpg', NULL, '1', 1);

-- ----------------------------
-- Table structure for gk_guess
-- ----------------------------
DROP TABLE IF EXISTS `gk_guess`;
CREATE TABLE `gk_guess`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posts_id` int(11) NOT NULL,
  `guessName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isRight` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `ip` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mtime` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gk_guess
-- ----------------------------
INSERT INTO `gk_guess` VALUES (1, 7, '123', '1', '183.210.65.108', 1584090058);
INSERT INTO `gk_guess` VALUES (2, 20, '怕', '1', '42.228.224.177', 1588226143);
INSERT INTO `gk_guess` VALUES (3, 20, '导航', '0', '182.148.15.105', 1589891147);

-- ----------------------------
-- Table structure for gk_like
-- ----------------------------
DROP TABLE IF EXISTS `gk_like`;
CREATE TABLE `gk_like`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posts_id` int(11) NOT NULL,
  `ip` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mtime` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gk_like
-- ----------------------------
INSERT INTO `gk_like` VALUES (1, 2, '117.164.149.28', 1579627291);
INSERT INTO `gk_like` VALUES (2, 2, '117.165.191.167', 1579781661);
INSERT INTO `gk_like` VALUES (3, 4, '60.255.85.47', 1580976740);
INSERT INTO `gk_like` VALUES (4, 5, '171.35.99.161', 1582803248);
INSERT INTO `gk_like` VALUES (5, 4, '171.35.99.161', 1582803251);
INSERT INTO `gk_like` VALUES (6, 4, '113.222.5.125', 1582887839);
INSERT INTO `gk_like` VALUES (7, 6, '125.211.31.123', 1583667680);
INSERT INTO `gk_like` VALUES (8, 7, '183.210.65.108', 1584090054);
INSERT INTO `gk_like` VALUES (9, 8, '14.17.22.253', 1584100570);
INSERT INTO `gk_like` VALUES (10, 9, '117.139.133.25', 1584240708);
INSERT INTO `gk_like` VALUES (11, 11, '223.91.90.154', 1584261267);
INSERT INTO `gk_like` VALUES (12, 10, '223.91.90.154', 1584261269);
INSERT INTO `gk_like` VALUES (13, 10, '223.96.38.228', 1584708750);
INSERT INTO `gk_like` VALUES (14, 13, '121.32.158.123', 1584784883);
INSERT INTO `gk_like` VALUES (15, 13, '117.139.132.198', 1585104294);
INSERT INTO `gk_like` VALUES (16, 18, '111.197.20.161', 1588100616);
INSERT INTO `gk_like` VALUES (17, 19, '42.228.224.177', 1588222470);
INSERT INTO `gk_like` VALUES (18, 20, '42.228.224.177', 1588226154);
INSERT INTO `gk_like` VALUES (19, 19, '36.189.230.221', 1588855454);
INSERT INTO `gk_like` VALUES (20, 20, '182.148.15.105', 1589891152);
INSERT INTO `gk_like` VALUES (21, 19, '182.148.15.105', 1589891154);
INSERT INTO `gk_like` VALUES (22, 20, '171.210.190.69', 1590068734);
INSERT INTO `gk_like` VALUES (23, 20, '182.148.13.127', 1590396546);

-- ----------------------------
-- Table structure for gk_node
-- ----------------------------
DROP TABLE IF EXISTS `gk_node`;
CREATE TABLE `gk_node`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_name` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '节点名称',
  `control_name` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器名',
  `action_name` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
  `is_menu` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否是菜单项 1不是 2是',
  `type_id` int(11) NOT NULL COMMENT '父级节点id',
  `style` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单样式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gk_node
-- ----------------------------
INSERT INTO `gk_node` VALUES (1, '用户管理', '#', '#', 2, 0, 'fa fa-users');
INSERT INTO `gk_node` VALUES (2, '管理员管理', 'user', 'index', 2, 1, '');
INSERT INTO `gk_node` VALUES (3, '添加管理员', 'user', 'useradd', 1, 2, '');
INSERT INTO `gk_node` VALUES (4, '编辑管理员', 'user', 'useredit', 1, 2, '');
INSERT INTO `gk_node` VALUES (5, '删除管理员', 'user', 'userdel', 1, 2, '');
INSERT INTO `gk_node` VALUES (6, '角色管理', 'role', 'index', 2, 1, '');
INSERT INTO `gk_node` VALUES (7, '添加角色', 'role', 'roleadd', 1, 6, '');
INSERT INTO `gk_node` VALUES (8, '编辑角色', 'role', 'roleedit', 1, 6, '');
INSERT INTO `gk_node` VALUES (9, '删除角色', 'role', 'roledel', 1, 6, '');
INSERT INTO `gk_node` VALUES (10, '分配权限', 'role', 'giveaccess', 1, 6, '');
INSERT INTO `gk_node` VALUES (11, '系统管理', '#', '#', 2, 0, 'fa fa-desktop');
INSERT INTO `gk_node` VALUES (12, '数据备份/还原', 'data', 'index', 2, 11, '');
INSERT INTO `gk_node` VALUES (13, '备份数据', 'data', 'importdata', 1, 12, '');
INSERT INTO `gk_node` VALUES (14, '还原数据', 'data', 'backdata', 1, 12, '');
INSERT INTO `gk_node` VALUES (15, '节点管理', 'node', 'index', 2, 1, '');
INSERT INTO `gk_node` VALUES (16, '添加节点', 'node', 'nodeadd', 1, 15, '');
INSERT INTO `gk_node` VALUES (17, '编辑节点', 'node', 'nodeedit', 1, 15, '');
INSERT INTO `gk_node` VALUES (18, '删除节点', 'node', 'nodedel', 1, 15, '');
INSERT INTO `gk_node` VALUES (19, '文章管理', 'articles', 'index', 1, 0, 'fa fa-book');
INSERT INTO `gk_node` VALUES (20, '文章列表', 'articles', 'index', 2, 19, '');
INSERT INTO `gk_node` VALUES (21, '添加文章', 'articles', 'articleadd', 1, 19, '');
INSERT INTO `gk_node` VALUES (22, '编辑文章', 'articles', 'articleedit', 1, 19, '');
INSERT INTO `gk_node` VALUES (23, '删除文章', 'articles', 'articledel', 1, 19, '');
INSERT INTO `gk_node` VALUES (24, '上传图片', 'articles', 'uploadImg', 1, 19, '');
INSERT INTO `gk_node` VALUES (25, '个人中心', '#', '#', 1, 0, '');
INSERT INTO `gk_node` VALUES (26, '编辑信息', 'profile', 'index', 1, 25, '');
INSERT INTO `gk_node` VALUES (27, '编辑头像', 'profile', 'headedit', 1, 25, '');
INSERT INTO `gk_node` VALUES (28, '上传头像', 'profile', 'uploadheade', 1, 25, '');
INSERT INTO `gk_node` VALUES (29, '告白管理', '#', '#', 2, 0, 'fa fa-heart');
INSERT INTO `gk_node` VALUES (31, '告白列表', 'love', 'index', 2, 29, '');
INSERT INTO `gk_node` VALUES (32, '配置项', '#', '#', 2, 0, 'fa fa-cogs');
INSERT INTO `gk_node` VALUES (33, '系统', 'config', 'index', 2, 32, '');
INSERT INTO `gk_node` VALUES (34, '告白修改', 'love', 'loveedit', 1, 29, '');
INSERT INTO `gk_node` VALUES (35, '告白禁用', 'love', 'loveoff', 1, 29, '');
INSERT INTO `gk_node` VALUES (36, '告白发布', 'love', 'loveon', 1, 29, '');
INSERT INTO `gk_node` VALUES (37, 'IP小黑屋', 'address', '#', 2, 0, 'fa fa-user-times');
INSERT INTO `gk_node` VALUES (38, 'IP拉黑列表', 'address', 'index', 2, 37, '');
INSERT INTO `gk_node` VALUES (39, '拉黑添加', 'address', 'ipadd', 1, 37, '');
INSERT INTO `gk_node` VALUES (40, '拉黑禁用', 'address', 'ipoff', 1, 37, '');
INSERT INTO `gk_node` VALUES (41, '拉黑启用', 'address', 'ipon', 1, 37, '');
INSERT INTO `gk_node` VALUES (42, '系统编辑', 'config', 'configedit', 1, 32, '');
INSERT INTO `gk_node` VALUES (43, '系统添加', 'config', 'configadd', 1, 32, '');
INSERT INTO `gk_node` VALUES (44, '系统删除', 'config', 'configdel', 1, 32, '');

-- ----------------------------
-- Table structure for gk_posts
-- ----------------------------
DROP TABLE IF EXISTS `gk_posts`;
CREATE TABLE `gk_posts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `itsGender` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gender` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `trueName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `towho` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contents` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(3) NOT NULL DEFAULT 1 COMMENT '0禁用 1发布',
  `mtime` int(11) NULL DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `love` int(11) NULL DEFAULT 0,
  `loveImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `is_del` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gk_posts
-- ----------------------------
INSERT INTO `gk_posts` VALUES (1, '1', 'female', 'male', '1', '2', '1 love 2', '', 1, 1563899835, '127.0.0.1', 0, '/upload\\20190724/bb869d60d544446b3fc04b9655a21548.jpg', NULL);

-- ----------------------------
-- Table structure for gk_role
-- ----------------------------
DROP TABLE IF EXISTS `gk_role`;
CREATE TABLE `gk_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `rule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '权限节点数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gk_role
-- ----------------------------
INSERT INTO `gk_role` VALUES (1, '超级管理员', '*');
INSERT INTO `gk_role` VALUES (2, '系统维护员', '29,31,32,33,37,38');

-- ----------------------------
-- Table structure for gk_user
-- ----------------------------
DROP TABLE IF EXISTS `gk_user`;
CREATE TABLE `gk_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '密码',
  `head` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '头像',
  `login_times` int(11) NOT NULL DEFAULT 0 COMMENT '登陆次数',
  `last_login_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` int(11) NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '真实姓名',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '状态',
  `role_id` int(11) NOT NULL DEFAULT 1 COMMENT '用户角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gk_user
-- ----------------------------
INSERT INTO `gk_user` VALUES (1, 'admin', 'a9ddd2e7bdff202e3e9bca32765e9ba0', '/upload/head/PKBJLqVxga9uwA5dbpek0WmjHn6rXvD8.jpeg', 83, '127.0.0.1', 1590754993, 'admin', 1, 1);
INSERT INTO `gk_user` VALUES (2, 'test', '4bd9c8dfaaa703aeeab4bb73f7c82c00', '/upload/head/0Q6sGALkgHlwZzM3ViUh7XEN8fJPTR9F.jpeg', 5, '221.15.37.78', 1590659590, 'admin2', 1, 2);

SET FOREIGN_KEY_CHECKS = 1;

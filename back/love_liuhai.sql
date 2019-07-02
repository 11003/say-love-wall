/*
 Navicat Premium Data Transfer

 Source Server         : db
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : 106.14.157.75:3306
 Source Schema         : love_liuhai

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 02/07/2019 11:18:11
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
  `add_time` datetime(0) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gk_articles
-- ----------------------------
INSERT INTO `gk_articles` VALUES (1, '测试', '测试', '测试', '/upload/20181220/612509bbaeb9c41575cbd77081bd37ab.png', '<p>尺寸上厕所测试长沙市从是测试</p>', '2018-12-20 17:02:58');

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gk_comments
-- ----------------------------
INSERT INTO `gk_comments` VALUES (1, 3, '羡慕', '182.97.93.196', 1545448550);


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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gk_config
-- ----------------------------
INSERT INTO `gk_config` VALUES (1, '我要表白', '#0E6EB8', '/upload/20181224/8b2f6a79533f1acdbeef9a70aceae742.png', '/saylove', '');
INSERT INTO `gk_config` VALUES (2, '首页', '#FE9A76', '/upload/20181224/91464de4792401f9e0c061c4bc27571f.png', '/', '');
INSERT INTO `gk_config` VALUES (3, '排序', '#B03060', '/upload/20181224/1ff2bdea316eecfa2180dd731c3f897f.png', '#myPanel', '');
INSERT INTO `gk_config` VALUES (4, '搜索', '#016936', '/upload/20181224/bf8547932a6128ec5c8d3a8cc96e66c4.png', '/search', '');
INSERT INTO `gk_config` VALUES (6, '最新表白（默认）', '', '/upload/20181224/a466f5f6462af33c95654475decb5815.png', '#myPanel', 'new-posts');
INSERT INTO `gk_config` VALUES (7, '最早表白', '', '/upload/20181224/3d8ae5bc6789a104791a80688020b87d.png', '#myPanel', 'old-posts');
INSERT INTO `gk_config` VALUES (8, '点赞数最多', '', '/upload/20181224/7a560d7f18efbd3ebe4835f7c7b54aba.png', '#myPanel', 'most-liked');
INSERT INTO `gk_config` VALUES (9, '点赞数最少', '', '/upload/20181224/73d4c55bef5840cca951b06e6ad67faf.png', '#myPanel', 'less-liked');
INSERT INTO `gk_config` VALUES (10, '随机显示', '', '/upload/20181224/74bb801e05b01e6b382e78e93258f9e0.png', '#myPanel', 'random-posts');
INSERT INTO `gk_config` VALUES (11, '返回顶部', '', '/upload/20181224/870d034ef6954b1a580bc7203d310731.png', '', '');
INSERT INTO `gk_config` VALUES (13, '网站首页', '', '/upload/20190702/40575324378be99e92cd483b67b42861.jpg', '', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gk_guess
-- ----------------------------
INSERT INTO `gk_guess` VALUES (1, 1, '-', '1', '182.104.3.100', 1545387668);


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
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gk_like
-- ----------------------------
INSERT INTO `gk_like` VALUES (1, 3, '127.0.0.1', 1545369653);


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
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gk_posts
-- ----------------------------
INSERT INTO `gk_posts` VALUES (1, '秘密', 'female', 'secrecy', '-', '不告诉你', '共科院告白墙正式启用啦~小伙伴们快来给自己喜欢的人表白吧！╰(￣▽￣)╭~~~  更多功能戳右下角的“帮助”', '', 1, 1545385468, '218.65.11.32', 9, 'undefined');

-- ----------------------------
-- Table structure for gk_role
-- ----------------------------
DROP TABLE IF EXISTS `gk_role`;
CREATE TABLE `gk_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `rule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '权限节点数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gk_role
-- ----------------------------
INSERT INTO `gk_role` VALUES (1, '超级管理员', '*');
INSERT INTO `gk_role` VALUES (2, '系统维护员', '1,2,3,4,5,6,7,8,9,10,15,16,17,18,19,20,21,29,31,34,35');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gk_user
-- ----------------------------
INSERT INTO `gk_user` VALUES (1, 'admin', 'a9ddd2e7bdff202e3e9bca32765e9ba0', '/upload/head/nY6UxMZIaXlOjivRPNwcSkFVeBtzsq1W.jpeg', 71, '222.211.206.253', 1562035465, 'admin', 1, 1);
INSERT INTO `gk_user` VALUES (2, 'admin1', '17a30769ff8f58e57de69c49d302a757', '/static/admin/images/profile_small.jpg', 5, '127.0.0.1', 1545217672, '2', 1, 2);

SET FOREIGN_KEY_CHECKS = 1;

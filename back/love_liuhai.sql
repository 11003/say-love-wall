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

 Date: 02/07/2019 12:05:19
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
INSERT INTO `gk_comments` VALUES (2, 6, '羡慕啊', '182.97.93.196', 1545451023);
INSERT INTO `gk_comments` VALUES (3, 3, '会不会是张宇俊', '223.104.172.120', 1545463770);
INSERT INTO `gk_comments` VALUES (4, 3, '有主了', '111.73.171.51', 1545467059);
INSERT INTO `gk_comments` VALUES (5, 8, '说的这么肉麻是想干嘛？', '117.136.110.124', 1545704696);
INSERT INTO `gk_comments` VALUES (6, 12, '恭喜', '106.224.194.167', 1545716579);
INSERT INTO `gk_comments` VALUES (7, 14, '为什么连Ta的名字都不敢表达出？', '218.65.11.32', 1545878654);

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
INSERT INTO `gk_guess` VALUES (2, 1, 'q', '0', '182.97.242.219', 1545391197);
INSERT INTO `gk_guess` VALUES (3, 2, '陶', '0', '182.97.28.108', 1545396663);
INSERT INTO `gk_guess` VALUES (4, 2, '刘', '0', '182.97.28.108', 1545396668);
INSERT INTO `gk_guess` VALUES (5, 2, '刘', '0', '182.97.28.108', 1545396670);
INSERT INTO `gk_guess` VALUES (6, 2, '陶璐璐', '0', '182.97.28.108', 1545396693);
INSERT INTO `gk_guess` VALUES (7, 2, '陶璐璐', '0', '182.97.28.108', 1545396695);
INSERT INTO `gk_guess` VALUES (8, 2, '陶璐璐', '0', '182.97.28.108', 1545396696);
INSERT INTO `gk_guess` VALUES (9, 2, '陶璐璐', '0', '182.97.28.108', 1545396820);
INSERT INTO `gk_guess` VALUES (10, 1, '陶璐璐', '0', '182.97.28.108', 1545396834);
INSERT INTO `gk_guess` VALUES (11, 1, '刘海', '0', '182.97.28.108', 1545396853);
INSERT INTO `gk_guess` VALUES (12, 1, '熊', '0', '182.97.28.108', 1545396859);
INSERT INTO `gk_guess` VALUES (13, 1, '秦', '0', '182.97.28.108', 1545396863);
INSERT INTO `gk_guess` VALUES (14, 1, '秦', '0', '182.97.28.108', 1545396864);
INSERT INTO `gk_guess` VALUES (15, 2, '欧文', '0', '218.65.11.32', 1545399493);
INSERT INTO `gk_guess` VALUES (16, 2, '二', '0', '218.65.11.32', 1545399501);
INSERT INTO `gk_guess` VALUES (17, 2, '海', '1', '218.65.11.32', 1545399505);
INSERT INTO `gk_guess` VALUES (18, 3, '何琴', '0', '182.97.93.196', 1545439748);
INSERT INTO `gk_guess` VALUES (19, 3, '何', '0', '182.97.93.196', 1545439753);
INSERT INTO `gk_guess` VALUES (20, 3, '琴', '0', '182.97.93.196', 1545439759);
INSERT INTO `gk_guess` VALUES (21, 4, '包裹', '0', '182.97.93.196', 1545442501);
INSERT INTO `gk_guess` VALUES (22, 4, '测试', '0', '182.97.93.196', 1545442509);
INSERT INTO `gk_guess` VALUES (23, 4, '测试', '0', '182.97.93.196', 1545442510);
INSERT INTO `gk_guess` VALUES (24, 4, '测试', '0', '182.97.93.196', 1545442511);
INSERT INTO `gk_guess` VALUES (25, 3, '琴', '0', '182.97.93.196', 1545449635);
INSERT INTO `gk_guess` VALUES (26, 3, '琴姐姐', '0', '182.97.93.196', 1545449645);
INSERT INTO `gk_guess` VALUES (27, 3, '琴', '0', '182.97.93.196', 1545449649);
INSERT INTO `gk_guess` VALUES (28, 2, '琴', '0', '182.97.93.196', 1545449678);
INSERT INTO `gk_guess` VALUES (29, 5, '刘海', '0', '223.104.172.143', 1545450770);
INSERT INTO `gk_guess` VALUES (30, 5, '刘', '0', '223.104.172.143', 1545450780);
INSERT INTO `gk_guess` VALUES (31, 5, '刘承峰', '1', '223.104.172.143', 1545450838);
INSERT INTO `gk_guess` VALUES (32, 4, '曾', '0', '218.65.11.32', 1545455473);
INSERT INTO `gk_guess` VALUES (33, 4, '曾雪', '0', '218.65.11.32', 1545455477);
INSERT INTO `gk_guess` VALUES (34, 4, '益雪', '0', '218.65.11.32', 1545455485);
INSERT INTO `gk_guess` VALUES (35, 4, '益雪', '0', '218.65.11.32', 1545455486);
INSERT INTO `gk_guess` VALUES (36, 4, '益雪', '0', '218.65.11.32', 1545455486);
INSERT INTO `gk_guess` VALUES (37, 4, '益雪', '0', '218.65.11.32', 1545455486);
INSERT INTO `gk_guess` VALUES (38, 4, '益雪', '0', '218.65.11.32', 1545455487);
INSERT INTO `gk_guess` VALUES (39, 4, '益雪曾', '0', '218.65.11.32', 1545455492);
INSERT INTO `gk_guess` VALUES (40, 4, '益曾', '0', '218.65.11.32', 1545455496);
INSERT INTO `gk_guess` VALUES (41, 4, '曾益雪', '0', '218.65.11.32', 1545455501);
INSERT INTO `gk_guess` VALUES (42, 6, '刘', '0', '182.97.88.166', 1545475489);
INSERT INTO `gk_guess` VALUES (43, 4, '不', '0', '218.65.11.32', 1545483833);
INSERT INTO `gk_guess` VALUES (44, 3, '不', '0', '218.65.11.32', 1545483839);
INSERT INTO `gk_guess` VALUES (45, 7, '王浩', '1', '117.45.201.224', 1545493025);
INSERT INTO `gk_guess` VALUES (46, 9, '蓝', '0', '117.45.201.224', 1545538700);
INSERT INTO `gk_guess` VALUES (47, 10, '张', '0', '117.45.201.224', 1545542045);
INSERT INTO `gk_guess` VALUES (48, 4, '肖雪益', '1', '117.136.110.124', 1545704778);
INSERT INTO `gk_guess` VALUES (49, 12, '不说', '0', '106.224.194.167', 1545716691);
INSERT INTO `gk_guess` VALUES (50, 12, '嗯嗯', '0', '106.224.194.167', 1545716698);
INSERT INTO `gk_guess` VALUES (51, 12, '瑾', '0', '106.224.194.167', 1545716712);
INSERT INTO `gk_guess` VALUES (52, 12, '王瑾', '0', '106.224.194.167', 1545716721);
INSERT INTO `gk_guess` VALUES (53, 12, '瑾儿', '0', '106.224.194.167', 1545716731);
INSERT INTO `gk_guess` VALUES (54, 12, '瑾儿', '0', '106.224.194.167', 1545716732);
INSERT INTO `gk_guess` VALUES (55, 12, '瑾年', '0', '106.224.194.167', 1545716738);
INSERT INTO `gk_guess` VALUES (56, 12, '瑾年', '0', '106.224.194.167', 1545716738);
INSERT INTO `gk_guess` VALUES (57, 12, '瑾年', '0', '106.224.194.167', 1545716739);
INSERT INTO `gk_guess` VALUES (58, 12, '王菁', '0', '218.65.11.32', 1545720251);
INSERT INTO `gk_guess` VALUES (59, 13, '嗯嗯', '0', '106.224.194.167', 1545752859);
INSERT INTO `gk_guess` VALUES (60, 13, '嗯嗯', '0', '106.224.194.167', 1545752860);
INSERT INTO `gk_guess` VALUES (61, 13, '嗯嗯', '0', '106.224.194.167', 1545752864);
INSERT INTO `gk_guess` VALUES (62, 2, '滚滚滚', '0', '171.217.142.254', 1545776229);
INSERT INTO `gk_guess` VALUES (63, 4, '何佳仟', '0', '223.215.78.186', 1545812266);
INSERT INTO `gk_guess` VALUES (64, 3, '何佳仟', '0', '223.215.78.186', 1545812308);
INSERT INTO `gk_guess` VALUES (65, 2, '何佳仟', '0', '223.215.78.186', 1545812314);
INSERT INTO `gk_guess` VALUES (66, 13, '何佳仟', '0', '223.215.78.186', 1545812320);
INSERT INTO `gk_guess` VALUES (67, 12, '何佳仟', '0', '223.215.78.186', 1545812325);
INSERT INTO `gk_guess` VALUES (68, 10, '何佳仟', '0', '223.215.78.186', 1545812334);
INSERT INTO `gk_guess` VALUES (69, 6, '何佳仟', '0', '223.215.78.186', 1545812345);
INSERT INTO `gk_guess` VALUES (70, 12, '瑾', '0', '218.65.11.32', 1545828534);
INSERT INTO `gk_guess` VALUES (71, 12, '王瑾', '0', '218.65.11.32', 1545828539);
INSERT INTO `gk_guess` VALUES (72, 7, '网红', '0', '218.65.11.32', 1545832853);
INSERT INTO `gk_guess` VALUES (73, 7, '王浩', '1', '218.65.11.32', 1545832857);

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
INSERT INTO `gk_like` VALUES (2, 3, '192.168.0.2', 1545371492);
INSERT INTO `gk_like` VALUES (3, 1, '182.97.242.219', 1545391296);
INSERT INTO `gk_like` VALUES (4, 1, '218.65.11.32', 1545396065);
INSERT INTO `gk_like` VALUES (5, 2, '117.136.110.165', 1545396445);
INSERT INTO `gk_like` VALUES (6, 1, '117.136.110.165', 1545396576);
INSERT INTO `gk_like` VALUES (7, 2, '218.65.11.32', 1545397123);
INSERT INTO `gk_like` VALUES (8, 3, '182.97.93.196', 1545436545);
INSERT INTO `gk_like` VALUES (9, 3, '125.69.125.76', 1545440083);
INSERT INTO `gk_like` VALUES (10, 3, '117.136.110.56', 1545440638);
INSERT INTO `gk_like` VALUES (11, 2, '117.136.110.56', 1545440639);
INSERT INTO `gk_like` VALUES (12, 4, '182.97.93.196', 1545441349);
INSERT INTO `gk_like` VALUES (13, 1, '182.97.93.196', 1545446560);
INSERT INTO `gk_like` VALUES (14, 6, '223.104.172.143', 1545450708);
INSERT INTO `gk_like` VALUES (15, 5, '223.104.172.143', 1545450711);
INSERT INTO `gk_like` VALUES (16, 3, '223.104.172.143', 1545450715);
INSERT INTO `gk_like` VALUES (17, 2, '223.104.172.143', 1545450717);
INSERT INTO `gk_like` VALUES (18, 1, '223.104.172.143', 1545450718);
INSERT INTO `gk_like` VALUES (19, 6, '218.65.11.32', 1545455456);
INSERT INTO `gk_like` VALUES (20, 4, '223.104.172.120', 1545463794);
INSERT INTO `gk_like` VALUES (21, 3, '118.212.209.141', 1545472331);
INSERT INTO `gk_like` VALUES (22, 4, '125.69.125.76', 1545476308);
INSERT INTO `gk_like` VALUES (23, 7, '218.65.11.32', 1545482718);
INSERT INTO `gk_like` VALUES (24, 8, '125.69.125.76', 1545486947);
INSERT INTO `gk_like` VALUES (25, 9, '182.97.93.196', 1545493568);
INSERT INTO `gk_like` VALUES (26, 5, '182.97.93.196', 1545493665);
INSERT INTO `gk_like` VALUES (27, 9, '182.97.86.81', 1545529500);
INSERT INTO `gk_like` VALUES (28, 9, '218.65.11.32', 1545538355);
INSERT INTO `gk_like` VALUES (29, 1, '117.45.201.224', 1545538684);
INSERT INTO `gk_like` VALUES (30, 1, '182.97.86.81', 1545541822);
INSERT INTO `gk_like` VALUES (31, 3, '182.97.86.81', 1545541824);
INSERT INTO `gk_like` VALUES (32, 5, '183.220.47.203', 1545542222);
INSERT INTO `gk_like` VALUES (33, 4, '183.220.47.203', 1545542224);
INSERT INTO `gk_like` VALUES (34, 3, '183.220.47.203', 1545542225);
INSERT INTO `gk_like` VALUES (35, 2, '183.220.47.203', 1545542227);
INSERT INTO `gk_like` VALUES (36, 10, '183.220.47.203', 1545548104);
INSERT INTO `gk_like` VALUES (37, 11, '183.220.47.203', 1545548348);
INSERT INTO `gk_like` VALUES (38, 10, '218.65.11.32', 1545574158);
INSERT INTO `gk_like` VALUES (39, 10, '117.136.110.124', 1545704118);
INSERT INTO `gk_like` VALUES (40, 8, '117.136.110.124', 1545704138);
INSERT INTO `gk_like` VALUES (41, 7, '117.136.110.124', 1545704144);
INSERT INTO `gk_like` VALUES (42, 4, '117.136.110.124', 1545704173);
INSERT INTO `gk_like` VALUES (43, 3, '117.136.110.124', 1545704178);
INSERT INTO `gk_like` VALUES (44, 2, '117.136.110.124', 1545704182);
INSERT INTO `gk_like` VALUES (45, 1, '117.136.110.124', 1545704185);
INSERT INTO `gk_like` VALUES (46, 9, '117.136.110.124', 1545704650);
INSERT INTO `gk_like` VALUES (47, 10, '117.136.110.44', 1545711221);
INSERT INTO `gk_like` VALUES (48, 9, '117.136.110.44', 1545711231);
INSERT INTO `gk_like` VALUES (49, 8, '117.136.110.44', 1545711249);
INSERT INTO `gk_like` VALUES (50, 7, '117.136.110.44', 1545711259);
INSERT INTO `gk_like` VALUES (51, 12, '117.136.110.44', 1545711391);
INSERT INTO `gk_like` VALUES (52, 12, '106.224.194.167', 1545716514);
INSERT INTO `gk_like` VALUES (53, 12, '218.65.11.32', 1545720280);
INSERT INTO `gk_like` VALUES (54, 12, '223.87.246.184', 1545737947);
INSERT INTO `gk_like` VALUES (55, 5, '223.87.246.184', 1545738185);
INSERT INTO `gk_like` VALUES (56, 4, '223.87.246.184', 1545738187);
INSERT INTO `gk_like` VALUES (57, 3, '223.87.246.184', 1545738188);
INSERT INTO `gk_like` VALUES (58, 2, '223.87.246.184', 1545738190);
INSERT INTO `gk_like` VALUES (59, 3, '106.224.194.167', 1545740283);
INSERT INTO `gk_like` VALUES (60, 10, '223.87.246.184', 1545741814);
INSERT INTO `gk_like` VALUES (61, 7, '223.87.246.184', 1545741821);
INSERT INTO `gk_like` VALUES (62, 6, '223.87.246.184', 1545741825);
INSERT INTO `gk_like` VALUES (63, 1, '223.87.246.184', 1545741871);
INSERT INTO `gk_like` VALUES (64, 13, '106.224.194.167', 1545752770);
INSERT INTO `gk_like` VALUES (65, 13, '171.217.142.254', 1545765875);
INSERT INTO `gk_like` VALUES (66, 12, '171.217.142.254', 1545776175);
INSERT INTO `gk_like` VALUES (67, 13, '218.65.11.32', 1545808329);
INSERT INTO `gk_like` VALUES (68, 8, '223.215.78.186', 1545812169);
INSERT INTO `gk_like` VALUES (69, 3, '218.65.11.32', 1545829265);
INSERT INTO `gk_like` VALUES (70, 13, '182.104.15.182', 1545837700);
INSERT INTO `gk_like` VALUES (71, 14, '118.212.211.117', 1545878377);
INSERT INTO `gk_like` VALUES (72, 14, '218.65.11.32', 1545878613);
INSERT INTO `gk_like` VALUES (73, 14, '223.87.242.252', 1545892415);
INSERT INTO `gk_like` VALUES (74, 14, '171.217.142.254', 1546003831);
INSERT INTO `gk_like` VALUES (75, 14, '106.224.147.166', 1546014522);
INSERT INTO `gk_like` VALUES (76, 15, '171.217.142.254', 1546178419);
INSERT INTO `gk_like` VALUES (77, 15, '118.112.123.212', 1546469904);
INSERT INTO `gk_like` VALUES (78, 5, '182.97.144.179', 1546515077);
INSERT INTO `gk_like` VALUES (79, 15, '222.211.206.253', 1561998129);

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
INSERT INTO `gk_posts` VALUES (2, '快到碗里来', 'female', 'male', '海', '网管少女', '期待下波漫威电影再约呀~', '1322412067@qq.com', 1, 1545392098, '218.65.11.32', 7, 'undefined');
INSERT INTO `gk_posts` VALUES (3, '路过的', 'male', 'female', '不说', '不认识啊', '扎着辫子穿着潮牌在网吧碰到过几次有点小心动啊！！！', '', 1, 1545413227, '118.212.209.141', 11, 'undefined');
INSERT INTO `gk_posts` VALUES (4, '你已不在服务区', 'male', 'female', '肖雪益', '喜马拉雅', '错过了就不再来', '', 1, 1545440704, '117.136.110.56', 6, 'undefined');
INSERT INTO `gk_posts` VALUES (5, '某人', 'female', 'male', '刘承峰', '女魔头', '岁月静好，愿你余生平平安安，快快乐乐。', '1963653425@qq.com', 1, 1545450180, '182.97.93.196', 5, '/upload/20181222/6368161d259f02a5342bd67d28d3cc91.PNG');
INSERT INTO `gk_posts` VALUES (6, '蓝', 'female', 'male', '杨', '文江', '圣诞快乐！', '321777954@qq.com', 1, 1545450685, '223.104.172.143', 3, '/upload/20181222/d6c2bcc2f8d557e7f48f31a86b1e1bad.jpg');
INSERT INTO `gk_posts` VALUES (7, '王浩', 'female', 'male', '王浩', '江雨亭', '江雨亭，我喜欢你！就是喜欢你！', '', 1, 1545480490, '218.65.11.32', 4, './upload/20181222/7934dbd53cb9da7dd06f83430edc4ece.JPG');
INSERT INTO `gk_posts` VALUES (8, '大猪蹄子', 'female', 'male', '0', '食堂打菜的小妹妹', '不知道怎么去认识你啊，如果你看到了这条信息，麻烦你以后多给我打点肉肉哈~', '', 1, 1545483738, '218.65.11.32', 4, '/upload/20181222/2b453aa611ada93e875bc96de931294a.jpg');
INSERT INTO `gk_posts` VALUES (9, '蓝', 'female', 'male', '江', '梦玲', '可怜的室友\r\n到毕业都没有勇气\r\n向这位女孩说出那三个字！', '814029073@qq.com', 1, 1545489130, '118.212.204.106', 5, 'https://upload-images.jianshu.io/upload_images/12353119-509f37578edb25d3.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240');
INSERT INTO `gk_posts` VALUES (10, '僧', 'female', 'male', 'c', '二货', '微胖的二货，又要过一个光棍节了咯，别灰心，会遇上你想遇见的那个人的，他胖胖的会给你安全感，会陪伴你左右，会让你心动。其实，微胖的女孩挺好看的，可爱呢，哈哈', '', 1, 1545529403, '218.65.11.32', 5, '/upload/20181223/dc7c75f088fd6509990be990abf2ec06.jpg');
INSERT INTO `gk_posts` VALUES (11, '测试', 'female', 'male', '测试', '测试', '测试一下啦', '', 2, 1545548295, '183.220.47.203', 1, '');
INSERT INTO `gk_posts` VALUES (12, '瑾', 'female', 'female', '张瑾', '王菁', '同性才是真爱~', '', 1, 1545711382, '117.136.110.44', 5, '');
INSERT INTO `gk_posts` VALUES (13, '项前进', 'secrecy', 'secrecy', '天才', '空', '陪伴是最长情的告白????', '', 1, 1545749922, '117.136.110.167', 4, '');
INSERT INTO `gk_posts` VALUES (14, 'XX', 'female', 'male', 'XXX', 'XX', '感情无不乎几个词，喜欢，爱，你，我。一个人的感情也是感情，两个人的感情也是感情，既然这样那我就把我的感情都给你，让你变得富有。  但是，舔狗到最后还是一无所有', '', 1, 1545878368, '118.212.211.117', 5, '');
INSERT INTO `gk_posts` VALUES (15, '木鱼', 'male', 'female', '0', '教官', '新的一年快到了，希望你快快乐乐。其实讷，在我眼里胖胖的男孩最可爱啦????', '', 1, 1546091340, '182.97.125.161', 3, '');
INSERT INTO `gk_posts` VALUES (16, '123321', 'female', 'male', '321', '321321', '12321', '814029073@qq.com', 1, 1561998344, '222.211.206.253', 0, '/upload/20190702/cf8db8155527d8822cbadc5f2f84070c.png');
INSERT INTO `gk_posts` VALUES (17, '123321', 'female', 'male', '321', '321321', '12321', '814029073@qq.com', 2, 1561998346, '222.211.206.253', 0, '/upload/20190702/d0ded01be7bed2b3a46ffe80a4510115.png');

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

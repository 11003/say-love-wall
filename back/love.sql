-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-12-24 20:35:58
-- 服务器版本： 5.5.57-log
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `love_liuhaier_x`
--

-- --------------------------------------------------------

--
-- 表的结构 `gk_articles`
--

CREATE TABLE `gk_articles` (
  `id` int(11) NOT NULL COMMENT '文章id',
  `title` varchar(155) NOT NULL COMMENT '文章标题',
  `description` varchar(255) NOT NULL COMMENT '文章描述',
  `keywords` varchar(155) NOT NULL COMMENT '文章关键字',
  `thumbnail` varchar(255) NOT NULL COMMENT '文章缩略图',
  `content` text NOT NULL COMMENT '文章内容',
  `add_time` datetime NOT NULL COMMENT '发布时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `gk_articles`
--

INSERT INTO `gk_articles` (`id`, `title`, `description`, `keywords`, `thumbnail`, `content`, `add_time`) VALUES
(1, '测试', '测试', '测试', '/upload/20181220/612509bbaeb9c41575cbd77081bd37ab.png', '<p>尺寸上厕所测试长沙市从是测试</p>', '2018-12-20 17:02:58');

-- --------------------------------------------------------

--
-- 表的结构 `gk_blacklist`
--

CREATE TABLE `gk_blacklist` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `remarks` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` tinyint(3) DEFAULT '2' COMMENT '1启用，2禁用',
  `content` text COLLATE utf8mb4_bin,
  `updated_at` int(11) DEFAULT NULL,
  `mtime` int(11) DEFAULT NULL,
  `appeal_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 表的结构 `gk_comments`
--

CREATE TABLE `gk_comments` (
  `id` int(11) NOT NULL,
  `posts_id` int(11) NOT NULL,
  `contents` varchar(140) NOT NULL,
  `ip` varchar(64) NOT NULL,
  `mtime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `gk_comments`
--

INSERT INTO `gk_comments` (`id`, `posts_id`, `contents`, `ip`, `mtime`) VALUES
(1, 3, '羡慕', '182.97.93.196', 1545448550),
(2, 6, '羡慕啊', '182.97.93.196', 1545451023),
(3, 3, '会不会是张宇俊', '223.104.172.120', 1545463770),
(4, 3, '有主了', '111.73.171.51', 1545467059);

-- --------------------------------------------------------

--
-- 表的结构 `gk_config`
--

CREATE TABLE `gk_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(22) COLLATE utf8mb4_bin DEFAULT NULL,
  `color` varchar(22) COLLATE utf8mb4_bin DEFAULT '',
  `thumbnail` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `href` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `href_id` varchar(15) COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `gk_config`
--

INSERT INTO `gk_config` (`id`, `title`, `color`, `thumbnail`, `href`, `href_id`) VALUES
(1, '我要表白', '#0E6EB8', '/upload/20181224/8b2f6a79533f1acdbeef9a70aceae742.png', '/saylove', ''),
(2, '首页', '#FE9A76', '/upload/20181224/91464de4792401f9e0c061c4bc27571f.png', '/', ''),
(3, '排序', '#B03060', '/upload/20181224/1ff2bdea316eecfa2180dd731c3f897f.png', '#myPanel', ''),
(4, '搜索', '#016936', '/upload/20181224/bf8547932a6128ec5c8d3a8cc96e66c4.png', '/search', ''),
(6, '最新表白（默认）', '', '/upload/20181224/a466f5f6462af33c95654475decb5815.png', '#myPanel', 'new-posts'),
(7, '最早表白', '', '/upload/20181224/3d8ae5bc6789a104791a80688020b87d.png', '#myPanel', 'old-posts'),
(8, '点赞数最多', '', '/upload/20181224/7a560d7f18efbd3ebe4835f7c7b54aba.png', '#myPanel', 'most-liked'),
(9, '点赞数最少', '', '/upload/20181224/73d4c55bef5840cca951b06e6ad67faf.png', '#myPanel', 'less-liked'),
(10, '随机显示', '', '/upload/20181224/74bb801e05b01e6b382e78e93258f9e0.png', '#myPanel', 'random-posts'),
(11, '返回顶部', '', '/upload/20181224/870d034ef6954b1a580bc7203d310731.png', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `gk_guess`
--

CREATE TABLE `gk_guess` (
  `id` int(11) NOT NULL,
  `posts_id` int(11) NOT NULL,
  `guessName` varchar(30) NOT NULL,
  `isRight` enum('0','1') NOT NULL DEFAULT '0',
  `ip` text NOT NULL,
  `mtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `gk_guess`
--

INSERT INTO `gk_guess` (`id`, `posts_id`, `guessName`, `isRight`, `ip`, `mtime`) VALUES
(1, 1, '-', '1', '182.104.3.100', 1545387668),
(2, 1, 'q', '0', '182.97.242.219', 1545391197),
(3, 2, '陶', '0', '182.97.28.108', 1545396663),
(4, 2, '刘', '0', '182.97.28.108', 1545396668),
(5, 2, '刘', '0', '182.97.28.108', 1545396670),
(6, 2, '陶璐璐', '0', '182.97.28.108', 1545396693),
(7, 2, '陶璐璐', '0', '182.97.28.108', 1545396695),
(8, 2, '陶璐璐', '0', '182.97.28.108', 1545396696),
(9, 2, '陶璐璐', '0', '182.97.28.108', 1545396820),
(10, 1, '陶璐璐', '0', '182.97.28.108', 1545396834),
(11, 1, '刘海', '0', '182.97.28.108', 1545396853),
(12, 1, '熊', '0', '182.97.28.108', 1545396859),
(13, 1, '秦', '0', '182.97.28.108', 1545396863),
(14, 1, '秦', '0', '182.97.28.108', 1545396864),
(15, 2, '欧文', '0', '218.65.11.32', 1545399493),
(16, 2, '二', '0', '218.65.11.32', 1545399501),
(17, 2, '海', '1', '218.65.11.32', 1545399505),
(18, 3, '何琴', '0', '182.97.93.196', 1545439748),
(19, 3, '何', '0', '182.97.93.196', 1545439753),
(20, 3, '琴', '0', '182.97.93.196', 1545439759),
(21, 4, '包裹', '0', '182.97.93.196', 1545442501),
(22, 4, '测试', '0', '182.97.93.196', 1545442509),
(23, 4, '测试', '0', '182.97.93.196', 1545442510),
(24, 4, '测试', '0', '182.97.93.196', 1545442511),
(25, 3, '琴', '0', '182.97.93.196', 1545449635),
(26, 3, '琴姐姐', '0', '182.97.93.196', 1545449645),
(27, 3, '琴', '0', '182.97.93.196', 1545449649),
(28, 2, '琴', '0', '182.97.93.196', 1545449678),
(29, 5, '刘海', '0', '223.104.172.143', 1545450770),
(30, 5, '刘', '0', '223.104.172.143', 1545450780),
(31, 5, '刘承峰', '1', '223.104.172.143', 1545450838),
(32, 4, '曾', '0', '218.65.11.32', 1545455473),
(33, 4, '曾雪', '0', '218.65.11.32', 1545455477),
(34, 4, '益雪', '0', '218.65.11.32', 1545455485),
(35, 4, '益雪', '0', '218.65.11.32', 1545455486),
(36, 4, '益雪', '0', '218.65.11.32', 1545455486),
(37, 4, '益雪', '0', '218.65.11.32', 1545455486),
(38, 4, '益雪', '0', '218.65.11.32', 1545455487),
(39, 4, '益雪曾', '0', '218.65.11.32', 1545455492),
(40, 4, '益曾', '0', '218.65.11.32', 1545455496),
(41, 4, '曾益雪', '0', '218.65.11.32', 1545455501),
(42, 6, '刘', '0', '182.97.88.166', 1545475489),
(43, 4, '不', '0', '218.65.11.32', 1545483833),
(44, 3, '不', '0', '218.65.11.32', 1545483839),
(45, 7, '王浩', '1', '117.45.201.224', 1545493025),
(46, 9, '蓝', '0', '117.45.201.224', 1545538700),
(47, 10, '张', '0', '117.45.201.224', 1545542045);

-- --------------------------------------------------------

--
-- 表的结构 `gk_like`
--

CREATE TABLE `gk_like` (
  `id` int(11) NOT NULL,
  `posts_id` int(11) NOT NULL,
  `ip` text NOT NULL,
  `mtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `gk_like`
--

INSERT INTO `gk_like` (`id`, `posts_id`, `ip`, `mtime`) VALUES
(1, 3, '127.0.0.1', 1545369653),
(2, 3, '192.168.0.2', 1545371492),
(3, 1, '182.97.242.219', 1545391296),
(4, 1, '218.65.11.32', 1545396065),
(5, 2, '117.136.110.165', 1545396445),
(6, 1, '117.136.110.165', 1545396576),
(7, 2, '218.65.11.32', 1545397123),
(8, 3, '182.97.93.196', 1545436545),
(9, 3, '125.69.125.76', 1545440083),
(10, 3, '117.136.110.56', 1545440638),
(11, 2, '117.136.110.56', 1545440639),
(12, 4, '182.97.93.196', 1545441349),
(13, 1, '182.97.93.196', 1545446560),
(14, 6, '223.104.172.143', 1545450708),
(15, 5, '223.104.172.143', 1545450711),
(16, 3, '223.104.172.143', 1545450715),
(17, 2, '223.104.172.143', 1545450717),
(18, 1, '223.104.172.143', 1545450718),
(19, 6, '218.65.11.32', 1545455456),
(20, 4, '223.104.172.120', 1545463794),
(21, 3, '118.212.209.141', 1545472331),
(22, 4, '125.69.125.76', 1545476308),
(23, 7, '218.65.11.32', 1545482718),
(24, 8, '125.69.125.76', 1545486947),
(25, 9, '182.97.93.196', 1545493568),
(26, 5, '182.97.93.196', 1545493665),
(27, 9, '182.97.86.81', 1545529500),
(28, 9, '218.65.11.32', 1545538355),
(29, 1, '117.45.201.224', 1545538684),
(30, 1, '182.97.86.81', 1545541822),
(31, 3, '182.97.86.81', 1545541824),
(32, 5, '183.220.47.203', 1545542222),
(33, 4, '183.220.47.203', 1545542224),
(34, 3, '183.220.47.203', 1545542225),
(35, 2, '183.220.47.203', 1545542227),
(36, 10, '183.220.47.203', 1545548104),
(37, 11, '183.220.47.203', 1545548348),
(38, 10, '218.65.11.32', 1545574158);

-- --------------------------------------------------------

--
-- 表的结构 `gk_node`
--

CREATE TABLE `gk_node` (
  `id` int(11) NOT NULL,
  `node_name` varchar(155) NOT NULL DEFAULT '' COMMENT '节点名称',
  `control_name` varchar(155) NOT NULL DEFAULT '' COMMENT '控制器名',
  `action_name` varchar(155) NOT NULL COMMENT '方法名',
  `is_menu` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否是菜单项 1不是 2是',
  `type_id` int(11) NOT NULL COMMENT '父级节点id',
  `style` varchar(155) DEFAULT '' COMMENT '菜单样式'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `gk_node`
--

INSERT INTO `gk_node` (`id`, `node_name`, `control_name`, `action_name`, `is_menu`, `type_id`, `style`) VALUES
(1, '用户管理', '#', '#', 2, 0, 'fa fa-users'),
(2, '管理员管理', 'user', 'index', 2, 1, ''),
(3, '添加管理员', 'user', 'useradd', 1, 2, ''),
(4, '编辑管理员', 'user', 'useredit', 1, 2, ''),
(5, '删除管理员', 'user', 'userdel', 1, 2, ''),
(6, '角色管理', 'role', 'index', 2, 1, ''),
(7, '添加角色', 'role', 'roleadd', 1, 6, ''),
(8, '编辑角色', 'role', 'roleedit', 1, 6, ''),
(9, '删除角色', 'role', 'roledel', 1, 6, ''),
(10, '分配权限', 'role', 'giveaccess', 1, 6, ''),
(11, '系统管理', '#', '#', 2, 0, 'fa fa-desktop'),
(12, '数据备份/还原', 'data', 'index', 2, 11, ''),
(13, '备份数据', 'data', 'importdata', 1, 12, ''),
(14, '还原数据', 'data', 'backdata', 1, 12, ''),
(15, '节点管理', 'node', 'index', 2, 1, ''),
(16, '添加节点', 'node', 'nodeadd', 1, 15, ''),
(17, '编辑节点', 'node', 'nodeedit', 1, 15, ''),
(18, '删除节点', 'node', 'nodedel', 1, 15, ''),
(19, '文章管理', 'articles', 'index', 1, 0, 'fa fa-book'),
(20, '文章列表', 'articles', 'index', 2, 19, ''),
(21, '添加文章', 'articles', 'articleadd', 1, 19, ''),
(22, '编辑文章', 'articles', 'articleedit', 1, 19, ''),
(23, '删除文章', 'articles', 'articledel', 1, 19, ''),
(24, '上传图片', 'articles', 'uploadImg', 1, 19, ''),
(25, '个人中心', '#', '#', 1, 0, ''),
(26, '编辑信息', 'profile', 'index', 1, 25, ''),
(27, '编辑头像', 'profile', 'headedit', 1, 25, ''),
(28, '上传头像', 'profile', 'uploadheade', 1, 25, ''),
(29, '告白管理', '#', '#', 2, 0, 'fa fa-heart'),
(31, '告白列表', 'love', 'index', 2, 29, ''),
(32, '配置项', '#', '#', 2, 0, 'fa fa-cogs'),
(33, '系统', 'config', 'index', 2, 32, ''),
(34, '告白修改', 'love', 'loveedit', 1, 29, ''),
(35, '告白禁用', 'love', 'loveoff', 1, 29, ''),
(36, '告白发布', 'love', 'loveon', 1, 29, ''),
(37, 'IP小黑屋', 'address', '#', 2, 0, 'fa fa-user-times'),
(38, 'IP拉黑列表', 'address', 'index', 2, 37, ''),
(39, '拉黑添加', 'address', 'ipadd', 1, 37, ''),
(40, '拉黑禁用', 'address', 'ipoff', 1, 37, ''),
(41, '拉黑启用', 'address', 'ipon', 1, 37, ''),
(42, '系统编辑', 'config', 'configedit', 1, 32, ''),
(43, '系统添加', 'config', 'configadd', 1, 32, ''),
(44, '系统删除', 'config', 'configdel', 1, 32, '');

-- --------------------------------------------------------

--
-- 表的结构 `gk_posts`
--

CREATE TABLE `gk_posts` (
  `id` int(11) NOT NULL,
  `nickName` varchar(30) NOT NULL,
  `itsGender` varchar(25) DEFAULT NULL,
  `gender` varchar(25) DEFAULT NULL,
  `trueName` varchar(30) NOT NULL,
  `towho` varchar(30) NOT NULL,
  `contents` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '0禁用 1发布',
  `mtime` int(11) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `love` varchar(64) DEFAULT '0',
  `loveImage` varchar(255) DEFAULT NULL COMMENT '图片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `gk_posts`
--

INSERT INTO `gk_posts` (`id`, `nickName`, `itsGender`, `gender`, `trueName`, `towho`, `contents`, `email`, `status`, `mtime`, `ip`, `love`, `loveImage`) VALUES
(1, '秘密', 'female', 'secrecy', '-', '不告诉你', '共科院告白墙正式启用啦~小伙伴们快来给自己喜欢的人表白吧！╰(￣▽￣)╭~~~  更多功能戳右下角的“帮助”', '', 1, 1545385468, '218.65.11.32', '7', 'undefined'),
(2, '快到碗里来', 'female', 'male', '海', '网管少女', '期待下波漫威电影再约呀~', '1322412067@qq.com', 1, 1545392098, '218.65.11.32', '5', 'undefined'),
(3, '路过的', 'male', 'female', '不说', '不认识啊', '扎着辫子穿着潮牌在网吧碰到过几次有点小心动啊！！！', '', 1, 1545413227, '118.212.209.141', '7', 'undefined'),
(4, '你已不在服务区', 'male', 'female', '肖雪益', '喜马拉雅', '错过了就不再来', '', 1, 1545440704, '117.136.110.56', '4', 'undefined'),
(5, '某人', 'female', 'male', '刘承峰', '女魔头', '岁月静好，愿你余生平平安安，快快乐乐。', '1963653425@qq.com', 1, 1545450180, '182.97.93.196', '3', '/upload/20181222/6368161d259f02a5342bd67d28d3cc91.PNG'),
(6, '蓝', 'female', 'male', '杨', '文江', '圣诞快乐！', '321777954@qq.com', 1, 1545450685, '223.104.172.143', '2', '/upload/20181222/d6c2bcc2f8d557e7f48f31a86b1e1bad.jpg'),
(7, '王浩', 'female', 'male', '王浩', '江雨亭', '江雨亭，我喜欢你！就是喜欢你！', '', 1, 1545480490, '218.65.11.32', '1', './upload/20181222/7934dbd53cb9da7dd06f83430edc4ece.JPG'),
(8, '大猪蹄子', 'female', 'male', '0', '食堂打菜的小妹妹', '不知道怎么去认识你啊，如果你看到了这条信息，麻烦你以后多给我打点肉肉哈~', '', 1, 1545483738, '218.65.11.32', '1', '/upload/20181222/2b453aa611ada93e875bc96de931294a.jpg'),
(9, '蓝', 'female', 'male', '江', '梦玲', '可怜的室友\r\n到毕业都没有勇气\r\n向这位女孩说出那三个字！', '814029073@qq.com', 1, 1545489130, '118.212.204.106', '3', 'https://upload-images.jianshu.io/upload_images/12353119-509f37578edb25d3.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
(10, '僧', 'female', 'male', 'c', '二货', '微胖的二货，又要过一个光棍节了咯，别灰心，会遇上你想遇见的那个人的，他胖胖的会给你安全感，会陪伴你左右，会让你心动。其实，微胖的女孩挺好看的，可爱呢，哈哈', '', 1, 1545529403, '218.65.11.32', '2', '/upload/20181223/dc7c75f088fd6509990be990abf2ec06.jpg'),
(11, '测试', 'female', 'male', '测试', '测试', '测试一下啦', '', 2, 1545548295, '183.220.47.203', '1', '');

-- --------------------------------------------------------

--
-- 表的结构 `gk_role`
--

CREATE TABLE `gk_role` (
  `id` int(11) NOT NULL COMMENT 'id',
  `role_name` varchar(155) NOT NULL COMMENT '角色名称',
  `rule` varchar(255) DEFAULT '' COMMENT '权限节点数据'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `gk_role`
--

INSERT INTO `gk_role` (`id`, `role_name`, `rule`) VALUES
(1, '超级管理员', '*'),
(2, '系统维护员', '1,2,3,4,5,6,7,8,9,10,15,16,17,18,19,20,21,29,31,34,35');

-- --------------------------------------------------------

--
-- 表的结构 `gk_user`
--

CREATE TABLE `gk_user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '密码',
  `head` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '头像',
  `login_times` int(11) NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `last_login_ip` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `real_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '真实姓名',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `role_id` int(11) NOT NULL DEFAULT '1' COMMENT '用户角色id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `gk_user`
--

INSERT INTO `gk_user` (`id`, `user_name`, `password`, `head`, `login_times`, `last_login_ip`, `last_login_time`, `real_name`, `status`, `role_id`) VALUES
(1, 'admin', 'a2bfb9f95a495157e1fa28ef0c626d40', '/upload/head/nY6UxMZIaXlOjivRPNwcSkFVeBtzsq1W.jpeg', 68, '218.65.11.32', 1545646407, 'admin', 1, 1),
(2, 'admin1', '17a30769ff8f58e57de69c49d302a757', '/static/admin/images/profile_small.jpg', 5, '127.0.0.1', 1545217672, '2', 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gk_articles`
--
ALTER TABLE `gk_articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gk_blacklist`
--
ALTER TABLE `gk_blacklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gk_comments`
--
ALTER TABLE `gk_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gk_config`
--
ALTER TABLE `gk_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gk_guess`
--
ALTER TABLE `gk_guess`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gk_like`
--
ALTER TABLE `gk_like`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gk_node`
--
ALTER TABLE `gk_node`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gk_posts`
--
ALTER TABLE `gk_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gk_role`
--
ALTER TABLE `gk_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gk_user`
--
ALTER TABLE `gk_user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `gk_articles`
--
ALTER TABLE `gk_articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `gk_blacklist`
--
ALTER TABLE `gk_blacklist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `gk_comments`
--
ALTER TABLE `gk_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `gk_config`
--
ALTER TABLE `gk_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `gk_guess`
--
ALTER TABLE `gk_guess`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- 使用表AUTO_INCREMENT `gk_like`
--
ALTER TABLE `gk_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- 使用表AUTO_INCREMENT `gk_node`
--
ALTER TABLE `gk_node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- 使用表AUTO_INCREMENT `gk_posts`
--
ALTER TABLE `gk_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `gk_role`
--
ALTER TABLE `gk_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `gk_user`
--
ALTER TABLE `gk_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

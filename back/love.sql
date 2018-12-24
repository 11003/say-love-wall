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

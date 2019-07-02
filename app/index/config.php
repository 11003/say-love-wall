<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/15
 * Time: 19:18
 */
return [
    // 角色状态
    'role_status' => [
        '1' => '启用',
        '2' => '禁用'
    ],

    // 视图输出字符串内容替换
    'view_replace_str'       => [
        '__CSS__' => '/static/index/css',
        '__JS__' => '/static/index/js',
        '__IMG__' => '/static/index/images',
        '__LAYER__' => '/static/index/layer',
    ],

    'smtp_setting' => [
        //设置邮件头的From字段
        'from' => '共青科技表白墙',
        // SMTP 用户名，如果是QQ邮箱申请的则填写QQ邮箱
        'username' => '814029073@qq.com',
        // SMTP 密码，如果是QQ邮箱申请的则填写开通SMTP服务后生成的密码
        'password' => 'jhjvjtavfkytbbfh',
        // SMTP 邮箱地址，如果是QQ邮箱申请的则填写QQ邮箱
        'address'=> '814029073@qq.com',
        // 分享地址，填写到能够访问该表白墙 share.php 文件的地址
        'link' => 'http://liuhai.fun./share',
        // 邮件标题
        "title" => "你被表白啦！来自共青科技表白墙",
        // 邮件内容，{{link}} 为表白链接的占位符，可随意更改位置，系统自动替换为表白链接。
        "body" => "悄悄的告诉你哦~刚刚有人向你表白了，TA还称呼你...",
        // 邮件发送成功返回
        "success" => "邮件发送成功",
        // 邮件发送失败返回
        "failed" => "邮件发送失败！因为当前人数太多，邮件发送频率高被限制，不过系统会在稍后自动重新发送邮件，请放心，联系站长QQ：814029073<br>",
        // 失败的时候是否返回错误的详细信息，英文的信息，带错误码，用于程序调试，不显示就改为false
        "debug" => false
    ],

    // 一页展示多少告白
    'max_page'  => 10




];

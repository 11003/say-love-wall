<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
/**
 * 人性化时间显示
 * @param $agoTime
 * @return string
 */
function transfer_time($time)
{
    $time = (int) substr($time, 0, 10);
    $int = time() - $time;
    switch ($int){
        case $int <= 2:
            $str = sprintf('刚刚', $int);
            break;
        case $int < 60:
            $str = sprintf('%d秒前', $int);
            break;
        case $int < 3600:
            $str = sprintf('%d分钟前', floor($int / 60));
            break;
        case $int < 86400:
            $str = sprintf('%d小时前', floor($int / 3600));
            break;
        case $int < 1728000:
            $str = sprintf('%d天前', floor($int / 86400));
            break;
        default:
            $str = date('Y年m月d日 H:i:s', $time);
            break;
    }
    return $str;
}
function getAddressByIp($ip = ''){
    if(empty($ip)){
        return '请输入IP地址';
    }
    $url="http://restapi.amap.com/v3/ip?key=4a218d0d82c3a74acf019b701e8c0ccc&ip=".$ip;
    $ipinfo=json_decode(file_get_contents($url));
    $location = $ipinfo->{'city'};
    $s = $location?$location:"本地或未知";
    return $s;
}

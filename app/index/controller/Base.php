<?php
namespace app\index\controller;

use think\Controller;
use think\Request;
use think\Session;
use think\Cache;
class Base extends Controller
{
    public function __construct()
    {
        parent::__construct();
        $seoImg = db('config')->where('id','13')->find();
              cache('seoImg',$seoImg);
              $this->assign('seoImg',$seoImg);

        if(empty($ip)){
            Cache::clear();  // 新用户清除缓存
            $ip = get_client_ip();
            Session::set('uip',$ip);
        }
        return $ip;

    }
}

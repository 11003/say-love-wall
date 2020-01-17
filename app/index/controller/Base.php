<?php
namespace app\index\controller;

use think\Controller;
use think\Session;
use think\Cache;
class Base extends Controller
{
    public function __construct()
    {
        parent::__construct();
        $where['is_del'] = ['neq','2'];
        $db = db('config');
        $seoImg = $db->where($where)->where('id','13')->find();
        $seoImg2 = $db->where($where)->where('id','14')->find();
        $seoFootImg = $db->where($where)->where('id','18')->find();
              cache('seoImg',$seoImg);//Logo1
              cache('seoImg2',$seoImg2);//Logo2
              cache('seoFootImg',$seoFootImg);//FootLogo
              $this->assign([
                  'seoImg' => $seoImg,
                  'seoImg2' => $seoImg2,
                  'seoFootImg' => $seoFootImg
              ]);

        if(empty($ip)){
            Cache::clear();  // 新用户清除缓存
            $ip = get_client_ip();
            Session::set('uip',$ip);
        }
        return $ip;

    }
}

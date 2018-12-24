<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/21
 * Time: 9:23
 */
namespace app\index\controller;

use think\Controller;
use think\DB;
use app\index\model\BlacklistModel;
class Blacklist extends Base
{
    public function appealPost()
    {
        if($this->request->isPost()){

            $black = new BlacklistModel();
            $data = input('post.');
            $flag = $black->updateUserip($data);
            return json(msg($flag['code'], $flag['data'], $flag['msg']));
        }
    }
}
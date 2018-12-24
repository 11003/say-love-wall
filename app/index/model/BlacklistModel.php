<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/16
 * Time: 19:39
 */

namespace app\index\model;

use think\Model;

class BlacklistModel extends Model
{
    protected $table = 'gk_blacklist';

    public function getBlackip($uip)
    {
        $flag = $this->where('ip',$uip)->find();
        if( isset($flag) && $flag['status'] == 2 ){
            return msg(1,'','很遗憾,你已被拉黑,无法发表~<br><a href="#app_status" data-post='. $flag['id'] .' data-rel="popup">戳我申冤！</a><br>');
        }
    }

    public function updateUserip($param)
    {
        try{

            $today=$this->getOneBlackUser($param);
            if($today['appeal_time']){
                return msg(-1, '', '你已经申诉过了。如有问题请加QQ：814029073~');
            }
            $param['appeal_time']=time();
            $result =  $this->validate(['content'=>'require|max:150'],['content.max'=>'最多150字符','content.require'=>'申诉内容不能为空~'])->save($param,['id' => $param['id']]);

            if(false === $result){
                // 验证失败 输出错误信息
                return msg(-1, '', $this->getError());
            }else{

                return msg(1, '', '发送成功，处理时间为期三天。如有问题请加QQ：814029073~');
            }
        }catch(PDOException $e){
            return msg(-2, '', $e->getMessage());
        }
    }

    public function getOneBlackUser($data)
    {
        return $this->where('id',$data['id'])->find();
    }
}
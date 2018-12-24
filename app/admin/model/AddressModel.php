<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/20
 * Time: 19:43
 */

namespace app\admin\model;

use think\Model;
class AddressModel extends Model
{
    protected $table = 'gk_blacklist';

    public function getAddressByWhere($where,$offset,$limit)
    {
        return $this->where($where)->group('ip')->limit($offset,$limit)->select();
    }

    public function getAllAddress($where)
    {
        return $this->where($where)->count();
    }

    public function insertBacklist($param)
    {
        try{
            $param['mtime']=time();
            $result =  $this->validate(['ip'=>'require|ip|unique:blacklist'],['ip.require'=>'IP必须','ip.ip'=>'ip格式不正确','ip.unique'=>'该ip已存在!'])->save($param);
            if(false === $result){
                // 验证失败 输出错误信息
                return msg(-1, '', $this->getError());
            }else{
                return msg(1, url('address/index'), '添加拉黑用户成功');
            }
        }catch(PDOException $e){

            return msg(-2, '', $e->getMessage());
        }
    }
    public function getOneUser($id)
    {
        return  $this->where('id',$id)->find();
    }
    // 2 禁用
    public function Off($id)
    {
        $if = $this->getOneUser($id);
        if($if['status'] == 2){
            return msg(-2, '', '该用户已禁用');
        }else{
            $this->where('id',$id)->setField(['status'=>2,'updated_at'=>time()]);
            return msg(1, '', '禁用成功');
        }
    }
    // 1 启用
    public function On($id)
    {
        $if =  $this->getOneUser($id);
        if($if['status'] == 1){
            return msg(-2, '', '该用户已启用');
        }else{
            $this->where('id',$id)->setField(['status'=>1,'updated_at'=>time(),'appeal_time'=>'']);
            return msg(1, '', '启用成功');
        }
    }

}
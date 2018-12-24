<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/24
 * Time: 10:43
 */
namespace app\admin\model;

use think\Model;
use app\index\model\SayloveModel;
class ConfigModel extends Model
{
    protected $table = "gk_config";

    protected static function init()
    {
        ConfigModel::beforeInsert(function($data){
            $file = request()->file('thumbnail');
            if ($file) {
                //图片上传的路径
                $info = $file->validate(['size' => 4145728, 'ext' => 'jpg,png,gif'])->move(ROOT_PATH . 'public' . DS . 'upload');
                if ($info) {
                    //图片路径
                    $data['thumbnail'] = '/upload' . DS . date('Ymd') . '/' . $info->getFilename();
                }
            }
        });
        ConfigModel::beforeDelete(function($data){
            $config=ConfigModel::find($data->id);
            $picpath=$_SERVER['DOCUMENT_ROOT'].$config['thumbnail'];
            //判断文件是否存在file_exists
            if(file_exists($picpath)){
                @unlink($picpath);
            }
        });
    }

    public function getConfigsByWhere($where, $offset, $limit)
    {
        return $this->where($where)->limit($offset, $limit)->order('id desc')->select();
    }

    public function getAllConfigs($where)
    {
        return $this->where($where)->count();
    }

    public function getOneConfig($id)
    {
        return $this->where('id',$id)->find();
    }

    public function addConfig($param)
    {

        try{
            $result = $this->validate(['title'=>'unique:config'],['title.unique'=>'icon标题重复'])->save($param);
            if(false === $result){
                // 验证失败 输出错误信息
                return msg(-1, '', $this->getError());
            }else{

                return msg(1, url('config/index'), '添加成功');
            }
        }catch (\Exception $e){
            return msg(-2, '', $e->getMessage());
        }
    }
    public function delConfig($id)
    {
        try{
            $this->where('id', $id)->delete();
            return msg(1, '', '删除配置成功');

        }catch( PDOException $e){
            return msg(-1, '', $e->getMessage());
        }
    }

    public function editConfig($param)
    {
        try{
            $result = $this->validate(['title'=>'unique:config'],['title.unique'=>'icon标题重复'])->save($param, ['id' => $param['id']]);

            if(false === $result){
                // 验证失败 输出错误信息
                return msg(-1, '', $this->getError());
            }else{

                return msg(1, url('config/index'), '编辑成功');
            }
        }catch(\Exception $e){
            return msg(-2, '', $e->getMessage());
        }
    }



}
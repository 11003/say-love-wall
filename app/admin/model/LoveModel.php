<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/20
 * Time: 11:14
 */
namespace app\admin\model;

use think\Model;
use app\index\model\SayloveModel;
class LoveModel extends Model
{
    protected $table = 'gk_posts';


    public function getLoveByWhere($where,$offset,$limit)
    {
        return $this
            ->where($where)
            ->limit($offset,$limit)
            ->order('id desc')
            ->select();
    }

    public function getAllLoves($where)
    {
        return $this->where($where)->count();
    }

    public function getOneLove($id)
    {
        return $this->where('id',$id)->find();
    }


    /**
     * @param $id
     * @return int|string
     * 获取评论总数
     */
    public function comment_count($id)
    {
        return db('comments')->where('posts_id',$id)->count('posts_id');
    }

    /**
     * @param $id
     * @return int|string
     * 获取猜名字总数 -- 猜对的
     */
    public function guess_name_yes($id)
    {
        return db('guess')->where(['posts_id'=>$id,'isRight'=>1])->count('posts_id');
    }

    /**
     * @param $id
     * @return int|string
     * 获取猜名字总数 -- 总数
     */
    public function guess_name_count($id)
    {
        return db('guess')->where('posts_id',$id)->count('posts_id');
    }
    // 2 禁用
    public function Off($id)
    {
        return $this->where('id',$id)->setField('status',2);
    }
    // 1 发布
    public function On($id)
    {
        return $this->where('id',$id)->setField('status',1);
    }

}
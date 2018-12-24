<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/15
 * Time: 21:17
 */
namespace app\index\model;

use think\Model;

class LikeModel extends Model
{
    protected $table = 'gk_like';

    public function isLikeToday($ip,$posts_id)
    {
        // 不存在ip
        if(empty($ip)){
            return 0;
        }

        return $this->where(['ip'=>$ip,'posts_id'=>$posts_id])->whereTime('mtime','d')->find();
    }

    /**
     * @param $ip [like_ip]
     * @param $posts_id
     * @return int|string
     *
     */
    public function isLike($ip,$posts_id)
    {
        // 不存在ip
        if(empty($ip)){
            return 0;
        }
        return $this->where(['ip'=>$ip,'posts_id'=>$posts_id])->field('id')->count('id');
    }
}
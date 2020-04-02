<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/17
 * Time: 8:45
 */
namespace app\index\model;

use think\Model;

class CommentModel extends Model
{
    protected $table = 'gk_comments';


    public function getComment($post_id)
    {
        $res = $this->where('posts_id',$post_id)->order('mtime DESC')->field('contents,id,ip,mtime,posts_id')->select();
        $arr=array();
        foreach ($res as $k => $v){
            // 隐藏IP
            $v['ip'] = substr_replace($v['ip'],'**',-2,4);
            $v['mtime'] = transfer_time($v['mtime']);
            $arr[]=$v;
        }
        return $arr;
    }

    public function insertComment($data)
    {
        try{
            $data['ip'] =  get_client_ip();  // 不用session,用户可能没有表白
            $data['mtime'] = time();
            $result = $this->validate(['contents'=>'require'],['contents.require'=>'评论内容不能为空!'])->save($data);

            if($result === false){
                return msg(-1,'',$this->getError());
            }else{
                return msg(1, '', '评论成功！');
            }
        }catch(PDOException $e){
            return msg(-2, '', $e->getMessage());
        }
    }
}
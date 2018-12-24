<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/17
 * Time: 8:44
 */
namespace app\index\controller;

use think\Controller;
use think\DB;
use app\index\model\CommentModel;
class Comment extends Base
{
    // 展示评论
    public function comment()
    {
        if($this->request->isAjax()){

            $comment = new CommentModel();
            $post_id = intval(input('post_id'));
            $return = $comment->getComment($post_id);
            return json($return);
        }
    }

    // 提交评论
    public function commentpost()
    {
        if($this->request->isPost()){

            $comment = new CommentModel();
            $data = input('post.');
            $flag = $comment->insertComment($data);
            return json(msg($flag['code'],$flag['data'],$flag['msg']));
        }
    }
}
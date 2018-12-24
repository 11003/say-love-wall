<?php
namespace app\index\controller;

use think\Controller;
use app\index\model\SayloveModel;
use app\index\model\LikeModel;
use app\index\model\BlacklistModel;
use think\DB;
use think\Session;
class Saylove extends Base
{
    private $ip;
    public function __construct()
    {
        parent::__construct();
        $this-> ip= get_client_ip();
    }

    public function index()
    {
        return view();
    }


    // 表白
    public function action()
    {
        $saymodel = new SayloveModel();
        $blacklist = new BlacklistModel();
        if($this->request->isAjax()){
            $data=input('post.');
            $uip = session('uip');

            // 获取用户IP，检测用户IP是否在黑名单内，在的话就退出执行。
            $ip_find = $blacklist->getBlackip($uip);
            if(1 == $ip_find['code']){
                return json(msg($ip_find['code'], $ip_find['data'], $ip_find['msg']));
            }
            // 每个ip一天只能发3次
            $ip_number = $saymodel->setPushCount(3,$uip);
            if(isset($ip_number) && $ip_number == 2){
                return json(msg(-1,'','很遗憾,今天你告白的次数超过了三次,明天再来吧~'));
            }

            $flag = $saymodel->insertSay($data);
            return json(msg($flag['code'], $flag['data'], $flag['msg']));
        }

    }


    // 查看表白
    public function share($id)
    {
        $saymodel = new SayloveModel();
        $likemodel = new LikeModel();
        $ip = session('uip');

        $listid = $saymodel->getLovelistid($id);
        $comment_count = $saymodel->comment_count($id);
        $guess_name_yes = $saymodel->guess_name_yes($id);
        $guess_name_count = $saymodel->guess_name_count($id);
        $is_like = $likemodel->isLike($ip,$listid['id']);  // 判断该ip是否对该表白点赞了
        $this->assign([
            'row' => $listid,
            'total_comments' => $comment_count,
            'total_guess' => $guess_name_yes,
            'total_guess_all' => $guess_name_count,
            'is_like' => $is_like
        ]);
        return view();
    }

    // 点赞
    public function liked()
    {
        $saymodel = new SayloveModel();
        if($this->request->isAjax()){
            $post_id = input('post_id');
            $data = [
                'posts_id' => $post_id,
                'ip' => $this->ip,
                'mtime' => time()
            ];
            // 自增喜欢+1
            $flag = $saymodel->liked($post_id,$this->ip);
            // 把表白id插入喜欢表posts_id
            db('like')->insert($data);
            // 点赞的ip 暂时没有用
            session('like_ip',$data['ip']);
            // 判断是否点赞成功,防止掉包
            if(1 == $flag['code']){
                return json(msg($flag['code'], $flag['data'], $flag['msg']));
            }
        }
    }

    // 猜测名字
    public function guess()
    {
        $saymodel = new SayloveModel();
        if($this->request->isAjax()){
            $data = input('post.');
            $name = test_input($data['guessName']);
            $post_id = test_input($data['post_id']);
            $ip = session('uip');

            $flag = $saymodel->guessName($name,$post_id,$ip);
            return json(msg($flag['code'], $flag['data'], $flag['msg']));

        }
    }

    // 上传图片接口
    public function uploadloveImg()
    {
        if(request()->isAjax()){

            $file = request()->file('file');
            // 移动到框架应用根目录/public/uploads/ 目录下
            $info = $file->move(ROOT_PATH . 'public' . DS . 'upload');
            if($info){
                $src =  '/upload' . '/' . date('Ymd') . '/' . $info->getFilename();
                return json(msg(0, ['src' => $src], ''));
            }else{
                // 上传失败获取错误信息
                return json(msg(-1, '', $file->getError()));
            }
        }
    }
}

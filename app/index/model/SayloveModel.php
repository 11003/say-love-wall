<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/15
 * Time: 21:17
 */
namespace app\index\model;

use think\Model;
use app\index\model\LikeModel;
use app\index\model\GuessModel;
use similar\Lcs;
use think\Db;
use think\Cache;
use think\Image;
class SayloveModel extends Model
{
    protected $table = 'gk_posts';

    public $maxItems = 18;  // 一页18个,未使用

    // 定义全局的查询范围
    protected function base($query)
    {
        $query->where('status',1);
    }
    /**
     * @param $where [条件]
     * @param $page [每页显示的记录数] 1页
     * @param $mode [排序显示的模式名字]
     * @return array
     */
    public function getLovesByWhere($where,$page,$mode)
    {

        $limit = intval(config('max_page')); // 一页18个
        $page_later = ($page-1)*$limit;
        switch ($mode){
            case '0'://点赞最多的
                $result =  $this->where($where)->limit($page_later,$limit)->order('love','DESC')->select();
                return $this->output($result);
                break;
            case '1'://按时间倒序显示(最新)
                $result =  $this->where($where)->limit($page_later,$limit)->order('mtime DESC')->select();
                return $this->output($result);
                break;
            case '2'://随机进入页面
                $page_later = $this->rendomSum($limit);
                $result =  $this->where($where)->limit($page_later,$limit)->order('love DESC')->select();
                return $this->output($result);
                break;
            case '3'://点赞数最少排序
                $result =  $this->where($where)->limit($page_later,$limit)->order('love ASC')->select();
                return $this->output($result);
                break;
            case '4'://最旧帖子时间
                $result =  $this->where($where)->limit($page_later,$limit)->order('mtime ASC')->select();
                return $this->output($result);
                break;
            case '5'://搜索
                $result =  $this->where($where)->order('love DESC')->select();
                return $this->output($result);
                break;
        }
    }

    /**
     * @param $data
     * @return array
     * 获取告白盒子
     */
    public function output($data)
    {
//        Session::clear();
        $like = new LikeModel();
        $ip = get_client_ip();
        $arr = array();
        foreach ($data as $k => $v){
            // 获取评论总数
            $comment_count = $this->comment_count($v['id']);
            // 获取猜名字总数 -- 猜对的
            $guess_yes = $this->guess_name_yes($v['id']);
            // 获取猜名字总数 -- 总数
            $guess_count = $this->guess_name_count($v['id']);
            // 判断是否点赞了
            $is_like = $like->isLike($ip,$v['id']);

            $v['comment_count'] = $comment_count;
            $v['trueName'] = '-';
            $v['love'] = intval($v['love']);
            $v['ip'] = '-';
            $v['guess_yes'] = $guess_yes;
            $v['guess_count'] = $guess_count;
            $v['is_like'] = $is_like;
            $v['mtime'] = transfer_time($v['mtime']);
            $arr[]=$v;
        }
//        $res = array_push($arr,$page);
//        Cache::set('arr',$arr,4800);  // 设置1个小时过期的缓存
//        $arr = Cache::get('arr');
//        $options = ['type'=>'Redis'];
//        $redis = Cache::connect($options);
//        $c = $redis->set('arr',$arr);
//        if(!$c){
//            $redis->set('arr',$arr);
//        }
//        $arr = $redis->get('arr');
        return $arr;


    }

    /**
     * @param  $where [搜索条件和首页共用]
     * @return int|string
     * 获取告白总数据
     */
    public function getAllLoves($where='')
    {
        return $this->where($where)->count('id');
    }

    /**
     * @param $data
     * @return array
     * 添加表白
     */
    public function insertSay($data)
    {
        try{
            $data['mtime']=time();
            $data['ip'] = get_client_ip();
            $email = $data['email'];
            $data['loveImage']='';  //去掉undefined
            $result = $this->validate('PostsValidate')->save($data);
            if(!empty($email)){
                // 发送邮件
                send_email($this->email,$this->id);
            }
            if($result === false){
                return msg(-1,'',$this->getError());
            }else{
                session('uip',$this->ip);  // 一天只能发三次表白
                $url = "/share/id/".$this->id;
                return msg(1, '', '点击链接查看你的表白：<br><a target="_blank" href='.$url.'>戳我！</a><br>');
            }

        }catch(PDOException $e){
            return msg(-2, '', $e->getMessage());
        }
    }

    /**
     * 图片上传和压缩
     */
    protected static function init()
    {
        SayloveModel::beforeInsert(function($data){
            $file = request()->file('loveImage');
            if ($file) {
                //图片上传的路径
                $info = $file->validate(['size' => 4145728, 'ext' => 'jpg,png,gif'])->move(ROOT_PATH . 'public' . DS . '/upload');
                if ($info) {
                    //图片路径
                    $info->getSaveName();
//                    $data['loveImage'] = '/upload' . DS . date('Ymd') . '/' . $info->getFilename();
                    $pic = './upload' . DS . date('Ymd') . '/' . $info->getFilename();
                    $image = \think\Image::open($info);
                    $image->thumb(400,400)->save($pic);
                    $str=substr($pic,1);
                    $data['loveImage'] = $str;
                }
            }
        });
    }
    /**
     * @param $id
     * 查询对应该id的表白
     */
    public function getLovelistid($id)
    {
        return $this->where('id',$id)->find();
    }

    /**
     * @param $number
     * @return int
     * 设置一天告白次数
     */
    public function setPushCount($uip)
    {
        return $this->where('ip',$uip)->whereTime('mtime','d')->count('id');
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


    /**
     * @param $post_id
     * @param $ip
     * @return array
     * 关联喜欢和表白
     */
    public function liked($post_id)
    {
        try{

            $this->where('id',$post_id)->setInc('love',1);

            // 返回喜欢的次数
            $result= $this->where('id',$post_id)->field('love')->find();
            return msg(1, $result['love'], '');

        }catch(PDOException $e){
            return msg(-2, '', $e->getMessage());
        }
    }


    /**
     * @param $name
     * @param $post_id
     * @param $ip
     * @return array
     * 猜名字
     */
    public function guessName($name,$post_id,$ip)
    {
        $guess = new GuessModel();
        $similar = new Lcs();

        // guessName post_id
        //获取数据库中真实的名字
        $true = $this->where('id',$post_id)->find();
        $trueName = $true['trueName'];
        // 这里只能通过变量去传,带有数组的是不行的!!!会导致无法转换为int整型
        $similars = $similar->getSimilar($name, $trueName);
        //匹配
        $result = $this->where(['id'=>$post_id,'trueName'=>$name])->find();


        $data['ip'] = $ip;
        $data['posts_id'] = $post_id;
        $data['guessName'] = $name;
        $data['mtime'] = time();

        $similarNum = $similars*100;  // 几率

        if( isset($result) ){

            // 猜对姓名
            $data['isRight'] = 1;
            $guess->insert($data);
//            return msg(1, '',"恭喜你猜对了！相似度为：".($similars*100)."%");
            return msg(1, '',"恭喜你猜对了！相似度为：100%");
        }else{

            // 没有猜对
            $data['isRight'] = 0;
            $guess->insert($data);
            return msg(0, '',"很遗憾没有猜对，相似度为：".$similarNum."%");
        }
    }

    /**
     * @param int max_page
     * @return float|int
     * 随机显示
     */
    public function rendomSum($limit)
    {

        $count=$this->getAllLoves();
        $total_page = floor($count/$this->maxItems);
        $page_later = rand(1,$total_page)*$limit;
        return $page_later;
    }

    // 没有用
    public function total_page($limit)
    {
        $count = $this->getAllLoves();
        $total_page = floor($count/$limit);
        return $total_page;
    }
}

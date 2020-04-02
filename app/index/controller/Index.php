<?php
namespace app\index\controller;

use think\Controller;
use think\DB;
use app\index\model\SayloveModel;
class Index extends Base
{

    // 首页展示
    public function index()
    {
        $db = db('config');
        $res = $db->where('id','in','1,2,3,4')->select();
        $leftRes = $db->where('id','in','6,7,8,9,10')->select();
        $goToTop = $db->where('id','11')->find();

        cache('res',$res);
        cache('leftres',$leftRes);
        cache('goToTop',$goToTop);

        $this->assign('res',$res);
        $this->assign('leftres',$leftRes);
        $this->assign('goToTop',$goToTop);

        return view();
    }

    // 搜索出来的告白和首页展示
    public function search()
    {
        $saylove = new SayloveModel();
        if($this->request->isAjax()){
            $data = input('post.');
            // mode 是用来展示首页功能的作用
            $mode = intval($data['mode']);
            $limit = intval(config('max_page')); // 一页18个
            $page = intval($data['pageNumber']);  // 0

            if(!empty($data)){
                $where = [];
                if (!empty($data['searchValue'])) {
                    $where['nickName|towho'] = ['like', '%'. $data['searchValue'] . '%'];
                }
                // 展示
                $selectResult = $saylove->getLovesByWhere($where,$page,$mode);
                // 总数据
                $res['count']=$saylove->getAllLoves($where);

                // 获取共有多少页数
                $total_page = floor( $res['count']/$limit);
                $res['total_page'] = $total_page;

                // 每个用户信息 二维数组
                $res['rows']=$selectResult;
                return json($res);
            }
        }
        return view();
    }

    public function help()
    {
        return view(':help');
    }


}

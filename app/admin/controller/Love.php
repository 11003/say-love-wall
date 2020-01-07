<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/19
 * Time: 17:20
 */
namespace app\admin\controller;
use app\admin\model\LoveModel;

class Love extends Base
{
    public function index()
    {
        if($this->request->isAjax()){
            $param = input('param.');


            $limit = $param['pageSize'];  //10
            $offset = ($param['pageNumber'] - 1) * $limit;  //$param['pageNumber']=1

            $where = [];
            if (!empty($param['searchText'])) {
                $where['nickName|towho'] = ['like', '%' . $param['searchText'] . '%'];
            }

            $love = new LoveModel();
            $selectResult = $love->getLoveByWhere($where,$offset,$limit);

            $status = config('love_status');


            // 拼接参数
            foreach ($selectResult as $key => $v){
                switch ($v['itsGender']){case 'female': $v['itsGender']='女';break;default: $v['itsGender']='男';break;}
                switch ($v['gender']){case 'female': $v['gender']='女';break;default: $v['gender']='男';break;}
                // 获取评论总数
                $comment_count = $love->comment_count($v['id']);
                // 获取猜名字总数 -- 猜对的
                $guess_yes = $love->guess_name_yes($v['id']);
                // 获取猜名字总数 -- 总数
                $guess_count = $love->guess_name_count($v['id']);
                $selectResult[$key]['comment_count']=$comment_count;
                $selectResult[$key]['guess_yes']=$guess_yes;
                $selectResult[$key]['guess_count']=$guess_count;
                $selectResult[$key]['gender'] =$v['gender'];  // 告白者性别
                $selectResult[$key]['itsGender'] =$v['itsGender']; // 被告白者性别
                $selectResult[$key]['created_at'] = date('Y-m-d H:i',$v['mtime']);
                $selectResult[$key]['status'] = $status[$v['status']];
                $selectResult[$key]['ip'] = $v['ip'] . '=>' .getAddressByIp($v['ip']);
//                $selectResult[$key]['contents'] = subtext($v['contents'],30);

                $selectResult[$key]['operate'] = showOperate($this->makeButton($v['id']));
            }
            $return['total']=$love->getAllLoves($where); // 总数据
            $return['rows']=$selectResult;

            return json($return);
        }
        return $this->fetch();
    }

    public function loveedit()
    {
        $love = new LoveModel();
        $id = input('param.id');
        $this->assign([
            'love' => $love->getOneLove($id),
            'status' => config('love_status')
        ]);
        return $this->fetch();
    }
    // 禁用
    public function loveOff()
    {
        $love = new LoveModel();
        $id = input('param.id');
        $res = $love->Off($id);
        if($res){
            return msg('1','',"禁用ID为{$id}的成功");
        }

    }
    // 发布
    public function loveOn()
    {
        $love = new LoveModel();
        $id = input('param.id');
        $res = $love->On($id);
        if($res){
            return msg('1','',"启用ID为{$id}的成功");
        }
    }


    /**
     * 拼装操作按钮
     * @param $id
     * @return array
     */
    private function makeButton($id)
    {
        return [
            '详细' => [
                'auth' => 'love/loveedit',
                'href' => url('love/loveEdit', ['id' => $id]),
                'btnStyle' => 'primary',
                'icon' => 'fa fa-paste'
            ],
            '发布' => [
                'auth' => 'love/loveon',
                'href' => "javascript:loveOn(" .$id .")",
                'btnStyle' => 'success',
                'icon' => 'fa fa-angle-double-up'
            ],
            '禁用' => [
                'auth' => 'love/loveoff',
                'href' => "javascript:loveOff(" .$id .")",
                'btnStyle' => 'danger',
                'icon' => 'fa fa-angle-double-down'
            ],
        ];
    }

}

<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/24
 * Time: 9:57
 */
namespace app\admin\controller;
use app\admin\model\ConfigModel;
class Config extends Base
{
    public function index()
    {
        if(request()->isAjax()){

            $param = input('param.');

            $limit = $param['pageSize'];
            $offset = ($param['pageNumber'] - 1) * $limit;

            $where = [];
            if (!empty($param['searchText'])) {
                $where['title'] = ['like', '%' . $param['searchText'] . '%'];
            }

            $article = new ConfigModel();
            $selectResult = $article->getConfigsByWhere($where, $offset, $limit);

            foreach($selectResult as $key=>$vo){
                $selectResult[$key]['thumbnail'] = '<a target="_blank" href="'. $vo['thumbnail'] .'"><img src="' . $vo['thumbnail'] . '" width="50px" height="50px"></a>';
                $selectResult[$key]['color'] = '<div style="background: '. $vo['color'] .' ;color:#FFF;padding:5px" >'. $vo['color'] .'</div>';
                $selectResult[$key]['operate'] = showOperate($this->makeButton($vo['id']));
            }

            $return['total'] = $article->getAllConfigs($where);  // 总数据
            $return['rows'] = $selectResult;

            return json($return);
        }
        return $this->fetch();
    }
    public function configadd()
    {
        if(request()->isPost()){
            $param = input('post.');
            unset($param['thumbnail']);

            $config = new ConfigModel();
            $flag = $config->addConfig($param);

            return json(msg($flag['code'], $flag['data'], $flag['msg']));
        }
        return $this->fetch();
    }
    public function configedit()
    {
        $config = new ConfigModel();

        if(request()->isPost()){

            $param = input('post.');
            $flag = $config->editConfig($param);
            return json(msg($flag['code'], $flag['data'], $flag['msg']));
        }

        $id = input('id');
        $this->assign([
            'config' => $config->getOneConfig($id)
        ]);
        return $this->fetch();
    }

    public function configDel()
    {
        $id = input('param.id');

        $config = new ConfigModel();
        $flag = $config->delConfig($id);
        return json(msg($flag['code'], $flag['data'], $flag['msg']));
    }

    /**
     * 拼装操作按钮
     * @param $id
     * @return array
     */
    private function makeButton($id)
    {
        return [
            '编辑' => [
                'auth' => 'config/configedit',
                'href' => url('config/configedit', ['id' => $id]),
                'btnStyle' => 'primary',
                'icon' => 'fa fa-paste'
            ],
            '删除' => [
                'auth' => 'config/configdel',
                'href' => "javascript:configDel(" . $id . ")",
                'btnStyle' => 'danger',
                'icon' => 'fa fa-trash-o'
            ]
        ];
    }

}

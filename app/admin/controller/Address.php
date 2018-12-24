<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/20
 * Time: 19:41
 */
namespace app\admin\controller;
use app\admin\model\AddressModel;

class Address extends Base
{
    public function index()
    {
        if($this->request->isAjax()){
            $param = input('param.');

            $limit = $param['pageSize'];  //10
            $offset = ($param['pageNumber'] - 1) * $limit;  //$param['pageNumber']=1

            $where = [];
            if (!empty($param['searchText'])) {
                $where['ip'] = ['like', '%' . $param['searchText'] . '%'];
            }

            $address = new AddressModel();
            $selectResult = $address->getAddressByWhere($where, $offset, $limit);

            $status = config('ip_status');

            foreach ($selectResult as $key => $vo){
                $selectResult[$key]['mtime'] = date('Y-m-d H:i:s', $vo['mtime']);
                if($vo['updated_at'] == ''){
                    $vo['updated_at'] = '';
                }else{
                    $selectResult[$key]['updated_at'] = date('Y-m-d H:i:s', $vo['updated_at']);
                }
                $selectResult[$key]['status'] = $status[$vo['status']];
                $selectResult[$key]['operate'] = showOperate($this->makeButton($vo['id']));
            }

            $return['total'] = $address->getAllAddress($where);  //总数据
            $return['rows'] = $selectResult;
            return json($return);
        }
        return $this->fetch();
    }
    public function ipAdd()
    {
        if($this->request->isPost()){
            $param = input('post.');
            $address = new AddressModel();
            $flag = $address->insertBacklist($param);
            return json(msg($flag['code'], $flag['data'], $flag['msg']));
        }
        return $this->fetch();
    }
    public function ipOn()
    {
        $address = new AddressModel();
        $id = input('param.id');
        $flag = $address->On($id);
        return json(msg($flag['code'], $flag['data'], $flag['msg']));
    }
    // 禁用
    public function ipOff()
    {
        $address = new AddressModel();
        $id = input('param.id');
        $flag = $address->Off($id);
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
            '启用' => [
                'auth' => 'address/ipon',
                'href' => "javascript:ipOn(" .$id .")",
                'btnStyle' => 'primary',
                'icon' => 'fa fa-paste'
            ],
            '禁用' => [
                'auth' => 'address/ipoff',
                'href' => "javascript:ipOff(" .$id .")",
                'btnStyle' => 'danger',
                'icon' => 'fa fa-trash-o'
            ]
        ];
    }
}
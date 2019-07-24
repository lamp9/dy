<?php
// +----------------------------------------------------------------------
// | Free open source business system （免费开源电商系统）
// +----------------------------------------------------------------------
// | Copyright (c) 2011~2019 https://www.jestso.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 温猪猪
// +----------------------------------------------------------------------

namespace app\admin\controller;
use app\common\controller\Backend;
use think\Db;

/*
 * 订单 管理
 * 增删改查
 *
 * */
class Order extends Backend {

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\Order();
        $this->view->assign("stateList", $this->model->getStateList());
        $this->view->assign("statusList", $this->model->getStatusList());

    }
    public function index() {
        if ($this->request->isAjax())
        {
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                ->where($where)
                ->order($sort, $order)
                ->count();
            $list = $this->model
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();
            foreach ($list as $key => $value) {
                $user = Db::name("user")->where(array("id" => $value['member_id']))->field("username")->find();
                //dump($user['username']);exit;
                $list[$key]['user_name'] = $user['username'];
            }
            $result = array("total" => $total, "rows" => $list, "extend" => ['money' => 1024, 'price' => 888]);
            return json($result);
        }
        return $this->view->fetch();
    }
}
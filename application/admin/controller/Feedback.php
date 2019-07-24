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
 * 用户反馈管理
 * 增删改查
 *
 * */

class Feedback extends Backend {

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\Feedback();
        $this->view->assign("stateList", $this->model->getStateList());
        $this->view->assign("typeList", $this->model->getTypeList());
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
                $user = Db::name("user")->where(array("id" => $value['user_id']))->field("username")->find();
                //dump($user['username']);exit;
                $list[$key]['user_name'] = $user['username'];
            }
            $result = array("total" => $total, "rows" => $list, "extend" => ['money' => 1024, 'price' => 888]);
            return json($result);
        }
        return $this->view->fetch();
    }

    // 添加回复内容
    public function edit($ids=null) {
        if($this->request->isGet()){
            $row = Db::name("feedback")->where(array("id" => $ids))->find();
            $user = Db::name("user")->where(array("id" => $row['user_id']))->field("username")->find();
            $this->view->assign("row", $row);
            $this->view->assign("pid", $row['pid']?$row['pid']:0);
            $this->view->assign("user", $user['username']);
            return $this->view->fetch();
        }else{
            $params = $this->request->post();
            $data['pid'] = $params['id'];
            $data['create_time'] = time();
            $data['context'] = $params['context'];
            $data['user_id'] = $params['user_id'];
            //0 待回答 1 已回答 2 追加反馈 3 追加回
            if($params['pid'] == 0){
                //回答
                $data['state'] = 2;
            }else if($params['pid'] >0){
                $data['state'] = 4;
            }
           /* dump($data);
            exit;*/
            Db::name("feedback")->insert($data);
            $id = Db::name("feedback")->getLastInsID();
            Db::name("feedback")->where(array("id"=>$id))->update(array("weigh"=>$id));
            $this->success();
        }
    }
}
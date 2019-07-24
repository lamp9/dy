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
 * 产品 管理
 * 增删改查
 *
 * */
class Product extends Backend {


    public function uniqueId($key) {
        return substr(md5($key.time()), 12, 8);
    }


    public function _initialize() {
        parent::_initialize();
        $this->model = new \app\admin\model\Product();
        $this->view->assign("stateList", $this->model->getStateList());
        $this->view->assign("statusList", $this->model->getStatusList());

    }

    public function index() {
        if ($this->request->isAjax()) {
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
            $result = array("total" => $total, "rows" => $list, "extend" => ['money' => 1024, 'price' => 888]);
            return json($result);
        }
        return $this->view->fetch();
    }

    public function add() {
        if($this->request->isGet()){
            return $this->view->fetch();
        }else{
            $params = $this->request->post();
            //product 表插入数据
            $base['name'] = $params['name'];
            $base['desc'] = $params['desc'];
            $base['image'] = $params['image'];
            $base['weigh'] = $params['weigh'];
            $base['state'] = $params['state'];
            $base['up_time'] = time();
            $base['result'] = $params['result'];//
            $base['attr'] = $this->request->post('row/a')['json'];
            Db::name("product")->insert($base);
            $product_id = Db::name("product")->getLastInsID();
            if($base['result'] && $base['attr']) {

                // product_attr 表插入数据
                $row = json_decode($base['result'],true);
                $product_attr = array();
                foreach ($row as $key => $value) {
                    $product_attr[$key]['product_id'] = $product_id;
                    $product_attr[$key]['attr_name'] = $value['key'];
                    $product_attr[$key]['attr_values'] = implode(",",$value['value']);
                }
                Db::name('product_attr')->insertAll($product_attr);
                // product_attr_value 表插入数据
                $product = $params['product'];
                foreach ($product as $key => $value) {
                    $product[$key]['product_id'] = $product_id;
                    $product[$key]['unique'] = $this->uniqueId($product_id.$value['sku']);
                }
                Db::name("product_attr_value")->insertAll($product);
            }

            $this->success("添加成功");
        }
    }

    /**
     * 编辑
     * @param null $ids
     * @return string
     * @throws \think\Exception
     * @throws \think\exception\DbException
     */
    public function edit($ids = null)
    {
        $row = $this->model->get($ids);
        $attr = Db::name("product_attr_value")->where(array("product_id" => $ids))->select();
        if (!$row) {
            $this->error(__('No Results were found'));
        }
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds)) {
            if (!in_array($row[$this->dataLimitField], $adminIds)) {
                $this->error(__('You have no permission'));
            }
        }

        if ($this->request->isPost()) {
            $params = $this->request->post();

            if ($params) {
                //$params = $this->preExcludeDate($this->preExcludeFields($params));
                // product 表修改数据
                $base['result'] = $params['result'];//
                $base['attr'] = $this->request->post('row/a')['json'];
                $base['id'] = $params['id'];
                $base['name'] = $params['name'];
                $base['desc'] = $params['desc'];
                $base['image'] = $params['image'];
                $base['weigh'] = $params['weigh'];
                $base['state'] = $params['state'];
                //$base['up_time'] = time();
                $base['result'] = $params['result'];//
                Db::name("product")->update($base);
                // product_attr 表修改数据
                if($base['result'] && $base['attr']) {

                    //echo Db::name("product")->getLastInsID();exit;
                    // product_attr
                    $row = json_decode($base['result'],true);
                    //dump($row);exit;
                    $product_attr = array();
                    foreach ($row as $key => $value) {
                        $product_attr[$key]['product_id'] = $base['id'];
                        $product_attr[$key]['attr_name'] = $value['key'];
                        $product_attr[$key]['attr_values'] = implode(",",$value['value']);
                        $where= array("product_id" => $base['id'], 'attr_name' => $value['key']);
                        $record = Db("product_attr")->where($where)->find();
                        if($record) {
                            Db::name('product_attr')->where($where)->update(array("attr_values"=>$product_attr[$key]['attr_values']));
                        }else{
                            Db::name('product_attr')->where($where)->insert($product_attr[$key]);
                        }
                    }
                    // product_attr_value 表修改数据
                    $product = $params['product'];
                    foreach ($product as $key => $value) {
                        $product[$key]['product_id'] = $base['id'];
                        //$product[$key]['unique'] = $this->uniqueId($product_id.$value['sku']);
                        $res = Db::name("product_attr_value")->where(array("sku" => $value['sku'],"product_id"=>$base['id']))->find();
                        //dump($res);exit;
                        if ($res) {
                            Db::name("product_attr_value")->where(array("sku" => $value['sku'],"product_id"=>$base['id']))->update($product[$key]);
                        }else{
                            $product[$key]['unique'] = $this->uniqueId($base['id'].$value['sku']);
                            Db::name("product_attr_value")->insert($product[$key]);
                        }
                    }
                    $this->success();
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }

        $this->view->assign("row", $row);
        $this->view->assign("attr", $attr);
        return $this->view->fetch();
    }
}

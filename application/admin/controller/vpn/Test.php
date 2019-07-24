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
namespace app\admin\controller\vpn;
use app\common\controller\Backend;
use GuzzleHttp\Client;
use think\Db;

/**
 *  试用VPN 管理
 *
 * */
class Test extends Backend {
    // java项目地址
    private $BASE_URL="http://localhost:8080/";
    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\TestVpn();
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
            $result = array("total" => $total, "rows" => $list, "extend" => ['money' => 1024, 'price' => 888]);
            return json($result);
        }
        return $this->view->fetch();
    }

    public function add() {
        if($this->request->isGet()){
            return $this->view->fetch();
        }else{
            $count = $this->request->request('count');
            $day= $this->request->request('day');
            $client = new Client();
            $url=$this->BASE_URL."vpn/generate/".($count?$count:10);
            //$this->success($url);exit;

            $res = $client->get($url);
            $body = $res->getBody();
            //$this->success("200",$body->getContents());exit;
            // Implicitly cast the body to a string and echo it
            $res = json_decode($body->getContents(),true);
            //dump($res);exit;
            Db::name("test_vpn")->where(array("type" => 1))->delete();
           //Db::name("test_vpn")->execute("truncate table vpn_test_vpn");
            foreach ($res['data'] as $key => $value) {
                $res['data'][$key]['start_time'] = time();
                // 后台配置化
                if($day>0) {
                    $res['data'][$key]['type']=2;
                    $res['data'][$key]['end_time'] = time() + 3600 * 24 * $day; //默认创建测试账号有效期24小时
                }else{
                    // 1 默认过期时间1天
                    $res['data'][$key]['type']=1;
                    $res['data'][$key]['end_time'] = time()+3600*24; //默认创建测试账号有效期24小时
                }
            }
            //dump($res);exit;
            Db::name("test_vpn")->insertAll($res['data']);
            // exit();
            //$this->success("success","");
            $this->success("更新成功", "/admin/vpn/test/index", "");
        }
    }

    /*
     *  检查是否已经过期
     *  自动停止
     *  并清除
     * */
    public function overtime() {
        $vpn = Db::name("test_vpn")->where("end_time <" . time())->find();
        $client = new Client();
        foreach ($vpn as $key => $value) {
            $url = $this->BASE_URL."vpn/stop/".$value['name'];
            $res = $client->get($url);
            $body = $res->getBody();
            // Implicitly cast the body to a string and echo it
            $res = json_decode($body->getContents(),true);
            // Explicitly cast the body to a string
            //$stringBody = (string) $body;
            $res['vpn_id']= $value['id'];
            //dump($res);exit;
            Db::name("test_vpn")->where(array('id'=>$value['id']))->delete();
        }
        $this->success();
    }
}

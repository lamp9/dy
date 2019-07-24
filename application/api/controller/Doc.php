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
namespace app\api\controller;

use think\Controller;



class Doc extends Controller
{
    public function index(){
        //echo ROOT_PATH;exit;
        $res = $this->init();
        if ($res == true) {
            $this->redirect('http://www.vpn.com/swagger-ui/dist/index.html');
        }
    }

    private function init(){
        $path = __DIR__; //你想要哪个文件夹下面的注释生成对应的API文档
        $entity = dirname(__DIR__) . "/entity";
        $swagger = \Swagger\scan([$path,$entity]);
        //header('Content-Type: application/json');
        //echo $swagger;exit;
        $swagger_json_path = ROOT_PATH.'/public/assets/js/swagger.json';
        return file_put_contents($swagger_json_path, $swagger);
    }

    public function reload() {
        $res = $this->init();
        if($res) {
            header("Content-type:application/json");
            $arr =array("msg"=>"success","status"=>200);
            echo json_encode($arr);
            exit;
        }
    }


}
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

use app\common\controller\Api;
use think\Db;


// 产品控制器
class Product extends Api {

    //如果$noNeedLogin为空表示所有接口都需要登录才能请求
    //如果$noNeedRight为空表示所有接口都需要验证权限才能请求
    //如果接口已经设置无需登录,那也就无需鉴权了
    //
    // 无需登录的接口,*表示全部
    protected $noNeedLogin = ["*"];
    // 无需鉴权的接口,*表示全部
    protected $noNeedRight = ['*'];


    // 产品列表
    /**
     * @SWG\Post(
     *   path="/product/index",
     *   tags={"产品列表:选购VPN"},
     *   summary="Create a test2",
     *   operationId="test2",
     *
     *   @SWG\Response(
     *     response="default",
     *     description="请求成功返回用户信息",
     *     @SWG\schema(
     *     		 type="object",
     *          @SWG\Property(property="time", type="string", description="时间"),
     *          @SWG\Property(property="msg", type="string", description="信息"),
     *          @SWG\Property(property="code", type="string", description="信息码"),
     *          @SWG\Property(
     *               property="data",
     *               type="array",
     *               @SWG\Items(
     *                   ref="#/definitions/ProductEntity"
     *               )
     *          ),
     *      ),
     *    )
     * )
     */
    public function index() {
        $product = Db::name("product_cycle")->select();
        $data = [];
        foreach ($product as $key => $value) {
        	$item['product_cycle_name'] = $value['title'];
        	$productCycleItem = Db::name("product_cycle_item")->where(['cycle_id' => $value['id']])->select();
			foreach($productCycleItem as $pk => $pv){
				$pv['product_id'] = $pv['product_id'];
				$productCycleItem[$pk] = $pv;
			}
        	$item['product_cycle_list'] = $productCycleItem;

        	$data[] = $item;
        }

        $this->success("", $data);
    }
}
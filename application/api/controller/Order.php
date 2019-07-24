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

/*
 *  订单接口
 * */
class Order extends Api {
    //如果$noNeedLogin为空表示所有接口都需要登录才能请求
    //如果$noNeedRight为空表示所有接口都需要验证权限才能请求
    //如果接口已经设置无需登录,那也就无需鉴权了
    //
    // 无需登录的接口,*表示全部
    protected $noNeedLogin = [];
    // 无需鉴权的接口,*表示全部
    protected $noNeedRight = ['*'];

    // 创建订单
    // 1 创建订单 2 订单失效 3 订单付款
    /**
     * @SWG\POST(
     *   path="/order/create",
     *   tags={"创建订单"},
     *   summary="Create a test2",
     *   operationId="test2",
     *   @SWG\Parameter(
     *         name="token",
     *         in="header",
     *         description="登录后返回的token",
     *         required=true,
     *         type="string"
     *     ),
     *     @SWG\Parameter(
     *         name="product_id",
     *         in="formData",
     *         description="产品id",
     *         required=true,
     *         type="string",
     *     ),
     *   @SWG\Response(
     *     response="default",
     *     description="请求成功返回用户信息",
     *     @SWG\schema(
     *     		 type="object",
     *          @SWG\Property(property="time", type="string", description="时间"),
     *          @SWG\Property(property="msg", type="string", description="信息"),
     *          @SWG\Property(property="code", type="string", description="信息码"),
     *          @SWG\Property(property="data", type="string", description=""),
     *      ),
     *    )
     * )
     */
    public function create() {
        // member_id 用户id
        // order_number 订单号
        // order_create_time 订单创建时间
        // status 0 订单未支付 1 订单已支付 2 退款
        // product_id 产品id
        // start_time 服务开始时间 // 由支付完后开始算
        // end_time 服务结束时间

        //$data = request()->put();

		$user = $this->userInfo();

        $data['user_id'] = $user['user_id'];
        $data['product_id'] = $this->request->request('product_id');
        // member_id
        // product_id
        $product = Db::name("product_cycle_item")->where(["product_id" => $data['product_id']])->find();
        $data['order_id'] = order_sn($user['user_id']);
        $data['create_time'] = time();
        $data['pay_time'] = 0;
        $data['end_time'] = 0;
        $data['start_time'] = 0;
        $data['delete_time'] = 0;
        $data['price'] = $product['price'];
        $data['day'] = $product['day'];
		$data['product_id']=$product['product_id'];
        Db::name("order")->insert($data);
        $id = Db::name("order")->getLastInsID();

		$res = Db::name("order")->where(['id' => $id])->find();
        $this->success("success", ['order_info' => $res]);
    }

	/**
	 * @SWG\POST(
	 *   path="/order/cancel",
	 *   tags={"取消订单"},
	 *   @SWG\Parameter(
	 *         name="token",
	 *         in="header",
	 *         description="登录后返回的token",
	 *         required=true,
	 *         type="string"
	 *     ),
	 *     @SWG\Parameter(
	 *         name="order_id",
	 *         in="formData",
	 *         description="订单id",
	 *         required=true,
	 *         type="string",
	 *     ),
	 *   @SWG\Response(
	 *     response="default",
	 *     description="请求成功返回用户信息",
	 *     @SWG\schema(
	 *     		 type="object",
	 *          @SWG\Property(property="time", type="string", description="时间"),
	 *          @SWG\Property(property="msg", type="string", description="信息"),
	 *          @SWG\Property(property="code", type="string", description="信息码"),
	 *          @SWG\Property(property="data", type="string", description=""),
	 *      ),
	 *    )
	 * )
	 */
    public function cancel(){
		$user = $this->userInfo();

		$order_id = $this->request->request('order_id');
		$data = Db::name("order")->where(['user_id' => $user['user_id'], 'order_id' => $order_id])->find();

		if($data){
			$data['state'] = 3;
			Db::name("order")->where(['order_id' => $order_id])->update(['state' => 3]);

			$this->success("success");
		} else $this->error();

	}

	/**
	 * @SWG\POST(
	 *   path="/order/paySuccess",
	 *   tags={"支付成功"},
	 *   @SWG\Parameter(
	 *         name="token",
	 *         in="header",
	 *         description="登录后返回的token",
	 *         required=true,
	 *         type="string"
	 *     ),
	 *     @SWG\Parameter(
	 *         name="order_id",
	 *         in="formData",
	 *         description="订单id",
	 *         required=true,
	 *         type="string",
	 *     ),
	 *     @SWG\Parameter(
	 *         name="receipt",
	 *         in="formData",
	 *         description="苹果返回参数",
	 *         required=true,
	 *         type="string",
	 *     ),
	 *     @SWG\Parameter(
	 *         name="product_id",
	 *         in="formData",
	 *         description="产品ID",
	 *         required=true,
	 *         type="string",
	 *     ),
	 *   @SWG\Response(
	 *     response="default",
	 *     description="请求成功返回用户信息",
	 *     @SWG\schema(
	 *     		 type="object",
	 *          @SWG\Property(property="time", type="string", description="时间"),
	 *          @SWG\Property(property="msg", type="string", description="信息"),
	 *          @SWG\Property(property="code", type="string", description="信息码"),
	 *          @SWG\Property(property="data", type="string", description=""),
	 *      ),
	 *    )
	 * )
	 */
    public function paySuccess(){
		$user = $this->userInfo();

		$order_id = $this->request->request('order_id');
		$receipt = $this->request->request('receipt');

		$product_id = $this->request->request('product_id');

		$data = Db::name("order")->where(['user_id' => $user['user_id'], 'order_id' => $order_id])->find();
		$data['apple_receipt_data'] = $receipt;
		Db::name("order")->where(['order_id' => $order_id])->update($data);


		if(1 == $data['state']){
			$this->success("Payment made, no second payment!");
			return;
		}

		$payRes = Pay::validate_apple_pay($receipt);

		if($data && $product_id == $data['product_id']){
			$startTime = time();
			$endTime = 60 * 60 * 24 * $data['day'] + $startTime;

			$data['pay_time'] = $startTime;
			$data['start_time'] = $startTime;
			$data['end_time'] = $endTime;
			$data['state'] = 1;

			Db::name("order")->where(['order_id' => $order_id])->update($data);
			$vpn = Vpn::createVpn($user['user_id'], $startTime, $endTime);

			Db::name("order")->where(['order_id' => $order_id])->update(['vpn_id' => $vpn['id']]);

			$data = Db::name("member_vpn")->where(['user_id' => $user['user_id'], 'id' => $vpn['id']])->find();
			$this->success("success", ['vpn' => $data, 'appleInfo' => $payRes]);
		} else $this->error('No such product!', ['appleInfo' => $payRes]);
	}


	/**
	 * @SWG\POST(
	 *   path="/order/paySuccessTest",
	 *   tags={"支付成功"},
	 *   @SWG\Parameter(
	 *         name="token",
	 *         in="header",
	 *         description="登录后返回的token",
	 *         required=true,
	 *         type="string"
	 *     ),
	 *     @SWG\Parameter(
	 *         name="order_id",
	 *         in="formData",
	 *         description="订单id",
	 *         required=true,
	 *         type="string",
	 *     ),
	 *     @SWG\Parameter(
	 *         name="product_id",
	 *         in="formData",
	 *         description="产品ID",
	 *         required=true,
	 *         type="string",
	 *     ),
	 *   @SWG\Response(
	 *     response="default",
	 *     description="请求成功返回用户信息",
	 *     @SWG\schema(
	 *     		 type="object",
	 *          @SWG\Property(property="time", type="string", description="时间"),
	 *          @SWG\Property(property="msg", type="string", description="信息"),
	 *          @SWG\Property(property="code", type="string", description="信息码"),
	 *          @SWG\Property(property="data", type="string", description=""),
	 *      ),
	 *    )
	 * )
	 */
	public function paySuccessTest(){
		$user = $this->userInfo();

		$order_id = $this->request->request('order_id');
		$product_id = $this->request->request('product_id');

		$data = Db::name("order")->where(['user_id' => $user['user_id'], 'order_id' => $order_id])->find();

		$payRes = [];
		if(1 == $data['state']){
			$this->success("已支付，请勿二次支付");
			return;
		}

		if($data && $product_id == $data['product_id']){
			$startTime = time();
			$endTime = 60 * 60 * 24 * $data['day'] + $startTime;

			$data['pay_time'] = 1;
			$data['start_time'] = $startTime;
			$data['end_time'] = $endTime;
			$data['state'] = 1;

			Db::name("order")->where(['order_id' => $order_id])->update($data);
			$vpn = Vpn::createVpn($user['user_id'], $startTime, $endTime);

			Db::name("order")->where(['order_id' => $order_id])->update(['vpn_id' => $vpn['id']]);

			$data = Db::name("member_vpn")->where(['user_id' => $user['user_id'], 'id' => $vpn['id']])->find();
			$this->success("success", ['vpn' => $data, 'appleInfo' => $payRes]);
		} else $this->error('产品不符！', ['appleInfo' => $payRes]);
	}

    // 创建订单
    // 1 创建订单 2 订单失效 3 订单付款
    /**
     * @SWG\POST(
     *   path="/order/index",
     *   tags={"订单列表:我的订单"},
     *   summary="Create a test2",
     *   operationId="test2",
     *   @SWG\Parameter(
     *         name="token",
     *         in="header",
     *         description="登录后返回的token",
     *         required=true,
     *         type="string"
     *     ),
     *   @SWG\Response(
     *     response="default",
     *     description="请求成功返回订单信息",
     *     @SWG\schema(
     *     		 type="object",
     *          @SWG\Property(property="time", type="string", description="时间"),
     *          @SWG\Property(property="msg", type="string", description="信息"),
     *          @SWG\Property(property="code", type="string", description="信息码"),
    *           @SWG\Property(
     *               property="data",
     *               type="array",
     *               @SWG\Items(
     *                   ref="#/definitions/Order"
     *               )
     *          ),
     *      ),
     *    )
     * )
     */
    public function index() {
		$user = $this->userInfo();
        $res = Db::name("order")
            ->where(array("user_id"=>$user['user_id']))
            ->select();

        foreach ($res as $k => $v){
        	$item = $res[$k];
        	$vpn = Db::name("member_vpn")->where(['id' => $item['vpn_id']])->find();
			$product = Db::name("product_cycle_item")->where(['product_id' => $item['product_id']])->find();
			$item['vpn'] = $vpn;
			$item['product'] = $product;
			#$item['vpn_title'] = "{$vpn['host']}:{$vpn['port']}";
			$item['vpn_title'] = "{$product['title']}";
			$item['remark'] = "";
			$res[$k] = $item;
		}

        $this->success("", $res);
    }
}
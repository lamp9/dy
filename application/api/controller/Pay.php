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

// 支付接口
class Pay extends Api{
    //如果$noNeedLogin为空表示所有接口都需要登录才能请求
    //如果$noNeedRight为空表示所有接口都需要验证权限才能请求
    //如果接口已经设置无需登录,那也就无需鉴权了
    //
    // 无需登录的接口,*表示全部
    protected $noNeedLogin = [];
    // 无需鉴权的接口,*表示全部
    protected $noNeedRight = ['*'];

    public function index() {
        $this->success("", "index");
    }
    public static function curlHtml($url, $data = ''){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        #curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

		#curl_setopt($ch, CURLOPT_HTTPHEADER,     array('Content-Type: text/plain'));

		curl_setopt($ch, CURLOPT_HTTPHEADER, array(
				#'X-AjaxPro-Method:ShowList',
				'Content-Type: application/json; charset=utf-8',
				'Content-Length: ' . strlen($data))
		);
        if(!empty($data)) {
            curl_setopt($ch, CURLOPT_POST, TRUE);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        }
        $output = curl_exec($ch);
        //释放curl句柄
        curl_close($ch);
        return $output;
    }

    /**
     * 验证AppStore内付
     * @param  string $receipt_data 付款后凭证
     * @return array                验证是否成功
     */
    public static function validate_apple_pay($receipt_data) {
        /**
         * 21000 App Store不能读取你提供的JSON对象
         * 21002 receipt-data域的数据有问题
         * 21003 receipt无法通过验证
         * 21004 提供的shared secret不匹配你账号中的shared secret
         * 21005 receipt服务器当前不可用
         * 21006 receipt合法，但是订阅已过期。服务器接收到这个状态码时，receipt数据仍然会解码并一起发送
         * 21007 receipt是Sandbox receipt，但却发送至生产系统的验证服务
         * 21008 receipt是生产receipt，但却发送至Sandbox环境的验证服务
         */
        function acurl($receipt_data, $sandbox=0) {
            #不能使用json_encode
            #$POSTFIELDS = array("receipt-data" => $receipt_data);
            #$POSTFIELDS = json_encode($POSTFIELDS);

			$POSTFIELDS = "{\"receipt-data\":\"{$receipt_data}\"}";

            //正式购买地址 沙盒购买地址
            $url_buy     = "https://buy.itunes.apple.com/verifyReceipt";
            $url_sandbox = "https://sandbox.itunes.apple.com/verifyReceipt";
            $url = $sandbox ? $url_sandbox : $url_buy;
            return Pay::curlHtml($url, $POSTFIELDS);
        }
        // 验证参数
        if (strlen($receipt_data)<20){
            $result = ['status'=>false, 'message'=>'非法参数'];
            return $result;
        }
        // 请求验证
        $html = acurl($receipt_data);
        $data = json_decode($html,true);

        $arrData[] = $data;
		#file_put_contents("/home/wwwroot/phpfetcher.set/cache/applePay", "{$html}\n\n\n",FILE_APPEND);

        // 如果是沙盒数据 则验证沙盒模式
        if($data['status'] == '21007'){
            // 请求验证
            $html = acurl($receipt_data, 1);
            $data = json_decode($html,true);

			$arrData[] = $data;
			#file_put_contents("/home/wwwroot/phpfetcher.set/cache/applePay", "{$html}\n\n\n",FILE_APPEND);
        }

        return $arrData;
        return $data;
    }

    public function apple_pay() {
        /*苹果内购的验证收据
        这里坑有点大.我这里是因为客户端传过来的验证收据已经进行base64加密了，所以后端无需再次加密，但是传到后端后+号会变成空格等导致老是出现21002错误，解决办法就是下面这样进行一次正则替换，如果客户端传过来的没有进行加密，则后端再进行一次base64加密即可。*/
        $receipt_data = preg_replace('/\s/', '+', input('post.apple_receipt'));
        $order_id = input('post.orderid');
        //获取订单信息
        //$order_info = UserOrderInfoModel::getOne('orderid, rmb, playerid,shopid,orderstatus', ['orderid' => $orderid]);
        $order_info = Db::name("order")->where(array("order_id" => $order_id))->find();
        if (!empty($order_info) && ($order_info['status'] == 0)) {
            // 验证支付状态
            $result = $this->validate_apple_pay($receipt_data);
            if($result['status']){
                // 验证通过后订单处理等逻辑
                $this->payHandler($order_info);
                $this->success(200, '购买成功');
            }else{
                // 验证不通过
                $this->error(-1, '购买成功');
            }
        }else{
            $this->error(-2, '购买成功');
        }
    }

    protected function payHandler($order_info) {
        $order_info['status']=1;
        $order = Db::name("order")->where(array("status" => 0, "order_id" => $order_info['order_id']))->find();
        //订单是否没有修改过状态
        if ($order) {
            // Db::name("order")->save($order_info);
            // 1. 修改订单 start_time end_time
            // 2. 修改订单状态
            // 3. 创建vpn 加上时间限制  Vpn->createVpn(user_id,start,end)

            // 等客户端发起启动请求再去启动
        }
    }

    public function test() {
        echo date("Y-m-d h:i:s",time());
        echo "<br/>";
        echo date("Y-m-d h:i:s",time()+3600*12);

    }
}
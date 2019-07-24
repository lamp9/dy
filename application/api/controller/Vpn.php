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
use GuzzleHttp\Client;
use think\Db;

/**
 * vpn 接口
 */
class Vpn extends Api {
	#vpn命令行路径
	public static $vpnCmdPath = "/home/data/web/phpfetcher.set/vpn";

    // vpn 服务器地址
    private $BASE_URL="http://localhost:8080/";
    //如果$noNeedLogin为空表示所有接口都需要登录才能请求
    //如果$noNeedRight为空表示所有接口都需要验证权限才能请求
    //如果接口已经设置无需登录,那也就无需鉴权了
    //
    // 无需登录的接口,*表示全部
    #protected $noNeedLogin = ['free'];
    // 无需鉴权的接口,*表示全部
    #protected $noNeedRight = ['*'];

	protected $noNeedLogin = '*';
	protected $noNeedRight = '*';


	/**
	 * @SWG\POST(
	 *   path="/vpn/index",
	 *   tags={"VPN列表"},
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

		$userModel = Db::name("user")
			->where(["id"=>$user['user_id']])
			->find();

		$freeVpn = Db::name("member_vpn_free")->where(["udid"=> $userModel['udid']])->select();

		$res = Db::name("member_vpn")->where(["id"=>$user['user_id']])->select();

		$res = array_merge($res, $freeVpn);
		foreach($res as $k => $v){
			$item = $res[$k];
			$item['vpn_id'] = $item['id'];
			$item['country'] = 'America';
			$item['delay'] = rand(8, 80)."ms";
			$item['remarks'] = '';

			$res[$k] = $item;
		}

		$this->success("", $res);
	}

	/**
	 * @SWG\Post(
	 *   path="/vpn/status",
	 *   tags={"VPN状态"},
	 *   @SWG\Parameter(
	 *         name="token",
	 *         in="header",
	 *         description="登录后返回的token",
	 *         required=true,
	 *         type="string"
	 *     ),
	 *   @SWG\Parameter(
	 *         name="vpn_name",
	 *         in="formData",
	 *         description="vpn名字",
	 *         required=true,
	 *         type="string",
	 *     ),
	 *   @SWG\Response(
	 *     response="default",
	 *     description="返回VPN信息",
	 *     @SWG\Schema(
	 *     		 type="object",
	 *          @SWG\Property(property="time", type="string", description="时间"),
	 *          @SWG\Property(property="msg", type="string", description="信息"),
	 *          @SWG\Property(property="code", type="string", description="信息码"),
	 *           @SWG\Property(
	 *               property="data",
	 *               ref="#/definitions/Vpn"
	 *          ),
	 *      ),
	 *    )
	 * )
	 */
	public function status(){
		$user = $this->userInfo();
		$vpnName = $this->request->request('vpn_name');

		$data = Db::name("member_vpn")->where(['user_id' => $user['user_id'], 'name' => $vpnName])->find();
		$this->success("success", $data);


	}


    /**
     * @SWG\POST(
     *   path="/vpn/create",
     *   tags={"创建vpn: 已弃用，订单支付成功会自动创建"},
     *   produces={"application/json"},
     *     @SWG\Parameter(
     *         name="token",
     *         in="header",
     *         description="登录后返回的token",
     *         required=true,
     *         type="string"
     *     ),
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
     *               ref="#/definitions/Vpn"
     *          ),
     *      ),
     *    )
     * )
     */
    public function create() {
		$user = $this->userInfo();

        $start_time = $this->request->request('start_time');
        $end_time = $this->request->request('end_time');
        $user_id = $user['user_id'];
        $res = $this->createVpn($user_id, $start_time, $end_time);
        $this->success("success", $res);
    }

    /**
     * @SWG\POST(
     *   path="/vpn/start",
     *   tags={"启动vpn"},
     *   produces={"application/json"},
     *     @SWG\Parameter(
     *         name="token",
     *         in="header",
     *         description="登录后返回的token",
     *         required=true,
     *         type="string"
     *     ),
     *     @SWG\Parameter(
     *         name="vpn_name",
     *         in="formData",
     *         description="vpn 名字",
     *         required=true,
     *         type="string"
     *     ),
     *   @SWG\Response(
     *     response="default",
     *     description="请求成功返回用户信息",
     *     @SWG\schema(
     *     		 type="object",
     *          @SWG\Property(property="time", type="string", description="时间"),
     *          @SWG\Property(property="msg", type="string", description="信息"),
     *          @SWG\Property(property="code", type="string", description="信息码"),
     *
     *      ),
     *    )
     * )
     */
    public function start() {
		$user = $this->userInfo();

        $vpnName = $where['name'] = $this->request->request('vpn_name');
        $vpn = Db::name("member_vpn")->where($where)->find();
        if($vpn['name'] != $vpnName) {
            $this->error("No VPN");
            exit;
        }
        //$data = json_encode($vpn);
        if($vpn['state'] == 1) { //开启
            $this->success("success");
            exit;
        }
        if($vpn['end_time']<time()){
            $this->error("Expired");
            exit;
        }
        /*$client = new Client([
            'headers'   =>[
                'Accept'        => 'application/json',
                'Content-Type'  => 'application/json'
            ]
        ]);
        //dump($where['id']);exit;
		$host = "http://{$vpn['host']}:8080/";
        #$url = $this->BASE_URL."vpn/begin";
        $url = "{$host}vpn/begin";
        $res = $client->post($url,['json' =>$vpn]);
        $body = $res->getBody();
        // Implicitly cast the body to a string and echo it
        $stringBody = json_decode($body->getContents(),true);*/

		chdir(self::$vpnCmdPath);
		exec("./yii vpn/run {$vpnName} 1", $result);
		$res = $result[0];
		$res = json_decode($res);

        if($res->success){
			self::selectVpn($user['user_id'], $vpnName);
            $this->success("success");
        }else{
            $this->error($res->msg);
        }
    }


    public static function selectVpn($userId, $vpnName){
    	Db::name("member_vpn")->where(["user_id"=>$userId])->update(["is_select"=>'0']);
    	Db::name("member_vpn")->where(["user_id"=>$userId, 'name' => $vpnName])->update(["state" => 1, "is_select"=>'1']);
	}

    /**
     * @SWG\POST(
     *   path="/vpn/stop",
     *   tags={"停止vpn"},
     *   produces={"application/json"},
     *     @SWG\Parameter(
     *         name="token",
     *         in="header",
     *         description="登录后返回的token",
     *         required=true,
     *         type="string"
     *     ),
     *      @SWG\Parameter(
     *         name="vpn_name",
     *         in="formData",
     *         description="vpn名称",
     *         required=true,
     *         type="string"
     *     ),
     *   @SWG\Response(
     *     response="default",
     *     description="请求成功返回用户信息",
     *     @SWG\schema(
     *     		 type="object",
     *          @SWG\Property(property="time", type="string", description="时间"),
     *          @SWG\Property(property="msg", type="string", description="信息"),
     *          @SWG\Property(property="code", type="string", description="信息码"),
     *
     *      ),
     *    )
     * )
     */
    public function stop() {
        $client = new Client();
        $vpnName = $where['name'] = $this->request->request('vpn_name');
        $vpn = Db::name("member_vpn")->where($where)->find();
        if($vpn['state'] == 2) {
            $this->success("success");
            exit;
        }
		/*$host = "http://{$vpn['host']}:8080/";
        #$url = $this->BASE_URL."vpn/stop/".$vpn['name'];
        $url = "{$host}vpn/stop/".$vpn['name'];
        $res = $client->get($url);
        $body = $res->getBody();
        // Implicitly cast the body to a string and echo it

        $res = json_decode($body->getContents(),true);*/
        // Explicitly cast the body to a string
        //$stringBody = (string) $body;



		chdir(self::$vpnCmdPath);
		exec("./yii vpn/run {$vpnName} 0", $result);
		$res = $result[0];
		$res = json_decode($res);

        //修改状态
        Db::name("member_vpn")->where($where)->update(array("state"=>2));
        $this->success("success");
    }


    /**
     * @SWG\Post(
     *   path="/vpn/generate",
     *   tags={"批量动态创建试用vpn"},
     *   summary="Create a test2",
     *   operationId="test2",
     *     @SWG\Parameter(
     *         name="token",
     *         in="header",
     *         description="登录后返回的token",
     *         required=true,
     *         type="string",
     *     ),
     *     @SWG\Parameter(
     *         name="count",
     *         in="formData",
     *         description="创建数量",
     *         required=true,
     *         type="string",
     *     ),
     *     @SWG\Parameter(
     *         name="day",
     *         in="formData",
     *         description="有效时间，没有默认一天",
     *         required=false,
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
     *      ),
     *    )
     * )
     */

    public function generate() {
        $count = $this->request->request('count');
        $day = $this->request->request('day');
        $client = new Client();

		$vps = Db::name("vps")->where(array("defaults" => 1))->find();
		$host = "http://{$vps['address']}:8080/";

        #$url=$this->BASE_URL."vpn/generate/".($count?$count:10);
        $url = "{$host}vpn/generate/".($count?$count:10);

        $res = $client->get($url);
        $body = $res->getBody();
        //$this->success("200",$body->getContents());exit;
        // Implicitly cast the body to a string and echo it
        $res = json_decode($body->getContents(),true);
        Db::name("test_vpn")->execute("truncate table vpn_test_vpn");

        $data = $res['data'];
        foreach ($data as $key => $value) {
			$data[$key]['start_time'] = time();
            // 后台配置化
            if($day) {
				$data[$key]['end_time'] = time() + 3600 * 24 * $day;
            }else{
				$data[$key]['end_time'] = time()+3600*24; //默认创建测试账号有效期24小时
            }
        }
        //dump($res);exit;
        Db::name("test_vpn")->insertAll($data);
       // exit();
        $this->success("success");
    }

    /*

    {
        "ip": "0.0.0.0", //返回服务器地址 0.0.0.0 是本地测试地址 45.62.125.28 线上测试地址
        "port": 30002, // 端口
        "password": "U9c2J4N6S5", // 新密码
        "method": "aes-256-cfb", // 加密方式
        "name": "vpn_337653834509848576" // 线程名称用于停止线程
    }

     * */
    /**
     * @SWG\Post(
     *   path="/vpn/change",
     *   tags={"修改vpn密码"},
     *   summary="修改vpn密码",
     *   operationId="test2",
     *     @SWG\Parameter(
     *         name="token",
     *         in="header",
     *         description="登录后返回的token",
     *         required=true,
     *         type="string",
     *     ),
     *     @SWG\Parameter(
     *         name="vpn_name",
     *         in="formData",
     *         description="vpn名字",
     *         required=true,
     *         type="string",
     *     ),
     *     @SWG\Parameter(
     *         name="password",
     *         in="formData",
     *         description="新密码",
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
     *      ),
     *    )
     * )
     */
    public function change() {
		$user = $this->userInfo();

        $pwd = $data['password'] = $this->request->request('password');
        $vpnName = $data['vpn_name'] = $this->request->request('vpn_name');
        $vpn = Db::name("member_vpn")->where(array("name" => $data['vpn_name'], "user_id" => $user['user_id']))->find();

		//修改密码
		$vpn['password']=$data['password'];
		Db::name('member_vpn')->update($vpn);
		/*// 请求java
		$client = new Client([
			'headers'   =>[
				'Accept'        => 'application/json',
				'Content-Type'  => 'application/json'
			]
		]);

		$host = "http://{$vpn['host']}:8080/";
		$url = "{$host}vpn/change";
		// 重新启动vpn
		$res = $client->post($url,['json' =>$vpn]);
		$body = $res->getBody();
		// Implicitly cast the body to a string and echo it
		$stringBody = json_decode($body->getContents(),true);*/


		chdir(self::$vpnCmdPath);
		exec("./yii vpn/change-pwd {$vpnName} \"{$pwd}\"", $result);
		$res = $result[0];
		$res = json_decode($res);

        $this->success("success",$vpn);
    }


	/**
	 * @SWG\Post(
	 *   path="/vpn/free",
	 *   tags={"免费vpn"},
	 *   summary="免费vpn",
	 *   operationId="",
	 *     @SWG\Parameter(
	 *         name="udid",
	 *         in="formData",
	 *         description="机器唯一识别码",
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
	 *      ),
	 *    )
	 * )
	 */
	public function free() {
		$udid = $this->request->request('udid');

		$udidModel = Db::name("member_vpn_free")->where(['udid' => $udid])->find();

		if($udidModel) {
			$this->success("success", ['list' => [$udidModel]]);
			exit;
		}

		$data = [
			'udid' => $udid,
			"host" => "45.62.125.28",
			"port" => "10000",
			"password" => "1ab31d5778",
			"method" => "aes-256-cfb",
			"name" => "",
			"user_id" => 0,
			"start_time" => time(),
			"end_time" => ((int) time()) + (60 * 60 * 24),
			"status" => "normal",
			"machine" => 1,
			"weigh" => 0,
			"state" => "1",
			"is_select" => "0",
			"delete_time" => 0,
			#"vpn_id" => 0,
			#"country" => "America",
			#"delay" => "38ms",
			#"remarks" => ""
		];
		Db::name("member_vpn_free")->insert($data);
		$data['id'] = Db::name("member_vpn")->getLastInsID();

		$this->success("success",['list' => [$data]]);
	}

    /**
     * @param $user_id
     * @param $start_time
     * @param $end_time
     * @return mixed|\Psr\Http\Message\ResponseInterface
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function createVpn($user_id, $start_time, $end_time) {
        //默认一台机器
        $vps = Db::name("vps")->where(array("defaults" => 1))->find();
        $where['machine'] = $vps['id'];

        $client = new Client();
        // 查看端口占用情况
        $maxPort = Db::name("member_vpn")->where($where)->max("port");
        if ($maxPort) {
            $port = $maxPort + 1;
        } else {
            $port = $vps['port'];
            $port = 10000;
        }


        /*// 创建vpn
		$host = "http://{$vps['address']}:8080/";
        #$url = $this->BASE_URL . "vpn/create";
        $url = "{$host}vpn/create";
        $request = array(
            "uid" => $user_id,
            "mid" => $where['machine'],
            "port" => $port,
            "ip" => $vps['address']//此处应为php到后台取添加vps数据的ip地址
        );

        $res = $client->post($url, ['json' => $request]);
        $body = $res->getBody();
        // Implicitly cast the body to a string and echo it
        $res = json_decode($body->getContents(), true);
        // Explicitly cast the body to a string
        //$stringBody = (string) $body;*/

        $time = time();

        $res['host'] = $vps['address'];
        $res['port'] = $port;
        $res['password'] = substr(md5(rand(9999, 999999).$time), 0, 10);
        $vpnName = $res['name'] = "vpn_".md5($time.rand(9999, 999999).$time);
        $res['method'] = 'aes-256-cfb';
        $res['user_id'] = $user_id;
        $res['state'] = 1;
        $res['is_select'] = '0';
        $res['machine'] = $where['machine'];
        // 有过期时间的加上过期时间 没有默认过期1天
        if ($start_time && $end_time) {
            $res['start_time'] = $start_time;
            $res['end_time'] = $end_time;
        } else {
            $res['start_time'] = time();
            //过期时间写入数据库
            $res['end_time'] = time() + 3600;
        }
        $res['status'] = 'normal';
        Db::name("member_vpn")->insert($res);
        $res['id'] = Db::name("member_vpn")->getLastInsID();
        $res['machine_id'] = $vps['id'];
        #创建&启动

		chdir(self::$vpnCmdPath);
        exec("./yii vpn/create {$vpnName}", $result);
		#$res = $result[0];
		#$res = json_decode($res);

		self::selectVpn($user_id, $vpnName);

        return $res;
    }


}
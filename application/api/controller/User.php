<?php

namespace app\api\controller;

use think\Hook;
use think\Db;
use app\common\controller\Api;
use app\common\library\Ems;
use app\common\library\Sms;
use app\common\model\User as UserModel;
use app\common\model\EmsInvite;
use fast\Random;
use think\Validate;

/**
 * 会员接口
 */
class User extends Api
{
    #protected $noNeedLogin = ['login', 'mobilelogin', 'register', 'resetpwd', 'changeemail', 'changemobile', 'third'];
    #protected $noNeedRight = '*';

	protected $noNeedLogin = '*';
	protected $noNeedRight = '*';

	public function _initialize()
	{
		parent::_initialize();
		\think\Hook::add('ems_invite', function ($params) {
			$obj = \app\common\library\Email::instance();

			return $obj
				->to($params->email)
				->from("phppython@163.com","JestSo")
				->subject("Invite to join the Internet Agent")
				->message($params->content)
				->send();
		});
	}

    /**
     * 会员中心
     */
    public function index()
    {
        $this->success("", ['welcome' => $this->auth->nickname]);
    }

    /**
     * @SWG\POST(
     *   path="/user/login",
     *   tags={"用户登录"},
     *   produces={"application/json"},
     *     @SWG\Parameter(
     *         name="email",
     *         in="formData",
     *         description="邮箱",
     *         required=true,
     *         type="string"
     *     ),
     *     @SWG\Parameter(
     *         name="password",
     *         in="formData",
     *         description="验证码",
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
     *                  property="data",
     *                  type="object",
     *                  @SWG\Property(
     *                      property="userinfo",
     *                      type="object",
     *                      ref="#/definitions/Userinfo"
     *                  ),
     *              ),
     *      ),
     *    )
     * )
     */
    public function login()
    {
        $email =$this->request->request('email');
        $password =$this->request->request('password');

		$userinfo = UserModel::getByEmail($email);
		if (!$userinfo) {
			$this->error("This mailbox is not registered!");
		}

        $ret = $this->auth->login($email, $password);
        if ($ret) {
            $data = ['userinfo' => $this->auth->getUserinfo()];
            $this->success("success", $data);
        } else {
            $this->error($this->auth->getError());
        }
    }


    /**
     * 手机验证码登录
     *
     * @param string $mobile  手机号
     * @param string $captcha 验证码
     */
    public function mobilelogin()
    {
        $mobile = $this->request->request('mobile');
        $captcha = $this->request->request('captcha');
        if (!$mobile || !$captcha) {
            $this->error(__('Invalid parameters'));
        }
        if (!Validate::regex($mobile, "^1\d{10}$")) {
            $this->error(__('Mobile is incorrect'));
        }
        if (!Sms::check($mobile, $captcha, 'mobilelogin')) {
            $this->error(__('Captcha is incorrect'));
        }
        $user = \app\common\model\User::getByMobile($mobile);
        if ($user) {
            //如果已经有账号则直接登录
            $ret = $this->auth->direct($user->id);
        } else {
            $ret = $this->auth->register($mobile, Random::alnum(), '', $mobile, []);
        }
        if ($ret) {
            Sms::flush($mobile, 'mobilelogin');
            $data = ['userinfo' => $this->auth->getUserinfo()];
            $this->success(__('Logged in successful'), $data);
        } else {
            $this->error($this->auth->getError());
        }
    }

    /**
     * @SWG\POST(
     *   path="/user/register",
     *   tags={"用户注册"},
     *   produces={"application/json"},
     *     @SWG\Parameter(
     *         name="email",
     *         in="formData",
     *         description="邮箱",
     *         required=true,
     *         type="string"
     *     ),
     *     @SWG\Parameter(
     *         name="password",
     *         in="formData",
     *         description="验证码",
     *         required=true,
     *         type="string"
     *     ),
	 *     @SWG\Parameter(
	 *         name="uuid",
	 *         in="formData",
	 *         description="机器识别码",
	 *         required=true,
	 *         type="string"
	 *     ),
     *     @SWG\Parameter(
     *         name="mobile",
     *         in="formData",
     *         description="手机号码",
     *         required=false,
     *         type="string"
     *     ),
     *     @SWG\Parameter(
     *         name="inviteCode",
     *         in="formData",
     *         description="邀请码",
     *         required=false,
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
     *                  property="data",
     *                  type="object",
     *                  @SWG\Property(
     *                      property="userinfo",
     *                      type="object",
     *                      ref="#/definitions/Userinfo"
     *                  ),
     *              ),
     *      ),
     *    )
     * )
     */
    public function register()
    {
		$email = $this->request->request('email');
		$uuid = $this->request->request('uuid');
        $password = $this->request->request('password');
        $mobile = $this->request->request('mobile');
		$inviteCode =$this->request->request('inviteCode');#邀请码

        if ($email && !Validate::is($email, "email")) {
            $this->error(__('Email is incorrect'));
        }

        if ($mobile && !Validate::regex($mobile, "^1\d{10}$")) {
            $this->error(__('Mobile is incorrect'));
        }

		$userinfo = UserModel::getByEmail($email);
		if ($userinfo) {
			$this->error("Mailbox has been registered");
		}

		$ret = Ems::check($email, $password);
		if (!$ret) {
			$this->error("Verification code incorrect");
		}

        $ret = $this->auth->register($email, '', $email, $mobile, ['uuid' => $uuid, 'invite_code_by' => $inviteCode, 'invite_code' => substr(md5(time().$email), 0, 6)]);
        if ($ret) {
        	#邀请成功修改邀请者状态
			Db::name("ems_invite")->where(['email' => $email, 'code' => $inviteCode])->update(['state' => 2]);

            $data = ['userinfo' => $this->auth->getUserinfo()];
            $this->success("success", $data);
        } else {
            $this->error($this->auth->getError());
        }
    }

	/**
	 * @SWG\POST(
	 *   path="/user/logout",
	 *   tags={"注销登录"},
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
	 *          @SWG\Property(property="data", type="string", description=""),
	 *      ),
	 *    )
	 * )
	 */
    public function logout()
    {
        $this->auth->logout();
        $this->success("success");
    }

    /**
     * 修改会员个人信息
     *
     * @param string $avatar   头像地址
     * @param string $username 用户名
     * @param string $nickname 昵称
     * @param string $bio      个人简介
     */
    public function profile()
    {
        $user = $this->auth->getUser();
        $username = $this->request->request('username');
        $nickname = $this->request->request('nickname');
        $bio = $this->request->request('bio');
        $avatar = $this->request->request('avatar', '', 'trim,strip_tags,htmlspecialchars');
        if ($username) {
            $exists = \app\common\model\User::where('username', $username)->where('id', '<>', $this->auth->id)->find();
            if ($exists) {
                $this->error(__('Username already exists'));
            }
            $user->username = $username;
        }
        $user->nickname = $nickname;
        $user->bio = $bio;
        $user->avatar = $avatar;
        $user->save();
        $this->success();
    }

    /**
     * 第三方登录
     *
     * @param string $platform 平台名称
     * @param string $code     Code码
     */
    public function third()
    {
        $url = url('user/index');
        $platform = $this->request->request("platform");
        $code = $this->request->request("code");
        $config = get_addon_config('third');
        if (!$config || !isset($config[$platform])) {
            $this->error(__('Invalid parameters'));
        }
        $app = new \addons\third\library\Application($config);
        //通过code换access_token和绑定会员
        $result = $app->{$platform}->getUserInfo(['code' => $code]);
        if ($result) {
            $loginret = \addons\third\library\Service::connect($platform, $result);
            if ($loginret) {
                $data = [
                    'userinfo'  => $this->auth->getUserinfo(),
                    'thirdinfo' => $result
                ];
                $this->success(__('Logged in successful'), $data);
            }
        }
        $this->error(__('Operation failed'), $url);
    }


	/**
	 * @SWG\POST(
	 *   path="/user/inviteEmail",
	 *   tags={"发送邀请"},
	 *   produces={"application/json"},
	 *     @SWG\Parameter(
	 *         name="token",
	 *         in="header",
	 *         description="登录后返回的token",
	 *         required=true,
	 *         type="string"
	 *     ),
	 *     @SWG\Parameter(
	 *         name="email",
	 *         in="formData",
	 *         description="邮箱",
	 *         required=true,
	 *         type="string"
	 *     ),
	 *     @SWG\Parameter(
	 *         name="content",
	 *         in="formData",
	 *         description="邀请内容",
	 *         required=false,
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
	 *                  property="data",
	 *                  type="object",
	 *                  @SWG\Property(
	 *                      property="userinfo",
	 *                      type="object",
	 *                      ref="#/definitions/Userinfo"
	 *                  ),
	 *              ),
	 *      ),
	 *    )
	 * )
	 */
    public function inviteEmail(){
		$user = $this->userInfo();

		$email = $this->request->request("email");
		$content = $this->request->request("content");

		if ($email && !Validate::is($email, "email")) {
			$this->error("Email is incorrect");
			exit;
		}

		$code = $user['invite_code'];
		$content .= "<br><br>My invite code is: {$code}";

		$data = ['user_id' => $user['user_id'], 'email' => $email, 'content' => $content, 'create_time' => time(), 'state' => '1', 'code' => $code];
		$res = EmsInvite::create($data);

		$result = Hook::listen('ems_invite', $res, null, true);
		if ($result) {
			$this->success("success");
		} else {
			$this->error("fail in send!");
		}
	}

	/**
	 * @SWG\POST(
	 *   path="/user/inviteList",
	 *   tags={"邀请列表"},
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
	 *                  property="data",
	 *                  type="object",
	 *                  @SWG\Property(
	 *                      property="userinfo",
	 *                      type="object",
	 *                      ref="#/definitions/Userinfo"
	 *                  ),
	 *              ),
	 *      ),
	 *    )
	 * )
	 */
	public function inviteList(){
		$user = $this->userInfo();
		$data = Db::name("ems_invite")->where(['user_id' => $user['user_id']])->order("create_time desc")->select();
		$this->success("", $data);
	}

}

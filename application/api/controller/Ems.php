<?php

namespace app\api\controller;

use app\common\controller\Api;
use app\common\library\Ems as Emslib;
use app\common\model\User;
use think\Validate;

/**
 * 邮箱验证码接口***
 */
class Ems extends Api
{
    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';

    public function _initialize()
    {
        parent::_initialize();
        \think\Hook::add('ems_send', function ($params) {
            $obj = \app\common\library\Email::instance();
            $result = $obj
                ->to($params->email)
                ->from("phppython@163.com","JestSo")
                ->subject('Verification Code')
                ->message("Your verification code is: " . $params->code)
                ->send();
            return $result;
        });
    }

    /**
     * @SWG\Post(
     *   path="/ems/send",
     *   tags={"发送邮箱验证码"},
     *   produces={"application/json"},
     *      @SWG\Parameter(
     *         name="email",
     *         in="formData",
     *         description="email",
     *         required=true,
     *         type="string"
     *     ),@SWG\Parameter(
     *         name="event",
     *         in="formData",
     *         description="事件:默认default",
     *         required=false,
     *         type="string"
     *     ),
     *   @SWG\Response(
     *     response="default",
     *     description="返回成功或者失败",
     *     @SWG\Schema(
     *     		 type="object",
     *          @SWG\Property(property="time", type="string", description="时间"),
     *          @SWG\Property(property="msg", type="string", description="信息"),
     *          @SWG\Property(property="code", type="string", description="信息码"),
     *
     *      ),
     *    )
     * )
     */
    public function send()
    {
        $email = $this->request->request("email");
        $event = $this->request->request("event");
        $event = $event ? $event : 'default';

        /*$last = Emslib::get($email, $event);
        if ($last && time() - $last['createtime'] < 60) {
            $this->error("Sent successfully");
        }*/

		if ($email && !Validate::is($email, "email")) {
			$this->error("Email is incorrect");
			exit;
		}

        $ret = Emslib::send($email, null, $event);
        if ($ret) {
            $this->success("success");
        } else {
            $this->error("");
        }
    }


    /**
     * @SWG\POST(
     *   path="/ems/check",
     *   tags={"邮箱验证码验证"},
     *   produces={"application/json"},
     *      @SWG\Parameter(
     *         name="email",
     *         in="formData",
     *         description="email",
     *         required=true,
     *         type="string"
     *     ),@SWG\Parameter(
     *         name="event",
     *         in="formData",
     *         description="事件:默认default",
     *         type="string",
     *        required=false
     *     ),@SWG\Parameter(
     *         name="captcha",
     *         in="formData",
     *         description="验证码",
     *         required=true,
     *         type="string"
     *     ),
     *   @SWG\Response(
     *     response="default",
     *     description="返回成功或者失败",
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
    public function check()
    {
        $email = $this->request->request("email");
        $event = $this->request->request("event");
        #$event = $event ? $event : 'register';
        $captcha = $this->request->request("captcha");

		/*$userinfo = User::getByEmail($email);
		if ($event == 'register' && $userinfo) {
			//已被注册
			$this->error(__('已被注册'));
		} elseif (in_array($event, ['changeemail']) && $userinfo) {
			//被占用
			$this->error(__('已被占用'));
		} elseif (in_array($event, ['changepwd', 'resetpwd']) && !$userinfo) {
			//未注册
			$this->error(__('未注册'));
		}*/

        $ret = Emslib::check($email, $captcha, $event);
        if ($ret) {
            $this->success("success");
        } else {
            $this->error("verification code incorrect");
        }
    }
}

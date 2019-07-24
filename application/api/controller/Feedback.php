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


/**
 * 用户反馈 接口
 */
class Feedback extends Api {
    //如果$noNeedLogin为空表示所有接口都需要登录才能请求
    //如果$noNeedRight为空表示所有接口都需要验证权限才能请求
    //如果接口已经设置无需登录,那也就无需鉴权了
    //
    // 无需登录的接口,*表示全部
    protected $noNeedLogin = [];
    // 无需鉴权的接口,*表示全部
    protected $noNeedRight = ['*'];

    //反馈信息列表
    /**
     * @SWG\POST(
     *   path="/feedback/index",
     *   tags={"用户反馈接口"},
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
     *     description="反馈信息列表",
     *     @SWG\schema(
     *     		 type="object",
     *          @SWG\Property(property="time", type="string", description="时间"),
     *          @SWG\Property(property="msg", type="string", description="信息"),
     *          @SWG\Property(property="code", type="string", description="信息码"),
     *          @SWG\Property(
     *               property="data",
     *               ref="#/definitions/Feedback"
     *          ),
     *      ),
     *    )
     * )
     */
    public function index() {
        // context 反馈内容
        // create_time 反馈时间
        // status  状态 0 待回答 1 已回答 2 追加反馈 3 追加回答
        // sign 序号
        // type 1 问题 2 回答 3 追加问题 4 追加回答
		$user = $this->userInfo();
        $feedback = Db::name("feedback")->where(array("user_id" => $user['user_id']))->order("create_time desc")->select();
        $this->success("", $feedback);
    }

    /**
     * @SWG\POST(
     *   path="/feedback/add",
     *   tags={"提交反馈"},
     *   produces={"application/json"},
     *     @SWG\Parameter(
     *         name="token",
     *         in="header",
     *         description="登录后返回的token",
     *         required=true,
     *         type="string"
     *     ),
	 *     @SWG\Parameter(
	 *         name="title",
	 *         in="formData",
	 *         description="标题",
	 *         required=true,
	 *         type="string"
	 *     ),
     *     @SWG\Parameter(
     *         name="context",
     *         in="formData",
     *         description="反馈内容",
     *         required=false,
     *         type="string"
     *     ),
     *   @SWG\Response(
     *     response="default",
     *     description="请求成功返回信息",
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
    //提交反馈信息
    public function add() {
		$user = $this->userInfo();

        $insert['user_id'] = $user['user_id'];
        $insert['title'] = $this->request->request('title');
        $insert['answer'] = '';
        $insert['context'] = $this->request->request('context');
        $insert['create_time'] = time();
		$insert['state'] = 0;

        //betterproxy@3
        Db::name("feedback")->insert($insert);
        $id = Db::name("feedback")->getLastInsID();
        Db::name("feedback")->where(array("id"=>$id))->update(array("weigh"=>$id));

        $this->success("success", $insert);
    }
}
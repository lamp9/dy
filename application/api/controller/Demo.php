<?php

namespace app\api\controller;

use app\common\controller\Api;
use PHPMailer;

/**
 * 示例接口
 */
class Demo extends Api
{

    //如果$noNeedLogin为空表示所有接口都需要登录才能请求
    //如果$noNeedRight为空表示所有接口都需要验证权限才能请求
    //如果接口已经设置无需登录,那也就无需鉴权了
    //
    // 无需登录的接口,*表示全部
    protected $noNeedLogin = ['test', 'test1','gmail'];
    // 无需鉴权的接口,*表示全部
    protected $noNeedRight = ['test2'];

    /**
     * 测试方法
     *
     * @ApiTitle    (测试名称)
     * @ApiSummary  (测试描述信息)
     * @ApiMethod   (POST)
     * @ApiRoute    (/api/demo/test/id/{id}/name/{name})
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="id", type="integer", required=true, description="会员ID")
     * @ApiParams   (name="name", type="string", required=true, description="用户名")
     * @ApiParams   (name="data", type="object", sample="{'user_id':'int','user_name':'string','profile':{'email':'string','age':'integer'}}", description="扩展数据")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="data", type="object", sample="{'user_id':'int','user_name':'string','profile':{'email':'string','age':'integer'}}", description="扩展数据返回")
     * @ApiReturn   ({
         'code':'1',
         'msg':'返回成功'
        })
     */

/**
 * @SWG\Get(
 *   path="/demo/test",
 *   tags={"test"},
 *   summary="Create a test",
 *   operationId="test",
 *   @SWG\Response(response="default", description="操作成功")
 * )
 */

    public function test()
    {
        $this->success('返回成功', $this->request->param());
    }

    /**
     * 无需登录的接口
     *
     */
    public function test1()
    {
        $this->success('返回成功', ['action' => 'test1']);
    }


    public function test2()
    {
        $this->success('返回成功', ['action' => 'test2']);
    }

    /**
     * 需要登录且需要验证有相应组的权限
     *
     */
    public function test3()
    {
        $this->success('返回成功', ['action' => 'test3']);
    }

    // 谷歌邮箱
    public function gmail(){

        $mail = new PHPMailer();


        $body = "自定义您的收件箱

如果您想让某封邮件位于其他类别中，则可以将该邮件移至您所需的类别中。在移动设备上，您甚至可以选择允许哪些类别创建通知。更多自定义提示

要了解Gmail收件箱的详情，请查看帮助中心或观看此视频";

        $mail->IsSMTP(); // telling the class to use SMTP

        $mail->Host = "mail.gmail.com"; // SMTP server

        $mail->SMTPDebug = 2; // enables SMTP debug information (for testing)

        $mail->SMTPAuth = true; // enable SMTP authentication

        $mail->SMTPSecure = "ssl"; // sets the prefix to the servier

        $mail->Host = "smtp.gmail.com"; // sets GMAIL as the SMTP server

        $mail->Port = 465; // set the SMTP port for the GMAIL server

        $mail->Username = "w916826526@gmail.com"; // GMAIL username

        $mail->Password = "Wen8637633"; // GMAIL password

        $mail->setFrom('wangdana', 'First Last');

        $mail->AddReplyTo("w916826526@gmail.com","First Last");

        $mail->Subject = "PHPMailer Test Subject via smtp (Gmail), basic";

        $mail->AltBody = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test

        $mail->MsgHTML($body);

        $mail->CharSet = "utf-8"; // 这里指定字符集！

        $address = "916826526@qq.com";

        $mail->AddAddress($address, "温猪猪");


        if(!$mail->Send()) {
            echo "Mailer Error: " . $mail->ErrorInfo;
        } else {
            echo "Message sent!";
        }

    }
}

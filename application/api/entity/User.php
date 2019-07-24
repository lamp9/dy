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

/**
 * @SWG\Definition()
 */
class User{
    /**
     * 用户名
     * @var string
     * @SWG\Property(format="string")
     */
    private $username;
    /**
     * 用户名
     * @var string
     * @SWG\Property(format="string")
     */
    private $password;
    /**
     * 用户名
     * @var string
     * @SWG\Property(format="string")
     */
    private $email;
    /**
     * 用户名
     * @var string
     * @SWG\Property(format="string")
     */
    private $mobile;
}
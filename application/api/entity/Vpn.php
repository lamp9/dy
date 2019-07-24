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
class Vpn{
    /**
     * vpn id
     * @var integer
     * @SWG\Property(format="int64")
     */
    private $id;
    /**
     * ip地址
     * @var string
     * @SWG\Property(format="string")
     */
    private  $ip;
    /**
     * 端口
     * @var integer
     * @SWG\Property(format="int64")
     */
    private  $port;
    /**
     * 密码
     * @var string
     * @SWG\Property(format="string")
     */
    private  $password;
    /**
     * 加密方法
     * @var string
     * @SWG\Property(format="string")
     */
    private  $method;
    /**
     * 实例名称
     * @var string
     * @SWG\Property(format="string")
     */
    private  $name;

    /**
     * @return mixed
     */
    public function getIp() {
        return $this->ip;
    }

    /**
     * @param mixed $ip
     */
    public function setIp($ip) {
        $this->ip = $ip;
    }

    /**
     * @return mixed
     */
    public function getPort() {
        return $this->port;
    }

    /**
     * @param mixed $port
     */
    public function setPort($port) {
        $this->port = $port;
    }

    /**
     * @return mixed
     */
    public function getPassword() {
        return $this->password;
    }

    /**
     * @param mixed $password
     */
    public function setPassword($password) {
        $this->password = $password;
    }

    /**
     * @return mixed
     */
    public function getMethod() {
        return $this->method;
    }

    /**
     * @param mixed $method
     */
    public function setMethod($method) {
        $this->method = $method;
    }

    /**
     * @return mixed
     */
    public function getName() {
        return $this->name;
    }

    /**
     * @param mixed $name
     */
    public function setName($name) {
        $this->name = $name;
    }

}

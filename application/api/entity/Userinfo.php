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
class Userinfo{
    /**
     * The unique identifier of a product in our catalog.
     *
     * @var integer
     * @SWG\Property(format="int64")
     */
    private $id;
    /**
     * The unique identifier of a product in our catalog.
     *
     * @var string
     * @SWG\Property(format="string")
     */
    private $username;
    /**
     * The unique identifier of a product in our catalog.
     *
     * @var string
     * @SWG\Property(format="string")
     */
    private $nickname;
    /**
     * The unique identifier of a product in our catalog.
     *
     * @var string
     * @SWG\Property(format="string")
     */
    private $mobile;
    /**
     * The unique identifier of a product in our catalog.
     *
     * @var string
     * @SWG\Property(format="string")
     */
    private $avatar;
    /**
     * The unique identifier of a product in our catalog.
     *
     * @var integer
     * @SWG\Property(format="int64")
     */
    private $score;
    /**
     * The unique identifier of a product in our catalog.
     *
     * @var string
     * @SWG\Property(format="string")
     */
    private $token;
    /**
     * The unique identifier of a product in our catalog.
     *
     * @var integer
     * @SWG\Property(format="int64")
     */
    private $user_id;
    /**
     * The unique identifier of a product in our catalog.
     *
     * @var string
     * @SWG\Property(format="string")
     */
    private $createtime;
    /**
     * The unique identifier of a product in our catalog.
     *
     * @var string
     * @SWG\Property(format="string")
     */
    private $expiretime;
    /**
     * The unique identifier of a product in our catalog.
     *
     * @var string
     * @SWG\Property(format="string")
     */
    private $expires_in;

    /**
     * @return mixed
     */
    public function getId() {
        return $this->id;
    }

    /**
     * @param mixed $id
     */
    public function setId($id) {
        $this->id = $id;
    }

    /**
     * @return mixed
     */
    public function getUsername() {
        return $this->username;
    }

    /**
     * @param mixed $username
     */
    public function setUsername($username) {
        $this->username = $username;
    }

    /**
     * @return mixed
     */
    public function getNickname() {
        return $this->nickname;
    }

    /**
     * @param mixed $nickname
     */
    public function setNickname($nickname) {
        $this->nickname = $nickname;
    }

    /**
     * @return mixed
     */
    public function getMobile() {
        return $this->mobile;
    }

    /**
     * @param mixed $mobile
     */
    public function setMobile($mobile) {
        $this->mobile = $mobile;
    }

    /**
     * @return mixed
     */
    public function getAvatar() {
        return $this->avatar;
    }

    /**
     * @param mixed $avatar
     */
    public function setAvatar($avatar) {
        $this->avatar = $avatar;
    }

    /**
     * @return mixed
     */
    public function getScore() {
        return $this->score;
    }

    /**
     * @param mixed $score
     */
    public function setScore($score) {
        $this->score = $score;
    }

    /**
     * @return mixed
     */
    public function getToken() {
        return $this->token;
    }

    /**
     * @param mixed $token
     */
    public function setToken($token) {
        $this->token = $token;
    }

    /**
     * @return mixed
     */
    public function getUserId() {
        return $this->user_id;
    }

    /**
     * @param mixed $user_id
     */
    public function setUserId($user_id) {
        $this->user_id = $user_id;
    }

    /**
     * @return mixed
     */
    public function getCreatetime() {
        return $this->createtime;
    }

    /**
     * @param mixed $createtime
     */
    public function setCreatetime($createtime) {
        $this->createtime = $createtime;
    }

    /**
     * @return mixed
     */
    public function getExpiretime() {
        return $this->expiretime;
    }

    /**
     * @param mixed $expiretime
     */
    public function setExpiretime($expiretime) {
        $this->expiretime = $expiretime;
    }

    /**
     * @return mixed
     */
    public function getExpiresIn() {
        return $this->expires_in;
    }

    /**
     * @param mixed $expires_in
     */
    public function setExpiresIn($expires_in) {
        $this->expires_in = $expires_in;
    }

}




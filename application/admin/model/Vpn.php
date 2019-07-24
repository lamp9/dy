<?php

namespace app\admin\model;

use think\Model;
use traits\model\SoftDelete;

class Vpn extends Model
{

    use SoftDelete;

    //数据库
    protected $connection = 'database';
    // 表名
    protected $name = 'member_vpn';

    public function getStateList()
    {
        return ['1' => __('state 1'), '2' => __('state 2')];
    }

    public function getStatusList()
    {
        return ['normal' => __('Normal'), 'hidden' => __('Hidden')];
    }





}

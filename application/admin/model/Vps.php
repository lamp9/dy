<?php

namespace app\admin\model;

use think\Model;
use traits\model\SoftDelete;

class Vps extends Model
{

    use SoftDelete;

    //数据库
    protected $connection = 'database';
    // 表名
    protected $name = 'vps';

    public function getStateList()
    {
        return ['0' => __('state 0'), '1' => __('state 1'), '2' => __('state 2')];
    }

    public function getStatusList()
    {
        return ['normal' => __('Normal'), 'hidden' => __('Hidden')];
    }





}

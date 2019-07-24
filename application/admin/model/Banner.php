<?php

namespace app\admin\model;

use think\Model;
use traits\model\SoftDelete;

class Banner extends Model
{

    use SoftDelete;

    //数据库
    protected $connection = 'database';
    // 表名
    protected $name = 'banner';

    public function getStateList()
    {
        return ['0' => __('state 0'), '1' => __('state 1')];
    }
    public function getTypeList()
    {
        return ['1' => __('type 1'), '2' => __('type 2'), '3' => __('type 3')];
    }

    public function getStatusList()
    {
        return ['normal' => __('Normal'), 'hidden' => __('Hidden')];
    }





}

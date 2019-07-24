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
class Feedback{
    /**
     * The unique identifier of a product in our catalog.
     *
     * @var integer
     * @SWG\Property(format="integer")
     */
    private  $id;
    /**
     * The unique identifier of a product in our catalog.
     *
     * @var string
     * @SWG\Property(format="string")
     */
    private  $context;
    /**
     * The unique identifier of a product in our catalog.
     *
     * @var string
     * @SWG\Property(format="string")
     */
    private  $time;
    /**
     * The unique identifier of a product in our catalog.
     *
     * @var integer
     * @SWG\Property(format="integer")
     */
    private  $status;
    /**
     * The unique identifier of a product in our catalog.
     *
     * @var integer
     * @SWG\Property(format="integer")
     */
    private  $sign;
    /**
     * The unique identifier of a product in our catalog.
     *
     * @var integer
     * @SWG\Property(format="integer")
     */
    private  $type;
}
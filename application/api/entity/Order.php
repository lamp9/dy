<?php


/**
 * @SWG\Definition()
 */
class Order{
    /**
    * 用户id
    * @var integer
    * @SWG\Property(format="int64")
    */
    private $member_id;
    /**
     * 产品id
     * @var integer
     * @SWG\Property(format="int64")
     */
    private $product_id;
}
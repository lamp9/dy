<?php

function order_sn($uid) {
    return date("Ymd").time().$uid . str_pad(mt_rand($uid, 99999), 5, '0', STR_PAD_LEFT);
}

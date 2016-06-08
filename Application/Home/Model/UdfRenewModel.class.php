<?php
/*---------------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/xiaowei
 -------------------------------------------------------------------------*/

// 用户模型
namespace Home\Model;
use Think\Model;

class  UdfRenewModel extends CommonModel {

	function get_sumary($start_date, $end_date) {
		$where['renew_date'] = array( array('egt', $start_date), array('elt', $end_date));
		$list = $this -> where($where) -> field('shop_no,sum(amount) sum') -> group('shop_no') -> select();
		foreach ($list as $key => $val) {
			$new[$val['shop_no']] = $val['sum'];
		}
		return $new;
	}

	function get_target($start_date, $end_date) {
		$start_date = substr($start_date,0,7);
		$end_date = substr($end_date,0,7);
		$where['month'] = array('between', "$start_date,$end_date");
		$list = M('UdfTarget') -> where($where) -> field('shop_no,sum(renew_target) sum') -> group('shop_no') -> select();
		foreach ($list as $key => $val) {
			$new[$val['shop_no']] = $val['sum'];
		}
		return $new;
	}

}
?>
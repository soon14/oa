<?php
/*--------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/xiaowei
 --------------------------------------------------------------*/

namespace Home\Controller;

class SignRecordController extends HomeController {
	protected $config = array('app_type' => 'personal');

	function index($start_time = "", $end_time = "", $name = "", $dept = "") {
		$plugin['date'] = true;
		$this -> assign("plugin", $plugin);
		if ($start_time == "" && $end_time == "") {
			$start_time = date('Y-m') . "-01";
			$end_time = date('Y-m-d');
		}
		$where = " ";
		if ($name !== "" && $dept !== "") {
			$where .= "WHERE t1.name='$name' and t3.name='$dept'";
		} else {
			if ($name !== "") {
				$where .= "WHERE t1.name='$name'";
			}
			if ($dept !== "") {
				$where .= "WHERE t3.name='$dept'";
			}
		}

		$list = D('SignRecordView') -> get_list($where);
		$second1 = strtotime($start_time);
		$second2 = strtotime($end_time);
		if ($second1 < $second2) {
			$tmp = $second2;
			$second2 = $second1;
			$second1 = $tmp;
		}

		$day_diff = ($second1 - $second2) / 86400;

		$start_date = strtotime($start_time);
		$start_year = date('Y', $start_date);
		$start_month = date('m', $start_date);
		$start_day = date('d', $start_date);

		for ($i = 0; $i <= $day_diff; $i++) {
			$date[] = substr(date("Y-m-d H:i:s", mktime(0, 0, 0, $start_month, $start_day + $i, $start_year)), 0, 10);
		}
		for ($i = 0; $i <= $day_diff; $i++) {
			$date2[] = substr(date("Y-m-d H:i:s", mktime(0, 0, 0, $start_month, $start_day + $i, $start_year)), 0, 7);
		}

		$this -> assign('date2', array_count_values($date2));
		foreach ($date as $v) {
			$day = explode('-', $v);
			$date_title[] = $day[2];
		}
		$count = 0;
		foreach ($list as $key => $val) {
			if ($user_id !== $val['user_id']) {
				$user_id = $val['user_id'];
				$count++;
			}
			$new[$count]['name'] = $val['user_name'];
			foreach ($date as $k => $v) {
				if ($val['date'] == $v) {
					$new[$count][$v] = $val['count'];
				}
			}

		}
		foreach ($new as $key => &$val) {
			foreach ($date as $k => $v) {
				if (empty($val[$v])) {
					$val[$v] = '0';
				}
			}
		}

		$this -> assign('list', $new);
		$this -> assign('date_title', $date_title);
		$data['start_time'] = $start_time;
		$data['end_time'] = $end_time;
		$data['name'] = $name;
		$data['dept'] = $dept;

		$this -> assign('data', $data);
		$this -> display();
	}

	function excel($start_time = "", $end_time = "", $name = "", $dept = "") {
		header("Content-Type: application/vnd.ms-execl");
		header("Content-Type: application/vnd.ms-excel; charset=utf-8");
		header("Content-Disposition: attachment; filename=yyy.xls");
		header("Pragma: no-cache");
		header("Expires: 0");
		$plugin['date'] = true;
		$this -> assign("plugin", $plugin);
		if ($start_time == "" && $end_time == "") {
			$start_time = date('Y-m') . "-01";
			$end_time = date('Y-m-d');
		}
		$where = " ";
		if ($name !== "" && $dept !== "") {
			$where .= "WHERE t1.name='$name' and t3.name='$dept'";
		} else {
			if ($name !== "") {
				$where .= "WHERE t1.name='$name'";
			}
			if ($dept !== "") {
				$where .= "WHERE t3.name='$dept'";
			}
		}

		$list = D('SignRecordView') -> get_list($where);
		$second1 = strtotime($start_time);
		$second2 = strtotime($end_time);
		if ($second1 < $second2) {
			$tmp = $second2;
			$second2 = $second1;
			$second1 = $tmp;
		}

		$day_diff = ($second1 - $second2) / 86400;

		$start_date = strtotime($start_time);
		$start_year = date('Y', $start_date);
		$start_month = date('m', $start_date);
		$start_day = date('d', $start_date);

		for ($i = 0; $i <= $day_diff; $i++) {
			$date[] = substr(date("Y-m-d H:i:s", mktime(0, 0, 0, $start_month, $start_day + $i, $start_year)), 0, 10);
		}
		for ($i = 0; $i <= $day_diff; $i++) {
			$date2[] = substr(date("Y-m-d H:i:s", mktime(0, 0, 0, $start_month, $start_day + $i, $start_year)), 0, 7);
		}

		$this -> assign('date2', array_count_values($date2));
		foreach ($date as $v) {
			$day = explode('-', $v);
			$date_title[] = $day[2];
		}
		$count = 0;
		foreach ($list as $key => $val) {
			if ($user_id !== $val['user_id']) {
				$user_id = $val['user_id'];
				$count++;
			}
			$new[$count]['name'] = $val['user_name'];
			foreach ($date as $k => $v) {
				if ($val['date'] == $v) {
					$new[$count][$v] = $val['count'];
				}
			}

		}
		foreach ($new as $key => &$val) {
			foreach ($date as $k => $v) {
				if (empty($val[$v])) {
					$val[$v] = '0';
				}
			}
		}

		$this -> assign('list', $new);
		$this -> assign('date_title', $date_title);
		$data['start_time'] = $start_time;
		$data['end_time'] = $end_time;
		$data['name'] = $name;
		$data['dept'] = $dept;

		$this -> assign('data', $data);
		$this -> display('excel', 'udf-8', 'xls');
	}

	// function get_day($date) {
	// $datearr = explode('-', $date);
	// if ($datearr[1] == '1' || $datearr[1] == '3' || $datearr[1] == '5' || $datearr[1] == '7' || $datearr[1] == '8' || $datearr[1] == '10' || $datearr[1] == '12') {
	// return 31;
	// } elseif ($datearr[1] == '4' || $datearr[1] == '5' || $datearr[1] == '7' || $datearr[1] == '9' || $datearr[1] == '11') {
	// return 30;
	// } elseif ($datearr[1] == '2') {
	// if ($datearr[0] % 4 == 0 && ($datearr[0] % 100 != 0 || $datearr[0] % 400 == 0)) {
	// return 29;
	// } else {
	// return 28;
	// }
	// }
	//
	// }

}
?>
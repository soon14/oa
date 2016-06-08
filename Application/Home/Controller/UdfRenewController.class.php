<?php
/*---------------------------------------------------------------------------
 *
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/xiaowei
 --------------------------------------------------------------*/

namespace Home\Controller;

class UdfRenewController extends HomeController {
	protected $config = array('app_type' => 'common', 'admin' => 'data');
	protected $first_row = 2;
	protected $field_count = 35;
	protected $head = array();

	function _search_filter(&$map) {
		if ($this -> config['auth']['admin'] == false) {
			$map['emp_no'] = array('eq', get_emp_no());
		}
		if (!empty($_POST['keyword'])) {
			$map['A|B|C|D|E|F|G'] = array('like', "%" . $_POST['keyword'] . "%");
		}
	}

	function init_head_info() {
		$this -> add_head(1, '日期', 1, 1);
		$this -> add_head(1, '门店编号', 1, 1);
		$this -> add_head(1, '门店名称', 1, 1);
		$this -> add_head(1, '续货金额', 1, 1);
	}

	function add_head($i, $name, $colspan, $rowspan) {
		$item = new \stdClass();
		$item -> name = $name;
		$item -> colspan = $colspan;
		$item -> rowspan = $rowspan;
		$this -> head[$i][] = $item;
	}

	public function index() {
		$plugin['date'] = true;
		$this -> assign('plugin', $plugin);

		$node_model = M("UdfShop");
		$node_list = $node_model -> order('sort asc') -> select();
		$auth = $this -> config['auth'];

		if ($auth['admin']) {
			$node_list = tree_to_list(list_to_tree($node_list));
		} else {
			$where_shop['duty'] = get_emp_no();
			$shop_id = M("UdfShop") -> where($where_shop) -> getField('id');
			if (!empty($shop_id)) {
				$node_list = list_to_tree($node_list, $shop_id);
				$node = $node_model -> find($shop_id);
				$tree[0] = $node;
				$tree[0]['_child'] = $node_list;
				$node_list = tree_to_list($tree);
			} else {
				$this -> error('没有权限');
			}
		}

		$start_date = I('be_start_date');
		$end_date = I('en_end_date');

		if (empty($start_date)) {
			$start_date = date("Y-m-d", mktime(0, 0, 0, date("m"), 1, date("Y")));
		}

		if (empty($end_date)) {
			$end_date = date("Y-m-d", mktime(0, 0, 0, date("m"), date("d"), date("Y")));
		}

		$target_list = D('UdfRenew') -> get_target($start_date, $end_date);

		$present_list = D('UdfRenew') -> get_sumary($start_date, $end_date);

		$last_month_start_date = get_offset_date($start_date, -1, 'm');
		$last_month_end_date = get_offset_date($end_date, -1, 'm');

		$last_month_list = D('UdfRenew') -> get_sumary($last_month_start_date, $last_month_end_date);

		$last_year_start_date = get_offset_date($start_date, -1, "y");
		$last_year_end_date = get_offset_date($end_date, -1, "y");

		$last_year_list = D('UdfRenew') -> get_sumary($last_year_start_date, $last_year_end_date);

		$today_list = D('UdfRenew') -> get_sumary($end_date, $end_date);

		$yesterday = get_offset_date($end_date, -1);
		$yesterday_list = D('UdfRenew') -> get_sumary($yesterday, $yesterday);

		$last_year_day_list = D('UdfRenew') -> get_sumary($last_year_end_date, $last_year_end_date);

		foreach ($node_list as $key => $val) {
			$shop_no = rotate(tree_to_list(list_to_tree($node_list, $val['id'])));
			if (!empty($shop_no)) {
				$shop_no = $val['shop_no'] . "," . implode(',', $shop_no['shop_no']);
			} else {
				$shop_no = $val['shop_no'];
			}

			$t = date('t');
			$d = date('d') - 1;
			$target_rate = $d / $t;

			$target = $this -> _get_filter_data($target_list, $shop_no);
			$present_month = $this -> _get_filter_data($present_list, $shop_no);
			$last_month = $this -> _get_filter_data($last_month_list, $shop_no);
			$last_year = $this -> _get_filter_data($last_year_list, $shop_no);

			$today = $this -> _get_filter_data($today_list, $shop_no);
			$yesterday = $this -> _get_filter_data($yesterday_list, $shop_no);
			$last_year_day = $this -> _get_filter_data($last_year_day_list, $shop_no);

			$node_list[$key]['A1'] = round($present_month / $target, 4) * 100;
			$node_list[$key]['A2'] = $target_rate - $present_month / $target;
			$node_list[$key]['B'] = $present_month;
			$node_list[$key]['C'] = round(($present_month - $last_month) / $last_month, 4) * 100;
			$node_list[$key]['D'] = round(($present_month - $last_year) / $last_year, 4) * 100;
			$node_list[$key]['E'] = $today;
			$node_list[$key]['F'] = round(($today - $yesterday) / $yesterday, 4) * 100;
			$node_list[$key]['G'] = round(($today - $last_year_day) / $last_year_day, 4) * 100;
		}

		$this -> assign('node_list', $node_list);

		$target_sum = array_sum($target_list);

		$present_sum = array_sum($present_list);

		$last_month_sum = array_sum($last_month_list);

		$last_year_list_sum = array_sum($last_year_list);

		$today_sum = array_sum($today_list);

		$yesterday_sum = array_sum($yesterday_list);

		$last_year_day_sum = array_sum($last_year_day_list);

		$sum['A1'] = round($present_sum / $target_sum, 4) * 100;
		$sum['A2'] = $target_rate - $present_sum / $target_sum;
		$sum['B'] = $present_sum;
		$sum['C'] = round(($present_sum - $last_month_sum) / $last_month_sum, 4) * 100;
		$sum['D'] = round(($present_sum - $last_year_list_sum) / $last_year_list_sum, 4) * 100;
		$sum['E'] = $today_sum;
		$sum['F'] = round(($today_sum - $yesterday_sum) / $yesterday_sum, 4) * 100;
		$sum['G'] = round(($today_sum - $last_year_day_sum) / $last_year_day_sum, 4) * 100;

		$this -> assign('sum', $sum);

		$this -> display();
	}

	public function data() {
		$plugin['date'] = true;
		$this -> assign('plugin', $plugin);

		$auth = $this -> config['auth'];
		$this -> assign('auth', $auth);

		$this -> init_head_info();

		$head_html = '';
		foreach ($this->head as $key => $val) {
			if ($key == 1) {
				if ($auth['admin']) {
					$head_html .= '<tr><td rowspan="2"><label class="inline pull-left">
				<input type="checkbox" name="id-toggle-all" id="id-toggle-all" />
				<span class="lbl"></span></label></td>';
				} else {
					$head_html .= '<tr>';
				}
			} else {
				$head_html .= '<tr>';
			}
			foreach ($val as $sub_key => $sub_val) {
				$head_html .= "<th class=\"text-center\" colspan=\"{$sub_val->colspan}\"} rowspan=\"{$sub_val->rowspan}\">{$sub_val->name}</th>";
			}
			$head_html .= '</tr>';
		}
		//echo $head_html;
		$this -> assign('head_html', $head_html);
		$this -> _index();
	}

	public function del($id) {
		$this -> _destory($id);
	}

	public function import() {
		$opmode = $_POST["opmode"];
		if ($opmode == "import") {
			$File = D('File');
			$file_driver = C('DOWNLOAD_UPLOAD_DRIVER');
			$info = $File -> upload($_FILES, C('DOWNLOAD_UPLOAD'), C('DOWNLOAD_UPLOAD_DRIVER'), C("UPLOAD_{$file_driver}_CONFIG"));
			if (!$info) {
				$this -> error();
			} else {
				//取得成功上传的文件信息
				//$uploadList = $upload -> getUploadFileInfo();
				Vendor('Excel.PHPExcel');
				//导入thinkphp第三方类库

				$import_file = $_SERVER['DOCUMENT_ROOT'] . $info['file']["path"];

				$objPHPExcel = \PHPExcel_IOFactory::load($import_file);

				$model = M(CONTROLLER_NAME);

				$sheetData = $objPHPExcel -> getActiveSheet() -> toArray(null, true, true, true);

				for ($i = $this -> first_row; $i <= count($sheetData); $i++) {
					$data = array();
					$data['renew_date'] = $sheetData[$i]["A"];
					$data['shop_no'] = $sheetData[$i]["B"];
					$data['shop_name'] = $sheetData[$i]["C"];
					$data['amount'] = $sheetData[$i]["D"];
					$model -> add($data);
				}

				$this -> assign('jumpUrl', get_return_url());
				$this -> success('导入成功！');
			}
		} else {
			$this -> display();
		}
	}

	private function _get_excel_col_name($i) {
		$first_char = floor($i / 26);
		$secend_char = $i % 26;
		if ($secend_char == 0) {
			$secend_char = 26;
			$first_char--;
		}
		if (empty($first_char)) {
			$first_char = '';
		} else {
			$first_char = chr($first_char + 64);
		}
		$secend_char = chr($secend_char + 64);

		return $first_char . $secend_char;
	}

	private function _get_filter_data($data, $shop_no) {
		$shop_no = array_filter(explode(",", $shop_no));
		$res = 0;

		foreach ($data as $key => $val) {
			if (in_array($key, $shop_no)) {
				$res += $val;
			}
		}
		return $res;
	}

}
?>
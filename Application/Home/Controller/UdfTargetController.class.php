<?php
/*---------------------------------------------------------------------------
 *
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/xiaowei
 --------------------------------------------------------------*/

namespace Home\Controller;

class UdfTargetController extends HomeController {
	protected $config = array('app_type' => 'common');
	protected $first_row = 2;
	protected $field_count = 35;
	protected $head = array();

	function _search_filter(&$map) {		
		if ($this -> config['auth']['admin'] == false){
			$map['emp_no'] = array('eq', get_emp_no());
		}
		if (!empty($_POST['keyword'])) {
			$map['A|B|C|D|E|F|G'] = array('like', "%" . $_POST['keyword'] . "%");
		}
	}

	function init_head_info() {
		$this -> add_head(1, '月份', 1, 1);
		$this -> add_head(1, '门店编号', 1, 1);
		$this -> add_head(1, '门店名称', 1, 1);
		$this -> add_head(1, '续货目标', 1, 1);
		$this -> add_head(1, '销售目标', 1, 1);
	}

	function add_head($i, $name, $colspan, $rowspan) {
		$item = new \stdClass();
		$item -> name = $name;
		$item -> colspan = $colspan;
		$item -> rowspan = $rowspan;
		$this -> head[$i][] = $item;
	}

	public function index() {
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
				//echo ($sub_val->name.$sub_val->colspan.$sub_val->rowspan);
				$head_html .= "<th class=\"text-center\" colspan=\"{$sub_val->colspan}\"} rowspan=\"{$sub_val->rowspan}\">{$sub_val->name}</th>";
			}
			$head_html .= '</tr>';
		}
		//echo $head_html;
		$this -> assign('head_html', $head_html);
		$this -> _index();
	}

	public function del($id){
		$this->_destory($id);
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
					$data['month'] = $sheetData[$i]["A"];
					$data['shop_no'] = $sheetData[$i]["B"];
					$data['shop_name'] = $sheetData[$i]["C"];
					$data['renew_target'] = $sheetData[$i]["D"];
					$data['sales_target'] = $sheetData[$i]["E"];

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

}
?>
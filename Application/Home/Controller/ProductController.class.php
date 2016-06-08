<?php
/*--------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/xiaowei
 --------------------------------------------------------------*/

namespace Home\Controller;

class ProductController extends HomeController {
	protected $config = array('app_type' => 'folder','admin' => 'del,move_to,folder_manage,field_type,field_manage');

	//过滤查询字段
	function _search_filter(&$map) {
		$map['is_del'] = array('eq', '0');
		$keyword = I('keyword');
		if (!empty($keyword) && empty($map['64'])) {
			$map['name'] = array('like', "%" . $keyword . "%");
		}
	}

	public function index() {

		$plugin['date'] = true;
		$this -> assign("plugin", $plugin);

		$map = $this -> _search();
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($map);
		}

		// $folder_list = D("SystemFolder") -> get_authed_folder();
		// if (!empty($folder_list)) {
			// $map['folder'] = array("in", $folder_list);
		// } else {
			// $map['_string'] = '1=2';
		// }

		$model = D("ProductView");

		if (!empty($model)) {
			$this -> _list($model, $map);
		}
		$this -> display();
	}

	public function edit($id) {
		$plugin['uploader'] = true;
		$plugin['date'] = true;
		$plugin['editor'] = true;
		$this -> assign("plugin", $plugin);

		$model = M("Product");
		$folder_id = $model -> where("id=$id") -> getField('folder');
		$this -> assign("auth", D("SystemFolder") -> get_folder_auth($folder_id));

		$vo = $model -> find($id);
		if (empty($vo)) {
			$this -> error("系统错误");
		}
		$this -> assign("vo", $vo);
		$field_list = D("UdfField") -> get_data_list($vo['udf_data']);
		$this -> assign("field_list", $field_list);
		$this -> display();
	}

	public function folder($fid) {
		$plugin['date'] = true;
		$this -> assign("plugin", $plugin);
		$this -> assign('auth', $this -> config['auth']);

		$model = D("Product");
		$map = $this -> _search();
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($map);
		}

		$map['folder'] = $fid;
		if (I('mode') == 'export') {
			$this -> _folder_export($model, $map);
		} else {
			$list = $this -> _list($model, $map);

		}

		$udf_data = $list[0]['udf_data'];		
		if (!empty($udf_data)) {			
			$udf_field = D("UdfField") -> get_show_field($udf_data);			
		}		
		$this -> assign('udf_field', $udf_field);
		$this->assign('udf_data',$udf_data);		
		
		$where = array();
		$where['id'] = array('eq', $fid);

		$folder_name = M("SystemFolder") -> where($where) -> getField("name");
		$this -> assign("folder_name", $folder_name);
		$this -> assign("folder", $fid);

		$this -> display();
		return;
	}

	private function _folder_export($model, $map) {
		$list = $model -> where($map) -> select();
		$list_one = $model -> where($map) -> find();
		$model_flow_field = D("UdfField");
		$topcell = $model_flow_field -> get_field_name($list_one["udf_data"]);

		//导入thinkphp第三方类库
		Vendor('Excel.PHPExcel');

		//$inputFileName = "Public/templete/contact.xlsx";
		//$objPHPExcel = PHPExcel_IOFactory::load($inputFileName);
		$objPHPExcel = new \PHPExcel();

		$objPHPExcel -> getProperties() -> setCreator("小微OA") -> setLastModifiedBy("小微OA") -> setTitle("Office 2007 XLSX Test Document") -> setSubject("Office 2007 XLSX Test Document") -> setDescription("Test document for Office 2007 XLSX, generated using PHP classes.") -> setKeywords("office 2007 openxml php") -> setCategory("Test result file");
		// Add some data

		$i = 1;
		$t = E;
		//dump($list);

		//编号，类型，标题，登录时间，部门，登录人，状态，审批，协商，抄送，审批情况，自定义字段
		$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue("A$i", "编号") -> setCellValue("B$i", "标题") -> setCellValue("C$i", "登录人") -> setCellValue("D$i", "登录时间") -> setCellValue("E$i", "内容");

		foreach ($topcell as $val) {
			$t++;
			$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue("$t$i", $val);

		}
		foreach ($list as $val) {
			$i++;
			//dump($val);

			$doc_no = $val["doc_no"];
			//编号
			$name = $val["name"];
			//标题
			$user_name = $val["user_name"];
			//登记人
			$create_time = $val["create_time"];
			$create_time = to_date($val["create_time"], 'Y-m-d H:i:s');
			//创建时间
			$content = $val["content"];

			//编号，类型，标题，登录时间，部门，登录人，状态，审批，协商，抄送，审批情况，自定义字段
			$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue("A$i", $doc_no) -> setCellValue("B$i", $name) -> setCellValue("C$i", $user_name) -> setCellValue("D$i", $create_time) -> setCellValue("E$i", ' ' . $content);

			$field_list = $model_flow_field -> get_data_list($val["udf_data"]);
			//	dump($field_list);
			$k = 0;
			if (!empty($field_list)) {
				foreach ($field_list as $field) {
					$k++;
					$field_data = $field['val'];
					$location = get_cell_location("E", $i, $k);
					$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue($location, ' ' . $field_data);
				}
			}
		}
		// Rename worksheet
		$objPHPExcel -> getActiveSheet() -> setTitle('报表统计');

		// Set active sheet index to the first sheet, so Excel opens this as the first sheet
		$objPHPExcel -> setActiveSheetIndex(0);
		$file_name = "报表统计.xlsx";
		// Redirect output to a client’s web browser (Excel2007)
		header("Content-Type: application/force-download");
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		header("Content-Disposition:attachment;filename =" . str_ireplace('+', '%20', URLEncode($file_name)));
		header('Cache-Control: max-age=0');

		$objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
		//readfile($filename);
		$objWriter -> save('php://output');
		exit ;
	}

	public function add($fid) {
		$plugin['uploader'] = true;
		$plugin['date'] = true;
		$plugin['editor'] = true;
		$this -> assign("plugin", $plugin);

		$model_flow_field = D("UdfField");
		$field_list = $model_flow_field -> get_field_list($fid);

		$this -> assign("field_list", $field_list);

		$this -> assign('folder', $fid);
		$this -> display();
	}

	public function read($id) {
		$model = M("Product");
		$folder_id = $model -> where("id=$id") -> getField('folder');
		$this -> assign("auth", D("SystemFolder") -> get_folder_auth($folder_id));

		$vo = $model -> find($id);
		if (empty($vo)) {
			$this -> error("系统错误");
		}
		$this -> assign('vo', $vo);
		$field_list = D("UdfField") -> get_data_list($vo['udf_data']);
		$this -> assign("field_list", $field_list);
		$this -> display();
	}

	public function del($id) {
		$where['id'] = array('in', $id);
		$folder = M("Product") -> distinct(true) -> where($where) -> getField('folder', true);
		if (count($folder) == 1) {
			$auth = D("SystemFolder") -> get_folder_auth($folder[0]);
			if ($auth['admin'] == true) {
				$this -> _del($id);
			}
		} else {
			$return['info'] = "删除失败";
			$return['status'] = 0;
			$this -> ajaxReturn($return);
		}
	}

	/** 插入新新数据  **/
	protected function _insert($name = CONTROLLER_NAME) {

		$model = D($name);
		if (false === $model -> create()) {
			$this -> error($model -> getError());
		}

		$model -> udf_data = D('UdfField') -> get_field_data();

		$list = $model -> add();

		if ($list !== false) {//保存成功
			//$flow_filed = D("UdfField") -> set_field($list);
			$this -> assign('jumpUrl', get_return_url());
			$this -> success('新增成功!');
		} else {
			$this -> error('新增失败!');
			//失败提示
		}
	}

	/* 更新数据  */
	protected function _update($name = CONTROLLER_NAME) {
		$model = D($name);
		if (false === $model -> create()) {
			$this -> error($model -> getError());
		}
		$model -> udf_data = D('UdfField') -> get_field_data();
		$list = $model -> save();
		if (false !== $list) {
			$this -> assign('jumpUrl', get_return_url());
			$this -> success('编辑成功!');
			//成功提示
		} else {
			$this -> error('编辑失败!');
			//错误提示
		}
	}

	function folder_manage() {
		$this -> _system_folder_manage('商品分类', false);
	}

	function upload() {
		$this -> _upload();
	}

	function down($attach_id) {
		$this -> _down($attach_id);
	}

	function field_type() {
		$field_type_list = D("SystemFolder") -> get_folder_list();
		$this -> assign("list", $field_type_list);
		$this -> display();
	}

	function field_manage($row_type) {
		$this -> assign("folder_name", "自定义字段管理");
		$this -> _field_manage($row_type);
	}

	public function import($folder) {
		$opmode = $_POST["opmode"];
		if ($opmode == "import") {
			$import_user = array();
			$File = D('File');
			$file_driver = C('DOWNLOAD_UPLOAD_DRIVER');
			$info = $File -> upload($_FILES, C('DOWNLOAD_UPLOAD'), C('DOWNLOAD_UPLOAD_DRIVER'), C("UPLOAD_{$file_driver}_CONFIG"));
			if (!$info) {
				$this -> error('上传错误');
			} else {
				//取得成功上传的文件信息
				//$uploadList = $upload -> getUploadFileInfo();
				Vendor('Excel.PHPExcel');
				//导入thinkphp第三方类库
				$import_file = $info['uploadfile']["path"];
				$import_file = substr($import_file, 1);
				$objPHPExcel = \PHPExcel_IOFactory::load($import_file);
				//$objPHPExcel = \PHPExcel_IOFactory::load('Uploads/Download/Org/2014-12/547e87ac4b0bf.xls');
				$sheetData = $objPHPExcel -> getActiveSheet() -> toArray(null, true, true, true);

				$model = M("Product");
				foreach ($sheetData[1] as $v) {
					$udf_data_key[]=$v;
				}
				for ($i = 0; $i <= count($sheetData); $i++) { 
					foreach ($sheetData[$i] as  $v) {
						$udf[$i][]=$v;
					}
				}
				for ($i = 2; $i <= count($udf); $i++) {
					$data['doc_no'] = $udf[$i][0];
					$data['user_id']=get_user_id();
					$data['user_name']=get_user_name();
					$data['create_time']=time();
					$data['name'] = $udf[$i][1];
					$data['content'] = $udf[$i][2];
					$data['folder']=$folder;
					for ($z=3; $z <count($udf_data_key) ; $z++) {
						$where['name']=$udf_data_key[$z];
						$where['controller']='Product';
					    $udffield=M('UdfField')->where($where)->find();
						$udf_data[$udffield['id']]=$udf[$i][$z];
					}
					$data['udf_data']=json_encode($udf_data);
					$model->add($data);

				}
				$this -> assign('jumpUrl', get_return_url());
				$this -> success('导入成功！');
			}
		} else {
			$this->assign('folder',$folder);
			$this -> display();
		}
	}



	function export($folder) {
		$model = M('Product');
		$list = $model -> where($_SESSION['report'])->where('folder='.$folder) -> select();
		$title=array('编号','创建人','创建时间','商品名称','描述');
		
		$UdfField=M('UdfField');
		foreach ($list as $v) {
			foreach(json_decode($v['udf_data'],true) as $k=>$v){
				$where['id']=$k;
				$name=$UdfField->where($where)->find();
				$title[]=$name['name'];
			}
		}
		$title=array_unique($title);
		$this -> exportexcel($list, $title, 'report');
	}
	function exportexcel($list = array(), $title = array(), $filename = 'report') {
		header("Content-type:application/octet-stream");
		header("Accept-Ranges:bytes");
		header("Content-type:application/vnd.ms-excel");
		header("Content-Disposition:attachment;filename=" . $filename . ".xls");
		header("Pragma: no-cache");
		header("Expires: 0");
        //导出xls 开始
		if (!empty($title)) {
			foreach ($title as $k => $v) {
				$title[$k] = iconv("UTF-8", "GB2312", $v);
			}
			$title = implode("\t", $title);
			echo "$title\n";
		}
		if (!empty($list)) {
			foreach ($list as $key => $val) {
				$data[$key]["doc_no"]= iconv("UTF-8", "gb2312",$val['doc_no']);
				$data[$key]["user_name"]= iconv("UTF-8", "gb2312",$val['user_name']);
				$data[$key]['create_time'] = iconv("UTF-8", "gb2312",date('Y-m-d', $val['create_time']));
				$data[$key]['name'] = iconv("UTF-8","gb2312",$val['name']);
				$data[$key]['content'] = iconv("UTF-8","gb2312",$val['content']);
				foreach(json_decode($val['udf_data'],true) as $k=>$v){
					$data[$key][$k]=iconv("UTF-8", "gb2312", $v);
				}
				$data[$key] = implode("\t", $data[$key]);

			}

			echo implode("\n", $data);
		}
	}

}

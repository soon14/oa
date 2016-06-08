<?php
/*
 * -------------------------------------------------------------------- 小微OA系统 - 让工作更轻松快乐 Copyright (c) 2013 http://www.smeoa.com All rights reserved. Author: jinzhu.yin<smeoa@qq.com> Support: https://git.oschina.net/smeoa/xiaowei --------------------------------------------------------------------
 */
namespace Home\Controller;

class CrmCompanyController extends HomeController {
	protected $config = array('app_type' => 'common','read'=>',add_company,add_company_save,edit_company,edit_company_save,del_company,company_field_manage');

	function _search_filter(&$where) {
		$where['is_del'] = array('eq', '0');
		$keyword = I('keyword');
		if (!empty($keyword) && empty($where['name'])) {
			$where['name'] = array('like', "%" . $keyword . "%");
			
		}
	}
	
	public function index() {
		$company = M('CrmCompany');
		$where = $this -> _search($company);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$where['user_id']=get_user_id();
		$_SESSION['report']=$where;
		$this -> _list($company, $where);
		$this -> display();
		
	}


	// 添加公司
	public function add_company() {
		$plugin['uploader'] = true;
		$plugin['date'] = true;
		$plugin['editor'] = true;
		$this -> assign("plugin", $plugin);

		$model_flow_field = D("UdfField");
		$field_list = $model_flow_field -> get_field_list(0);
		$this -> assign("field_list", $field_list);

		$this -> display();
	}
	// 保存公司
	public function add_company_save() {
		$CrmCompany=M('CrmCompany');
		$CrmCompany->create();
		$CrmCompany->create_time=time();
		$CrmCompany->user_id=get_user_id();
		$CrmCompany->user_name=get_user_name();
		$CrmCompany->udf_data=D('UdfField') -> get_field_data();
		$result=$CrmCompany->add();
		if($result){
			$this->success('新增成功！');
		}

	}

	// 编辑公司
	public function edit_company($id) {
		$plugin['uploader'] = true;
		$plugin['date'] = true;
		$plugin['editor'] = true;
		$this -> assign("plugin", $plugin);
		
		$model = M("crm_company");
		$vo = $model -> find($id);
		if (empty($vo)) {
			$this -> error("系统错误");
		}

		$field_list = D("UdfField") -> get_data_list($vo['udf_data']);
		$this -> assign("field_list", $field_list);
		$this -> assign("vo", $vo);
		$this ->display();
	}
	public function edit_company_save() {
		$CrmCompany=M('CrmCompany');
		$CrmCompany->create();
		$CrmCompany->create_time=time();
		$CrmCompany->update_time=time();
		$result=$CrmCompany->save();
		if($result){
			$this->success('编辑成功！');
		}

	}
	public function import() {
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
				$model = D("CrmCompany");
				foreach ($sheetData[1] as $v) {
					$udf_data_key[]=$v;
				}
				for ($i = 0; $i <= count($sheetData); $i++) { 
					foreach ($sheetData[$i] as  $v) {
						$udf[$i][]=$v;
					}
				}
				for ($i = 2; $i <= count($udf); $i++) {
					$data['name'] = $udf[$i][0];
					$data['user_id']=get_user_id();
					$data['user_name']=get_user_name();
					$data['create_time']=time();
					$data['website'] = $udf[$i][1];
					$data['contacts'] = $udf[$i][2];
					$data['address'] = $udf[$i][3];
					$data['remark'] = $udf[$i][4];
					for ($z=5; $z <count($udf_data_key) ; $z++) {
						$where['name']=$udf_data_key[$z];
						$where['controller']='CrmCompany';
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
			$this -> display();
		}
	}



	function export() {
		$model = M('CrmCompany');
		$list = $model -> where($_SESSION['report']) -> select();
		$title=array('公司名称','创建人','创建时间','网址', '地址','联系人');
		$json_data = $model->field('udf_data')->select();
		$UdfField=M('UdfField');
		foreach ($json_data as $v) {
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
				$data[$key]["name"]= iconv("UTF-8", "gb2312",$val['name']);
				$data[$key]["user_name"]= iconv("UTF-8", "gb2312",$val['user_name']);
				$data[$key]['create_time'] = iconv("UTF-8", "gb2312",date('Y-m-d', $val['create_time']));
				$data[$key]['website'] = iconv("UTF-8","gb2312",$val['website']);
				$data[$key]['address'] = iconv("UTF-8", "gb2312",$val['address']);
				$data[$key]['contacts'] = iconv("UTF-8", "gb2312", $val['contacts']);
				
				foreach(json_decode($val['udf_data'],true) as $k=>$v){
					$data[$key][$k]=iconv("UTF-8", "gb2312", $v);
				}
				$data[$key] = implode("\t", $data[$key]);

			}

			echo implode("\n", $data);
		}
	}
	// 删除公司
	public function del_company($company_id) {
		$this -> _del($company_id, "crm_company");
	}


	function company_field_manage() {
		$this -> assign("folder_name", "CRM 公司自定义字段管理");
		$this -> _field_manage(0);
	}


	public function upload() {
		$this -> _upload();
	}

	function down($attach_id) {
		$this -> _down($attach_id);
	}

}

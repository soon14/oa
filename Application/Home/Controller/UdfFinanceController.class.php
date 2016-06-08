<?php
/*--------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/xiaowei
 --------------------------------------------------------------*/

namespace Home\Controller;
//客户管理控制器
class UdfFinanceController extends HomeController {
	protected $config = array('app_type' => 'personal');
	//合同主页
	public function index() {
		$Crm = M('udf_crm');
		$where = $this -> _search($Crm);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$this -> _list($Crm, $where, 'id desc');
		$this -> display();
	}

	//修改客户资源
	public function update() {
		$DataAll = M('udf_crm');
		$plugin['uploader'] = true;
		$plugin['editor'] = true;
		$plugin['date'] = true;
		$this -> assign("plugin", $plugin);
		$id = $_GET['id'];
		$rs = $DataAll -> where("id = '$id'") -> select();
		$this -> assign('list', $rs);
		$this -> display();
	}

	//修改客户资源save
	public function update_save() {
		$DataAll = M('udf_crm');
		$id = $_GET['id'];
		$DataAll -> create();
		$rs = $DataAll -> where("id = '$id'") -> save();
		if ($rs) {
			$this -> success('修改成功', U('index'));
		}
	}

	public function del_index($contact_id) {
		$this -> _destory($contact_id, "udf_crm");
	}

	//删除客户资源
	public function del() {
		$id = $_GET['id'];
		$DataAll = M('udf_crm');
		$rs = $DataAll -> where("id = '$id'") -> delete();
		if ($rs) {
			$this -> success('删除成功', U('index'));
		}
	}

	//导出
	public function export() {
		set_time_limit(0);
		$DataAll = M('udf_crm');
		$count = $DataAll -> count();

		header('Content-Type: application/vnd.ms-excel');
		header('Content-Disposition: attachment;filename="user.csv"');
		header('Cache-Control: max-age=0');
		// 打开PHP文件句柄，php://output 表示直接输出到浏览器
		$fp = fopen('php://output', 'a');

		// 输出Excel列名信息
		$head = array('交单日期', '扣费日期', '编号', '公司名称', '地址', '联系人', '联系人(代理)', '电话代扣', '联系电话', '办理项目', '销售员', '金额', '实占款', '付费方式', '备注');

		foreach ($head as $i => $v) {
			// CSV的Excel支持GBK编码，一定要转换，否则乱码
			$head[$i] = iconv('utf-8', 'gbk', $v);
		}

		// 将数据通过fputcsv写到文件句柄
		fputcsv($fp, $head);

		// 计数器
		$cnt = 0;
		// 每隔$limit行，刷新一下输出buffer，不要太大，也不要太小
		$limit = 100000;

		// 逐行取出数据，不浪费内存

		for ($t = 0; $t < $count; $t++) {
			$list = $DataAll -> select();
			$cnt++;
			if ($limit == $cnt) {//刷新一下输出buffer，防止由于数据过多造成问题
				ob_flush();
				flush();
				$cnt = 0;
			}
			foreach ($list as $val) {
				$stime = $val['stime'];
				$etime = $val["etime"];
				$htid = $val["htid"];
				$name = $val["name"];
				$address = $val["address"];
				$lxuser = $val["lxuser"];
				$lxuser = $val["selluser"];
				$kftel = $val["kftel"];
				$lxter = $val["lxter"];
				$blxm = $val["blxm"];
				$datatype = $val["datatype"];
				$price = $val["price"];
				$sprice = $val["sprice"];
				$kftype = $val["kftype"];
				$memo = $val["memo"];
				$yewu = "个人类";
				$area = $val["area"];
				$r1 = array($stime, $etime, $htid, $name, $address, $lxuser, $kftel, $blxm, $datatype, $price, $sprice, $kftype, $memo, $yewu, $area);
				$row = array_merge($r1);
				foreach ($row as $i => $v) {
					$row[$i] = iconv('utf-8', 'gbk', $v);
				}
			}
			fputcsv($fp, $row);
			unset($row);
		}
	}

	//--------------------------------------------------------------------------
	//利润统计
	public function profit() {
		$profit = M('udf_lrb');
		$where = $this -> _search($profit);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$this -> _list($profit, $where, 'id desc');
		$this -> display();
	}
	public function profit_xx(){
		$profit = M('udf_lrb');
		$id = $_GET['id'];
		$rs = $profit->where("id = $id")->select();
		$this->assign('list',$rs);
		$this->display();
		
	}
	public function profit_add() {
		$plugin['uploader'] = true;
		$plugin['editor'] = true;
		$plugin['date'] = true;
		$this -> assign("plugin", $plugin);
		$this -> display();
	}

	public function profit_add_save() {
		$profit = M('udf_lrb');
		$data = $profit -> create();
		$rs = $profit -> add($data);
		if ($rs) {
			$this -> success('添加成功', U('profit'));

		}
	}

	public function profit_del() {
		$profit = M('udf_lrb');
		$where['id'] = $_GET['id'];
		$rs = $profit -> where($where) -> delete();
		if ($rs) {
			$this -> success('删除成功', U('profit'));
		}
	}

	public function del_profit($contact_id) {
		$this -> _destory($contact_id, "udf_lrb");
	}

	//修改
	public function profit_update() {

		$profit = M('udf_lrb');
		$where['id'] = $_GET['id'];
		$rs = $profit -> where($where) -> select();
		$this -> assign('list', $rs);
		$this -> display();

	}

	//修改save
	public function profit_update_save() {
		$profit = M('udf_lrb');
		$where['id'] = $_POST['id'];
		$profit -> create();
		$rs = $profit -> where($where) -> save();
		if ($rs) {
			$this -> success('修改成功', U('profit'));
		}
	}

	//批量导入
	public function profit_import() {
		$fs = $_POST['status'];
		$opmode = $_POST["opmode"];
		if ($opmode == "import") {
			$File = D('File');
			$file_driver = C('DOWNLOAD_UPLOAD_DRIVER');
			$info = $File -> upload($_FILES, C('DOWNLOAD_UPLOAD'), C('DOWNLOAD_UPLOAD_DRIVER'), C("UPLOAD_{$file_driver}_CONFIG"));

			if (!$info) {
				$this -> error($File -> getError());
			} else {
				//取得成功上传的文件信息
				Vendor('Excel.PHPExcel');
				//导入thinkphp第三方类库
				$inputFileName = C('DOWNLOAD_UPLOAD.rootPath') . $info['uploadfile']["savepath"] . $info['uploadfile']["savename"];
				$objPHPExcel = \PHPExcel_IOFactory::load($inputFileName);

				$sheetData = $objPHPExcel -> getActiveSheet() -> toArray(null, true, true, true);
				$cost = M("udf_lrb");
				for ($i = 2; $i <= count($sheetData); $i++) {
					$id = $sheetData[$i]["M"];
					$data = array();
					$data['xm1'] = $sheetData[$i]["A"];
					$data['xmbl1'] = $sheetData[$i]["B"];
					$data['yysr1'] = $sheetData[$i]["C"];
					$data['yye1'] = $sheetData[$i]["D"];
					$data['xmcb1'] = $sheetData[$i]["E"];
					$data['ml1'] = $sheetData[$i]["F"];
					$data['xtf'] = $sheetData[$i]["G"];
					$data['gz'] = $sheetData[$i]["H"];
					$data['area'] = $sheetData[$i]["I"];
					$data['zg'] = $sheetData[$i]["J"];
					$data['month'] = $sheetData[$i]["K"];
					$data['memo'] = $sheetData[$i]["L"];
					$data['inputuser'] = $_POST['inputuser'];
					$data['inputtime'] = $_POST['inputtime'];
					$data['jsmonth'] = $_POST['jsmonth'];
					$data['id'] = $id;
					if($fs==2){
						$cost ->where("id = $id")-> save($data);
						
						}else{
						$cost -> add($data);}
				}

				if (file_exists(__ROOT__ . "/" . $inputFileName)) {
					unlink(__ROOT__ . "/" . $inputFileName);
				}
				$this -> assign('jumpUrl', get_return_url());
				$this -> success('导入成功', U('profit'));
			}
		} else {
			$this -> display();
		}

	}

	//----------------------------------------------------------------------
	//社保明细
	public function security() {
		$security = M('udf_sbmx');
		$where = $this -> _search($security);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$this -> _list($security, $where, 'id desc');
		$this -> display();
	}

	public function security_add() {
		$this -> display();
	}

	public function security_add_save() {
		$security = M('udf_sbmx');
		$data = $security -> create();
		$rs = $security -> add($data);
		if ($rs) {
			$this -> success('添加成功', U('security'));

		}
	}

	public function security_del() {
		$security = M('udf_sbmx');
		$where['id'] = $_GET['id'];
		$rs = $security -> where($where) -> delete();
		if ($rs) {
			$this -> success('删除成功', U('security'));
		}
	}

	public function del_security($contact_id) {
		$this -> _destory($contact_id, "udf_sbmx");
	}

	//修改
	public function security_update() {

		$security = M('udf_sbmx');
		$where['id'] = $_GET['id'];
		$rs = $security -> where($where) -> select();
		$this -> assign('list', $rs);
		$this -> display();

	}

	//修改save
	public function security_update_save() {
		$security = M('udf_sbmx');
		$where['id'] = $_POST['id'];
		$security -> create();
		$rs = $security -> where($where) -> save();
		if ($rs) {
			$this -> success('修改成功', U('security'));
		}
	}

	public function security_import(){
		$fs = $_POST['status'];
		$opmode = $_POST["opmode"];
		if ($opmode == "import") {
			$File = D('File');
			$file_driver = C('DOWNLOAD_UPLOAD_DRIVER');
			$info = $File -> upload($_FILES, C('DOWNLOAD_UPLOAD'), C('DOWNLOAD_UPLOAD_DRIVER'), C("UPLOAD_{$file_driver}_CONFIG"));

			if (!$info) {
				$this -> error($File -> getError());
			} else {
				//取得成功上传的文件信息
				Vendor('Excel.PHPExcel');
				//导入thinkphp第三方类库
				$inputFileName = C('DOWNLOAD_UPLOAD.rootPath') . $info['uploadfile']["savepath"] . $info['uploadfile']["savename"];
				$objPHPExcel = \PHPExcel_IOFactory::load($inputFileName);

				$sheetData = $objPHPExcel -> getActiveSheet() -> toArray(null, true, true, true);
				$cost = M("udf_sbmx");
				for ($i = 2; $i <= count($sheetData); $i++) {
					
					$data = array();
					$data['area'] = $sheetData[$i]["A"];
					$data['name'] = $sheetData[$i]["B"];
					$data['yldw'] = $sheetData[$i]["C"];
					$data['ylgr'] = $sheetData[$i]["D"];
					$data['sydw'] = $sheetData[$i]["E"];
					$data['gsdw'] = $sheetData[$i]["F"];
					$data['shiydw'] = $sheetData[$i]["G"];
					$data['shiygr'] = $sheetData[$i]["H"];
					$data['yndw'] = $sheetData[$i]["I"];
					$data['yngr'] = $sheetData[$i]["J"];
					$data['zdjb'] = $sheetData[$i]["K"];
					$data['dwall'] = $sheetData[$i]["L"];
					$data['grall'] = $sheetData[$i]["M"];
					$data['hj'] = $sheetData[$i]["N"];
					$data['memo'] = $sheetData[$i]["O"];
					$id = $sheetData[$i]["P"];
					$data['id'] = $id;
					$data['inputuser'] = $_POST['inputuser'];
					$data['inputtime'] = $_POST['inputtime'];
					$data['jsmonth'] = $_POST['jsmonth'];
					
					if($fs==2){
						$cost ->where("id = $id")-> save($data);
						
						}else{
						$cost -> add($data);}
				}

				if (file_exists(__ROOT__ . "/" . $inputFileName)) {
					unlink(__ROOT__ . "/" . $inputFileName);
				}
				$this -> assign('jumpUrl', get_return_url());
				$this -> success('导入成功', U('security'));
			}
		} else {
			$this -> display();
		}
		
		
	}

	//-----------------------------------------------------------------------
	//工资明细
	public function wage() {
		$gzmx = M('udf_gzmx');
		$where = $this -> _search($gzmx);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$this -> _list($gzmx, $where, 'id desc');
		$this -> display();
	}
	public function wage_xx(){
		$gzmx = M('udf_gzmx');
		$id = $_GET['id'];
		$rs = $gzmx->where("id = $id")->select();
		$this->assign('list',$rs);
		$this->display();
	}

	//工资明细add
	public function wage_add() {
		$this -> display();
	}

	public function wage_add_save() {
		$gzmx = M('udf_gzmx');

		$data = $gzmx -> create();
		$rs = $gzmx -> add($data);
		if ($rs) {
			$this -> success('添加成功', U('wage'));

		}
	}

	//删除工资明细
	public function wage_del() {
		$gzmx = M('udf_gzmx');
		$where['id'] = $_GET['id'];
		$rs = $gzmx -> where($where) -> delete();
		if ($rs) {
			$this -> success('删除成功', U('wage'));
		}
	}

	public function del_wage($contact_id) {
		$this -> _destory($contact_id, "udf_gzmx");
	}

	//修改
	public function wage_update() {

		$gzmx = M('udf_gzmx');
		$where['id'] = $_GET['id'];
		$rs = $gzmx -> where($where) -> select();
		$this -> assign('list', $rs);
		$this -> display();

	}

	//修改save
	public function wage_update_save() {
		$gzmx = M('udf_gzmx');
		$where['id'] = $_POST['id'];
		$gzmx -> create();
		$rs = $gzmx -> where($where) -> save();
		if ($rs) {
			$this -> success('修改成功', U('wage'));
		}
	}

	//批量导入
	public function wage_import() {
		$opmode = $_POST["opmode"];
		if ($opmode == "import") {
			$File = D('File');
			$file_driver = C('DOWNLOAD_UPLOAD_DRIVER');
			$info = $File -> upload($_FILES, C('DOWNLOAD_UPLOAD'), C('DOWNLOAD_UPLOAD_DRIVER'), C("UPLOAD_{$file_driver}_CONFIG"));

			if (!$info) {
				$this -> error($File -> getError());
			} else {
				//取得成功上传的文件信息
				Vendor('Excel.PHPExcel');
				//导入thinkphp第三方类库
				$inputFileName = C('DOWNLOAD_UPLOAD.rootPath') . $info['uploadfile']["savepath"] . $info['uploadfile']["savename"];
				$objPHPExcel = \PHPExcel_IOFactory::load($inputFileName);

				$sheetData = $objPHPExcel -> getActiveSheet() -> toArray(null, true, true, true);
				$cost = M("udf_gzmx");
				for ($i = 2; $i <= count($sheetData); $i++) {

					$data = array();
					$data['yjgj'] = $sheetData[$i]["A"];
					$data['gltc'] = $sheetData[$i]["B"];
					$data['kc'] = $sheetData[$i]["C"];
					$data['ycgj'] = $sheetData[$i]["D"];
					$data['cggj'] = $sheetData[$i]["E"];
					$data['dkgs'] = $sheetData[$i]["F"];
					$data['fhj'] = $sheetData[$i]["G"];
					$data['dkhj'] = $sheetData[$i]["H"];
					$data['sd'] = $sheetData[$i]["I"];
					$data['yfgz'] = $sheetData[$i]["J"];
					$data['sfgz'] = $sheetData[$i]["K"];
					$data['carid'] = $sheetData[$i]["L"];
					$data['memo'] = $sheetData[$i]["M"];
					$data['inputuser'] = $_POST['inputuser'];
					$data['inputtime'] = $_POST['inputtime'];
					$data['jsmonth'] = $_POST['jsmonth'];

					$cost -> add($data);
				}

				if (file_exists(__ROOT__ . "/" . $inputFileName)) {
					unlink(__ROOT__ . "/" . $inputFileName);
				}
				$this -> assign('jumpUrl', get_return_url());
				$this -> success('导入成功', U('wage'));
			}
		} else {
			$this -> display();
		}

	}

	//-----------------------------------------
	//费用明细
	public function cost() {
		$cost = M('udf_fymx');
		$where = $this -> _search($cost);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$this -> _list($cost, $where, 'id desc');
		$this -> display();
	}

	public function cost_add() {
		$plugin['uploader'] = true;
		$plugin['editor'] = true;
		$plugin['date'] = true;
		$this -> assign("plugin", $plugin);
		$this -> display();
	}

	//费用明细添加
	public function cost_add_save() {
		$cost = M('udf_fymx');

		$type = $_POST['typea'];
		if ($type == 1) {
			$data['srprice'] = $_POST['price'];

		} else {
			$data['zcprice'] = $_POST['price'];

		}

		$data = $cost -> create();
		$rs = $cost -> add($data);
		if ($rs) {
			$this -> success('添加成功', U('cost'));

		}
	}

	// 删除客户
	public function del_cost($contact_id) {
		$this -> _destory($contact_id, "udf_fymx");
	}

	public function cost_del() {
		$cost = M('udf_fymx');
		$where['id'] = $_GET['id'];
		$rs = $cost -> where($where) -> delete();
		if ($rs) {
			$this -> success('删除成功', U('cost'));
		}
	}

	//修改
	public function cost_update() {
		$plugin['uploader'] = true;
		$plugin['editor'] = true;
		$plugin['date'] = true;
		$this -> assign("plugin", $plugin);
		$cost = M('udf_fymx');
		$where['id'] = $_GET['id'];
		$rs = $cost -> where($where) -> select();
		$this -> assign('list', $rs);
		$this -> display();

	}

	//修改save
	public function cost_update_save() {
		$cost = M('udf_fymx');
		$where['id'] = $_POST['id'];
		$cost -> create();
		$rs = $cost -> where($where) -> save();
		if ($rs) {
			$this -> success('修改成功', U('cost'));
		}
	}

	//批量导入
	public function cost_import() {
		$opmode = $_POST["opmode"];
		if ($opmode == "import") {
			$File = D('File');
			$file_driver = C('DOWNLOAD_UPLOAD_DRIVER');
			$info = $File -> upload($_FILES, C('DOWNLOAD_UPLOAD'), C('DOWNLOAD_UPLOAD_DRIVER'), C("UPLOAD_{$file_driver}_CONFIG"));

			if (!$info) {
				$this -> error($File -> getError());
			} else {
				//取得成功上传的文件信息
				Vendor('Excel.PHPExcel');
				//导入thinkphp第三方类库
				$inputFileName = C('DOWNLOAD_UPLOAD.rootPath') . $info['uploadfile']["savepath"] . $info['uploadfile']["savename"];
				$objPHPExcel = \PHPExcel_IOFactory::load($inputFileName);

				$sheetData = $objPHPExcel -> getActiveSheet() -> toArray(null, true, true, true);
				$cost = M("udf_fymx");
				for ($i = 2; $i <= count($sheetData); $i++) {

					$data = array();
					$data['sdata'] = $sheetData[$i]["A"];
					$data['title'] = $sheetData[$i]["B"];
					$data['srprice'] = $sheetData[$i]["C"];
					$data['zcprice'] = $sheetData[$i]["D"];
					$data['yeprice'] = $sheetData[$i]["E"];
					$data['type'] = $sheetData[$i]["F"];
					$data['memo'] = $sheetData[$i]["G"];
					$data['area'] = $_POST['area'];
					$data['inputuser'] = $_POST['inputuser'];
					$data['inputtime'] = $_POST['inputtime'];
					$data['jsmonth'] = $_POST['jsmonth'];

					$cost -> add($data);
				}

				if (file_exists(__ROOT__ . "/" . $inputFileName)) {
					unlink(__ROOT__ . "/" . $inputFileName);
				}
				$this -> assign('jumpUrl', get_return_url());
				$this -> success('导入成功', U('cost'));
			}
		} else {
			$this -> display();
		}

	}

}
?>
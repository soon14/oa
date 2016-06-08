<?php
/*--------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/xiaowei
 --------------------------------------------------------------*/

namespace Home\Controller;
//客户管理控制器
class UdfCrmController extends HomeController {
	protected $config = array('app_type' => 'personal');
	public function gongzi() {
		$this -> display();

	}

	//电信客户资料、
	public function dx_index() {
		$DataAll = M('udf_crm');

		$where = $this -> _search($DataAll);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$where['blxm'] = array( array('like', '%实名查询%'), array('like', '%优先报号%'), array('like', '%加盟%'), array('like', '%查询转接%'), array('like', '%企业名片%'), array('like', '%企业总机%'), array('like', '%电子黄页%'), array('like', '%东莞黄页%'), 'or');
		$where['status'] = array( array('eq', '1'), array('eq', '3'), 'or');
		$this -> _list($DataAll, $where, 'id desc');
		$this -> display();

	}

	//号百114、
	public function dx_haobai114_index() {
		$DataAll = M('udf_crm');
		$where = $this -> _search($DataAll);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$where['blxm'] = array( array('like', '%实名查询%'), array('like', '%优先报号%'), array('like', '%加盟%'), array('like', '%查询转接%'), array('like', '%企业名片%'), array('like', '%企业总机%'), 'or');
		$where['status'] = array( array('eq', '1'), array('eq', '3'), 'or');
		$this -> _list($DataAll, $where, 'id desc');
		$this -> display();

	}

	//电子黄页、
	public function dx_dzhy_index() {

		$DataAll = M('udf_crm');
		$where = $this -> _search($DataAll);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$where['blxm'] = array('like', '%电子黄页%');
		$where['status'] = array( array('eq', '1'), array('eq', '3'), 'or');
		$this -> _list($DataAll, $where, 'id desc');
		$this -> display();

	}

	//纸质黄页、
	public function dx_zzhy_index() {
		$DataAll = M('udf_crm');
		$where = $this -> _search($DataAll);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$where['blxm'] = array('like', '%东莞黄页%');
		$where['status'] = array( array('eq', '1'), array('eq', '3'), 'or');
		$this -> _list($DataAll, $where, 'id desc');
		$this -> display();

	}

	//电信到期客户查看
	public function dx_daoqi() {
		$DataAll = M('udf_crm');

		$where = $this -> _search($DataAll);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$where['blxm'] = array( array('like', '%实名查询%'), array('like', '%优先报号%'), array('like', '%加盟%'), array('like', '%查询转接%'), array('like', '%企业名片%'), array('like', '%企业总机%'), array('like', '%电子黄页%'), array('like', '%东莞黄页%'), 'or');
		$where['status'] = 2;
		$this -> _list($DataAll, $where, 'id desc');
		$this -> display();

	}

	//电信预约客户
	public function dx_yuyue() {
		$DataAll = M('udf_crm');

		$where = $this -> _search($DataAll);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$where['blxm'] = array( array('like', '%实名查询%'), array('like', '%优先报号%'), array('like', '%加盟%'), array('like', '%查询转接%'), array('like', '%企业名片%'), array('like', '%企业总机%'), array('like', '%电子黄页%'), array('like', '%东莞黄页%'), 'or');
		$where['status'] = 4;
		$this -> _list($DataAll, $where, 'id desc');
		$this -> display();

	}

	//电信预约导出
	public function dx_export() {
		Header("Content-type:application/octet-stream");
		Header("Accept-Ranges:bytes");
		Header("Content-type:application/vnd.ms-excel");
		Header("Content-Disposition:attachment;filename=预约客户.xls");
		$UdfCrm = M("udf_crm");
		$where['blxm'] = array( array('like', '%实名查询%'), array('like', '%优先报号%'), array('like', '%加盟%'), array('like', '%查询转接%'), array('like', '%企业名片%'), array('like', '%企业总机%'), array('like', '%电子黄页%'), array('like', '%东莞黄页%'), 'or');
		$where['status'] = 4;
		$rs = $UdfCrm -> where($where) -> select();
		Vendor('Excel.PHPExcel');
		//导入thinkphp第三方类库
		$objPHPExcel = new \PHPExcel();
		$i = 1;
		$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue("A$i", '接入号') -> setCellValue("B$i", '公司名称') -> setCellValue("C$i", '公司地址') -> setCellValue("D$i", '办理项目') -> setCellValue("E$i", '合同编号') -> setCellValue("F$i", '联系人') -> setCellValue("G$i", '联系电话') -> setCellValue("H$i", '扣费电话') -> setCellValue("I$i", '到期时间') -> setCellValue("J$i", '销售员') -> setCellValue("K$i", '金额') -> setCellValue("L$i", '实占款') -> setCellValue("M$i", '付款方式') -> setCellValue("N$i", '备注') -> setCellValue("O$i", '预约期限') -> setCellValue("P$i", '状态') -> setCellValue("Q$i", 'ID');
		foreach ($rs as $val) {
			$i++;
			$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue("A$i", $val["jieru_id"]) -> setCellValue("B$i", $val["name"]) -> setCellValue("C$i", $val["address"]) -> setCellValue("D$i", $val["blxm"]) -> setCellValue("E$i", $val["htid"]) -> setCellValue("F$i", $val["lxuser"]) -> setCellValue("G$i", $val["lxtel"]) -> setCellValue("H$i", $val["kfter"]) -> setCellValue("I$i", $val["exprice_time"]) -> setCellValue("J$i", $val["selluser"]) -> setCellValue("K$i", $val["price"]) -> setCellValue("L$i", $val["sprice"]) -> setCellValue("M$i", $val["kftype"]) -> setCellValue("N$i", $val["memo"]) -> setCellValue("O$i", $val["yy_time"]) -> setCellValue("P$i", $val["status"]) -> setCellValue("Q$i", $val["id"]);
		}
		//$objPHPExcel -> getActiveSheet() -> setTitle('Customer');
		$objPHPExcel -> setActiveSheetIndex(0);
		$objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
		$objWriter -> save('php://output');
		exit ;

	}

	//电信到期导出
	public function dx_export_dq() {
		Header("Content-type:application/octet-stream");
		Header("Accept-Ranges:bytes");
		Header("Content-type:application/vnd.ms-excel");
		Header("Content-Disposition:attachment;filename=预约客户.xls");
		$UdfCrm = M("udf_crm");
		$where['blxm'] = array( array('like', '%实名查询%'), array('like', '%优先报号%'), array('like', '%加盟%'), array('like', '%查询转接%'), array('like', '%企业名片%'), array('like', '%企业总机%'), array('like', '%电子黄页%'), array('like', '%东莞黄页%'), 'or');
		$where['status'] = 2;
		$rs = $UdfCrm -> where($where) -> select();
		Vendor('Excel.PHPExcel');
		//导入thinkphp第三方类库
		$objPHPExcel = new \PHPExcel();
		$i = 1;
		$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue("A$i", '接入号') -> setCellValue("B$i", '公司名称') -> setCellValue("C$i", '公司地址') -> setCellValue("D$i", '办理项目') -> setCellValue("E$i", '合同编号') -> setCellValue("F$i", '联系人') -> setCellValue("G$i", '联系电话') -> setCellValue("H$i", '扣费电话') -> setCellValue("I$i", '到期时间') -> setCellValue("J$i", '销售员') -> setCellValue("K$i", '金额') -> setCellValue("L$i", '实占款') -> setCellValue("M$i", '付款方式') -> setCellValue("N$i", '备注') -> setCellValue("O$i", '预约期限') -> setCellValue("P$i", '状态') -> setCellValue("Q$i", 'ID');
		foreach ($rs as $val) {
			$i++;
			$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue("A$i", $val["jieru_id"]) -> setCellValue("B$i", $val["name"]) -> setCellValue("C$i", $val["address"]) -> setCellValue("D$i", $val["blxm"]) -> setCellValue("E$i", $val["htid"]) -> setCellValue("F$i", $val["lxuser"]) -> setCellValue("G$i", $val["lxtel"]) -> setCellValue("H$i", $val["kfter"]) -> setCellValue("I$i", $val["exprice_time"]) -> setCellValue("J$i", $val["selluser"]) -> setCellValue("K$i", $val["price"]) -> setCellValue("L$i", $val["sprice"]) -> setCellValue("M$i", $val["kftype"]) -> setCellValue("N$i", $val["memo"]) -> setCellValue("O$i", $val["yy_time"]) -> setCellValue("P$i", $val["status"]) -> setCellValue("Q$i", $val["id"]);
		}
		//$objPHPExcel -> getActiveSheet() -> setTitle('Customer');
		$objPHPExcel -> setActiveSheetIndex(0);
		$objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
		$objWriter -> save('php://output');
		exit ;

	}

	//---------------------------------------------------------------------------------------
	//互联网客户资料
	public function hlw_index() {
		$DataAll = M('udf_crm');
		$where = $this -> _search($DataAll);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$where['blxm'] = array( array('like', '%微信%'), array('like', '%互联%'), 'or');
		$where['status'] = array( array('eq', '1'), array('eq', '3'), 'or');
		$this -> _list($DataAll, $where, 'id desc');
		$this -> display();

	}

	//微信
	public function hlw_wx_index() {
		$DataAll = M('udf_crm');
		$where = $this -> _search($DataAll);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$where['status'] = array( array('eq', '1'), array('eq', '3'), 'or');
		$where['blxm'] = array('like', '%微信%');
		$this -> _list($DataAll, $where, 'id desc');
		$this -> display();

	}

	//互联网建站
	public function hlw_jz_index() {
		$DataAll = M('udf_crm');
		$where = $this -> _search($DataAll);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$where['status'] = array( array('eq', '1'), array('eq', '3'), 'or');
		$where['blxm'] = array('like', '%互联%');
		$this -> _list($DataAll, $where, 'id desc');
		$this -> display();

	}

	//互联网到期客户查看
	public function hlw_daoqi() {
		$DataAll = M('udf_crm');
		$where = $this -> _search($DataAll);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$where['blxm'] = array( array('like', '%微信%'), array('like', '%互联%'), 'or');
		$where['status'] = 2;
		$this -> _list($DataAll, $where, 'id desc');
		$this -> display();
	}

	//互联网预约
	public function hlw_yuyue() {
		$DataAll = M('udf_crm');
		$where = $this -> _search($DataAll);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$where['blxm'] = array( array('like', '%微信%'), array('like', '%互联%'), 'or');
		$where['status'] = 4;
		$this -> _list($DataAll, $where, 'id desc');
		$this -> display();

	}

	//互联网预约导出
	public function hlw_export() {
		Header("Content-type:application/octet-stream");
		Header("Accept-Ranges:bytes");
		Header("Content-type:application/vnd.ms-excel");
		Header("Content-Disposition:attachment;filename=预约客户.xls");
		$UdfCrm = M("udf_crm");
		$where['blxm'] = array( array('like', '%微信%'), array('like', '%互联%'), 'or');
		$where['status'] = 4;
		$rs = $UdfCrm -> where($where) -> select();
		Vendor('Excel.PHPExcel');
		//导入thinkphp第三方类库
		$objPHPExcel = new \PHPExcel();
		$i = 1;
		$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue("A$i", '接入号') -> setCellValue("B$i", '公司名称') -> setCellValue("C$i", '公司地址') -> setCellValue("D$i", '办理项目') -> setCellValue("E$i", '合同编号') -> setCellValue("F$i", '联系人') -> setCellValue("G$i", '联系电话') -> setCellValue("H$i", '扣费电话') -> setCellValue("I$i", '到期时间') -> setCellValue("J$i", '销售员') -> setCellValue("K$i", '金额') -> setCellValue("L$i", '实占款') -> setCellValue("M$i", '付款方式') -> setCellValue("N$i", '备注') -> setCellValue("O$i", '预约期限') -> setCellValue("P$i", '状态') -> setCellValue("Q$i", 'ID');
		foreach ($rs as $val) {
			$i++;
			$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue("A$i", $val["jieru_id"]) -> setCellValue("B$i", $val["name"]) -> setCellValue("C$i", $val["address"]) -> setCellValue("D$i", $val["blxm"]) -> setCellValue("E$i", $val["htid"]) -> setCellValue("F$i", $val["lxuser"]) -> setCellValue("G$i", $val["lxtel"]) -> setCellValue("H$i", $val["kfter"]) -> setCellValue("I$i", $val["exprice_time"]) -> setCellValue("J$i", $val["selluser"]) -> setCellValue("K$i", $val["price"]) -> setCellValue("L$i", $val["sprice"]) -> setCellValue("M$i", $val["kftype"]) -> setCellValue("N$i", $val["memo"]) -> setCellValue("O$i", $val["yy_time"]) -> setCellValue("P$i", $val["status"]) -> setCellValue("Q$i", $val["id"]);
		}
		//$objPHPExcel -> getActiveSheet() -> setTitle('Customer');
		$objPHPExcel -> setActiveSheetIndex(0);
		$objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
		$objWriter -> save('php://output');
		exit ;

	}

	//互联网到期导出
	public function hlw_export_dq() {
		Header("Content-type:application/octet-stream");
		Header("Accept-Ranges:bytes");
		Header("Content-type:application/vnd.ms-excel");
		Header("Content-Disposition:attachment;filename=预约客户.xls");
		$UdfCrm = M("udf_crm");
		$where['blxm'] = array( array('like', '%微信%'), array('like', '%互联%'), 'or');
		$where['status'] = 4;
		$rs = $UdfCrm -> where($where) -> select();
		Vendor('Excel.PHPExcel');
		//导入thinkphp第三方类库
		$objPHPExcel = new \PHPExcel();
		$i = 1;
		$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue("A$i", '接入号') -> setCellValue("B$i", '公司名称') -> setCellValue("C$i", '公司地址') -> setCellValue("D$i", '办理项目') -> setCellValue("E$i", '合同编号') -> setCellValue("F$i", '联系人') -> setCellValue("G$i", '联系电话') -> setCellValue("H$i", '扣费电话') -> setCellValue("I$i", '到期时间') -> setCellValue("J$i", '销售员') -> setCellValue("K$i", '金额') -> setCellValue("L$i", '实占款') -> setCellValue("M$i", '付款方式') -> setCellValue("N$i", '备注') -> setCellValue("O$i", '预约期限') -> setCellValue("P$i", '状态') -> setCellValue("Q$i", 'ID');
		foreach ($rs as $val) {
			$i++;
			$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue("A$i", $val["jieru_id"]) -> setCellValue("B$i", $val["name"]) -> setCellValue("C$i", $val["address"]) -> setCellValue("D$i", $val["blxm"]) -> setCellValue("E$i", $val["htid"]) -> setCellValue("F$i", $val["lxuser"]) -> setCellValue("G$i", $val["lxtel"]) -> setCellValue("H$i", $val["kfter"]) -> setCellValue("I$i", $val["exprice_time"]) -> setCellValue("J$i", $val["selluser"]) -> setCellValue("K$i", $val["price"]) -> setCellValue("L$i", $val["sprice"]) -> setCellValue("M$i", $val["kftype"]) -> setCellValue("N$i", $val["memo"]) -> setCellValue("O$i", $val["yy_time"]) -> setCellValue("P$i", $val["status"]) -> setCellValue("Q$i", $val["id"]);
		}
		//$objPHPExcel -> getActiveSheet() -> setTitle('Customer');
		$objPHPExcel -> setActiveSheetIndex(0);
		$objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
		$objWriter -> save('php://output');
		exit ;
	}

	//---------------------------------------------------------------------------------------
	//一般客户资料
	public function index() {
		$DataAll = M('udf_crm');
		$where = $this -> _search($DataAll);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$where['blxm'] = array( array('eq', '一般客户'), array('like', '%拆机%'), 'or');
		$this -> _list($DataAll, $where, 'id desc');

		$this -> display();

	}

	public function yb_index() {
		$DataAll = M('udf_crm');
		$where = $this -> _search($DataAll);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$where['blxm'] = '一般客户';
		$this -> _list($DataAll, $where, 'id desc');

		$this -> display();

	}

	//拆机
	public function chaiji_index() {
		$DataAll = M('udf_crm');
		$where = $this -> _search($DataAll);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$where['blxm'] = array('like', '%拆机%');
		$this -> _list($DataAll, $where, 'id desc');

		$this -> display();

	}

	//一般预约
	public function index_yuyue() {
		$DataAll = M('udf_crm');
		$where = $this -> _search($DataAll);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}
		$where['blxm'] = array( array('eq', '一般客户'), array('like', '%拆机%'), 'or');
		$where['status'] = 4;
		$this -> _list($DataAll, $where, 'id desc');
		$this -> display();

	}

	//一般客户预约导出
	public function index_export() {
		Header("Content-type:application/octet-stream");
		Header("Accept-Ranges:bytes");
		Header("Content-type:application/vnd.ms-excel");
		Header("Content-Disposition:attachment;filename=预约客户.xls");
		$UdfCrm = M("udf_crm");
		$where['blxm'] = array( array('eq', '一般用户'), array('like', '%拆机%'), 'or');
		$where['status'] = 4;
		$rs = $UdfCrm -> where($where) -> select();
		Vendor('Excel.PHPExcel');
		//导入thinkphp第三方类库
		$objPHPExcel = new \PHPExcel();
		$i = 1;
		$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue("A$i", '接入号') -> setCellValue("B$i", '公司名称') -> setCellValue("C$i", '公司地址') -> setCellValue("D$i", '办理项目') -> setCellValue("E$i", '合同编号') -> setCellValue("F$i", '联系人') -> setCellValue("G$i", '联系电话') -> setCellValue("H$i", '扣费电话') -> setCellValue("I$i", '到期时间') -> setCellValue("J$i", '销售员') -> setCellValue("K$i", '金额') -> setCellValue("L$i", '实占款') -> setCellValue("M$i", '付款方式') -> setCellValue("N$i", '备注') -> setCellValue("O$i", '预约期限') -> setCellValue("P$i", '状态') -> setCellValue("Q$i", 'ID');
		foreach ($rs as $val) {
			$i++;
			$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue("A$i", $val["jieru_id"]) -> setCellValue("B$i", $val["name"]) -> setCellValue("C$i", $val["address"]) -> setCellValue("D$i", $val["blxm"]) -> setCellValue("E$i", $val["htid"]) -> setCellValue("F$i", $val["lxuser"]) -> setCellValue("G$i", $val["lxtel"]) -> setCellValue("H$i", $val["kfter"]) -> setCellValue("I$i", $val["exprice_time"]) -> setCellValue("J$i", $val["selluser"]) -> setCellValue("K$i", $val["price"]) -> setCellValue("L$i", $val["sprice"]) -> setCellValue("M$i", $val["kftype"]) -> setCellValue("N$i", $val["memo"]) -> setCellValue("O$i", $val["yy_time"]) -> setCellValue("P$i", $val["status"]) -> setCellValue("Q$i", $val["id"]);
		}
		//$objPHPExcel -> getActiveSheet() -> setTitle('Customer');
		$objPHPExcel -> setActiveSheetIndex(0);
		$objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
		$objWriter -> save('php://output');
		exit ;

	}
	//一般客户到期导出

	public function index_export_dq() {
		Header("Content-type:application/octet-stream");
		Header("Accept-Ranges:bytes");
		Header("Content-type:application/vnd.ms-excel");
		Header("Content-Disposition:attachment;filename=预约客户.xls");
		$UdfCrm = M("udf_crm");
		$where['blxm'] = array( array('eq', '一般用户'), array('like', '%拆机%'), 'or');
		$where['status'] = 2;
		$rs = $UdfCrm -> where($where) -> select();
		Vendor('Excel.PHPExcel');
		//导入thinkphp第三方类库
		$objPHPExcel = new \PHPExcel();
		$i = 1;
		$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue("A$i", '接入号') -> setCellValue("B$i", '公司名称') -> setCellValue("C$i", '公司地址') -> setCellValue("D$i", '办理项目') -> setCellValue("E$i", '合同编号') -> setCellValue("F$i", '联系人') -> setCellValue("G$i", '联系电话') -> setCellValue("H$i", '扣费电话') -> setCellValue("I$i", '到期时间') -> setCellValue("J$i", '销售员') -> setCellValue("K$i", '金额') -> setCellValue("L$i", '实占款') -> setCellValue("M$i", '付款方式') -> setCellValue("N$i", '备注') -> setCellValue("O$i", '预约期限') -> setCellValue("P$i", '状态') -> setCellValue("Q$i", 'ID');
		foreach ($rs as $val) {
			$i++;
			$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue("A$i", $val["jieru_id"]) -> setCellValue("B$i", $val["name"]) -> setCellValue("C$i", $val["address"]) -> setCellValue("D$i", $val["blxm"]) -> setCellValue("E$i", $val["htid"]) -> setCellValue("F$i", $val["lxuser"]) -> setCellValue("G$i", $val["lxtel"]) -> setCellValue("H$i", $val["kfter"]) -> setCellValue("I$i", $val["exprice_time"]) -> setCellValue("J$i", $val["selluser"]) -> setCellValue("K$i", $val["price"]) -> setCellValue("L$i", $val["sprice"]) -> setCellValue("M$i", $val["kftype"]) -> setCellValue("N$i", $val["memo"]) -> setCellValue("O$i", $val["yy_time"]) -> setCellValue("P$i", $val["status"]) -> setCellValue("Q$i", $val["id"]);
		}
		//$objPHPExcel -> getActiveSheet() -> setTitle('Customer');
		$objPHPExcel -> setActiveSheetIndex(0);
		$objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
		$objWriter -> save('php://output');
		exit ;

}
	//---------------------------------------------------------------------------------------
	//公用方法
	//到期用户的导入

	//预约导入
	public function yuyue_import() {

		$this -> display();
	}

	public function yuyue_import_save() {
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
				$UdfCrm = M("udf_crm");
				for ($i = 2; $i <= count($sheetData); $i++) {

					$data = array();
					$data['jieru_id'] = $sheetData[$i]["A"];
					$data['name'] = $sheetData[$i]["B"];
					$data['address'] = $sheetData[$i]["C"];
					$data['blxm'] = $sheetData[$i]["D"];
					$data['htid'] = $sheetData[$i]["E"];
					$data['lxuser'] = $sheetData[$i]["F"];
					$data['lxtel'] = $sheetData[$i]["G"];
					$data['kftel'] = $sheetData[$i]["H"];
					$data['exprice_time'] = $sheetData[$i]["I"];
					$data['selluser'] = $sheetData[$i]["J"];
					$data['price'] = $sheetData[$i]["K"];
					$data['sprice'] = $sheetData[$i]["L"];
					$data['kftype'] = $sheetData[$i]["M"];
					$data['memo'] = $sheetData[$i]["N"];
					$data['yy_time'] = $sheetData[$i]["O"];
					$data['status'] = $sheetData[$i]["P"];
					$data['id'] = $sheetData[$i]["Q"];
					$data['jsmonth'] = $_POST['jsmonth'];
					$data['area'] = $_POST['area'];
					$id = $sheetData[$i]["Q"];
					$UdfCrm -> where("id = $id") -> save($data);
				}

				if (file_exists(__ROOT__ . "/" . $inputFileName)) {
					unlink(__ROOT__ . "/" . $inputFileName);
				}
				$this -> assign('jumpUrl', get_return_url());
				$this -> success('导入成功', U('index'));
			}
		} else {
			$this -> display();
		}

	}

	//预约
	public function yuyue_index() {

		$id = $_GET['id'];
		$_SESSION['id'] = $id;
		$plugin['uploader'] = true;
		$plugin['editor'] = true;
		$plugin['date'] = true;
		$this -> assign("plugin", $plugin);
		$this -> display();

	}

	//预约详情
	public function yuyue_xx() {
		$id = $_GET['id'];
		$DataAll = M('udf_crm');
		$rs = $DataAll -> where("id =$id") -> select();
		$this -> assign("list", $rs);
		$this -> display();

	}

	public function yuyue_gj() {
		$id = $_GET['id'];
		$yuyue = M('udf_crm_yuyue');
		$rs = $yuyue -> where("kehu_id =$id") -> order('id desc') -> select();
		$this -> assign("list", $rs);
		$this -> display();

	}

	//预约添加
	public function yuyue_add_save() {
		$id = $_SESSION['id'];

		$length = 10;
		$a = rand(pow(10, ($length - 1)), pow(10, $length) - 1);
		$yuyue = M('udf_crm_yuyue');
		$data['kehu_id'] = $id;
		$data['user_name'] = get_user_name();
		$data['user_id'] = get_user_id();
		$data['yy_time'] = $_POST['yy_time'];
		$data['blxm'] = $_POST['blxm'];
		$data['beizhu'] = $_POST['beizhu'];
		$rs = $yuyue -> add($data);
		//-----------------------

		if ($rs) {
			$DataAll = M('udf_crm');
			$kehu = $DataAll -> where("id = $id") -> select();
			if ($_POST['blxm'] == '实名查询') {
				$data['jieru_id'] = 'SMCX' . $a;
			} else if ($_POST['blxm'] == '优先报号') {
				$data['jieru_id'] = 'YXBH' . $a;
			} else if ($_POST['blxm'] == '加盟') {
				$data['jieru_id'] = 'JM' . $a;
			} else if ($_POST['blxm'] == '查询转接') {
				$data['jieru_id'] = 'CXZJ' . $a;
			} else if ($_POST['blxm'] == '企业名片') {
				$data['jieru_id'] = 'QYMP' . $a;
			} else if ($_POST['blxm'] == '企业总机') {
				$data['jieru_id'] = 'QYZJ' . $a;
			} else if ($_POST['blxm'] == '电子黄页') {
				$data['jieru_id'] = 'DZHY' . $a;
			} else if ($_POST['blxm'] == '东莞黄页') {
				$data['jieru_id'] = 'DGHY' . $a;
			} else if ($_POST['blxm'] == '微信') {
				$data['jieru_id'] = 'WX' . $a;
			} else if ($_POST['blxm'] == '一般客户') {
				$data['jieru_id'] = 'YBKH' . $a;
			} else {
				$data['jieru_id'] = 'HLWJZ' . $a;
			}

			$data['name'] = $kehu[0]['name'];
			$data['area'] = $kehu[0]['area'];
			$data['address'] = $kehu[0]['address'];
			$data['lxtel'] = $kehu[0]['lxtel'];
			$data['lxuser'] = $kehu[0]['lxuser'];
			$data['datatype'] = $kehu[0]['datatype'];
			$data['status'] = 4;
			//状态4 跟进中
			$data['expire_time'] = date('Y-m-d', strtotime('+1 year'));
			$data['tixing_time'] = date('Y-m-d', strtotime('+11 month'));
			$data['selluser'] = get_user_name();
			$data['inputuser'] = get_user_name();
			$data['inputtime'] = date('Y-m-d H:i:s', time());
			$data['seviceetime'] = '';
			$data['jxprice'] = '';
			$data['yprice'] = '';
			$data['yctc'] = '';
			$data['wctc'] = '';
			$data['delflag'] = '0';
			$data['jobidflag'] = '';
			$data['csjobid'] = '';
			$DataAll -> where("id = $id") -> add($data);
			$this -> success('添加成功,请关闭', U('yuyue_index'));
		}
	}

	//添加
	public function add() {
		$plugin['uploader'] = true;
		$plugin['editor'] = true;
		$plugin['date'] = true;
		$this -> assign("plugin", $plugin);
		$this -> display();

	}

	//添加客户资源
	public function add_save() {

		$DataAll = M('udf_crm');
		$rs = $DataAll -> create();
		if ($rs['kftype'] == "电话代扣") {
			$DataAll -> datatype = 'dh';

		} else if ($rs['kftype'] == "现金") {

			$DataAll -> datatype = 'xj';
		} else {
			$DataAll -> datatype = '';
		}
		$DataAll -> expire_time = date('Y-m-d', strtotime('+1 year'));
		$DataAll -> tixing_time = date('Y-m-d', strtotime('+11 month'));
		$DataAll -> seviceetime = '';
		$DataAll -> jxprice = '';
		$DataAll -> yprice = '';
		$DataAll -> yctc = '';
		$DataAll -> wctc = '';
		$DataAll -> inputuser = get_user_name();
		$DataAll -> inputtime = date("Y-m-d h:i:s", time());
		$DataAll -> delflag = '0';
		$DataAll -> status = '1';
		$DataAll -> jobidflag = '';
		$DataAll -> csjobid = '';
		$rs = $DataAll -> add();
		if ($rs) {
			$this -> success('添加成功', U('index'));

		}
	}

	//删除客户资源
	public function del() {
		$id = $_GET['id'];
		$user_id = get_user_id();
		$DataAll = M('udf_crm');
		$yuyue = M('udf_crm_yuyue');
		$rs = $DataAll -> where("id = '$id'") -> delete();
		if ($rs) {
			$yuyue -> where("user_id = $user_id") -> delete();
			$this -> success('删除成功', U('index'));
		}
	}

	//修改客户资源
	public function updata() {
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
	public function updata_save() {
		$DataAll = M('udf_crm');
		$id = $_GET['id'];
		$DataAll -> create();
		$rs = $DataAll -> where("id = '$id'") -> save();
		if ($rs) {
			$this -> success('修改成功', U('index'));
		}
	}

	//查看详细客户资源
	public function kehu_xx() {
		$DataAll = M('udf_crm');
		$id = $_GET['id'];
		$rs = $DataAll -> where("id = '$id'") -> select();
		$this -> assign('list', $rs);
		$this -> display();
	}

	//批量导入
	public function import() {
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
				$UdfCrm = M("udf_crm");
				for ($i = 2; $i <= count($sheetData); $i++) {

					$data = array();
					$data['stime'] = $sheetData[$i]["A"];
					$data['etime'] = $sheetData[$i]["B"];
					$data['htid'] = $sheetData[$i]["C"];
					$data['name'] = $sheetData[$i]["D"];
					$data['address'] = $sheetData[$i]["E"];
					$data['lxuser'] = $sheetData[$i]["F"];
					$data['kftel'] = $sheetData[$i]["G"];
					$data['lxtel'] = $sheetData[$i]["H"];
					$data['blxm'] = $sheetData[$i]["I"];
					$data['selluser'] = $sheetData[$i]["J"];
					$data['price'] = $sheetData[$i]["K"];
					$data['sprice'] = $sheetData[$i]["L"];
					$data['kftype'] = $sheetData[$i]["M"];
					$data['memo'] = $sheetData[$i]["N"];
					$data['area'] = $_POST['area'];
					$data['jsmonth'] = $_POST['jsmonth'];

					$UdfCrm -> add($data);
				}

				if (file_exists(__ROOT__ . "/" . $inputFileName)) {
					unlink(__ROOT__ . "/" . $inputFileName);
				}
				$this -> assign('jumpUrl', get_return_url());
				$this -> success('导入成功', U('index'));
			}
		} else {
			$this -> display();
		}

	}

	//批量导出
	public function export() {

		$UdfCrm = M("udf_crm");
		$where = $_SESSION['where'];
		$r = $UdfCrm -> where($where) -> count();
		Vendor('Excel.PHPExcel');
		//导入thinkphp第三方类库

		// $inputFileName = "Public/templete/customer.xlsx";
		// $objPHPExcel = PHPExcel_IOFactory::load($inputFileName);
		$objPHPExcel = new \PHPExcel();
		if ($r < 1) {
			$i = 1;
			$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue("A$i", '交单日期') -> setCellValue("B$i", '扣费日期') -> setCellValue("C$i", '编号') -> setCellValue("D$i", '公司名称') -> setCellValue("E$i", '地址') -> setCellValue("F$i", '联系人') -> setCellValue("G$i", '电话代扣') -> setCellValue("H$i", '联系电话') -> setCellValue("I$i", '办理项目') -> setCellValue("J$i", '销售员') -> setCellValue("K$i", '金额') -> setCellValue("L$i", '实占款') -> setCellValue("M$i", '付款方式') -> setCellValue("N$i", '备注') -> setCellValue("O$i", '业务类型') -> setCellValue("P$i", '区域');
			// Add some data

			//dump($list);
			foreach ($list as $val) {
				$i++;
				$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue("A$i", $val["stime"]) -> setCellValue("B$i", $val["etime"]) -> setCellValue("C$i", $val["htid"]) -> setCellValue("D$i", $val["name"]) -> setCellValue("E$i", $val["address"]) -> setCellValue("F$i", $val["lxuser"]) -> setCellValue("G$i", $val["kftel"]) -> setCellValue("H$i", $val["lxter"]) -> setCellValue("I$i", $val["blxm"]) -> setCellValue("J$i", $val["datatype"]) -> setCellValue("K$i", $val["price"]) -> setCellValue("L$i", $val["sprice"]) -> setCellValue("M$i", $val["kftype"]) -> setCellValue("N$i", $val["memo"]) -> setCellValue("O$i", '个人类') -> setCellValue("P$i", $val["area"]);
			}
			// Rename worksheet
			$objPHPExcel -> getActiveSheet() -> setTitle('Customer');

			// Set active sheet index to the first sheet, so Excel opens this as the first sheet
			$objPHPExcel -> setActiveSheetIndex(0);

			$file_name = "ywimport.xls";
			// Redirect output to a client’s web browser (Excel2007);
			// header("Content-Type: application/force-download");
			// header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
			// header("Content-Disposition:attachment;filename =" . str_ireplace('+', '%20', URLEncode($file_name)));
			// header('Cache-Control: max-age=0');

			$objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
			$objWriter -> save('php://output');
			exit ;
		} else {
			$name = 'aaa';
			$tmpfile = tempnam(sys_get_temp_dir(), $name);

			$title = array('交单日期', '扣费日期', '编号', '公司名称', '地址', '联系人', '联系人(代理)', '电话代扣', '联系电话', '办理项目', '销售员', '金额', '实占款', '付费方式', '备注');
			foreach ($title as $i => $v) {
				// CSV的Excel支持GBK编码，一定要转换，否则乱码
				$title[$i] = iconv('utf-8', 'gbk', $v);
			}
			$fp = fopen($tmpfile, 'a');
			fputcsv($fp, $title);
			fclose($fp);
			for ($i = 0; $i <= $r; $i += 500) {

				$list = $UdfCrm -> field('stime,etime,htid,name,address,lxuser,selluser,kftel,lxtel,blxm,datatype,price,sprice,kftype,memo,area') -> where($where) -> limit($i, 500) -> select();

				$fp = fopen($tmpfile, 'a');
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
					foreach ($row as $k => $v) {
						// CSV的Excel支持GBK编码，一定要转换，否则乱码
						$row[$k] = iconv('utf-8', 'gbk', $v);
					}
					fputcsv($fp, $row);
				}
				fclose($fp);
			}
			rename("$tmpfile", sys_get_temp_dir() . "\kehu.csv");
			$newname = sys_get_temp_dir() . "\kehu.csv";
			$newname_1 = str_replace('\\', '/', $newname);
			$rs = $this -> zip("$newname_1", "./Uploads/Zip/");
			if ($rs) {
				redirect("./Uploads/Zip/" . $rs);
				//$this -> r('导出成功', "./Uploads/Zip/".$rs);

			}
		}
	}

	public function allexport() {

		$UdfCrm = M("udf_crm");
		$r = $UdfCrm -> count();
		Vendor('Excel.PHPExcel');
		//导入thinkphp第三方类库
		$objPHPExcel = new \PHPExcel();

		$name = 'aaa';
		$tmpfile = tempnam(sys_get_temp_dir(), $name);

		$title = array('交单日期', '扣费日期', '编号', '公司名称', '地址', '联系人', '联系人(代理)', '电话代扣', '联系电话', '办理项目', '销售员', '金额', '实占款', '付费方式', '备注');
		foreach ($title as $i => $v) {
			// CSV的Excel支持GBK编码，一定要转换，否则乱码
			$title[$i] = iconv('utf-8', 'gbk', $v);
		}

		$fp = fopen($tmpfile, 'a');
		fputcsv($fp, $title);
		fclose($fp);

		for ($i = 0; $i <= $r; $i += 1000) {

			// $sql ="select stime,etime,htid,name,address,lxuser,selluser,kftel,lxtel,blxm,datatype,price,sprice,kftype,memo,area from think_udf_crm limit $i,1000";
			// $list = mysql_query($sql);

			$list = $UdfCrm -> field('stime,etime,htid,name,address,lxuser,selluser,kftel,lxtel,blxm,datatype,price,sprice,kftype,memo,area') -> limit($i, 1000) -> select();

			$fp = fopen($tmpfile, 'a');
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
				foreach ($row as $k => $v) {
					// CSV的Excel支持GBK编码，一定要转换，否则乱码
					$row[$k] = iconv('utf-8', 'gbk', $v);
				}
				fputcsv($fp, $row);
				unset($list);
				unset($val);
				unset($r1);
				unset($row);
			}
			fclose($fp);
			unset($list);
			unset($val);
			unset($r1);
			unset($row);

		}

		rename("$tmpfile", dirname(__FILE__) . "\kehu.csv");
		$newname = dirname(__FILE__) . "\kehu.csv";
		echo $newname;
		echo "</br>";
		$newname_1 = str_replace('\\', '/', $newname);
		echo $newname_1;
		// $rs = $this -> zip("$newname_1", "./Uploads/Zip/");
		// if ($rs) {
		// redirect("./Uploads/Zip/" . $rs);
		// //$this -> r('导出成功', "./Uploads/Zip/".$rs);
		//
		// }
	}

	function zip($path, $savedir) {
		$path = preg_replace('/\/$/', '', $path);
		preg_match('/\/([\d\D][^\/]*)$/', $path, $matches, PREG_OFFSET_CAPTURE);
		$filename = $matches[1][0] . ".zip";
		set_time_limit(0);
		$zip = new \ZipArchive();
		$zip -> open($savedir . '/' . $filename, \ZIPARCHIVE::OVERWRITE);
		if (is_file($path)) {
			$path = preg_replace('/\/\//', '/', $path);
			$base_dir = preg_replace('/\/[\d\D][^\/]*$/', '/', $path);
			$base_dir = addcslashes($base_dir, '/:');
			$localname = preg_replace('/' . $base_dir . '/', '', $path);
			$zip -> addFile($path, $localname);
			$zip -> close();
			return $filename;
		} elseif (is_dir($path)) {
			$path = preg_replace('/\/[\d\D][^\/]*$/', '', $path);
			$base_dir = $path . '/';
			//基目录
			$base_dir = addcslashes($base_dir, '/:');
		}
		$path = preg_replace('/\/\//', '/', $path);
		function addItem($path, &$zip, &$base_dir) {
			$handle = opendir($path);
			while (false !== ($file = readdir($handle))) {
				if (($file != '.') && ($file != '..')) {
					$ipath = $path . '/' . $file;
					if (is_file($ipath)) {//条目是文件
						$localname = preg_replace('/' . $base_dir . '/', '', $ipath);
						var_dump($localname);
						$zip -> addFile($ipath, $localname);
					} else if (is_dir($ipath)) {
						addItem($ipath, $zip, $base_dir);
						$localname = preg_replace('/' . $base_dir . '/', '', $ipath);
						var_dump($localname);
						$zip -> addEmptyDir($localname);
					}
				}
			}
		}

		addItem($path, $zip, $base_dir);
		$zip -> close();
		return $filename;
	}

}
?>
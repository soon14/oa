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

class  ZhoujhModel extends CommonModel {
	//添加周计划
	function add($title, $kehu_name, $mudi, $time, $zhou) {
		$sql = 'INSERT INTO ' . $this -> tablePrefix . "zhoujh (title,kehu_name,mudi,time,jindu,zhou) values('$title','$kehu_name','$mudi','$time',0,'$zhou')";
		$rs = $this -> execute($sql);

		if ($rs) {
			return TRUE;
		}

	}

	//查看周计划
	function select() {
		$sql = 'select * from ' . $this -> tablePrefix . 'zhoujh';
		$rs = $this -> query($sql);
		if ($rs) {

			return $rs;
		}

	}

	//查看第一周计划
	function week1() {
		$sql = 'select * from ' . $this -> tablePrefix . "zhoujh where zhou='第一周'";
		$rs = $this -> query($sql);
		if ($rs) {

			return $rs;
		}
	}
	//查看详细计划
	function weekxx($id){
		
		$sql ='select * from ' . $this -> tablePrefix."zhoujh where id = '$id'";
		$rs = $this -> query($sql);
		if ($rs) {

			return $rs;
		}
	}
	//删除计划
	function del($id){
			
		$sql ='delete  from ' . $this -> tablePrefix."zhoujh where id = '$id'";

		$rs = $this -> execute($sql);
		if ($rs) {

			return true;
		}
		
	}
}

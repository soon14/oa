<?php
/*--------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/xiaowei
 --------------------------------------------------------------*/
namespace Home\Controller;

class ZhoujhController extends HomeController {
	
	
	//跳转到周计划添加页面	
	public function tzadd(){
	
		$this->display();
	}
	//添加操作
	public function add(){
		$zhoujh = D('Zhoujh');
		$title = $_POST['title'];
		
		$kehu_name = $_POST['kehu_name'];
		
		$mudi = $_POST['mudi'];
		
		$time = $_POST['time'];
		
		$zhou = $_POST['zhou'];
		$rs = $zhoujh ->add($title,$kehu_name,$mudi,$time,$zhou);
		
		if($rs){
			 $this->success('操作成功',U('Zhoujh/select'),3); 
			
		}
	}
	//周计划列表
	
	public function select(){
		$zhoujh = D('Zhoujh');
		$rs = $zhoujh -> select();
		$this->assign('list',$rs);
		$this->display();
		
	}
	//查看第N周计划
	public function week1(){
		$zhoujh = D('Zhoujh');
		
		$rs = $zhoujh -> week1();
		$this->assign('list',$rs);
		$this->display();
	}
	//查看详细计划
	public function weekxx(){
		
		$id   = $_GET["id"]; 
		$zhoujh = D('Zhoujh');
		$rs = $zhoujh -> weekxx($id);
		$this->assign('list',$rs);
		$this->display();
	}
	//删除计划
	public function del(){
		
		$id   = $_GET["id"]; 
		$zhoujh = D('Zhoujh');
		$rs = $zhoujh -> del($id);
		if($rs){
			 $this->success('操作成功',U('Zhoujh/select'),3); 
			
		}
		
	}
	//签到
	public function qiandao(){
		$this->display();
	}
}
	
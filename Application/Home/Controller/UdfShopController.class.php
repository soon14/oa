<?php
/*--------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/xiaowei
 --------------------------------------------------------------*/

namespace Home\Controller;

class UdfShopController extends HomeController {

	protected $config = array('app_type' => 'master');

	public function index() {

		$node = M("UdfShop");
		$menu = array();
		$menu = $node -> field('id,pid,name,is_del,shop_no') -> order('sort asc') -> select();
		
		$tree = list_to_tree($menu);
		$this -> assign('menu', popup_tree_menu($tree));
		
		$model = M("UdfShop");
		$list = $model -> order('sort asc') -> getField('id,name');
		$this -> assign('dept_list', $list);

		$this -> display();
	}

	public function add() {
		$this -> display();
	}

	public function del($id) {
		$this -> _destory($id);
	}

	public function winpop() {
		$node = M("UdfShop");
		$menu = array();
		$menu = $node -> where('is_del=0') -> field('id,pid,name') -> order('sort asc') -> select();

		$tree = list_to_tree($menu);
		$this -> assign('menu', popup_tree_menu($tree));
		$pid = array();
		$this -> assign('pid', $pid);
		$this -> display();
	}

	public function winpop2() {
		$this -> winpop();
	}

}
?>
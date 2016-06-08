<?php
/*--------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/xiaowei
 --------------------------------------------------------------*/

namespace Home\Controller;

class SystemWeixinController extends HomeController {

	protected $config = array('app_type' => 'master');

	public function index() {

		$node = M("SystemWeixin");

		$list = $node -> where('pid=0') -> order('sort asc') -> getField('id,name');
		$this -> assign('groupList', $list);

		$node = M("SystemWeixin");
		$menu = array();
		$menu = $node -> field('id,pid,name') -> order('sort ASC') -> select();

		$tree = list_to_tree($menu);

		$this -> assign('menu', popup_tree_menu($tree));

		$model = M("SystemWeixin");
		$list = $model -> order('sort asc') -> getField('id,name');
		$this -> assign('system_config_list', $list);

		$model = M("DeptGrade");
		$list = $model -> where('is_del=0') -> order('sort asc') -> getField('id,name');
		$this -> assign('dept_grade_list', $list);

		$this -> display();
	}

	public function del($id) {
		$where['id'] = $id;
		M("SystemWeixin") -> where($where) -> delete();
		$this -> success('删除成功！');

	}

	public function winpop() {
		$node = M("SystemWeixin");
		$menu = array();
		$menu = $node -> field('id,pid,name') -> order('sort asc') -> select();

		$tree = list_to_tree($menu);
	
		$this -> assign('menu', popup_tree_menu($tree));

		$this -> display();
	}

	public function from_add() {$model = M('SystemWeixin');

		$data['name'] = $_POST['name'];
		$data['url'] = $_POST['url'];
		$data['key'] = $_POST['key'];
		$data['type'] = $_POST['type'];
		$data['pid'] = $_POST['pid'];
		$data['sort'] = $_POST['sort'];
		$model -> add($data);
		$this -> success('新增成功！');
	}

	public function winpop2() {
		$this -> winpop();
	}

	public function menu_save() {
		$model = M('SystemWeixin');
		$data['name'] = $_POST['name'];
		$data['url'] = $_POST['url'];
		$data['key'] = $_POST['key'];
		$data['type'] = $_POST['type'];
		$data['pid'] = $_POST['pid'];
		$data['sort'] = $_POST['sort'];
		$where['id'] = $_POST['id'];
		$model -> where($where) -> save($data);
		$this -> success('保存成功！');
	}

	public function menuCreate() {

		$node = M("SystemWeixin");
		$menu = array();
		$menu = $node -> field('id,pid,name,url,key,type') -> order('sort ASC') -> select();
		$tree = $this->create_tree($menu);
       // $tree = array('button' => $tree);
		dump($tree);
        
	}

	public function create_tree($list, $root = 0,$pk = 'id', $pid = 'pid', $child = 'sub_button') {
		// 创建Tree
		$tree = array();
		if (is_array($list)) {
			// 创建基于主键的数组引用

			$refer = array();
			foreach ($list as $key => $data) {
				$refer[$data[$pk]] = &$list[$key];
			}

			foreach ($list as $key => $data) {
				// 判断是否存在parent
				$parentId = 0;
				if (isset($data[$pid])) {
					$parentId = $data[$pid];
				}
				if ((string)$root == $parentId) {
					$tree[] = &$list[$key];
				} else {
					if (isset($refer[$parentId])) {
						$parent = &$refer[$parentId];
						$parent[$child][] = &$list[$key];
					}
				}
			}
		}
		return $tree;
	}

}
?>
<?php
/*--------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/xiaowei
 --------------------------------------------------------------*/

namespace Home\Controller;

class WebChatController extends HomeController {
	protected $config = array('app_type' => 'public');

	//过滤查询字段
	function _search_filter(&$map) {
		$map['is_del'] = array('eq', '0');
		$keyword = I('keyword');
		if (!empty($keyword) && empty($map['64'])) {
			$map['name'] = array('like', "%" . $keyword . "%");
		}
	}

	public function index() {
		$this -> assign('user_id', get_user_id());
		$this -> display();
	}

}

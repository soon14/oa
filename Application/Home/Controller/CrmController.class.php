<?php
/*
 * -------------------------------------------------------------------- 小微OA系统 - 让工作更轻松快乐 Copyright (c) 2013 http://www.smeoa.com All rights reserved. Author: jinzhu.yin<smeoa@qq.com> Support: https://git.oschina.net/smeoa/xiaowei --------------------------------------------------------------------
 */
namespace Home\Controller;

class CrmController extends HomeController {
	protected $config = array('app_type' => 'public');
	// 过滤查询字段
	function _search_filter(&$map) {
		$map['is_del'] = array('eq', '0');
		$keyword = I('keyword');
		if (!empty($keyword) && empty($map['name'])) {
			$map['name'] = array('like', "%" . $keyword . "%");
		}
	}

	// 首页跳转
	public function index() {
		$this -> redirect('contact');
	}

	// 公司管理
	public function company() {
		$model = M('crm_company');
		$map = $this -> _search($model);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($map);
		}
		$this -> assign($model);
		$this -> _list($model, $map);
		$this -> classify_company();
		$this -> display();
	}

	// 客户管理
	public function contact() {
		$model = D('CrmContactView');
		$list = $model -> select();
		$map = $this -> _search($model);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($map);
		}
		$map['salesman_id'] = array('eq', get_user_id());
		$this -> assign($list);
		$this -> _list($model, $map);
		$this -> display();
	}

	// 添加公司
	public function add_company() {
		$plugin['uploader'] = true;
		$plugin['date'] = true;
		$plugin['editor'] = true;		
		$this -> assign("plugin", $plugin);
		
		$model_flow_field = D("UdfField");
		$field_list = $model_flow_field -> get_field_list(1);
		$this -> assign("field_list", $field_list);
		
		$this -> display();
	}

	// 添加客户
	public function add_contact() {
		$plugin['date'] = true;
		$plugin['editor'] = true;
		$this -> assign("plugin", $plugin);
		$model_flow_field = D("UdfField");

		$user['user_id'] = get_user_id();
		$user['user_name'] = get_user_name();
		$this -> assign('user', $user);

		$field_list = $model_flow_field -> get_field_list(2);
		$this -> assign("field_list", $field_list);
 		
		$map['is_del'] = array('eq', '0');
		$list = D("ProductView") -> where($map) -> select();
		
		foreach ($list as $Key => $val) {
			$product[$val['folder_name']][] = $val['name'];
		}
		
		$this -> assign('product', $product);
		$this -> display();
	}

	// 保存公司
	public function save_company() {
		$this -> _save('crm_company');

	}

	// 保存客户
	public function save_contact() {
		$this -> _save('crm_contact');
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

	// 编辑客户
	public function edit_contact($id) {
		$plugin['uploader'] = true;
		$plugin['date'] = true;
		$plugin['editor'] = true;
		$this -> assign("plugin", $plugin);

		$model = M("crm_contact");
		$vo = $model -> find($id);
		$company_id = $vo['company_id'];
		$company = M('crm_company') -> where('id=' . $company_id) -> select();
		$this -> assign('company', $company);

		if (empty($vo)) {
			$this -> error("系统错误");
		}
		$this -> assign("vo", $vo);

		$field_list = D("UdfField") -> get_data_list($vo['udf_data']);
		$this -> assign("field_list", $field_list);

		$map['is_del'] = array('eq', '0');
		$list = D("ProductView") -> where($map) -> select();
		foreach ($list as $Key => $val) {
			$product[$val['folder_name']][] = $val['name'];
		}

		$this -> assign('product', $product);
		$this -> display();
	}

	// 删除公司
	public function del_company($company_id) {
		$this -> _del($company_id, "crm_company");
	}

	// 删除客户
	public function del_contact($contact_id) {
		$this -> _del($contact_id, "crm_contact");
	}

	// 公司筛选
	public function classify_company() {
		$classify_list = D('crm_company');
		$data = $classify_list -> where("is_del=0") -> select();
		$this -> assign('data', $data);
	}

	function folder_manage() {
		$this -> _system_folder_manage('CRM管理', true);
	}

	function company_field_manage() {
		$this -> assign("folder_name", "CRM 公司自定义字段管理");
		$this -> _field_manage(1);
	}

	function contact_field_manage() {
		$this -> assign("folder_name", "CRM 客户自定义字段管理");
		$this -> _field_manage(2);
	}

	// 信访管理
	function activity($id) {
		$plugin['date'] = true;
		$plugin['editor'] = true;
		$plugin['uploader'] = true;
		$this -> assign("plugin", $plugin);
		$model = M("crm_contact");
		$vo = $model -> find($id);

		$company_id = $vo['company_id'];
		$company = M('crm_company') -> where('id=' . $company_id) -> select();
		$this -> assign('company', $company);
		if (empty($vo)) {
			$this -> error("系统错误");
		}
		$this -> assign("vo", $vo);
		$field_list = D("UdfField") -> get_data_list($vo['udf_data']);
		$this -> assign("field_list", $field_list);
		// 信访记录
		$this -> visit_record($id);
		$this -> display();
	}

	// 信访记录
	function visit_record($id) {
		$list = M('crm_activity');
		$this -> assign($list);
		$this -> _list($list, 'is_del=0 and contact_id=' . $id);
	}

	// 选择公司
	public function select_company() {
		$list = M('crm_company') -> where('is_del=0') -> select();
		$this -> assign('list', $list);
		$this -> display();
	}

	// 添加信访记录
	// public function add_activity($id){
	// $plugin['uploader'] = true;
	// $this -> assign("plugin", $plugin);
	// $this->assign('id',$id);
	// $this->display();
	// }
	// 保存信访记录
	function save_activity() {
		$this -> _save('crm_activity');
	}

	// 删除信访记录
	function del_activity($id) {
		$this -> _del($id, 'crm_activity');
	}

	public function select_salesman() {
		$user_list = D("UserView") -> select();
		$this -> assign("user_list", $user_list);
		$this -> display();
	}

	// 分享客户
	public function add_share() {
		$contact = D('CrmContactView');
		$contact_list = $contact -> where('CrmContact.is_del=0') -> select();
		$this -> assign('contact_list', $contact_list);
		$user = D("UserView") -> select();
		$this -> assign('user_list', $user);
		$this -> display();
	}

	// 保存分享
	public function save_share($contact_id, $user_id) {
		if (get_user_id() == $user_id) {
			$this -> error('不能分享给自己！');
		}
		$model = D("crm_share");
		$result = $model -> set_share($contact_id, $user_id);
		if ($result === false) {
			$this -> error('操作失败！');
		} else {
			$this -> success('分享成功！');
		}
	}

	// 被分享的客户页面
	public function share_contact() {
		$where_contact_list['user_id'] = array('eq', get_user_id());
		$contact_list = M("CrmShare") -> where($where_contact_list) -> getField('contact_id', true);
		$model = D("CrmContactView");
		$map = $this -> _search($model);
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($map);
		}
		if (!empty($contact_list)) {
			$map['id'] = array('in', $contact_list);
		} else {
			$map = '1=2';
		}
		$this -> _list($model, $map);

		$this -> display();
	}

	//转移客户
	public function add_shift() {
		$contact = D('CrmContactView');
		$map['is_del'] = 0;
		$map['salesman_id'] = get_user_id();
		$contact_list = $contact -> where($map) -> select();
		$this -> assign('contact_list', $contact_list);
		$user = D("UserView") -> select();
		$this -> assign('user_list', $user);
		$this -> display();
	}

	//保存转移客户
	public function save_shift($contact_id, $user_id) {
		$model = M('crm_contact');
		$data['salesman_name'] = get_user_name($user_id[0]);
		$data['salesman_id'] = $user_id[0];
		$map['id'] = array('in', $contact_id);
		$model -> where($map) -> save($data);
		if ($model == false) {
			$this -> error('操作失败！');
		} else {
			$this -> success('操作成功！');
		}
	}

	/**
	 * 插入新新数据 *
	 */
	protected function _insert($name = CONTROLLER_NAME) {
		$model = D($name);
		if (false === $model -> create()) {
			$this -> error($model -> getError());
		}
		$li = D('UdfField');
		$asd = D('UdfField') -> get_field_data();
		$model -> udf_data = D('UdfField') -> get_field_data();

		$list = $model -> add();

		if ($list !== false) {// 保存成功
			// $flow_filed = D("UdfField") -> set_field($list);
			$this -> assign('jumpUrl', get_return_url());
			$this -> success('新增成功!');
		} else {
			$this -> error('新增失败!');
			// 失败提示
		}
	}

	/* 更新数据  */
	protected function _update($name = CONTROLLER_NAME) {
		$model = D($name);
		if (false === $model -> create()) {
			$this -> error($model -> getError());
		}
		$flow_id = $model -> id;
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

	public function upload() {
		$this -> _upload();
	}

	function down($attach_id) {
		$this -> _down($attach_id);
	}

}

<?php
/*---------------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/xiaowei
 -------------------------------------------------------------------------*/

namespace Weixin\Controller;

class SignController extends WeixinController {

	protected $config = array('app_type' => 'public');

	function _initialize() {
		$agent_id = get_system_config("sign_agent_id");
		if (empty($agent_id)) {
			$this -> error('没有找到SIGN_AGENT_ID');
		}
		$this -> agent_id = $agent_id;
		import("@.ORG.Util.Weixin");
		$this -> weixin = new \Weixin();
	}

	public function set_menu() {

		$sub = array();
		$data = array();
		$subs = array();

		$corpid = get_system_config("weixin_corp_id");
		$site_url = get_system_config("weixin_site_url");

		$redirect_uri = urlencode($site_url . U('Weixin/Sign/add'));

		$sign_in_url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=$corpid&redirect_uri={$redirect_uri}&response_type=code&scope=snsapi_base&state=sign_in#wechat_redirect";

		$sign_out_url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=$corpid&redirect_uri={$redirect_uri}&response_type=code&scope=snsapi_base&state=sign_out#wechat_redirect";

		$outside_url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=$corpid&redirect_uri={$redirect_uri}&response_type=code&scope=snsapi_base&state=outside#wechat_redirect";

		$sub1 = array('type' => 'view', 'name' => '签到', 'url' => $sign_in_url);
		$sub2 = array('type' => 'view', 'name' => '签退', 'url' => $sign_out_url);
		$sub3 = array('type' => 'view', 'name' => '外勤', 'url' => $outside_url);

		$data['button'][] = $sub1;
		$data['button'][] = $sub2;
		$data['button'][] = $sub3;

		$data = json_encode($data, JSON_UNESCAPED_UNICODE);
		$this -> _set_menu($data);
	}
		
	public function index() {

		/* 获取请求信息 */
		$data = $this -> weixin -> request();
		/* 获取回复信息 */
		list($content, $type) = $this -> reply($data);
		/* 响应当前请求 */
		$this -> weixin -> response($content, $type);
	}

	function add() {
		if (IS_POST) {
			$data['type'] = I('state');
			$data['ip'] = getenv('REMOTE_ADDR');
			$data['emp_no'] = get_emp_no();
			$data['user_id'] = get_user_id();
			$data['create_time'] = time();
			$data['latitude'] = I('lat');
			$data['longitude'] = I('lng');
			$data['is_real_time'] = 0;
			$data['sign_date'] = to_date(time());
			$data['location'] = I('location');
			$data['content'] = I('content');
			
			$result = M('Sign') -> add($data);
			$state = I('state');
			switch ($state) {
				case 'sign_in' :
					$sign_type = '签到';
					break;
				case 'sign_out' :
					$sign_type = '签退';
					break;
				case 'outside' :
					$sign_type = '外勤';
					break;
				default :
					break;
			}

			$return['info'] = "{$sign_type}成功";
			$return['status'] = 1;
			$return['time'] = $data['sign_date'];
			$this -> ajaxReturn($return);
		}

		vendor('WeiXin.jssdk');
		$corp_id = get_system_config('weixin_corp_id');
		$secret = get_system_config('weixin_secret');
		$jssdk = new \JSSDK($corp_id, $secret);
		$signPackage = $jssdk -> GetSignPackage();

		$this -> assign('signPackage', $signPackage);
		$this -> assign('is_weixin', is_weixin());

		$state = I('state');
		$this -> assign('state', $state);

		$this -> display();
	}

	/**
	 * 定制响应信息
	 * @param array $data 接收的数据
	 * @return array; 响应的数据
	 */
	private function reply($data) {
		// 消息类型
		switch ($data ['MsgType']) {
			case 'event' :
				// 类型是事件的
				// 事件类型
				switch ($data ['Event']) {
					case 'LOCATION' :
						// 上报地理位置事件
						$reply = $this -> record_location($data);
						break;
				}

				break;
			default :
				$reply = array('没有相关消息类型', 'text');
				break;
		}
		return $reply;
	}
	
	function save(){
			$emp_no = I('emp_no');
			$where['emp_no'] = array('eq', $emp_no);
			$user_id = M('User') -> where($where) -> getField('id');

			$data['type'] = I('state');
			$data['ip'] = getenv('REMOTE_ADDR');
			$data['emp_no'] = $emp_no;
			$data['user_id'] = $user_id;
			$data['create_time'] = time();
			$data['latitude'] = I('lat');
			$data['longitude'] = I('lng');
			$data['is_real_time'] = 0;
			$data['sign_date'] = to_date(time());
			$data['location'] = get_location($data['latitude'], $data['longitude']);
			$data['content']=I('content');
			
			$result = M('Sign') -> add($data);
			$state = I('state');
			switch ($state) {
				case 'sign_in' :
					$sign_type = '签到';
					break;
				case 'sign_out' :
					$sign_type = '签退';
					break;
				case 'outside' :
					$sign_type = '外勤';
					break;
				default :
					break;
			}

			$return['info'] = "{$sign_type}成功";
			$return['status'] = 1;
			$return['time'] = $data['sign_date'];
			$this -> ajaxReturn($return);
	}
	
	function get_location($lat, $lng) {
		$data['location'] = get_location($lat, $lng);
		$location = conv_baidu_map($lat, $lng);
		$data['lat'] = $location['lat'];
		$data['lng'] = $location['lng'];
		$data['time'] = to_date(time());
		$data['status'] = 1;
		$this -> ajaxReturn($data);
	}

	private function record_location($data) {
		$where['is_real_time'] = 1;
		$where['emp_no'] = $data['FromUserName'];
		$lasted_location = M("Sign") -> where($where) -> find();

		if ($lasted_location != false) {
			$lasted_location['latitude'] = $data['Latitude'];
			$lasted_location['longitude'] = $data['Longitude'];
			$lasted_location['precision'] = $data['Precision'];
			$lasted_location['create_time'] = time();
			M('Sign') -> save($lasted_location);
		} else {
			$new_data['latitude'] = $data['Latitude'];
			$new_data['longitude'] = $data['Longitude'];
			$new_data['precision'] = $data['Precision'];
			$new_data['emp_no'] = $data['FromUserName'];
			$new_data['is_real_time'] = 1;
			$new_data['create_time'] = time();

			$where['emp_no'] = array('eq', $data['FromUserName']);
			$user_id = M("User") -> where($where) -> getField('id');
			$new_data['user_id'] = $user_id;
			M('Sign') -> add($new_data);
		}
	}

}

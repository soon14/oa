<?php
/*---------------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/xiaowei
 -------------------------------------------------------------------------*/

namespace Weixin\Controller;

class OaController extends WeixinController {

	protected $config = array('app_type' => 'public');

	function _initialize(){
		$agent_id = get_system_config("oa_agent_id");
		if (empty($agent_id)) {
			$this -> error('没有找到OA_AGENT_ID');
		}
		$this -> agent_id = $agent_id;
		import("@.ORG.Util.Weixin");
		$this -> weixin = new \Weixin();		
	}

	public function login(){
		redirect(get_system_config('weixin_site_url'));
	}
	
	public function set_menu() {
		$sub = array();
		$data = array();
		$subs = array();

		$corpid = get_system_config("weixin_corp_id");
		$site_url = get_system_config("weixin_site_url");
		$redirect_uri = urlencode($site_url . '/index.php?m=Weixin');
		$url = base64_encode(U('Oa/login'));

		$oauth_url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid={$corpid}&redirect_uri={$redirect_uri}&response_type=code&scope=snsapi_base&state={$url}#wechat_redirect";
		$sub1 = array('type' => 'view', 'name' => '微信办公', 'url' => $oauth_url);

		$subs2[] = array('type' => 'view', 'name' => '解除绑定', 'url' => $site_url . U('Weixin/oa/unbind'));
		//$subs2[] = array('type' => 'click', 'name' => '推送设置', 'key' => 'push_config');

		$sub2 = array('name' => '帮助', 'sub_button' => $subs2);

		$data['button'][] = $sub1;
		$data['button'][] = $sub2;

		$data = json_encode($data, JSON_UNESCAPED_UNICODE);
		$this -> _set_menu($data);
	}

	/**
	 * 跳出页面-绑定帐号
	 */
	public function bind() {
		if (IS_POST) {
			if (empty($_POST['emp_no'])) {
				$this -> error('帐号必须！');
			} elseif (empty($_POST['password'])) {
				$this -> error('密码必须！');
			}
			//生成认证条件
			$map = array();
			// 支持使用绑定帐号登录
			$map['emp_no'] = I('emp_no');
			$map["is_del"] = array('eq', 0);
			
			$model = D("User");
			$auth_info = $model -> where($map) -> find();

			//使用用户名、密码和状态的方式进行认证
			if (false === $auth_info) {
				$this -> error('帐号或密码错误！');
			} else {
				if ($auth_info['password'] != md5($_POST['password'])) {
					$this -> error('帐号或密码错误！');
				}

				//保存登录信息
				$User = M('User');
				$data = array();
				$data['id'] = $auth_info['id'];
				$data['last_login_time'] = time();
				$data['login_count'] = array('exp', 'login_count+1');

				$ip = get_client_ip();
				$open_id= I('openid','','strip_tags');
				$data['last_login_ip'] = $ip;
				$data['openid'] =$open_id;
				$data['westatus'] = 1;
				$result = $User -> save($data);
				
				if ($result) {
					$this -> send("恭喜您验证成功！您可以使用自定义菜单或直接回复信息查询想要了解的内容!", $openid, 'text');

					$tmp = explode('@', $username);
					$username = substr($tmp[0], 0, strlen($tmp[0]) - 4) . '****@' . $tmp[1];
					$msg = '';
					$msg .= '恭喜，绑定成功！你可以直接在微信回复“解除绑定”解除微信绑定。';
					$msg .= '当前绑定的账户为“' . $auth_info['emp_no'] . '”';
					$msg .= '如果您不希望收到微信提醒信息，可在帮助》信息推送设置中进行设置。';
					$this -> message($msg);
				} else {
					$this -> message('绑定失败');
				}
			}
		} else {
			$this -> assign('openid', I('request.openid'));
			$this -> meta_title = "帐号绑定";
			$this -> display();
		}
	}

	/**
	 * 跳出页面-绑定帐号
	 */
	public function unbind() {
		if (IS_POST) {
			if (empty($_POST['emp_no'])) {
				$this -> error('帐号必须！');
			} elseif (empty($_POST['password'])) {
				$this -> error('密码必须！');
			}
			//生成认证条件
			$map = array();
			// 支持使用绑定帐号登录
			$map['emp_no'] = $_POST['emp_no'];
			$map["is_del"] = array('eq', 0);
			$model = M("User");
			$auth_info = $model -> where($map) -> find();

			//使用用户名、密码和状态的方式进行认证
			if (false === $auth_info) {
				$this -> error('帐号或密码错误！');
			} elseif ($auth_info['password'] != md5(I('password'))) {
				$this -> error('帐号或密码错误！');
			} else {
				//保存登录信息
				$data = array();
				$data['id'] = $auth_info['id'];
				$data['openid'] = '';
				$data['westatus'] = 0;
				$result = $model -> save($data);
				if ($result) {
					$this -> send("恭喜您验证成功！您可以使用自定义菜单或直接回复信息查询想要了解的内容!", $openid, 'text');

					$tmp = explode('@', $username);
					$username = substr($tmp[0], 0, strlen($tmp[0]) - 4) . '****@' . $tmp[1];
					$msg = '';
					$msg .= '成功解除绑定';
					$msg .= '当前解除绑定的账户为“' . $auth_info['emp_no'] . '”';
					$this -> message($msg);
				} else {
					$this -> message('绑定失败');
				}
			}
		} else {
			$this -> assign('openid', I('request.openid'));
			$this -> meta_title = "帐号绑定";
			$this -> display();
		}
	}

	public function index() {

		/* 获取请求信息 */

		$data = $this -> weixin -> request();
		/* 获取回复信息 */

		list($content, $type) = $this -> reply($data);

		// 接收到的信息入不同的库
		//$this->add_log ( $data );

		/* 响应当前请求 */
		$this -> weixin -> response($content, $type);
	}

	/**
	 * 定制响应信息
	 * @param array $data 接收的数据
	 * @return array; 响应的数据
	 */
	private function reply($data) {
		// 消息类型
		switch ($data ['MsgType']) {
			case 'text' :
				// 类型是文本的
				$key = explode(",", $data['Content']);
				switch ($key[0]) {
					//case '解除绑定' :
					// 接触绑定
					//	$reply = $this -> getUnOauth($data['FromUserName']);
					//	break;
					case '电话' :
						$map['name|office_tel|mobile_tel'] = array('like', '%' . $key[1] . '%');
						$result = M('User') -> where($map) -> getField('name,office_tel,mobile_tel');
						$rs = arrToStr($result);
						$reply = array($rs, 'text');
						break;
					case '天气' :
						$url = "http://apix.sinaapp.com/weather/?appkey=ghl&city=" . urlencode($key[1]);
						$output = file_get_contents($url);
						$content = json_decode($output, true);
						foreach ($content as $key => $value) {
							$content[$key]['Url'] = '';
							if ($key >= 9) {
								break;
							} //最多只允许10调新闻
						}
						$reply = array($content, 'news');
					case '1' :
						// 任务提醒
						$reply = $this -> get_task_event('ites_set', $data['FromUserName']);
						break;
					case '2' :
						// 任务检索
						$reply = array("任务检索，<a href='" . get_system_config("weixin_site_url") . "/wechat/search/?openid={$data ['FromUserName']}'>请点击这里</a>", 'text');
						break;
					default :

						/* 加载分词SDK */
						//import ( "@.ORG.Util.SplitWord" );
						//$word = new SplitWord ();
						//$reply = $word->getWord($data ['Content']);

						if (strpos($data['Content'], '任务') !== false) {
							$html = $this -> getTaskHtml();
							$reply = array($html, 'text');
						} else {
							$reply = array('欢迎使用' . get_system_config('system_name') . '微信办公', 'text');
						}
						break;
				}

				break;
			case 'event' :
				// 类型是事件的
				// 事件类型
				switch ($data ['Event']) {
					case 'subscribe' :
						// 刚刚关注的
						//$reply = $this -> get_subscribe($data['FromUserName']);
						break;
					case 'click' :
						// 点击的事件
						$reply = $this -> get_task_event($data['EventKey'], $data['FromUserName']);
						break;
					/*
					 default :
					 $reply = array ( '没有相关事件',	'text' );
					 break;
					 */
				}

				break;
			default :
				$reply = array('没有相关消息类型', 'text');
				break;
		}
		return $reply;
	}

	/**
	 * 关注成功
	 * @param string $openid 用户openid
	 * @return array; 响应的数据
	 */
	private function get_subscribe($openid = '') {
		$subscribe_msg = get_system_config('weixin_subscribe_msg');
		$content = $subscribe_msg . "<a href='" . get_system_config("weixin_site_url") . U('Weixin/Oa/bind', array('openid' => $openid)) . "'>点击立即进行绑定</a>";
		return array($content, 'text');
	}

	/**
	 * 任务事件
	 * @param string $taskevent 事件
	 * @param string $openid   	用户openid
	 * @return array; 响应的数据
	 */
	private function get_task_event($taskevent = '', $openid = '') {
		$userid = $this -> get_cookie_id($openid);
		// 绑定的用户ID
		if ($openid && $userid > 0) {
			switch ($taskevent) {
				case 'sign_up' :
					// 签到
					$reply = array("签到成功", 'text');
					break;
				case 'unauth' :
					// 解除绑定
					$reply = $this -> getUnOauth($openid);
					break;
				case 'push_config' :
					// 我申请的任务
					$reply = array("设置微信推送相关设置，<a href='" . get_system_config("weixin_site_url") . U('Home/UserConfig/index') . "'>请点击这里</a>", 'text');
					break;
				default :
					$reply = array('没有相关指令', 'text');
					break;
			}
		} else {
			$reply = array("您还没有绑定帐号。<a href='" . C("SITE_URL") . U('Weixin/Oa/bind') . "?openid={$openid}'>点击立即进行绑定</a>", 'text');
		}
		return $reply;
	}

	/**
	 * 获取微信用户基础资料
	 *
	 * @param string $openid
	 *        	用户openid
	 * @return array; 响应的数据
	 */
	private function get_weixin_user_info($openid = '') {
		$weuser = $weixin -> get_user_info($openid);
		// dump($weuser);
		return $weuser;
	}

	/**
	 * 生成COOKIE或从COOKIE获得用户ID
	 */
	private function get_cookie_id($openid = NULL) {
		if (empty($openid))
			return -3;
		$auth = cookie('user_auth');
		// 读取COOKIE
		if ($auth) {// 存在cookie
			$auth = think_decrypt($auth);
			// 解密cookie
			if (strpos($auth, '{@}') === FALSE) {// 如果是假冒的cookie
				$uid = -2;
			} else {// 真实，然后分解cookie
				$autharr = explode('{@}', $auth);
				$uid = $autharr[1];
			}
		} else {// 不存在cookie，则创建cookie
			$model = M("User");
			$where['openid'] = array('eq', $openid);
			$where['westatus'] = array('eq', 1);
			$where['is_del'] = array('eq', 0);
			$weuser = $model -> where($where) -> find();
			// 查到userid
			if (empty($weuser)) {// 查到没有绑定返回-1
				$uid = -1;
				$auth = think_encrypt($openid . '{@}' . $uid . '{@}' . time());
				cookie('user_auth', $auth);
			} else {// 绑定了的创建COOKIE；
				$uid = $weuser['id'];
				$auth = think_encrypt($openid . '{@}' . $uid . '{@}' . time());
				cookie('user_auth', $auth);
			}
		}
		return $uid;
		// 返回USERID
	}
}

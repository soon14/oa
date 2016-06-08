<?php
/*
 * ---------------------------------------------------------------------------
 * 小微OA系统 - 让工作更轻松快乐
 *
 *  Copyright (c) 2013 http://www.smeoa.com All rights reserved.
 *
 *  Author: jinzhu.yin<smeoa@qq.com>
 *
 *  Support: https://git.oschina.net/smeoa/xiaowei
 * -------------------------------------------------------------- */

namespace Home\Controller;

class UdfSalaryController extends HomeController {
	protected $config = array('app_type' => 'common', 'read' => 'enter_pwd,setpwd,setpwd2,find_pwd,send_sms_verify,success');
	protected $first_row = 2;
	protected $field_count = 24;
	protected $head = array();
	protected $state = false;
	function _search_filter(&$map) {
		if ($this -> config['auth']['admin'] == false) {
			$map['emp_no'] = array('eq', get_emp_no());
		}
		if (!empty($_POST['keyword'])) {
			$map['A|B|C|D'] = array('like', "%" . $_POST['keyword'] . "%");
		}
	}

	function init_head_info() {

		$this -> add_head(1, '工资期间', 1, 1);
		$this -> add_head(1, '员工编号', 1, 1);
		$this -> add_head(1, '部门', 1, 1);
		$this -> add_head(1, '姓名', 1, 1);
		$this -> add_head(1, '职位', 1, 1);

		$this -> add_head(1, '试用期工资', 1, 1);
		$this -> add_head(1, '转正工资', 1, 1);
		$this -> add_head(1, '底薪', 1, 1);
		$this -> add_head(1, '加班津贴', 1, 1);
		$this -> add_head(1, '工龄补贴', 1, 1);

		$this -> add_head(1, '技能补贴', 1, 1);
		$this -> add_head(1, '岗位补贴', 1, 1);
		$this -> add_head(1, '职位补贴', 1, 1);
		$this -> add_head(1, '电话补贴', 1, 1);
		$this -> add_head(1, '绩效奖金', 1, 1);
		
		$this -> add_head(1, '其它奖金', 1, 1);
		$this -> add_head(1, '考勤扣除', 1, 1);
		$this -> add_head(1, '绩效扣除', 1, 1);
		$this -> add_head(1, '应付工资', 1, 1);
		$this -> add_head(1, '实发工资', 1, 1);
		
		$this -> add_head(1, '合计', 1, 1);
		$this -> add_head(1, '年终奖比率', 1, 1);
		$this -> add_head(1, '签字', 1, 1);
		$this -> add_head(1, '备注', 1, 1);
	}

	function add_head($i, $name, $colspan, $rowspan) {
		$item = new \stdClass();
		$item -> name = $name;
		$item -> colspan = $colspan;
		$item -> rowspan = $rowspan;
		$this -> head[$i][] = $item;
	}

	public function index() {
		$User = M('User');
		$where['id'] = get_user_id();
		$list = $User -> field('pay_pwd') -> where($where) -> find();
		if ($list['pay_pwd'] == '') {
			$this -> redirect('setpwd2');
		}
		$where2['pay_pwd'] = $_GET['allow'];
		$allow = $User -> where($where2) -> count();
		if (!$allow) {
			$this -> redirect('enter_pwd');
		} else {
			$auth = $this -> config['auth'];
			$this -> assign('auth', $auth);

			$this -> init_head_info();
			$head_html = '';
			foreach ($this->head as $key => $val) {
				if ($key == 1) {
					if ($auth['admin']) {
						$head_html .= '<tr><td rowspan="2"><label class="inline pull-left">
				<input type="checkbox" name="id-toggle-all" id="id-toggle-all" />
				<span class="lbl"></span></label></td>';
					} else {
						$head_html .= '<tr>';
					}
				} else {
					$head_html .= '<tr>';
				}
				foreach ($val as $sub_key => $sub_val) {
					// echo ($sub_val->name.$sub_val->colspan.$sub_val->rowspan);
					$head_html .= "<th class=\"text-center\" colspan=\"{$sub_val->colspan}\"} rowspan=\"{$sub_val->rowspan}\">{$sub_val->name}</th>";
				}
				$head_html .= '</tr>';
			}
			// echo $head_html;
			$this -> assign('head_html', $head_html);
			$this -> _index();
		}
	}

	public function del($id) {
		$this -> _destory($id);
	}

	public function import() {
		$opmode = $_POST["opmode"];
		if ($opmode == "import") {
			$File = D('File');
			$file_driver = C('DOWNLOAD_UPLOAD_DRIVER');
			$info = $File -> upload($_FILES, C('DOWNLOAD_UPLOAD'), C('DOWNLOAD_UPLOAD_DRIVER'), C("UPLOAD_{$file_driver}_CONFIG"));
			if (!$info) {
				$this -> error();
			} else {
				// 取得成功上传的文件信息
				// $uploadList = $upload -> getUploadFileInfo();
				Vendor('Excel.PHPExcel');
				// 导入thinkphp第三方类库

				$import_file = $_SERVER['DOCUMENT_ROOT'] . $info['file']["path"];

				$objPHPExcel = \PHPExcel_IOFactory::load($import_file);

				$model = M(CONTROLLER_NAME);

				$sheetData = $objPHPExcel -> getActiveSheet() -> toArray(null, true, true, true);

				$data_count = count($sheetData);
				for ($i = $this -> first_row; $i <= $data_count; $i++) {
					if (!empty($sheetData[$i]["A"])) {

						$data = array();
						$count++;
						$data['emp_no'] = $sheetData[$i]["B"];
						for ($k = 1; $k <= $this -> field_count; $k++) {
							$col_name = $this -> _get_excel_col_name($k);
							$data[$col_name] = $sheetData[$i][$col_name];
						}
						$sum += $sheetData[$i]['U'];
						$model -> add($data);
					}
				}
				$this -> assign('count', $count);
				$this -> assign('sum', $sum);
				$this -> display('success');
				//$this -> assign('jumpUrl', get_return_url());
				//$this -> success("导入{$count}条，实发合计：{$sum}");
			}
		} else {
			$this -> display();
		}
	}

	private function _get_excel_col_name($i) {
		$first_char = floor($i / 26);
		$secend_char = $i % 26;
		if ($secend_char == 0) {
			$secend_char = 26;
			$first_char--;
		}
		if (empty($first_char)) {
			$first_char = '';
		} else {
			$first_char = chr($first_char + 64);
		}
		$secend_char = chr($secend_char + 64);

		return $first_char . $secend_char;
	}

	public function setpwd() {
		if ($_POST['state'] == '1') {
			$id = get_user_id();
			$password = $_POST['password'];
			if (trim($password) == '') {
				$this -> error('密码不能为空!');
			}
			$User = M('User');
			$User -> pay_pwd = md5($password);
			$User -> id = $id;
			$result = $User -> save();
			if (false !== $result) {
				$this -> assign('jumpUrl', get_return_url());
				$this -> success("密码修改成功");
			} else {
				$this -> error('重置密码失败！');
			}
		} else {
			$this -> display();
		}
	}

	public function enter_pwd() {
		header("Content-Type:text/html; charset=utf-8");
		if ($_POST['state'] == "1") {
			$User = M('User');
			$pwd = md5($_POST['pwd']);
			$map['id'] = get_user_id();
			$map['pay_pwd'] = array('eq', $pwd);
			$list = $User -> where($map) -> find();
			if ($list == false) {
				$this -> error('密码错误！');
			} else {
				$data['allow'] = $pwd;
				$data['status'] = 1;
				$this -> ajaxReturn($data);
			}
		} else {
			$this -> display();
		}
	}

	public function find_pwd() {
		if ($_POST['state'] == 'ture') {
			if (IS_POST) {
				$verify_no = I('verify_no');
				if ($verify_no !== session('verify_no')) {
					$this -> error('验证码错误');
				}
				$emp_no = get_emp_no();
				$password = I('password');

				$where['emp_no'] = array('eq', $emp_no);
				$data['pay_pwd'] = md5($password);
				$result = M("User") -> where($where) -> save($data);
				if ($result !== false) {
					$this -> success('修改密码成功');
					die ;
				} else {
					$this -> success('修改密码失败');
				}
			}
		} else {
			$this -> display();
		}
	}

	public function send_sms_verify($emp_no) {
		$verify_no = rand_string(6, 1);
		session('verify_no', $verify_no);
		if (empty($emp_no)) {
			$return['info'] = '请输入员工编号';
			$return['status'] = 0;
			$this -> ajaxReturn($return);
		}

		$where_user['emp_no'] = array('eq', $emp_no);
		$user = M("User") -> where($where_user) -> find();

		if ($user == false) {
			$return['info'] = '员工编号不存在';
			$return['status'] = 0;
			$this -> ajaxReturn($return);
		}
		if ($user !== false) {
			if (empty($user['mobile_tel'])) {
				$return['info'] = '该用户手机号不存在，请联系管理员';
				$return['status'] = 0;
				$this -> ajaxReturn($return);
			}
		}

		$account = 'xxxxxxxxxxx';

		//用户密码 $password
		$password = 'xxxxxxxxxx';

		//发送到的目标手机号码 $mobile
		$mobile = $user['mobile_tel'];

		//短信内容 $content
		$content = "【SIAS】您的验证码：{$verify_no}";

		//发送短信（其他方法相同）
		$gateway = "http://xxx.sss.com?action=send&userid=&account={$account}&password={$password}&mobile={$mobile}&content={$content}&sendTime=";
		$result = file_get_contents($gateway);
		//dump($result);
		$xml = simplexml_load_string($result);
		if ($xml -> returnstatus == 'Success') {
			$return['status'] = 1;
			$return['info'] = '短信已发送';
			$this -> ajaxReturn($return);
		}
	}

}
?>
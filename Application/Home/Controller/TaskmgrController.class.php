<?php
/*--------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved. 
 
 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/xiaowei  extends HomeController
--------------------------------------------------------------*/

namespace Home\Controller;

class TaskmgrController extends HomeController{
	protected $config = array('app_type' => 'personal');
	//过滤查询字段
	function _search_filter(&$map) {
		$map['is_del'] = array('eq', '0');
		if (!empty($_POST['keyword'])) {
			$where['content'] = array('like', '%' . $_POST['keyword'] . '%');
			$where['plan'] = array('like', '%' . $_POST['keyword'] . '%');
			$where['_logic'] = 'or';
			$map['_complex'] = $where;
		}
	}
	function _timer() {
		$mode=D('SystemDataCollection');
		//检查今天是否为第一次采集数据
		$map['create_time']=array(array('egt',strtotime("today")),array('lt',strtotime(date('Y-m-d',strtotime('+1 day')))));
		$log=$mode->where($map)->select();
		if(empty($log)){
			//采集一次数据做为前一天的最终数据
			$this->_data_dollection();
		}else{
			//今天不是第一次采集数据，检查前1小时内是否采集过数据
			$now=strtotime("now");
			//if('')
			//$mode->updata();
			//前1小时内采集过数据，退出，等待下次采集
		}
		//dump($mode);
	}
	function _data_dollection(){
		//获取最近一次记录
		$last_data=D('SystemDataCollection')->order('create_time desc')->select();
		$last_data=$last_data[0];
		
		$data['create_time']=strtotime('-1 day');
		//统计签到
		//获取人员列表
		$where['is_del']=0;
		$user_num=D('User')->field('id')->where($where)->count();
		//设置查询时间
		$where='';
		$where['create_time'] = array(array('egt',strtotime(date('Y-m-d',strtotime('-1 day')))),array('lt',strtotime(date('Y-m-d',strtotime('today')))));
		$where['location']= array('neq','');
		//签到
		$where['type'] = 'sign_in';
		$data['sign_in']=D('Sign')->where($where)->getField('user_id',true);
		$data['sign_in']=count(array_unique($data['sign_in']));
		//外勤
		$where['type'] = 'outside';
		$data['outside']=D('Sign')->where($where)->getField('user_id',true);
		$data['outside']=count(array_unique($data['outside']));
		//签退
		$where['type'] = 'sign_out';
		$data['sign_out']=D('Sign')->where($where)->getField('user_id',true);
		$data['sign_out']=count(array_unique($data['sign_out']));
		$data['unsign_num']=$user_num-$data['sign_in']-$data['outside'];
		//统计审批
		$map['create_time']=$where['create_time'];
		$data['flow_new']=D('Flow')->where($map)->count();
		$map='';
		$map['_string'] = "result is null";
		$data['flow_todo']=D('FlowLog')->where($map)->count();
		$data['flow_todo']=$data['flow_todo'];
		$map['_string'] = "result is not null";
		$map['flow_done']=D('FlowLog')->where($map)->count();
		$map['flow_done']=$data['flow_done']-$last_data['flow_done'];
		$map['_string']=1;
		$data['flow_pass']=D('FlowLog')->where($map)->count();
		$map['flow_pass']=$data['flow_pass']-$last_data['flow_pass'];
		$map['_string']=0;
		$data['flow_unpass']=D('FlowLog')->where($map)->count();
		$map['flow_unpass']=$data['flow_unpass']-$last_data['flow_unpass'];
		//统计任务
		$map='';
		$map['create_time']=$where['create_time'];
		$data['task_new']=D('Flow')->where($map)->count();
		$map='';
		$map['status']=array('lt', 20);
		$data['task_todo']=D('Task')->where($map)->getField('id,expected_time');
		$data['task_timeout']=0;
		foreach($data['task_todo'] as $vo){
			if(strtotime('now')>strtotime($vo))
				$data['task_timeout']=$data['task_timeout']+1;
		}
		$data['task_todo']=count($data['task_todo']);
		
		$map['status']=20;
		$data['task_done']=D('Task')->where($map)->count();
		$data['task_done']=$data['task_done']-$last_data['task_done'];
		
		//统计日志
		$map='';
		$map['start-date'] = array(array('gt',strtotime(date('Y-m-d',strtotime('-1 day')))),array('lt',strtotime(date('Y-m-d',strtotime('today')))));
		$data['unworklog']=D('WorkLog')->where($map)->getField('user_id',true);
		$data['unworklog']=count(array_unique($data['unworklog']));
		$data['unworklog']=$user_num-$data['unworklog'];

		//dump($data);
	
		if(empty($last_data)){
			//存储为前一天的最终记录
			//dump('add');
			D('SystemDataCollection')->data($data)->add();
			//存储为当天的第一条记录
			$data['create_time']=strtotime(date('Y-m-d',strtotime('today')));
			D('SystemDataCollection')->data($data)->add();
		}else{
			if($last_data['create_time']>=strtotime(date('Y-m-d',strtotime('-1 day')))){//昨天往后
				D('SystemDataCollection')->where($last_data)->delete();
				if($last_data['create_time']<strtotime(date('Y-m-d',strtotime('today')))){//今天之前
					D('SystemDataCollection')->data($data)->add();
					//dump('del yesterday');
				}else{//今天
					$data['create_time']=strtotime(date('Y-m-d',strtotime('today')));
					D('SystemDataCollection')->data($data)->add();
					//dump('del today');
				}
			}
		}

		
	}
	public function index() {
		//输出：签到列表=$today_sign 未签到表=$unsign_list 未写日报表=$unwork_log
		$plugin['date'] = true;
		$plugin['chart'] = true;
		$plugin['uploader'] = true;
		$plugin['editor'] = true;
		//$this->_timer();
		$this->_data_dollection();
		//统计签到
		//获取人员列表
		$where['is_del']=0;
		$user_list=D('User')->where($where)->getField('id',true);
		//设置查询时间
		
		$model = D("SignView");
		$where=$this -> _search($model);
		if (empty($where['create_time'])){
			$where['create_time'] = array(array('gt',strtotime("today")),array('lt',strtotime(date('Y-m-d',strtotime('+1 day')))));
		}
		$where['is_del']=0;
		$where['location']= array('neq','');
		//签到
		$where['type'] = 'sign_in';
		$today_sign['in']=D('Sign')->where($where)->getField('user_id',true);
		$today_sign['in_num']=count(array_unique($today_sign['in']));
		$unsign_list=array_diff($user_list,$today_sign['in']);
		if (!empty($today_sign['in'])){
			$map['user_id']=array('in',$today_sign['in']);
			$map['create_time']=$where['create_time'];
			$map['location']=$where['location'];
			$map['type']=$where['type'];
			//$this -> _search_filter($map);
			if (!empty($model)) {
				$today_sign['in']=$model->where($map)->order('dept_name desc')->field('dept_name,position_name,name,sign_date,location')->select();
			}
		}
		//外勤
		$where['type'] = 'outside';
		$today_sign['outside']=D('Sign')->where($where)->getField('user_id',true);
		$today_sign['outside_num']=count(array_unique($today_sign['outside']));
		$unsign_list=array_diff($unsign_list,$today_sign['outside']);
		if (!empty($today_sign['outside'])){
			if (!empty($model)) {
				$map['user_id']=array('in',$today_sign['outside']);
				$map['type']=$where['type'];
				$today_sign['outside']=$model->where($map)->order('dept_name desc')->field('dept_name,position_name,name,sign_date,location')->select();
			}
		}
		//签退
		$where['type'] = 'sign_out';
		$today_sign['out']=D('Sign')->where($where)->getField('user_id',true);
		$today_sign['out_num']=count(array_unique($today_sign['out']));
		if (!empty($today_sign['out'])){
			$map['user_id']=array('in',$today_sign['out']);
			$map['type']=$where['type'];
			if (!empty($model)) {
				$today_sign['out']=$model->where($map)->order('dept_name desc')->field('dept_name,position_name,name,sign_date,location')->select();
			}
		}
		$today_sign['unsign_num']=count($unsign_list);
		if (!empty($unsign_list)){
			$model = D("UserView");
			$map=null;
			$map['id']=array('in',$unsign_list);
			//$this -> _search_filter($map);
			if (!empty($model)) {
				$unsign_list=$model->where($map)->order('dept_name desc')->field('dept_name,position_name,name')->select();
			}
		}
		$this->assign('today_sign',$today_sign);
		$this->assign('unsign_list',$unsign_list);

		
		//统计日志
		$where='';
		$where['is_del']=0;
		$where['start-date'] = array(array('gt',date('Y-m-d',strtotime("today"))),array('lt',date('Y-m-d',strtotime('+1 day'))));
		$unwork_log=D('WorkLog')->where($where)->getField('user_id',true);
		$unwork_log=array_unique($unwork_log);
		$unwork_log=array_diff($user_list,$unwork_log);
		//$this -> _search_filter($map);
		if (!empty($unwork_log)){
			$model = D("UserView");
			$map=null;
			$map['id']=array('in',$unwork_log);
			$this -> _search_filter($map);
			if (!empty($model)) {
				$unwork_log=$model->where($map)->order('dept_name desc')->field('dept_name,position_name,name')->select();
			}
		}
		$this->assign('unwork_log',$unwork_log);
		$this->assign('unwork_log_num',count($unwork_log));
		//统计日志结束
		
		$this -> assign("plugin", $plugin);
		$this -> assign('user_id', get_user_id());

		$auth = $this -> config['auth'];
		$this -> assign('auth', $auth);
		$this -> display();
	}
	public function json() {
		
		$arr=array("name"=>"oa", "url"=>'http://oa.biosy.net/');
		$jarr=json_encode($arr);
		echo $jarr;
	}
}

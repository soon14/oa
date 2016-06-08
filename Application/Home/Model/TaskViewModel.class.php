<?php
/*---------------------------------------------------------------------------
  小微OA系统 - 让工作更轻松快乐 

  Copyright (c) 2013 http://www.smeoa.com All rights reserved.                                             


  Author:  jinzhu.yin<smeoa@qq.com>                         

  Support: https://git.oschina.net/smeoa/xiaowei               
 -------------------------------------------------------------------------*/

namespace Home\Model;
use Think\Model\ViewModel;

class  TaskViewModel extends ViewModel {
	public $viewFields=array(
		'Task'=>array('*','_type'=>'LEFT'),
		'CrmContact'=>array('name'=>'contact_name','_on'=>'CrmContact.id=Task.contact_id')
		);
}
?>
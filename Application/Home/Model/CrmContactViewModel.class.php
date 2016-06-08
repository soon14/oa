<?php
/*---------------------------------------------------------------------------
  小微OA系统 - 让工作更轻松快乐 

  Copyright (c) 2013 http://www.smeoa.com All rights reserved.                                             

  Author:  jinzhu.yin<smeoa@qq.com>                         

  Support: https://git.oschina.net/smeoa/xiaowei               
 -------------------------------------------------------------------------*/

namespace Home\Model;
use Think\Model\ViewModel;

class  CrmContactViewModel extends ViewModel {
	public $viewFields=array(
		'CrmContact'=>array('*','_type'=>'LEFT'),
		'CrmCompany'=>array('name'=>'company_name','id'=>'company_id','_on'=>'CrmContact.company_id=CrmCompany.id'),
		);

}
?>
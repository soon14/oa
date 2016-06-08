<?php
/*---------------------------------------------------------------------------
  小微OA系统 - 让工作更轻松快乐 

  Copyright (c) 2013 http://www.smeoa.com All rights reserved.                                             


  Author:  jinzhu.yin<smeoa@qq.com>                         

  Support: https://git.oschina.net/smeoa/xiaowei               
 -------------------------------------------------------------------------*/

namespace Home\Model;
use Think\Model\ViewModel;

class  UdfRenewViewModel extends ViewModel {
	public $viewFields=array(
		'UdfRenew'=>array('*'),
		'UdfTarget'=>array('renew_target','month','_on'=>'UdfTarget.shop_no=UdfRenew.shop_no and left(UdfRenew.renew_date,7)=UdfTarget.month')
		);
}
?>
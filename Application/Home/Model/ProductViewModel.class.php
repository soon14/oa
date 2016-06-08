<?php
/*---------------------------------------------------------------------------
  小微OA系统 - 让工作更轻松快乐 

  Copyright (c) 2013 http://www.smeoa.com All rights reserved.                                             


  Author:  jinzhu.yin<smeoa@qq.com>                         

  Support: https://git.oschina.net/smeoa/xiaowei               
 -------------------------------------------------------------------------*/

namespace Home\Model;
use Think\Model\ViewModel;

class  ProductViewModel extends ViewModel {
	public $viewFields=array(
		'Product'=>array('*'),
		'SystemFolder'=>array('name'=>'folder_name','_on'=>'Product.folder=SystemFolder.id')
		);
}
?>
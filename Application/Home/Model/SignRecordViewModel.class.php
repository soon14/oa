<?php
/*---------------------------------------------------------------------------
  小微OA系统 - 让工作更轻松快乐 

  Copyright (c) 2013 http://www.smeoa.com All rights reserved.                                             

  Author:  jinzhu.yin<smeoa@qq.com>                         

  Support: https://git.oschina.net/smeoa/xiaowei               
 -------------------------------------------------------------------------*/

namespace Home\Model;
use Think\Model\ViewModel;

class  SignRecordViewModel extends ViewModel {
		public function get_list($where){
		  $Model = new \Think\Model();
		  $list = $Model -> query("SELECT t1.id user_id,t1.name user_name,t3.name dept_name,substr(t2.sign_date,1,10)date,count(substr(t2.sign_date,1,10)) count
				FROM ". $this -> tablePrefix ."user t1 
				LEFT JOIN ". $this -> tablePrefix ."sign t2 on t1.id=t2.user_id 
				LEFT JOIN ". $this -> tablePrefix ."dept t3 on t1.dept_id=t3.id
				$where
				GROUP BY t1.id,substr(sign_date,1,10)
				ORDER BY user_id,substr(sign_date,1,10)");
		  return $list;
		}
}
?>
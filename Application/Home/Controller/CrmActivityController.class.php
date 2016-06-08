<?php
/*
 * -------------------------------------------------------------------- 
 小微OA系统 - 让工作更轻松快乐 Copyright (c) 2013 
 http://www.smeoa.com All rights reserved. 
 Author: jinzhu.yin<smeoa@qq.com> Support: 
 https://git.oschina.net/smeoa/xiaowei
  ---------------------------------------------------------------------
 */
namespace Home\Controller;

class CrmActivityController extends HomeController
{
    const CONFIRMED = 2 ;
    const FENYE = 10 ;

    /**
     * 获得用户活动数据
     */
    public function index()
    {
        $activity = M() ;
        $user_id = get_user_id() ;
        $tdc_activity = M('activity','tdc_') ;
        $keyword = I('keyword') ;
        $list_rows = I('list_rows') ;

        $path_info = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : '';
        $current_user = strpos($path_info,'current_user') ;
        import("@.ORG.Util.Page");

        $sql = "SELECT `activity`.`ac_id`,`activity`.`ac_name`,`tdc_users`.`username`,`activity`.`start_time`,`oa_user`.`name` FROM `tdc_activity` AS `activity`
                    LEFT JOIN `tdc_users` ON `activity`.`create_uid` = `tdc_users`.`uid`
                    LEFT JOIN `oa_crm_affiliation` AS `crm` ON `activity`.`create_uid` = `crm`.`custom_id`
                    LEFT JOIN `oa_user` ON `crm`.`sale_id` = `oa_user`.`id`" ;

        if($keyword){
            $map['`tdc_activity`.`ac_name`'] = ['LIKE', "%$keyword%"] ;
        }

        if(empty($current_user)){
            //查看所有的活动
            $map['`tdc_activity`.`confirmed`'] = ['EQ', self::CONFIRMED] ;
            $count = $tdc_activity->where($map)->count() ;
            if($keyword){
                $sql = $sql . " WHERE `activity`.`ac_name` LIKE '%{$keyword}%' OR `tdc_users`.`username` LIKE '%{$keyword}%' " ;
            }
        }else{
            //查看当前用户负责的会员的活动
            $map['`oa_crm_affiliation`.`sale_id`'] = ['EQ', $user_id] ;
            $map['`tdc_activity`.`confirmed`'] = ['EQ', self::CONFIRMED] ;
            $count = $tdc_activity->join( '`oa_crm_affiliation`  ON  `tdc_activity`.`create_uid` = `oa_crm_affiliation`.`custom_id`','LEFT' )->where($map)->count() ;
            $sql = $sql . " WHERE `oa_user`.`id` = '{$user_id}' " ;

            if($keyword){
                $sql = $sql . " AND `activity`.`ac_name` LIKE '%{$keyword}%' OR `tdc_users`.`username` LIKE '%{$keyword}%' " ;
            }
        }

        $p = new \Page($count, $list_rows ? : SELF::FENYE);
        $sql = $sql . " LIMIT " . $p -> firstRow .",". $p -> listRows ."";
        $page = $p -> show();
        $activities = $activity->query($sql) ;
        $this -> assign('activities', $activities);
        $this -> assign('page', $page);
        $this->display();
    }

    /**
     * 显示某个活动的详细信息
     */
    public function show()
    {
        $ac_id = I('id') ;
        $activity = M() ;

        $sql = " SELECT `activity`.*,`tdc_users`.`username`,`tdc_club`.`city`,`tdc_club`.`name`
                 FROM `tdc_activity` AS `activity` LEFT JOIN `tdc_users` ON `activity`.`create_uid` = `tdc_users`.`uid`
                 LEFT JOIN `tdc_club` ON `activity`.`cid` = `tdc_club`.`cid`
                 WHERE `activity`.`confirmed` = '" . SELF::CONFIRMED ."' AND `activity`.`ac_id` = '{$ac_id}' " ;

        $activity_info = $activity->query($sql) ;

        $this -> assign('activity_info', $activity_info[0]);
        $this->display();
    }

}

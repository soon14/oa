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

class CrmOrderController extends HomeController
{
    const PAIHANGGET = 10 ;
    const FENYE = 10 ;

    /**
     * 获得用户订单数据
     */
    public function index()
    {
        $order = M() ;
        $tdc_order = M('orders','tdc_') ;
        $user_id = get_user_id() ;
        $keyword = I('keyword') ;
        $list_rows = I('list_rows') ;

        $path_info = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : '';
        $current_user = strpos($path_info,'current_user') ;
        import("@.ORG.Util.Page");

        $sql = "SELECT `orders`.`id`,`orders`.`oid`,`orders`.`total_amount`,`user`.`name` FROM `tdc_orders` AS `orders`
             LEFT JOIN `oa_crm_affiliation` AS `crm` ON `orders`.`uid` = `crm`.`custom_id`
             LEFT JOIN `oa_user` AS `user` ON `crm`.`sale_id` = `user`.`id`" ;

        if($keyword){
            $map['`tdc_orders`.`oid`'] = ['LIKE', "%$keyword%"] ;
        }

        if(empty($current_user)){
            $count = $tdc_order->where($map)->count() ;
            if($keyword){
                $sql = $sql . " WHERE `orders`.`oid` LIKE '%{$keyword}%' " ;
            }
        }else{
            $map['`oa_crm_affiliation`.`sale_id`'] = ['EQ', $user_id] ;
            $count = $tdc_order->join('`oa_crm_affiliation`  ON  `tdc_orders`.`uid` = `oa_crm_affiliation`.`custom_id`','LEFT')->where($map)->count() ;
            $sql = $sql . " WHERE `user`.`id` = '{$user_id}' ";

            if($keyword){
                $sql = $sql . " AND `orders`.`oid` LIKE '%{$keyword}%' " ;
            }
        }

        $p = new \Page($count,$list_rows ? : SELF::FENYE);
        $sql = $sql . " LIMIT " . $p -> firstRow .",". $p -> listRows ."";
        $page = $p -> show();

        $orders = $order->query($sql) ;

        $this -> assign('orders', $orders);
        $this -> assign('page', $page);
        $this->display();
    }

    /**
     * 显示某个订单的想洗内容
     */
    public function show()
    {
        $id = I('id') ;
        $order = M() ;

        $sql = 'SELECT `tdc_users`.`username`,`orders`.`total_amount`,`orders`.`updated_at`,`goods`.`name`,`goods`.`price`,`details`.`count` FROM `tdc_orders` AS `orders`
                LEFT JOIN `tdc_order_detail` AS `details` ON `orders`.`oid` = `details`.`oid`
                LEFT JOIN `tdc_users` ON `orders`.`uid` = `tdc_users`.`uid`
                LEFT JOIN `tdc_goods` AS `goods` ON `goods`.`gid` = `details`.`product_id`' ;

        $sql = $sql . " WHERE `orders`.`id` = '{$id}' ";
        $order_info = $order->query($sql) ;

        $this -> assign('order_info', $order_info);
        $this->display();
    }

    /**
     * 显示业务员的月销售额度
     */
    public function paihang(){

        $m = M() ;

        $sql = "SELECT `oa_user`.`name`,SUM(`orders`.`total_amount`) AS `amount` FROM `oa_user`
                            LEFT JOIN `oa_crm_affiliation` AS `crm` ON `oa_user`.`id` = `crm`.`sale_id`
                            LEFT JOIN `tdc_orders` AS `orders` ON `orders`.`uid` = `crm`.`custom_id`
                            where date_format(`orders`.`created_at`,'%Y-%m') = date_format(date_sub(curdate(), interval 0 month),'%Y-%m')
                            GROUP BY `crm`.`sale_id`
                            ORDER BY `amount` DESC
                            LIMIT 0," . SELF::PAIHANGGET ."
            ";

        $paihang = $m->query($sql) ;

        $this->assign('paihang',$paihang) ;
        $this->display();
    }

}

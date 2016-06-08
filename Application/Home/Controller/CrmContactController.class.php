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

class CrmContactController extends HomeController
{
    protected $config = array('app_type' => 'public');

    // 过滤查询字段
    function _search_filter(&$where)
    {
        $keyword = I('keyword');
        if (!empty($keyword) && empty($where['username'])) {
            $where['username'] = array('like', "%" . $keyword . "%");
        }
    }
    /***********************************************************
     * 全部用户列表
     ***********************************************************/
    public function all(){
        $this->getData();
        $this->assign("name", ["全部客户", 'all']);
        $this->display("CrmContact/index");
    }
    /***********************************************************
     * 我的用户列表
     ***********************************************************/
    public function index()
    {
        $this->getData(get_user_id());
        $this->assign("name", ["我的客户", 'belong']);
        $this->display();
    }

    /*************************************************************
     * 显示用户详情
     * @param $id
     ***********************************************************/
    public function show_contact($id){
        $data = $this->getTheUser($id);
        $data['sex'] = $data['gender'] == 1 ? "男" : "女";
        $this->assign("user", $data);
        $this->display();
    }

    /**
     * 获取数据列表
     * @param bool|false $id
     * @param bool|true  $page
     */
    private function getData($id = false, $page = true){
        //实例化用户表
        $model = M("users", "tdc_");
        //查询条件
        $where = $this -> _search($model);
        if (method_exists($this, '_search_filter')) {
            $this -> _search_filter($where);
        }
        if($id){
            $where['sale_id'] = $id;
        }
        //读取数据
        $join = ['LEFT JOIN oa_crm_affiliation as crm on crm.custom_id = tdc_users.uid',
                 'LEFT JOIN oa_user as oa on oa.id = crm.sale_id'];
        $field = "tdc_users.uid, tdc_users.username, oa.name, oa.id, tdc_users.address, tdc_users.gender";
        $this->_page($model, $where, 'uid desc', $join, $field, $page);
    }
    /**
     * 获取指定用户信息
     * @param int  $id
     * @return data
     */
    private function getTheUser($id){
        $data = M("users", "tdc_")
                ->where("uid = $id")
                ->join("oa_crm_affiliation as crm on crm.custom_id = tdc_users.uid", "left")
                ->join("oa_user as oa on oa.id = crm.sale_id", "left")
                ->find();
        return $data;
    }

    // 添加客户
    public function add_contact()
    {
        $plugin['uploader'] = true;
        $plugin['date'] = true;
        $plugin['editor'] = true;
        $this->assign("plugin", $plugin);

        $user['user_id'] = get_user_id();
        $user['user_name'] = get_user_name();
        $this->assign('user', $user);

        $model_flow_field = D("UdfField");
        $field_list = $model_flow_field->get_field_list(1);
        $this->assign("field_list", $field_list);

		$map['is_del'] = array('eq', '0');
		$list = D("ProductView") -> where($map) -> select();

		foreach ($list as $Key => $val) {
			$product[$val['folder_name']][] = $val['name'];
		}
		$this -> assign('product', $product);

        $this->display();
    }

    public function get_compnay_list()
    {
        $company = M('CrmCompany');
        $where['user_id'] = get_user_id();
        $company_list = $company->field('id,name') -> where($where) -> select();
        $data2['message'] = '';
        $data2['value'] = $company_list;
        $data2['code'] = 200;
        $data2['redirect'] = '';

        $this -> ajaxReturn($data2);
    }
    public function get_salesman_list()
    {
        $salesman = D('UserView');
        $where['is_del'] =0;
        $salesman_list = $salesman->field('id,name') -> where($where) -> select();
        $data2['message'] = '';
        $data2['value'] = $salesman_list;
        $data2['code'] = 200;
        $data2['redirect'] = '';

        $this -> ajaxReturn($data2);
    }

    // 保存客户
    public function add_contact_save()
    {
        $contact=M('CrmContact');
        $contact->create();
        $contact->user_id=get_user_id();
        $contact->user_name=get_user_name();
        $contact->create_time=time();
        $contact->udf_data=D('UdfField') -> get_field_data();
        $result=$contact->add();
        if($result){
           $this->success('新增成功！');
        }
    }

    // 编辑客户
    public function edit_contact($id)
    {
        $plugin['uploader'] = true;
        $plugin['editor'] = true;
        $this->assign("plugin", $plugin);

        $model = M("crm_contact");
        $vo = $model->find($id);

        if (empty($vo)) {
            $this->error("系统错误");
        }
        $this->assign("vo", $vo);

        $field_list = D("UdfField")->get_data_list($vo['udf_data']);
        $this->assign("field_list", $field_list);

        $map['is_del'] = array('eq', '0');
        $list = D("ProductView")->where($map)->select();
        foreach ($list as $Key => $val) {
            $product[$val['folder_name']][] = $val['name'];
        }

        $this->assign('product', $product);
        $this->display();
    }
    public function edit_contact_save()
    {
        $contact=M('CrmContact');
        $contact->create();
        $contact->udf_data=D('UdfField') -> get_field_data();
        $result=$contact->save();
        if($result){
           $this->success('编辑成功！');
        }
    }

    // 删除客户
    public function del_contact($contact_id)
    {
        $this->_del($contact_id, "crm_contact");
    }

    public function add_activity_save(){
        $activity=M('CrmActivity');
        $activity->create();
        $activity->create_time=time();

        if($activity->add_file==""){
          $activity->add_file='null';
        }
        $activity->user_id=get_user_id();
        $activity->user_name=get_user_name();
        $result=$activity->add();
        if($result){
            $this->success('新增成功！');
        }
    }
    //转交
    public function transfer() {
        $this->getData(false, false);
        $where2['is_del'] = 0;
        $user_list = D("UserView") -> where($where2) -> select();
        $this -> assign("user_list", $user_list);
        $this -> display();
    }
    public function transfer_save($contact_id, $user_id) {
        $contact = M('crm_affiliation');
        foreach ($contact_id as $v) {
            $itemId = $contact->where(['custom_id'=>$v])->getField('id');
            if($itemId){
                $contact -> where(['id'=>$itemId]) -> save(['sale_id'=>$user_id]);
            }else{
                $contact -> add(['sale_id'=>$user_id, 'custom_id'=>$v]);
            }

        }
        $this -> success('分配成功！');

    }
    public function share(){
         $contact = M('CrmContact');

        $where = $this -> _search($contact);
        if (method_exists($this, '_search_filter')) {
            $this -> _search_filter($where);
        }
        // $auth = $this -> config['auth'];
        // if ($auth['admin']) {

        // } elseif ($auth['write']) {
        //     $user = M('User');
        //     $where2['dept_id'] = get_dept_id();
        //     $id = $user -> field('id') -> where($where2) -> select();
        //     $user_list = array_column($id, 'id');
        //     $where['user_id'] = array('in', $user_list);
        // } elseif ($auth['read']) {
        //     $where['user_id'] = get_user_id();
        // }
        $where['salesman_id'] = get_user_id();
        $contact_list = $contact -> where($where) -> select();
        $this -> assign('contact_list', $contact_list);

        $where2['is_del'] = 0;
        $user_list = D("UserView") -> where($where2) -> select();
        $this -> assign("user_list", $user_list);
        $this -> display();
    }
     public function share_save($contact_id, $user_id) {
        if($user_id==get_user_id()){
            $this->error('不能共享给自己');
        }
        $user=M('User')->find($user_id);
        $contact = M('CrmContact');
        foreach ($contact_id as $v) {
            $list1=$contact->find($v);
            $where['salesman_id']=$user_id;
            $list2=$contact->where($where)->select();
            foreach ($list2 as $li) {
               if($list1['name']==$li['name']&&$list1['compnay_name']==$li['compnay_name']){
                  $this -> error('共享目标已存在客户'.$list1['name']);
               }
            }
            $contact->find($v);
            $contact->id=null;
            $contact->salesman_id=$user_id;
            $contact->salesman_name=$user['name'];
            $contact -> add();
        }
        $this -> success('共享成功！');

    }
    public function import() {
        $opmode = $_POST["opmode"];
        if ($opmode == "import") {
            $import_user = array();
            $File = D('File');
            $file_driver = C('DOWNLOAD_UPLOAD_DRIVER');
            $info = $File -> upload($_FILES, C('DOWNLOAD_UPLOAD'), C('DOWNLOAD_UPLOAD_DRIVER'), C("UPLOAD_{$file_driver}_CONFIG"));
            if (!$info) {
                $this -> error('上传错误');
            } else {
                //取得成功上传的文件信息
                //$uploadList = $upload -> getUploadFileInfo();
                Vendor('Excel.PHPExcel');
                //导入thinkphp第三方类库
                $import_file = $info['uploadfile']["path"];
                $import_file = substr($import_file, 1);
                $objPHPExcel = \PHPExcel_IOFactory::load($import_file);
                //$objPHPExcel = \PHPExcel_IOFactory::load('Uploads/Download/Org/2014-12/547e87ac4b0bf.xls');
                $sheetData = $objPHPExcel -> getActiveSheet() -> toArray(null, true, true, true);
                $model = D("CrmContact");
                foreach ($sheetData[1] as $v) {
                    $udf_data_key[]=$v;
                }
                for ($i = 0; $i <= count($sheetData); $i++) { 
                    foreach ($sheetData[$i] as  $v) {
                        $udf[$i][]=$v;
                    }
                }
                for ($i = 2; $i <= count($udf); $i++) {
                    $data['name'] = $udf[$i][0];
                    $data['user_id']=get_user_id();
                    $data['user_name']=get_user_name();
                    $data['create_time']=time();
                    $data['company_name'] = $udf[$i][1];
                    $data['company_id'] = $udf[$i][2];
                    $data['dept'] = $udf[$i][3];
                    $data['pisition'] = $udf[$i][4];
                    $data['email'] = $udf[$i][5];
                    $data['office_tel'] = $udf[$i][6];
                    $data['mobile_tel'] = $udf[$i][7];
                    $data['im'] = $udf[$i][8];
                    $data['remark'] = $udf[$i][9];
                    $data['salesman_name'] =get_user_name(); 
                    $data['salesman_id'] = get_user_id();
                    $data['product'] = $udf[$i][12];
                    for ($z=13; $z <count($udf_data_key) ; $z++) {
                        $where['name']=$udf_data_key[$z];
                        $where['controller']='CrmContact';
                        $udffield=M('UdfField')->where($where)->find();
                        $udf_data[$udffield['id']]=$udf[$i][$z];
                    }
                    $data['udf_data']=json_encode($udf_data);
                    $model->add($data);

                }
                $this -> assign('jumpUrl', get_return_url());
                $this -> success('导入成功！');
            }
        } else {
            $this -> display();
        }
    }
    function export() {
        $model = M('CrmContact');
        $list = $model -> where($_SESSION['report']) -> select();
        $title=array('客户名称','创建人','创建时间','部门', '职位','电子邮件', '办公电话', '移动电话', 'im','业务员','公司');
        $json_data = $model->field('udf_data')->select();
        $UdfField=M('UdfField');
        foreach ($json_data as $v) {
            foreach(json_decode($v['udf_data'],true) as $k=>$v){
                $where['id']=$k;
                $name=$UdfField->where($where)->find();
                $title[]=$name['name'];
            }
        }
        $title[]='其他';
        $title=array_unique($title);
        $this -> exportexcel($list, $title, 'report');
    }
    function exportexcel($list = array(), $title = array(), $filename = 'report') {
        header("Content-type:application/octet-stream");
        header("Accept-Ranges:bytes");
        header("Content-type:application/vnd.ms-excel");
        header("Content-Disposition:attachment;filename=" . $filename . ".xls");
        header("Pragma: no-cache");
        header("Expires: 0");
        //导出xls 开始
        if (!empty($title)) {
            foreach ($title as $k => $v) {
                $title[$k] = iconv("UTF-8", "GB2312", $v);
            }
            $title = implode("\t", $title);
            echo "$title\n";
        }
        if (!empty($list)) {
            foreach ($list as $key => $val) {
                $data[$key]["name"]= iconv("UTF-8", "gb2312",$val['name']);
                $data[$key]["user_name"]= iconv("UTF-8", "gb2312",$val['user_name']);
                $data[$key]['create_time'] = iconv("UTF-8", "gb2312",date('Y-m-d', $val['create_time']));
                $data[$key]['dept'] = iconv("UTF-8","gb2312",$val['dept']);
                $data[$key]['position'] = iconv("UTF-8", "gb2312",$val['position']);
                $data[$key]['email'] = iconv("UTF-8", "gb2312", $val['email']);
                $data[$key]['office_tel'] = iconv("UTF-8", "gb2312", $val['office_tel']);
                $data[$key]['mobile_tel'] = iconv("UTF-8", "gb2312", $val['mobile_tel']);
                $data[$key]['im'] = iconv("UTF-8", "gb2312", $val['im']);
                $data[$key]['salesman_name'] = iconv("UTF-8", "gb2312", $val['salesman_name']);
                $data[$key]['company_name'] = iconv("UTF-8", "gb2312", $val['company_name']);
                foreach(json_decode($val['udf_data'],true) as $k=>$v){
                    $data[$key][$k]=iconv("UTF-8", "gb2312", $v);
                }
                $data[$key]['remark'] = iconv("UTF-8", "gb2312", $val['remark']);

                $data[$key] = implode("\t", $data[$key]);
                
            }
          
            echo implode("\n", $data);
        }
    }
    function del_activity($id){
        $this->_del($id,'CrmActivity');
    }
    function contact_field_manage()
    {
        $this->assign("folder_name", "CRM 客户自定义字段管理");
        $this->_field_manage(1);
    }


    public function upload()
    {
        $this->_upload();
    }

    function down($attach_id)
    {
        $this->_down($attach_id);
    }

}

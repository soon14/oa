<?php
 
class Ldap {
	 
	private $connect;
	private $is_login;
	private $server;
	private $port;
	private $user;
	private $pwd;
	private $base_dn;
	
	function __construct($server,$port,$ldap_user,$ldap_pwd,$ldap_base_dn) {
		$this->server=$server;
		$this->port=$port;
		$this->user=$ldap_user;
		$this->pwd=$ldap_pwd;
		$this->base_dn=$ldap_base_dn;
	}
	
	function connect(){
		echo $this->server;
		echo '<br>';
		echo $this->port;
		 echo '<br>';
		$this->connect= ldap_connect($this->server,$this->port);
		ldap_set_option($ldap_conn, LDAP_OPT_PROTOCOL_VERSION,3);
		ldap_set_option($ldap_conn, LDAP_OPT_REFERRALS,0);
	}
	
	function login(){
		print_r($this->connect);
		echo $this->user;
		echo '<br>';
		echo $this->pwd;
		echo '<br>';		
		$this->is_login=ldap_bind($this->connect,$this->user,$this->pwd) or die(ldap_error($this->connect));//与服务器绑定
	}
		
	public function insert_ou($name,$id){
		
		$this->connect();
		$this->login();
		
	    $data["objectClass"]="organizationalUnit";
		$data["ou"]="$name";
		$data["name"]="$name";
		$data["l"]="$id";
 
		ldap_add($this->connect,"OU={$name},DC=ldap,DC=test",$data)or die(ldap_error($this->connect));	
	}
	
	public function update_ou($name,$id){
		$this->connect();
		$this->login();
		
	    $data["objectClass"]="organizationalUnit";
		$data["ou"]="$name";
		$data["name"]="$name";
		$data["l"]="$id";
 
		ldap_modify($this->connect,"OU={$name},DC=ldap,DC=test",$data)or die(ldap_error($this->connect));		
	}
	
	
	public function rename_ou($old_name,$new_name){
		$this->connect();
		$this->login(); 
		ldap_rename ($this->connect,"OU={$old_name},DC=ldap,DC=test","OU={$new_name}","DC=ldap,DC=test",true)or die(ldap_error($this->connect));	
	}
		
	public function insert_user($emp_no,$dept_name,$user_name,$password){
		$this->connect();
		$this->login();
		if(!$this->is_login){
			return '登录失败';
		}else{
	        $data["objectClass"]="user";
			$data['userAccountControl']= 512;
			
			$data['name'] = $user_name;
			$data['displayName']= $user_name;
			$data['cn']= $emp_no;
			$data['userPrincipalName']= $emp_no;
			$data['unicodePwd']=mb_convert_encoding('"'.$password.'"', 'utf-16le');		
			
			ldap_add($this->conn,"CN=$emp_no,OU={$dept_name},DC=ldap,DC=test",$data)or die('no');		
		}
	}
			
	public function update_user($emp_no,$dept_name,$user_name,$password,$enable){
		if(!$this->is_login){
			return '登录失败';
		}else{
	        $data["objectClass"]="top";
	        $data["objectClass"]="user";
			$data['userAccountControl']= 512;
			
			$data['name'] = $user_name;
			$data['displayName']= $user_name;
			$data['cn']= $emp_no;
			$data['userPrincipalName']= $emp_no;
			$data['unicodePwd']=mb_convert_encoding('"'.$password.'"', 'utf-16le');		
			
			ldap_modify($this->conn,"CN=$emp_no,OU={$dept_name},DC=ldap,DC=test",$data)or die('no');		
		}
	}
			
	public function del_user($emp_no){
		$ldap_conn = ldap_connect("192.168.1.199:389") //建立与 LDAP 服务器的连接
		or die("Can't connect to LDAP server2");
		ldap_set_option($ldap_conn, LDAP_OPT_PROTOCOL_VERSION,3);
		$r=ldap_bind($ldap_conn, "CN=Administrator,CN=Users,DC=test,dc=local","Qiwei123") or die(ldap_error($ldap_conn));//与服务器绑定
		$dn="CN=$name,CN=Users,DC=test,DC=local";
		ldap_delete($ldap_conn, $dn) or die('no');
		ldap_unbind($ldap_conn);
		ldap_close($ldap_conn);
	 }	
	
	public function reset_pwd($emp_no,$password){
		
	}
}
?>
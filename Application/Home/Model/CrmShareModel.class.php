<?php

namespace Home\Model;

use Think\Model;

class CrmShareModel extends CommonModel {
	function set_share($contact_id, $user_id) {
		if (empty ( $contact_id )) {
			return true;
		}
		if (empty ( $user_id )) {
			return true;
		}
		if (is_array ( $contact_id )) {
			$user_list = array_filter ( $contact_id );
		} else {
			$contact_id = explode ( ",", $contact_id );
			$contact_id = array_filter ( $contact_id );
		}
		$contact_id = implode ( ",", $contact_id );
		
		if (is_array ( $user_id )) {
			$user_id = array_filter ( $user_id );
		} else {
			$user_id = explode ( ",", $user_id );
			$user_id = array_filter ( $user_id );
		}
		$user_id = implode ( ",", $user_id );
		
		$where = 'a.id in (' . $contact_id . ') AND b.id in(' . $user_id . ')';
		$sql = 'INSERT INTO ' . $this->tablePrefix . 'crm_share (contact_id,user_id) ';
		$sql .= ' SELECT a.id, b.id FROM ' . $this->tablePrefix . 'crm_contact a, ' . $this->tablePrefix . 'user b WHERE ' . $where;
		$result = $this->execute ( $sql );
		if ($result === false) {
			return false;
		} else {
			return true;
		}
	}
}
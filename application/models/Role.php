<?php
class Role extends CI_Model{
	
	public $role_id,
		   $company_id,
		   $name,
		   $created,
		   $updated,
		   $isactive;

	public function __construct(){
		parent::__construct();
	}

	public function add(){

		$query = "INSERT INTO cm_role(company_id,name) VALUES ('$this->company_id','$this->name')";

		$this->db->trans_start();

		$this->db->query($query);

		$this->db->trans_complete();

		if($this->db->trans_status() === TRUE){
			return true;
		}else{
			return false;
		}
	}

	public function getData($type = "all"){

		switch ($type) {
			case 'all':
				$query = "SELECT  
						  r.role_id,
						  r.name,
						  r.isactive,
						  c.name AS company
						  FROM cm_role AS r 
						  INNER JOIN cm_company AS c ON (c.company_id = r.company_id) 
						  ORDER BY name ASC";
			break;
			case 'byname':
				$query = "SELECT * FROM cm_role WHERE name = '$this->name' ORDER BY name ASC";
			break;
			case 'byid':
				$query = "SELECT * FROM cm_role WHERE role_id = $this->role_id ORDER BY name ASC";
			break;
			case 'get_companies':
				$query = "SELECT company_id AS value, name AS text FROM cm_company ORDER BY name ASC";
			break;
		}

		$query = $this->db->query($query);

		return $query->result();

	}

	public function update(){

		$query = "UPDATE cm_role SET company_id = '$this->company_id', name = '$this->name' WHERE role_id = $this->role_id";

		$this->db->trans_start();

		$this->db->query($query);

		$this->db->trans_complete();

		if($this->db->trans_status() === TRUE){
			return true;
		}else{
			return false;
		}
	}

	public function isactive($val){

		$query = "UPDATE cm_role SET isactive = '$val' WHERE role_id = $this->role_id";

		$this->db->trans_start();

		$this->db->query($query);

		$this->db->trans_complete();

		if($this->db->trans_status() === TRUE){
			return true;
		}else{
			return false;
		}

	}
}
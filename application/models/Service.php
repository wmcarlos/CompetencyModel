<?php
class Service extends CI_Model{
	
	public $service_id,
		   $company_id,
		   $name,
		   $servicetype,
		   $position,
		   $issumary,
		   $service_parent_id,
		   $url,
		   $icon_class,
		   $created,
		   $updated,
		   $isactive;

	public function __construct(){
		parent::__construct();
	}

	public function add(){

		$query = "INSERT INTO cm_service(company_id,name,servicetype,position,issumary,service_parent_id,url,icon_class) VALUES ($this->company_id,'$this->name','$this->servicetype',$this->position,'$this->issumary',$this->service_parent_id,'$this->url','$this->icon_class')";

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
				$query = "SELECT * FROM cm_service ORDER BY name ASC";
			break;
			case 'byname':
				$query = "SELECT * FROM cm_service WHERE name = '$this->name' ORDER BY name ASC";
			break;
			case 'byid':
				$query = "SELECT * FROM cm_service WHERE service_id = $this->service_id ORDER BY name ASC";
			break;
			case 'get_companies':
				$query = "SELECT company_id AS value, name AS text FROM cm_company ORDER BY name ASC";
			break;
		}

		$query = $this->db->query($query);

		return $query->result();

	}

	public function update(){

		$query = "UPDATE cm_service SET value = '$this->value', name = '$this->name', short_name = '$this->short_name', phone = '$this->phone', email = '$this->email' WHERE company_id = $this->company_id";

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

		$query = "UPDATE cm_service SET isactive = '$val' WHERE company_id = $this->company_id";

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
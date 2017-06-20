<?php
class Chargelevel extends CI_Model{
	
	public $charge_level_id,
		   $company_id,
		   $name,
		   $created,
		   $updated,
		   $isactive;

	public function __construct(){
		parent::__construct();
	}

	public function add(){

		$query = "INSERT INTO cm_charge_level(company_id,name) VALUES ($this->company_id,'$this->name')";

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
						  cl.charge_level_id,
						  cl.name,
						  cl.isactive,
						  c.name AS company
						  FROM cm_charge_level AS cl 
						  INNER JOIN cm_company AS c ON (c.company_id = cl.company_id)
						  ORDER BY cl.name ASC";
			break;
			case 'byname':
				$query = "SELECT * FROM cm_charge_level WHERE name = '$this->name' ORDER BY name ASC";
			break;
			case 'byid':
				$query = "SELECT * FROM cm_charge_level WHERE charge_level_id = $this->charge_level_id ORDER BY name ASC";
			break;
			case 'get_companies':
				$query = "SELECT company_id AS value, name AS text FROM cm_company ORDER BY name ASC";
			break;
		}

		$query = $this->db->query($query);

		return $query->result();

	}

	public function update(){

		$query = "UPDATE cm_charge_level SET company_id = $this->company_id, name = '$this->name'
				  WHERE charge_level_id = $this->charge_level_id";

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

		$query = "UPDATE cm_charge_level SET isactive = '$val' WHERE charge_level_id = $this->charge_level_id";

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
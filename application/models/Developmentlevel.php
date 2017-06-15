<?php
class Developmentlevel extends CI_Model{
	
	public $development_level_id,
		   $company_id,
		   $name,
		   $position,
		   $value,
		   $created,
		   $updated,
		   $isactive;

	public function __construct(){
		parent::__construct();
	}

	public function add(){

		$query = "INSERT INTO cm_development_level(company_id,name,position,value) VALUES ($this->company_id,'$this->name',$this->position,$this->value)";

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
							dl.development_level_id,
							dl.name,
							dl.position,
							dl.value,
							dl.isactive,
							c.name AS company
						  FROM cm_development_level AS dl
						  INNER JOIN cm_company AS c ON (c.company_id = dl.company_id)
						  ORDER BY dl.name ASC";
			break;
			case 'byname':
				$query = "SELECT * FROM cm_development_level WHERE name = '$this->name' ORDER BY name ASC";
			break;
			case 'byid':
				$query = "SELECT * FROM cm_development_level WHERE development_level_id = $this->development_level_id ORDER BY name ASC";
			break;
			case 'get_companies':
				$query = "SELECT company_id AS value, name AS text FROM cm_company ORDER BY name ASC";
			break;
		}

		$query = $this->db->query($query);

		return $query->result();

	}

	public function update(){

		$query = "UPDATE cm_development_level SET company_id = $this->company_id, name = '$this->name', position = '$this->position', value = '$this->value'
		    WHERE development_level_id = $this->development_level_id";

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

		$query = "UPDATE cm_development_level SET isactive = '$val' WHERE development_level_id = $this->development_id";

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
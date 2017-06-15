<?php
class Departament extends CI_Model{
	
	public $departament_id,
		   $company_id,
		   $name,
		   $departament_parent_id,
		   $created,
		   $updated,
		   $isactive;

	public function __construct(){
		parent::__construct();
	}

	public function add(){

		$query = "INSERT INTO cm_departament(company_id,name,departament_parent_id) VALUES ($this->company_id,'$this->name',$this->departament_parent_id)";

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
						  d1.departament_id,
						  d1.name,
						  COALESCE(d2.name, 'NOT PARENT') AS parent,
						  c.name AS company,
						  d1.isactive
						  FROM cm_departament AS d1
						  LEFT JOIN cm_departament AS d2 ON (d2.departament_id = d1.departament_parent_id)
						  INNER JOIN cm_company AS c ON (d1.company_id = c.company_id)	
						  ORDER BY d1.name ASC";
			break;
			case 'byname':
				$query = "SELECT * FROM cm_departament WHERE name = '$this->name' ORDER BY name ASC";
			break;
			case 'byid':
				$query = "SELECT * FROM cm_departament WHERE departament_id = $this->departament_id ORDER BY name ASC";
			break;
			case 'get_companies':
				$query = "SELECT company_id AS value, name AS text FROM cm_company ORDER BY name ASC";
			break;
			case 'get_departaments':
				$query = "SELECT departament_id AS value, name AS text FROM cm_departament ORDER BY name ASC";
			break;
		}

		$query = $this->db->query($query);

		return $query->result();

	}

	public function update(){

		$query = "UPDATE cm_departament SET company_id = $this->company_id, name = '$this->name', departament_parent_id = '$this->departament_parent_id' WHERE departament_id = $this->departament_id";

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

		$query = "UPDATE cm_departament SET isactive='$val' WHERE departament_id = $this->departament_id";

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
<?php
class Charge extends CI_Model{
	
	public $charge_id,
		   $departament_id,
		   $name,
		   $charge_parent_id,
		   $charge_level_id,
		   $created,
		   $updated,
		   $isactive;
		  
	public function __construct(){
		parent::__construct();
	}

	public function add(){

		$query = "INSERT INTO cm_charge(departament_id,name,charge_parent_id,charge_level_id) VALUES ($this->departament_id,'$this->name',$this->charge_parent_id,$this->charge_level_id)";

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
						  ch.charge_id,
						  ch.name,
						  ch.isactive,
						  d.name AS departament,
						  COALESCE(ch2.name, 'SIN PADRE') AS parent,
						  cl.name AS charge_level
						  FROM cm_charge AS ch 
						  INNER JOIN cm_departament AS d ON (d.departament_id = ch.departament_id)
						  LEFT JOIN cm_charge AS ch2 ON (ch2.charge_id = ch.charge_parent_id)
						  INNER JOIN cm_charge_level AS cl ON (cl.charge_level_id = ch.charge_level_id) 
						  ORDER BY ch.name";
			break;
			case 'byname':
				$query = "SELECT * FROM cm_charge WHERE name = '$this->name' ORDER BY name ASC";
			break;
			case 'byid':
				$query = "SELECT * FROM cm_charge WHERE charge_id = $this->charge_id ORDER BY name ASC";
			break;
			case 'get_departaments':
				$query = "SELECT departament_id AS value, name AS text FROM cm_departament ORDER BY name ASC";
			break;
			case 'get_charges':
				$query = "SELECT charge_id AS value, name AS text FROM cm_charge ORDER BY name ASC";
			break;
			case 'get_chargelevels':
				$query = "SELECT charge_level_id AS value, name AS text FROM cm_charge_level ORDER BY name ASC";
			break;
		}

		$query = $this->db->query($query);

		return $query->result();

	}

	public function update(){

		$query = "UPDATE cm_charge SET departament_id = $this->departament_id, name = '$this->name', charge_parent_id = '$this->charge_parent_id', charge_level_id = '$this->charge_level_id'
		    WHERE charge_id = $this->charge_id";

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

		$query = "UPDATE cm_charge SET isactive = '$val' WHERE charge_id = $this->charge_id";

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
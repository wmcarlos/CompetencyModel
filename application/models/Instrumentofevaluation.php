<?php
class Instrumentofevaluation extends CI_Model{
	
	public $instrument_of_evaluation_id,
		   $company_id,
		   $name,
		   $description,
		   $instructions,
		   $evaluationtype,
		   $charge_level_id,
		   $chargelevels,
		   $values,
		   $status,
		   $created,
		   $updated,
		   $isactive;

	public function __construct(){
		parent::__construct();
	}

	public function add(){

		$query = "INSERT INTO cm_instrument_of_evaluation(company_id,name,description,instructions,evaluationtype,charge_level_id,status) VALUES ($this->company_id,'$this->name','$this->description','$this->instructions','$this->evaluationtype',$this->charge_level_id,'$this->status')";

		$this->db->trans_start();

		$this->db->query($query);

		$titem = $this->getData("byname");

		$this->instrument_of_evaluation_id = $titem[0]->instrument_of_evaluation_id;

		for($i = 1; $i < count($this->chargelevels); $i++){

			$this->db->query("INSERT INTO cm_ponderation_charge_level (instrument_of_evaluation_id,charge_level_id,value) VALUES (".$this->instrument_of_evaluation_id.",".$this->chargelevels[$i].",".$this->values[$i].")");
		}

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
						 	ioe.instrument_of_evaluation_id,
						 	ioe.name,
						 	CASE WHEN ioe.evaluationtype = 'UC' THEN 'Cargo Arriba'
						 		 WHEN ioe.evaluationtype = 'AE' THEN 'Auto Evaluacion'
						 		 WHEN ioe.evaluationtype = 'AB' THEN 'Ambos'
						 	END AS evaluationtype,
						 	CASE WHEN ioe.status = 'DR' THEN 'Borrador'
						 		 WHEN ioe.status = 'CO' THEN 'Completo'
						 	END AS status,
						 	ioe.isactive,
						 	c.name AS company,
						 	cl.name AS charge_level
						  FROM cm_instrument_of_evaluation AS ioe
							  INNER JOIN cm_company AS c ON (c.company_id = ioe.company_id)
							  INNER JOIN cm_charge_level AS cl ON (cl.charge_level_id = ioe.charge_level_id)
						  ORDER BY ioe.name ASC";
			break;
			case 'byname':
				$query = "SELECT * FROM cm_instrument_of_evaluation WHERE name = '$this->name' ORDER BY name ASC";
			break;
			case 'byid':
				$query = "SELECT * FROM cm_instrument_of_evaluation WHERE instrument_of_evaluation_id = $this->instrument_of_evaluation_id ORDER BY name ASC";
			break;
			case 'get_companies':
				$query = "SELECT company_id AS value, name AS text FROM cm_company ORDER BY name ASC";
			break;
			case 'get_chargelevels':
				$query = "SELECT charge_level_id AS value, name AS text FROM cm_charge_level ORDER BY name ASC";
			break;
			case 'get_ponderation_levels':
				$query = "SELECT 
						  cp.charge_level_id,
						  cp.value,
						  cl.name AS charge_level
					      FROM cm_ponderation_charge_level AS cp
					      INNER JOIN cm_charge_level AS cl ON (cl.charge_level_id = cp.charge_level_id)
					      WHERE cp.instrument_of_evaluation_id = $this->instrument_of_evaluation_id";
			break;
		}

		$query = $this->db->query($query);

		return $query->result();

	}

	public function update(){

		$query = "UPDATE cm_instrument_of_evaluation SET company_id = $this->company_id, name = '$this->name', description = '$this->description', instructions = '$this->instructions', evaluationtype = '$this->evaluationtype', charge_level_id = $this->charge_level_id, status = '$this->status'
			  WHERE instrument_of_evaluation_id = $this->instrument_of_evaluation_id";

		$this->db->trans_start();

		$this->db->query($query);

		$this->db->query("DELETE FROM cm_ponderation_charge_level WHERE instrument_of_evaluation_id = $this->instrument_of_evaluation_id");

		for($i = 1; $i < count($this->chargelevels); $i++){

			$this->db->query("INSERT INTO cm_ponderation_charge_level (instrument_of_evaluation_id,charge_level_id,value) VALUES (".$this->instrument_of_evaluation_id.",".$this->chargelevels[$i].",".$this->values[$i].")");
		}

		$this->db->trans_complete();

		if($this->db->trans_status() === TRUE){
			return true;
		}else{
			return false;
		}
	}

	public function isactive($val){

		$query = "UPDATE cm_instrument_of_evaluation SET isactive='$val' WHERE instrument_of_evaluation_id = $this->instrument_of_evaluation_id";

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
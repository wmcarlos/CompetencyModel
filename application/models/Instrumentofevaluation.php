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
		   $competencies,
		   $positions,
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

		for($e = 1; $e < count ($this->competencies); $e++){
			$this->db->query("INSERT INTO cm_competency_instrument (instrument_of_evaluation_id,competency_id,position) VALUES ($this->instrument_of_evaluation_id,".$this->competencies[$e].",".$this->positions[$e].")");
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
			case 'get_competencies':
				$query = "SELECT competency_id AS value, name AS text FROM cm_competency ORDER BY name ASC";
			break;
			case 'get_competencies_assigned':
				$query = "SELECT
							  ci.instrument_of_evaluation_id,
							  ci.competency_id,
							  c.name AS competency,
							  ci.position
						  FROM cm_competency_instrument AS ci
							  INNER JOIN cm_competency AS c ON (c.competency_id = ci.competency_id)
						  WHERE ci.instrument_of_evaluation_id = $this->instrument_of_evaluation_id";
			break;
			case 'get_my_evaluations':
				$query = "SELECT 
						  ioe.instrument_of_evaluation_id,
						  ioe.name AS instrumentdes
						  FROM cm_instrument_of_evaluation AS ioe
						  INNER JOIN cm_instrument_period AS ip ON (ip.instrument_of_evaluation_id = ioe.instrument_of_evaluation_id)
						  INNER JOIN cm_period AS p ON (p.period_id = ip.period_id)
						  WHERE ioe.status = 'CO' AND ioe.charge_level_id = ".$this->session->userdata("logged_in")->charge_level_id;
			break;

			case 'get_other_evaluations':
				$query = "SELECT
							u.user_id,
							ioe.instrument_of_evaluation_id,
							u.name AS user,
							c.name AS charge,
							ioe.name AS evaluation
						  FROM cm_charge AS c
							  INNER JOIN cm_charge_assigned AS ca ON (ca.charge_id = c.charge_id)
							  INNER JOIN cm_user AS u ON (u.user_id = ca.user_id)
							  INNER JOIN cm_instrument_of_evaluation AS ioe ON (ioe.charge_level_id = c.charge_level_id)
						  WHERE ioe.status = 'CO' AND c.charge_parent_id = ".$this->session->userdata("logged_in")->charge_id;
			break;
			case 'get_instrument_info':
				$query = "SELECT  
						  ioe.instrument_of_evaluation_id,
						  ioe.instructions,
						  ioe.name,
						  p.startdate,
						  p.enddate
						  FROM cm_instrument_of_evaluation AS ioe
						  INNER JOIN cm_instrument_period AS ip ON (ip.instrument_of_evaluation_id = ioe.instrument_of_evaluation_id)
						  INNER JOIN cm_period AS p ON (p.period_id = ip.period_id)
						  WHERE ioe.instrument_of_evaluation_id = $this->instrument_of_evaluation_id ORDER BY name ASC";
			break;
			case 'get_competencies_of_evaluation':
				$query = "SELECT
							 c.competency_id,
						 	 c.name,
						 	 c.definition
						  FROM cm_competency AS c
						 	 INNER JOIN cm_competency_instrument AS ci ON (ci.competency_id = c.competency_id)
						  WHERE ci.instrument_of_evaluation_id = $this->instrument_of_evaluation_id
						  ORDER BY ci.position ASC";
			break;
			case 'get_domain_levels':
				$query = "SELECT domain_level_id,name,position,value FROM cm_domain_level ORDER BY position ASC";
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

		$this->db->query("DELETE FROM cm_competency_instrument WHERE instrument_of_evaluation_id = $this->instrument_of_evaluation_id");

		for($e = 1; $e < count ($this->competencies); $e++){
			$this->db->query("INSERT INTO cm_competency_instrument (instrument_of_evaluation_id,competency_id,position) VALUES ($this->instrument_of_evaluation_id,".$this->competencies[$e].",".$this->positions[$e].")");
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

	public function getBehaviorIndicators($competency_id){
		$query = $this->db->query("SELECT
					hi.behavioral_indicator_id,
					dl.name AS level,
					dl.value,
					dl.development_level_id,
					hi.description
				  FROM cm_behavioral_indicator AS hi 
				  INNER JOIN cm_development_level AS dl ON (dl.development_level_id = hi.development_level_id)
				  WHERE hi.competency_id = ".$competency_id);

		return $query->result();
	}

	public function insert_evaluation_header($data){
	    $query = "INSERT INTO cm_user_instrument (instrument_of_evaluation_id,user_evaluated_id,user_evaluator_id,evaluationdate,status)VALUES ($this->instrument_of_evaluation_id,".$data['user_evaluated_id'].",".$data['user_evaluator_id'].",NOW(),'CO')";

		$this->db->trans_start();

		$this->db->query($query);

		$this->db->trans_complete();

		if($this->db->trans_status() === TRUE){
			return true;
		}else{
			return false;
		}	
	}

	public function getLastIdFromEvaluation($data){
		$query = $this->db->query("SELECT 
		          user_instrument_id 
				  FROM cm_user_instrument 
				  WHERE	instrument_of_evaluation_id = $this->instrument_of_evaluation_id AND user_evaluated_id = ".$data['user_evaluated_id']." AND user_evaluator_id = ".$data['user_evaluator_id']);
		return $query->row();
	}

	public function insert_evaluation_detail($user_instrument_id,$behavioral_indicator_id,$domain_level_id){
	    $query = "INSERT INTO cm_user_instrument_answer (user_instrument_id,behavioral_indicator_id,domain_level_id) VALUES (".$user_instrument_id.",".$behavioral_indicator_id.",".$domain_level_id.")";

		$this->db->trans_start();

		$this->db->query($query);

		$this->db->trans_complete();

		if($this->db->trans_status() === TRUE){
			return true;
		}else{
			return false;
		}
	}

	public function check_item($user_instrument_id,$behavioral_indicator_id,$domain_level_id){
		$query = $this->db->query("SELECT * FROM cm_user_instrument_answer WHERE user_instrument_id = ".$user_instrument_id." AND behavioral_indicator_id = ".$behavioral_indicator_id." AND domain_level_id = ".$domain_level_id);

		return $query->result();
	}
}
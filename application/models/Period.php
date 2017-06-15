<?php
class Period extends CI_Model{
	
	public $period_id,
		   $company_id,
		   $name,
		   $startdate,
		   $enddate,
		   $created,
		   $updated,
		   $isactive;

	public function __construct(){
		parent::__construct();
	}

	public function add(){

		$query = "INSERT INTO cm_period(company_id,name,startdate,enddate) VALUES ($this->company_id,'$this->name','$this->startdate','$this->enddate')";

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
						  p.period_id,
						  p.name,
						  p.startdate,
						  p.enddate,
						  p.isactive,
						  c.name AS company
						  FROM cm_period AS p
						  INNER JOIN cm_company AS c ON (c.company_id = p.company_id)
						  ORDER BY p.startdate DESC";
			break;
			case 'byname':
				$query = "SELECT * FROM cm_period WHERE name = '$this->name' ORDER BY name ASC";
			break;
			case 'byid':
				$query = "SELECT * FROM cm_period WHERE period_id = $this->period_id ORDER BY name ASC";
			break;
			case 'get_companies':
				$query = "SELECT company_id AS value, name AS text FROM cm_company ORDER BY name ASC";
			break;
		}

		$query = $this->db->query($query);

		return $query->result();

	}

	public function update(){

		$query = "UPDATE cm_period SET company_id = $this->company_id, name = '$this->name', startdate = '$this->startdate', enddate = '$this->enddate'
		    WHERE period_id = $this->period_id";

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

		$query = "UPDATE cm_period SET isactive = '$val' WHERE period_id = $this->period_id";

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
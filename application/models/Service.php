<?php
class Service extends CI_Model{
	
	public $service_id,
		   $company_id,
		   $name,
		   $servicetype,
		   $position,
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

		$query = "INSERT INTO cm_service(company_id,name,servicetype,position,service_parent_id,url,icon_class) VALUES ($this->company_id,'$this->name','$this->servicetype',$this->position,$this->service_parent_id,'$this->url','$this->icon_class')";

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
						  s.service_id,
						  s.name,
						  s.position,
						  s.isactive,
						  c.name AS company,
						  CASE WHEN s.servicetype = 'FO' THEN 'FORMULARIO'
						  	   WHEN s.servicetype = 'RP' THEN 'REPORTE'
						  	   WHEN s.servicetype = 'CH' THEN 'GRAFICO'
						  	   WHEN s.servicetype = 'FD' THEN 'CARPETA'
						  END AS servicetype
						  FROM cm_service AS s
						  INNER JOIN cm_company AS c ON (c.company_id = s.company_id)
						  ORDER BY name ASC";
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
			case 'get_service_parent':
				$query = "SELECT service_id AS value, name AS text FROM cm_service ORDER BY name ASC";
			break;
		}

		$query = $this->db->query($query);

		return $query->result();

	}

	public function update(){

		$query = "UPDATE cm_service SET company_id = '$this->company_id', name = '$this->name', servicetype = '$this->servicetype', position = '$this->position', service_parent_id = $this->service_parent_id, url = '$this->url', icon_class = '$this->icon_class' WHERE service_id = $this->service_id";

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

		$query = "UPDATE cm_service SET isactive = '$val' WHERE service_id = $this->service_id";

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
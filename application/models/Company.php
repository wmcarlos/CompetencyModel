<?php 

class Company extends CI_Model{
	
	public $company_id,
		   $value,
		   $name,
		   $brand,
		   $phone,
		   $email,
		   $created,
		   $updated,
		   $isactive;

	public function __construct(){
		parent::__construct();
	}

	public function add(){

		$query = "INSERT INTO cm_company(value,name,brand,phone,email) VALUES ('$this->value','$this->name','$this->brand','$this->phone','$this->email')";

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
				$query = "SELECT * FROM cm_company ORDER BY name ASC";
			break;
			case 'byname':
				$query = "SELECT * FROM cm_company WHERE name = '$this->name' ORDER BY name ASC";
			break;
			case 'byid':
				$query = "SELECT * FROM cm_company WHERE company_id = $this->company_id ORDER BY name ASC";
			break;
			case 'byvalue':
				$query = "SELECT * FROM cm_company WHERE value = '$this->value' ORDER BY name ASC";
			break;
		}

		$query = $this->db->query($query);

		return $query->result();

	}

	public function update(){

		$query = "UPDATE cm_company SET name = '$this->name', brand = '$this->brand', phone = '$this->phone', email = '$this->email' WHERE company_id = $this->company_id";

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

		$query = "UPDATE cm_company SET isactive = '$val' WHERE company_id = $this->company_id";

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
<?php
class User extends CI_Model{
	
	public $user_id,
		   $company_id,
		   $role_id,
		   $value,
		   $name,
		   $email,
		   $phone,
		   $password,
		   $avatar,
		   $charges,
		   $isactives,
		   $startdates,
		   $enddates,
		   $created,
		   $updated,
		   $isactive;

	public function __construct(){
		parent::__construct();
	}

	public function add(){

		$query = "INSERT INTO cm_user(company_id,role_id,value,name,email,phone,password) VALUES ($this->company_id,$this->role_id,'$this->value','$this->name','$this->email','$this->phone','$this->password')";

		$this->db->trans_start();

		$this->db->query($query);

		$titem = $this->getData("byemail");

		$this->user_id = $titem[0]->user_id;

		for($i = 1; $i < count($this->charges); $i++){

			if(!empty($this->enddates[$i])){
				$this->db->query("INSERT INTO cm_charge_assigned (user_id,charge_id,startdate,enddate,isactive) VALUES ($this->user_id,".$this->charges[$i].",'".$this->startdates[$i]."','".$this->enddates[$i]."','".$this->isactives[$i]."')");
			}else{
				$this->db->query("INSERT INTO cm_charge_assigned (user_id,charge_id,startdate,isactive) VALUES ($this->user_id,".$this->charges[$i].",'".$this->startdates[$i]."','".$this->isactives[$i]."')");
			}

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
						  u.user_id,
						  u.value,
						  u.name,
						  u.email,
						  c.name AS company,
						  r.name AS role,
						  u.isactive
						  FROM cm_user AS u 
						  INNER JOIN cm_company AS c ON (c.company_id = u.company_id)
						  INNER JOIN cm_role AS r ON (r.role_id = u.role_id)
						  ORDER BY u.name ASC";
			break;
			case 'byemail':
				$query = "SELECT * FROM cm_user WHERE email = '$this->email' ORDER BY name ASC";
			break;
			case 'byid':
				$query = "SELECT * FROM cm_user WHERE user_id = $this->user_id ORDER BY name ASC";
			break;
			case 'get_companies':
				$query = "SELECT company_id AS value, name AS text FROM cm_company ORDER BY name ASC";
			break;
			case 'get_roles':
				$query = "SELECT role_id AS value, name AS text FROM cm_role ORDER BY name ASC";
			break;
			case 'bypassword':
				$query = "SELECT password FROM cm_user WHERE user_id = $this->user_id";
			break;
			case 'get_charges':
				$query = "SELECT charge_id AS value, name AS text FROM cm_charge ORDER BY name ASC";
			break;
			case 'get_assigned_charges':
				$query = "SELECT
							  ca.charge_id,
							  c.name AS charge,
							  CASE WHEN ca.isactive = 'Y' THEN 'SI'
							  	   WHEN ca.isactive = 'N' THEN 'NO'
							  END AS isactive,
							  ca.isactive AS isactive_letter,
							  ca.startdate,
							  COALESCE(ca.enddate,'-') AS enddate
						  FROM cm_charge_assigned AS ca
						 	 INNER JOIN cm_charge AS c ON (c.charge_id = ca.charge_id)
						  WHERE ca.user_id = $this->user_id";
			break;
			case 'get_user_info_complete':
				$query = "SELECT 
						  u.user_id,
						  u.name AS name,
						  u.value,
						  c.name AS charge
						  FROM cm_user AS u
						  INNER JOIN cm_charge_assigned AS ca ON (ca.user_id = u.user_id)
						  INNER JOIN cm_charge as c ON (c.charge_id = ca.charge_id)
						  WHERE u.user_id = $this->user_id";
			break;
		}

		$query = $this->db->query($query);

		return $query->result();

	}

	public function update(){

		$query = "UPDATE cm_user SET company_id = $this->company_id, role_id = $this->role_id, value = '$this->value', name = '$this->name', email = '$this->email', phone = '$this->phone' WHERE user_id = $this->user_id";

		$this->db->trans_start();

		$this->db->query($query);

		if(count($this->charges) > 0){
		$this->db->query("UPDATE cm_charge_assigned SET isactive = 'N' WHERE user_id = $this->user_id");
		}

		for($i = 1; $i < count($this->charges); $i++){	

			if(!empty($this->enddates[$i])){
				$this->db->query("INSERT INTO cm_charge_assigned (user_id,charge_id,startdate,enddate,isactive) VALUES ($this->user_id,".$this->charges[$i].",'".$this->startdates[$i]."','".$this->enddates[$i]."','".$this->isactives[$i]."')");
			}else{
				$this->db->query("INSERT INTO cm_charge_assigned (user_id,charge_id,startdate,isactive) VALUES ($this->user_id,".$this->charges[$i].",'".$this->startdates[$i]."','".$this->isactives[$i]."')");
			}

			
		}

		$this->db->trans_complete();

		if($this->db->trans_status() === TRUE){
			return true;
		}else{
			return false;
		}
	}

	public function isactive($val){

		$query = "UPDATE cm_user SET isactive = '$val' WHERE user_id = $this->user_id";

		$this->db->trans_start();

		$this->db->query($query);

		$this->db->trans_complete();

		if($this->db->trans_status() === TRUE){
			return true;
		}else{
			return false;
		}		

	}

	public function verify_user(){

		$query = $this->db->query("SELECT
								   u.user_id,
								   u.company_id,
								   c.name AS company,
								   c.short_name,
								   u.role_id, 
								   r.name as role,
								   u.name, 
								   u.email,
								   COALESCE(ch.name,'Sin Cargo') AS charge_assigned,
								   COALESCE(ch.charge_id,-1) AS charge_id,
								   COALESCE(ch.charge_level_id,-1) AS charge_level_id,
								   COALESCE(ch.charge_parent_id,-1) AS charge_parent_id,
								   COALESCE(u2.user_id,-1) AS user_evaluated
								   FROM cm_user AS u
								   INNER JOIN cm_company AS c ON (c.company_id = u.company_id)
								   INNER JOIN cm_role AS r ON (r.role_id = u.role_id)
								   LEFT JOIN cm_charge_assigned AS ca ON (ca.user_id = u.user_id)
								   LEFT JOIN cm_charge AS ch ON (ch.charge_id = ca.charge_id)
								   LEFT JOIN cm_charge_assigned AS ca2 ON (ca2.charge_id = ch.charge_parent_id)
								   LEFT JOIN cm_user AS u2 ON (u2.user_id = ca2.user_id)
								   WHERE u.email = '$this->email' 
								   AND u.password = MD5('$this->password')");

		return $query->row();
	}

	public function change_password(){

		$query = "UPDATE cm_user SET password = '$this->password' WHERE user_id = $this->user_id";

		$this->db->trans_start();

		$this->db->query($query);

		$this->db->trans_complete();

		if($this->db->trans_status() === TRUE){
			return true;
		}else{
			return false;
		}

	}

	public function getRultChart($user_evaluated_id, $instrument_id){
		$query = $this->db->query("select
						c.name AS competency,
						SUM( (select max(value) from cm_domain_level) * dl.value ) AS top,
						SUM(dol.value * dl.value) AS result,
						100 AS topper,
						ROUND( ((SUM(dol.value * dl.value) / SUM( (select max(value) from cm_domain_level) * dl.value )) * 100),2) AS resultper
						from cm_user_instrument AS ui
						inner join cm_user_instrument_answer AS uia ON (uia.user_instrument_id = ui.user_instrument_id)
						inner join cm_behavioral_indicator AS bi ON (bi.behavioral_indicator_id = uia.behavioral_indicator_id)
						inner join cm_development_level AS dl ON (dl.development_level_id = bi.development_level_id)
						inner join cm_domain_level AS dol ON (dol.domain_level_id = uia.domain_level_id)
						inner join cm_competency AS c ON (c.competency_id = bi.competency_id)
			where ui.user_evaluated_id = ".$user_evaluated_id." and ui.instrument_of_evaluation_id = ".$instrument_id."
			group by 1");

		return $query->result();
	}
}
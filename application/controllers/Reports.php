<?php
defined('BASEPATH') OR exit ('No direct script access allowed');

class Reports extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model("Instrumentofevaluation");
	}

	public function index(){
		$data['title'] = "Reporte Promedio";
		$data['path'] = "admin/report";
		$data['content'] = "group";
		$data['ressult_for_group'] = $this->Instrumentofevaluation->getResultFromGroup($this->session->userdata('logged_in')->user_id);
		$this->load->view("admin/index.php",$data);
	}
}
<?php
defined('BASEPATH') OR exit ('No direct script access allowed');

class Mains extends CI_Controller {

	public function __construct(){
		parent::__construct();
	}

	public function index(){
		$data['title'] = "Dashboard";
		$data['path'] = "admin/main";
		$data['content'] = "dashboard";
		$this->load->view("admin/index.php",$data);
	}
}
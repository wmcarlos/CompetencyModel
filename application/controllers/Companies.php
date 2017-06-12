<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

class Companies extends CI_Controller{

	public function __construct(){

		parent::__construct();
		$this->load->model('Company');

	}

	public function index(){
		$data['title'] = "COMPA&Ntilde;IAS";
		$data['path'] = 'admin/company';
		$data['content'] = 'all';
		$this->load->view('admin/index', $data);
	}
}

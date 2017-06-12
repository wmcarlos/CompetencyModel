<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

class Companies extends CI_Controller{

	public function __construct(){

		parent::__construct();
		$this->load->model('Company');

	}

	public function index(){
		$data['title'] = 'Compa&ntilde;ias';
		$data['subtitle'] = 'Listado';
		$data['path'] = 'admin/company';
		$data['content'] = 'all';
		$this->load->view('admin/index', $data);
	}

	public function add(){
		$data['title'] = "Nueva Compa&ntilde;ia";
		$data['path'] = 'admin/company';
		$data['content'] = 'form';
		$this->load->view('admin/index', $data);
	}
}

<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

class Companies extends CI_Controller{

	public function __construct(){

		parent::__construct();
		$this->load->model('Company');

	}

	public function index(){
		$data['title'] = 'Companies';
		$data['path'] = 'admin/company';
		$data['content'] = 'all';
		$this->load->view('admin/index', $data);
	}

	public function create(){
		$data['title'] = "New Company";
		$data['path'] = 'admin/company';
		$data['content'] = 'form';
		$this->load->view('admin/index', $data);
	}

	public function store(){

	}

	public function edit(){

	}

	public function update(){

	}

	public function active(){

	}

	public function inactive(){

	}
}

<?php
defined('BASEPATH') OR exit ('No direct script access allowed');

class Mains extends CI_Controller {

	public function __construct(){
		parent::__construct();

		$this->load->model("User");
	}

	public function index(){
		$data['title'] = "Dashboard";
		$data['path'] = "admin/main";
		$data['content'] = "dashboard";
		$this->load->view("admin/index.php",$data);
	}

	public function profile(){
		$data['title'] = 'Profile';
		$data['path'] = 'admin/main';
		$data['action'] = 'change_password';
		$data['content'] = 'edit';
		$this->User->email = $this->session->userdata("logged_in")->email;
		$data['item'] = $this->User->getData('byemail');
		$this->load->view('admin/index', $data);
	}

	public function change_password(){

	}
}
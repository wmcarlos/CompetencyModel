<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	public function __construct(){

		parent::__construct();

		$this->load->model('User');
	}

	public function index()
	{	
		$data['title'] = "Login";
		$data['path'] = "frontend";
		$data['content'] = "login";
		$this->load->view("frontend/index",$data);
	}

	public function open_session(){

		$this->User->email = strtoupper($this->input->post("txtemail"));
		$this->User->password = strtoupper($this->input->post("txtpassword"));

		if(count ($this->User->verify_user()) > 0){

			$userdata = $this->User->verify_user();

			$this->session->set_userdata('logged_in', $userdata);

			redirect("Mains");
		}else{
			$this->session->set_flashdata('msj',"Correo o Contrase&ntilde;a Invalido!!");

			redirect("Login");
		}
	}

	public function close_session(){
		$this->session->unset_userdata('logged_in');
		redirect("Login");
	}
}

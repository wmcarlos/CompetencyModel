<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	public function index()
	{	
		$data['title'] = "Login";
		$data['path'] = "frontend";
		$data['content'] = "login";
		$this->load->view("frontend/index",$data);
	}
	
}

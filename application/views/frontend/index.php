<?php
	defined('BASEPATH') OR exit('No direct script access allowed'); 
	$this->load->view('frontend/template/header.php');
	$this->load->view($path."/".$content);
	$this->load->view('frontend/template/footer.php');

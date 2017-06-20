<?php
	defined('BASEPATH') OR exit('No direct script access allowed'); 
	$this->load->view('admin/template/header.php');
	$this->load->view('admin/template/widget.php');
	$this->load->view($path."/".$content);
	$this->load->view('admin/template/footer.php');
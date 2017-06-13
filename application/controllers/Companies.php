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
		$data['items'] = $this->Company->getData();
		$this->load->view('admin/index', $data);
	}

	public function create(){
		$data['title'] = "New Company";
		$data['path'] = 'admin/company';
		$data['content'] = 'form';
		$data['action'] = 'store';
		$this->load->view('admin/index', $data);
	}

	public function store(){

		//Config of Images
		$config = array(
			'upload_path' => "./public/upload/company/",
			'allowed_types' => "jpg|png|jpeg",
			'overwrite' => TRUE,
			'max_size' => "2048000",
			'max_height' => "600",
			'max_width' => "600",
			'encrypt_name' => TRUE
		);
		$this->load->library('upload',$config);
		//End Config

		if($this->upload->do_upload('txtbrand')){

			$this->Company->value = strtoupper($this->input->post("txtvalue"));
			$this->Company->name = strtoupper($this->input->post("txtname"));
			$this->Company->phone = $this->input->post("txtphone");
			$this->Company->email = strtoupper($this->input->post("txtemail"));

			$udata = $this->upload->data();
			$this->Company->brand = $udata['file_name'];

			if( count($this->Company->getData("byname")) > 0){
				$string = 'Esta Copa&ntilde;ia ya se encuentra Registrada!!';
				unlink($udata['full_path']);
			}else{
				if($this->Company->add()){
					$string = 'Compa&ntilde;ia registrada con Exito!!';
				}else{
					$string = 'Ocurrio un error al intentar registrar la Compa&ntilde;ia!!';
					unlink($udata['full_path']);
				}
			}

		}else{
			$string = 'Ocurrio un error al intentar registrar la Compa&ntilde;ia!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Companies','refresh');
	}

	public function edit($company_id){

		$this->Company->company_id = $company_id;

		$data['title'] = "Edit Company";
		$data['path'] = 'admin/company';
		$data['content'] = 'form';
		$data['action'] = 'update';
		$data['item'] = $this->Company->getData('byid');
		
		$this->load->view('admin/index', $data);
	}

	public function update(){

	}

	public function active(){

	}

	public function inactive(){

	}
}

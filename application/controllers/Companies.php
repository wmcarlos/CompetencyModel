<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

class Companies extends CI_Controller{

	public function __construct(){

		parent::__construct();

		$this->load->model('Company');

	}

	public function index(){
		$data['title'] = 'Compa&ntilde;ias';
		$data['path'] = 'admin/company';
		$data['content'] = 'get';
		$data['items'] = $this->Company->getData();
		$this->load->view('admin/index', $data);
	}

	public function create(){

		$data['title'] = "Nueva Compa&ntilde;ia";
		$data['path'] = 'admin/company';
		$data['content'] = 'create';
		$data['action'] = 'store';

		$this->load->view('admin/index', $data);
	}

	public function store(){

		$this->Company->value = strtoupper($this->input->post("txtvalue"));
		$this->Company->name = strtoupper($this->input->post("txtname"));
		$this->Company->phone = $this->input->post("txtphone");
		$this->Company->email = strtoupper($this->input->post("txtemail"));
		$this->Company->short_name = strtoupper($this->input->post("txtshort_name"));

		if( count($this->Company->getData("byname")) > 0){
			$string = 'Esta Copa&ntilde;ia ya se encuentra Registrada!!';
		}else{
			if($this->Company->add()){
				$string = 'Compa&ntilde;ia registrada con Exito!!';
			}else{
				$string = 'Ocurrio un error al intentar registrar la Compa&ntilde;ia!!';
			}
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Companies','refresh');

	}

	public function edit($company_id){

		$this->Company->company_id = $company_id;

		$data['title'] = "Editar Compa&ntilde;ia";
		$data['path'] = 'admin/company';
		$data['content'] = 'edit';
		$data['action'] = 'update';
		$data['item'] = $this->Company->getData('byid');

		$this->load->view('admin/index', $data);
	}

	public function update(){

		$this->Company->company_id = $this->input->post("txtcompany_id");
		$this->Company->value = strtoupper($this->input->post("txtvalue"));
		$this->Company->name = strtoupper($this->input->post("txtname"));
		$this->Company->phone = $this->input->post("txtphone");
		$this->Company->email = strtoupper($this->input->post("txtemail"));
		$this->Company->short_name = strtoupper($this->input->post("txtshort_name"));


		if($this->Company->update()){
			$string = 'Compa&ntilde;ia modificada con Exito!!';
		}else{
			$string = 'Ocurrio un error al intentar modificar la Compa&ntilde;ia!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Companies','refresh');	

	}

	public function active($company_id){
		$this->Company->company_id = $company_id;

		if($this->Company->isactive('Y')){
			$string = 'Compa&ntilde;ia activada con Exito!!';
		}else{
			$string = 'Error al intentar activar la Compa&ntilde;ia!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Companies','refresh');
	}

	public function inactive($company_id){

		$this->Company->company_id = $company_id;

		if($this->Company->isactive('N')){
			$string = 'Compa&ntilde;ia Desactivada con Exito!!';
		}else{
			$string = 'Error al intentar Desactivar la Compa&ntilde;ia!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Companies','refresh');
	}
}

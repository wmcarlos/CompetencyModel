<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

class Developmentlevels extends CI_Controller{

	public function __construct(){

		parent::__construct();

		$this->load->model('Developmentlevel');
		$this->load->helper('dfcontrol');

	}

	public function index(){
		$data['title'] = 'Niveles de Desarrollo';
		$data['path'] = 'admin/developmentlevel';
		$data['content'] = 'get';
		$data['items'] = $this->Developmentlevel->getData();
		$this->load->view('admin/index', $data);
	}

	public function create(){

		$data['title'] = "Nuevo Nivel de Desarrollo";
		$data['path'] = 'admin/developmentlevel';
		$data['content'] = 'create';
		$data['action'] = 'store';
		$citems = $this->Developmentlevel->getData("get_companies");
		$data['companies'] = load_select($citems);
		$this->load->view('admin/index', $data);
	}

	public function store(){

		$this->Developmentlevel->company_id = $this->input->post("txtcompany_id");
		$this->Developmentlevel->name = strtoupper($this->input->post("txtname"));
		$this->Developmentlevel->position = $this->input->post("txtposition");
		$this->Developmentlevel->value = $this->input->post("txtvalue");

		if( count($this->Developmentlevel->getData("byname")) > 0){
			$string = 'Este Nivel de Desarrollo ya se encuentra Registrado!!';
		}else{
			if($this->Developmentlevel->add()){
				$string = 'Nivel de Desarrollo registrado con Exito!!';
			}else{
				$string = 'Ocurrio un error al intentar registrar el Nivel de Desarrollo!!';
			}
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Developmentlevels','refresh');

	}

	public function edit($development_level_id){

		$this->Developmentlevel->development_level_id = $development_level_id;

		$data['title'] = "Editar Nivel de Desarrollo";
		$data['path'] = 'admin/developmentlevel';
		$data['content'] = 'edit';
		$data['action'] = 'update';
		$citems = $this->Developmentlevel->getData("get_companies");
		$data['companies'] = load_select($citems, $this->Developmentlevel->getData('byid')[0]->company_id);
		$data['item'] = $this->Developmentlevel->getData('byid');
		$this->load->view('admin/index', $data);
	}

	public function update(){

		$this->Developmentlevel->development_level_id = $this->input->post("txtdevelopment_level_id");
		$this->Developmentlevel->company_id = $this->input->post("txtcompany_id");
		$this->Developmentlevel->name = strtoupper($this->input->post("txtname"));
		$this->Developmentlevel->position = $this->input->post("txtposition");
		$this->Developmentlevel->value = $this->input->post("txtvalue");

		if($this->Developmentlevel->update()){
			$string = 'Nivel de Desarrollo modificado con Exito!!';
		}else{
			$string = 'Ocurrio un error al intentar modificar el Nivel de Desarrollo!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Developmentlevels','refresh');	

	}

	public function active($development_level_id){
		$this->Developmentlevel->development_level_id = $development_level_id;

		if($this->Developmentlevel->isactive('Y')){
			$string = 'Nivel de Desarrollo activado con Exito!!';
		}else{
			$string = 'Error al intentar activar el Nivel de Desarrollo!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Developmentlevels','refresh');
	}

	public function inactive($development_level_id){

		$this->Developmentlevel->development_level_id = $development_level_id;

		if($this->Developmentlevel->isactive('N')){
			$string = 'Nivel de Desarrollo Desactivado con Exito!!';
		}else{
			$string = 'Error al intentar Desactivar el Nivel de Desarrollo!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Developmentlevels','refresh');
	}
}

<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

class Domainlevels extends CI_Controller{

	public function __construct(){

		parent::__construct();

		$this->load->model('Domainlevel');
		$this->load->helper('dfcontrol');

	}

	public function index(){
		$data['title'] = 'Domain Level';
		$data['path'] = 'admin/domainlevel';
		$data['content'] = 'get';
		$data['items'] = $this->Domainlevel->getData();
		$this->load->view('admin/index', $data);
	}

	public function create(){

		$data['title'] = "New Domain Level";
		$data['path'] = 'admin/domainlevel';
		$data['content'] = 'create';
		$data['action'] = 'store';
		$citems = $this->Domainlevel->getData("get_companies");
		$data['companies'] = load_select($citems);
		$this->load->view('admin/index', $data);
	}

	public function store(){

		$this->Domainlevel->company_id = $this->input->post("txtcompany_id");
		$this->Domainlevel->name = strtoupper($this->input->post("txtname"));
		$this->Domainlevel->scale = strtoupper($this->input->post("txtscale"));
		$this->Domainlevel->position = $this->input->post("txtposition");
		$this->Domainlevel->value = $this->input->post("txtvalue");

		if( count($this->Domainlevel->getData("byname")) > 0){
			$string = 'Este Nivel de Dominio ya se encuentra Registrado!!';
		}else{
			if($this->Domainlevel->add()){
				$string = 'Nivel de Dominio registrado con Exito!!';
			}else{
				$string = 'Ocurrio un error al intentar registrar el Nivel de Dominio!!';
			}
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Domainlevels','refresh');

	}

	public function edit($domain_level_id){

		$this->Domainlevel->domain_level_id = $domain_level_id;

		$data['title'] = "Edit Domain Level";
		$data['path'] = 'admin/domainlevel';
		$data['content'] = 'edit';
		$data['action'] = 'update';
		$citems = $this->Domainlevel->getData("get_companies");
		$data['companies'] = load_select($citems, $this->Domainlevel->getData('byid')[0]->company_id);
		$data['item'] = $this->Domainlevel->getData('byid');
		$this->load->view('admin/index', $data);
	}

	public function update(){

		$this->Domainlevel->domain_level_id = $this->input->post("txtdomain_level_id");
		$this->Domainlevel->company_id = $this->input->post("txtcompany_id");
		$this->Domainlevel->name = strtoupper($this->input->post("txtname"));
		$this->Domainlevel->scale = strtoupper($this->input->post("txtscale"));
		$this->Domainlevel->position = $this->input->post("txtposition");
		$this->Domainlevel->value = $this->input->post("txtvalue");;

		if($this->Domainlevel->update()){
			$string = 'Nivel de Dominio modificado con Exito!!';
		}else{
			$string = 'Ocurrio un error al intentar modificar el Nivel de Dominio!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Domainlevels','refresh');	

	}

	public function active($domain_level_id){
		$this->Domainlevel->domain_level_id = $domain_level_id;

		if($this->Domainlevel->isactive('Y')){
			$string = 'Nivel de Dominio activado con Exito!!';
		}else{
			$string = 'Error al intentar activar el Nivel de Dominio!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Domainlevels','refresh');
	}

	public function inactive($domain_level_id){

		$this->Domainlevel->domain_level_id = $domain_level_id;

		if($this->Domainlevel->isactive('N')){
			$string = 'Nivel de Dominio Desactivado con Exito!!';
		}else{
			$string = 'Error al intentar Desactivar el Nivel de Dominio!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Domainlevels','refresh');
	}
}

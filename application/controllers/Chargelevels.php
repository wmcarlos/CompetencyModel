<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

class Chargelevels extends CI_Controller{

	public function __construct(){

		parent::__construct();

		$this->load->model('Chargelevel');
		$this->load->helper('dfcontrol');

	}

	public function index(){
		$data['title'] = 'Charge level';
		$data['path'] = 'admin/chargelevel';
		$data['content'] = 'get';
		$data['items'] = $this->Chargelevel->getData();
		$this->load->view('admin/index', $data);
	}

	public function create(){

		$data['title'] = "New Charge level";
		$data['path'] = 'admin/chargelevel';
		$data['content'] = 'create';
		$data['action'] = 'store';
		$citems = $this->Chargelevel->getData("get_companies");
		$data['companies'] = load_select($citems);
		$this->load->view('admin/index', $data);
	}

	public function store(){

		$this->Chargelevel->company_id = $this->input->post("txtcompany_id");
		$this->Chargelevel->name = strtoupper($this->input->post("txtname"));

		if( count($this->Chargelevel->getData("byname")) > 0){
			$string = 'Este Nivel de Cargo ya se encuentra Registrado!!';
		}else{
			if($this->Chargelevel->add()){
				$string = 'Nivel de Cargo registrado con Exito!!';
			}else{
				$string = 'Ocurrio un error al intentar registrar el Nivel de Cargo!!';
			}
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Chargelevels','refresh');

	}

	public function edit($charge_level_id){

		$this->Chargelevel->charge_level_id = $charge_level_id;

		$data['title'] = "Edit Chargelevel";
		$data['path'] = 'admin/chargelevel';
		$data['content'] = 'edit';
		$data['action'] = 'update';
		$citems = $this->Chargelevel->getData("get_companies");
		$data['companies'] = load_select($citems, $this->Chargelevel->getData('byid')[0]->company_id);
		$data['item'] = $this->Chargelevel->getData('byid');

		$this->load->view('admin/index', $data);
	}

	public function update(){

		$this->Chargelevel->charge_level_id = $this->input->post("txtcharge_level_id");
		$this->Chargelevel->company_id = $this->input->post("txtcompany_id");
		$this->Chargelevel->name = strtoupper($this->input->post("txtname"));

		if($this->Chargelevel->update()){
			$string = 'Nivel de Cargo modificado con Exito!!';
		}else{
			$string = 'Ocurrio un error al intentar modificar el Nivel de Cargo!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Chargelevels','refresh');	

	}

	public function active($charge_level_id){
		$this->Chargelevel->charge_level_id = $charge_level_id;

		if($this->Chargelevel->isactive('Y')){
			$string = 'Nivel de Cargo activado con Exito!!';
		}else{
			$string = 'Error al intentar activar el Nivel de Cargo!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Chargelevels','refresh');
	}

	public function inactive($charge_level_id){

		$this->Chargelevel->charge_level_id = $charge_level_id;

		if($this->Chargelevel->isactive('N')){
			$string = 'Nivel de Cargo Desactivado con Exito!!';
		}else{
			$string = 'Error al intentar Desactivar el Nivel de Cargo!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Chargelevels','refresh');
	}
}

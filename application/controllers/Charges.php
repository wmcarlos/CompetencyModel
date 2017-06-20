<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

class Charges extends CI_Controller{

	public function __construct(){

		parent::__construct();

		$this->load->model('Charge');
		$this->load->helper('dfcontrol');

	}

	public function index(){
		$data['title'] = 'Cargos';
		$data['path'] = 'admin/charge';
		$data['content'] = 'get';
		$data['items'] = $this->Charge->getData();
		$this->load->view('admin/index', $data);
	}

	public function create(){

		$data['title'] = "Nuevo Cargo";
		$data['path'] = 'admin/charge';
		$data['content'] = 'create';
		$data['action'] = 'store';
		$ditems = $this->Charge->getData("get_departaments");
		$citems = $this->Charge->getData("get_charges");
		$clitems = $this->Charge->getData("get_chargelevels");
		$data['departaments'] = load_select($ditems);
		$data['charges'] = load_select($citems);
		$data['chargelevels'] = load_select($clitems);
		$this->load->view('admin/index', $data);
	}

	public function store(){

		$this->Charge->departament_id = $this->input->post("txtdepartament_id");
		$this->Charge->name = strtoupper($this->input->post("txtname"));
		$this->Charge->charge_parent_id = $this->input->post("txtcharge_parent_id");
		$this->Charge->charge_level_id = $this->input->post("txtcharge_level_id");

		if( count($this->Charge->getData("byname")) > 0){
			$string = 'Este Cargo ya se encuentra Registrado!!';
		}else{
			if($this->Charge->add()){
				$string = 'Cargo registrado con Exito!!';
			}else{
				$string = 'Ocurrio un error al intentar registrar el Cargo!!';
			}
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Charges','refresh');

	}

	public function edit($charge_id){

		$this->Charge->charge_id = $charge_id;

		$data['title'] = "Editar Cargo";
		$data['path'] = 'admin/charge';
		$data['content'] = 'edit';
		$data['action'] = 'update';
		$ditems = $this->Charge->getData("get_departaments");
		$citems = $this->Charge->getData("get_charges");
		$clitems = $this->Charge->getData("get_chargelevels");
		$data['departaments'] = load_select($ditems, $this->Charge->getData('byid')[0]->departament_id);
		$data['charges'] = load_select($citems, $this->Charge->getData('byid')[0]->charge_parent_id);
		$data['chargelevels'] = load_select($clitems, $this->Charge->getData('byid')[0]->charge_level_id);
		$data['item'] = $this->Charge->getData('byid');

		$this->load->view('admin/index', $data);
	}

	public function update(){

		$this->Charge->charge_id = $this->input->post("txtcharge_id");
		$this->Charge->departament_id = $this->input->post("txtdepartament_id");
		$this->Charge->name = strtoupper($this->input->post("txtname"));
		$this->Charge->charge_parent_id = $this->input->post("txtcharge_parent_id");
		$this->Charge->charge_level_id = $this->input->post("txtcharge_level_id");

		if($this->Charge->update()){
			$string = 'Cargo modificado con Exito!!';
		}else{
			$string = 'Ocurrio un error al intentar modificar el Cargo!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Charges','refresh');	

	}

	public function active($charge_id){
		$this->Charge->charge_id = $charge_id;

		if($this->Charge->isactive('Y')){
			$string = 'Cargo activado con Exito!!';
		}else{
			$string = 'Error al intentar activar el Cargo!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Charges','refresh');
	}

	public function inactive($charge_id){

		$this->Charge->charge_id = $charge_id;

		if($this->Charge->isactive('N')){
			$string = 'Cargo Desactivado con Exito!!';
		}else{
			$string = 'Error al intentar Desactivar el Cargo!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Charges','refresh');
	}
}

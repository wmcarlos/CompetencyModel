<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

class Instrumentofevaluations extends CI_Controller{

	public function __construct(){

		parent::__construct();

		$this->load->model('Instrumentofevaluation');
		$this->load->helper('dfcontrol');

	}

	public function index(){
		$data['title'] = 'Instrumentos de Evaluaci&oacute;n';
		$data['path'] = 'admin/instrumentofevaluation';
		$data['content'] = 'get';
		$data['items'] = $this->Instrumentofevaluation->getData();
		$this->load->view('admin/index', $data);
	}

	public function create(){

		$data['title'] = "Nuevo Intrumento de Evaluaci&oacute;n";
		$data['path'] = 'admin/instrumentofevaluation';
		$data['content'] = 'create';
		$data['action'] = 'store';
		$citem = $this->Instrumentofevaluation->getData('get_companies');
		$data['companies'] = load_select($citem);
		$clitem = $this->Instrumentofevaluation->getData('get_chargelevels');
		$data['chargelevels'] = load_select($clitem);
		$this->load->view('admin/index', $data);
	}

	public function store(){

		$this->Instrumentofevaluation->company_id = $this->input->post("txtcompany_id");
		$this->Instrumentofevaluation->name = strtoupper($this->input->post("txtname"));
		$this->Instrumentofevaluation->description = strtoupper($this->input->post("txtdescription"));
		$this->Instrumentofevaluation->instructions = strtoupper($this->input->post("txtinstructions"));
		$this->Instrumentofevaluation->evaluationtype = strtoupper($this->input->post("txtevaluationtype"));
		$this->Instrumentofevaluation->charge_level_id = $this->input->post("txtcharge_level_id");
		$this->Instrumentofevaluation->status = strtoupper($this->input->post("txtstatus"));

		$this->Instrumentofevaluation->chargelevels = $this->input->post("txtchargelevels");
		$this->Instrumentofevaluation->values = $this->input->post("txtvalues");

		if( count($this->Instrumentofevaluation->getData("byname")) > 0){
			$string = 'Este Instrumento de Evaluacion ya se encuentra Registrado!!';
		}else{
			if($this->Instrumentofevaluation->add()){
				$string = 'Instrumento de Evaluacion registrado con Exito!!';
			}else{
				$string = 'Ocurrio un error al intentar registrar el Instrumento de Evaluacion!!';
			}
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Instrumentofevaluations','refresh');

	}

	public function edit($instrument_of_evaluation_id){

		$this->Instrumentofevaluation->instrument_of_evaluation_id = $instrument_of_evaluation_id;

		$data['title'] = "Editar Instrumento de Evaluaci&oacute;n";
		$data['path'] = 'admin/instrumentofevaluation';
		$data['content'] = 'edit';
		$data['action'] = 'update';
		$citem = $this->Instrumentofevaluation->getData('get_companies');
		$data['companies'] = load_select($citem, $this->Instrumentofevaluation->getData('byid')[0]->company_id);

		$clitem = $this->Instrumentofevaluation->getData('get_chargelevels');
		$data['chargelevels'] = load_select($clitem, $this->Instrumentofevaluation->getData('byid')[0]->charge_level_id);

		$data['item'] = $this->Instrumentofevaluation->getData('byid');
		$data['chargelevels2'] = load_select($clitem);
		$data['dtcharge_ponderations'] = $this->Instrumentofevaluation->getData("get_ponderation_levels");

		$this->load->view('admin/index', $data);
	}

	public function update(){

		$this->Instrumentofevaluation->instrument_of_evaluation_id = $this->input->post("txtinstrument_of_evaluation_id");
		$this->Instrumentofevaluation->company_id = $this->input->post("txtcompany_id");
		$this->Instrumentofevaluation->name = strtoupper($this->input->post("txtname"));
		$this->Instrumentofevaluation->description = strtoupper($this->input->post("txtdescription"));
		$this->Instrumentofevaluation->instructions = strtoupper($this->input->post("txtinstructions"));
		$this->Instrumentofevaluation->evaluationtype = strtoupper($this->input->post("txtevaluationtype"));
		$this->Instrumentofevaluation->charge_level_id = $this->input->post("txtcharge_level_id");
		$this->Instrumentofevaluation->status = strtoupper($this->input->post("txtstatus"));

		$this->Instrumentofevaluation->chargelevels = $this->input->post("txtchargelevels");
		$this->Instrumentofevaluation->values = $this->input->post("txtvalues");

		if($this->Instrumentofevaluation->update()){
			$string = 'Instrumento de Evaluacion modificado con Exito!!';
		}else{
			$string = 'Ocurrio un error al intentar modificar el Instrumento de Evaluacion!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Instrumentofevaluations','refresh');	

	}

	public function active($instrument_of_evaluation_id){
		$this->Instrumentofevaluation->instrument_of_evaluation_id = $instrument_of_evaluation_id;

		if($this->Instrumentofevaluation->isactive('Y')){
			$string = 'Instrumento de Evaluacion activado con Exito!!';
		}else{
			$string = 'Error al intentar activar el Instrumento de Evaluacion!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Instrumentofevaluations','refresh');
	}

	public function inactive($instrument_of_evaluation_id){

		$this->Instrumentofevaluation->instrument_of_evaluation_id = $instrument_of_evaluation_id;

		if($this->Instrumentofevaluation->isactive('N')){
			$string = 'Instrumento de Evaluacion Desactivado con Exito!!';
		}else{
			$string = 'Error al intentar Desactivar el Instrumento de Evaluacion!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Instrumentofevaluations','refresh');
	}
}

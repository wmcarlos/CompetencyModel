<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

class Periods extends CI_Controller{

	public function __construct(){

		parent::__construct();

		$this->load->model('Period');
		$this->load->helper('dfcontrol');

	}

	public function index(){
		$data['title'] = 'Periods';
		$data['path'] = 'admin/period';
		$data['content'] = 'get';
		$data['items'] = $this->Period->getData();
		$this->load->view('admin/index', $data);
	}

	public function create(){

		$data['title'] = "New Period";
		$data['path'] = 'admin/period';
		$data['content'] = 'create';
		$data['action'] = 'store';
		$citems = $this->Period->getData("get_companies");
		$data['companies'] = load_select($citems);
		$this->load->view('admin/index', $data);
	}

	public function store(){

		$this->Period->company_id = $this->input->post("txtcompany_id");
		$this->Period->name = strtoupper($this->input->post("txtname"));
		$this->Period->startdate = $this->input->post("txtstartdate");
		$this->Period->enddate = $this->input->post("txtenddate");

		if( count($this->Period->getData("byname")) > 0){
			$string = 'Este Periodo ya se encuentra Registrado!!';
		}else{
			if($this->Period->add()){
				$string = 'Periodo registrado con Exito!!';
			}else{
				$string = 'Ocurrio un error al intentar registrar el Periodo!!';
			}
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Periods','refresh');

	}

	public function edit($period_id){

		$this->Period->period_id = $period_id;

		$data['title'] = "Edit Period";
		$data['path'] = 'admin/period';
		$data['content'] = 'edit';
		$data['action'] = 'update';
		$citems = $this->Period->getData("get_companies");
		$data['companies'] = load_select($citems, $this->Period->getData('byid')[0]->company_id);
		$data['item'] = $this->Period->getData('byid');

		$this->load->view('admin/index', $data);
	}

	public function update(){

		$this->Period->period_id = $this->input->post("txtperiod_id");
		$this->Period->company_id = $this->input->post("txtcompany_id");
		$this->Period->name = strtoupper($this->input->post("txtname"));
		$this->Period->startdate = $this->input->post("txtstartdate");
		$this->Period->enddate = $this->input->post("txtenddate");

		if($this->Period->update()){
			$string = 'Periodo modificado con Exito!!';
		}else{
			$string = 'Ocurrio un error al intentar modificar el Periodo!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Periods','refresh');	

	}

	public function active($period_id){
		$this->Period->period_id = $period_id;

		if($this->Period->isactive('Y')){
			$string = 'Periodo activado con Exito!!';
		}else{
			$string = 'Error al intentar activar el Periodo!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Periods','refresh');
	}

	public function inactive($period_id){

		$this->Period->period_id = $period_id;

		if($this->Period->isactive('N')){
			$string = 'Periodo Desactivado con Exito!!';
		}else{
			$string = 'Error al intentar Desactivar el Periodo!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Periods','refresh');
	}
}

<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

class Departaments extends CI_Controller{

	public function __construct(){

		parent::__construct();

		$this->load->model('Departament');
		$this->load->helper('dfcontrol');

	}

	public function index(){
		$data['title'] = 'Departamentos';
		$data['path'] = 'admin/Departament';
		$data['content'] = 'get';
		$data['items'] = $this->Departament->getData();
		$this->load->view('admin/index', $data);
	}

	public function create(){

		$data['title'] = "Nuevo Departamento";
		$data['path'] = 'admin/departament';
		$data['content'] = 'create';
		$data['action'] = 'store';
		$citem = $this->Departament->getData('get_companies');
		$data['companies'] = load_select($citem);
		$ditem = $this->Departament->getData('get_departaments');
		$data['departaments'] = load_select($ditem);
		$this->load->view('admin/index', $data);
	}

	public function store(){

		$this->Departament->company_id = $this->input->post("txtcompany_id");
		$this->Departament->name = strtoupper($this->input->post("txtname"));
		$this->Departament->departament_parent_id = $this->input->post("txtdepartament_parent_id");

		if( count($this->Departament->getData("byname")) > 0){
			$string = 'Este Departamento ya se encuentra Registrado!!';
		}else{
			if($this->Departament->add()){
				$string = 'Departamento registrado con Exito!!';
			}else{
				$string = 'Ocurrio un error al intentar registrar el Departamento!!';
			}
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Departaments','refresh');

	}

	public function edit($departament_id){

		$this->Departament->departament_id = $departament_id;

		$data['title'] = "Editar Departamento";
		$data['path'] = 'admin/departament';
		$data['content'] = 'edit';
		$data['action'] = 'update';
		$citem = $this->Departament->getData('get_companies');
		$data['companies'] = load_select($citem, $this->Departament->getData('byid')[0]->company_id);
		$ditem = $this->Departament->getData('get_departaments');
		$data['departaments'] = load_select($ditem, $this->Departament->getData('byid')[0]->departament_parent_id);
		$data['item'] = $this->Departament->getData('byid');
		$this->load->view('admin/index', $data);
	}

	public function update(){
		$this->Departament->departament_id = $this->input->post("txtdepartament_id");
		$this->Departament->company_id = $this->input->post("txtcompany_id");
		$this->Departament->name = strtoupper($this->input->post("txtname"));
		$this->Departament->departament_parent_id = $this->input->post("txtdepartament_parent_id");

		if($this->Departament->update()){
			$string = 'Departamento modificado con Exito!!';
		}else{
			$string = 'Ocurrio un error al intentar modificar el Departamento!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Departaments','refresh');	

	}

	public function active($departament_id){
		$this->Departament->departament_id = $departament_id;

		if($this->Departament->isactive('Y')){
			$string = 'Departamento activado con Exito!!';
		}else{
			$string = 'Error al intentar activar el Departamento!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Departaments','refresh');
	}

	public function inactive($departament_id){

		$this->Departament->departament_id = $departament_id;

		if($this->Departament->isactive('N')){
			$string = 'Departamento Desactivado con Exito!!';
		}else{
			$string = 'Error al intentar Desactivar el Departamento!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Departaments','refresh');
	}
}

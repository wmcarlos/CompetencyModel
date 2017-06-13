<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

class Roles extends CI_Controller{

	public function __construct(){

		parent::__construct();

		$this->load->model('Role');
		$this->load->helper('dfcontrol');

	}

	public function index(){
		$data['title'] = 'Roles';
		$data['path'] = 'admin/role';
		$data['content'] = 'get';
		$data['items'] = $this->Role->getData();
		$this->load->view('admin/index', $data);
	}

	public function create(){

		$data['title'] = "New Role";
		$data['path'] = 'admin/role';
		$data['content'] = 'create';
		$data['action'] = 'store';
		$items = $this->Role->getData('get_companies'); 
		$data['company_select'] = load_select($items);
		$this->load->view('admin/index', $data);
	}

	public function store(){

		$this->Role->company_id = $this->input->post("txtcompany_id");
		$this->Role->name = strtoupper($this->input->post("txtname"));

		if( count($this->Role->getData("byname")) > 0){
			$string = 'Este Rol ya se encuentra Registrado!!';
		}else{
			if($this->Role->add()){
				$string = 'Rol registrado con Exito!!';
			}else{
				$string = 'Ocurrio un error al intentar registrar el Rol!!';
			}
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Roles','refresh');

	}

	public function edit($role_id){

		$this->Role->role_id = $role_id;

		$data['title'] = "Edit Role";
		$data['path'] = 'admin/role';
		$data['content'] = 'edit';
		$data['action'] = 'update';

		$items = $this->Role->getData('get_companies'); 

		$data['item'] = $this->Role->getData('byid');
		$data['company_select'] = load_select($items, $this->Role->getData('byid')[0]->company_id);

		$this->load->view('admin/index', $data);
	}

	public function update(){

		$this->Role->role_id = $this->input->post("txtrole_id");
		$this->Role->company_id = $this->input->post("txtcompany_id");
		$this->Role->name = strtoupper($this->input->post("txtname"));

		if($this->Role->update()){
			$string = 'Rol modificado con Exito!!';
		}else{
			$string = 'Ocurrio un error al intentar modificar el Rol!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Roles','refresh');	

	}

	public function active($role_id){
		$this->Role->role_id = $role_id;

		if($this->Role->isactive('Y')){
			$string = 'Rol activado con Exito!!';
		}else{
			$string = 'Error al intentar activar el Rol!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Roles','refresh');
	}

	public function inactive($role_id){

		$this->Role->role_id = $role_id;

		if($this->Role->isactive('N')){
			$string = 'Rol Desactivado con Exito!!';
		}else{
			$string = 'Error al intentar Desactivar el Rol!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Roles','refresh');
	}
}

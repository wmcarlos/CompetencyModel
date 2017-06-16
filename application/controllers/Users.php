<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

class Users extends CI_Controller{

	public function __construct(){

		parent::__construct();

		$this->load->model('User');
		$this->load->helper('dfcontrol');

	}

	public function index(){
		$data['title'] = 'Usuarios';
		$data['path'] = 'admin/user';
		$data['content'] = 'get';
		$data['items'] = $this->User->getData();
		$this->load->view('admin/index', $data);
	}

	public function create(){

		$data['title'] = "Nuevo Usuario";
		$data['path'] = 'admin/user';
		$data['content'] = 'create';
		$data['action'] = 'store';
		$citems = $this->User->getData("get_companies");
		$ritems = $this->User->getData("get_roles");
		$data['companies'] = load_select($citems);
		$data['roles'] = load_select($ritems);
		$citems = $this->User->getData("get_charges");
		$data['charges'] = load_select($citems);
		$this->load->view('admin/index', $data);
	}

	public function store(){

		$this->User->company_id = $this->input->post("txtcompany_id");
		$this->User->role_id = $this->input->post("txtrole_id");
		$this->User->value = strtoupper($this->input->post("txtvalue"));
		$this->User->name = strtoupper($this->input->post("txtname"));
		$this->User->email = strtoupper($this->input->post("txtemail"));
		$this->User->phone = strtoupper($this->input->post("txtphone"));
		$this->User->password = md5(strtoupper($this->input->post("txtemail")));

		$this->User->charges = $this->input->post("txtcharges");
		$this->User->isactives = $this->input->post("txtisactives");
		$this->User->startdates = $this->input->post("txtstartdates");
		$this->User->enddates = $this->input->post("txtenddates");

		if( count($this->User->getData("byemail")) > 0){
			$string = 'Este Usuario ya se encuentra Registrado!!';
		}else{
			if($this->User->add()){
				$string = 'Usuario registrado con Exito!!';
			}else{
				$string = 'Ocurrio un error al intentar registrar el Usuario!!';
			}
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Users','refresh');

	}

	public function edit($user_id){

		$this->User->user_id = $user_id;

		$data['title'] = "Editar Usuario";
		$data['path'] = 'admin/user';
		$data['content'] = 'edit';
		$data['action'] = 'update';
		$citems = $this->User->getData("get_companies");
		$data['companies'] = load_select($citems, $this->User->getData('byid')[0]->company_id);
		
		$ritems = $this->User->getData("get_roles");
		$data['roles'] = load_select($ritems, $this->User->getData('byid')[0]->role_id);

		$citems = $this->User->getData("get_charges");
		$data['charges'] = load_select($citems);

		$data["charge_assignets"] = $this->User->getData("get_assigned_charges");

		$data['item'] = $this->User->getData('byid');

		$this->load->view('admin/index', $data);
	}

	public function update(){

		$this->User->user_id = $this->input->post("txtuser_id");
		$this->User->company_id = $this->input->post("txtcompany_id");
		$this->User->role_id = $this->input->post("txtrole_id");
		$this->User->value = strtoupper($this->input->post("txtvalue"));
		$this->User->name = strtoupper($this->input->post("txtname"));
		$this->User->email = strtoupper($this->input->post("txtemail"));
		$this->User->phone = strtoupper($this->input->post("txtphone"));

		$this->User->charges = $this->input->post("txtcharges");
		$this->User->isactives = $this->input->post("txtisactives");
		$this->User->startdates = $this->input->post("txtstartdates");
		$this->User->enddates = $this->input->post("txtenddates");

		if($this->User->update()){
			$string = 'Usuario modificado con Exito!!';
		}else{
			$string = 'Ocurrio un error al intentar modificar el Usuario!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Users','refresh');	

	}

	public function active($user_id){
		$this->User->user_id = $user_id;

		if($this->User->isactive('Y')){
			$string = 'Usuario activado con Exito!!';
		}else{
			$string = 'Error al intentar activar el Usuario!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Users','refresh');
	}

	public function inactive($user_id){

		$this->User->user_id = $user_id;

		if($this->User->isactive('N')){
			$string = 'Usuario Desactivado con Exito!!';
		}else{
			$string = 'Error al intentar Desactivar el Usuario!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Users','refresh');
	}
}

<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

class Services extends CI_Controller{

	public function __construct(){

		parent::__construct();

		$this->load->model('Service');
		$this->load->helper('dfcontrol');

	}

	public function index(){
		$data['title'] = 'Services';
		$data['path'] = 'admin/service';
		$data['content'] = 'get';
		$data['items'] = $this->Service->getData();
		$this->load->view('admin/index', $data);
	}

	public function create(){

		$data['title'] = "New Service";
		$data['path'] = 'admin/service';
		$data['content'] = 'create';
		$citems = $this->Service->getData('get_companies'); 
		$data['company_select'] = load_select($citems);
		$spitems = $this->Service->getData('get_service_parent'); 
		$data['service_parent_select'] = load_select($spitems);
		$data['action'] = 'store';
		$this->load->view('admin/index', $data);
	}

	public function store(){

		$this->Service->company_id = $this->input->post("txtcompany_id");
		$this->Service->name = strtoupper($this->input->post("txtname"));
		$this->Service->servicetype = $this->input->post("txtservicetype");
		$this->Service->position = $this->input->post("txtposition");
		$this->Service->service_parent_id = $this->input->post("txtservice_parent_id");
		$this->Service->url = $this->input->post("txturl");
		$this->Service->icon_class = $this->input->post("txticon_class");

		if( count($this->Service->getData("byname")) > 0){
			$string = 'Este servicio ya se encuentra Registrado!!';
		}else{
			if($this->Service->add()){
				$string = 'Servicio registrado con Exito!!';
			}else{
				$string = 'Ocurrio un error al intentar registrar el Servicio!!';
			}
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Services','refresh');

	}

	public function edit($service_id){

		$this->Service->service_id = $service_id;

		$data['title'] = "Edit Service";
		$data['path'] = 'admin/service';
		$data['content'] = 'edit';
		$data['action'] = 'update';
		$citems = $this->Service->getData('get_companies'); 
		$data['company_select'] = load_select($citems, $this->Service->getData('byid')[0]->company_id);
		$spitems = $this->Service->getData('get_service_parent'); 
		$data['service_parent_select'] = load_select($spitems, $this->Service->getData('byid')[0]->service_parent_id);
		$data['item'] = $this->Service->getData('byid');

		$this->load->view('admin/index', $data);
	}

	public function update(){

		$this->Service->service_id = $this->input->post("txtservice_id");
		$this->Service->company_id = $this->input->post("txtcompany_id");
		$this->Service->name = strtoupper($this->input->post("txtname"));
		$this->Service->servicetype = $this->input->post("txtservicetype");
		$this->Service->position = $this->input->post("txtposition");
		$this->Service->service_parent_id = $this->input->post("txtservice_parent_id");
		$this->Service->url = $this->input->post("txturl");
		$this->Service->icon_class = $this->input->post("txticon_class");


		if($this->Service->update()){
			$string = 'Servicio modificado con Exito!!';
		}else{
			$string = 'Ocurrio un error al intentar modificar el Servicio!!';
			//unlink($udata['full_path']);
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Services','refresh');	

	}

	public function active($service_id){
		$this->Service->service_id = $service_id;

		if($this->Service->isactive('Y')){
			$string = 'Servicio activado con Exito!!';
		}else{
			$string = 'Error al intentar activar el Servicio!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Services','refresh');
	}

	public function inactive($service_id){

		$this->Service->service_id = $service_id;

		if($this->Service->isactive('N')){
			$string = 'Servicio Desactivado con Exito!!';
		}else{
			$string = 'Error al intentar Desactivar el Servicio!!';
		}

		$this->session->set_flashdata('msj',$string);

		redirect('Services','refresh');
	}
}

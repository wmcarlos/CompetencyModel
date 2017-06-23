<?php
defined('BASEPATH') OR exit ('No direct script access allowed');

class Mains extends CI_Controller {

	public function __construct(){
		parent::__construct();

		$this->load->model("User");

		$this->load->model("Instrumentofevaluation");

		$this->load->library("form_validation");
	}

	public function index(){

		if( count($this->session->userdata("logged_in")) <= 0 ){
		    redirect("Login");
		}
		
		$data['title'] = "Escritorio";
		$data['path'] = "admin/main";
		$data['content'] = "dashboard";
		$data['instruments'] = $this->Instrumentofevaluation->getData('get_my_evaluations');
		$data['other_evaluations'] = $this->Instrumentofevaluation->getData('get_other_evaluations');
		$this->load->view("admin/index.php",$data);
	}

	public function profile(){
		$data['title'] = 'Profile';
		$data['path'] = 'admin/main';
		$data['action'] = 'change_password';
		$data['content'] = 'edit';
		$this->User->email = $this->session->userdata("logged_in")->email;
		$data['item'] = $this->User->getData('byemail');
		$this->load->view('admin/index', $data);
	}

	public function change_password(){

		$this->form_validation->set_rules('txtcurrent_password','Contrase&ntilde;a Actual','required|callback_validate_current_password');
		$this->form_validation->set_rules('txtnew_password','Nueva Contrase&ntilde;a','required');
		$this->form_validation->set_rules('txtrepeat_new_password','Confirmacion de la Nueva Contrase&ntilde;a','required|matches[txtnew_password]');

		$this->form_validation->set_message('validate_current_password','Contrase&ntilde;a Actual Incorrecta!!');

		$this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a>', '</div>');

		if($this->form_validation->run() == FALSE){

				$data['title'] = 'Profile';
				$data['path'] = 'admin/main';
				$data['action'] = 'change_password';
				$data['content'] = 'edit';
				$this->User->email = $this->session->userdata("logged_in")->email;
				$data['item'] = $this->User->getData('byemail');
				$this->load->view('admin/index', $data);

		}else{
			
			$this->User->password = md5($this->input->post("txtnew_password"));

			if($this->User->change_password()){
				$string = 'Perfil Actualizado con Exito!!';
			}else{
				$string = 'Ocurrio un Error al Tratar de Actualizar el Perfil!!';
			}
			$this->session->set_flashdata('msj',$string);
			redirect("Mains/profile");
		}
	}

	public function validate_current_password($spws){

		$this->User->user_id = $this->session->userdata("logged_in")->user_id;
		$gpws = $this->User->getData("bypassword")[0]->password;

		if( $gpws == md5($spws) ){
			return TRUE;
		}else{
			return FALSE;
		}
	}

	public function view_evaluation($instrument_id, $user_evaluated_id,$user_evaluator_id){
		$data['title'] = "Evaluaci&oacute;n";
		$data['path'] = "admin/main";
		$data['action'] = "evaluate";
		$data['content'] = "evaluation";
		$this->User->user_id = $user_evaluated_id;
		$data['user_evaluated'] = $this->User->getData('get_user_info_complete');

		$this->User->user_id = $user_evaluator_id;
		$data['user_evaluator'] = $this->User->getData('get_user_info_complete');

		$this->Instrumentofevaluation->instrument_of_evaluation_id = $instrument_id;
		$data['instrument'] = $this->Instrumentofevaluation->getData('get_instrument_info');
		$data['competencies'] = $this->Instrumentofevaluation->getData('get_competencies_of_evaluation');

		$data['domain_levels'] = $this->Instrumentofevaluation->getData("get_domain_levels");

		if($user_evaluator_id == -1){
			$this->session->set_flashdata('msj','No se puede evaluar a este participante ya que su cargo no depeten de Otro!!');
			redirect("Mains");
		}

		$data['result_evaluation'] = $this->User->getRultChart($user_evaluated_id, $instrument_id);

		$this->load->view("admin/index.php",$data);
	}

	public function evaluate(){

		$this->Instrumentofevaluation->instrument_of_evaluation_id = $this->input->post("txtinstrument_id");

		$data = Array(
			'user_evaluated_id' => $this->input->post("txtuser_evaluated_id"),
			'user_evaluator_id' => $this->input->post("txtuser_evaluator_id")
		);

		if($this->Instrumentofevaluation->getLastIdFromEvaluation($data)){
			$string = "Ya has Realizado esta Evaluacion!!";
		}else{
			if($this->Instrumentofevaluation->insert_evaluation_header($data)){

				$indicators = $this->input->post("txtindicators");

				$getID = $this->Instrumentofevaluation->getLastIdFromEvaluation($data);
			
				for($i = 0; $i < count($indicators); $i++){

					$behavioral_indicator = $this->input->post("txtbeharvioral_indicator".$indicators[$i]);

					for($t = 0; $t < count($behavioral_indicator); $t++){
						
						$expl = explode("_", $behavioral_indicator[$t]);

						$this->Instrumentofevaluation->insert_evaluation_detail($getID->user_instrument_id,$expl[1],$expl[2]);

					}
				}
				$string = "Evaluacion Registrada con Exito!!";
			}else{
				$string = "Error al Registrar la Evaluacion!!";
			}
		}

		$this->session->set_flashdata('msj',$string);

		redirect("Mains");
	}
}
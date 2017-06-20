<?php 
    if( count($this->session->userdata("logged_in")) > 0 ){
      redirect("Mains");
    }
?>
<div class="login-box">
  <div class="login-logo">
    <a href="#"><center><img src="<?php echo base_url(); ?>public/img/competic_model.fw.png"></center></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
        <?php if( $this->session->flashdata('msj') ){ ?>
          <script type="text/javascript"> isalert('<?= $this->session->flashdata('msj') ?>'); </script>
        <?php } ?>
    <p class="login-box-msg">Ingresa tus datos para Iniciar Sesion</p>

    <?= form_open("Login/open_session", array('autocomplete' => 'off')); ?>
      <div class="form-group has-feedback">
        <input type="email" name="txtemail" id="txtemail" class="form-control" placeholder="Correo Electronico">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="txtpassword" id="txtpassword" class="form-control" placeholder="Contrase&ntilde;a">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> Recordar mis Datos
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Entrar</button>
        </div>
        <!-- /.col -->
      </div>
    <a href="#">Recuperar Contrase&ntilde;a?</a><br>
    <?= form_close() ?>
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">
      <?= form_open_multipart("Services/$action",array('autocomplete' => 'off')) ?>

 			<div class='form-group'>
 				<label for="txtcompany_id">Compa&ntilde;ia:</label>
 				<select class="form-control textuppercase" name="txtcompany_id" id="txtcompany_id">
          <option value="">Seleccione</option>
          <?= $company_select ?>  
        </select>
 			</div>
 			<div class='form-group'>
 				<label for="txtname">Nombre:</label>
 				<input type="text" class="form-control textuppercase" name="txtname" id="txtname">
 			</div>
 			<div class='form-group'>
 				<label for="txtservicetype">Tipo de Servicio:</label>
        <div class="radio">
          <label class="radio-inline"><input type="radio" checked="checked" value="FO" name="txtservicetype">Formulario</label>
        </div>
        <div class="radio">
          <label class="radio-inline"><input type="radio" value="RP" name="txtservicetype">Reporte</label>
        </div>
        <dvi class="radio">
          <label class="radio-inline"><input type="radio" value="CH" name="txtservicetype">Grafico</label>
        </dvi>
        <dvi class="radio">
          <label class="radio-inline"><input type="radio" value="FD" name="txtservicetype">Carpeta</label>
        </dvi>
 			</div>
 			<div class='form-group'>
 				<label for="txtposition">Posicion:</label>
 				<input type="text" class="form-control" name="txtposition" id="txtposition">
 			</div>
      <!--<div class='form-group'>
        <label for="txtservice_parent_id">Service Parent:</label>
        <select class="form-control textuppercase" name="txtservice_parent_id" id="txtservice_parent_id">
          <option value="0">Sin Padre</option>
          <?= $service_parent_select ?>
        </select>
      </div>-->
      <div class='form-group'>
        <label for="txturl">Url:</label>
        <input type="text" class="form-control" name="txturl" id="txturl">
      </div>
      <div class='form-group'>
        <label for="txticon_class">Clase del Icono:</label>
        <input type="text" class="form-control" name="txticon_class" id="txticon_class">
      </div>
 			<button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar</button>
 			<a class="btn btn-danger" href="<?= base_url() ?>index.php/Services"><i class="fa fa-times" aria-hidden="true"></i> Cancelar</a>

      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
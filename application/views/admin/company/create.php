<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">
      <?= form_open_multipart("Companies/$action",array('autocomplete' => 'off')) ?>

 			<div class='form-group'>
 				<label for="txtvalue">Rif:</label>
 				<input type="text" class="form-control textuppercase" name="txtvalue" id="txtvalue">
 			</div>
 			<div class='form-group'>
 				<label for="txtname">Razon Social:</label>
 				<input type="text" class="form-control textuppercase" name="txtname" id="txtname">
 			</div>
 			<div class='form-group'>
 				<label for="txtshort_name">Nombre Corto:</label>
        <input type="text" class="form-control textuppercase" maxlength="3" name="txtshort_name" id="txtshort_name">
 			</div>
 			<div class='form-group'>
 				<label for="txtphone">Telefono:</label>
 				<input type="text" class="form-control" name="txtphone" id="txtphone">
 			</div>
 			<div class='form-group'>
 				<label for="txtemail">Correo Electronico:</label>
 				<input type="text" class="form-control textuppercase" name="txtemail" id="txtemail">
 			</div>
 			<button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar</button>
 			<a class="btn btn-danger" href="<?= base_url() ?>index.php/Companies"><i class="fa fa-times" aria-hidden="true"></i> Cancelar</a>

      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">
      <?= form_open_multipart("Roles/$action",array('autocomplete' => 'off')) ?>

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
        <label for="txtservices">Serviciones Asignados:</label>
        <?= $services ?>
      </div>
 			<button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar</button>
 			<a class="btn btn-danger" href="<?= base_url() ?>index.php/Roles"><i class="fa fa-times" aria-hidden="true"></i> Cancelar</a>

      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
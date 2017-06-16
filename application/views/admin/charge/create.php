<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">
      <?= form_open_multipart("Charges/$action",array('autocomplete' => 'off')) ?>

 			<div class='form-group'>
 				<label for="txtdepartament_id">Departamento:</label>
 				<select class="form-control textuppercase" name="txtdepartament_id" id="txtdepartament_id">
            <option value="">Seleccione</option>
            <?= $departaments ?>
        </select>
 			</div>
 			<div class='form-group'>
 				<label for="txtname">Nombre:</label>
        <input type="text" class="form-control textuppercase" name="txtname" id="txtname">
 			</div>
      <div class='form-group'>
        <label for="txtcharge_parent_id">Cargo Padre:</label>
        <select class="form-control textuppercase" name="txtcharge_parent_id" id="txtcharge_parent_id">
            <option value="0">Sin Padre</option>
            <?= $charges ?>
        </select>
      </div>
      <div class='form-group'>
        <label for="txtcharge_level_id">Nivel de Cargo:</label>
        <select class="form-control textuppercase" name="txtcharge_level_id" id="txtcharge_level_id">
            <option value="">Seleccione</option>
            <?= $chargelevels ?>
        </select>
      </div>
 			<button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar</button>
 			<a class="btn btn-danger" href="<?= base_url() ?>index.php/Charges"><i class="fa fa-times" aria-hidden="true"></i> Cancelar</a>

      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
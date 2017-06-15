<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">
      <?= form_open_multipart("Instrumentofevaluations/$action",array('autocomplete' => 'off')) ?>

 			<div class='form-group'>
 				<label for="txtcompany_id">Company:</label>
 				<select class="form-control textuppercase" name="txtcompany_id" id="txtcompany_id">
            <option value="">Seleccione</option>
            <?= $companies ?>
        </select>
 			</div>
 			<div class='form-group'>
 				<label for="txtname">Name:</label>
        <input type="text" class="form-control textuppercase" name="txtname" id="txtname">
 			</div>
      <div class='form-group'>
        <label for="txtdescription">Description:</label>
        <textarea class="form-control textuppercase" name="txtdescription" id="txtdescription"></textarea>
      </div>
      <div class='form-group'>
        <label for="txtinstruction">Instructions:</label>
        <textarea class="form-control textuppercase" name="txtinstructions" id="txtinstructions"></textarea>
      </div>
      <div class='form-group'>
        <label for="txtevaluationtype">Evaluation Type:</label>
        <div class="radio">
            <label><input type='radio' name='txtevaluationtype' checked="checked" value='UC' /> Cargo Arriba</label>
        </div>
        <div class="radio">
            <label><input type='radio' name='txtevaluationtype' value='AE' /> Auto Evaluacion</label>
        </div>
        <div class="radio">
            <label><input type='radio' name='txtevaluationtype' value='AB' /> Ambos</label>
        </div>
      </div>
      <div class='form-group'>
        <label for="txtcharge_level_id">Charge Level:</label>
        <select class="form-control textuppercase" name="txtcharge_level_id" id="txtcharge_level_id">
            <option value="">Seleccione</option>
            <?= $chargelevels ?>
        </select>
      </div>
      <div class='form-group'>
        <label for="txtstatus">Status:</label>
        <div class="radio">
            <label><input type='radio' name='txtstatus' checked="checked" value='DR' /> Borrador</label>
        </div>
        <div class="radio">
            <label><input type='radio' name='txtstatus' value='CO' /> Completo</label>
        </div>
      </div>
 			<button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button>
 			<a class="btn btn-danger" href="<?= base_url() ?>index.php/Instrumentofevaluations"><i class="fa fa-times" aria-hidden="true"></i> Cancel</a>

      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
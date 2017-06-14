<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">
      <?= form_open_multipart("Services/$action",array('autocomplete' => 'off')) ?>

 			<div class='form-group'>
 				<label for="txtcompany_id">Company:</label>
 				<select class="form-control textuppercase" name="txtcompany_id" id="txtcompany_id">
          <option value="">Seleccione</option>   
        </select>
 			</div>
 			<div class='form-group'>
 				<label for="txtname">Name:</label>
 				<input type="text" class="form-control textuppercase" name="txtname" id="txtname">
 			</div>
 			<div class='form-group'>
 				<label for="txtservicetype">Service Type:</label>
        <div class="radio">
          <label class="radio-inline"><input type="radio" value="FO" name="txtservicetype">Formulario</label>
        </div>
        <div class="radio">
          <label class="radio-inline"><input type="radio" value="RP" name="txtservicetype">Reporte</label>
        </div>
        <dvi class="radio">
          <label class="radio-inline"><input type="radio" value="CH" name="txtservicetype">Grafico</label>
        </dvi>
 			</div>
 			<div class='form-group'>
 				<label for="txtposition">Position:</label>
 				<input type="text" class="form-control" name="txtposition" id="txtposition">
 			</div>
 			<div class='form-group'>
 				<label for="txtemail">Email:</label>
 				<input type="text" class="form-control textuppercase" name="txtemail" id="txtemail">
 			</div>
 			<button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button>
 			<a class="btn btn-danger" href="<?= base_url() ?>index.php/Services"><i class="fa fa-times" aria-hidden="true"></i> Cancel</a>

      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
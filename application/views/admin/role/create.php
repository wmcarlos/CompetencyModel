<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">
      <?= form_open_multipart("companies/$action",array('autocomplete' => 'off')) ?>

 			<div class='form-group'>
 				<label for="txtcompany_id">Company:</label>
 				<select class="form-control textuppercase" name="txtvalue" id="txtvalue">
          <option value="">Seleccione</option>
          <?= $company_select ?>
        </select>
 			</div>
 			<div class='form-group'>
 				<label for="txtname">Name:</label>
 				<input type="text" class="form-control textuppercase" name="txtname" id="txtname">
 			</div>
 			<button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button>
 			<a class="btn btn-danger" href="<?= base_url() ?>index.php/companies"><i class="fa fa-times" aria-hidden="true"></i> Cancel</a>

      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
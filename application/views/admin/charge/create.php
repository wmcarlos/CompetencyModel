<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">
      <?= form_open_multipart("Users/$action",array('autocomplete' => 'off')) ?>

 			<div class='form-group'>
 				<label for="txtcompany_id">Company:</label>
 				<select class="form-control textuppercase" name="txtcompany_id" id="txtcompany_id">
            <option value="">Seleccione</option>
            <?= $companies ?>
        </select>
 			</div>
      <div class='form-group'>
        <label for="txtrole_id">Role:</label>
        <select class="form-control textuppercase" name="txtrole_id" id="txtrole_id">
            <option value="">Seleccione</option>
            <?= $roles ?>
        </select>
      </div>
 			<div class='form-group'>
 				<label for="txtvalue">Value:</label>
 				<input type="text" class="form-control textuppercase" name="txtvalue" id="txtvalue">
 			</div>
 			<div class='form-group'>
 				<label for="txtname">Name:</label>
        <input type="text" class="form-control textuppercase" name="txtname" id="txtname">
 			</div>
      <div class='form-group'>
        <label for="txtemail">Email:</label>
        <input type="text" class="form-control textuppercase" name="txtemail" id="txtemail">
      </div>
 			<div class='form-group'>
 				<label for="txtphone">Phone:</label>
 				<input type="text" class="form-control" name="txtphone" id="txtphone">
 			</div>
 			<button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button>
 			<a class="btn btn-danger" href="<?= base_url() ?>index.php/Users"><i class="fa fa-times" aria-hidden="true"></i> Cancel</a>

      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
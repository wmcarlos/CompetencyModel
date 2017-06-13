<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h3 class="box-title"><?= $title ?></h3>
      </div>
      <div class="box-body">
      <?= form_open("companies/store") ?>

 			<div class='form-group'>
 				<label for="txtvalue">Value:</label>
 				<input type="text" class="form-control" name="txtvalue" id="txtvalue">
 			</div>
 			<div class='form-group'>
 				<label for="txtname">Name:</label>
 				<input type="text" class="form-control" name="txtname" id="txtname">
 			</div>
 			<div class='form-group'>
 				<label for="txtbrand">Brand:</label>
 				<input type="file" name="txtbrand" id="txtbrand">
 			</div>
 			<div class='form-group'>
 				<label for="txtphone">Phone:</label>
 				<input type="text" class="form-control" name="txtphone" id="txtphone">
 			</div>
 			<div class='form-group'>
 				<label for="txtemail">Email:</label>
 				<input type="text" class="form-control" name="txtemail" id="txtemail">
 			</div>
 			<button class="btn btn-success" type="submit">Save</button>
 			<a class="btn btn-danger" href="<?= base_url() ?>index.php/companies">Cancel</a>
 			
      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
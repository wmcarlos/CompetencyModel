<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">
      <?= form_open_multipart("companies/$action",array('autocomplete' => 'off')) ?>

 			<div class='form-group'>
 				<label for="txtvalue">Value:</label>
 				<input type="hidden" name="txtcompany_id" id='txtcompany_id' value='<?= $item[0]->company_id ?>'>
 				<input type="text" class="form-control textuppercase" value='<?= $item[0]->value ?>' name="txtvalue" id="txtvalue">
 			</div>
 			<div class='form-group'>
 				<label for="txtname">Name:</label>
 				<input type="text" class="form-control textuppercase" value='<?= $item[0]->name ?>' name="txtname" id="txtname">
 			</div>
 			<div class='form-group'>
 				<label for="txtbrand">Brand:</label>
 			</div>
 			<div class="form-group">
 				<img width="160" height="160" src="<?= base_url() ?>public/upload/company/<?= $item[0]->brand ?>"/>
 				<br />
 				<br />
 				<input type="file" name="txtbrand" id="txtbrand">
 			</div>
 			<div class='form-group'>
 				<label for="txtphone">Phone:</label>
 				<input type="text" class="form-control" value='<?= $item[0]->phone ?>' name="txtphone" id="txtphone">
 			</div>
 			<div class='form-group'>
 				<label for="txtemail">Email:</label>
 				<input type="text" class="form-control textuppercase" value='<?= $item[0]->email ?>' name="txtemail" id="txtemail">
 			</div>
 			<button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button>
 			<a class="btn btn-danger" href="<?= base_url() ?>index.php/companies"><i class="fa fa-times" aria-hidden="true"></i> Cancel</a>

      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
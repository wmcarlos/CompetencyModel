<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">
      <?= form_open_multipart("Periods/$action",array('autocomplete' => 'off')) ?>
      <div class='form-group'>
        <label for="txtcompany_id">Company:</label>
        <input type="hidden" name="txtperiod_id" id="txtperiod_id" value="<?= $item[0]->period_id ?>">
        <select class="form-control textuppercase" name="txtcompany_id" id="txtcompany_id">
            <option value="">Seleccione</option>
            <?= $companies ?>
        </select>
      </div>
      <div class='form-group'>
        <label for="txtname">Name:</label>
        <input type="text" class="form-control textuppercase" value="<?= $item[0]->name ?>" name="txtname" id="txtname">
      </div>
      <div class='form-group'>
        <label for="txtstartdate">Start Date:</label>
        <input type="text" class="form-control textuppercase" value="<?= $item[0]->startdate ?>" name="txtstartdate" id="txtstartdate">
      </div>
      <div class='form-group'>
        <label for="txtenddate">End Date:</label>
        <input type="text" class="form-control textuppercase" value="<?= $item[0]->enddate ?>" name="txtenddate" id="txtenddate">
      </div>
      <button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button>
      <a class="btn btn-danger" href="<?= base_url() ?>index.php/Periods"><i class="fa fa-times" aria-hidden="true"></i> Cancel</a>
      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
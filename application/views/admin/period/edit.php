<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">
      <?= form_open_multipart("Charges/$action",array('autocomplete' => 'off')) ?>

      <div class='form-group'>
        <label for="txtdepartament_id">Departament:</label>
        <input type="hidden" name="txtcharge_id" id="txtcharge_id" value="<?= $item[0]->charge_id ?>">
        <select class="form-control textuppercase" name="txtdepartament_id" id="txtdepartament_id">
            <option value="">Seleccione</option>
            <?= $departaments ?>
        </select>
      </div>
      <div class='form-group'>
        <label for="txtname">Name:</label>
        <input type="text" class="form-control textuppercase" value="<?= $item[0]->name ?>" name="txtname" id="txtname">
      </div>
      <div class='form-group'>
        <label for="txtcharge_parent_id">Charge Parent:</label>
        <select class="form-control textuppercase" name="txtcharge_parent_id" id="txtcharge_parent_id">
            <option value="0">NOT PARENT</option>
            <?= $charges ?>
        </select>
      </div>
      <div class='form-group'>
        <label for="txtcharge_level_id">Charge Level:</label>
        <select class="form-control textuppercase" name="txtcharge_level_id" id="txtcharge_level_id">
            <option value="">Seleccione</option>
            <?= $chargelevels ?>
        </select>
      </div>
      <button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button>
      <a class="btn btn-danger" href="<?= base_url() ?>index.php/Charges"><i class="fa fa-times" aria-hidden="true"></i> Cancel</a>

      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
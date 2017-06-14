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
        <input type="hidden" name="txtservice_id" id="txtservice_id" value="<?= $item[0]->service_id ?>">
        <select class="form-control textuppercase" name="txtcompany_id" id="txtcompany_id">
          <option value="">Seleccione</option>
          <?= $company_select ?>  
        </select>
      </div>
      <div class='form-group'>
        <label for="txtname">Name:</label>
        <input type="text" class="form-control textuppercase" value="<?= $item[0]->name ?>" name="txtname" id="txtname">
      </div>
      <div class='form-group'>
        <label for="txtservicetype">Service Type:</label>
        <div class="radio">
          <label class="radio-inline"><input type="radio" checked="checked" value="FO" name="txtservicetype">Formulario</label>
        </div>
        <div class="radio">
          <label class="radio-inline"><input type="radio" <?php if($item[0]->servicetype == "RP"){ print "checked='checked'"; } ?> value="RP" name="txtservicetype">Reporte</label>
        </div>
        <dvi class="radio">
          <label class="radio-inline"><input type="radio" <?php if($item[0]->servicetype == "CH"){ print "checked='checked'"; } ?> value="CH" name="txtservicetype">Grafico</label>
        </dvi>
      </div>
      <div class='form-group'>
        <label for="txtposition">Position:</label>
        <input type="text" class="form-control" value="<?= $item[0]->position ?>" name="txtposition" id="txtposition">
      </div>
      <!--<div class='form-group'>
        <label for="txtservice_parent_id">Service Parent:</label>
        <select class="form-control textuppercase" name="txtservice_parent_id" id="txtservice_parent_id">
          <option value="0">Sin Padre</option>
          <?= $service_parent_select ?>
        </select>
      </div>-->
      <div class='form-group'>
        <label for="txturl">Url:</label>
        <input type="text" class="form-control" value="<?= $item[0]->url ?>" name="txturl" id="txturl">
      </div>
      <div class='form-group'>
        <label for="txticon_class">Icon Class:</label>
        <input type="text" class="form-control" value="<?= $item[0]->icon_class ?>" name="txticon_class" id="txticon_class">
      </div>
      <button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button>
      <a class="btn btn-danger" href="<?= base_url() ?>index.php/Services"><i class="fa fa-times" aria-hidden="true"></i> Cancel</a>

      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
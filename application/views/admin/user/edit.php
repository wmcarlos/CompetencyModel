<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">
      <?= form_open_multipart("Users/$action",array('autocomplete' => 'off')) ?>

      <div class='form-group'>
        <label for="txtcompany_id">Compa&ntilde;ia:</label>
        <input type="hidden" name="txtuser_id" id="txtuser_id" value="<?= $item[0]->user_id ?>">
        <select class="form-control textuppercase" name="txtcompany_id" id="txtcompany_id">
            <option value="">Seleccione</option>
            <?= $companies ?>
        </select>
      </div>
      <div class='form-group'>
        <label for="txtrole_id">Rol:</label>
        <select class="form-control textuppercase" name="txtrole_id" id="txtrole_id">
            <option value="">Seleccione</option>
            <?= $roles ?>
        </select>
      </div>
      <div class='form-group'>
        <label for="txtvalue">Cedula:</label>
        <input type="text" class="form-control textuppercase" value="<?= $item[0]->value ?>" name="txtvalue" id="txtvalue">
      </div>
      <div class='form-group'>
        <label for="txtname">Nombre:</label>
        <input type="text" class="form-control textuppercase" value="<?= $item[0]->name ?>" name="txtname" id="txtname">
      </div>
      <div class='form-group'>
        <label for="txtemail">Correo:</label>
        <input type="text" class="form-control textuppercase" value="<?= $item[0]->email ?>" name="txtemail" id="txtemail">
      </div>
      <div class='form-group'>
        <label for="txtphone">Telefono:</label>
        <input type="text" class="form-control" name="txtphone" value="<?= $item[0]->phone ?>" id="txtphone">
      </div>
      <button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar</button>
      <a class="btn btn-danger" href="<?= base_url() ?>index.php/Users"><i class="fa fa-times" aria-hidden="true"></i> Cancelar</a>

      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
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


      <h3>Cargo Asignado</h3>
      <hr/>
      <table class="table table-bordered table-striped">
        <thead>
          <th>Cargo</th>
          <th>Activo</th>
          <th>Fecha Inicio</th>
          <th>Fecha Fin</th>
          <th>Fecha Fin</th>
          <th>-</th>
        </thead>
        <tbody>
          <tr>
            <td>
              <select class="form-control textuppercase fr_select" id="txtcharge_id">
                <option value="">-</option>
                <?= $charges ?>
              </select>
            </td>
            <td>
              <select class="form-control textuppercase fr_select" id="txtisactive">
                <option value="Y">SI</option>
                <option value="N">NO</option>
              </select>
            </td>
            <td><input type="text" class="form-control" id="txtstartdate"/></td>
            <td><input type="text" class="form-control" id="txtenddate"/></td>
            <td><button class="btn btn-success fr_button_add" data-clean="txtcharge_id,txtisactive,txtstartdate,txtenddate"  type="button"><i class="fa fa-plus"></i></button></td>
          </tr>
        </tbody>

        <style type="text/css">
            .tr_padre{display: none;}
        </style>

        <tbody id="load_detail" class="fr_details">

          <tr class="tr_padre">
            <td>
              {{txtcharge_id}}
              <input type="hidden" name="txtcharges[]" value="{{txtcharge_id-value}}"> 
            </td>
            <td>
              {{txtisactive}}
              <input type="hidden" name="txtisactives[]" value="{{txtisactive-value}}"> 
            </td>
            <td>
              {{txtstartdate}}
              <input type="hidden" name="txtstartdates[]" value="{{txtstartdate}}">
            </td>
            <td>
              {{txtenddate}}
              <input type="hidden" name="txtenddates[]" value="{{txtenddate}}">
            </td>
            <td><button class="btn btn-danger fr_button_remove" type="button"><i class="fa fa-times"></i></button></td>
          </tr>

          <!--Generado con PHP-->
          <?php foreach($charge_assignets AS $charge_assignet){ ?>
            <tr>
              <td>
                <?= $charge_assignet->charge ?>
              </td>
              <td>
                <?= $charge_assignet->isactive ?>
              </td>
              <td>
                <?= $charge_assignet->startdate ?>
              </td>
              <td>
                <?= $charge_assignet->enddate ?>
              </td>
              <td></td>
            </tr>
          <?php } ?>
        </tbody>
      </table>


      <button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar</button>
      <a class="btn btn-danger" href="<?= base_url() ?>index.php/Users"><i class="fa fa-times" aria-hidden="true"></i> Cancelar</a>

      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
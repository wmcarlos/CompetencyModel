<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">
      <?= form_open_multipart("Competencies/$action",array('autocomplete' => 'off')) ?>

      <div class='form-group'>
        <label for="txtcompany_id">Compa&ntilde;ia:</label>
        <select class="form-control textuppercase" name="txtcompany_id" id="txtcompany_id">
            <option value="">Seleccione</option>
            <?= $companies ?>
        </select>
      </div>
      <div class='form-group'>
        <label for="txtname">Nombre:</label>
        <input type="text" class="form-control textuppercase" name="txtname" id="txtname">
      </div>
      <div class='form-group'>
        <label for="txtdefinition">Definicion:</label>
        <textarea class="form-control textuppercase" name="txtdefinition" id="txtdefinition"></textarea>
      </div>
      <div class='form-group'>
        <label for="txtcharge_level_id">Nivel de Cargo:</label>
        <select class="form-control textuppercase" name="txtcharge_level_id" id="txtcharge_level_id">
            <option value="">Seleccione</option>
            <?= $chargelevels ?>
        </select>
      </div>
      <h3>Indicadores Conductuales</h3>
      <hr/>
      <table class="table table-bordered table-striped">
        <thead>
          <th>Description</th>
          <th>Nivel de Desarrollo</th>
          <th>Position</th>
          <th>-</th>
        </thead>
        <tbody>
          <tr>
            <td>
              <textarea class="form-control textuppercase" id="txtdescription"></textarea>
            </td>
            <td>
              <select class="form-control textuppercase fr_select" id="txtdevelopment_level">
                <option value="">-</option>
                <?= $developmentlevels ?>
              </select>
            </td>
            <td><input type="text" class="form-control" id="txtposition"/></td>
            <td><button class="btn btn-success fr_button_add"  type="button"><i class="fa fa-plus"></i></button></td>
          </tr>
        </tbody>

        <style type="text/css">
            .tr_padre{display: none;}
        </style>

        <tbody id="load_detail" class="fr_details">
          <tr class="tr_padre">
            <td>
              {{txtdescription}}
              <input type="hidden" name="txtdescriptions[]" value="{{txtdescription}}"> 
            </td>
            <td>
                {{txtdevelopment_level}}
                <input type="hidden" name="txtdevelopment_level[]" value="{{txtdevelopment_level-value}}">
            </td>
            <td>
              {{txtposition}}
              <input type="hidden" name="txtpositions[]" value="{{txtposition}}">
            </td>
            <td><button class="btn btn-danger fr_button_remove" type="button"><i class="fa fa-times"></i></button></td>
          </tr>
        </tbody>


      </table>
      <button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar</button>
      <a class="btn btn-danger" href="<?= base_url() ?>index.php/Competencies"><i class="fa fa-times" aria-hidden="true"></i> Cancelar</a>

      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>




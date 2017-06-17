<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">
      <?= form_open_multipart("Instrumentofevaluations/$action",array('autocomplete' => 'off')) ?>

      <div class='form-group'>
        <label for="txtcompany_id">Compa&ntilde;ia:</label>
        <input type="hidden" name="txtinstrument_of_evaluation_id" value='<?= $item[0]->instrument_of_evaluation_id ?>' id='txtinstrument_of_evaluation_id'>
        <select class="form-control textuppercase" name="txtcompany_id" id="txtcompany_id">
            <option value="">Seleccione</option>
            <?= $companies ?>
        </select>
      </div>
      <div class='form-group'>
        <label for="txtname">Nombre:</label>
        <input type="text" class="form-control textuppercase" value="<?= $item[0]->name ?>" name="txtname" id="txtname">
      </div>
      <div class='form-group'>
        <label for="txtdescription">Descripcion:</label>
        <textarea class="form-control textuppercase" name="txtdescription" id="txtdescription"><?= $item[0]->description ?></textarea>
      </div>
      <div class='form-group'>
        <label for="txtinstruction">Instrucciones:</label>
        <textarea class="form-control textuppercase" name="txtinstructions" id="txtinstructions"><?= $item[0]->instructions ?></textarea>
      </div>
      <div class='form-group'>
        <label for="txtevaluationtype">Tipo de Evaluacion:</label>
        <div class="radio">
            <label><input type='radio' name='txtevaluationtype' checked="checked" value='UC' /> Cargo Arriba</label>
        </div>
        <div class="radio">
            <label><input type='radio' name='txtevaluationtype' <?= ($item[0]->evaluationtype == 'AE') ? "checked='checked'" : ""; ?> value='AE' /> Auto Evaluacion</label>
        </div>
        <div class="radio">
            <label><input type='radio' name='txtevaluationtype' <?= ($item[0]->evaluationtype == 'AB') ? "checked='checked'" : ""; ?> value='AB' /> Ambos</label>
        </div>
      </div>
      <div class='form-group'>
        <label for="txtcharge_level_id">Nivel de Cargo:</label>
        <select class="form-control textuppercase" name="txtcharge_level_id" id="txtcharge_level_id">
            <option value="">Seleccione</option>
            <?= $chargelevels ?>
        </select>
      </div>
      <div class='form-group'>
        <label for="txtstatus">Estatus:</label>
        <div class="radio">
            <label><input type='radio' name='txtstatus' checked="checked" value='DR' /> Borrador</label>
        </div>
        <div class="radio">
            <label><input type='radio' name='txtstatus' <?= ($item[0]->status == 'CO') ? "checked='checked'" : ""; ?> value='CO' /> Completo</label>
        </div>
      </div>

      <table class="table table-bordered table-striped">

        <thead>
          <th>Nivel de Cargo</th>
          <th>Ponderacion</th>
          <th>-</th>
        </thead>
        <tbody>
          <tr>
            <td>
              <select class="form-control fr_select" id="txtdtcharge_level_id">
                <option value="">-</option>
                <?= $chargelevels2 ?>
              </select>
            </td>
            <td>
              <input type="text" class="form-control" id="txtvalue">
            </td>
            <td>
              <button class="btn btn-success fr_button_add" type="button"><i class="fa fa-plus"></i></button>
            </td>
          </tr>
        </tbody>

        <style type="text/css">
            .tr_padre{display: none;}
        </style>

        <tbody id="load_detail" class="fr_details">
            <tr class="tr_padre">
              <td>
                {{txtdtcharge_level_id}}
                <input type="hidden" name="txtchargelevels[]" value="{{txtdtcharge_level_id-value}}">
              </td>
              <td>
                {{txtvalue}}
                <input type="hidden" name="txtvalues[]" value="{{txtvalue}}">
              </td>
              <td>
                <button class="btn btn-danger fr_button_remove" type="button"><i class="fa fa-times"></i></button>
              </td>
            </tr>
        </tbody>

        <!--Generado desde PHP-->
        <tbody>
        <?php foreach($dtcharge_ponderations AS $ponderation) { ?>
          <tr>
              <td>
                <?= $ponderation->charge_level ?>
                <input type="hidden" name="txtchargelevels[]" value="<?= $ponderation->charge_level_id ?>">
              </td>
              <td>
                <?= $ponderation->value ?>
                <input type="hidden" name="txtvalues[]" value="<?= $ponderation->value ?>">
              </td>
              <td>
                <button class="btn btn-danger fr_button_remove" type="button"><i class="fa fa-times"></i></button>
              </td>
            </tr>

        <?php } ?>
        </tbody>
      </table>

      <button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar</button>
      <a class="btn btn-danger" href="<?= base_url() ?>index.php/Instrumentofevaluations"><i class="fa fa-times" aria-hidden="true"></i> Cancelar</a>

      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
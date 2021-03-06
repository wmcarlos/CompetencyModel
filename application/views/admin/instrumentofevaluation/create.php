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
        <label for="txtdescription">Descripcion:</label>
        <textarea class="form-control textuppercase" name="txtdescription" id="txtdescription"></textarea>
      </div>
      <div class='form-group'>
        <label for="txtinstruction">Instrucciones:</label>
        <textarea class="form-control textuppercase" name="txtinstructions" id="txtinstructions"></textarea>
      </div>
      <div class='form-group'>
        <label for="txtevaluationtype">Tipo de Evaluacion:</label>
        <div class="radio">
            <label><input type='radio' name='txtevaluationtype' checked="checked" value='UC' /> Cargo Arriba</label>
        </div>
        <div class="radio">
            <label><input type='radio' name='txtevaluationtype' value='AE' /> Auto Evaluacion</label>
        </div>
        <div class="radio">
            <label><input type='radio' name='txtevaluationtype' value='AB' /> Ambos</label>
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
            <label><input type='radio' name='txtstatus' value='CO' /> Completo</label>
        </div>
      </div>
      <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#ponderaciones">Ponderaciones segun Nivel de Cargo</a></li>
        <li><a data-toggle="tab" href="#competencias">Competencias</a></li>
      </ul>

      <div class="tab-content">
        <div id="ponderaciones" class="tab-pane fade in active">
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
                      <?= $chargelevels ?>
                    </select>
                  </td>
                  <td>
                    <input type="text" class="form-control" id="txtvalue">
                  </td>
                  <td>
                    <button class="btn btn-success fr_button_add" data-clean='txtdtcharge_level_id,txtvalue' type="button"><i class="fa fa-plus"></i></button>
                  </td>
                </tr>
              </tbody>

              <style type="text/css">
                  .tr_padre{display: none;}
              </style>

              <tbody id="load_detail_ponderation" class="fr_details">
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
                      <button class="btn btn-danger fr_button_remove" id= type="button"><i class="fa fa-times"></i></button>
                    </td>
                  </tr>
              </tbody>
            </table>
        </div>
        <div id="competencias" class="tab-pane fade">
            <table class="table table-bordered table-striped">
              <thead>
                <th>Competencia</th>
                <th>Posicion</th>
                <th>-</th>
              </thead>
              <tbody>
                <tr>
                  <td>
                    <select class="form-control fr_select" id="txtcompetency_id">
                      <option value="">-</option>
                      <?= $competencies ?>
                    </select>
                  </td>
                  <td>
                    <input type="text" class="form-control" id="txtposition">
                  </td>
                  <td>
                    <button class="btn btn-success fr_button_add" data-clean='txtcompetency_id,txtposition' type="button"><i class="fa fa-plus"></i></button>
                  </td>
                </tr>
              </tbody>

              <style type="text/css">
                  .tr_padre{display: none;}
              </style>

              <tbody id="load_detail_competency" class="fr_details">
                  <tr class="tr_padre">
                    <td>
                      {{txtcompetency_id}}
                      <input type="hidden" name="txtcompetencies[]" value="{{txtcompetency_id-value}}">
                    </td>
                    <td>
                      {{txtposition}}
                      <input type="hidden" name="txtpositions[]" value="{{txtposition}}">
                    </td>
                    <td>
                      <button class="btn btn-danger fr_button_remove" type="button"><i class="fa fa-times"></i></button>
                    </td>
                  </tr>
              </tbody>
            </table>
        </div>
      </div>
 			<button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar</button>
 			<a class="btn btn-danger" href="<?= base_url() ?>index.php/Instrumentofevaluations"><i class="fa fa-times" aria-hidden="true"></i> Cancelar</a>

      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
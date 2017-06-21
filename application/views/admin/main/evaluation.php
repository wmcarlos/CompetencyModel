<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h2><?= $instrument[0]->name ?></h2>
      </div>
      <div class="box-body">
        <?= form_open('Mains/evaluate') ?>
        <h4>Periodo a Evaluar</h4>
        <hr/>
        <div class="form-group">
          <input type="hidden" name="txtinstrument_id" value="<?= $instrument[0]->instrument_of_evaluation_id ?>">
          <input type="hidden" name="txtuser_evaluated_id" value="<?= $user_evaluated[0]->user_id ?>">
          <input type="hidden" name="txtuser_evaluator_id" value="<?= $user_evaluator[0]->user_id ?>">
          <label for="startdate">Desde:</label>
          <input type="text" name="startdate" value="<?= $instrument[0]->startdate ?>" readonly="readonly" class="form-control" id="startdate">
        </div>
        <div class="form-group">
          <label for="enddate">Hasta:</label>
          <input type="text" name="enddate" value="<?= $instrument[0]->enddate ?>" readonly="readonly" class="form-control" id="enddate">
        </div>

        <h4>Datos del Evaluado</h4>
        <hr/>
        <div class="form-group">
          <label for="fullname">Nombre y Apellido:</label>
          <input type="text" name="fullname" value="<?= $user_evaluated[0]->name ?>" readonly="readonly" class="form-control" id="fullname">
        </div>
        <div class="form-group">
          <label for="value">Cedula:</label>
          <input type="text" name="value" readonly="readonly" value="<?= $user_evaluated[0]->value ?>" class="form-control" id="value">
        </div>
        <div class="form-group">
          <label for="charge">Cargo:</label>
          <input type="text" name="charge" value="<?= $user_evaluated[0]->charge ?>" readonly="readonly" class="form-control" id="charge">
        </div>
        <div class="form-group">
          <label for="timeinthecharge">Tiempo en el Cargo:</label>
          <input type="text" name="timeinthecharge" readonly="readonly" class="form-control" id="timeinthecharge">
        </div>

        <h4>Datos del Evaluador</h4>
        <hr/>
        <div class="form-group">
          <label for="efullname">Nombre y Apellido:</label>
          <input type="text" name="efullname" value="<?= $user_evaluator[0]->name ?>" readonly="readonly" class="form-control" id="efullname">
        </div>
        <div class="form-group">
          <label for="evalue">Cedula:</label>
          <input type="text" name="evalue" value="<?= $user_evaluator[0]->value ?>" readonly="readonly" class="form-control" id="evalue">
        </div>
        <div class="form-group">
          <label for="echarge">Cargo:</label>
          <input type="text" name="echarge" value="<?= $user_evaluator[0]->charge ?>" readonly="readonly" class="form-control" id="echarge">
        </div>
        <h4>Instrucciones</h4>
        <hr/>
        <div class="form-group">
          <textarea id="instructions" style="height: 120px;" readonly="readonly" name="instructions" class="form-control"><?= $instrument[0]->instructions ?></textarea>
        </div>
        <h4>Competencias</h4>
        <hr/>
        <table class="table table-bordered table-striped">
          <tbody>
          <?php foreach($competencies AS $competency){ ?>
            <tr>
              <td colspan="2"><b>Competencia:</b> <?= $competency->name ?></td>
              <td rowspan="2" colspan="5" align="center" valign="bottom">Nivel de Dominio</td>
            </tr>
            <tr>
              <td colspan="2"><b>Definicion:</b> <?= $competency->definition ?></td>
            </tr>
            <tr>
              <td colspan="2"><b><?= $competency->name ?></b></td>
              <?php foreach($domain_levels AS $domain_level){ ?>
              <td><?= $domain_level->position ?></td>
              <?php } ?>
              <td>Total</td>
            </tr>

              <?php $data = $this->Instrumentofevaluation->getBehaviorIndicators($competency->competency_id); ?>

              <?php for($i = 0; $i < count($data); $i++){ ?>

                  <?php if(isset($data[$i+1]->level) AND $data[$i]->level == $data[$i+1]->level){ ?>

                    <tr>
                      <td><input type="hidden" name="txtindicators[]" value="<?= $competency->competency_id ?>_<?= $data[$i]->behavioral_indicator_id ?>"><?= $data[$i]->level ?>
                      </td>
                      <td><?= $data[$i]->description ?></td>
                      <?php foreach($domain_levels AS $domain_level){ ?>

                      <td>
                        <input name='txtbeharvioral_indicator<?= $competency->competency_id ?>_<?= $data[$i]->behavioral_indicator_id ?>[]' value='<?= $competency->competency_id ?>_<?= $data[$i]->behavioral_indicator_id ?>_<?= $domain_level->domain_level_id ?>' type="radio"/></td>
                      <?php } ?>
                      <td></td>
                    </tr>

                  <?php }else{ ?>

                    <tr>
                      <td><input type="hidden" name="txtindicators[]" value="<?= $competency->competency_id ?>_<?= $data[$i]->behavioral_indicator_id ?>"><?= $data[$i]->level ?>
                      </td>
                      <td><?= $data[$i]->description ?></td>
                      <?php foreach($domain_levels AS $domain_level){ ?>

                      <td>
                        <input name='txtbeharvioral_indicator<?= $competency->competency_id ?>_<?= $data[$i]->behavioral_indicator_id ?>[]' value='<?= $competency->competency_id ?>_<?= $data[$i]->behavioral_indicator_id ?>_<?= $domain_level->domain_level_id ?>' type="radio"/></td>
                      <?php } ?>

                      <td></td>
                    </tr>
                    <tr>
                      <td colspan="2" align="right"><b><?= $data[$i]->level ?> de Desarrollo</b></td>
                        <?php foreach($domain_levels AS $domain_level){ ?>
                          <td></td>
                        <?php } ?>
                      <td></td>
                    </tr>
                   <?php } ?>


              <?php } ?>
                <tr>
                  <td colspan="2" align="right"><b>TOTAL<?= $competency->name ?></b></td>
                  <td colspan="4"></td>
                  <td></td>
                </tr>
          <?php } ?>
          </tbody>
        </table>
        <button class="btn btn-success" type="submit"><i class="fa fa-floppy-o"></i> Guardar Evaluaci&oacute;n</button>
        <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
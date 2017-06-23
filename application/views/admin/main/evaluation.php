<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h2><?= $instrument[0]->name ?></h2>
      </div>
      <div class="box-body">
        <ul class="nav nav-tabs">
          <li class="active"><a data-toggle="tab" href="#evaluacion">Evaluacion</a></li>
          <li><a data-toggle="tab" href="#resultado">Resultado</a></li>
        </ul>
        <div class="tab-content">
        <div id="evaluacion" class="tab-pane fade in active">
            <?php if(count($result_evaluation) > 0){ $disabled = "disabled='disabled'"; ?>
            <br />
            <div class="alert alert-info">
              <strong>Informaci&oacute;n!</strong> Ya esta Evaluaci&oacute;n fue realizada!!!.
            </div>

            <?php }else{ $disabled = ""; } ?>
            <?= form_open('Mains/evaluate',array("id"=>"fevaluation")) ?>
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
              <?php 
                $total_competencia = 0;
                foreach($competencies AS $competency){
              ?>
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
                          <?php
                              $label = "";
                              if(count($result_evaluation) > 0){
                                $verifyCheck = $this->Instrumentofevaluation->check_item($result_evaluation[0]->user_instrument_id,$data[$i]->behavioral_indicator_id,$domain_level->domain_level_id);

                                if(count($verifyCheck) > 0){ $label = "checked='checked'"; }
                              }
                           ?>
                            <input name='txtbeharvioral_indicator<?= $competency->competency_id ?>_<?= $data[$i]->behavioral_indicator_id ?>' value='<?= $competency->competency_id ?>_<?= $data[$i]->behavioral_indicator_id ?>_<?= $domain_level->domain_level_id ?>' data-calculate='<?= $competency->competency_id ?>_<?= $data[$i]->development_level_id ?>_<?= $domain_level->domain_level_id ?>' onclick="set_calculate();" data-mult="<?= $domain_level->value ?>_<?= $data[$i]->value ?>" <?= $label ?> <?= $disabled ?> type="radio"/></td>
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
                          <?php
                              $label = "";
                              if(count($result_evaluation) > 0){
                                $verifyCheck = $this->Instrumentofevaluation->check_item($result_evaluation[0]->user_instrument_id,$data[$i]->behavioral_indicator_id,$domain_level->domain_level_id);

                                if(count($verifyCheck) > 0){ $label = "checked='checked'"; }
                              }
                           ?>
                            <input name='txtbeharvioral_indicator<?= $competency->competency_id ?>_<?= $data[$i]->behavioral_indicator_id ?>' value='<?= $competency->competency_id ?>_<?= $data[$i]->behavioral_indicator_id ?>_<?= $domain_level->domain_level_id ?>' data-calculate='<?= $competency->competency_id ?>_<?= $data[$i]->development_level_id ?>_<?= $domain_level->domain_level_id ?>' onclick="set_calculate();" data-mult="<?= $domain_level->value ?>_<?= $data[$i]->value ?>" <?= $label ?> <?= $disabled ?> type="radio"/></td>
                          <?php } ?>

                          <td></td>
                        </tr>
                        <tr>
                          <td colspan="2" align="right"><b><?= $data[$i]->level ?> de Desarrollo</b></td>
                            <?php 
                              $suma_total = 0; 
                              foreach($domain_levels AS $domain_level){ ?>
                              <td id='<?= $competency->competency_id ?>_<?= $data[$i]->development_level_id ?>_<?= $domain_level->domain_level_id ?>'>
                                <?php 
                                    if(count($result_evaluation) > 0 ){
                                    $result_dl = $this->Instrumentofevaluation->getResultForDomainLevel($result_evaluation[0]->user_instrument_id,$domain_level->domain_level_id,$competency->competency_id,$data[$i]->development_level_id);
                                    if($result_dl->total){
                                      print $result_dl->total;
                                       $suma_total += $result_dl->total; 
                                    }else{
                                      print 0;
                                      $suma_total+=0;
                                    }
                                 }else{
                                  print 0;
                                 }
                                ?>
                              </td>
                            <?php } ?>
                          <td id="<?= $competency->competency_id ?>_<?= $data[$i]->development_level_id ?>">
                            <?php 
                                $total_competencia += $suma_total;
                                print $suma_total;
                            ?></td>
                        </tr>
                       <?php } ?>

                  <?php } ?>
                    <tr>
                      <td colspan="2" align="right"><b>TOTAL <?= $competency->name ?></b></td>
                      <td colspan="4"></td>
                      <td id="competency_<?= $competency->competency_id ?>"><?= $total_competencia ?></td>
                    </tr>
              <?php $total_competencia = 0; } ?>
              </tbody>
            </table>
            <?php if(count($result_evaluation) <= 0){ ?>
              <button class="btn btn-success" type="submit"><i class="fa fa-floppy-o"></i> Guardar Evaluaci&oacute;n</button>
            <?php } ?>
            <a class="btn btn-info" href="<?= base_url() ?>index.php/Mains"><i class="fa fa-arrow-left" aria-hidden="true"></i> Volver</a>
            <?= form_close() ?>
          </div>
          <div id="resultado" class="tab-pane fade">
            <?php if(count($result_evaluation) > 0){ ?>
               
            <div id="container" style="width: 100%; height: 400px; margin: 0 auto"></div>

            <?php }else{ ?>
            <br/>
                <div class="alert alert-danger">
                  <strong>Alerta!</strong> aun no existen datos para esta evaluacion!!!
                </div>
            <?php } ?>
            <a class="btn btn-info" href="<?= base_url() ?>index.php/Mains"><i class="fa fa-arrow-left" aria-hidden="true"></i> Volver</a>
          </div>
          </div>
      </div>
    </div>
  </section>
</div>
<script type="text/javascript">

  $(document).ready(function(){
      $('#fevaluation').validate({
          errorPlacement: function(error,element) {
            element.parent().parent().css("background","red");
          },
          unhighlight: function(element) {
            element.parentNode.parentNode.style.background = "";
          },
          rules: {
          <?php 
            $thedata = $this->Instrumentofevaluation->getCompetencyCombination($instrument[0]->instrument_of_evaluation_id);

            for($x = 0; $x < count($thedata); $x++){

              if( ($x+1) == count($thedata) ){
          ?>
              txtbeharvioral_indicator<?= $thedata[$x]->combination ?>: {
                  required: true
              }
          <?php
              }else{
           ?>
              txtbeharvioral_indicator<?= $thedata[$x]->combination ?>: {
                  required: true
              },
           <?php
              }

            }
          ?>
  }, 
  submitHandler: function(form) {
      
    bootbox.confirm({
      title : "Confirmaci&oacute;n",
        message: "Estas seguro de Guardar la Evaluacion?, Una vez guardada no podras Modificarla!!",
        buttons: {
            cancel: {
                label: '<i class="fa fa-times"></i> No',
                className: 'btn-danger'
            },
            confirm: {
                label: '<i class="fa fa-check"></i> Si',
                className: 'btn-success'
            }
        },
        callback: function (result) {
            if(result){
              form.submit();
            }
        }
    });
      
  }, 
  invalidHandler: function(event, validator) {
      isalert("Debes seleccionar un nivel de dominio para cada uno de los indicadores conductuales, verifica las lineas en rojo!!!");
  }
  });
});

      //BAR CHART
  <?php if(count($result_evaluation) > 0){ ?>

      Highcharts.chart('container', {
          chart: {
              type: 'bar'
          },
          title: {
              text: 'Representacion de Competencias'
          },
          subtitle: {
              text: 'Competencias Base / Alcance'
          },
          xAxis: {
              categories: [
              <?php for($i = 0; $i < count($result_evaluation); $i++){ ?>
                <?php if(($i+1) == count($result_evaluation)){ ?>
                    '<?= $result_evaluation[$i]->competency ?>'
                <?php }else{ ?>
                    '<?= $result_evaluation[$i]->competency ?>',
                <?php } ?>
              <?php } ?>
              ],
              title: {
                  text: null
              }
          },
          yAxis: {
              min: 0,
              title: {
                  text: 'Ponderacion (%)',
                  align: 'high'
              },
              labels: {
                  overflow: 'justify'
              }
          },
          tooltip: {
              valueSuffix: '%'
          },
          plotOptions: {
              bar: {
                  dataLabels: {
                      enabled: true
                  }
              }
          },
          legend: {
              layout: 'vertical',
              align: 'right',
              verticalAlign: 'top',
              x: -40,
              y: 80,
              floating: true,
              borderWidth: 1,
              backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
              shadow: true
          },
          credits: {
              enabled: false
          },
          series: [{
              name: 'Tope',
              data: [
              <?php for($i = 0; $i < count($result_evaluation); $i++){ ?>
                  <?= $result_evaluation[$i]->topper ?>,
              <?php } ?>
              ]  
          }, {
              name: 'Alcance',
              data: [
              <?php for($i = 0; $i < count($result_evaluation); $i++){ ?>
                  <?= $result_evaluation[$i]->resultper ?>,
              <?php } ?>
              ]
          }, {
              name: 'Promedio',
              data: [
              <?php for($i = 0; $i < count($result_evaluation); $i++){ ?>
                  <?= $this->Instrumentofevaluation->getPromForCompetency($user_evaluator[0]->user_id, $result_evaluation[$i]->competency_id)->prom ?>,
              <?php } ?>
              ]
          }]
          
      });

  <?php } ?>

</script>
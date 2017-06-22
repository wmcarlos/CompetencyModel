<div class="content-wrapper">
  <div class="col">
      <section class="content">
        <div class="box">
          <div class="box-header with-border">
            <h1>Prom. de Competencias Grupal</h1>
          </div>
          <div class="box-body">
            <?php if(count($ressult_for_group) > 0){ ?>
               
            <div id="container" style="width: 100%; height: 400px; margin: 0 auto"></div>

            <?php }else{ ?>
            <br/>
                <div class="alert alert-danger">
                  <strong>Alerta!</strong> aun no existen datos para este Grafico!!!
                </div>
            <?php } ?>
            <a class="btn btn-info" href="<?= base_url() ?>index.php/Mains"><i class="fa fa-arrow-left" aria-hidden="true"></i> Volver</a>
          </div>
        </div>
      </section>
  </div>
</div>
<script type="text/javascript">
      //BAR CHART
  <?php if(count($ressult_for_group) > 0){ ?>

      Highcharts.chart('container', {
          chart: {
              type: 'bar'
          },
          title: {
              text: 'Representacion de Competencias (Promedio)'
          },
          subtitle: {
              text: 'Competencias Base / Alcance'
          },
          xAxis: {
              categories: [
              <?php for($i = 0; $i < count($ressult_for_group); $i++){ ?>
                <?php if(($i+1) == count($ressult_for_group)){ ?>
                    '<?= $ressult_for_group[$i]->competency ?>'
                <?php }else{ ?>
                    '<?= $ressult_for_group[$i]->competency ?>',
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
              <?php for($i = 0; $i < count($ressult_for_group); $i++){ ?>
                  <?= $ressult_for_group[$i]->topper ?>,
              <?php } ?>
              ]  
          }, {
              name: 'Alcance',
              data: [
              <?php for($i = 0; $i < count($ressult_for_group); $i++){ ?>
                  <?= $ressult_for_group[$i]->resultper ?>,
              <?php } ?>
              ]
          }]
          
      });

  <?php } ?>

</script>
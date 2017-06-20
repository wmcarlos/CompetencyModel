<div class="content-wrapper">
  <div class="col">

    <div class="col-md-6">
      <section class="content">
        <div class="box">
          <div class="box-header with-border">
            <h1>Mis Evaluaciones</h1>
          </div>
          <div class="box-body">
            <table class="datatable display responsive no-wrap" cellspacing="0" width="100%">
              <thead>
                <th>Evaluacion</th>
                <th>-</th>
              </thead>
              <tbody>
              <?php foreach($instruments AS $instrument){ ?>
                <tr>
                  <td><?= $instrument->instrumentdes ?></td>
                  <td><a href="<?= base_url() ?>index.php/Mains/view_evaluation/<?= $instrument->instrument_of_evaluation_id ?>/<?= $this->session->userdata('logged_in')->user_id ?>"><i class="fa fa-eye"></i></a></td>
                </tr>
              <?php } ?>
              </tbody>
            </table>
          </div>
        </div>
      </section>
    </div>

    <div class="col-md-6">
      <section class="content">
        <div class="box">
          <div class="box-header with-border">
            <h1>Evaluaciones de mis Subalternos</h1>
          </div>
          <div class="box-body">
            <table class="datatable display responsive no-wrap" cellspacing="0" width="100%">
              <thead>
                <th>Nombre</th>
                <th>Cargo</th>
                <th>Evaluacion</th>
                <th>-</th>
              </thead>
              <tbody>
              <?php foreach($other_evaluations AS $other_evaluation){ ?>
                <tr>
                  <td><?= $other_evaluation->user ?></td>
                  <td><?= $other_evaluation->charge ?></td>
                  <td><?= $other_evaluation->evaluation ?></td>
                  <td><a href="<?= base_url() ?>index.php/Mains/view_evaluation/<?= $other_evaluation->instrument_of_evaluation_id ?>/<?= $other_evaluation->user_id ?>/<?= $this->session->userdata("logged_in")->user_id ?>"><i class="fa fa-eye"></i></a></td>
                </tr>
              <?php } ?>
              </tbody>
            </table>
          </div>
        </div>
      </section>
    </div>
  </div>
</div>
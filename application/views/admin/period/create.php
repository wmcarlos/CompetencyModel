<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">
      <?= form_open_multipart("Periods/$action",array('autocomplete' => 'off')) ?>
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
        <label for="txtstartdate">Fecha Inicio:</label>
        <input type="text" class="form-control textuppercase" name="txtstartdate" id="txtstartdate">
      </div>
      <div class='form-group'>
        <label for="txtenddate">Fecha Final:</label>
        <input type="text" class="form-control textuppercase" name="txtenddate" id="txtenddate">
      </div>
     <h3>Intrumentos que se usaran en el Periodo</h3>
      <hr/>
      <table class="table table-bordered table-striped">
        <thead>
          <th>Instrumento de Evaluacion</th>
          <th>-</th>
        </thead>
        <tbody>
          <tr>
            <td>
              <select class="form-control textuppercase fr_select" id="txtinstrument_of_evaluation_id">
                <option value="">-</option>
                <?= $instruments_of_evaluations ?>
              </select>
            </td>
            <td><button class="btn btn-success fr_button_add" data-clean="txtinstrument_of_evaluation_id" type="button"><i class="fa fa-plus"></i></button></td>
          </tr>
        </tbody>

        <style type="text/css">
            .tr_padre{display: none;}
        </style>

        <tbody id="load_detail" class="fr_details">
          <tr class="tr_padre">
            <td>
              {{txtinstrument_of_evaluation_id}}
              <input type="hidden" name="txtinstrumentsofevaluation[]" value="{{txtinstrument_of_evaluation_id-value}}"> 
            </td>
            <td><button class="btn btn-danger fr_button_remove" type="button"><i class="fa fa-times"></i></button></td>
          </tr>
        </tbody>
      </table>

 			<button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar</button>
 			<a class="btn btn-danger" href="<?= base_url() ?>index.php/Periods"><i class="fa fa-times" aria-hidden="true"></i> Cancelar</a>
      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
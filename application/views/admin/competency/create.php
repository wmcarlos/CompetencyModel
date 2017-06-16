<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">
      <?= form_open_multipart("Competencies/$action",array('autocomplete' => 'off')) ?>

 			<div class='form-group'>
 				<label for="txtcompany_id">Company:</label>
 				<select class="form-control textuppercase" name="txtcompany_id" id="txtcompany_id">
            <option value="">Seleccione</option>
            <?= $companies ?>
        </select>
 			</div>
 			<div class='form-group'>
 				<label for="txtname">Name:</label>
        <input type="text" class="form-control textuppercase" name="txtname" id="txtname">
 			</div>
      <div class='form-group'>
        <label for="txtdefinition">Definition:</label>
        <textarea class="form-control textuppercase" name="txtdefinition" id="txtdefinition"></textarea>
      </div>
      <div class='form-group'>
        <label for="txtcharge_level_id">Charge Level:</label>
        <select class="form-control textuppercase" name="txtcharge_level_id" id="txtcharge_level_id">
            <option value="">Seleccione</option>
            <?= $chargelevels ?>
        </select>
      </div>
      <h3>Behavioral Indicator</h3>
      <hr/>
      <table class="table table-bordered table-striped">
        <thead>
          <th>Description</th>
          <th>Development Level</th>
          <th>Position</th>
          <th>-</th>
        </thead>
        <tbody>
          <tr>
            <td>
              <textarea class="form-control textuppercase" id="txtdescription"></textarea>
            </td>
            <td>
              <select class="form-control textuppercase" id="txtdevelopment_level">
                <option value="">-</option>
                <?= $developmentlevels ?>
              </select>
            </td>
            <td><input type="text" class="form-control" id="txtposition"/></td>
            <td><button class="btn btn-success" onclick="add();" type="button"><i class="fa fa-plus"></i></button></td>
          </tr>
        </tbody>
        <tbody id="load_detail" class="fr_detail_tansaction">
          <tr>
            <td>{{txtdescription}}</td>
          </tr>
        </tbody>
      </table>
 			<button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button>
 			<a class="btn btn-danger" href="<?= base_url() ?>index.php/Competencies"><i class="fa fa-times" aria-hidden="true"></i> Cancel</a>

      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>

<script type="text/javascript">


 function add(){

    var des = document.getElementById("txtdescription").value;
    var dvl = document.getElementById("txtdevelopment_level");
    var desdvl = dvl.options[dvl.selectedIndex].text;
    var desid = dvl.value;
    var pos = document.getElementById("txtposition").value;

    var cad = "";
        cad += '<tr>';
          cad +='<td><input type="hidden" name="txtdescriptions[]" value="'+des+'" />'+des.toUpperCase()+'</td>';
          cad +='<td><input type="hidden" name="txtdevelopementlevels[]" value="'+desid+'" />'+desdvl+'</td>';
          cad +='<td><input type="hidden" name="txtpositions[]" value="'+pos+'" />'+pos+'</td>';
          cad += '<td><button class="btn btn-danger" onclick="remov(this);" type="button"><i class="fa fa-times"></i></button></td>';
        cad += '</tr>';

        document.getElementById("load_detail").innerHTML += cad;

        document.getElementById("txtdescription").value = "";
        document.getElementById("txtdevelopment_level").value = "";
        document.getElementById("txtposition").value = "";
  }

  function remov(e){
      var td = e.parentNode;
      var tr = td.parentNode;
      var tbody = tr.parentNode;
      tbody.removeChild(tr);
  }
</script>
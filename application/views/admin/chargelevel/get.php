<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">

        <?php if( $this->session->flashdata('msj') ){ ?>
          <script type="text/javascript"> isalert('<?= $this->session->flashdata('msj') ?>'); </script>
        <?php } ?>

        <a href="<?= base_url() ?>index.php/Chargelevels/create" class="btn btn-success"><i class="fa fa-plus" aria-hidden="true"></i> New Charge Level</a>
        <br />
        <br />
        <table class="table table-bordered table-striped datatable">
          <thead>
            <th>ID</th>
            <th>Company</th>
            <th>Name</th>
            <th>Actions</th>
          </thead>
          <tbody>
            <?php foreach($items as $item){ ?>
              <tr>
                <td><?= $item->charge_level_id ?></td>
                <td><?= $item->company ?></td>
                <td><?= $item->name ?></td>
                <td>
                    <?php if($item->isactive == 'Y'){ ?>
                      <a href='<?= base_url() ?>index.php/Chargelevels/edit/<?= $item->charge_level_id ?>' class="btn btn-info"><i class='fa fa-pencil'></i> Edit</a>
                      <a href='#' onclick='isconfirm("Estas seguro de Desactivar este Nivel de Cargo?","<?= base_url() ?>/index.php/Chargelevels/inactive/<?= $item->charge_level_id ?>");' class="btn btn-danger"><i class='fa fa-times'></i> Inactive</a>
                    <?php }else{ ?>
                      <a href='#' onclick='isconfirm("Estas seguro de Activar este Nivel de Cargo?","<?= base_url() ?>index.php/Chargelevels/active/<?= $item->charge_level_id ?>");' class="btn btn-success"><i class="fa fa-check"></i> Active</a>
                    <?php } ?>
                </td>
              </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
    </div>
  </section>
</div>
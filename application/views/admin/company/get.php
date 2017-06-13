<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">

        <?php if(!empty($this->session->flashdata('msj'))){ ?>
          <script type="text/javascript"> isalert('<?= $this->session->flashdata('msj') ?>'); </script>
        <?php } ?>

        <a href="<?= base_url() ?>index.php/companies/create" class="btn btn-success"><i class="fa fa-plus" aria-hidden="true"></i> New Company</a>
        <br />
        <br />
        <table class="table table-bordered table-striped datatable">
          <thead>
            <th>id</th>
            <th>Value</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Actions</th>
          </thead>
          <tbody>
            <?php foreach($items as $item){ ?>
              <tr>
                <td><?= $item->company_id ?></td>
                <td><?= $item->value ?></td>
                <td><?= $item->name ?></td>
                <td><?= $item->phone ?></td>
                <td><?= $item->email ?></td>
                <td>
                    <?php if($item->isactive == 'Y'){ ?>
                      <a href='<?= base_url() ?>index.php/companies/edit/<?= $item->company_id ?>' class="btn btn-info"><i class='fa fa-pencil'></i> Edit</a>
                      <a href='#' onclick='isdisable(<?= $item->company_id ?>)' class="btn btn-danger"><i class='fa fa-times'></i> Inactive</a>
                    <?php }else{ ?>
                      <a href='#' onclick='isenable(<?= $item->company_id ?>)' class="btn btn-success"><i class="fa fa-check"></i> Active</a>
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
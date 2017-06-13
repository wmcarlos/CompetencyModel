<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">
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
          <tbody></tbody>
        </table>
      </div>
    </div>
  </section>
</div>
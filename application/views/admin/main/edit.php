<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?></h1>
      </div>
      <div class="box-body">
      <?= form_open_multipart("Mains/$action",array('autocomplete' => 'off')) ?>
      <div class='form-group'>
        <label for="txtcompany">Company:</label>
        <input type="text" class="form-control textuppercase" readonly="readonly" value="<?= $this->session->userdata('logged_in')->company ?>" id="txtcompany">
      </div>
      <div class='form-group'>
        <label for="txtname">Name:</label>
        <input type="text" class="form-control textuppercase" readonly="readonly" value="<?= $item[0]->name ?>" id="txtname">
      </div>
      <div class='form-group'>
        <label for="txtemail">Email:</label>
        <input type="text" class="form-control textuppercase" readonly="readonly" value="<?= $item[0]->email ?>" id="txtemail">
      </div>
      <div class='form-group'>
        <label for="txtrole">Role:</label>
        <input type="text" class="form-control textuppercase" readonly="readonly" value="<?= $this->session->userdata('logged_in')->role ?>" id="txtrole">
      </div>
      <button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Update Profile</button>
      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
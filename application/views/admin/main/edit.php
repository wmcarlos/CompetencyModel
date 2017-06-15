<div class="content-wrapper">
  <section class="content">
    <div class="box">
      <div class="box-header with-border">
        <h1><?= $title ?> (Only Change Password)</h1>
      </div>
      <div class="box-body">

      <?php if( $this->session->flashdata('msj') ){ ?>
        <script type="text/javascript"> isalert('<?= $this->session->flashdata('msj') ?>'); </script>
      <?php } ?>
        
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
      <div class='form-group'>
        <label for="txtcurrent_password">Current Password:</label>
        <input type="password" class="form-control textuppercase" id="txtcurrent_password" name="txtcurrent_password">
      </div>
      <div class='form-group'>
        <label for="txtnew_password">New Password:</label>
        <input type="password" class="form-control textuppercase" id="txtnew_password" name="txtnew_password">
      </div>
      <div class='form-group'>
        <label for="txtrepeat_new_password">Repeat New Password:</label>
        <input type="password" class="form-control textuppercase" id="txtrepeat_new_password" name="txtrepeat_new_password">
      </div>
      <button class="btn btn-success" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Update Profile</button>
      <a class="btn btn-danger" href="<?= base_url() ?>index.php/Mains"><i class="fa fa-times" aria-hidden="true"></i> Cancel</a>
      <?= form_close() ?>
      </div>
    </div>
  </section>
</div>
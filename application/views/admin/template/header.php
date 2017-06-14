<?php 
  if( count($this->session->userdata("logged_in")) <= 0 ){
      redirect("Login");
  }

  $name = $this->router->fetch_class();
  if($this->Service->getServicesForName($name)){
    redirect("Mains");
  }

?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Competency Model | <?= $title ?></title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="<?= base_url() ?>public/plugins/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="<?= base_url() ?>public/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="<?= base_url() ?>public/plugins/ionicons-2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="<?= base_url() ?>public/plugins/datatables/jquery.dataTables.min.css">
  <link rel="stylesheet" href="<?= base_url() ?>public/css/AdminLTE.min.css">
  <link rel="stylesheet" href="<?= base_url() ?>public/css/skins/_all-skins.min.css">
  <!-- jQuery 3.1.1-->
  <script src="<?= base_url() ?>public/plugins/jQuery/jquery-3.1.1.min.js"></script>
  <script src="<?= base_url() ?>public/plugins/bootstrap/js/bootstrap.min.js"></script>
  <script src="<?= base_url() ?>public/plugins/datatables/jquery.dataTables.min.js"></script>
  <script src="<?= base_url() ?>public/plugins/slimScroll/jquery.slimscroll.min.js"></script>
  <script src="<?= base_url() ?>public/plugins/fastclick/fastclick.js"></script>
  <script src="<?= base_url() ?>public/js/adminlte.min.js"></script>
  <script src="<?= base_url() ?>public/js/demo.js"></script>
  <script src="<?= base_url() ?>public/js/bootbox.min.js"></script>
  <script src="<?= base_url() ?>public/plugins/jQueryValidate/dist/jquery.validate.min.js"></script>
  <script src="<?= base_url() ?>public/plugins/jQueryValidate/dist/additional-methods.min.js"></script>
  <script src="<?= base_url() ?>public/js/global.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="#" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b><?= $this->session->userdata("logged_in")->short_name ?></b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b><?= $this->session->userdata("logged_in")->company ?></b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">10</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 10 notifications</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li>
                    <a href="#">
                      <i class="fa fa-users text-aqua"></i> 5 new members joined today
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">View all</a></li>
            </ul>
          </li>
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="<?= base_url() ?>public/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs"><?= $this->session->userdata('logged_in')->name ?></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="<?= base_url() ?>public/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  <?= $this->session->userdata('logged_in')->name ?>
                  <small><?= $this->session->userdata('logged_in')->company ." - ". $this->session->userdata('logged_in')->role ?></small>
                </p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="<?= base_url() ?>index.php/Login/close_session" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- =============================================== -->
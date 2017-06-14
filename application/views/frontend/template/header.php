<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Modelo de Competencia | <?= $title ?></title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="<?= base_url() ?>public/plugins/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="<?= base_url() ?>public/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="<?= base_url() ?>public/plugins/ionicons-2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="<?= base_url() ?>public/css/AdminLTE.min.css">
  <link rel="stylesheet" href="<?= base_url() ?>public/plugins/iCheck/square/blue.css">
  <!-- jQuery 3.1.1 -->
  <script src="<?= base_url() ?>public/plugins/jQuery/jquery-3.1.1.min.js"></script>
  <!-- Bootstrap 3.3.7 -->
  <script src="<?= base_url() ?>public/plugins/bootstrap/js/bootstrap.min.js"></script>
  <!-- iCheck -->
  <script src="<?= base_url() ?>public/plugins/iCheck/icheck.min.js"></script>
  <script src="<?= base_url() ?>public/js/bootbox.min.js"></script>
  <script src="<?= base_url() ?>public/js/global.js"></script>
  <script>
	  $(function () {
	    $('input').iCheck({
	      checkboxClass: 'icheckbox_square-blue',
	      radioClass: 'iradio_square-blue',
	      increaseArea: '20%' // optional
	    });
	  });
	  </script>
</head>
<body class="hold-transition login-page">
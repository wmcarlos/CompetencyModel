<aside class="main-sidebar">
    <section class="sidebar">
      <div class="user-panel">
        <div class="pull-left image">
          <img src="<?= base_url() ?>public/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><?= $this->session->userdata("logged_in")->name ?></p>
          <a href="#"><i class="fa fa-circle text-success"></i> En Linea</a>
        </div>
      </div>
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Buscar...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENU DE NAVEGACI&Oacute;N</li>
        <?php
          $services = $this->Service->getServicesForRole($this->session->userdata("logged_in")->role_id);
          foreach ($services AS $service) {
            print '<li>
                      <a href="'.base_url().'index.php/'.$service->url.'">
                          <i class="'.$service->icon_class.'"></i> <span>'.$service->name.'</span>
                      </a>
                   </li>';
          }
        ?>
      </ul>
    </section>
  </aside>
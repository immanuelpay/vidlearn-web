  <!-- Sidenav -->
  <nav class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white" id="sidenav-main">
      <div class="scrollbar-inner">
          <!-- Brand -->
          <div class="sidenav-header  align-items-center">
              <a class="navbar-brand" href="javascript:void(0)">
                  <img src="./assets/img/brand/blue.png" class="navbar-brand-img" alt="..." width="287" height="144">
              </a>
          </div>
          <div class="navbar-inner">
              <!-- Collapse -->
              <div class="collapse navbar-collapse" id="sidenav-collapse-main">
                  <!-- Nav items -->
                  <ul class="navbar-nav">
                      <?php $page = (isset($_GET['page']) ? $_GET['page'] : ''); ?>

                      <li class="nav-item">
                          <a class="nav-link <?= (($page == 'home') ? 'active' : '') ?>" href="index.php?page=home">
                              <i class="ni ni-tv-2 text-primary"></i>
                              <span class="nav-link-text">Dashboard</span>
                          </a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link <?= (($page == 'categories') ? 'active' : '') ?>"
                              href="index.php?page=categories">
                              <i class="ni ni-collection text-info"></i>
                              <span class="nav-link-text">Categories</span>
                          </a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link <?= (($page == 'tags') ? 'active' : '') ?>" href="index.php?page=tags">
                              <i class="ni ni-tag text-success"></i>
                              <span class="nav-link-text">Tags</span>
                          </a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link <?= (($page == 'playlist') ? 'active' : '') ?>"
                              href="index.php?page=playlist">
                              <i class="ni ni-bullet-list-67 text-warning"></i>
                              <span class="nav-link-text">PlayList</span>
                          </a>
                      </li>
              </div>
          </div>
      </div>
  </nav>
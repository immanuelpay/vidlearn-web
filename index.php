<?php
session_start();
include './config/koneksi.php';

if (!isset($_SESSION['login'])) {
  echo ("<script>location.href='$base_url/user/index.php';</script>");
}

if (isset($_GET['logout'])) {
  session_destroy();
  echo ("<script>location.href='$base_url/auth/index.php?page=login';</script>");
}

?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
    <meta name="author" content="Creative Tim">
    <title>VidLearn - Admin Panel</title>
    <!-- Favicon -->
    <link rel="icon" href="./assets/img/favicon.png" type="image/png">
    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
    <!-- Icons -->
    <link rel="stylesheet" href="./assets/vendor/nucleo/css/nucleo.css" type="text/css">
    <link rel="stylesheet" href="./assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
    <link rel="stylesheet" href="./assets/css/argon.css?v=1.2.0" type="text/css">
    <link rel="stylesheet" href="./assets/vendor/select2/dist/css/select2.min.css" type="text/css">
</head>

<body>
    <?php include './layouts/sidebar.php'; ?>
    <!-- Main content -->
    <div class="main-content" id="panel">
        <!-- Topnav -->
        <?php include './layouts/header.php'; ?>
        <!-- Header -->
        <?php
    $page = (isset($_GET['page']) ? $_GET['page'] : '');

    if ($page == 'home') {
      include './pages/home.php';
    } elseif ($page == 'categories') {
      include './pages/categories.php';
    } elseif ($page == 'tags') {
      include './pages/tags.php';
    } elseif ($page == 'playlist') {
      include './pages/playlist.php';
    } elseif ($page == 'videos') {
      include './pages/videos.php';
    } elseif ($page == 'profile') {
      include './pages/profile.php';
    } else {
      include './pages/home.php';
    }
    ?>
    </div>
    </div>
    <!-- Argon Scripts -->
    <!-- Core -->
    <script src="./assets/vendor/jquery/dist/jquery.min.js"></script>
    <script src="./assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./assets/vendor/select2/dist/js/select2.min.js"></script>
    <script src="./assets/vendor/js-cookie/js.cookie.js"></script>
    <script src="./assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
    <script src="./assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
    <script src="./assets/vendor/clipboard/dist/clipboard.min.js"></script>
    <script src="./assets/js/argon.js?v=1.2.0"></script>

    <script>
    $(document).ready(function() {
        $("#tags").select2({
            placeholder: "-- Pilih Tag --"
        });
    });
    </script>
</body>

</html>
<?php
session_start();
include '../config/koneksi.php';
?>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>VidLearn - Exercises with Video Learning </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon -->
    <link rel="icon" href="../assets/img/favicon.png" type="image/png">

    <!-- CSS here -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../assets/css/slicknav.css">

    <link rel="stylesheet" href="../assets/css/animate.min.css">
    <link rel="stylesheet" href="../assets/css/magnific-popup.css">
    <link rel="stylesheet" href="../assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="../assets/css/themify-icons.css">
    <link rel="stylesheet" href="../assets/css/slick.css">
    <link rel="stylesheet" href="../assets/css/nice-select.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/responsive.css">
    <style>
    .iframe-container {
        overflow: hidden;
        /* 16:9 aspect ratio */
        padding-top: 56.25%;
        position: relative;
    }

    .iframe-container iframe {
        border: 0;
        height: 100%;
        left: 0;
        position: absolute;
        top: 0;
        width: 100%;
    }
    </style>
</head>

<body>

    <?php
    include './layouts/preloader.php';
    include './layouts/header.php';
    ?>

    <!--================Blog Area =================-->
    <section class="blog_area section-padding pt-30">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">

                    <!--================ Page Dynamic =================-->
                    <?php
                    $halaman = isset($_GET['user']) ? $_GET['user'] : '';

                    if ($halaman == 'playlist') {
                        include './pages/playlist.php';
                    } elseif ($halaman == 'kategori') {
                        include './pages/category.php';
                    } elseif ($halaman == 'tag') {
                        include './pages/tag.php';
                    } elseif ($halaman == 'cari') {
                        include './pages/cari.php';
                    } else {
                        include './pages/home.php';
                    }
                    ?>

                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">

                        <?php include './layouts/sidebar.php'; ?>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->

    <?php include './layouts/footer.php'; ?>

    <!-- JS here -->
    <script src="../assets/js/vendor/modernizr-3.5.0.min.js"></script>

    <script src="../assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="../assets/js/popper.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>

    <script src="../assets/js/jquery.slicknav.min.js"></script>

    <script src="../assets/js/owl.carousel.min.js"></script>
    <script src="../assets/js/slick.min.js"></script>

    <script src="./assets/js/gijgo.min.js"></script>

    <script src="../assets/js/wow.min.js"></script>
    <script src="../assets/js/animated.headline.js"></script>
    <script src="../assets/js/jquery.magnific-popup.js"></script>

    <script src="../assets/js/jquery.scrollUp.min.js"></script>
    <script src="../assets/js/jquery.nice-select.min.js"></script>
    <script src="../assets/js/jquery.sticky.js"></script>

    <script src="../assets/js/contact.js"></script>
    <script src="../assets/js/jquery.form.js"></script>
    <script src="../assets/js/jquery.validate.min.js"></script>
    <script src="../assets/js/mail-script.js"></script>
    <script src="../assets/js/jquery.ajaxchimp.min.js"></script>

    <script src="../assets/js/plugins.js"></script>
    <script src="../assets/js/main.js"></script>

</body>

</html>
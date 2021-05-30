<?php
$count_kategori_aktif = mysqli_query($koneksi, "SELECT COUNT(*) AS total FROM categories WHERE status=1");
$count_kategori_nonaktif = mysqli_query($koneksi, "SELECT COUNT(*) AS total FROM categories WHERE status=0");
$count_tag_aktif = mysqli_query($koneksi, "SELECT COUNT(*) AS total FROM tags WHERE status=1");
$count_tag_nonaktif = mysqli_query($koneksi, "SELECT COUNT(*) AS total FROM tags WHERE status=0");
$count_playlist_aktif = mysqli_query($koneksi, "SELECT COUNT(*) AS total FROM playlists WHERE status=1");
$count_playlist_nonaktif = mysqli_query($koneksi, "SELECT COUNT(*) AS total FROM playlists WHERE status=0");
$count_video_aktif = mysqli_query($koneksi, "SELECT COUNT(*) AS total FROM videos WHERE status=1");
$count_video_nonaktif = mysqli_query($koneksi, "SELECT COUNT(*) AS total FROM videos WHERE status=0");

$kategori_aktif = mysqli_fetch_array($count_kategori_aktif);
$kategori_nonaktif = mysqli_fetch_array($count_kategori_nonaktif);
$tag_aktif = mysqli_fetch_array($count_tag_aktif);
$tag_nonaktif = mysqli_fetch_array($count_tag_nonaktif);
$playlist_aktif = mysqli_fetch_array($count_playlist_aktif);
$playlist_nonaktif = mysqli_fetch_array($count_playlist_nonaktif);
$video_aktif = mysqli_fetch_array($count_video_aktif);
$video_nonaktif = mysqli_fetch_array($count_video_nonaktif);

?>
<!-- Header -->
<div class="header bg-primary pb-6">
    <div class="container-fluid">
        <div class="header-body">
            <div class="row align-items-center py-4">
                <div class="col-lg-6 col-7">
                    <h6 class="h2 text-white d-inline-block mb-0">Dashboards</h6>
                    <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                        <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                            <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Dashboards</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
            <!-- Card stats -->
            <div class="row">
                <div class="col-xl-3 col-md-6">
                    <div class="card card-stats">
                        <!-- Card body -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <h5 class="card-title text-uppercase text-muted mb-0">Total Kategori aktif</h5>
                                    <span class="h2 font-weight-bold mb-0"><?= $kategori_aktif['total'] ?></span>
                                </div>
                                <div class="col-auto">
                                    <div class="icon icon-shape bg-gradient-info text-white rounded-circle shadow">
                                        <i class="ni ni-collection"></i>
                                    </div>
                                </div>
                            </div>
                            <p class="mt-3 mb-0 text-sm">
                                <span class="text-danger mr-2"><i class="fa fa-arrow-down"></i>
                                    <?= $kategori_nonaktif['total'] ?></span>
                                <span class="text-nowrap">Total Kategori tidak aktif</span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card card-stats">
                        <!-- Card body -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <h5 class="card-title text-uppercase text-muted mb-0">Total Tag &nbsp;&nbsp; aktif
                                    </h5>
                                    <span class="h2 font-weight-bold mb-0"><?= $tag_aktif['total'] ?></span>
                                </div>
                                <div class="col-auto">
                                    <div class="icon icon-shape bg-gradient-success text-white rounded-circle shadow">
                                        <i class="ni ni-tag"></i>
                                    </div>
                                </div>
                            </div>
                            <p class="mt-3 mb-0 text-sm">
                                <span class="text-danger mr-2"><i class="fa fa-arrow-down"></i>
                                    <?= $tag_nonaktif['total'] ?></span>
                                <span class="text-nowrap">Total Tag tidak aktif</span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card card-stats">
                        <!-- Card body -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <h5 class="card-title text-uppercase text-muted mb-0">Total Playlist aktif</h5>
                                    <span class="h2 font-weight-bold mb-0"><?= $playlist_aktif['total'] ?></span>
                                </div>
                                <div class="col-auto">
                                    <div class="icon icon-shape bg-gradient-warning text-white rounded-circle shadow">
                                        <i class="ni ni-bullet-list-67"></i>
                                    </div>
                                </div>
                            </div>
                            <p class="mt-3 mb-0 text-sm">
                                <span class="text-danger mr-2"><i class="fa fa-arrow-down"></i>
                                    <?= $playlist_nonaktif['total'] ?></span>
                                <span class="text-nowrap">Total Playlist tidak aktif</span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card card-stats">
                        <!-- Card body -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <h5 class="card-title text-uppercase text-muted mb-0">Total Video aktif </h5>
                                    <span class="h2 font-weight-bold mb-0"><?= $video_aktif['total'] ?></span>
                                </div>
                                <div class="col-auto">
                                    <div class="icon icon-shape bg-gradient-danger text-white rounded-circle shadow">
                                        <i class="ni ni-button-play"></i>
                                    </div>
                                </div>
                            </div>
                            <p class="mt-3 mb-0 text-sm">
                                <span class="text-danger mr-2"><i class="fa fa-arrow-down"></i>
                                    <?= $video_nonaktif['total'] ?></span>
                                <span class="text-nowrap">Total Video tidak aktif</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Page content -->
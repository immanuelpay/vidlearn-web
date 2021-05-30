<?php
if (isset($_GET['detail-playlist'])) {
    $id = $_GET['id'];
    $playlist_query = mysqli_query($koneksi, "SELECT * FROM playlists WHERE status=1 AND id=$id");
    $playlist = mysqli_fetch_array($playlist_query);

    $playlist_tags_query = mysqli_query($koneksi, "SELECT tags.id, tags.nama FROM playlist_tags, tags tags WHERE playlist_tags.id_playlist=$id AND playlist_tags.id_tag=tags.id");

    $id_category = $playlist['id_category'];
    $kategori_query = mysqli_query($koneksi, "SELECT categories.id, categories.nama FROM categories, playlists WHERE categories.id=$id_category");
    $kategori = mysqli_fetch_array($kategori_query);

    $id_user = $playlist['id_user'];
    $user_query = mysqli_query($koneksi, "SELECT * FROM users WHERE status=1 AND id=$id_user");
    $user = mysqli_fetch_array($user_query);

    $user_detail_query = mysqli_query($koneksi, "SELECT * FROM user_detail WHERE id_user=$id_user");
    $user_detail = mysqli_fetch_array($user_detail_query);

    $waktu = strtotime($playlist['created_at']);

    $video_query = mysqli_query($koneksi, "SELECT * FROM videos WHERE status=1 AND id_playlist=$id");

    if (isset($_GET['video'])) {
        $id_video = $_GET['video'];
        $video_show_query = mysqli_query($koneksi, "SELECT * FROM videos WHERE status=1 AND id=$id_video");
        $video_show = mysqli_fetch_array($video_show_query);

        $popular_query = mysqli_query($koneksi, "SELECT * FROM popular WHERE id_playlist=$id");
        $popular = mysqli_fetch_array($popular_query);
        $cek = mysqli_num_rows($popular_query);

        if ($cek < 1) {
            mysqli_query($koneksi, "INSERT INTO popular (id, id_playlist, count) VALUES('', $id, 1)");
        } else {
            $count = (int)$popular['count'] + 1;
            mysqli_query($koneksi, "UPDATE popular SET count=$count WHERE id_playlist=$id");
        }
    }
}
?>
<div class="row d-flex justify-content-between">
    <div class="col-lg-12 col-md-12">
        <div class="section-tittle mb-30">
            <h3><a href="index.php">Daftar Playlist</a> <i class="fa fa-fw fa-angle-double-right"></i> Playlist
                <?= $playlist['nama'] ?></h3>
        </div>
    </div>
</div>
<div class="col-lg-12 posts-list">
    <div class="single-post">
        <div class="feature-img pb-30">
            <?php if (isset($_GET['video'])) { ?>
            <div class="iframe-container">
                <iframe src="<?= $video_show['link_video'] ?>&autoplay=1" frameborder="0"
                    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen
                    width="750" height="375"></iframe>
            </div>
            <?php } else { ?>
            <img class="img-fluid" src="../images/thumbnail/<?= $playlist['thumbnail'] ?>" alt="" width="750"
                height="375">
            <?php } ?>
        </div>
        <div class="blog_details pt-0">
            <h2><?= $playlist['nama'] ?> <?= (isset($_GET['video'])) ? '- ' . $video_show['nama'] : '' ?></h2>
            <ul class="blog-info-link mt-3 mb-4">
                <li><a href="#"><i class="fa fa-user"></i> <?= $user['nama'] ?></a></li>
                <li><a href="#"><i class="fa fa-calendar"></i> <?= date("l, d F Y  h:i:s A", $waktu) ?></a></li>
                <li><a href="index.php?user=kategori&kategori=<?= $kategori['id'] ?>">Kategori
                        <?= ucwords(strtolower($kategori['nama'])) ?></a></li>
            </ul>
            <p class="excert text-justify">
                <?= (isset($_GET['video'])) ? $video_show['deskripsi'] : $playlist['deskripsi'] ?></p>

            <div class="col-md-12 mt-sm-30">
                <h5 class="mb-30">Daftar Video</h5>
                <div class="row">
                    <div class="col-lg-12">
                        <?php while ($video = mysqli_fetch_array($video_query)) { ?>
                        <blockquote class="generic-blockquote">
                            <a
                                href="index.php?user=playlist&id=<?= $playlist['id'] ?>&video=<?= $video['id'] ?>&detail-playlist">
                                <?= $video['nama'] ?>
                            </a>
                        </blockquote>
                        <?php } ?>
                    </div>
                </div>
            </div>

            <p class="mt-3">
                Tag :
                <?php while ($playlist_tags = mysqli_fetch_array($playlist_tags_query)) {
                    $nama = '#' . preg_replace('/[^a-z0-9]+/i', '_', trim(strtolower($playlist_tags['nama'])))
                ?>
                <a href="index.php?user=tag&tag=<?= $playlist_tags['id'] ?>"><?= $nama ?></a>
                <?php } ?>
            </p>

            <hr>

            <div class="blog-author">
                <div class="media align-items-center">
                    <img src="../images/avatar/<?= $user['profile'] ?>" class="rounded-circle" alt="" width="100"
                        height="100">
                    <div class="media-body ml-3">
                        <a href="#">
                            <h4><?= $user['nama'] ?></h4>
                        </a>
                        <p><?= $user_detail['deskripsi'] ?></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
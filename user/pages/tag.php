<?php
if (isset($_GET['tag'])) {
    $id_tag = $_GET['tag'];
    $tag_query = mysqli_query($koneksi, "SELECT * FROM tags WHERE status=1 AND id=$id_tag");
    $tag = mysqli_fetch_array($tag_query);

    $batas = 5;
    $halaman = isset($_GET['halaman']) ? (int)$_GET['halaman'] : 1;
    $halaman_awal = ($halaman > 1) ? ($halaman * $batas) - $batas : 0;

    $previous = $halaman - 1;
    $next = $halaman + 1;

    $data = mysqli_query($koneksi, "SELECT playlists.id, playlists.id_user, playlists.id_category, playlists.nama, playlists.thumbnail, playlists.deskripsi, playlists.created_at FROM playlist_tags, playlists WHERE status=1 AND playlist_tags.id_tag=$id_tag AND playlist_tags.id_playlist=playlists.id");
    $jumlah_data = mysqli_num_rows($data);
    $total_halaman = ceil($jumlah_data / $batas);

    $playlist_query = mysqli_query($koneksi, "SELECT playlists.id, playlists.id_user, playlists.id_category, playlists.nama, playlists.status, playlists.thumbnail, playlists.deskripsi, playlists.created_at FROM playlist_tags, playlists WHERE playlists.status=1 AND playlist_tags.id_tag=$id_tag AND playlist_tags.id_playlist=playlists.id LIMIT $halaman_awal, $batas");
}
?>

<div class="row d-flex justify-content-between">
    <div class="col-lg-12 col-md-12">
        <div class="section-tittle mb-30">
            <h3><a href="index.php">Daftar Playlist</a> <i class="fa fa-fw fa-angle-double-right"></i> Tag
                <?= $tag['nama'] ?></h3>
        </div>
    </div>
</div>
<div class="blog_left_sidebar">
    <?= ($jumlah_data < 1) ? '<article class="blog_item text-center"><p><i>Playlist tidak ditemukan.</i></p></article>' : ''; ?>
    <?php while ($playlist = mysqli_fetch_array($playlist_query)) {
        $id_user = $playlist['id_user'];
        $user_query = mysqli_query($koneksi, "SELECT * FROM users WHERE id=$id_user");
        $user = mysqli_fetch_array($user_query);
        $waktu = strtotime($playlist['created_at']);
    ?>
    <article class="blog_item">
        <div class="blog_item_img">
            <img class="card-img rounded-0" src="../images/thumbnail/<?= $playlist['thumbnail'] ?>" alt="" width="750"
                height="375">
            <a href="#" class="blog_item_date">
                <h3 class="text-center"><?= date("d", $waktu) ?></h3>
                <p class="text-center"><?= date("F", $waktu) ?></p>
                <h5 class="text-center text-white"><?= date("Y", $waktu) ?></h5>
            </a>
        </div>

        <div class="blog_details">
            <a class="d-inline-block" href="index.php?user=playlist&id=<?= $playlist['id'] ?>&detail-playlist">
                <h2><?= $playlist['nama'] ?></h2>
            </a>
            <p><?= substr($playlist['deskripsi'], 0, 250) ?>.....</p>
            <ul class="blog-info-link mt-4">
                <li><a href="#"><i class="fa fa-user"></i> <?= $user['nama'] ?></a></li>
                <li><a href="#"><i class="fa fa-calendar"></i> <?= date("l, d F Y  h:i:s A", $waktu) ?></a></li>
            </ul>
        </div>
    </article>
    <?php } ?>

    <nav class="blog-pagination justify-content-center d-flex">
        <ul class="pagination">
            <li class="page-item">
                <a href="index.php?user=tag&tag=<?= $id_tag ?><?= ($halaman > 1) ? '&halaman=' . $previous : '' ?>"
                    class="page-link" aria-label="Previous">
                    <i class="ti-angle-left"></i>
                </a>
            </li>
            <?php for ($x = 1; $x <= $total_halaman; $x++) { ?>
            <li class="page-item">
                <a href="index.php?user=tag&tag=<?= $id_tag ?>&halaman=<?= $x ?>" class="page-link"><?= $x ?></a>
            </li>
            <?php } ?>

            <li class="page-item">
                <a href="index.php?user=tag&tag=<?= $id_tag ?><?= ($halaman > 1) ? '&halaman=' . $next : '' ?>"
                    class="page-link" aria-label="Next">
                    <i class="ti-angle-right"></i>
                </a>
            </li>
        </ul>
    </nav>
</div>
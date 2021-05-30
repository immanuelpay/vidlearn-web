<?php
$kategori_query = mysqli_query($koneksi, "SELECT * FROM categories WHERE status=1 ORDER BY nama ASC");
$tag_query = mysqli_query($koneksi, "SELECT * FROM tags WHERE status=1 ORDER BY nama ASC");
$popular_playlist_query = mysqli_query($koneksi, "SELECT playlists.id, playlists.id_user, playlists.nama, playlists.thumbnail, playlists.created_at FROM popular, playlists WHERE popular.id_playlist=playlists.id AND playlists.status=1 ORDER BY popular.count DESC LIMIT 4");
?>

<aside class="single_sidebar_widget search_widget">
    <form action="index.php?user=cari" method="POST">
        <div class="form-group">
            <div class="input-group mb-3">
                <input type="text" name="cari" class="form-control" placeholder='Cari Playlist'
                    onfocus="this.placeholder = ''" onblur="this.placeholder = 'Cari Playlist'">
                <div class="input-group-append">
                    <button class="btns" type="submit"><i class="ti-search"></i></button>
                </div>
            </div>
        </div>
    </form>
</aside>

<aside class="single_sidebar_widget post_category_widget">
    <h4 class="widget_title">Kategori</h4>
    <ul class="list cat-list">

        <?php
        while ($kategori = mysqli_fetch_array($kategori_query)) {
            $id = $kategori['id'];
            $hitung_query = mysqli_query($koneksi, "SELECT COUNT(*) AS total FROM playlists WHERE id_category=$id");
            $hitung = mysqli_fetch_array($hitung_query);
        ?>
        <li>
            <a href="index.php?user=kategori&kategori=<?= $kategori['id'] ?>" class="d-flex">
                <p><?= $kategori['nama'] ?></p>
                <p>(<?= $hitung['total'] ?>)</p>
            </a>
        </li>
        <?php } ?>
    </ul>
</aside>

<aside class="single_sidebar_widget popular_post_widget">
    <h3 class="widget_title">Playlist Populer</h3>
    <?php
    while ($popular_playlist = mysqli_fetch_array($popular_playlist_query)) {
        $id_user = $popular_playlist['id_user'];
        $user_query = mysqli_query($koneksi, "SELECT * FROM users WHERE id=$id_user");
        $user = mysqli_fetch_array($user_query);
        $waktu = strtotime($popular_playlist['created_at']);
    ?>
    <div class="media post_item">
        <img src="../images/thumbnail/<?= $popular_playlist['thumbnail'] ?>" alt="post" width="80" height="80">
        <div class="media-body">
            <a href="index.php?user=playlist&id=<?= $popular_playlist['id'] ?>&detail-playlist">
                <h3><?= $popular_playlist['nama'] ?></h3>
            </a>
            <p><i class="fa fa-user"></i> <?= $user['nama'] ?></p>
            <p><i class="fa fa-calendar"></i> <?= date("l, d F Y", $waktu) ?></p>
        </div>
    </div>
    <?php } ?>
</aside>

<aside class="single_sidebar_widget tag_cloud_widget">
    <h4 class="widget_title">Tags</h4>
    <ul class="list">
        <?php
        while ($tag = mysqli_fetch_array($tag_query)) {
            $id = $tag['id'];
            $hitung_query = mysqli_query($koneksi, "SELECT COUNT(*) AS total FROM playlist_tags WHERE id_tag=$id");
            $hitung = mysqli_fetch_array($hitung_query);
        ?>
        <li>
            <a href="index.php?user=tag&tag=<?= $tag['id'] ?>"><?= $tag['nama'] ?> (<?= $hitung['total'] ?>)</a>
        </li>
        <?php } ?>
    </ul>
</aside>

<aside class="single_sidebar_widget tag_cloud_widget">
    <ul class="list cat-list">
        <li><a href="https://github.com/immanuelpay24/vidlearn-api">API Documentation version 1.0</a></li>
    </ul>
</aside>
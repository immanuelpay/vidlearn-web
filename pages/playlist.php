<?php

$batas = 10;
$halaman = isset($_GET['hal']) ? (int)$_GET['hal'] : 1;
$halaman_awal = ($halaman > 1) ? ($halaman * $batas) - $batas : 0;

$i = $halaman_awal + 1;
$previous = $halaman - 1;
$next = $halaman + 1;

$data = mysqli_query($koneksi, "SELECT * FROM playlists");
$jumlah_data = mysqli_num_rows($data);
$total_halaman = ceil($jumlah_data / $batas);

$data = mysqli_query($koneksi, "SELECT * FROM playlists ORDER BY created_at DESC LIMIT $halaman_awal, $batas");

if (isset($_POST['tambah'])) {
    $nama = $_POST['nama'];
    $id_user = $_SESSION['id'];
    $id_kategori = $_POST['kategori'];
    $status = $_POST['status'];
    $deskripsi = $_POST['deskripsi'];
    $tags = $_POST['tags'];

    if ($_FILES['thumbnail']['name'] != '') {
        $thumbnail_name = $_FILES['thumbnail']['name'];
        $thumbnail_temp = $_FILES['thumbnail']['tmp_name'];
        $thumbnail_slug = preg_replace('/[^a-z0-9]+/i', '-', trim(strtolower($nama)));

        $ext = pathinfo($thumbnail_name, PATHINFO_EXTENSION);
        $thumbnail = $thumbnail_slug . '-' . time() . '.' . $ext;
        move_uploaded_file($thumbnail_temp, './images/thumbnail/' . $thumbnail);
    }

    mysqli_query($koneksi, "INSERT INTO playlists (id, id_user, id_category, nama, thumbnail, status, deskripsi) VALUES('', $id_user, $id_kategori, '$nama', '$thumbnail', '$status', '$deskripsi')");

    $id_playlist = mysqli_insert_id($koneksi);
    for ($i = 0; $i < count($tags); $i++) {
        mysqli_query($koneksi, "INSERT INTO playlist_tags (id, id_playlist, id_tag) VALUES('', $id_playlist, $tags[$i])");
    }

    $_SESSION['success'] = '<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Sukses ditambahkan!</strong> Tag ' . $nama . ' berhasil ditambahkan.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>';

    echo ("<script>location.href='$base_url/index.php?page=playlist';</script>");
}

if (isset($_GET['hapus'])) {
    $id = $_GET['id'];
    $querylist = mysqli_query($koneksi, "SELECT * FROM playlists WHERE id=$id");
    $playlist = mysqli_fetch_array($querylist);

    $thumbnail = $playlist['thumbnail'];
    unlink('images/thumbnail/' .  $thumbnail);

    mysqli_query($koneksi, "DELETE FROM playlist_tags WHERE id_playlist=$id");
    mysqli_query($koneksi, "DELETE FROM playlists WHERE id=$id");

    $_SESSION['success'] = '<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Sukses dihapus!</strong> Tag ' . $id . ' berhasil dihapus.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>';

    echo ("<script>location.href='$base_url/index.php?page=playlist';</script>");
}

if (isset($_GET['edit'])) {
    $id = $_GET['id'];
    $querylist = mysqli_query($koneksi, "SELECT * FROM playlists WHERE id=$id");
    $playlist = mysqli_fetch_array($querylist);
}

if (isset($_POST['edit'])) {
    $id = $_POST['id'];
    $nama = $_POST['nama'];
    $id_kategori = $_POST['kategori'];
    $status = $_POST['status'];
    $deskripsi = $_POST['deskripsi'];

    $querylist = mysqli_query($koneksi, "SELECT * FROM playlists WHERE id=$id");
    $playlist = mysqli_fetch_array($querylist);

    $thumbnail = $playlist['thumbnail'];

    if ($_FILES['thumbnail']['name'] != '') {
        $thumbnail_name = $_FILES['thumbnail']['name'];
        $thumbnail_temp = $_FILES['thumbnail']['tmp_name'];
        $thumbnail_slug = preg_replace('/[^a-z0-9]+/i', '-', trim(strtolower($nama)));
        $ext = pathinfo($thumbnail_name, PATHINFO_EXTENSION);

        unlink('images/thumbnail/' .  $thumbnail);
        $thumbnail = $thumbnail_slug . '-' . time() . '.' . $ext;
        move_uploaded_file($thumbnail_temp, './images/thumbnail/' . $thumbnail);
    }

    mysqli_query($koneksi, "UPDATE playlists SET id_category=$id_kategori, nama='$nama', thumbnail='$thumbnail' ,status='$status', deskripsi='$deskripsi' WHERE id=$id");

    $_SESSION['success'] = '<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Sukses diubah!</strong> Tag ' . $id . ' berhasil diubah.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>';

    echo ("<script>location.href='$base_url/index.php?page=playlist';</script>");
}


?>

<div class="header bg-primary pb-6">
    <div class="container-fluid">
        <div class="header-body">
            <div class="row align-items-center py-4">
                <div class="col-lg-6 col-7">
                    <h6 class="h2 text-white d-inline-block mb-0">PlayList</h6>
                    <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                        <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                            <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Daftar PlayList</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid mt--6">
    <div class="card">
        <!-- Card header -->
        <div class="card-header border-0">
            <h3 class="mb-0">Daftar PlayList</h3>
        </div>
        <!-- Light table -->

        <div class="card-body row">
            <div class="col-4">
                <form method="POST" enctype="multipart/form-data">

                    <?php
                    if (isset($_GET['edit'])) {
                    ?>
                    <input type="hidden" name="id" value="<?= $playlist['id'] ?>">
                    <?php } ?>

                    <div class="form-group">
                        <label class="form-control-label">Nama Playlist</label>
                        <input class="form-control" placeholder="Nama playlist" type="text" name="nama"
                            value="<?= isset($_GET['edit']) ? $playlist['nama'] : '' ?>" required>
                    </div>

                    <div class="form-group">
                        <label class="form-control-label">Kategori</label>
                        <select class="form-control" name="kategori">
                            <option value="">-- Pilih Kategori --</option>
                            <?php
                            $data_kategori = mysqli_query($koneksi, "SELECT * FROM categories WHERE status=1 ORDER BY nama ASC");
                            while ($kategori = mysqli_fetch_array($data_kategori)) {
                            ?>
                            <option value="<?= $kategori['id'] ?>"
                                <?= (isset($_GET['edit']) && $playlist['id_category'] == $kategori['id']) ? 'selected' : '' ?>>
                                <?= $kategori['nama'] ?></option>
                            <?php } ?>
                        </select>
                    </div>

                    <?php
                    if (!isset($_GET['edit'])) {
                    ?>

                    <div class="form-group">
                        <label class="form-control-label">Tags</label>
                        <select class="form-control" name="tags[]" multiple="multiple" id="tags">
                            <?php
                                $data_tag = mysqli_query($koneksi, "SELECT * FROM tags WHERE status=1 ORDER BY nama ASC");
                                while ($tag = mysqli_fetch_array($data_tag)) {
                                ?>
                            <option
                                value="<?= $tag['id'] ?> <?= (isset($_GET['edit']) && $tags['id_tag'] == $tag['id']) ? 'selected' : '' ?>">
                                <?= $tag['nama'] ?></option>
                            <?php } ?>
                        </select>
                    </div>

                    <?php } ?>

                    <div class="form-group">
                        <label class="form-control-label">Deskripsi</label>
                        <textarea rows="4" name="deskripsi" class="form-control"
                            placeholder="Deskripsi"><?= isset($_GET['edit']) ? $playlist['deskripsi'] : '' ?></textarea>
                    </div>

                    <div class="form-group">
                        <label class="form-control-label">Thumbnail</label>
                        <input class="form-control" type="file" name="thumbnail">

                        <?php
                        if (isset($_GET['edit'])) {
                            echo '<small><i>Kosongkan jika tidak ingin mengupload gambar.</i></small>';
                        }
                        ?>

                    </div>

                    <div class="form-group">
                        <label class="form-control-label">Status </label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="status" id="active" value="1"
                                <?= (isset($_GET['edit']) && $playlist['status'] == 1) ? 'checked' : 'checked' ?>>
                            <label class="form-check-label" for="active">
                                Active
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="status" id="inactive" value="0"
                                <?= (isset($_GET['edit']) && $playlist['status'] == 0) ? 'checked' : '' ?>>
                            <label class="form-check-label" for="inactive">
                                Inactive
                            </label>
                        </div>
                    </div>
                    <button type="submit" name="<?= isset($_GET['edit']) ? 'edit' : 'tambah' ?>"
                        class="btn btn-info ml-2 float-right"><?= isset($_GET['edit']) ? 'Edit' : 'Tambah' ?></button>
                    <a href="index.php?page=playlist" class="btn btn-default ml-2 float-right">Refresh</a>
                </form>
            </div>

            <div class="col-8">
                <table class="table table-responsive align-items-center table-flush">
                    <thead class="thead-light">
                        <tr>
                            <th>#</th>
                            <th>PlayList</th>
                            <th>Status</th>
                            <th class="text-center">Aksi</th>
                        </tr>
                    </thead>
                    <tbody class="list">

                        <?php
                        if (mysqli_num_rows($data) < 1) {
                            echo '<tr><td><i>Data is empty...</i></td></tr>';
                        } else {

                            while ($playlist = mysqli_fetch_array($data)) {
                        ?>
                        <tr>
                            <td scope="row"><?= $i++ ?></td>
                            <td><?= $playlist['nama'] ?></td>
                            <td><?= ($playlist['status'] == '1' ? '<span class="badge badge-success">ACTIVE</span>' : '<span class="badge badge-danger">INACTIVE</span>') ?></label>
                            </td>
                            <td class="text-center">
                                <a href="index.php?page=videos&playlist=<?= $playlist['id'] ?>"
                                    class="btn btn-sm btn-rounded btn-success"><i class="fa fa-fw fa-play"></i>
                                    Videos</a>
                                <a href="index.php?page=playlist&id=<?= $playlist['id'] ?>&edit"
                                    class="btn btn-sm btn-rounded btn-info"><i class="fa fa-fw fa-edit"></i> Edit</a>
                                <a href="index.php?page=playlist&id=<?= $playlist['id'] ?>&hapus"
                                    class="btn btn-sm btn-rounded btn-danger"><i class="fa fa-fw fa-trash"></i>
                                    Hapus</a>
                            </td>
                        </tr>
                        <?php }
                        } ?>

                        </body>
                </table>
            </div>
        </div>

        <!-- Card footer -->
        <div class="card-footer py-4">
            <nav aria-label="...">
                <ul class="pagination justify-content-end mb-0">
                    <li class="page-item">
                        <a class="page-link"
                            href="index.php?page=playlist<?= ($halaman > 1) ? '&hal=' . $previous : '' ?>"
                            tabindex="-1">
                            <i class="fas fa-angle-left"></i>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>

                    <?php for ($x = 1; $x <= $total_halaman; $x++) { ?>
                    <li class="page-item <?= ($halaman == $x) ? 'active' : '' ?>">
                        <a class="page-link" href="index.php?page=playlist&hal=<?= $x ?>"><?= $x ?></a>
                    </li>
                    <?php } ?>

                    <li class="page-item">
                        <a class="page-link" href="index.php?page=playlist<?= ($halaman > 1) ? '&hal=' . $next : '' ?>">
                            <i class="fas fa-angle-right"></i>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
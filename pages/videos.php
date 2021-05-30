<?php

$id_playlist = $_GET['playlist'];
$query_playlist = mysqli_query($koneksi, "SELECT * FROM playlists WHERE id=$id_playlist");
$playlist = mysqli_fetch_array($query_playlist);

$batas = 10;
$halaman = isset($_GET['hal']) ? (int)$_GET['hal'] : 1;
$halaman_awal = ($halaman > 1) ? ($halaman * $batas) - $batas : 0;

$i = $halaman_awal + 1;
$previous = $halaman - 1;
$next = $halaman + 1;

$data = mysqli_query($koneksi, "SELECT * FROM videos WHERE id_playlist=$id_playlist");
$jumlah_data = mysqli_num_rows($data);
$total_halaman = ceil($jumlah_data / $batas);

$data = mysqli_query($koneksi, "SELECT * FROM videos WHERE id_playlist=$id_playlist ORDER BY created_at ASC LIMIT $halaman_awal, $batas");

if (isset($_POST['tambah'])) {
    $nama = $_POST['nama'];
    $link_video = $_POST['link_video'];
    $deskripsi = mysqli_real_escape_string($koneksi, $_POST['deskripsi']);
    $status = $_POST['status'];

    $query = mysqli_query($koneksi, "INSERT INTO videos (id, id_playlist, nama, link_video, deskripsi, status) VALUES('', '$id_playlist', '$nama', '$link_video', '$deskripsi', '$status')");

    $_SESSION['success'] = '<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Sukses ditambahkan!</strong> Tag ' . $nama . ' berhasil ditambahkan.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>';

    // echo ("<script>location.href='$base_url/index.php?page=videos&playlist=$id_playlist';</script>");
}

if (isset($_GET['hapus'])) {
    $id = $_GET['id'];

    $query = mysqli_query($koneksi, "DELETE FROM videos WHERE id=$id");

    $_SESSION['success'] = '<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Sukses dihapus!</strong> Tag ' . $id . ' berhasil dihapus.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>';

    echo ("<script>location.href='$base_url/index.php?page=videos&playlist=$id_playlist';</script>");
}

if (isset($_GET['edit'])) {
    $id = $_GET['id'];
    $query_video = mysqli_query($koneksi, "SELECT * FROM videos WHERE id=$id");
    $video = mysqli_fetch_array($query_video);
}

if (isset($_POST['edit'])) {
    $id = $_GET['id'];
    $nama = $_POST['nama'];
    $link_video = $_POST['link_video'];
    $deskripsi = mysqli_real_escape_string($koneksi, $_POST['deskripsi']);
    $status = $_POST['status'];

    mysqli_query($koneksi, "UPDATE videos SET id_playlist=$id_playlist, nama='$nama', link_video='$link_video', deskripsi='$deskripsi', status='$status' WHERE id=$id");

    $_SESSION['success'] = '<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Sukses diubah!</strong> Tag ' . $id . ' berhasil diubah.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>';

    echo ("<script>location.href='$base_url/index.php?page=videos&playlist=$id_playlist';</script>");
}

?>
<div class="header bg-primary pb-6">
    <div class="container-fluid">
        <div class="header-body">
            <div class="row align-items-center py-4">
                <div class="col-lg-6 col-7">
                    <h6 class="h2 text-white d-inline-block mb-0">Video</h6>
                    <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                        <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                            <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Playlist : <?= $playlist['nama'] ?></a></li>
                            <li class="breadcrumb-item"><a href="#">Daftar Video</a></li>
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
            <h3 class="mb-0">Daftar Video di Playlist <b><?= $playlist['nama'] ?></b></h3>
        </div>
        <!-- Light table -->

        <div class="card-body row">
            <div class="col-5">
                <form method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <?php
                        if (isset($_GET['edit'])) {

                        ?>
                        <input type="hidden" name="id" value="<?= $playlist['id'] ?>">
                        <?php } ?>
                        <label for="">Nama Video</label>
                        <input class="form-control" placeholder="Nama Video" type="text" name="nama"
                            value="<?= isset($_GET['edit']) ? $video['nama'] : '' ?>" required>
                    </div>

                    <div class="form-group">
                        <label for="">Link Video</label>
                        <input class="form-control" placeholder="Link Video" type="text" name="link_video"
                            value="<?= isset($_GET['edit']) ? $video['link_video'] : '' ?>" required>
                    </div>

                    <div class="form-group">
                        <label class="form-control-label">Deskripsi</label>
                        <textarea rows="4" name="deskripsi" class="form-control"
                            placeholder="Deskripsi"><?= isset($_GET['edit']) ? $video['deskripsi'] : '' ?></textarea>
                    </div>

                    <div class="form-group">
                        <label class="form-control-label">Status </label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="status" id="active" value="1"
                                <?= (isset($_GET['edit']) && $video['status'] == 1) ? 'checked' : 'checked' ?>>
                            <label class="form-check-label" for="active">
                                Active
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="status" id="inactive" value="0"
                                <?= (isset($_GET['edit']) && $video['status'] == 0) ? 'checked' : '' ?>>
                            <label class="form-check-label" for="inactive">
                                Inactive
                            </label>
                        </div>
                    </div>

                    <button type="submit" name="<?= isset($_GET['edit']) ? 'edit' : 'tambah' ?>"
                        class="btn btn-info ml-2 float-right"><?= isset($_GET['edit']) ? 'Edit' : 'Tambah' ?></button>
                    <a href="index.php?page=videos&playlist=<?= $id_playlist ?>"
                        class="btn btn-success ml-2 float-right">Refresh</a>
                    <a href="index.php?page=playlist" class="btn btn-default ml-2 float-right">Kembali</a>
                </form>
            </div>

            <div class="col-7">
                <table class="table table-responsive align-items-center table-flush">
                    <thead class="thead-light">
                        <tr>
                            <th>#</th>
                            <th>Judul Video</th>
                            <th>Status</th>
                            <th class="text-center">Aksi</>
                        </tr>
                    </thead>
                    <tbody class="list">

                        <?php
                        $i = 1;
                        $data = mysqli_query($koneksi, "SELECT * FROM videos WHERE id_playlist=$id_playlist ORDER BY created_at ASC");

                        if (mysqli_num_rows($data) < 1) {
                            echo '<tr><td><i>Data is empty...</i></td></tr>';
                        } else {

                            while ($video = mysqli_fetch_array($data)) {
                        ?>
                        <tr>
                            <td scope="row"><?= $i++ ?></td>
                            <td><?= $video['nama'] ?></td>
                            <td><?= ($video['status'] == '1' ? '<span class="badge badge-success">ACTIVE</span>' : '<span class="badge badge-danger">INACTIVE</span>') ?></label>
                            </td>
                            <td class="text-center">
                                <a href="index.php?page=videos&playlist=<?= $id_playlist ?>&id=<?= $video['id'] ?>&edit"
                                    class="btn btn-sm btn-rounded btn-info"><i class="fa fa-fw fa-edit"></i> Edit</a>
                                <a href="index.php?page=videos&playlist=<?= $id_playlist ?>&id=<?= $video['id'] ?>&hapus"
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
                            href="index.php?page=videos&playlist=<?= $id_playlist ?><?= ($halaman > 1) ? '&hal=' . $previous : '' ?>"
                            tabindex="-1">
                            <i class="fas fa-angle-left"></i>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>

                    <?php for ($x = 1; $x <= $total_halaman; $x++) { ?>
                    <li class="page-item <?= ($halaman == $x) ? 'active' : '' ?>">
                        <a class="page-link"
                            href="index.php?page=videos&playlist=<?= $id_playlist ?>&hal=<?= $x ?>"><?= $x ?></a>
                    </li>
                    <?php } ?>

                    <li class="page-item">
                        <a class="page-link"
                            href="index.php?page=videos&playlist=<?= $id_playlist ?><?= ($halaman > 1) ? '&hal=' . $next : '' ?>">
                            <i class="fas fa-angle-right"></i>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
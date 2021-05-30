<?php

$batas = 10;
$halaman = isset($_GET['hal']) ? (int)$_GET['hal'] : 1;
$halaman_awal = ($halaman > 1) ? ($halaman * $batas) - $batas : 0;

$i = $halaman_awal + 1;
$previous = $halaman - 1;
$next = $halaman + 1;

$data = mysqli_query($koneksi, "SELECT * FROM categories");
$jumlah_data = mysqli_num_rows($data);
$total_halaman = ceil($jumlah_data / $batas);

$data = mysqli_query($koneksi, "SELECT * FROM categories ORDER BY nama LIMIT $halaman_awal, $batas");

if (isset($_POST['tambah'])) {
    $nama = $_POST['nama'];
    $status = $_POST['status'];

    $query = mysqli_query($koneksi, "INSERT INTO categories (id, nama, status) VALUES('', '$nama', '$status')");

    $_SESSION['success'] = '<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Sukses ditambahkan!</strong> Tag ' . $nama . ' berhasil ditambahkan.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>';

    echo ("<script>location.href='$base_url/index.php?page=categories';</script>");
}

if (isset($_GET['hapus'])) {
    $id = $_GET['id'];

    $query = mysqli_query($koneksi, "DELETE FROM categories WHERE id=$id");

    $_SESSION['success'] = '<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Sukses dihapus!</strong> Tag ' . $id . ' berhasil dihapus.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>';

    echo ("<script>location.href='$base_url/index.php?page=categories';</script>");
}

if (isset($_GET['edit'])) {
    $id = $_GET['id'];
    $querycat = mysqli_query($koneksi, "SELECT * FROM categories WHERE id=$id");
    $categories = mysqli_fetch_array($querycat);
}

if (isset($_POST['edit'])) {
    $id = $_GET['id'];
    $nama = $_POST['nama'];
    $status = $_POST['status'];
    mysqli_query($koneksi, "UPDATE categories SET nama='$nama', status='$status' WHERE id=$id");

    $_SESSION['success'] = '<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Sukses diubah!</strong> Tag ' . $id . ' berhasil diubah.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>';

    echo ("<script>location.href='$base_url/index.php?page=categories';</script>");
}


?>

<div class="header bg-primary pb-6">
    <div class="container-fluid">
        <div class="header-body">
            <div class="row align-items-center py-4">
                <div class="col-lg-6 col-7">
                    <h6 class="h2 text-white d-inline-block mb-0">Categories</h6>
                    <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                        <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                            <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Daftar Kategori</a></li>
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
            <h3 class="mb-0">Daftar Kategori</h3>
        </div>
        <!-- Light table -->

        <div class="card-body row">
            <div class="col-4">
                <form method="POST">
                    <div class="form-group">
                        <label class="form-control-label">Nama Kategori</label>
                        <input class="form-control" placeholder="Nama Kategori" type="text" name="nama"
                            value="<?= isset($_GET['edit']) ? $categories['nama'] : '' ?>" required>
                    </div>

                    <div class="form-group">
                        <label class="form-control-label">Status </label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="status" id="active" value="1"
                                <?= (isset($_GET['edit']) && $categories['status'] == 1) ? 'checked' : 'checked' ?>>
                            <label class="form-check-label" for="active">
                                Active
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="status" id="inactive" value="0"
                                <?= (isset($_GET['edit']) && $categories['status'] == 0) ? 'checked' : '' ?>>
                            <label class="form-check-label" for="inactive">
                                Inactive
                            </label>
                        </div>
                    </div>
                    <button type="submit" name="<?= isset($_GET['edit']) ? 'edit' : 'tambah' ?>"
                        class="btn btn-info ml-2 float-right"><?= isset($_GET['edit']) ? 'Edit' : 'Tambah' ?></button>
                    <a href="index.php?page=categories" class="btn btn-default ml-2 float-right">Refresh</a>
                </form>
            </div>


            <div class="col-8">
                <table class="table align-items-center table-flush">
                    <thead class="thead-light">
                        <tr>
                            <th>#</th>
                            <th>Nama Kategori</th>
                            <th>Status</th>
                            <th class="text-center">Aksi</th>
                        </tr>
                    </thead>
                    <tbody class="list">

                        <?php
                        if (mysqli_num_rows($data) < 1) {
                            echo '<tr><td><i>Data is empty...</i></td></tr>';
                        } else {

                            while ($categories = mysqli_fetch_array($data)) {
                        ?>
                        <tr>
                            <td scope="row"><?= $i++ ?></td>
                            <td><?= $categories['nama'] ?></td>
                            <td><?= ($categories['status'] == '1' ? '<span class="badge badge-success">ACTIVE</span>' : '<span class="badge badge-danger">INACTIVE</span>') ?></label>
                            </td>
                            <td class="text-center">
                                <a href="index.php?page=categories&id=<?= $categories['id'] ?>&edit"
                                    class="btn btn-sm btn-rounded btn-info"><i class="fa fa-fw fa-edit"></i> Edit</a>
                                <a href="index.php?page=categories&id=<?= $categories['id'] ?>&hapus"
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
                            href="index.php?page=categories<?= ($halaman > 1) ? '&hal=' . $previous : '' ?>"
                            tabindex="-1">
                            <i class="fas fa-angle-left"></i>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>

                    <?php for ($x = 1; $x <= $total_halaman; $x++) { ?>
                    <li class="page-item <?= ($halaman == $x) ? 'active' : '' ?>">
                        <a class="page-link" href="index.php?page=categories&hal=<?= $x ?>"><?= $x ?></a>
                    </li>
                    <?php } ?>

                    <li class="page-item">
                        <a class="page-link"
                            href="index.php?page=categories<?= ($halaman > 1) ? '&hal=' . $next : '' ?>">
                            <i class="fas fa-angle-right"></i>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
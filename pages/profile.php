<?php
$id_user = $_SESSION['id'];
$user_query = mysqli_query($koneksi, "SELECT * FROM users WHERE id=$id_user");
$user = mysqli_fetch_array($user_query);

$user_detail_query = mysqli_query($koneksi, "SELECT * FROM user_detail WHERE id_user=$id_user");
$user_detail = mysqli_fetch_array($user_detail_query);

if (isset($_POST['ubah-password'])) {
    $password_lama = $_POST['password-lama'];
    $password_baru = $_POST['password-baru'];
    $password_konfirmasi = $_POST['konfirmasi-password'];

    if (sha1($password_lama) != $user['password']) {
        echo ("<script>location.href='$base_url/index.php?page=profile&ubah-password&error-01';</script>");
    } elseif ($password_baru != $password_konfirmasi) {
        echo ("<script>location.href='$base_url/index.php?page=profile&ubah-password&error-02';</script>");
    } else {
        $password = sha1($password_baru);
        mysqli_query($koneksi, "UPDATE users SET password='$password' WHERE id=$id_user");
        echo ("<script>location.href='$base_url/index.php?page=profile&ubah-password&success';</script>");
    }
}

if (isset($_POST['ubah-profil'])) {
    $nama = $_POST['nama'];
    $email = $_POST['email'];
    $status = $_POST['status'];
    $deskripsi = $_POST['deskripsi'];
    $avatar = $user['profile'];

    if ($status == 1) {
        if ($user['profile'] != 'avatar.png') {
            unlink('images/avatar/' .  $avatar);
        }

        mysqli_query($koneksi, "DELETE FROM users WHERE id=$id_user");
        session_destroy();
    } elseif ($status == 0 || $status == '') {
        if ($_FILES['avatar']['name'] != '') {
            $avatar_name = $_FILES['avatar']['name'];
            $avatar_temp = $_FILES['avatar']['tmp_name'];
            $avatar_slug = preg_replace('/[^a-z0-9]+/i', '-', trim(strtolower($nama)));
            $ext = pathinfo($avatar_name, PATHINFO_EXTENSION);

            if ($user['profile'] != 'avatar.png') {
                unlink('images/avatar/' .  $avatar);
            }

            $avatar = $avatar_slug . '-' . time() . '.' . $ext;
            move_uploaded_file($avatar_temp, './images/avatar/' . $avatar);
        }

        if ($status == '') {
            $status = $user['status'];
        }

        mysqli_query($koneksi, "UPDATE users SET nama='$nama', email='$email', status=$status, profile='$avatar' WHERE id=$id_user");
        mysqli_query($koneksi, "UPDATE user_detail SET deskripsi='$deskripsi' WHERE id_user=$id_user");
        echo ("<script>location.href='$base_url/index.php?page=profile&success';</script>");
    }
}

?>
<div class="header bg-primary pb-6">
    <div class="container-fluid">
        <div class="header-body">
            <div class="row align-items-center py-4">
                <div class="col-lg-6 col-7">
                    <h6 class="h2 text-white d-inline-block mb-0">
                        <?= isset($_GET['ubah-password']) ? 'Password' : 'Profil' ?></h6>
                    <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                        <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                            <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Ubah
                                    <?= isset($_GET['ubah-password']) ? 'Password' : 'Profil' ?></a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid mt--6">
    <div class="row">
        <div class="col-xl-4 order-xl-2">
            <div class="card card-profile">
                <div class="row justify-content-center">
                    <div class="col-lg-3 order-lg-2">
                        <div class="card-profile-image">
                            <img src="./images/avatar/<?= $user['profile'] ?>" class="rounded-circle" width="150"
                                height="150">
                        </div>
                    </div>
                </div>
                <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
                </div>
                <div class="card-body pt-0">
                    <div class="row">
                        <div class="col">
                            <div class="card-profile-stats d-flex justify-content-center">
                            </div>
                        </div>
                    </div>
                    <div class="text-center">
                        <h5 class="h3">
                            <?= $user['nama'] ?>
                        </h5>
                        <div class="h5 font-weight-300">
                            <?= $user['email'] ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-8 order-xl-1">
            <div class="card">
                <form method="POST" enctype="multipart/form-data">
                    <div class="card-header">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3 class="mb-0">Ubah <?= isset($_GET['ubah-password']) ? 'Password' : 'Profil' ?></h3>
                            </div>
                            <div class="col-4 text-right">
                                <button type="submit"
                                    name="<?= isset($_GET['ubah-password']) ? 'ubah-password' : 'ubah-profil' ?>"
                                    class="btn btn-sm btn-primary">Simpan</button>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">

                        <?php if (isset($_GET['success'])) { ?>
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <strong>Sukses diubah!</strong>
                            <?= isset($_GET['ubah-password']) && isset($_GET['success']) ? 'Password' : 'Profil' ?>
                            berhasil diubah.
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <?php } ?>

                        <?php if (isset($_GET['error-01'])) { ?>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <strong>Terjadi Kesalahan!</strong> Password lama tidak cocok.
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <?php } ?>

                        <?php if (isset($_GET['error-02'])) { ?>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <strong>Terjadi Kesalahan!</strong> konfirmasi password tidak sama dengan password baru.
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <?php } ?>

                        <?php if (isset($_GET['ubah-password'])) { ?>
                        <div class="pl-lg-4">
                            <div class="form-group">
                                <label class="form-control-label" for="input-username">Password Lama</label>
                                <input type="password" id="input-username" name="password-lama" class="form-control"
                                    placeholder="Password Lama">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label" for="input-username">Password Baru</label>
                                <input type="password" id="input-username" name="password-baru" class="form-control"
                                    placeholder="Password Baru">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label" for="input-username">Konfirmasi Password Baru</label>
                                <input type="password" id="input-username" name="konfirmasi-password"
                                    class="form-control" placeholder="Konfirmasi Password Baru">
                            </div>
                        </div>
                        <?php } else { ?>
                        <h6 class="heading-small text-muted mb-4">Informasi Pengguna</h6>
                        <div class="pl-lg-4">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="form-control-label" for="input-username">Nama</label>
                                        <input type="text" name="nama" id="input-username" class="form-control"
                                            placeholder="Username" value="<?= $user['nama'] ?>">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="form-control-label" for="input-email">Email</label>
                                        <input type="email" name="email" id="input-email" class="form-control"
                                            value="<?= $user['email'] ?>">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="form-control-label" for="input-first-name">Foto Profil</label>
                                        <input type="file" name="avatar" id="input-first-name" class="form-control">
                                        <small><i>Kosongkan jika tidak ingin mengupload foto.</i></small>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="form-control-label" for="input-last-name">Status Akun</label>
                                        <select class="form-control" name="status">
                                            <option value="">-- Pilih Status --</option>
                                            <option value="0">Nonaktif Akun</option>
                                            <option value="1">Hapus Akun</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">Tentang Saya</label>
                                <textarea rows="4" class="form-control" name="deskripsi"
                                    placeholder="Tentang saya ..."><?= $user_detail['deskripsi'] ?></textarea>
                            </div>
                        </div>
                        <?php } ?>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
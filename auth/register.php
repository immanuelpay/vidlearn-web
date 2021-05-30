<?php

include '../config/koneksi.php';

if (isset($_POST['register'])) {
    $nama = $_POST['nama'];
    $email = $_POST['email'];
    $password = sha1($_POST['password']);

    $query = mysqli_query($koneksi, "INSERT INTO `users` (`id`, `nama`, `email`, `password`) VALUES ('', '$nama', '$email', '$password')");
    $success = true;
}

?>

<!-- Header -->
<div class="header bg-gradient-primary py-7 py-lg-8 pt-lg-9">
    <div class="container">
        <div class="header-body text-center mb-7">
            <div class="row justify-content-center">
                <div class="col-xl-5 col-lg-6 col-md-8 px-5">
                    <h1 class="text-white">Buat Akun dan masuk</h1>
                    <p class="text-lead text-white">Silahkan bergabung untuk menambahkan video pembelajaran.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="separator separator-bottom separator-skew zindex-100">
        <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1"
            xmlns="http://www.w3.org/2000/svg">
            <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
        </svg>
    </div>
</div>
<!-- Page content -->
<div class="container mt--8 pb-5">
    <!-- Table -->
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8">
            <div class="card bg-secondary border-0">
                <div class="card-body px-lg-5 py-lg-5">
                    <div class="text-center text-muted mb-4">
                    </div>

                    <?php if (isset($success)) { ?>

                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Registration Successfully!</strong> Please Login, <a
                            href="<?= $base_url ?>/auth/?page=login">click here.</a>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <?php } ?>

                    <form role="form" method="POST">
                        <div class="form-group">
                            <div class="input-group input-group-merge input-group-alternative mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="ni ni-hat-3"></i></span>
                                </div>
                                <input class="form-control" name="nama" placeholder="Name" type="text" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group input-group-merge input-group-alternative mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                                </div>
                                <input class="form-control" name="email" placeholder="Email" type="email" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group input-group-merge input-group-alternative">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                                </div>
                                <input class="form-control" name="password" placeholder="Password" type="password"
                                    required>
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="submit" name="register" class="btn btn-primary mt-4">Daftar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
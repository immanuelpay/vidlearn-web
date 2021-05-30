<?php
include '../config/koneksi.php';

if (isset($_POST['login'])) {
    $email = $_POST['email'];
    $password = sha1($_POST['password']);

    $query = mysqli_query($koneksi, "SELECT * FROM users WHERE email='$email' AND password='$password'");
    $cek = mysqli_num_rows($query);
    $data = mysqli_fetch_array($query);

    if ($cek > 0) {
        $_SESSION['login'] = true;
        $_SESSION['id'] = $data['id'];

        echo ("<script>location.href='$base_url/index.php?page=home';</script>");
    }
}

if (isset($_SESSION['login'])) {
    echo ("<script>location.href='$base_url/index.php?page=home';</script>");
}
?>

<!-- Header -->
<div class="header bg-gradient-primary py-7 py-lg-8 pt-lg-9">
    <div class="container">
        <div class="header-body text-center mb-7">
            <div class="row justify-content-center">
                <div class="col-xl-5 col-lg-6 col-md-8 px-5">
                    <h1 class="text-white">Selamat Datang</h1>
                    <p class="text-lead text-white">Silahkan masuk untuk menambahkan video pembelajaran </p>
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
    <div class="row justify-content-center">
        <div class="col-lg-5 col-md-7">
            <div class="card bg-secondary border-0 mb-0">
                <div class="card-body px-lg-5 py-lg-5">
                    <div class="text-center text-muted mb-4">
                        <small>Sign in with credentials</small>
                    </div>

                    <form role="form" method="POST">
                        <div class="form-group mb-3">
                            <div class="input-group input-group-merge input-group-alternative">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                                </div>
                                <input class="form-control" placeholder="Email" type="email" name="email">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group input-group-merge input-group-alternative">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                                </div>
                                <input class="form-control" placeholder="Password" type="password" name="password">
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="submit" name="login" class="btn btn-primary my-4">Masuk</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
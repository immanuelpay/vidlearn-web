<?php

$koneksi = mysqli_connect('localhost', 'root', '', 'project_belajar');
$base_url = 'http://localhost/project-belajar';
$api_url = 'http://localhost/project-belajar/api/v1';

if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
    exit();
}
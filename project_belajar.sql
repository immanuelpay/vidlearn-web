-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Mar 2021 pada 15.03
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_belajar`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `nama`, `status`) VALUES
(9, 'PEMROGRAMAN', '1'),
(10, 'MATEMATIKA', '0'),
(11, 'BIOLOGI', '0'),
(13, 'KIMIA', '0'),
(14, 'FISIKA', '0'),
(15, 'DESAIN GRAFIS', '1'),
(16, 'IT NETWORK', '1'),
(17, 'MARKETING', '0'),
(18, 'OFFICE', '1'),
(19, 'ACCOUNTING', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deskripsi` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `playlists`
--

INSERT INTO `playlists` (`id`, `id_user`, `id_category`, `nama`, `thumbnail`, `status`, `deskripsi`, `created_at`) VALUES
(26, 12, 9, 'ANDROID UNTUK PEMULA DENGAN FLUTTER', 'android-untuk-pemula-dengan-flutter-1614658623.png', 1, 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?', '2021-03-01 00:12:06'),
(27, 12, 19, 'TUTORIAL KOMPUTER AKUNTANSI MYOB', 'tutorial-komputer-akuntansi-myob-1614662017.png', 1, 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?', '2021-03-01 00:13:57'),
(29, 12, 9, 'Laravel API Development & Vue JS SPA', 'laravel-api-development-vue-js-spa-1614658593.png', 1, 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?', '2021-03-01 00:16:56'),
(31, 12, 16, 'Tutorial debian 8', 'tutorial-debian-8-1614614702.jpg', 1, 'Ini adalah toturial konfigurasi Server Debian 8 yang di buat di aplikasi Virtual Box,selamat menyaksikan dan jangan lupa untuk klik Like & Subscribe.', '2021-03-01 00:56:47'),
(32, 12, 9, 'CSS DASAR', 'css-dasar-1614603251.png', 1, 'Ini dia yang kalian tunggu2.. seri mengenai CSS Dasar! :D\r\n\r\ndi video pertama ini kita akan belajar mengenai pendahuluan CSS, apa itu CSS, definisinya dan manfaatnya apa.. \r\n\r\n---\r\nIkuti Kelas Online \"Menjadi Seorang FullStack Designer dalam 15 Hari\"\r\nhttp://fullstackdesigner.id​\r\n', '2021-03-01 14:36:16'),
(33, 12, 16, 'WINDOWS SERVER', 'windows-server-1614614340.png', 1, 'WINDOWS SERVER', '2021-03-01 15:27:14'),
(35, 12, 15, 'Belajar Dasar PHOTOSHOP ', 'belajar-dasar-photoshop-1614662275.png', 1, 'BELAJAR PHOTOSHOP DARI YANG PALING DASAR\r\nDi video saya kali ini saya akan mencoba menjelaskan cara mudah belajar photoshop step by step dimulai dari yang paling dasar yaitu pengenalan tool-tool serta fungsinya. Rencananya video akan saya bikin per part dan saya mulai dari part 1 ini sampai part, part berikutnya. di video part 1 ini saya membahas tentang penggunaan move tool, rectangular marquee tool, elliptical marquee tool, lasso tool, polygonal lasso tool dan magnetic lasso tool. disini saya juga menjelaskan fungsi dari masing2 tool tersebut. saya berharap setelah teman2 melihat dan mempraktekan video ini teman2 nanti bisa mengolah gambar sendiri serta bisa membuat design sendiri menggunakan photoshop. nah bagi teman2 yang mau belajar photoshop dari yang paling dasar bisa ikuti channel saya dengan cara subscribe, like, komen ataupun share. teman2 juga bisa meninggalkan kritik dan saran yang sifatnya membangun agar kedepannya saya bisa menyuguhkan video2 tutorial yang lebih berkualitas lagi.', '2021-03-01 18:16:56'),
(36, 12, 16, 'CCNA - Network Engineer', 'ccna-network-engineer-1614602053.png', 1, 'Dokumentasi Belajar Cisco CCNA Network Engineer', '2021-03-01 20:08:15'),
(37, 12, 9, 'Pengenalan Git dan Github', 'pengenalan-git-dan-github-1614612904.png', 1, 'Di video ini kita akan memulai sebuah seri baru mengenai GIT & GITHUB', '2021-03-01 23:35:04'),
(38, 12, 19, 'Akuntansi Keuangan Menengah | Intermediate Accounting ', 'akuntansi-keuangan-menengah-intermediate-accounting-1614662147.png', 1, 'Hallo guys. Di video kali ini, kita bakal bahas mata kuliah Intermediate Accounting 1 dengan fokus materi Cash and Receivables. Materi ini akan membantu kalian buat bedain antara cash, cash equivalents dan non cash serta bagaimana suatu perusahaan melakukan penjualan dan ', '2021-03-02 13:00:01'),
(39, 12, 18, 'Tutorial Office 365', 'tutorial-office-365-1614677099.png', 1, 'Pada Video kali ini saya akan membahas tentang cara Install Office 365 dan Cara Aktivasinya. Office 365 adalah sebuah software Office yang didalamnya terdapat Office Word, Excel, Powerpoint seperti Office lainnya, namun terdapat banyak Fitur didalamnya..', '2021-03-02 17:24:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `playlist_tags`
--

CREATE TABLE `playlist_tags` (
  `id` int(11) NOT NULL,
  `id_playlist` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `playlist_tags`
--

INSERT INTO `playlist_tags` (`id`, `id_playlist`, `id_tag`) VALUES
(16, 26, 61),
(17, 26, 62),
(18, 27, 56),
(20, 29, 52),
(21, 29, 50),
(23, 26, 52),
(24, 31, 64),
(25, 32, 54),
(26, 32, 50),
(27, 33, 64),
(32, 35, 63),
(33, 36, 66),
(34, 36, 67),
(35, 36, 64),
(36, 37, 68),
(37, 38, 71),
(38, 38, 69),
(39, 38, 70),
(40, 39, 58),
(41, 39, 59),
(42, 39, 57);

-- --------------------------------------------------------

--
-- Struktur dari tabel `popular`
--

CREATE TABLE `popular` (
  `id` int(11) NOT NULL,
  `id_playlist` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `popular`
--

INSERT INTO `popular` (`id`, `id_playlist`, `count`) VALUES
(1, 38, 4),
(2, 35, 2),
(3, 39, 7),
(4, 33, 7),
(5, 31, 3),
(6, 26, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tags`
--

INSERT INTO `tags` (`id`, `nama`, `status`) VALUES
(49, 'PHP', 0),
(50, 'VUE JS', 1),
(52, 'LARAVEL', 1),
(53, 'HTML', 0),
(54, 'CSS', 1),
(55, 'JAVA SCRIPT', 0),
(56, 'MYOB', 1),
(57, 'MS OFFICE WORD', 1),
(58, 'MS OFFICE EXCEL', 1),
(59, 'MS OFFICE POWER POINT', 1),
(60, 'KOTLIN', 0),
(61, 'ANDROID', 1),
(62, 'FLUTTER', 1),
(63, 'ADOBE PHOTOSHOP', 1),
(64, 'SERVER', 1),
(65, 'DEBIAN', 1),
(66, 'CISCO', 1),
(67, 'NETWORK', 1),
(68, 'GITHUB', 1),
(69, 'CASH', 1),
(70, 'RECEIVABLES', 1),
(71, 'ACCOUNTING', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `profile` varchar(100) NOT NULL DEFAULT 'avatar.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `role`, `status`, `profile`) VALUES
(11, 'Orang 1', 'orang@mail.com', '356a192b7913b04c54574d18c28d46e6395428ab', 0, 1, 'orang-1-1614948611.png'),
(12, 'Imanuel Pay', 'immanuelpay@mail.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 0, 1, 'imanuel-pay-1614948732.png'),
(13, 'afrizal', 'afrizalasmara@gmail.com', '356a192b7913b04c54574d18c28d46e6395428ab', 0, 1, 'avatar.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_detail`
--

CREATE TABLE `user_detail` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `deskripsi` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_detail`
--

INSERT INTO `user_detail` (`id`, `id_user`, `dob`, `deskripsi`) VALUES
(1, 12, 'Kupang, 24 Desember 2001', 'Seorang Mahasiswa Ilmu Komputer, Universitas Nusa Cendana. Full Stack Developer & Remote Worker salah satu perusahaan asal Australia. Senang dengan teknologi baru. Laravel addict yang tidak fanatik. Merekam jejak dengan menulis.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `id_playlist` int(11) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `link_video` varchar(100) NOT NULL,
  `deskripsi` longtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `videos`
--

INSERT INTO `videos` (`id`, `id_playlist`, `nama`, `link_video`, `deskripsi`, `status`, `created_at`) VALUES
(17, 29, '01 - Project Setup', 'https://www.youtube.com/embed/watch?v=AFyzK8qohdE&list=PLpzy7FIRqpGBBKr4FVpEs1fA7uCibdCZ9&index=1', 'Our application will need a combination of Laravel route and Vue Router. Let\'s get it all setup.\r\n\r\nBuy the full course at https://www.udemy.com/laravel-api-dev...​\r\n\r\nIn this episode, we cover:\r\n\r\nLaravel Routing\r\n\r\nVue Router\r\n\r\nFront-end Setup Complete\r\n\r\nVue Components\r\n\r\nAbout the course\r\nLearn how to develop a robust API with Laravel and a Single-Page Application in Vue JS from Scratch\r\n\r\nWhat you\'ll learn\r\n- RESTful API Development with Laravel\r\n- Vue JS Single Page Application Methodology\r\n- Front-End Design Using Tailwind CSS\r\n- Implementing Search Functionality Using Laravel Scout\r\n- Build a Complete SPA from Scratch', 1, '2021-03-01 02:05:00'),
(18, 29, '02 -  Vue Router', 'https://www.youtube.com/embed/watch?v=wJN_7YJkzRw&list=PLpzy7FIRqpGBBKr4FVpEs1fA7uCibdCZ9&index=2', 'Our application will need a combination of Laravel route and Vue Router. Let\'s get it all setup.\r\n\r\nBuy the full course at https://www.udemy.com/laravel-api-dev...​\r\n\r\nIn this episode, we cover:\r\n\r\nLaravel Routing\r\n\r\nVue Router\r\n\r\nFront-end Setup Complete\r\n\r\nVue Components\r\n\r\nAbout the course\r\nLearn how to develop a robust API with Laravel and a Single-Page Application in Vue JS from Scratch\r\n\r\nWhat you\'ll learn\r\n- RESTful API Development with Laravel\r\n- Vue JS Single Page Application Methodology\r\n- Front-End Design Using Tailwind CSS\r\n- Implementing Search Functionality Using Laravel Scout\r\n- Build a Complete SPA from Scratch', 1, '2021-03-01 02:06:48'),
(19, 29, '03 - Tailwind CSS', 'https://www.youtube.com/embed/watch?v=wX1QKUISQjI&list=PLpzy7FIRqpGBBKr4FVpEs1fA7uCibdCZ9&index=3', 'Let\'s shift our focus to the front-end and first of, Tailwindcss.\r\n\r\nBuy the full course at https://www.udemy.com/laravel-api-dev...​\r\n\r\nIn this episode, we cover:\r\n\r\nProper setup of Tailwindcss in a Laravel project\r\n\r\nCreating a Tailwind config file\r\n\r\nCheck that Tailwind is working on our project\r\n\r\nAbout the course\r\nLearn how to develop a robust API with Laravel and a Single-Page Application in Vue JS from Scratch\r\n\r\nWhat you\'ll learn\r\n- RESTful API Development with Laravel\r\n- Vue JS Single Page Application Methodology\r\n- Front-End Design Using Tailwind CSS\r\n- Implementing Search Functionality Using Laravel Scout\r\n- Build a Complete SPA from Scratch', 1, '2021-03-01 02:07:45'),
(20, 29, '04 - Login View 1', 'https://www.youtube.com/embed/watch?v=vD3T6M7Hlm0&list=PLpzy7FIRqpGBBKr4FVpEs1fA7uCibdCZ9&index=4', 'Buy the full course at https://www.udemy.com/laravel-api-dev...​\r\n\r\nIn this episode, we cover:\r\n\r\nRecreating designs from a screenshot using Tailwind classes\r\n\r\nPositioning of elements on the screen\r\n\r\nAdding a custom width in Tailwind using the config file\r\n\r\nUsing svg tags directly in views\r\n\r\nAbout the course\r\nLearn how to develop a robust API with Laravel and a Single-Page Application in Vue JS from Scratch\r\n\r\nWhat you\'ll learn\r\n- RESTful API Development with Laravel\r\n- Vue JS Single Page Application Methodology\r\n- Front-End Design Using Tailwind CSS\r\n- Implementing Search Functionality Using Laravel Scout\r\n- Build a Complete SPA from Scratch', 1, '2021-03-01 02:10:00'),
(21, 29, '05 - Login View 2', 'https://www.youtube.com/embed/watch?v=izkbbc6GJls&list=PLpzy7FIRqpGBBKr4FVpEs1fA7uCibdCZ9&index=5', 'In part 2 of 3, we design the email and password input field.\r\n\r\nBuy the full course at https://www.udemy.com/laravel-api-dev...​\r\n\r\nIn this episode, we cover:\r\n\r\nDesigning input fields and positioning the label\r\n\r\nAdding bottom padding vs adding top padding\r\n\r\nInput placeholder\r\n\r\nRemoving the outline and replacing it with a background change\r\n\r\nAbout the course\r\nLearn how to develop a robust API with Laravel and a Single-Page Application in Vue JS from Scratch\r\n\r\nWhat you\'ll learn\r\n- RESTful API Development with Laravel\r\n- Vue JS Single Page Application Methodology\r\n- Front-End Design Using Tailwind CSS\r\n- Implementing Search Functionality Using Laravel Scout\r\n- Build a Complete SPA from Scratch', 1, '2021-03-01 02:10:42'),
(22, 29, '06 - Login View 3', 'https://www.youtube.com/embed/watch?v=IUiwzrK2fpI&list=PLpzy7FIRqpGBBKr4FVpEs1fA7uCibdCZ9&index=6', 'In part 3 of 3, we finish up the lower third design of the login window view.\r\n\r\nBuy the full course at https://www.udemy.com/laravel-api-dev...​\r\n\r\nIn this episode, we cover:\r\n\r\nStyling for a button\r\n\r\nUsing flex to spread items\r\n\r\nDisplaying and styling validation errors\r\n\r\nAbout the course\r\nLearn how to develop a robust API with Laravel and a Single-Page Application in Vue JS from Scratch\r\n\r\nWhat you\'ll learn\r\n- RESTful API Development with Laravel\r\n- Vue JS Single Page Application Methodology\r\n- Front-End Design Using Tailwind CSS\r\n- Implementing Search Functionality Using Laravel Scout\r\n- Build a Complete SPA from Scratch', 1, '2021-03-01 02:55:24'),
(23, 29, '07 - API Intro', 'https://www.youtube.com/embed/watch?v=WFAIZdepec0&list=PLpzy7FIRqpGBBKr4FVpEs1fA7uCibdCZ9&index=7', 'Single Page Applications or SPAs are driven by APIs. If you are not familiar, we will cover the basics of it in this video.\r\n\r\nBuy the full course at https://www.udemy.com/laravel-api-dev...​\r\n\r\nIn this episode, we cover:\r\n\r\nRESTful Controllers\r\n\r\n7 RESTful Verbs\r\n\r\nIntroduction to API Development\r\n\r\nAbout the course\r\nLearn how to develop a robust API with Laravel and a Single-Page Application in Vue JS from Scratch\r\n\r\nWhat you\'ll learn\r\n- RESTful API Development with Laravel\r\n- Vue JS Single Page Application Methodology\r\n- Front-End Design Using Tailwind CSS\r\n- Implementing Search Functionality Using Laravel Scout\r\n- Build a Complete SPA from Scratch', 1, '2021-03-01 13:55:15'),
(24, 29, '08 - TDD Setup & Basic Test', 'https://www.youtube.com/embed/watch?v=8ckGr0iWefA&list=PLpzy7FIRqpGBBKr4FVpEs1fA7uCibdCZ9&index=8', 'In order to get the TDD workflow working, we need to take some extra steps to finish the setup.\r\n\r\nBuy the full course at https://www.udemy.com/laravel-api-dev...​\r\n\r\nIn this episode, we cover:\r\n\r\nSetting up Testing Database\r\n\r\nBash aliases for PHPUnit\r\n\r\nCreating our first feature test\r\n\r\nFirst stab at adding contacts to the database test\r\n\r\nAbout the course\r\nLearn how to develop a robust API with Laravel and a Single-Page Application in Vue JS from Scratch\r\n\r\nWhat you\'ll learn\r\n- RESTful API Development with Laravel\r\n- Vue JS Single Page Application Methodology\r\n- Front-End Design Using Tailwind CSS\r\n- Implementing Search Functionality Using Laravel Scout\r\n- Build a Complete SPA from Scratch', 1, '2021-03-01 13:57:27'),
(25, 29, '09 - Basic Validation', 'https://www.youtube.com/embed/watch?v=4bkmyKcDhfU&list=PLpzy7FIRqpGBBKr4FVpEs1fA7uCibdCZ9&index=9', 'Now that we have the basic test working, let\'s explore how to perform validation to our project.\r\n\r\nBuy the full course at https://www.udemy.com/laravel-api-dev...​\r\n\r\nIn this episode, we cover:\r\n\r\nAdding other fields to contact model\r\n\r\nWriting validation tests\r\n\r\nAbout the course\r\nLearn how to develop a robust API with Laravel and a Single-Page Application in Vue JS from Scratch\r\n\r\nWhat you\'ll learn\r\n- RESTful API Development with Laravel\r\n- Vue JS Single Page Application Methodology\r\n- Front-End Design Using Tailwind CSS\r\n- Implementing Search Functionality Using Laravel Scout\r\n- Build a Complete SPA from Scratch', 1, '2021-03-01 13:59:15'),
(26, 29, '10 - Test Cleanup & Refactor', 'https://www.youtube.com/embed/watch?v=L5iqZwZfGjU&list=PLpzy7FIRqpGBBKr4FVpEs1fA7uCibdCZ9&index=10', 'With all of the test in green and passing state, let\'s take time cleanup and refactor parts of our test suite.\r\n\r\nBuy the full course at https://www.udemy.com/laravel-api-dev...​\r\n\r\nIn this episode, we cover:\r\n\r\nExtracting data into a private method\r\n\r\nExtracting validation tests into systematic method\r\n\r\nDRY-ing up tests\r\n\r\nAbout the course\r\nLearn how to develop a robust API with Laravel and a Single-Page Application in Vue JS from Scratch\r\n\r\nWhat you\'ll learn\r\n- RESTful API Development with Laravel\r\n- Vue JS Single Page Application Methodology\r\n- Front-End Design Using Tailwind CSS\r\n- Implementing Search Functionality Using Laravel Scout\r\n- Build a Complete SPA from Scratch', 1, '2021-03-01 14:00:28'),
(27, 26, '01 - Intro Pengenalan', 'https://www.youtube.com/embed/watch?v=rzTpk849ktA&list=PL0-7Xi0GB3teRqkuBusUEcVrP6OlYpD9w&index=1', 'Flutter adalah sebuah Framework untuk membuat Aplikasi Android maupun iOS.  Flutter ini dibuat dan dikembangkan oleh Google dengan menggunakan bahasa Dart (Google Language).\r\n\r\nBanyak sekali kelebihan-kelebihan Flutter saat membuat aplikasi smartphone ini, salah satunya \"Hot Reload\" yaitu proses refresh aplikasi yang cepat.\r\n\r\nPada Video bagian pertama ini kita akan berkenalan dulu dengan Flutter, Apa itu Flutter ? dan Mengapa harus Flutter ?\r\n\r\n\r\nKeyword:\r\nTutorial flutter bahasa indonesia, flutter indonesia, flutter dari dasar, apa itu flutter, flutter adalah, dart adalah, google language, framework, tutorial android, membuat aplikasi android, membuat aplikasi smartphone, membuat aplikasi iOS, flutter untuk pemula, flutter for beginer, flutter dart language,', 1, '2021-03-01 14:14:47'),
(28, 26, '02 - Instalasi (Persiapan Flutter)', 'https://www.youtube.com/embed/watch?v=5l-HfTsf7OY&list=PL0-7Xi0GB3teRqkuBusUEcVrP6OlYpD9w&index=2', 'Tutorial Flutter bagian kedua, melakukan persiapan untuk memulai Flutter.\r\n\r\n- Melakukan clone Flutter\r\n- Menginstal Android Studio\r\n- Menginstal Extensi Visual Studio Code\r\n\r\n\r\nKeyword:\r\nTutorial flutter bahasa indonesia, flutter indonesia, flutter dari dasar, apa itu flutter, flutter adalah, dart adalah, google language, framework, tutorial android, membuat aplikasi android, membuat aplikasi smartphone, membuat aplikasi iOS, flutter untuk pemula, flutter for beginer, flutter dart language, menginstal flutter, clone flutter, menginstal android Studio, extensi Visual studio Code, android emulator', 1, '2021-03-01 14:15:41'),
(29, 26, '03 - Hallo World (Aplikasi Pertama)', 'https://www.youtube.com/embed/watch?v=wvF1I9ooO6w&list=PL0-7Xi0GB3teRqkuBusUEcVrP6OlYpD9w&index=3', 'Video ini membahas tentang dasar membuat aplikasi smartphone menggunakan Flutter, yaitu tentang cara membuat kalimat Hallo World. \r\n\r\nPemahaman dalam membuat kalimat Hallo World sangat dibutuhkan setiap kali kita ingin mempelajari suatu bahasa pemrograman. Yaitu agar kita dapat memahami alur kerja dari aplikasi yang sedang dipelajari.\r\n\r\nKeyword:\r\nTutorial flutter bahasa indonesia, flutter indonesia, flutter dari dasar, apa itu flutter, flutter adalah, dart adalah, google language, framework, tutorial android, membuat aplikasi android, membuat aplikasi smartphone, membuat aplikasi iOS, flutter untuk pemula, flutter for beginer, flutter dart language, hallo world, aplikasi pertama, aplikasi sederhana,', 1, '2021-03-01 14:17:00'),
(30, 26, '04 - Membuat Style, Text dan Icon', 'https://www.youtube.com/embed/watch?v=odD8pYsF5e8&list=PL0-7Xi0GB3teRqkuBusUEcVrP6OlYpD9w&index=4', 'Video ini membahas tentang dasar membuat aplikasi smartphone menggunakan Flutter, yaitu tentang cara membuat style pada Widget, Text dan Icon.\r\n\r\n \r\n\r\nTutorial by:\r\nhttp:idrcorner.com\r\n\r\n\r\nKeyword:\r\nTutorial flutter bahasa indonesia, flutter indonesia, flutter dari dasar, apa itu flutter, flutter adalah, dart adalah, google language, framework, tutorial android, membuat aplikasi android, membuat aplikasi smartphone, membuat aplikasi iOS, flutter untuk pemula, flutter for beginer, flutter dart language,style pada flutter, membuat text, membuat icon, mengganti warna,', 1, '2021-03-01 14:18:18'),
(31, 26, '05 - AppBar (Application Bar)', 'https://www.youtube.com/embed/watch?v=CpI75tyairw&list=PL0-7Xi0GB3teRqkuBusUEcVrP6OlYpD9w&index=5', 'Video ini membahas tentang dasar membuat aplikasi smartphone menggunakan Flutter, yaitu tentang cara Application Bar (Bar Aplikasi) menggunakan Widget AppBar\r\n\r\nMateri Video ini meliputi Leading, title dan Action\r\n \r\n\r\nTutorial by:\r\nhttp:idrcorner.com\r\n\r\n\r\nKeyword:\r\nTutorial flutter bahasa indonesia, flutter indonesia, flutter dari dasar, apa itu flutter, flutter adalah, dart adalah, google language, framework, tutorial android, membuat aplikasi android, membuat aplikasi smartphone, membuat aplikasi iOS, flutter untuk pemula, flutter for beginer, flutter dart language, appbar, application bar, bar aplikasi, judul aplikasi', 1, '2021-03-01 14:19:22'),
(32, 26, '06 - Mengatur Layout (Row dan Column)', 'https://www.youtube.com/embed/watch?v=eeRVqWdOKKM&list=PL0-7Xi0GB3teRqkuBusUEcVrP6OlYpD9w&index=6', 'Tutorial Flutter bagian ke enam ini membahas teknik dasar pengaturan Layout Aplikasi Smartphone ( Android dan iOS ) dengan menggunakan Widget Row dan Widget Column.\r\n\r\n \r\nhttp://idrcorner.com​\r\n\r\n\r\nKeyword:\r\nTutorial flutter bahasa indonesia, flutter indonesia, flutter dari dasar, apa itu flutter, flutter adalah, dart adalah, google language, framework, tutorial android, membuat aplikasi android, membuat aplikasi smartphone, membuat aplikasi iOS, flutter untuk pemula, flutter for beginer, flutter dart language, mengatur layout, row,column, widget row, widget column', 1, '2021-03-01 14:21:24'),
(33, 26, '07 - Card & Parsing Data', 'https://www.youtube.com/embed/watch?v=DoJI1O9Q4dY&list=PL0-7Xi0GB3teRqkuBusUEcVrP6OlYpD9w&index=7', 'Video tutorial Flutter bagian ke  7 ini akan membahas cara menggunakana Widget Card, dan melakukan pengiriman data dengan metode Parsing.\r\n\r\n \r\n\r\nKunjungi Website Saya :\r\nhttp://idrcorner.com​\r\n\r\n\r\nKeyword:\r\nTutorial flutter bahasa indonesia, flutter indonesia, flutter dari dasar, apa itu flutter, flutter adalah, dart adalah, google language, framework, tutorial android, membuat aplikasi android, membuat aplikasi smartphone, membuat aplikasi iOS, flutter untuk pemula, flutter for beginer, flutter dart language, card, parsing data, membuat menu, mengirim data,', 1, '2021-03-01 14:22:34'),
(34, 26, '08 - Navigation, Routes - Berpindah Halaman', 'https://www.youtube.com/embed/watch?v=InmYsVMu5xI&list=PL0-7Xi0GB3teRqkuBusUEcVrP6OlYpD9w&index=8', 'Video tutorial Flutter bagian ke  8 ini akan membahas cara dasar berpindah halaman dengan Routes atau Navigation\r\n\r\n \r\n\r\nKunjungi Website Saya :\r\nhttp://idrcorner.com​\r\n\r\n\r\nKeyword:\r\nTutorial flutter bahasa indonesia, flutter indonesia, flutter dari dasar, apa itu flutter, flutter adalah, dart adalah, google language, framework, tutorial android, membuat aplikasi android, membuat aplikasi smartphone, membuat aplikasi iOS, flutter untuk pemula, flutter for beginer, flutter dart language, pindah halaman, routes, navigation, navigator, navigasi, link, membuat link,', 1, '2021-03-01 14:23:52'),
(35, 26, '09 - TAB BAR', 'https://www.youtube.com/embed/watch?v=Zd5AyGESzxU&list=PL0-7Xi0GB3teRqkuBusUEcVrP6OlYpD9w&index=9', 'Video tutorial Flutter bagian ke  9 ini akan membahas cara membuat TAB pada Flutter, yaitu dengan menggunakan Widget TabBar dan TabBarView.\r\n\r\nUntuk membuat Tabbar ini menggunakan Stateful Widget dan kita harus membuat sebuah controller untuk Tabnya.\r\n \r\n===  http://gestyy.com/wK4qee​  ===\r\n\r\nKunjungi Website Saya :\r\nhttp://idrcorner.com​\r\n\r\n\r\nKeyword:\r\nTutorial flutter bahasa indonesia, flutter indonesia, flutter dari dasar, apa itu flutter, flutter adalah, dart adalah, google language, framework, tutorial android, membuat aplikasi android, membuat aplikasi smartphone, membuat aplikasi iOS, flutter untuk pemula, flutter for beginer, flutter dart language,membuat tab, tab, tabbar, tabbarview tab bar view,', 1, '2021-03-01 14:26:32'),
(36, 26, '10 - Menggunakan Gambar', 'https://www.youtube.com/embed/watch?v=8Gya3e_UxX0&list=PL0-7Xi0GB3teRqkuBusUEcVrP6OlYpD9w&index=10', 'Video tutorial Flutter bagian ke  10 ini akan membahas cara menggunakan gambar pada Flutter.\r\n\r\nPada Tutorial ini akan dibahas dua cara yaitu :\r\n1. Menggunakan Asset Image (Local Image)\r\n2. Menggunakan Network Image (URL)\r\n\r\nKunjungi Website Saya :\r\nhttp://idrcorner.com​\r\n\r\n\r\nKeyword:\r\nTutorial flutter bahasa indonesia, flutter indonesia, flutter dari dasar, apa itu flutter, flutter adalah, dart adalah, google language, framework, tutorial android, membuat aplikasi android, membuat aplikasi smartphone, membuat aplikasi iOS, flutter untuk pemula, flutter for beginer, flutter dart language,menggunakan Gambar, how use image, asset image, network image, local image, url image,', 1, '2021-03-01 14:28:32'),
(37, 32, '01 - Pendahuluan', 'https://www.youtube.com/embed/watch?v=CleFk3BZB3g&list=PLFIM0718LjIUBrbm6Gdh6k7ZUvPIAZm7p&index=1', 'Ini dia yang kalian tunggu2.. seri mengenai CSS Dasar! :D\r\n\r\ndi video pertama ini kita akan belajar mengenai pendahuluan CSS, apa itu CSS, definisinya dan manfaatnya apa.. \r\n\r\n---\r\nIkuti Kelas Online \"Menjadi Seorang FullStack Designer dalam 15 Hari\"\r\nhttp://fullstackdesigner.id​\r\n\r\n---\r\nBeli Hosting & Domain di NIAGAHOSTER\r\nKODE KUPON DISKON 10% : WPUNPAS (gunakan saat checkout)\r\nNiagaHoster : http://bit.ly/2Jx5jDV​\r\n\r\n---\r\n\r\nKita mau ngucapin terimakasih untuk beberapa pihak yang membantu proses pembuatan video ini, diantaranya :\r\n1. https://twitter.com/mercuriagilang​, atas pinjaman studio & greenscreen nya\r\n2. studio https://instagram.com/flashfoundation...​\r\n3. https://www.facebook.com/doyferdiansyah​, untuk kamera keren-nya, dan\r\n4. @choconof, untuk mic clip-on nya \r\n5. Dosen dan asisten praktikum Pemrograman Web 1,  IF UNPAS Bandung\r\n6. Mahasiswa/i IF UNPAS tercinta\r\n\r\n---\r\n\r\nterimakasih dan selamat #ngoding​!\r\n\r\n@sandhikagalih\r\n\r\n---\r\n\r\nhttp://facebook.com/webprogrammingunpas​\r\nhttp://codepen.io/webprogrammingunpas/​\r\nhttp://twitter.com/sandhikagalih​\r\nhttp://instagram.com/sandhikagalih', 1, '2021-03-01 14:38:26'),
(38, 32, '02 - Anatomi CSS', 'https://www.youtube.com/embed/watch?v=8lXDi2Mxp9c&list=PLFIM0718LjIUBrbm6Gdh6k7ZUvPIAZm7p&index=2', 'Sama seperti HTML, CSS juga memiliki anatomi / struktur dari tiap-tiap deklarasinya. Anatomi tersebut terdiri dari :\r\n1. selector\r\n2. property\r\n3. value\r\n\r\npada video ini akan dibahas mengenai bagaimana membuat membuat sintaks CSS berdasarkan anatomi tersebut\r\n\r\n-- \r\n\r\nterimakasih untuk :\r\nhttps://www.facebook.com/sutisna.opik​\r\nuntuk video thumbnailnya\r\n\r\n---\r\n\r\nJangan lupa untuk follow juga akun media sosial kita yang lain :\r\n\r\n- https://www.facebook.com/WebProgrammi...​\r\n- http://twitter.com/pw1unpas​\r\n- http://instagram.com/webprogrammingunpas​\r\n- http://www.unpas.ac.id​\r\n\r\nterimakasih dan selamat #ngoding​!\r\n\r\n@sandhikagalih', 1, '2021-03-01 14:42:33'),
(39, 32, '03 - Penempatan CSS', 'https://www.youtube.com/embed/watch?v=bnnislprJro&list=PLFIM0718LjIUBrbm6Gdh6k7ZUvPIAZm7p&index=3', 'Ada beberapa cara untuk menampatkan sintaks CSS di halaman web kita. Ada dengan menggunakan cara embed, inline dan external.\r\n\r\nMau tau bagaimana cara kerja ketiga teknik tersebut? saksikan di video ini ya.. :)\r\n\r\n-- \r\n\r\nBGM : \"Time Immemorial\" by. Chris Davidson\r\nhttp://freeplaymusic.com/volumedetail...​\r\n\r\n--\r\n\r\nJangan lupa untuk follow juga akun media sosial kita yang lain :\r\n\r\n- https://www.facebook.com/WebProgrammi...​\r\n- http://twitter.com/pw1unpas​\r\n- http://instagram.com/webprogrammingunpas​\r\n- http://www.unpas.ac.id​\r\n\r\nterimakasih dan selamat #ngoding​!\r\n\r\n@sandhikagalih', 1, '2021-03-01 14:43:48'),
(40, 32, '04 - Font Styling', 'https://www.youtube.com/embed/watch?v=nPHed3_oPvY&list=PLFIM0718LjIUBrbm6Gdh6k7ZUvPIAZm7p&index=4', 'Font merupakan elemen pada halaman web yang berhubungan dengan typeface (jenis tulisan / huruf), bisa mengenai family-nya, ukuran, bold atau tidaknya dan lain-lain. \r\n\r\nPada video kali ini, akan dibahas mengenai bagaimana memberikan style css terhadap font tersebut.\r\n\r\n-- \r\n\r\nBGM : \"Time Immemorial\" by. Chris Davidson\r\nhttp://freeplaymusic.com/volumedetail...​\r\n\r\n--\r\n\r\nJangan lupa untuk follow juga akun media sosial kita yang lain :\r\n\r\n- https://www.facebook.com/WebProgrammi...​\r\n- http://twitter.com/pw1unpas​\r\n- http://instagram.com/webprogrammingunpas​\r\n- http://codepen.io/webprogrammingunpas​\r\n- http://www.unpas.ac.id​\r\n\r\nterimakasih dan selamat #ngoding​!\r\n\r\n@sandhikagalih', 1, '2021-03-01 14:47:06'),
(41, 32, '05 - Text Styling', 'https://www.youtube.com/embed/watch?v=xih8giA7S3Q&list=PLFIM0718LjIUBrbm6Gdh6k7ZUvPIAZm7p&index=5', 'Setelah di video sebelumnya kita mempelajari tentang bagaimana memberi style pada font, di video kali ini yang akan kita bahas adalah memberikan style pada text seperti pengaturan paragraf, pengaturan warna, dll\r\n\r\n--\r\n\r\nLink di video ini :\r\n\r\n- CodePen (online code editor)\r\nhttp://codepen.io​\r\n\r\n- Nama Warna pada CSS\r\nhttp://www.w3schools.com/cssref/css_c...​\r\n\r\n- Color Picker (memilih warna berdasarkan hexadecimal atau RGB)\r\nhttp://www.colorpicker.com​\r\n\r\n- Image Color Picker (memilih hexa warna berdasarkan gambar)\r\nhttp://imagecolorpicker.com​\r\n\r\n-- \r\n\r\nBGM : \"Z One Hundred\" by. Robert Larow\r\nwww.freeplaymusic.com/volumedetail.aspx?volume=1973\r\n\r\n--\r\n\r\nJangan lupa untuk follow juga akun media sosial kita yang lain :\r\n\r\n- https://www.facebook.com/WebProgrammi...​\r\n- http://twitter.com/pw1unpas​\r\n- http://instagram.com/webprogrammingunpas​\r\n- http://codepen.io/webprogrammingunpas​\r\n- http://www.unpas.ac.id​\r\n\r\nterimakasih dan selamat #ngoding​!\r\n\r\n@sandhikagalih', 1, '2021-03-01 14:48:46'),
(42, 32, '06 - Background', 'https://www.youtube.com/embed/watch?v=zm-HPYS_ELU&list=PLFIM0718LjIUBrbm6Gdh6k7ZUvPIAZm7p&index=6', 'Pada video kali ini yang akan kita bahas adalah mengenai bagaimana cara memberi style pada background dari sebuah elemen. Setiap elemen bisa kita beri background, namun contoh di video ini hanya pada body saja. \r\n\r\nSelain warna, kita juga dapat menambahkan gambar pada background dan pengatur pengulangan dari gambar serta posisinya. Setelah menyaksikan video ini, silahkan berkreasi dengan background pada halaman web kalian.. :)\r\n\r\n--\r\n\r\nLink di video ini :\r\n\r\n- Download pattern / pola untuk background halaman\r\nhttp://subtlepatterns.com​\r\n\r\n-- \r\n\r\nBGM : \"Z One Hundred\" by. Robert Larow\r\nwww.freeplaymusic.com/volumedetail.aspx?volume=1973\r\n\r\n--\r\n\r\nJangan lupa untuk follow juga akun media sosial kita yang lain :\r\n\r\n- https://www.facebook.com/WebProgrammi...​\r\n- http://twitter.com/pw1unpas​\r\n- http://instagram.com/webprogrammingunpas​\r\n- http://codepen.io/webprogrammingunpas​\r\n- http://www.unpas.ac.id​\r\n\r\n\r\nterimakasih dan selamat #ngoding​!\r\n\r\n@sandhikagalih', 1, '2021-03-01 14:51:50'),
(43, 32, '07 - Selector', 'https://www.youtube.com/embed/watch?v=0KLwWyQyMQo&list=PLFIM0718LjIUBrbm6Gdh6k7ZUvPIAZm7p&index=7', 'Masih ingat anatomi dari sebuah sintaks CSS kan? di dalamnya terdapat bagian yang dinamakan selector.\r\n\r\nSelector digunakan untuk memilih elemen spesifik pada HTML yang akan diberi style. Ada 3 jenis selector yaitu elemen HTML, id dan class.\r\n\r\n-- \r\n\r\nBGM : \"Z One Hundred\" by. Robert Larow\r\nwww.freeplaymusic.com/volumedetail.aspx?volume=1973\r\n\r\n--\r\n\r\nJangan lupa untuk follow juga akun media sosial kita yang lain :\r\n\r\n- https://www.facebook.com/WebProgrammi...​\r\n- http://twitter.com/pw1unpas​\r\n- http://instagram.com/webprogrammingunpas​\r\n- http://codepen.io/webprogrammingunpas​\r\n- http://www.unpas.ac.id​\r\n\r\nterimakasih dan selamat #ngoding​!\r\n\r\n@sandhikagalih', 1, '2021-03-01 14:53:38'),
(44, 32, '08 - Pseudo Class', 'https://www.youtube.com/embed/watch?v=G0gYWdIHOug&list=PLFIM0718LjIUBrbm6Gdh6k7ZUvPIAZm7p&index=8', 'Pseudo class adalah kelas khusus yang dapat kita beri style css pada keadaan tertentu.. ada banyak jenis pseudo class / selector, tetapi yang akan dibahas pada video ini hanya yang berhubungan dengan link dan urutan elemen saja..\r\n\r\ncontoh pseudo-class yang berhubungan dengan link :\r\n:link\r\n:hover\r\n:active\r\n:visited\r\n\r\n--\r\n\r\nBGM : \"Z One Hundred\" by. Robert Larow\r\nwww.freeplaymusic.com/volumedetail.aspx?volume=1973\r\n\r\n--\r\n\r\nJangan lupa untuk follow juga akun media sosial kita yang lain :\r\n\r\n- https://www.facebook.com/WebProgrammi...​\r\n- http://twitter.com/pw1unpas​\r\n- http://instagram.com/webprogrammingunpas​\r\n- http://codepen.io/webprogrammingunpas​\r\n- http://www.unpas.ac.id​\r\n\r\nterimakasih dan selamat #ngoding​!\r\n\r\n@sandhikagalih', 1, '2021-03-01 14:55:10'),
(45, 32, '09 - Inheritance', 'https://www.youtube.com/embed/watch?v=kY2FEA3y43E&list=PLFIM0718LjIUBrbm6Gdh6k7ZUvPIAZm7p&index=9', 'Konsep inheritance atau pewarisan ternyata terdapat juga pada CSS, tetapi konsepnya sangat sederhana tidak se-kompleks pada bahasa pemrograman lain seperti Java atau PHP.\r\n\r\nIntinya adalah elemen child mewarisi beberapa value dari properti yang dimiliki parentnya. \r\n\r\nNilai dari properti di css yang akan kita pelajari di video ini adalah inherit.\r\n\r\n-- \r\n\r\nBGM : \"Time Immemorial\" by. Chris Davidson\r\nhttp://freeplaymusic.com/volumedetail...​\r\n\r\n--\r\n\r\nJangan lupa untuk follow juga akun media sosial kita yang lain :\r\n\r\n- https://www.facebook.com/WebProgrammi...​\r\n- http://twitter.com/pw1unpas​\r\n- http://instagram.com/webprogrammingunpas​\r\n- http://codepen.io/webprogrammingunpas​\r\n- http://www.unpas.ac.id​\r\n\r\nterimakasih dan selamat #ngoding​!\r\n\r\n@sandhikagalih', 1, '2021-03-01 14:56:06'),
(46, 32, '10 - Specificity', 'https://www.youtube.com/embed/watch?v=yu74Y1ndd5w&list=PLFIM0718LjIUBrbm6Gdh6k7ZUvPIAZm7p&index=10', 'Setiap selector css yang kita buat memiliki berat yang berbeda, berat tersebut menentukan seberapa spesifik selector yang kita buat. Semakin spesifik, maka style yang dibuat akan semakin berpengaruh.\r\n\r\ncontohnya jika kita membuat selector dengan elemen HTML maka beratnya adalah 1, jika dengan class maka 10 kali lipat lebih berat dan jika dengan id 100 kali lipat lebih berat.\r\n\r\ndi video ini akan dijelaskan maksud dari berat masing-masing selector dan bagaimana cara menghitungnya\r\n\r\n--\r\n\r\nKalkulator untuk menghitung specificity :\r\nhttp://specificity.keegan.st​\r\n\r\nArtikel mengenai specificity :\r\n- http://www.smashingmagazine.com/2007/...​\r\n- http://www.w3.org/TR/CSS2/cascade.html​\r\n- https://css-tricks.com/specifics-on-c...​\r\n\r\n-- \r\n\r\nBGM : \"Time Immemorial\" by. Chris Davidson\r\nhttp://freeplaymusic.com/volumedetail...​\r\n\r\n--\r\n\r\nJangan lupa untuk follow juga akun media sosial kita yang lain :\r\n\r\n- https://www.facebook.com/WebProgrammi...​\r\n- http://twitter.com/pw1unpas​\r\n- http://instagram.com/webprogrammingunpas​\r\n- http://codepen.io/webprogrammingunpas​\r\n- http://www.unpas.ac.id​\r\n\r\nterimakasih dan selamat #ngoding​!\r\n\r\n@sandhikagalih', 1, '2021-03-01 14:57:48'),
(47, 31, 'Tutorial Konfigurasi SAMBA Server Debian 8', 'https://www.youtube.com/embed/watch?v=HGfwlkLrmxE&list=PLyp4MKRqQ-j1GEASJcN52JjjrlbhKc4Nr', 'Ini adalah toturial konfigurasi SAMBA Server Debian 8 yang di buat di aplikasi Virtual Box,selamat menyaksikan dan jangan lupa untuk klik Like & Subscribe.', 1, '2021-03-01 15:06:27'),
(48, 31, 'Tutorial Konfigurasi DHCP Server Debian 8', 'https://www.youtube.com/embed/watch?v=oUYr6THlIhw&list=PLyp4MKRqQ-j1GEASJcN52JjjrlbhKc4Nr&index=2', 'Ini adalah video tutorial konfigurasi DHCP Server di Debian 8 menggunakan aplikasi Virtual Box.\r\nSelamat belajar dan jangan lupa untuk COMENT, LIKE dan SUBSCRIBE.', 1, '2021-03-01 15:07:32'),
(49, 31, 'Tutorial Konfigurasi VPN Server Debian 8', 'https://www.youtube.com/embed/watch?v=ErQXcwkxq5k&list=PLyp4MKRqQ-j1GEASJcN52JjjrlbhKc4Nr&index=3', 'Ini adalah tutorial konfigurasi VPN Server Debian 8, selamat mencoba.', 1, '2021-03-01 15:09:18'),
(50, 31, 'Tutorial Konfigurasi FTP Server Debian 8', 'https://www.youtube.com/embed/watch?v=hr5cdMInkjA&list=PLyp4MKRqQ-j1GEASJcN52JjjrlbhKc4Nr&index=4', 'Tutorial Konfigurasi FTP Server Debian 8', 1, '2021-03-01 15:10:18'),
(51, 31, 'Tutorial Konfigurasi WEB Server Debian 8', 'https://www.youtube.com/embed/watch?v=957dtQ3quRs&list=PLyp4MKRqQ-j1GEASJcN52JjjrlbhKc4Nr&index=5', 'Link pembahasan : http://panjultips.com/2021/02/21/konf...', 1, '2021-03-01 15:11:48'),
(52, 31, 'Tutorial Konfigurasi DNS Server Debian 8', 'https://www.youtube.com/embed/watch?v=-Z55e2440SY&list=PLyp4MKRqQ-j1GEASJcN52JjjrlbhKc4Nr&index=6', 'Link pembahasan : http://panjultips.com/2021/02/21/konf...​\r\n\r\nWebsite : www.panjultips.com\r\n', 1, '2021-03-01 15:13:15'),
(53, 31, 'Tutorial Konfigurasi DATABASE Server Debian 8', 'https://www.youtube.com/embed/watch?v=E3ecJyE7dh8&list=PLyp4MKRqQ-j1GEASJcN52JjjrlbhKc4Nr&index=7', 'Video ini membahas konfigurasi Database Server Mysql dan Phpmyadmin,juga di tambah konfigurasi DNS dan Web Server.', 1, '2021-03-01 15:14:04'),
(54, 31, 'Tutorial Konfigurasi MAIL dan WEB MAIL Server Debian 8', 'https://www.youtube.com/embed/watch?v=o2nGeqY-c-E&list=PLyp4MKRqQ-j1GEASJcN52JjjrlbhKc4Nr&index=8', 'Video ini membahas konfigurasi Mail dan Web Mail Server, juga di tambah konfigurasi DNS dan Web Server.', 1, '2021-03-01 15:15:58'),
(55, 31, 'Tutorial Konfigurasi Monitoring Server CACTI Debian 8', 'https://www.youtube.com/embed/watch?v=L5pF7-cNOS4&list=PLyp4MKRqQ-j1GEASJcN52JjjrlbhKc4Nr&index=9', 'Ini adalah video instalasi dan konfigurasi CACTI Server Debian 8.', 1, '2021-03-01 15:16:48'),
(56, 31, 'Tutorial Instalasi Debian 8 Mode Text', 'https://www.youtube.com/embed/watch?v=30yeDX2DyfQ&list=PLyp4MKRqQ-j1GEASJcN52JjjrlbhKc4Nr&index=10', 'Ini adalah video instalasi sistem operasi Debian 8 Mode Text,jangan lupa untuk mematikan koneksi internet anda sebelum melakukan instalasi.', 1, '2021-03-01 15:19:22'),
(57, 33, '01 Installasi Windows Server 2016', 'https://www.youtube.com/embed/watch?v=qnNokaBPGg4&list=PLJGji3QDg91GJh0fNlEfffc1Z214Yt2bX&index=1', 'Panduan installasi Sistem Operasi Windows 2016 server', 1, '2021-03-01 15:29:44'),
(58, 33, '02 Active Directory - Domain Service Windows Server 2016', 'https://www.youtube.com/embed/watch?v=WTra0HtCC9c&list=PLJGji3QDg91GJh0fNlEfffc1Z214Yt2bX&index=2', 'Active Directory Directory adalah adalah sebuah layanan (services) dari Windows Server yang digunakan untuk mengelola aturan (policy), hak akses (priviledges) beserta hal-hal yang berkaitan dengan security lainnya dari pengguna (user) ataupun komputer pada seluruh jaringan di perusahaan.\r\n\r\nDengan Active Directory, administrator dapat melakukan beberapa hal berikut ini:\r\n\r\n1. Mengatur apa saja yang boleh atau tidak boleh dilakukan oleh sebuah komputer pada jaringan milik perusahaan. Contoh: Apakah komputer A boleh digunakan untuk mengakses file pada folder tertentu.\r\n\r\n2. Mengatur apa saja yang boleh atau tidak boleh dilakukan oleh sebuah komputer pada jaringan milik perusahaan. Contoh: Apakah komputer A boleh digunakan untuk mengakses file pada folder tertentu.\r\n\r\n3. Mengatur bagaimana mekanisme akses jaringan komputer antara kantor pusat dan kantor cabang, induk perusahaan dengan anak perusahaan atau antar kantor lainnya yang bersifat remote. Contoh: Apakah pengguna di kantor wilayah A bisa mengakses kantor wilayah B.', 1, '2021-03-01 15:30:57'),
(59, 33, '03 Join Domain & DHCP Server Configuration - Windows Server 2016', 'https://www.youtube.com/embed/watch?v=ushLaXuk8sA&list=PLJGji3QDg91GJh0fNlEfffc1Z214Yt2bX&index=3', 'DHCP (merupakan kependekan dari Dynamic Host Configuration Protocol) adalah salah satu protocol pada jaringan komputer yang dapat memberikan atau meminjamkan IP address terhadap host yang berada dalam satu jaringan secara otomatis.\r\nDHCP server merupakan komputer yang berfungsi memberi pinjaman IP address ke host yang ada. Sedangkan host yang mendapat pinjaman IP address dari DHCP server tersebut biasa disebut DHCP Client.', 1, '2021-03-01 15:32:06'),
(60, 33, '04 Konfigurasi Layanan DNS Server - Windows Server 2016', 'https://www.youtube.com/embed/watch?v=sfVaxEMAEkE&list=PLJGji3QDg91GJh0fNlEfffc1Z214Yt2bX&index=4', 'DNS merupakan kependekan dari Domain Name System atau ada yang menyebut Domain Name Service. DNS adalah sebuah sistem yang menerjemahkan alamat domainmenjadi IP address.\r\n\r\nDNS server adalah server yang dapat melayani permintaan dari client untuk mengetahui alamat yang digunakan oleh sebuah domain. Jadi, misalnya kita ingin mengakses sebuah website, maka server DNS akan mencari alamat dari website agar komputer kita dapat terhubung dengan server tersebut', 1, '2021-03-01 15:33:18'),
(61, 33, '05 Konfigurasi Active Directory User & Group - Windows Server 2016', 'https://www.youtube.com/embed/watch?v=UmGDA3vsBU4&list=PLJGji3QDg91GJh0fNlEfffc1Z214Yt2bX&index=5', 'merupakan salah satu fitur tambahan dari Active Directory yang dapat mengklasifikasikan user berdasarkan Organization Unit, Group dan User, sehingga seluruh user account dari seluruh user yang terhubung ke server AD dapat dimanage oleh melalui Server Windows 2016', 1, '2021-03-01 15:34:27'),
(62, 33, '06 Installasi & Konfigurasi Web Server IIS (Internet Information Service) - Windows Server 2016', 'https://www.youtube.com/embed/watch?v=vhe-qvZdXR8&list=PLJGji3QDg91GJh0fNlEfffc1Z214Yt2bX&index=6', 'Internet Information Services atau Internet Information Server adalah sebuah HTTP web server yang digunakan dalam sistem operasi server Windows, mulai dari Windows NT 4.0 Server, Windows 2000 Server atau Windows Server 2003. Layanan ini merupakan layanan terintegrasi dalam Windows 2000 Server, Windows Server 2003 atau sebagai add-on dalam Windows NT 4.0. Layanan ini berfungsi sebagai pendukung protokol TCP/IP yang berjalan dalam lapisan aplikasi (application layer). IIS juga menjadi fondasi dari platform Internet dan Intranet Microsoft, yang mencakup Microsoft Site Server, Microsoft Commercial Internet System dan produk-produk Microsoft BackOffice lainnya.', 1, '2021-03-01 15:37:56'),
(63, 33, '07 Installasi & Konfigurasi DFS (Distributed File System) - Windows Server 2016', 'https://www.youtube.com/embed/watch?v=_BdrOoLXtS4&list=PLJGji3QDg91GJh0fNlEfffc1Z214Yt2bX&index=7', 'Distributed File System (DFS) adalah satu set layanan klien dan server yang memungkinkan organisasi yang menggunakan Microsoft Windows server untuk mengatur banyak didistribusikan SMB file ke sebuah sistem berkas terdistribusi . DFS memberikan transparansi lokasi dan redundansi untuk meningkatkan ketersediaan data dalam menghadapi kegagalan atau beban berat dengan memungkinkan di beberapa lokasi yang berbeda untuk secara logis dikelompokkan dalam satu folder, atau root DFS.', 1, '2021-03-01 15:38:47'),
(64, 33, '08 Installasi & Konfigurasi File Server Resource Manager (FSRM) - Windows Server 2016', 'https://www.youtube.com/embed/watch?v=KMrL3lUPByw&list=PLJGji3QDg91GJh0fNlEfffc1Z214Yt2bX&index=8', 'Sebuah fitur manajemen keamanan file dan data pada server Windows, yang memiliki berbagai fitur keamanan diantaranya, manajamene file, manajemen kuota dan manajemen filtering file type & directory....', 1, '2021-03-01 15:39:48'),
(65, 33, '09 Installasi & Konfigurasi Active Directory Certificate Service - Windows Server 2016', 'https://www.youtube.com/embed/watch?v=JRvS8g3SR3c&list=PLJGji3QDg91GJh0fNlEfffc1Z214Yt2bX&index=9', 'Certificates Authority(CA) merupakan sebuah entity untuk meng-issue sertifikat ke individual, komputer, organisasi dan services.CA dapat berfungsi untuk beberapa hal, yaitu mengidentifikasi siapa yang meminta sertifikat tersebut, issue sertikat untuk user, komputer dan services, memanage pembatalan sertifikat. Ketika kita pertama kali membuat CA maka dinamakan CA root sedangkan selanjutnya kita namakan Subordinate CA.\r\n\r\nPada AD CS juga terdapat yang namanya Digital Certificate, Digital Certificate merupakan sertifikat yang terdiri dari file digital yang mempunyai 2 bagian, yaitu public key dan private key, keduanya digunakan untuk encrypt dan decrypt data, ketika kita menggunakan private key untuk enkripsi data maka kita bisa men decrypt nya dengan menggunakan public key.', 1, '2021-03-01 15:40:55'),
(66, 33, '10 Konfigurasi Layanan HTTPS Self Sign In Certificate - Windows Server 2016', 'https://www.youtube.com/embed/watch?v=OAyjYmX3IeM&list=PLJGji3QDg91GJh0fNlEfffc1Z214Yt2bX&index=10', 'HTTPS dapat diartikan sebagai bentuk protokol valid dan aman. Hal ini di sebabkan perintah dan data melalui protokol HTTPS ini telah di lindungi dengan sistem encryp melalui berbagai format, sehingga ini akan menyulitkan bagi orang-orang yang ingin membajak isi dari dokumen yang dikirim dengan menggunakan media HTTPS.\r\n\r\nDapat dipahami juga bahwa HTTPS merupakan gabungan dari HTTP dengan SSL(Secure Socket Layer) / TLS(Transport Layer Security) protokol. Seluruh komunikasi yang dilakukan melalui HTTPS akan dienkripsi dan di analisa dengan tujuan untuk keamanan ketika terjadi transaksi data melaui internet.', 1, '2021-03-01 15:41:47'),
(67, 33, '11 Konfigurasi Routing & Remote Access RRAS VPN - Windows Server 2016', 'https://www.youtube.com/watch?v=8NtHftxMU3s&list=PLJGji3QDg91GJh0fNlEfffc1Z214Yt2bX&index=11', 'RRAS (Routing & Remote Access) adalah salah satu fitur pada Windows Server yang dapat melakukan manajemen remote jaringan dengan aman (Virtual Private Network) melalui jaringan internet (global) sehingga komunikasi dapat terjalin (tunneling) dengan aman (terenkripsi)\r\n', 1, '2021-03-01 15:42:28'),
(68, 35, 'Tutorial photoshop untuk pemula (Part 1)', 'https://www.youtube.com/embed/watch?v=A9pWXs_2QD4&list=PL0b-LAqb4awiCjxr1fxju0duKfSC8PCr8&index=1', 'Selamat Datang di Channel Youtube Mas Aji.\r\nSilahkan Like, Komen dan Subscribe untuk menonton video-video tutorial selanjutnya.\r\nTerimakasih\r\n\r\nPastikan teman-teman semua SUBSCRIBE ke channel saya di: https://bit.ly/398ZXuq​\r\n\r\nDOWNLOAD BAHAN LATIHAN: https://www.mediafire.com/file/syc0dk...​\r\n\r\nTutorial photoshop pemula sampai mahir (Part 1)\r\nTutorial photoshop pemula sampai mahir (Part 1)\r\nTutorial photoshop pemula sampai mahir (Part 1)\r\nBELAJAR PHOTOSHOP DARI YANG PALING DASAR\r\nDi video saya kali ini saya akan mencoba menjelaskan cara mudah belajar photoshop step by step dimulai dari yang paling dasar yaitu pengenalan tool-tool serta fungsinya. Rencananya video akan saya bikin per part dan saya mulai dari part 1 ini sampai part, part berikutnya. di video part 1 ini saya membahas tentang penggunaan move tool, rectangular marquee tool, elliptical marquee tool, lasso tool, polygonal lasso tool dan magnetic lasso tool. disini saya juga menjelaskan fungsi dari masing2 tool tersebut. saya berharap setelah teman2 melihat dan mempraktekan video ini teman2 nanti bisa mengolah gambar sendiri serta bisa membuat design sendiri menggunakan photoshop. nah bagi teman2 yang mau belajar photoshop dari yang paling dasar bisa ikuti channel saya dengan cara subscribe, like, komen ataupun share. teman2 juga bisa meninggalkan kritik dan saran yang sifatnya membangun agar kedepannya saya bisa menyuguhkan video2 tutorial yang lebih berkualitas lagi.', 1, '2021-03-01 18:18:39'),
(69, 35, 'Tutorial photoshop untuk pemula (Part 2)', 'https://www.youtube.com/embed/watch?v=ufH3OtFPoyk&list=PL0b-LAqb4awiCjxr1fxju0duKfSC8PCr8&index=2', 'Selamat Datang di Channel Youtube Mas Aji.\r\nSilahkan Like, Komen dan Subscribe untuk menonton video-video tutorial selanjutnya.\r\nTerimakasih\r\n\r\nPastikan teman-teman semua SUBSCRIBE ke channel saya di: https://bit.ly/398ZXuq​\r\n\r\nDOWNLOAD BAHAN LATIHAN: https://www.mediafire.com/file/csl8ws...​\r\n\r\nTutorial photoshop pemula sampai mahir (Part 2)\r\nTutorial photoshop pemula sampai mahir (Part 2)\r\nTutorial photoshop pemula sampai mahir (Part 2)\r\nMelanjutkan video tutorial saya yang kemarin yaitu belajar dasar-dasar photoshop part 1, di video saya kali ini yaitu belajar dasar-dasar photoshop part 2, saya akan mencoba menjelaskan pengenalan Quick selection tool, magic wand tool, crop tool serta eyedropper tool serta fungsi dari masing-masing tool tersebut. So, buat teman2 yang mau belajar photoshop mulai dari yang paling dasar jangan lupa mampir ke channel youtube saya ya. Tenang aja semuanya gratis. teman2 juga bisa tanya2 saya dikolom komentar ya. Semua video yang  sudah saya upload sudah saya bikin per kategori untuk memudahkan teman2 yang mau belajar.', 1, '2021-03-01 18:22:22'),
(70, 35, 'Tutorial photoshop untuk pemula (Part 3)', 'https://www.youtube.com/embed/watch?v=Hi8lekJB9fM&list=PL0b-LAqb4awiCjxr1fxju0duKfSC8PCr8&index=3', 'Selamat Datang di Channel Youtube Mas Aji.\r\nSilahkan Like, Komen dan Subscribe untuk menonton video-video tutorial selanjutnya.\r\nTerimakasih\r\n\r\nPastikan teman-teman semua SUBSCRIBE ke channel saya di: https://bit.ly/398ZXuq​\r\n\r\nDOWNLOAD BAHAN LATIHAN: https://www.mediafire.com/file/uuojur...​\r\n\r\nTutorial photoshop pemula sampai mahir (Part 3)\r\nTutorial photoshop pemula sampai mahir (Part 3)\r\nTutorial photoshop pemula sampai mahir (Part 3)\r\n\r\nTerimakasih buat teman2 yang sudah menonton video saya. Melanjutkan video tutorial saya yang kemarin yaitu belajar dasar-dasar photoshop part 2, di video saya kali ini yaitu belajar dasar-dasar photoshop part 3, saya akan mencoba menjelaskan pengenalan Spot Healing Brush Tool, Patch Tool, Brush Tool, cara Install Brush, Clone Stamp tool serta fungsi dari masing-masing tool-tool tersebut. So, buat teman2 yang mau belajar photoshop gratis mulai dari yang paling dasar jangan lupa mampir ke channel youtube saya ya. saya berharap setelah teman-teman menonton dan mempraktekan video2 tutorial saya teman-teman nanti bisa mengolah foto sendiri serta membuat design sendiri menggunakan photoshop. Semua video sudah saya bikin per kategori untuk memudahkan teman2 yang mau belajar khususnya photoshop.', 1, '2021-03-01 18:25:32'),
(71, 35, 'Tutorial photoshop untuk pemula (Part 4)', 'https://www.youtube.com/embed/watch?v=zrz2IlvaUF4&list=PL0b-LAqb4awiCjxr1fxju0duKfSC8PCr8&index=4', 'Selamat Datang di Channel Youtube Mas Aji.\r\nSilahkan Like, Komen dan Subscribe untuk menonton video-video tutorial selanjutnya.\r\nTerimakasih\r\n\r\nPastikan teman-teman semua SUBSCRIBE ke channel saya di: https://bit.ly/398ZXuq​\r\n\r\nDOWNLOAD BAHAN LATIHAN: https://www.mediafire.com/file/icsral...​\r\n\r\nTutorial photoshop pemula sampai mahir (Part 4)\r\nTutorial photoshop pemula sampai mahir (Part 4)\r\nTutorial photoshop pemula sampai mahir (Part 4)\r\nBELAJAR PHOTOSHOP DARI YANG PALING DASAR\r\nDi video saya kali ini saya akan mencoba menjelaskan cara mudah belajar photoshop step by step dimulai dari yang paling dasar yaitu pengenalan tool-tool serta fungsinya. Rencananya video akan saya bikin per part dan saya mulai dari part 1 sampai part, part berikutnya. nah di video part 4  ini saya akan membahas tentang  eraser tool, gradient tool  serta paint bucket tool. disini saya juga menjelaskan fungsi dari masing2 tool tersebut. saya berharap setelah teman2 melihat dan mempraktekan video ini teman2 nanti bisa mengolah gambar sendiri serta bisa membuat design sendiri menggunakan photoshop. nah bagi teman2 yang mau belajar photoshop dari yang paling dasar bisa ikuti channel youtube saya dengan cara subscribe, like, komen ataupun share. teman-teman  juga bisa meninggalkan kritik dan saran yang sifatnya membangun agar kedepannya saya bisa menyuguhkan video2 tutorial yang lebih berkualitas lagi.', 1, '2021-03-01 18:27:07'),
(72, 35, 'Tutorial photoshop untuk pemula (Part 5)', 'https://www.youtube.com/embed/watch?v=-YMHce0TgiI&list=PL0b-LAqb4awiCjxr1fxju0duKfSC8PCr8&index=5', 'Selamat Datang di Channel Youtube Mas Aji.\r\nSilahkan Like, Komen dan Subscribe untuk menonton video-video tutorial selanjutnya.\r\nTerimakasih\r\n\r\nPastikan teman-teman semua SUBSCRIBE ke channel saya di: https://bit.ly/398ZXuq​\r\n\r\nDOWNLOAD BAHAN LATIHAN: https://www.mediafire.com/file/7yykrw...​\r\n\r\nTutorial photoshop pemula sampai mahir (Part 5)\r\nTutorial photoshop pemula sampai mahir (Part 5)\r\nTutorial photoshop pemula sampai mahir (Part 5)\r\nBELAJAR PHOTOSHOP DARI YANG PALING DASAR\r\nDi video saya kali ini saya akan mencoba menjelaskan cara mudah belajar photoshop step by step dimulai dari yang paling dasar yaitu pengenalan tool-tool serta fungsinya. Rencananya video akan saya bikin per part dan saya mulai dari part 1 sampai part, part berikutnya. nah di video tutorial part 5  ini saya akan membahas tentang  Blur Tool, Sharpen Tool, Smudge Tool, Dodge Tool, Burn Tool serta Sponge Tool. disini saya juga akan menjelaskan fungsi dari masing2 tool tersebut. saya berharap setelah teman2 menonton dan mempraktekan video ini teman2 nanti bisa mengolah gambar sendiri serta bisa membuat design sendiri menggunakan photoshop. nah bagi teman2 yang mau belajar photoshop dari yang paling dasar bisa ikuti channel youtube saya dengan cara subscribe, like, komen ataupun share ke sosial media kalian. teman-teman  juga bisa meninggalkan kritik dan saran yang sifatnya membangun agar kedepannya saya bisa membuat video2 tutorial yang lebih berkualitas lagi.', 1, '2021-03-01 18:28:53'),
(73, 35, ' Tutorial photoshop untuk pemula (Part 6)', 'https://www.youtube.com/embed/watch?v=0MUawUBSmlM&list=PL0b-LAqb4awiCjxr1fxju0duKfSC8PCr8&index=6', 'Selamat Datang di Channel Youtube Mas Aji.\r\nSilahkan Like, Komen dan Subscribe untuk menonton video-video tutorial selanjutnya.\r\nTerimakasih\r\n\r\nPastikan teman-teman semua SUBSCRIBE ke channel saya di: https://bit.ly/398ZXuq​\r\n\r\nDOWNLOAD BAHAN LATIHAN: https://www.mediafire.com/file/7zd0zh...​\r\n\r\nTutorial photoshop pemula sampai mahir (Part 6)\r\nTutorial photoshop pemula sampai mahir (Part 6)\r\nTutorial photoshop pemula sampai mahir (Part 6)\r\nBELAJAR PHOTOSHOP DARI YANG PALING DASAR\r\nDi video saya kali ini saya akan mencoba menjelaskan cara mudah belajar photoshop step by step dimulai dari yang paling dasar yaitu pengenalan tool-tool serta fungsinya. Rencananya video akan saya bikin per part dan saya mulai dari part 1 sampai part, part berikutnya. nah di video tutorial part 6 ini saya akan membahas tentang Pen Tool, Freeform Pen Tool, Add Anchor Poin Tool, Delete Anchor Point Tool, Convert Poin Tool, Path Selection Tool, Direct Selection Tool, Horizontal Type Tool, Vertical Type Tool, Horizontal Type Mask Tool, Vertical TypeMask Tool. \r\n\r\nFungsi dari masing-masing dari Tool tersebut adalah : \r\nPen Tool :  Digunakan untuk membuat kurva atau garis pada gambar secara bebas.\r\nFreeform Pen Tool : Digunakan untuk membuat garis pada gambar dengan lebih lembut.\r\nAdd  Anchor Point Tool : Digunakan untuk memberi titik pada kurva yang berfungsi untuk mengedit path garis. \r\nDelete Anchor Point Tool : Digunakan untuk menghapus titik pada kurva yang telah ada pada path sebelumnya.\r\nConvert Poin Tool : Digunakan untuk mengubah tampilan garis path dengan cara menggeser nya. \r\nPath Selection Tool : Digunakan untuk membuat seleksi pada path.\r\nDirect Selection Tool : Digunakan untuk membuat titik anchor pada path.\r\nHorizontal Type Tool : Digunakan untuk membuat text secara horizontal.\r\nVertical Type Tool : Digunakan untuk membuat text secara vertical.\r\nHorizontal Type Mask Tool: digunakan untuk menyeleksi text secara horizontal.\r\nVertical Type Tool : Digunakan untuk menyeleksi text secara vertical. \r\n\r\nnah bagi teman2 yang mau belajar photoshop dari yang paling dasar bisa ikuti channel youtube saya ya dengan cara subscribe, like, komen ataupun share ke sosial media kalian. teman-teman  juga bisa meninggalkan kritik dan saran yang sifatnya membangun agar kedepannya saya bisa membuat video2 tutorial yang lebih berkualitas lagi. Untuk lebih jelasnya teman-teman bisa tonton videonya sampai selesai ya dan jangan di SKIP.', 1, '2021-03-01 18:30:19'),
(74, 35, 'Tutorial photoshop untuk pemula (Part 7)', 'https://www.youtube.com/embed/watch?v=U5b_RAjya-Q&list=PL0b-LAqb4awiCjxr1fxju0duKfSC8PCr8&index=7', 'Selamat Datang di Channel Youtube Mas Aji.\r\nSilahkan Like, Komen dan Subscribe untuk menonton video-video tutorial selanjutnya.\r\nTerimakasih\r\n\r\nPastikan teman-teman semua SUBSCRIBE ke channel saya di: https://bit.ly/398ZXuq​\r\n\r\nDOWNLOAD BAHAN LATIHAN: https://www.mediafire.com/file/gqtwua...​\r\n\r\nTutorial photoshop pemula sampai mahir (Part 7)\r\nTutorial photoshop pemula sampai mahir (Part 7)\r\nTutorial photoshop pemula sampai mahir (Part 7)\r\nBELAJAR PHOTOSHOP DARI YANG PALING DASAR\r\nDi video saya kali ini saya akan mencoba menjelaskan cara mudah belajar photoshop step by step dimulai dari yang paling dasar yaitu pengenalan tool-tool serta fungsinya. Rencananya video akan saya bikin per part dan saya mulai dari part 1 sampai part, part berikutnya. nah di video tutorial part 7 ini saya akan membahas tentang Shape Tool Yang meliputi : Rectangle Tool, Rounded Rectangle Tool, Ellipse Tool, Polygon Tool, Line Tool Dan Custom Shape Tool Serta bagaimana cara menggunakan masing-masing Tool tersebut. Saya juga akan membahas Combine Shapes, Subtract Front Shape, Intersect Shapes Areas, Exclude Overlapping Shapes, Merge Shape Components Serta cara kerjanya. \r\n\r\nUntuk Lebih jelasnya teman-teman bisa tonton videonya sampai selesai dan jangan di SKIP ya.\r\n', 1, '2021-03-01 18:31:48');
INSERT INTO `videos` (`id`, `id_playlist`, `nama`, `link_video`, `deskripsi`, `status`, `created_at`) VALUES
(75, 35, 'Tutorial photoshop untuk pemula (Part 8)', 'https://www.youtube.com/embed/watch?v=u8e6IzQnNFk&list=PL0b-LAqb4awiCjxr1fxju0duKfSC8PCr8&index=8', 'Selamat Datang di Channel Youtube Mas Aji.\r\nSilahkan Like, Komen dan Subscribe untuk menonton video-video tutorial selanjutnya.\r\nTerimakasih\r\n\r\nPastikan teman-teman semua SUBSCRIBE ke channel saya di: https://bit.ly/398ZXuq​\r\n\r\nDOWNLOAD BAHAN LATIHAN: https://www.mediafire.com/file/ifcy0y...​\r\n\r\nTutorial photoshop pemula sampai mahir (Part 8)\r\nTutorial photoshop pemula sampai mahir (Part 8)\r\nTutorial photoshop pemula sampai mahir (Part 8)\r\nBELAJAR PHOTOSHOP DARI YANG PALING DASAR\r\nDi video saya kali ini saya akan mencoba menjelaskan cara mudah belajar photoshop step by step dimulai dari yang paling dasar yaitu pengenalan tool-tool serta fungsinya. Rencananya video akan saya bikin per part dan saya mulai dari part 1 sampai part - part berikutnya. nah di video tutorial part 8 ini saya akan membahas tentang Hand Tool, Rotate View Tool, Zoom Tool, Zoom in Tool, Zoom Out Tool, Save, Save As, Export, Place Embedded, Automate Serta bagaimana cara menggunakan masing-masing Tool tersebut. \r\n\r\nUntuk Lebih jelasnya teman-teman bisa tonton videonya sampai selesai dan jangan di SKIP ya', 1, '2021-03-01 18:33:55'),
(76, 35, 'Tutorial photoshop untuk pemula (Part 9)', 'https://www.youtube.com/embed/watch?v=h9a7srzTylI&list=PL0b-LAqb4awiCjxr1fxju0duKfSC8PCr8&index=9', 'Selamat Datang di Channel Youtube Mas Aji.\r\nSilahkan Like, Komen dan Subscribe untuk menonton video-video tutorial selanjutnya.\r\nTerimakasih\r\n\r\nPastikan teman-teman semua SUBSCRIBE ke channel saya di: https://bit.ly/398ZXuq​\r\n\r\nDOWNLOAD BAHAN LATIHAN: https://www.mediafire.com/file/l4l843...​\r\n\r\nTutorial photoshop pemula sampai mahir (Part 9)\r\nTutorial photoshop pemula sampai mahir (Part 9)\r\nTutorial photoshop pemula sampai mahir (Part 9)\r\nBELAJAR PHOTOSHOP DARI YANG PALING DASAR\r\nDi video saya kali ini saya akan mencoba menjelaskan cara mudah belajar photoshop step by step dimulai dari yang paling dasar yaitu pengenalan tool-tool serta fungsinya. Rencananya video akan saya bikin per part dan saya mulai dari part 1 sampai part - part berikutnya. nah di video tutorial part 9 ini saya akan membahas tentang Check Spelling, Find and Replace Text, Fill, Stroke, Content-Aware Scale, Puppet Warp  Serta bagaimana cara menggunakan masing-masing Tool tersebut. Untuk lebih jelasnya teman-teman bisa tonton videonya sampai selesai dan jangan di SKIP ya.', 1, '2021-03-01 18:37:02'),
(77, 35, 'Tutorial photoshop untuk pemula (Part 10)', 'https://www.youtube.com/embed/watch?v=2xWszbwyRUo&list=PL0b-LAqb4awiCjxr1fxju0duKfSC8PCr8&index=10', 'Selamat Datang di Channel Youtube Mas Aji.\r\nSilahkan Like, Komen dan Subscribe untuk menonton video-video tutorial selanjutnya.\r\nTerimakasih\r\n\r\nPastikan teman-teman semua SUBSCRIBE ke channel saya di: https://bit.ly/398ZXuq​\r\n\r\nDOWNLOAD BAHAN LATIHAN: https://www.mediafire.com/file/ih7fbr...​\r\n\r\nTutorial photoshop pemula sampai mahir (Part 10)\r\nTutorial photoshop pemula sampai mahir (Part 10)\r\nTutorial photoshop pemula sampai mahir (Part 10)\r\nBELAJAR PHOTOSHOP DARI YANG PALING DASAR\r\nHallo Assalamualaikum Wr.Wb teman-teman semuanya, kembali lagi di channel youtube saya, yaitu Channel youtubenya Mas Aji. Memenuhi Request dari salah satu teman kita yang menanyakan kelanjutan dari Video tutorial belajar dasar-dasar photoshop part 9, maka hari ini saya lanjutkan untuk video tutorial Belajar daras-Dasar Photoshop Part 10. Nahhh...Di video saya kali ini saya akan mencoba menjelaskan apa itu Perspective Warp, Free Transform, Transform Yang Meliputi: Scale, Rotate, Skew, Distort, Perspective, Warp Serta bagaimana cara menggunakan masing-masing Tool tersebut. Untuk lebih jelasnya teman-teman bisa tonton videonya sampai selesai dan jangan di SKIP ya.', 1, '2021-03-01 18:38:18'),
(78, 36, 'belajar CISCO CCNA Network Engineer bagian #1', 'https://www.youtube.com/embed/watch?v=0z7LQL2pRe0&list=PLJGji3QDg91Grv-oT6bN51nKdpmvg_v-i&index=1', 'Dokumentasi Belajar Cisco CCNA Network Engineer\r\nSupport terus, dengan share video ini, like, dan subscribe,...\r\ndan berikan kritik, masukkan dan sarannya bro...', 1, '2021-03-01 20:12:05'),
(79, 36, 'belajar CISCO CCNA Network Engineer bagian #2', 'https://www.youtube.com/embed/watch?v=FBPi7uFOcSw&list=PLJGji3QDg91Grv-oT6bN51nKdpmvg_v-i&index=3', 'Dokumentasi Belajar Cisco CCNA Network Engineer', 1, '2021-03-01 20:20:44'),
(80, 36, 'belajar CISCO CCNA Network Engineer bagian #3', 'https://www.youtube.com/embed/watch?v=rhQcpapGua8&list=PLJGji3QDg91Grv-oT6bN51nKdpmvg_v-i&index=4', 'Dokumentasi Belajar Cisco CCNA Network Engineer', 1, '2021-03-01 20:21:47'),
(81, 36, 'belajar CISCO CCNA Network Engineer bagian #4', 'https://www.youtube.com/embed/watch?v=Bu6nJiz-57Y&list=PLJGji3QDg91Grv-oT6bN51nKdpmvg_v-i&index=7', 'Dokumentasi Belajar Cisco CCNA Network Engineer', 1, '2021-03-01 20:22:50'),
(82, 36, 'belajar CISCO CCNA Network Engineer bagian #5', 'https://www.youtube.com/embed/watch?v=bgqoDH5RUww&list=PLJGji3QDg91Grv-oT6bN51nKdpmvg_v-i&index=10', 'Support terus, dengan share video ini, like, dan subscribe,...\r\ndan berikan kritik, masukkan dan sarannya bro...', 1, '2021-03-01 20:24:06'),
(83, 36, 'belajar CISCO CCNA Network Engineer bagian #6', 'https://www.youtube.com/embed/watch?v=lRt9SwPpLZg&list=PLJGji3QDg91Grv-oT6bN51nKdpmvg_v-i&index=13', 'Support terus, dengan share video ini, like, dan subscribe,...\r\ndan berikan kritik, masukkan dan sarannya bro...', 1, '2021-03-01 20:25:24'),
(84, 36, 'belajar CISCO CCNA Network Engineer bagian #7', 'https://www.youtube.com/embed/watch?v=9vbnuAoNNE0&list=PLJGji3QDg91Grv-oT6bN51nKdpmvg_v-i&index=16', 'Support terus, dengan share video ini, like, dan subscribe,...\r\ndan berikan kritik, masukkan dan sarannya bro...', 1, '2021-03-01 20:26:58'),
(85, 36, 'belajar CISCO CCNA Network Engineer bagian #8', 'https://www.youtube.com/watch?v=yvPhXS-nsW4&list=PLJGji3QDg91Grv-oT6bN51nKdpmvg_v-i&index=19', 'Support terus, dengan share video ini, like, dan subscribe,...\r\ndan berikan kritik, masukkan dan sarannya bro...', 1, '2021-03-01 20:28:56'),
(86, 37, '#1 APA ITU GIT & GITHUB?', 'https://www.youtube.com/embed/watch?v=lTMZxWMjXQU&list=PLFIM0718LjIVknj6sgsSceMqlq242-jNf&index=1', 'Di video ini kita akan memulai sebuah seri baru mengenai GIT & GITHUB', 1, '2021-03-01 23:36:40'),
(87, 37, '#2 BEKERJA DENGAN GITHUB', 'https://www.youtube.com/embed/watch?v=Q3Id0DgcrXY&list=PLFIM0718LjIVknj6sgsSceMqlq242-jNf&index=2', 'Kali ini kita akan bersama2 belajar mengenai GitHub, membuat akun, repository dan commit pertama kita..', 1, '2021-03-01 23:39:15'),
(88, 37, '#3 GITHUB : BRANCH', 'https://www.youtube.com/embed/watch?v=k1QXd-8VbPY&list=PLFIM0718LjIVknj6sgsSceMqlq242-jNf&index=3', 'Di video kali ini kita akan belajar mengenai konsep Branch yang ada pada GITHUB', 1, '2021-03-01 23:40:16'),
(89, 37, '#4 GITHUB : FORK', 'https://www.youtube.com/embed/watch?v=8rry2ncZmfg&list=PLFIM0718LjIVknj6sgsSceMqlq242-jNf&index=4', 'Mempelajari mengenai konsep FORK / FORKING pada Git & GitHub', 1, '2021-03-01 23:43:04'),
(90, 37, '#5 BEKERJA DENGAN GIT', 'https://www.youtube.com/embed/watch?v=e-6OkXRqWaE&list=PLFIM0718LjIVknj6sgsSceMqlq242-jNf&index=5', 'Kali ini kita akan mulai belajar menggunakan GIT di komputer kita secara lokal', 1, '2021-03-01 23:43:59'),
(91, 37, '#6 GIT BRANCH & MERGE', 'https://www.youtube.com/embed/watch?v=EGl7KxVOyNs&list=PLFIM0718LjIVknj6sgsSceMqlq242-jNf&index=6', 'Di video kali ini kita akan belajar melakukan Git BRANCH dan Git MERGE pada Repository kita', 1, '2021-03-01 23:46:13'),
(92, 37, '#7 GIT MERGE CONFLICT', 'https://www.youtube.com/embed/watch?v=Vfwfeve72PA&list=PLFIM0718LjIVknj6sgsSceMqlq242-jNf&index=7', 'Melakukan MERGE CONFLICT pada git secara lokal, juga kita akan mempelajari sesuatu yang disebut dengan DETACHED HEAD saat kita checkout ke sebuah commit', 1, '2021-03-01 23:47:19'),
(93, 37, '#8 GIT REMOTE', 'https://www.youtube.com/embed/watch?v=ppi_M-FX1CY&list=PLFIM0718LjIVknj6sgsSceMqlq242-jNf&index=8', 'Di video ini kita masuk belajar mengenai GIT REMOTE untuk menghubungkan repo lokal kita dengan GITHUB', 1, '2021-03-01 23:49:04'),
(94, 27, 'Tutorial Komputer Akuntansi - Cara Install Aplikasi MYOB V18 Ed', 'https://www.youtube.com/embed/watch?v=EwRgBCGLB1g&list=PLQ8IO3_IKT3zo6gg4lE71-yxWRYPXmT-W&index=1', 'Kami menyajikan video pembelajaran melalui seri tutorial Komputer Akuntansi tentang bagaimana ccara install aplikasi MYOB v18 Ed. Perangkat ini sangat dibutuhkan oleh siswa dan siswi serta mahasiswa yang sedang belajar pada kompetensi keahlian Keuangan, Perbankan dan Akuntansi. Semoga bermanfaat!\r\n\r\nLink download aplikasi MYOB versi 18 Ed: bit.ly/AKMYOB18ED\r\n\r\nDukung dan support terus channel Dapur Gaptek untuk terus maju berkarya, berbagi ilmu dan memberi manfaat untuk Youtuber semua. \r\nBeri Saya Support dan Dukungan: https://sociabuzz.com/primewibawa/tribe​\r\n', 1, '2021-03-02 12:48:10'),
(95, 27, 'Tutorial Komputer Akuntansi - Cara Mengatasi Aplikasi MYOB yang Diblokir Window 10', 'https://www.youtube.com/embed/watch?v=-_AMyPHqZFs&list=PLQ8IO3_IKT3zo6gg4lE71-yxWRYPXmT-W&index=2', 'Berikut ini adalah video pembelajaran seri tutorial komputer akuntansi tentang bagaimana cara mengatasi MYOB yang diblokir window 10. Gimana solusinya. Silahkan disimak videonya!\r\n\r\nDukung dan support terus channel Dapur Gaptek untuk terus maju berkarya, berbagi ilmu dan memberi manfaat untuk Youtuber semua. \r\nBeri Saya Support dan Dukungan: https://sociabuzz.com/primewibawa/tribe', 1, '2021-03-02 12:49:17'),
(96, 27, 'Tutorial Komputer Akuntansi - Cara Membuat Profil Perusahaan Baru pada MYOB', 'https://www.youtube.com/embed/watch?v=Pg6varZuw4I&list=PLQ8IO3_IKT3zo6gg4lE71-yxWRYPXmT-W&index=3', 'Berikut ini adalah video pembelajaran seri tutorial komputer akuntansi tentang bagaimana cara membuat profil perusahaan baru pada MYOB. Simak videonya ya!\r\n\r\nDukung dan support terus channel Dapur Gaptek untuk terus maju berkarya, berbagi ilmu dan memberi manfaat untuk Youtuber semua. \r\nBeri Saya Support dan Dukungan: https://sociabuzz.com/primewibawa/tribe', 1, '2021-03-02 12:50:04'),
(97, 38, 'Kas dan Piutang | Akuntansi Keuangan Menengah | Cash and Receivables | Intermediate Accounting', 'https://www.youtube.com/embed/watch?v=AQcFetyzwvI&list=PL0tS1ou_AQQ072mfUbL1DuZ5FoRl74Qbx&index=1', 'Hallo guys. Di video kali ini, kita bakal bahas mata kuliah Intermediate Accounting 1 dengan fokus materi Cash and Receivables. Materi ini akan membantu kalian buat bedain antara cash, cash equivalents dan non cash serta bagaimana suatu perusahaan melakukan penjualan dan penyerahan piutang.\r\n\r\nBuku acuan yang digunakan adalah 3rd edition Intermediate Accounting IFRS edition karangan Wiley, tepatnya di chapter 7\r\n\r\nThank you for watching and keep learn!', 1, '2021-03-02 13:02:03'),
(98, 38, 'Gross Profit & Retail Inventory Method (Soal dan Pembahasan) | Intermediate Accounting', 'https://www.youtube.com/embed/watch?v=sWwU7SQA3A8&list=PL0tS1ou_AQQ072mfUbL1DuZ5FoRl74Qbx&index=2', 'Hallo guys. Di video kali ini, kita bakal bahas pertanyaan terkait mata kuliah Intermediate Accounting 1  yaitu perbedaan gross profit method dan retail inventory method yang sama-sana merupakan valuation of ending inventory \r\nVideo ini akan membantu kalian buat bedain antara gross profit method dan retail inventory method yang membuat kalian ambigu karena terlihat sama-sama metode penilaian persediaan akhir\r\n\r\nBuku acuan yang digunakan adalah 3rd edition Intermediate Accounting IFRS edition karangan Wiley\r\n\r\nThank you for watching and keep learn!', 1, '2021-03-02 13:03:10'),
(99, 38, 'Laporan Keuangan | Income Statement and Related Information | Akuntansi Keuangan Menengah', 'https://www.youtube.com/embed/watch?v=21wSr4wJIfM&list=PL0tS1ou_AQQ072mfUbL1DuZ5FoRl74Qbx&index=3', 'Hi guys. Di video kali ini, kita bakal bahas mata kuliah Intermediate Accounting 1 dengan fokus materi Income Statements and Related Information. Materi ini akan membahas kenapa suatu perusahaan harus membuat income statements, komponen yang ada di dalam laporan tsb dan bagaimana cara menyusun income statement. \r\n\r\nBuku acuan yang digunakan adalah 3rd edition Intermediate Accounting IFRS edition karangan Wiley.\r\n\r\nThank you for watching and keep learn!\r\nRemember this 👉 \"slowly but sure\" 😊', 1, '2021-03-02 13:04:11'),
(100, 38, 'LCNRV & NRV | Valuasi Persediaan | Intermediate Accounting | Akuntansi Keuangan Menengah', 'https://www.youtube.com/embed/watch?v=psKUrw2YPPY&list=PL0tS1ou_AQQ072mfUbL1DuZ5FoRl74Qbx&index=4', 'Hallo guys. Di video kali ini, kita bakal bahas pertanyaan sejuta umat terkait mata kuliah Intermediate Accounting 1  materi Valuation of Inventories: Special Issues yaitu LCNRV ini. Video ini akan membantu kalian buat bedain antara LCNRV dan NRV yang membuat kalian ambigu karena terlihat sama!\r\n\r\nBuku acuan yang digunakan adalah 3rd edition Intermediate Accounting IFRS edition karangan Wiley\r\n\r\nThank you for watching and keep learn!', 1, '2021-03-02 13:05:43'),
(101, 38, 'Intangible Assets | Aset Tak Berwujud | Intermediate Accounting | Akuntansi Keuangan Menengah', 'https://www.youtube.com/embed/watch?v=mrj7rhsJruQ&list=PL0tS1ou_AQQ072mfUbL1DuZ5FoRl74Qbx&index=5', 'Di video kali ini, kita bakal bahas mata kuliah Intermediate Accounting  materi Intangible Assets. Buku acuan yang digunakan adalah Intermediate Accounting, 3rd Edition, IFRS Edition.\r\n\r\nTutor: Nathaniel Archel\r\n', 1, '2021-03-02 13:06:49'),
(102, 38, 'Statement of Financial Position (SOFP) | Laporan Posisi Keuangan | Akuntansi Keuangan Menengah', 'https://www.youtube.com/embed/watch?v=jn6SuVHShrw&list=PL0tS1ou_AQQ072mfUbL1DuZ5FoRl74Qbx&index=6', 'Di video kali ini, kita bakal bahas mata kuliah Intermediate Accounting  materi SOFP (Statement of Financial Position) atau Laporan Posisi Keuangan. Buku acuan yang digunakan adalah Intermediate Accounting, 3rd Edition, IFRS Edition.\r\n\r\nTutor: Nathaniel Archel', 1, '2021-03-02 13:07:54'),
(103, 39, 'Cara Instal Office 365 dan Cara Aktivasinya', 'https://www.youtube.com/embed/watch?v=RPwy3FQTXIU&list=PLYMJJHENUMwziULU06HC1tZSPKavVuePn&index=1', 'Pada Video kali ini saya akan membahas tentang cara Install Office 365 dan Cara Aktivasinya. Office 365 adalah sebuah software Office yang didalamnya terdapat Office Word, Excel, Powerpoint seperti Office lainnya, namun terdapat banyak Fitur didalamnya..\r\n\r\nApa saja fitur Office 365, Cara Installasi dan Cara Aktivasinya?\r\nSilahkan simak Video tutorial diatas ya..', 1, '2021-03-02 17:27:47'),
(104, 39, 'Cara Setting Email Outlook Office 365', 'https://www.youtube.com/embed/watch?v=QjiZAaPRyIE&list=PLYMJJHENUMwziULU06HC1tZSPKavVuePn&index=3', 'Pada video kali ini saya akan membahas tentang cara setting email outlook office 365. login yang kita gunakan adalah menggunakan akun Office 365.\r\n\r\nsemoga bermanfaat ya teman2..', 1, '2021-03-02 17:28:49'),
(105, 39, 'Cara Membuat Signature Email Outlook 365', 'https://www.youtube.com/embed/watch?v=YIRuDJ_9f2c&list=PLYMJJHENUMwziULU06HC1tZSPKavVuePn&index=4', 'Pada Video kali ini saya akan membahas tentang cara membuat Signature atau Tanda tangan pada Office Outlook 365. Fungsi signature adalah sebuah template agar ketika membuat email baru atau meReply email atau memforward email maka anda tidak usah membuat Signature, anda cukup membuat sekali dan nanti akan otomatis muncul ketika akan mebuat sebuah email', 1, '2021-03-02 17:31:08'),
(106, 39, 'Cara Membuat Rules EMail Outlook Office 365', 'https://www.youtube.com/embed/watch?v=Sv14LBRZyVY&list=PLYMJJHENUMwziULU06HC1tZSPKavVuePn&index=5', 'Pada video kali ini saya akan membahas tentang cara membuat rules pada email outlook Office 365. Rules pada email outlook banyak manfaatnya ya, ada banyak template rules yang bisa di manfaatkan pada email outlook.\r\n\r\nPada video ini saya menggunakan outlook Office 365, bagi anda yang menggunakan Outlook Office versi 203, 2016 atau 2019 sama saja ya... mungkin hanya tampilannya saja yang sedikit berbeda.', 1, '2021-03-02 17:32:15'),
(107, 39, 'Cara Download Offline Installer Office 365', 'https://www.youtube.com/embed/watch?v=6b2ps19DfOI&list=PLYMJJHENUMwziULU06HC1tZSPKavVuePn&index=7', 'Pada Video tutorial kali ini akan dibahas mengenai Cara Membackup Email Outlook Office 365 secara Offline. selain cara backup di Video kali ini juga dijelaskan cara bekerja Offline Office 365.', 1, '2021-03-02 17:33:26'),
(108, 39, 'Cara Backup Offline Email Outlook Office 365', 'https://www.youtube.com/embed/watch?v=6b2ps19DfOI&list=PLYMJJHENUMwziULU06HC1tZSPKavVuePn&index=7', 'Pada Video tutorial kali ini akan dibahas mengenai Cara Membackup Email Outlook Office 365 secara Offline. selain cara backup di Video kali ini juga dijelaskan cara bekerja Offline Office 365.', 1, '2021-03-02 17:34:50'),
(109, 39, 'Kamu Harus Tau Manfaat Dari Office 365 ?', 'https://www.youtube.com/embed/watch?v=0m0z35NWgQ0&list=PLYMJJHENUMwziULU06HC1tZSPKavVuePn&index=8', 'Pada Video kali ini saya akan membahas tentang Manfaat dari Micrososft Office 365. Setelah saya menggunakan Office 365 ternyata manfaat banyak lagi temen2.. Manfaat atau keunggunalan apa saja yang bisa temen2 dapat ? silahkan simak video diatas.\r\n', 1, '2021-03-02 17:35:45');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_category` (`id_category`);

--
-- Indeks untuk tabel `playlist_tags`
--
ALTER TABLE `playlist_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tag` (`id_tag`),
  ADD KEY `id_playlist` (`id_playlist`);

--
-- Indeks untuk tabel `popular`
--
ALTER TABLE `popular`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_playlist` (`id_playlist`);

--
-- Indeks untuk tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_detail`
--
ALTER TABLE `user_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_playlist` (`id_playlist`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `playlist_tags`
--
ALTER TABLE `playlist_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `popular`
--
ALTER TABLE `popular`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `user_detail`
--
ALTER TABLE `user_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `playlists`
--
ALTER TABLE `playlists`
  ADD CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `playlists_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `playlists_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `playlists_ibfk_4` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `playlists_ibfk_5` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `playlists_ibfk_6` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`);

--
-- Ketidakleluasaan untuk tabel `playlist_tags`
--
ALTER TABLE `playlist_tags`
  ADD CONSTRAINT `playlist_tags_ibfk_1` FOREIGN KEY (`id_playlist`) REFERENCES `playlists` (`id`),
  ADD CONSTRAINT `playlist_tags_ibfk_2` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id`),
  ADD CONSTRAINT `playlist_tags_ibfk_3` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id`),
  ADD CONSTRAINT `playlist_tags_ibfk_4` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id`),
  ADD CONSTRAINT `playlist_tags_ibfk_5` FOREIGN KEY (`id_playlist`) REFERENCES `playlists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `popular`
--
ALTER TABLE `popular`
  ADD CONSTRAINT `popular_ibfk_1` FOREIGN KEY (`id_playlist`) REFERENCES `playlists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user_detail`
--
ALTER TABLE `user_detail`
  ADD CONSTRAINT `user_detail_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`id_playlist`) REFERENCES `playlists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

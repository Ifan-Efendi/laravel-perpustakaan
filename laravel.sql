-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2025 at 07:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_buku` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `pengarang` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `tahun_terbit` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'In Stock',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `stok` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `kode_buku`, `judul`, `pengarang`, `penerbit`, `tahun_terbit`, `deskripsi`, `gambar`, `status`, `created_at`, `updated_at`, `lokasi`, `stok`) VALUES
(1, 'LSK-01', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', 'Kisah inspiratif tentang perjuangan 10 anak di Belitung untuk mendapatkan pendidikan, despite all the odds. Buku ini celebrate mimpi dan semangat pantang menyerah.', '1751782915.jpg', 'Tersedia', '2025-07-05 23:20:38', '2025-07-14 21:21:02', 'Rak A1', 16),
(2, 'HJN-01', 'Hujan', 'Tere Liye', 'Gramedia Pustaka', '2016', 'Novel science fiction-romance yang menceritakan Lail dan Esok di masa depan, di tengah bencana besar. It\'s about love, loss, and letting go — penuh emosi dan refleksi.', '1751782924.jpg', 'In Stock', '2025-07-05 23:20:38', '2025-07-14 08:13:19', 'Rak A2', 20),
(3, 'JNJ-01', 'Janji', 'Tere Liye', 'Tere Liye', '2021', 'Buku ini berisi kumpulan kisah dan quotes tentang janji, harapan, dan keikhlasan. Simple words but deep meanings, cocok buat yang suka merenung.', '1751782936.png', 'dipinjam', '2025-07-05 23:20:38', '2025-07-14 08:13:55', 'Rak B3', 25),
(5, 'PBO-01', 'PBO', 'Syafei Karim', 'Tanesa', '2021', 'Membahas konsep OOP (Object-Oriented Programming) seperti class, object, inheritance, dan polymorphism. Suitable for anyone yang mau bikin program lebih terstruktur dan reusable.', '1751782962.jpg', 'In Stock', '2025-07-05 23:20:38', '2025-07-14 22:27:47', 'C6', 22),
(7, 'MDL-01', 'Madilog', 'Tan Malaka', 'Gramedia', '1943', 'Karya filsafat dan logika yang membahas Materialisme, Dialektika, dan Logika. Buku ini mengajak berpikir kritis, \"think out of the box\" dengan pendekatan ilmiah.', '1751783375.jpg', 'In Stock', '2025-07-05 23:29:35', '2025-07-14 08:14:42', 'Rak B4', 30);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Novel', 'Kumpulan Novel', '2025-07-05 23:20:38', '2025-07-05 23:20:38'),
(2, 'Pelajaran', 'Kumpulan Buku materi pelajaran', '2025-07-05 23:20:38', '2025-07-05 23:20:38'),
(3, 'Romance', NULL, '2025-07-05 23:20:38', '2025-07-14 05:01:12'),
(4, 'Drama', NULL, '2025-07-05 23:20:38', '2025-07-05 23:20:38'),
(5, 'Fiksi', NULL, '2025-07-05 23:20:38', '2025-07-05 23:20:38'),
(6, 'Pemrograman', NULL, '2025-07-05 23:20:38', '2025-07-14 05:01:27'),
(7, 'Science', NULL, '2025-07-05 23:20:38', '2025-07-05 23:20:38'),
(8, 'Horror', NULL, '2025-07-05 23:20:38', '2025-07-05 23:20:38'),
(9, 'Filsafat', NULL, '2025-07-05 23:28:46', '2025-07-05 23:28:46');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_buku`
--

CREATE TABLE `kategori_buku` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `buku_id` bigint(20) UNSIGNED NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_buku`
--

INSERT INTO `kategori_buku` (`id`, `buku_id`, `kategori_id`, `created_at`, `updated_at`) VALUES
(1, 7, 9, NULL, NULL),
(4, 2, 3, NULL, NULL),
(5, 3, 4, NULL, NULL),
(9, 5, 2, NULL, NULL),
(10, 1, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_10_01_082706_create_kategori_table', 1),
(6, '2022_10_01_163210_create_buku_table', 1),
(7, '2022_10_18_021326_create_profile_table', 1),
(8, '2022_11_01_074316_create_kategori_buku_table', 1),
(9, '2022_11_15_000415_create_riwayat_pinjam_table', 1),
(10, '2025_07_14_103422_add_lokasi_to_buku_table', 2),
(11, '2025_07_14_112818_add_lokasi_fix_to_buku_table', 3),
(12, '2025_07_14_122435_add_stok_to_buku_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `npm` varchar(255) NOT NULL,
  `prodi` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `noTelp` varchar(255) NOT NULL,
  `photoProfile` varchar(255) DEFAULT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `npm`, `prodi`, `alamat`, `noTelp`, `photoProfile`, `users_id`, `created_at`, `updated_at`) VALUES
(1, '12345678', 'Teknik Informatika', 'Bandung', '08123456789', NULL, 1, '2025-07-05 23:20:38', '2025-07-14 04:59:21'),
(8, '22552011108', 'Teknik Informatika', 'Bandung', '082211910320', NULL, 8, '2025-07-14 05:08:02', '2025-07-14 05:08:02'),
(9, '22552011238', 'Teknik Informatika', 'Bandung', '08123456789', NULL, 9, '2025-07-14 22:35:40', '2025-07-14 22:35:40'),
(10, '22552011094', 'Teknik Informatika', 'Bandung', '08123456789', NULL, 10, '2025-07-14 22:36:33', '2025-07-14 22:36:33'),
(11, '22552011214', 'Teknik Informatika', 'Bandung', '08123456789', NULL, 11, '2025-07-14 22:37:06', '2025-07-14 22:37:06'),
(12, '22552011120', 'Teknik Informatika', 'Bandung', '08123456789', NULL, 12, '2025-07-14 22:37:37', '2025-07-14 22:37:37'),
(13, '20552011102', 'Teknik Informatika', 'Bandung', '08123456789', NULL, 13, '2025-07-14 22:38:26', '2025-07-14 22:38:26'),
(14, '22552011243', 'Teknik Informatika', 'Bandung', '08123456789', NULL, 14, '2025-07-14 22:39:03', '2025-07-14 22:39:03'),
(15, '22552011310', 'Teknik Informatika', 'Bandung', '08123456789', NULL, 15, '2025-07-14 22:39:36', '2025-07-14 22:39:36');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_pinjam`
--

CREATE TABLE `riwayat_pinjam` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `buku_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_wajib_kembali` date NOT NULL,
  `tanggal_pengembalian` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `riwayat_pinjam`
--

INSERT INTO `riwayat_pinjam` (`id`, `users_id`, `buku_id`, `tanggal_pinjam`, `tanggal_wajib_kembali`, `tanggal_pengembalian`, `created_at`, `updated_at`) VALUES
(2, 8, 1, '2025-07-14', '2025-07-21', '2025-07-15', '2025-07-14 05:47:55', '2025-07-14 21:21:02'),
(4, 8, 5, '2025-07-15', '2025-07-22', NULL, '2025-07-14 22:27:47', '2025-07-14 22:27:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `isAdmin`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$FrhywvZHfp4C1afO493RfOgRXb.EG3hHdicoBJdC2Vq4JGmx.S8QC', 1, '2025-07-05 23:20:37', '2025-07-05 23:20:37'),
(8, 'Irfan', 'irfan@gmail.com', '$2y$10$18lfPlpP.VQ13Z7ggyXXa.JjVK83Lph2Lq3ZBMIOMMbupltBMtmp6', 0, '2025-07-14 05:08:02', '2025-07-14 05:08:02'),
(9, 'Ifan', 'ifan@gmail.com', '$2y$10$WJFZ6FlGD9NYE7ARCTfhounrRWN1v4cRMJfcG85Y3sngWCncWWJjy', 0, '2025-07-14 22:35:40', '2025-07-14 22:35:40'),
(10, 'Fauzi', 'fauzi@gmail.com', '$2y$10$8JrMnPOeXr63DD5XDsZOnelIVxBt10EuVmAUIoAXTf4xaXsEUBBYm', 0, '2025-07-14 22:36:33', '2025-07-14 22:36:33'),
(11, 'Reppy', 'reppy@gmail.com', '$2y$10$MimGg9C89XxShDJSvBDLzOJgeRFktdvhszi/3UprDzvWX6azzO0du', 0, '2025-07-14 22:37:06', '2025-07-14 22:37:06'),
(12, 'Dian', 'dian@gmail.com', '$2y$10$BicN1M3/N/.NCa6x.51fmOV0w2vmGTWNqXYP/a3Cw1DYMsIfyb4bm', 0, '2025-07-14 22:37:37', '2025-07-14 22:37:37'),
(13, 'Aang', 'aang@gmail.com', '$2y$10$YA70nn0CIdXyIoJ.lZw/reCc5NINc3Kff70hFkuRRBOQZ0Sa0JpUK', 0, '2025-07-14 22:38:26', '2025-07-14 22:38:26'),
(14, 'Zaenal', 'zaenal@gmail.com', '$2y$10$kAiAjaRk5mIMHGA/1yGly.jPbv6mwUwCAAwWRFs2jkkhtQDtS8SdK', 0, '2025-07-14 22:39:03', '2025-07-14 22:39:03'),
(15, 'Ilham', 'ilham@gmail.com', '$2y$10$SBNiHk7xHSl14VMevtA2ouaXuesAviHVLjLoMsuMWYZwtzPWhj3oq', 0, '2025-07-14 22:39:36', '2025-07-14 22:39:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `buku_kode_buku_unique` (`kode_buku`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_buku`
--
ALTER TABLE `kategori_buku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_buku_buku_id_foreign` (`buku_id`),
  ADD KEY `kategori_buku_kategori_id_foreign` (`kategori_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `profile_npm_unique` (`npm`),
  ADD KEY `profile_users_id_foreign` (`users_id`);

--
-- Indexes for table `riwayat_pinjam`
--
ALTER TABLE `riwayat_pinjam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `riwayat_pinjam_users_id_foreign` (`users_id`),
  ADD KEY `riwayat_pinjam_buku_id_foreign` (`buku_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kategori_buku`
--
ALTER TABLE `kategori_buku`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `riwayat_pinjam`
--
ALTER TABLE `riwayat_pinjam`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kategori_buku`
--
ALTER TABLE `kategori_buku`
  ADD CONSTRAINT `kategori_buku_buku_id_foreign` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kategori_buku_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `riwayat_pinjam`
--
ALTER TABLE `riwayat_pinjam`
  ADD CONSTRAINT `riwayat_pinjam_buku_id_foreign` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `riwayat_pinjam_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

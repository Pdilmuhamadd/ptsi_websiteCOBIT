-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2025 at 06:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `example_app_cadangan`
--

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
  `id_kategori` int(10) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(4, 'perencanaan', '2024-07-16 00:30:21', '2024-07-16 00:30:21'),
(5, 'perbaikan', '2024-07-16 01:06:30', '2024-07-16 01:06:39');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id_member` int(10) UNSIGNED NOT NULL,
  `kode_member` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text DEFAULT NULL,
  `telepon` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_03_05_194740_tambah_kolom_baru_to_users_table', 1),
(7, '2021_03_05_195441_buat_kategori_table', 1),
(8, '2021_03_05_195949_buat_produk_table', 1),
(9, '2021_03_05_200515_buat_member_table', 1),
(10, '2021_03_05_200706_buat_supplier_table', 1),
(11, '2021_03_05_200841_buat_pembelian_table', 1),
(12, '2021_03_05_200845_buat_pembelian_detail_table', 1),
(13, '2021_03_05_200853_buat_penjualan_table', 1),
(14, '2021_03_05_200858_buat_penjualan_detail_table', 1),
(15, '2021_03_05_200904_buat_setting_table', 1),
(16, '2021_03_05_201756_buat_pengeluaran_table', 1),
(17, '2021_03_11_225128_create_sessions_table', 1),
(18, '2021_03_24_115009_tambah_foreign_key_to_produk_table', 1),
(19, '2021_03_24_131829_tambah_kode_produk_to_produk_table', 1),
(20, '2021_05_08_220315_tambah_diskon_to_setting_table', 1),
(21, '2021_05_09_124745_edit_id_member_to_penjualan_table', 1),
(22, '2024_07_12_015727_create_proyeks_table', 2),
(23, '2024_07_17_071528_create_trx_perencanaan_proyek_table', 3),
(24, '2024_07_17_165804_create_trx_desain_sistem_table', 4),
(25, '2024_07_18_005342_create_trx_post_implementation_review__table', 5),
(26, '2024_07_18_013842_create_trx__analisis__kebutuhan_table', 6),
(27, '2024_07_18_061500_create_trx_pengujian_table', 7),
(28, '2024_07_17_071528_create_trx_permintaan_pengembangan_table', 8),
(29, '2024_07_17_165804_create_trx_perencanaan_kebutuhan_table', 9),
(30, '2024_07_19_025329_create_trx_analisis_desain_table', 10),
(31, '2024_07_19_064559_create_trx_perencanaan_proyek_table', 11),
(32, '2024_07_24_015125_create_trx_persetujuan_pengembangan_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `mst_persetujuan`
--

CREATE TABLE `mst_persetujuan` (
  `id_mst_persetujuan` int(10) UNSIGNED NOT NULL,
  `nama_persetujuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `mst_persetujuan`
--

INSERT INTO `mst_persetujuan` (`id_mst_persetujuan`, `nama_persetujuan`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Setuju', NULL, NULL, NULL, NULL),
(2, 'Revisi', NULL, NULL, NULL, NULL),
(3, 'Ditolak', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mst_persetujuanalasan`
--

CREATE TABLE `mst_persetujuanalasan` (
  `id_mst_persetujuanalasan` int(10) UNSIGNED NOT NULL,
  `id_mst_persetujuan` int(11) DEFAULT NULL,
  `nama_alasan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `mst_persetujuanalasan`
--

INSERT INTO `mst_persetujuanalasan` (`id_mst_persetujuanalasan`, `id_mst_persetujuan`, `nama_alasan`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 'Sesuai dengan Visi, Misi dan Tujuan Perusahaan (RJPP)', NULL, NULL, NULL, NULL),
(2, 1, 'Sesuai dengan Program Kerja/Master Plan (RKAP)', NULL, NULL, NULL, NULL),
(3, 1, 'Sesuai dengan kepatuhan Regulasi, Kebijakan, atau Prosedur', NULL, NULL, NULL, NULL),
(4, 2, 'Tidak sesuai dengan Visi, Misi dan Tujuan Perusahaan (RJPP)', NULL, NULL, NULL, NULL),
(5, 2, 'Tidak sesuai dengan Program Kerja/Master Plan (RKAP)', NULL, NULL, NULL, NULL),
(6, 2, 'Tidak sesuai dengan kepatuhan Regulasi, Kebijakan, atau Prosedur', NULL, NULL, NULL, NULL),
(7, 2, 'Ketiadaan anggaran/sumber daya', NULL, NULL, NULL, NULL),
(8, 3, 'Lampiran tidak lengkap', NULL, NULL, NULL, NULL),
(9, 3, 'Informasi perlu diperjelas/dilengkapi', NULL, NULL, NULL, NULL);

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
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(10) UNSIGNED NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `total_item` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `diskon` tinyint(4) NOT NULL DEFAULT 0,
  `bayar` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_detail`
--

CREATE TABLE `pembelian_detail` (
  `id_pembelian_detail` int(10) UNSIGNED NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id_pengeluaran` int(10) UNSIGNED NOT NULL,
  `deskripsi` text NOT NULL,
  `nominal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(10) UNSIGNED NOT NULL,
  `id_member` int(11) DEFAULT NULL,
  `total_item` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `diskon` tinyint(4) NOT NULL DEFAULT 0,
  `bayar` int(11) NOT NULL DEFAULT 0,
  `diterima` int(11) NOT NULL DEFAULT 0,
  `id_user` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_member`, `total_item`, `total_harga`, `diskon`, `bayar`, `diterima`, `id_user`, `created_at`, `updated_at`) VALUES
(1, NULL, 0, 0, 0, 0, 0, 1, '2024-07-11 20:44:12', '2024-07-11 20:44:12'),
(2, NULL, 0, 0, 0, 0, 0, 1, '2024-07-15 01:30:43', '2024-07-15 01:30:43'),
(3, NULL, 0, 0, 0, 0, 0, 1, '2024-07-22 23:37:23', '2024-07-22 23:37:23');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `id_penjualan_detail` int(10) UNSIGNED NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `diskon` tinyint(4) NOT NULL DEFAULT 0,
  `subtotal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(10) UNSIGNED NOT NULL,
  `id_kategori` int(10) UNSIGNED NOT NULL,
  `kode_produk` varchar(255) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `merk` varchar(255) DEFAULT NULL,
  `harga_beli` int(11) NOT NULL,
  `diskon` tinyint(4) NOT NULL DEFAULT 0,
  `harga_jual` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `kode_produk`, `nama_produk`, `merk`, `harga_beli`, `diskon`, `harga_jual`, `stok`, `created_at`, `updated_at`) VALUES
(2, 4, 'P000001', 'proyek 1', 'soil', 20, 15, 25, 22, '2024-07-24 19:36:58', '2024-07-24 19:36:58'),
(7, 5, 'P000003', 'proyek 9', 'soil', 23, 58, 31, 110, '2024-07-24 19:37:52', '2024-07-24 19:37:52'),
(8, 4, 'P000008', 'proyek 2', 'SOil', 20020, 100, 3004, 850, '2024-07-24 19:38:19', '2024-07-24 19:38:19');

-- --------------------------------------------------------

--
-- Table structure for table `proyeks`
--

CREATE TABLE `proyeks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `mulai` date NOT NULL,
  `target_selesai` date NOT NULL,
  `pm` varchar(255) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `nilai` decimal(15,2) NOT NULL,
  `status` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `sumber_daya` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('GzY1LUCWkR5OduE8tInv574qGh6HFIiLTjSL3wyG', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVjBXMVUwdUo5b1c0bWlZbnhFVFJ3dFcwUmVHRzdtdkdZWEV5aGNGYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wZXJzZXR1anVhbl9wZW5nZW1iYW5nYW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkRUkzNm5lZlBKWmplZkhMeUV5aXFwdUdBcGlLOHBtUGsxaTdsMHJ1UzVOUUJPaUY4Z3hCejYiO30=', 1762936884),
('zXKcXYTBySkVSJzZst0UiTIiaEXj2jq6OCty8qEw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMTJFZWQ3OG5KSjJENXZtcHRCR1lNaEVYcHBIdjBqRDM4NjBpeklBMCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762936468);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(10) UNSIGNED NOT NULL,
  `nama_perusahaan` varchar(255) NOT NULL,
  `alamat` text DEFAULT NULL,
  `telepon` varchar(255) NOT NULL,
  `tipe_nota` tinyint(4) NOT NULL,
  `diskon` smallint(6) NOT NULL DEFAULT 0,
  `path_logo` varchar(255) NOT NULL,
  `path_kartu_member` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id_setting`, `nama_perusahaan`, `alamat`, `telepon`, `tipe_nota`, `diskon`, `path_logo`, `path_kartu_member`, `created_at`, `updated_at`) VALUES
(1, 'PT. Surveyor Indonesia', 'Graha Surveyor Indonesia, 8, Jl. Gatot Subroto No.Kav. 56, RT.1/RW.4, Kuningan Tim., Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12950', '(021) 5265526', 1, 5, '/img/logo-20241218171046.png', '/img/member.png', NULL, '2024-12-18 10:10:46');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text DEFAULT NULL,
  `telepon` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trx_analisis_desain`
--

CREATE TABLE `trx_analisis_desain` (
  `id_analisis_desain` bigint(20) UNSIGNED NOT NULL,
  `nama_proyek` varchar(255) NOT NULL,
  `deskripsi_proyek` varchar(255) NOT NULL,
  `manajer_proyek` varchar(255) NOT NULL,
  `kebutuhan_fungsi` varchar(255) NOT NULL,
  `gambaran_arsitektur` varchar(255) NOT NULL,
  `detil_arsitektur` varchar(255) NOT NULL,
  `lampiran_mockup` varchar(255) NOT NULL,
  `nama_pemohon` varchar(255) NOT NULL,
  `jabatan_pemohon` varchar(255) NOT NULL,
  `tanggal_disiapkan` date NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `tanggal_disetujui` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `file_pdf` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trx_analisis_desain`
--

INSERT INTO `trx_analisis_desain` (`id_analisis_desain`, `nama_proyek`, `deskripsi_proyek`, `manajer_proyek`, `kebutuhan_fungsi`, `gambaran_arsitektur`, `detil_arsitektur`, `lampiran_mockup`, `nama_pemohon`, `jabatan_pemohon`, `tanggal_disiapkan`, `nama`, `jabatan`, `tanggal_disetujui`, `status`, `file_pdf`, `created_at`, `updated_at`) VALUES
(1, 'Pengembangan Sistem Informasi Manajemen Kepegawaian', 'deskripsi proyek pengembangan', 'Bapak Manajer', 'a,b,c,d,e', 'gambaran', 'detail', 'www.link.com,www.figma.com', 'Muhamad Tama', 'Kepala', '2024-07-10', 'Bapak', 'Kepala Cabang', '2024-07-30', 'disetujui', NULL, '2024-07-21 20:41:14', '2024-12-18 12:22:43'),
(6, 'Pengembangan kerangka kerja Teknologi Informasi Manajemen Bisnis dan lainnya', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 'Andi Supriyadi', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 'link www.abcde.com', 'Muhamad Tama', 'jabatan 1', '2024-12-20', 'Aksa', 'jabatan 2', '2024-12-20', 'tidak_disetujui', NULL, '2024-12-18 12:23:30', '2024-12-18 12:23:30');

-- --------------------------------------------------------

--
-- Table structure for table `trx_perencanaan_kebutuhan`
--

CREATE TABLE `trx_perencanaan_kebutuhan` (
  `id_perencanaan_kebutuhan` bigint(20) UNSIGNED NOT NULL,
  `nomor_proyek` text NOT NULL,
  `nama_proyek` text NOT NULL,
  `deskripsi` text NOT NULL,
  `stakeholders` text NOT NULL,
  `kebutuhan_fungsional` text NOT NULL,
  `kebutuhan_nonfungsional` text NOT NULL,
  `lampiran` varchar(255) DEFAULT NULL,
  `nama_pemohon` text NOT NULL,
  `jabatan_pemohon` text NOT NULL,
  `tanggal_disiapkan` date NOT NULL,
  `nama` text NOT NULL,
  `jabatan` text NOT NULL,
  `tanggal_disetujui` date NOT NULL,
  `file_pdf` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trx_perencanaan_kebutuhan`
--

INSERT INTO `trx_perencanaan_kebutuhan` (`id_perencanaan_kebutuhan`, `nomor_proyek`, `nama_proyek`, `deskripsi`, `stakeholders`, `kebutuhan_fungsional`, `kebutuhan_nonfungsional`, `lampiran`, `nama_pemohon`, `jabatan_pemohon`, `tanggal_disiapkan`, `nama`, `jabatan`, `tanggal_disetujui`, `file_pdf`, `created_at`, `updated_at`) VALUES
(1, 'xxxxxxxxx', 'Pengembangan Sistem Informasi Manajemen Kepegawaian', '', 'has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries', 'since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries', 'printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries', 'storage/assets/lampiran/Laporan Kerja Praktik_1301213126.pdf', 'Muhamad Tama', 'Kepala', '2024-12-20', 'Bapak', 'staff', '2024-12-31', 'd', '2024-07-26 03:07:50', '2024-12-17 03:56:00');

-- --------------------------------------------------------

--
-- Table structure for table `trx_perencanaan_proyek`
--

CREATE TABLE `trx_perencanaan_proyek` (
  `id_perencanaan_proyek` bigint(20) UNSIGNED NOT NULL,
  `id_persetujuan_pengembangan` int(11) NOT NULL,
  `nomor_proyek` text NOT NULL,
  `pemilik_proyek` text NOT NULL,
  `manajer_proyek` text NOT NULL,
  `ruang_lingkup` text NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `target_selesai` date NOT NULL,
  `estimasi_biaya` text NOT NULL,
  `nama_pemohon` text NOT NULL,
  `jabatan_pemohon` text NOT NULL,
  `tanggal_disiapkan` date NOT NULL,
  `nama` text NOT NULL,
  `jabatan` text NOT NULL,
  `tanggal_disetujui` date NOT NULL,
  `file_pdf` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trx_perencanaan_proyek`
--

INSERT INTO `trx_perencanaan_proyek` (`id_perencanaan_proyek`, `id_persetujuan_pengembangan`, `nomor_proyek`, `pemilik_proyek`, `manajer_proyek`, `ruang_lingkup`, `tanggal_mulai`, `target_selesai`, `estimasi_biaya`, `nama_pemohon`, `jabatan_pemohon`, `tanggal_disiapkan`, `nama`, `jabatan`, `tanggal_disetujui`, `file_pdf`, `created_at`, `updated_at`) VALUES
(7, 13, 'xxxxxxxxx', 'DMA', 'Andi Supriyadi', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', '2024-12-10', '2025-01-10', '2000000000', 'Aksa', 'Kepala', '2025-01-10', 'Bapak', 'staff', '2024-12-20', NULL, '2024-12-11 11:59:14', '2024-12-11 11:59:14'),
(8, 16, 'xxxxxxxxx', 'DMA', 'Andi Supriyadi', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', '2024-12-20', '2024-12-25', '2000000000', 'Muhamad Tama', 'Kepala', '2024-12-20', 'aksa', 'Kepala Cabang', '2025-01-04', NULL, '2024-12-18 12:22:11', '2024-12-18 12:22:11');

-- --------------------------------------------------------

--
-- Table structure for table `trx_permintaan_pengembangan`
--

CREATE TABLE `trx_permintaan_pengembangan` (
  `id_permintaan_pengembangan` bigint(20) UNSIGNED NOT NULL,
  `nomor_dokumen` varchar(255) NOT NULL,
  `latar_belakang` text NOT NULL,
  `tujuan` text NOT NULL,
  `target_implementasi_sistem` text NOT NULL,
  `fungsi_sistem_informasi` text NOT NULL,
  `jenis_aplikasi` text NOT NULL,
  `pengguna` text NOT NULL,
  `uraian_permintaan_tambahan` text NOT NULL,
  `lampiran` varchar(255) DEFAULT NULL,
  `nama_pemohon` text NOT NULL,
  `jabatan_pemohon` text NOT NULL,
  `tanggal_disiapkan` date NOT NULL,
  `nama` text NOT NULL,
  `jabatan` text NOT NULL,
  `tanggal_disetujui` date NOT NULL,
  `file_pdf` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trx_permintaan_pengembangan`
--

INSERT INTO `trx_permintaan_pengembangan` (`id_permintaan_pengembangan`, `nomor_dokumen`, `latar_belakang`, `tujuan`, `target_implementasi_sistem`, `fungsi_sistem_informasi`, `jenis_aplikasi`, `pengguna`, `uraian_permintaan_tambahan`, `lampiran`, `nama_pemohon`, `jabatan_pemohon`, `tanggal_disiapkan`, `nama`, `jabatan`, `tanggal_disetujui`, `file_pdf`, `created_at`, `updated_at`) VALUES
(19, 'YUrAKl8FUA', 'gUpBHnTshI', 'AMGOiBKFw0', 'Acx7vZjEQi', 'apdOOB9QG3', 'X0cgKtT1Jr', 'NsoBLf5e0s', '0Wx8w2ZxKe', 'SxgVrBdsZHFWbXUHLPDf.png', 'obQLdVtqGV', 'QdFIUwfyDy', '2024-08-07', '8E2wDCju57', 'L5JjjwETH0', '2024-08-23', NULL, '2024-08-13 18:48:33', '2024-08-13 18:48:33'),
(20, 'A20250100', 'pengelolaan Web lama', '2', 'sadsadasdasd', '4', '5', 'adsadsasd', 'adsasdadsasdasdasdasd', 'I5x5wT0LmdqpsTGNbCnJ.pdf', 'adsadfsasf', 'ewferefwferw', '2024-08-15', 'fewfwfwe', 'ketua pp', '2024-08-23', NULL, '2024-08-14 20:48:12', '2024-08-14 20:48:12'),
(23, 'C20240001', 'latar belakang abcdefghijk', 'tujuanya abcdefghijk', 'target implementasi blablabalbal', 'fungsi fungsi sistem informasi abcdefghijk', 'dekstop', 'eksternal', 'uraian berikut blablablbal', 'undefined', 'Muhamad Tama', 'jabatan 1', '2024-08-30', 'aksa', 'kepala_divisi', '2024-09-07', NULL, '2024-08-20 21:11:58', '2024-12-18 12:09:09'),
(26, 'A202409', 'latar belakang dibuatnya proyek adalah abcdefghijk', 'tujuan dari proyek adalah yaitu abcdefghijk', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 'mobile', 'internal', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', '2SPqaTKNVjl1lRVOV1WA.pdf', 'nama 1', 'jabatan 1', '2024-12-10', 'nama 2', 'vp', '2024-12-20', NULL, '2024-12-18 12:10:58', '2024-12-18 12:10:58');

-- --------------------------------------------------------

--
-- Table structure for table `trx_persetujuan_pengembangan`
--

CREATE TABLE `trx_persetujuan_pengembangan` (
  `id_persetujuan_pengembangan` bigint(20) UNSIGNED NOT NULL,
  `id_permintaan_pengembangan` int(10) UNSIGNED NOT NULL,
  `id_mst_persetujuan` int(10) UNSIGNED NOT NULL,
  `id_mst_persetujuanalasan` int(10) UNSIGNED NOT NULL,
  `nama_proyek` text NOT NULL,
  `deskripsi` text NOT NULL,
  `namapemohon` text NOT NULL,
  `namapeninjau` text NOT NULL,
  `jabatanpeninjau` text NOT NULL,
  `namapenyetuju` text NOT NULL,
  `file_pdf` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trx_persetujuan_pengembangan`
--

INSERT INTO `trx_persetujuan_pengembangan` (`id_persetujuan_pengembangan`, `id_permintaan_pengembangan`, `id_mst_persetujuan`, `id_mst_persetujuanalasan`, `nama_proyek`, `deskripsi`, `namapemohon`, `namapeninjau`, `jabatanpeninjau`, `namapenyetuju`, `file_pdf`, `created_at`, `updated_at`) VALUES
(13, 20, 1, 1, 'Pengembangan Sistem Informasi Manajemen Kepegawaian', 'deskripsi proyek blablablablabla', 'Bapak1', 'Bapak2', 'AVP', 'VP', NULL, '2024-08-21 19:21:43', '2024-12-18 13:09:59'),
(16, 23, 1, 9, 'Pengembangan kerangka kerja Teknologi Informasi Manajemen Bisnis dan lainnya', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 'Bapak1', 'Bapak2', 'jabatan 1', 'VP', NULL, '2024-12-18 12:12:08', '2024-12-18 12:12:08');

-- --------------------------------------------------------

--
-- Table structure for table `trx_quality_assurance_testing`
--

CREATE TABLE `trx_quality_assurance_testing` (
  `id_qat` bigint(20) UNSIGNED NOT NULL,
  `nomor_proyek` text NOT NULL,
  `nama_aplikasi` text NOT NULL,
  `jenis_aplikasi` text NOT NULL,
  `unit_pemilik` text NOT NULL,
  `kebutuhan_nonfungsional` text NOT NULL,
  `lokasi_pengujian` text NOT NULL,
  `tgl_pengujian` date NOT NULL,
  `manual_book` text NOT NULL,
  `nama_mengetahui` text NOT NULL,
  `jabatan_mengetahui` text NOT NULL,
  `tgl_diketahui` date NOT NULL,
  `nama_penyetuju` text NOT NULL,
  `jabatan_penyetuju` text NOT NULL,
  `tgl_disetujui` date NOT NULL,
  `file_pdf` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trx_quality_assurance_testing`
--

INSERT INTO `trx_quality_assurance_testing` (`id_qat`, `nomor_proyek`, `nama_aplikasi`, `jenis_aplikasi`, `unit_pemilik`, `kebutuhan_nonfungsional`, `lokasi_pengujian`, `tgl_pengujian`, `manual_book`, `nama_mengetahui`, `jabatan_mengetahui`, `tgl_diketahui`, `nama_penyetuju`, `jabatan_penyetuju`, `tgl_disetujui`, `file_pdf`, `created_at`, `updated_at`) VALUES
(1, 'A20250100', 'Pengembangan aplikasi counter absen', 'dekstop', '1', 'nonfungsi', 'online', '2024-12-27', 'manual 0\'book', '23', '23', '2024-12-04', 'fadhil', 'vp', '2025-01-10', NULL, '2024-08-18 19:20:51', '2024-12-18 12:39:13'),
(2, 'C20240003', 'app informan teknologi', 'mobile', '1', 'nonfungsi', 'online', '2024-12-01', 'book', 'nama 1', 'jabatan 1', '2024-12-20', 'penyetuju 1', 'jabatan penyetuju 1', '2025-01-11', NULL, '2024-12-18 12:29:52', '2024-12-18 12:30:16'),
(3, 'C20240003', 'Pengembangan aplikasi counter absen', 'mobile', 'unit 1', 'nonfungsi', 'online', '2024-12-20', 'manual 0\'book', 'nama 1', 'jabatan 1', '2025-01-11', 'nama penyetuju 1', 'jabatan penyetuju 2', '2024-12-19', NULL, '2024-12-18 12:47:30', '2024-12-18 12:47:45');

-- --------------------------------------------------------

--
-- Table structure for table `trx_serah_terima_aplikasi`
--

CREATE TABLE `trx_serah_terima_aplikasi` (
  `id_serah_terima_aplikasi` bigint(20) UNSIGNED NOT NULL,
  `hari` text NOT NULL,
  `tanggal` text NOT NULL,
  `deskripsi` text NOT NULL,
  `lokasi` text NOT NULL,
  `nama_aplikasi` text NOT NULL,
  `no_permintaan` text NOT NULL,
  `keterangan` text NOT NULL,
  `pemberi` text NOT NULL,
  `penerima` text NOT NULL,
  `nik_pemberi` text NOT NULL,
  `nik_penerima` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trx_serah_terima_aplikasi`
--

INSERT INTO `trx_serah_terima_aplikasi` (`id_serah_terima_aplikasi`, `hari`, `tanggal`, `deskripsi`, `lokasi`, `nama_aplikasi`, `no_permintaan`, `keterangan`, `pemberi`, `penerima`, `nik_pemberi`, `nik_penerima`, `created_at`, `updated_at`) VALUES
(2, 'Senin', '2024-08-30', 'deskripsi dari proyek yang dibuat blabalbal', 'online', 'app informan', '11223344556677899', 'baik', 'bapak 1', 'bapak 2', '1301213032', '1301213311', '2024-08-19 00:00:04', '2024-08-19 00:00:04');

-- --------------------------------------------------------

--
-- Table structure for table `trx_user_acceptance_testing`
--

CREATE TABLE `trx_user_acceptance_testing` (
  `id_user_acceptance_testing` bigint(20) UNSIGNED NOT NULL,
  `nomor_proyek` text NOT NULL,
  `nama_aplikasi` text NOT NULL,
  `jenis_aplikasi` text NOT NULL,
  `kebutuhan_fungsional` text NOT NULL,
  `kebutuhan_nonfungsional` text NOT NULL,
  `unit_pemilik_proses_bisnis` text NOT NULL,
  `lokasi_pengujian` text NOT NULL,
  `tgl_pengujian` date NOT NULL,
  `manual_book` text NOT NULL,
  `nama_penyusun` text NOT NULL,
  `jabatan_penyusun` text NOT NULL,
  `tgl_disusun` date NOT NULL,
  `nama_penyetuju` text NOT NULL,
  `jabatan_penyetuju` text NOT NULL,
  `tanggal_disetujui` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trx_user_acceptance_testing`
--

INSERT INTO `trx_user_acceptance_testing` (`id_user_acceptance_testing`, `nomor_proyek`, `nama_aplikasi`, `jenis_aplikasi`, `kebutuhan_fungsional`, `kebutuhan_nonfungsional`, `unit_pemilik_proses_bisnis`, `lokasi_pengujian`, `tgl_pengujian`, `manual_book`, `nama_penyusun`, `jabatan_penyusun`, `tgl_disusun`, `nama_penyetuju`, `jabatan_penyetuju`, `tanggal_disetujui`, `created_at`, `updated_at`) VALUES
(1, 'C20240003', 'app informan', 'web', 'fungsional', 'non-fungsional', 'DHC', 'online', '2024-08-10', 'book', 'penyusun 1', 'jabatan penyusun 1', '2024-08-20', 'penyetuju 1', 'jabatan penyetuju 1', '2025-01-11', '2024-08-18 23:30:37', '2024-12-18 12:24:01'),
(2, 'C20240003', 'app informan teknologi', 'web', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 'DHC', 'online', '2024-12-20', 'book', 'penyusun 1', 'jabatan penyusun 1', '2024-12-30', 'penyetuju 2', 'jabatan penyetuju 2', '2024-12-31', '2024-12-18 12:25:31', '2024-12-18 12:25:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `level` tinyint(4) NOT NULL DEFAULT 0,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `foto`, `level`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@gmail.com', NULL, '$2y$10$EI36nefPJZjefHLyEyiqpuGApiK8pmPk1i7l0ruS5NQBOiF8gxBz6', '/img/logo-20241218171112.png', 1, NULL, NULL, NULL, NULL, NULL, '2024-07-11 01:42:24', '2024-12-18 10:11:12'),
(2, 'Kasir 1', 'kasir1@gmail.com', NULL, '$2y$10$vPigdjvJMv2yip8bjiRCxuiDhuD.aTYfcl2giT/QSknuivV3c6zC.', '/img/user.jpg', 2, NULL, NULL, NULL, NULL, NULL, '2024-07-11 01:42:24', '2024-07-11 01:42:24'),
(4, 'ptsi', 'ptsi@gmail.com', NULL, '$2y$10$iinwKXY2PN/y7SGNh3z8f.4RjITWIzgg/Mmn2jLAeE.DymnhoHkGC', '/img/user.jpg', 2, NULL, NULL, NULL, NULL, NULL, '2024-08-12 18:05:00', '2024-08-12 18:05:00');

--
-- Indexes for dumped tables
--

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
  ADD PRIMARY KEY (`id_kategori`),
  ADD UNIQUE KEY `kategori_nama_kategori_unique` (`nama_kategori`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`),
  ADD UNIQUE KEY `member_kode_member_unique` (`kode_member`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_persetujuan`
--
ALTER TABLE `mst_persetujuan`
  ADD PRIMARY KEY (`id_mst_persetujuan`) USING BTREE;

--
-- Indexes for table `mst_persetujuanalasan`
--
ALTER TABLE `mst_persetujuanalasan`
  ADD PRIMARY KEY (`id_mst_persetujuanalasan`) USING BTREE;

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD PRIMARY KEY (`id_pembelian_detail`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indexes for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD PRIMARY KEY (`id_penjualan_detail`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD UNIQUE KEY `produk_nama_produk_unique` (`nama_produk`),
  ADD UNIQUE KEY `produk_kode_produk_unique` (`kode_produk`),
  ADD KEY `produk_id_kategori_foreign` (`id_kategori`);

--
-- Indexes for table `proyeks`
--
ALTER TABLE `proyeks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `trx_analisis_desain`
--
ALTER TABLE `trx_analisis_desain`
  ADD PRIMARY KEY (`id_analisis_desain`);

--
-- Indexes for table `trx_perencanaan_kebutuhan`
--
ALTER TABLE `trx_perencanaan_kebutuhan`
  ADD PRIMARY KEY (`id_perencanaan_kebutuhan`);

--
-- Indexes for table `trx_perencanaan_proyek`
--
ALTER TABLE `trx_perencanaan_proyek`
  ADD PRIMARY KEY (`id_perencanaan_proyek`),
  ADD KEY `id_persetujuan_pengembangan` (`id_persetujuan_pengembangan`);

--
-- Indexes for table `trx_permintaan_pengembangan`
--
ALTER TABLE `trx_permintaan_pengembangan`
  ADD PRIMARY KEY (`id_permintaan_pengembangan`),
  ADD KEY `nomor_proyek` (`nomor_dokumen`),
  ADD KEY `nomor_dok_permintaan` (`nomor_dokumen`),
  ADD KEY `nomor_dokumen` (`nomor_dokumen`);

--
-- Indexes for table `trx_persetujuan_pengembangan`
--
ALTER TABLE `trx_persetujuan_pengembangan`
  ADD PRIMARY KEY (`id_persetujuan_pengembangan`),
  ADD UNIQUE KEY `id_permintaan_pengembangan_2` (`id_permintaan_pengembangan`),
  ADD KEY `id_permintaan_pengembangan` (`id_permintaan_pengembangan`),
  ADD KEY `id_persetujuan` (`id_mst_persetujuan`),
  ADD KEY `id_mst_persetujuanalasan` (`id_mst_persetujuanalasan`);

--
-- Indexes for table `trx_quality_assurance_testing`
--
ALTER TABLE `trx_quality_assurance_testing`
  ADD PRIMARY KEY (`id_qat`);

--
-- Indexes for table `trx_serah_terima_aplikasi`
--
ALTER TABLE `trx_serah_terima_aplikasi`
  ADD PRIMARY KEY (`id_serah_terima_aplikasi`);

--
-- Indexes for table `trx_user_acceptance_testing`
--
ALTER TABLE `trx_user_acceptance_testing`
  ADD PRIMARY KEY (`id_user_acceptance_testing`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `mst_persetujuan`
--
ALTER TABLE `mst_persetujuan`
  MODIFY `id_mst_persetujuan` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mst_persetujuanalasan`
--
ALTER TABLE `mst_persetujuanalasan`
  MODIFY `id_mst_persetujuanalasan` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  MODIFY `id_pembelian_detail` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id_pengeluaran` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  MODIFY `id_penjualan_detail` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `proyeks`
--
ALTER TABLE `proyeks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trx_analisis_desain`
--
ALTER TABLE `trx_analisis_desain`
  MODIFY `id_analisis_desain` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `trx_perencanaan_kebutuhan`
--
ALTER TABLE `trx_perencanaan_kebutuhan`
  MODIFY `id_perencanaan_kebutuhan` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trx_perencanaan_proyek`
--
ALTER TABLE `trx_perencanaan_proyek`
  MODIFY `id_perencanaan_proyek` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `trx_permintaan_pengembangan`
--
ALTER TABLE `trx_permintaan_pengembangan`
  MODIFY `id_permintaan_pengembangan` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `trx_persetujuan_pengembangan`
--
ALTER TABLE `trx_persetujuan_pengembangan`
  MODIFY `id_persetujuan_pengembangan` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `trx_quality_assurance_testing`
--
ALTER TABLE `trx_quality_assurance_testing`
  MODIFY `id_qat` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trx_serah_terima_aplikasi`
--
ALTER TABLE `trx_serah_terima_aplikasi`
  MODIFY `id_serah_terima_aplikasi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trx_user_acceptance_testing`
--
ALTER TABLE `trx_user_acceptance_testing`
  MODIFY `id_user_acceptance_testing` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

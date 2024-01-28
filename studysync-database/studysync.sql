-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2024 at 10:28 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studysync`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `activity_id` int(11) NOT NULL,
  `activity_title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `deadline_day` varchar(50) NOT NULL,
  `deadline_time` varchar(50) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`activity_id`, `activity_title`, `description`, `deadline_day`, `deadline_time`, `subject_id`) VALUES
(1, 'short edit', 'stuff for stuff', '26 January 2024', '6:47 AM', 2),
(2, 'last test12', 'qw1234313e3', '26 January 2024', '7:11 PM', 18),
(3, 'hello sir', '12313', '25 January 2024', '5:04 PM', 18),
(5, 'kmk', 'hfyy', '26 January 2024', '2:07 AM', 2),
(6, 'qhwhw', 'wgagwg', '26 January 2024', '3:03 PM', 2),
(7, 'wrsa', 'wsrwas', '26 January 2024', '3:06 PM', 19),
(8, 'qwwe', 'asdess', '26 January 2024', '3:09 PM', 2),
(9, 'himo essay', 'wssay 2 pages', '27 January 2024', '7:18 AM', 2);

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
(6, '2024_01_16_210036_create_sessions_table', 1),
(23, '2014_10_12_000000_create_users_table', 2),
(24, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(25, '2014_10_12_200000_add_two_factor_columns_to_users_table', 2),
(26, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(27, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(28, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(29, '2016_06_01_000004_create_oauth_clients_table', 2),
(30, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(31, '2019_08_19_000000_create_failed_jobs_table', 2),
(32, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(33, '2024_01_22_045240_create_sessions_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('d5ef524dbf62aba1cf0d0534dc0bfb1c0f226bbf9986ef4612dcad9f0b6a15724faf23f19d2c23fd', 11, 1, 'token', '[]', 0, '2024-01-22 03:57:57', '2024-01-22 03:57:57', '2025-01-22 11:57:57'),
('f652a6a95b60a6728b81e3dc28e4636d48e015a57e73c52387a7ebdcbb0c7324433a90f81eaeb544', 12, 1, 'token', '[]', 0, '2024-01-22 04:06:17', '2024-01-22 04:06:17', '2025-01-22 12:06:17');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'xwK7nk4hmys5n014fXZJ8078nIXPV5P1qRPZKmk8', NULL, 'http://localhost', 1, 0, 0, '2024-01-22 03:57:33', '2024-01-22 03:57:33'),
(2, NULL, 'Laravel Password Grant Client', 'NighGtusopxRh2GYB2Px5VlI1HXx2VCIrWniHmnW', 'users', 'http://localhost', 0, 1, 0, '2024-01-22 03:57:33', '2024-01-22 03:57:33');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-01-22 03:57:33', '2024-01-22 03:57:33');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'token', '94dc87103c5f3859c0d92b232a997f1280252edd7c776210108ced4f600e47fa', '[\"*\"]', NULL, NULL, '2024-01-22 04:18:32', '2024-01-22 04:18:32'),
(2, 'App\\Models\\User', 1, 'myApp', '04f31fd48d2e1f38d495058d74c846a3d76dde8e3d85e143e56ae668b8ac818a', '[\"*\"]', NULL, NULL, '2024-01-22 04:18:42', '2024-01-22 04:18:42'),
(3, 'App\\Models\\User', 2, 'token', '26816d7d3c54ca452733c2b8e4e282349ede67700462f70c9c6ac2d1f78dc48d', '[\"*\"]', NULL, NULL, '2024-01-23 00:04:21', '2024-01-23 00:04:21'),
(4, 'App\\Models\\User', 3, 'token', '94c49c287026940292b4cab8001f446be31c7f36f86fbae546d350bbde79923b', '[\"*\"]', NULL, NULL, '2024-01-23 00:11:26', '2024-01-23 00:11:26'),
(5, 'App\\Models\\User', 4, 'token', '9248c2fab69b3f7061d4676b8bc28cad2e2ac486f4ff943c458570d4429d9cbd', '[\"*\"]', NULL, NULL, '2024-01-23 00:35:39', '2024-01-23 00:35:39'),
(6, 'App\\Models\\User', 4, 'myApp', '0dd22733db3759bdca08fc7b5490c11f1b391e217bcd58ff04a8d360d3ebfe88', '[\"*\"]', NULL, NULL, '2024-01-23 00:36:49', '2024-01-23 00:36:49'),
(7, 'App\\Models\\User', 4, 'myApp', '97a6f51e58b6e743e11e4984754128ec7579ac3fef75152354189ac68f2c8f45', '[\"*\"]', NULL, NULL, '2024-01-23 00:36:58', '2024-01-23 00:36:58'),
(8, 'App\\Models\\User', 4, 'myApp', '262b4acbc01ef32c0fec67ddf4698a387fae8a66df137f7608086b58490a7098', '[\"*\"]', NULL, NULL, '2024-01-23 00:38:07', '2024-01-23 00:38:07'),
(9, 'App\\Models\\User', 4, 'myApp', '59e3c5a4958672c45f67bd482ae9927822cc677d6f1a09ee2db95c963628b03e', '[\"*\"]', NULL, NULL, '2024-01-24 00:51:00', '2024-01-24 00:51:00'),
(10, 'App\\Models\\User', 4, 'myApp', '35d4a453ccca942b073056e96bed58567a99e01a973bb65121d5eee73bdc9c1a', '[\"*\"]', NULL, NULL, '2024-01-24 00:54:36', '2024-01-24 00:54:36'),
(11, 'App\\Models\\User', 4, 'myApp', '9862eda8e99e5da9406f5bd6b76cad917d94f53e7e5e6cf35a375cdc3f368300', '[\"*\"]', NULL, NULL, '2024-01-24 00:57:21', '2024-01-24 00:57:21'),
(12, 'App\\Models\\User', 6, 'token', '2909183c1f9eab7c38a81c86e98d61293c624326129c06bc0a04b24ae1d776fe', '[\"*\"]', NULL, NULL, '2024-01-24 01:06:33', '2024-01-24 01:06:33'),
(13, 'App\\Models\\User', 6, 'myApp', '2f0f1b20fcbed71907f12377bb52fb5e3676d6ffea5a1979b740e8aadd37001e', '[\"*\"]', NULL, NULL, '2024-01-24 01:07:28', '2024-01-24 01:07:28'),
(14, 'App\\Models\\User', 6, 'myApp', '9683418d8455f5b2b4163dc93295e69e9065513fb094b25db3ffd9c351e2274d', '[\"*\"]', NULL, NULL, '2024-01-24 01:07:32', '2024-01-24 01:07:32'),
(15, 'App\\Models\\User', 6, 'myApp', 'e5e2629ba7bd3cf5ef76861c82e514376f39b5ce0069130969795fcd1418343a', '[\"*\"]', NULL, NULL, '2024-01-24 01:10:35', '2024-01-24 01:10:35'),
(16, 'App\\Models\\User', 6, 'myApp', 'ebe5dacc9638f973eb69070511168f75d4f68ed692c2ba433cb9554017a23a88', '[\"*\"]', NULL, NULL, '2024-01-24 01:29:28', '2024-01-24 01:29:28'),
(17, 'App\\Models\\User', 6, 'myApp', '85acc123185e1899b47690e64e1ece477c4a95f7a0beeac72fe29554ead350c1', '[\"*\"]', NULL, NULL, '2024-01-24 01:41:09', '2024-01-24 01:41:09'),
(18, 'App\\Models\\User', 6, 'myApp', 'fc4aa964f842fedc2862b9b14833c3524fd860d56aeac943b39af64a677f59fb', '[\"*\"]', NULL, NULL, '2024-01-24 01:43:07', '2024-01-24 01:43:07'),
(19, 'App\\Models\\User', 6, 'myApp', '75146aced7c9916d58aa0de2994a1d577b68793149653add1b80557ae5dfad6f', '[\"*\"]', NULL, NULL, '2024-01-24 01:52:26', '2024-01-24 01:52:26'),
(20, 'App\\Models\\User', 6, 'myApp', 'a5d5108fb36a8b759e51be4214456eb1a1c01d0746b85c00b2699b6fb98f04a6', '[\"*\"]', NULL, NULL, '2024-01-24 01:52:31', '2024-01-24 01:52:31'),
(21, 'App\\Models\\User', 6, 'myApp', '1469a2bc7afe842ccd2d357cb8d817982b04bbecc497ff38cc41d02debbe171e', '[\"*\"]', NULL, NULL, '2024-01-24 01:52:39', '2024-01-24 01:52:39'),
(22, 'App\\Models\\User', 6, 'myApp', '366ba5fdc97d4f84d93fb2768fe8e2394be09e50b5fb3f03bad4b14089da3130', '[\"*\"]', NULL, NULL, '2024-01-24 02:48:29', '2024-01-24 02:48:29'),
(23, 'App\\Models\\User', 6, 'myApp', 'f9d639608a08d2e94b67fa6ac45627c220a2b3501fd9c290c7d59828e8f0047e', '[\"*\"]', NULL, NULL, '2024-01-24 02:48:32', '2024-01-24 02:48:32'),
(24, 'App\\Models\\User', 8, 'token', '85a9431277416e2ea5a262597429661017ff36228f266e8ba1f571c11e0bdc99', '[\"*\"]', NULL, NULL, '2024-01-24 03:54:33', '2024-01-24 03:54:33'),
(25, 'App\\Models\\User', 8, 'myApp', '8568ff2cf11045392d87c3aab01e288e6ab86ad76f87fd32de1996bcdb3fc787', '[\"*\"]', NULL, NULL, '2024-01-24 03:55:20', '2024-01-24 03:55:20'),
(26, 'App\\Models\\User', 8, 'myApp', '3d65fd2e5785197505f22e3716ce2bb7372b709cb60395244cb3588bed775117', '[\"*\"]', NULL, NULL, '2024-01-24 03:55:22', '2024-01-24 03:55:22'),
(27, 'App\\Models\\User', 11, 'token', '3c3518a89dd67ed1e5143d87b2850fdc9c86b68f1d2c665676fce81fc6b4945d', '[\"*\"]', NULL, NULL, '2024-01-24 05:11:23', '2024-01-24 05:11:23'),
(28, 'App\\Models\\User', 6, 'myApp', '3cd8cb1f713cbaa35b36b0e1be882280e65fbda52e89c7f8fbdd74d069e21a7a', '[\"*\"]', NULL, NULL, '2024-01-24 09:55:55', '2024-01-24 09:55:55'),
(29, 'App\\Models\\User', 6, 'myApp', '9da8ace81001fa6d0837f9d6679efe4094eef6e97317d5c5bfd744715e21f52c', '[\"*\"]', NULL, NULL, '2024-01-24 09:55:59', '2024-01-24 09:55:59'),
(30, 'App\\Models\\User', 6, 'myApp', '5d9bb02a23925c5ab95630238f18cab98d32252723f9c1877a7d5e91e0de1fe4', '[\"*\"]', NULL, NULL, '2024-01-24 10:35:13', '2024-01-24 10:35:13'),
(31, 'App\\Models\\User', 6, 'myApp', 'ac47ee13b676e24b237d6f76c92975767282f4f7fb2d3251fcc448db2182479a', '[\"*\"]', NULL, NULL, '2024-01-24 10:35:15', '2024-01-24 10:35:15'),
(32, 'App\\Models\\User', 6, 'myApp', '3d857ba9f8b76c3e78e846c079f847c247c78b79c8bd335d48dab4f97fa70e87', '[\"*\"]', NULL, NULL, '2024-01-24 11:53:49', '2024-01-24 11:53:49'),
(33, 'App\\Models\\User', 6, 'myApp', '7c8889d5f64f07f6c67b3b30f592f9c631f0c3361f84df86fe66aea500da6b5a', '[\"*\"]', NULL, NULL, '2024-01-24 11:53:49', '2024-01-24 11:53:49'),
(34, 'App\\Models\\User', 6, 'myApp', '84af6a46237439aa4462d18a9fd4b0b8f5bc2724d9f459ecf9b44b0a8795f3b5', '[\"*\"]', NULL, NULL, '2024-01-24 11:53:51', '2024-01-24 11:53:51'),
(35, 'App\\Models\\User', 6, 'myApp', 'd1d1fd39957ffdad311b715628f9087df58cc96c8cf416378efd261a5faff2f7', '[\"*\"]', NULL, NULL, '2024-01-24 12:09:42', '2024-01-24 12:09:42'),
(36, 'App\\Models\\User', 6, 'myApp', '13cd674959542056a556bcd0784df3ae896a2289b04bb2c856c1b70d96f0e88e', '[\"*\"]', NULL, NULL, '2024-01-24 12:09:44', '2024-01-24 12:09:44'),
(37, 'App\\Models\\User', 6, 'myApp', 'fc974705414a72b537f50ef427a89e9a6d16acd42e431e65e3ffb238f03ea2f5', '[\"*\"]', NULL, NULL, '2024-01-24 21:11:11', '2024-01-24 21:11:11'),
(38, 'App\\Models\\User', 6, 'myApp', '0f7fb21561d10a2d7c8848c5c3243e7c052454d376d06c9557298b66141c9be1', '[\"*\"]', NULL, NULL, '2024-01-24 21:11:13', '2024-01-24 21:11:13'),
(39, 'App\\Models\\User', 6, 'myApp', '6e948fd7a44676cfb63e3609c6ce1b66082ea9017dd632a45c6aaa79f484cadc', '[\"*\"]', NULL, NULL, '2024-01-24 21:52:29', '2024-01-24 21:52:29'),
(40, 'App\\Models\\User', 6, 'myApp', '033767be8fad71327b282208b833cbf645649e91712df7d425ce9ea04cbc0395', '[\"*\"]', NULL, NULL, '2024-01-24 21:52:31', '2024-01-24 21:52:31'),
(41, 'App\\Models\\User', 6, 'myApp', '38237fabea6629463f9d7ea2c439c77125e15f7d63c02dbc7986f4505e2215e0', '[\"*\"]', NULL, NULL, '2024-01-24 23:27:52', '2024-01-24 23:27:52'),
(42, 'App\\Models\\User', 6, 'myApp', 'da8b957277eae7e060997ba9a87ef54becbbf8f64c426f9075416d8fa9eb269a', '[\"*\"]', NULL, NULL, '2024-01-24 23:27:54', '2024-01-24 23:27:54'),
(43, 'App\\Models\\User', 12, 'token', '6124301b3f50f258120522d468e1ea2fa8635b913a6b925c20dd4fdd0fa6ec77', '[\"*\"]', NULL, NULL, '2024-01-24 23:32:19', '2024-01-24 23:32:19'),
(44, 'App\\Models\\User', 12, 'myApp', '2233e313fdabe6ce27bdfcb6f8976b0cc3151977c05da6c883f206e445514dad', '[\"*\"]', NULL, NULL, '2024-01-24 23:32:31', '2024-01-24 23:32:31'),
(45, 'App\\Models\\User', 12, 'myApp', 'd5d656eb18c795b8e0ee1c661addb665ad280f9f77f1f046cdbabad338b016de', '[\"*\"]', NULL, NULL, '2024-01-24 23:32:34', '2024-01-24 23:32:34'),
(46, 'App\\Models\\User', 12, 'myApp', '1a4766eab1ca1344f3ac30f52b3aeb1d5f1d8e2dcf9692b4e967d74d4943b037', '[\"*\"]', NULL, NULL, '2024-01-25 00:10:21', '2024-01-25 00:10:21'),
(47, 'App\\Models\\User', 12, 'myApp', '4fe8cc5fa032d21e4c854d917dfb0a6b275111a34b67f692a6e8f91f6e317c70', '[\"*\"]', NULL, NULL, '2024-01-25 00:10:23', '2024-01-25 00:10:23'),
(48, 'App\\Models\\User', 6, 'myApp', 'c39dcc5feea43910157cdb26ab6e00019757f76df6349cb2d292a44473c14382', '[\"*\"]', NULL, NULL, '2024-01-25 08:44:45', '2024-01-25 08:44:45'),
(49, 'App\\Models\\User', 6, 'myApp', '4fef70ea4feec4d26b513c7500118b3be6e6ca087ef949ba0a9b7709b7131d37', '[\"*\"]', NULL, NULL, '2024-01-25 08:44:48', '2024-01-25 08:44:48'),
(50, 'App\\Models\\User', 6, 'myApp', '936ac8c8f093f99c1db7154cd28fa824b8592163227d3df8d5087c517a5c2adb', '[\"*\"]', NULL, NULL, '2024-01-25 08:54:52', '2024-01-25 08:54:52'),
(51, 'App\\Models\\User', 6, 'myApp', '20804682b0a092d7f1d28d6350bef84e442b93383d5e0bae26931f559bb244f2', '[\"*\"]', NULL, NULL, '2024-01-25 08:54:54', '2024-01-25 08:54:54'),
(52, 'App\\Models\\User', 6, 'myApp', '6082a2073867b705e52a27fa8d4658e37acc634d73795216dcb3e20d236552b1', '[\"*\"]', NULL, NULL, '2024-01-25 10:36:36', '2024-01-25 10:36:36'),
(53, 'App\\Models\\User', 6, 'myApp', 'fa51c937f00b4503658c8cdd04c93b437eba819579e57a3b2413f916048cf08d', '[\"*\"]', NULL, NULL, '2024-01-25 10:36:39', '2024-01-25 10:36:39'),
(54, 'App\\Models\\User', 6, 'myApp', '5bfb5504b920675fd04a4e180a256e9d97c17b600aaf05cca2c3dca24af69613', '[\"*\"]', NULL, NULL, '2024-01-25 10:47:12', '2024-01-25 10:47:12'),
(55, 'App\\Models\\User', 6, 'myApp', 'a193834f14ba6d289649a6b5ac5ca8567976a90bb1843feef41779bcb326311e', '[\"*\"]', NULL, NULL, '2024-01-25 10:47:14', '2024-01-25 10:47:14'),
(56, 'App\\Models\\User', 6, 'myApp', '3542b4d35d1a8c3bb02a52cb66fbebaf32827571eb652d2a6b4336c582a83d57', '[\"*\"]', NULL, NULL, '2024-01-25 17:47:28', '2024-01-25 17:47:28'),
(57, 'App\\Models\\User', 6, 'myApp', '372ec37f661d21cd85ee1d86feb6229acaa96a0c4b50ce90c8dba765450bf617', '[\"*\"]', NULL, NULL, '2024-01-25 17:47:28', '2024-01-25 17:47:28'),
(58, 'App\\Models\\User', 6, 'myApp', '50b3b191f8a59fa78c57ffc73fa818621a8aa28f17c1eac5f3a4b410ffd78f46', '[\"*\"]', NULL, NULL, '2024-01-25 17:47:30', '2024-01-25 17:47:30'),
(59, 'App\\Models\\User', 6, 'myApp', '2a626e762a3c6b3c567a389a5de8b5ad8b46afeb931401fc6c7b0d23596f4b1e', '[\"*\"]', NULL, NULL, '2024-01-25 17:50:50', '2024-01-25 17:50:50'),
(60, 'App\\Models\\User', 6, 'myApp', '33acb07677d3c618718a514a8a4ec4ed0eefb44c519e1da4a526cee080bbeea3', '[\"*\"]', NULL, NULL, '2024-01-25 17:50:54', '2024-01-25 17:50:54'),
(61, 'App\\Models\\User', 12, 'myApp', '1efb8211b6aea143bfe83115b260228d13b3575640c5d227e0021e41d76ee29e', '[\"*\"]', NULL, NULL, '2024-01-25 18:13:43', '2024-01-25 18:13:43'),
(62, 'App\\Models\\User', 12, 'myApp', 'e64e045dba06138369171473bde7f1642f3b5b0f5457fad2663089168e25438d', '[\"*\"]', NULL, NULL, '2024-01-25 18:13:45', '2024-01-25 18:13:45'),
(63, 'App\\Models\\User', 19, 'token', '03c57c8d4471f25eee98cbd40ce8f5a899c7df726179041ab958cb017ffb951f', '[\"*\"]', NULL, NULL, '2024-01-25 18:15:28', '2024-01-25 18:15:28'),
(64, 'App\\Models\\User', 6, 'myApp', 'a0d3f04a227f3cce8f6d355522808e365e46b700bbd6599b709067c992bf1c40', '[\"*\"]', NULL, NULL, '2024-01-25 18:16:16', '2024-01-25 18:16:16'),
(65, 'App\\Models\\User', 6, 'myApp', '48c67654ed82d29ec360b2358fdd807915798b9cb450ce95e32a062aad638200', '[\"*\"]', NULL, NULL, '2024-01-25 18:16:19', '2024-01-25 18:16:19'),
(66, 'App\\Models\\User', 19, 'myApp', '4c9342b2f17a7564142bc907e051fbc1fecf71f70e313f79c892364a1710fc63', '[\"*\"]', NULL, NULL, '2024-01-25 18:17:22', '2024-01-25 18:17:22'),
(67, 'App\\Models\\User', 19, 'myApp', '6ed8525d5e544fdb5e490808bb376dd1c3439cb3d038cd65b22abef12e88481b', '[\"*\"]', NULL, NULL, '2024-01-25 18:17:26', '2024-01-25 18:17:26'),
(68, 'App\\Models\\User', 6, 'myApp', '14afbec92ad05428940510a45f251e000bb0e8a5ee839f61e558d92cfc5ea226', '[\"*\"]', NULL, NULL, '2024-01-25 22:53:29', '2024-01-25 22:53:29'),
(69, 'App\\Models\\User', 6, 'myApp', '3e3238b87d3c97c88fc9ce6fca3011fdd298059574924587e04993fcecc9e105', '[\"*\"]', NULL, NULL, '2024-01-25 22:54:14', '2024-01-25 22:54:14'),
(70, 'App\\Models\\User', 6, 'myApp', 'b5bb3f003c26dce06c5073c53328be17d4cba5f2ba8fcf58ee48c95b52276120', '[\"*\"]', NULL, NULL, '2024-01-25 23:01:18', '2024-01-25 23:01:18'),
(71, 'App\\Models\\User', 6, 'myApp', '82524a069bec5f94c23f7b059ddb89dec7f18cbedace6a5cfab4578d2c36e738', '[\"*\"]', NULL, NULL, '2024-01-25 23:01:19', '2024-01-25 23:01:19'),
(72, 'App\\Models\\User', 6, 'myApp', '7ce7f92f43709b602a1d23161cb659354d1631213eac456b6f598681a17e6425', '[\"*\"]', NULL, NULL, '2024-01-25 23:01:20', '2024-01-25 23:01:20'),
(73, 'App\\Models\\User', 6, 'myApp', 'f2ed9c904fc33216f4dbf880ce9af0e40984889b7c08459cd2501d3816bdc791', '[\"*\"]', NULL, NULL, '2024-01-25 23:01:21', '2024-01-25 23:01:21'),
(74, 'App\\Models\\User', 6, 'myApp', '9abf5263bbcbde0b328935c0432da803cf867647c51084296a98bbf46870165e', '[\"*\"]', NULL, NULL, '2024-01-25 23:01:22', '2024-01-25 23:01:22'),
(75, 'App\\Models\\User', 6, 'myApp', '195eb9aa525aae7e4a1c174505e52e78386e439d0cbf5330de5fa3addbe7cf6f', '[\"*\"]', NULL, NULL, '2024-01-25 23:01:22', '2024-01-25 23:01:22'),
(76, 'App\\Models\\User', 6, 'myApp', '78770bb061851a9526bc9d3e159a31681f89fd1742941ab7504347a96024fff8', '[\"*\"]', NULL, NULL, '2024-01-25 23:01:23', '2024-01-25 23:01:23'),
(77, 'App\\Models\\User', 6, 'myApp', '7c35abc2c8f8f1cead2baff39385a2a435f7f7339242cdedc843e69b28f18094', '[\"*\"]', NULL, NULL, '2024-01-25 23:01:24', '2024-01-25 23:01:24'),
(78, 'App\\Models\\User', 6, 'myApp', 'a99a2931480d202bbcb047d1ddc04f00c5c83015a460786d2d9e3adc9d3fc70a', '[\"*\"]', NULL, NULL, '2024-01-25 23:01:24', '2024-01-25 23:01:24'),
(79, 'App\\Models\\User', 6, 'myApp', '1f09ff5507455ef8a89a400c3b5ec1797d135bd0a144809c412553f8e31ba302', '[\"*\"]', NULL, NULL, '2024-01-25 23:01:25', '2024-01-25 23:01:25'),
(80, 'App\\Models\\User', 6, 'myApp', '3bcf1258bf5a831057c65d5319bca8548b761bc60f959640b231f1a185434a67', '[\"*\"]', NULL, NULL, '2024-01-25 23:01:26', '2024-01-25 23:01:26'),
(81, 'App\\Models\\User', 6, 'myApp', 'b9da8833c837c6d8a0a6800d14167ffb809275e0e6c8ea5e196589fde38d7742', '[\"*\"]', NULL, NULL, '2024-01-25 23:01:27', '2024-01-25 23:01:27'),
(82, 'App\\Models\\User', 6, 'myApp', '5b2c58a340f04a0476b21c4745a7033c89311c7f6bbf68ca90fe78e3b2da70c6', '[\"*\"]', NULL, NULL, '2024-01-25 23:01:27', '2024-01-25 23:01:27'),
(83, 'App\\Models\\User', 6, 'myApp', '4eccfa3106fa40770f0998faad93556d4a9d4cf877b5d2286b824347cbce9217', '[\"*\"]', NULL, NULL, '2024-01-25 23:13:22', '2024-01-25 23:13:22'),
(84, 'App\\Models\\User', 6, 'myApp', '95853c50eba61d0de8d413d038b93bca8a17ed711bfe2e62431389ac00b7a280', '[\"*\"]', NULL, NULL, '2024-01-25 23:13:24', '2024-01-25 23:13:24'),
(85, 'App\\Models\\User', 12, 'myApp', '1d418865146d448c02168aad66182e8b567a745c7e790376736980402d307f2e', '[\"*\"]', NULL, NULL, '2024-01-25 23:13:50', '2024-01-25 23:13:50'),
(86, 'App\\Models\\User', 12, 'myApp', 'd00cfecc633800aa81c8784c2225d4138db128ceaf038b128e95a9cc89378dbb', '[\"*\"]', NULL, NULL, '2024-01-25 23:13:53', '2024-01-25 23:13:53'),
(87, 'App\\Models\\User', 6, 'myApp', 'c22f2c014b327cff33b8136940b41b119bc8cd38d6523e444a4875911eec53fe', '[\"*\"]', NULL, NULL, '2024-01-26 19:43:03', '2024-01-26 19:43:03'),
(88, 'App\\Models\\User', 6, 'myApp', '159df4739185db5800a68ad1625a0e69f84f23ea9825deeba7475b31cdb0d255', '[\"*\"]', NULL, NULL, '2024-01-26 19:43:04', '2024-01-26 19:43:04'),
(89, 'App\\Models\\User', 6, 'myApp', '5de0e25253f1d57f80e737b64fa0058e8448b505641fe5670f7faa4adafbb486', '[\"*\"]', NULL, NULL, '2024-01-26 19:43:08', '2024-01-26 19:43:08'),
(90, 'App\\Models\\User', 6, 'myApp', '720741d4fe9504fe9ff93316ecaf9b0c607a8b0f2fff32e0fd2b8a9474ebbcbd', '[\"*\"]', NULL, NULL, '2024-01-26 19:44:55', '2024-01-26 19:44:55'),
(91, 'App\\Models\\User', 6, 'myApp', '2ccfad0b2c773ee6f38f8eda9d3161e3c40d8f7f36e5fad757acf72f643929ae', '[\"*\"]', NULL, NULL, '2024-01-26 19:45:00', '2024-01-26 19:45:00'),
(92, 'App\\Models\\User', 6, 'myApp', '011632e0e8824fd6fdee8cc18a709139062179fe05959a1c22c290ad6bcccffc', '[\"*\"]', NULL, NULL, '2024-01-26 23:13:25', '2024-01-26 23:13:25'),
(93, 'App\\Models\\User', 6, 'myApp', '5adf51addd47a65196101ed2c3ac0c9090ebecf7e182323874cc0fc1b7f0f7ab', '[\"*\"]', NULL, NULL, '2024-01-26 23:13:27', '2024-01-26 23:13:27'),
(94, 'App\\Models\\User', 6, 'myApp', '692d32d805cb8f6276fe8b5aca1c1deec2a76bdc30d8ba84ab1332a86d9da46b', '[\"*\"]', NULL, NULL, '2024-01-26 23:13:28', '2024-01-26 23:13:28'),
(95, 'App\\Models\\User', 6, 'myApp', '9ec82363be1213180635d594140cda45f954923c7928ccae72d5fe3f1dc3ea14', '[\"*\"]', NULL, NULL, '2024-01-26 23:13:30', '2024-01-26 23:13:30');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `day` varchar(10) NOT NULL,
  `time_in` varchar(10) NOT NULL,
  `time_out` varchar(10) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `day`, `time_in`, `time_out`, `subject_id`) VALUES
(4, 'Thursday', '7:28 AM', '7:28 PM', 18),
(9, 'Saturday', '8:32 AM', '8:32 PM', 22),
(10, 'Friday', '3:01 PM', '3:01 PM', 18),
(11, 'Saturday', '7:14 AM', '7:15 PM', 15);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `subject_title` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `subject_title`) VALUES
(2, 'English'),
(3, 'Religion'),
(5, 'Research'),
(6, 'Research'),
(7, 'Research'),
(8, 'Research'),
(9, 'Research'),
(10, 'Research'),
(11, 'Research'),
(12, 'Research'),
(15, 'Calculus'),
(18, 'Mapeh'),
(19, 'Research'),
(21, 'Math'),
(22, 'English'),
(23, 'Physics');

-- --------------------------------------------------------

--
-- Table structure for table `user-subject`
--

CREATE TABLE `user-subject` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user-subject`
--

INSERT INTO `user-subject` (`user_id`, `subject_id`) VALUES
(6, 2),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 10),
(8, 11),
(8, 12),
(6, 15),
(6, 18),
(6, 19),
(12, 21),
(12, 22),
(6, 23);

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
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(2, 'hipyo', 'hello2@gmail.com', NULL, '$2y$12$ff3aqVDdybYHyfwNQuOEj.PWpqxd.VzKnv04jeT/J56HUEbgXaZVq', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-23 00:04:21', '2024-01-23 00:04:21'),
(3, 'broske', 'some@gmail.com', NULL, '$2y$12$R1.xQRzRkP7OTtou6FVvbuVfv.AvE/XMd6P83AodCCsppRLaqaSPq', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-23 00:11:26', '2024-01-23 00:11:26'),
(4, 'guylord', 'guy@gmail.com', NULL, '$2y$12$mTyfGpKPwOfjcOTgR58nj.zVIiFSFnPo6Aus6H2XGZQTGrVWJJgPe', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-23 00:35:39', '2024-01-23 00:35:39'),
(6, 'hello', 'chalbert@gmail.com', NULL, '$2y$12$gcuAPeXC93h1N.3Wx8ndL.i074ayw9soxNzKBwPkk1ZwBwKY2.GWe', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-24 01:06:33', '2024-01-24 01:06:33'),
(8, 'chalbert', 'chalbert1@gmail.com', NULL, '$2y$12$ewQxnTgLoSSFtmUz7hAFw.IyxyA0FcW.rFUzOyIPmFwv7ZiFNJF2u', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-24 03:54:33', '2024-01-24 03:54:33'),
(11, 'hipyo', 'chalber2t@gmail.com', NULL, '$2y$12$DOCP7gKudioctRRf2d1s6Oj2pn0xV/xZqVzV15NKwpHQxGVY271a.', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-24 05:11:23', '2024-01-24 05:11:23'),
(12, 'user', 'user@gmail.com', NULL, '$2y$12$KomDzHT7KBRWv52YyfEIZOp24RhH61HOY9aJ.wtQaZaUzMvVWAkSG', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-24 23:32:19', '2024-01-24 23:32:19'),
(19, 'aston', 'aston@gmail.com', NULL, '$2y$12$AgJbJbE4LqLg5eO3rKgYl.5rEgiUP/HDMhBmrxEaowK7GCiROVvnC', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-25 18:15:28', '2024-01-25 18:15:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `activitySubjectIdFk` (`subject_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `scheduleSubjectIdFk` (`subject_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `user-subject`
--
ALTER TABLE `user-subject`
  ADD KEY `usersubjectUserIdFk` (`user_id`),
  ADD KEY `usersubjectSubjectFk` (`subject_id`);

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
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `activitySubjectIdFk` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `scheduleSubjectIdFk` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user-subject`
--
ALTER TABLE `user-subject`
  ADD CONSTRAINT `usersubjectSubjectFk` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usersubjectUserIdFk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2023 at 04:33 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nexus_publication`
--

-- --------------------------------------------------------

--
-- Table structure for table `blanks`
--

CREATE TABLE `blanks` (
  `id` int(11) NOT NULL,
  `question` varchar(522) NOT NULL,
  `answer` varchar(522) NOT NULL,
  `solution` varchar(522) NOT NULL,
  `bid` int(52) NOT NULL,
  `std` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blanks`
--

INSERT INTO `blanks` (`id`, `question`, `answer`, `solution`, `bid`, `std`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test is blank?', '12', 'sfdsfgdsg', 1, 23476436, '2023-11-29 04:55:34', '2023-11-29 05:03:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `board`
--

CREATE TABLE `board` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cover_link` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `board`
--

INSERT INTO `board` (`id`, `name`, `cover_link`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'GSEB', 'test', '2023-11-17 13:24:43', NULL, NULL),
(2, 'NCERT', 'test', '2023-11-17 13:24:48', '2023-11-17 13:24:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `name` varchar(522) NOT NULL,
  `std` int(25) NOT NULL,
  `bid` int(25) NOT NULL,
  `pdf_link` varchar(255) NOT NULL,
  `cover_link` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `name`, `std`, `bid`, `pdf_link`, `cover_link`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Physics', 1, 2, 'https://5.imimg.com/data5/AX/RT/MY-10953353/physics-part-1-class-12th-ncert-book-500x500.jpg', 'https://5.imimg.com/data5/AX/RT/MY-10953353/physics-part-1-class-12th-ncert-book-500x500.jpg', '2023-11-05 16:18:13', '2023-11-22 08:12:20', NULL),
(2, 'Physics', 1, 1, 'https://5.imimg.com/data5/AX/RT/MY-10953353/physics-part-1-class-12th-ncert-book-500x500.jpg', 'https://5.imimg.com/data5/AX/RT/MY-10953353/physics-part-1-class-12th-ncert-book-500x500.jpg', '2023-11-05 16:18:14', '2023-11-22 08:12:26', NULL),
(3, 'Physics', 1, 2, 'https://5.imimg.com/data5/AX/RT/MY-10953353/physics-part-1-class-12th-ncert-book-500x500.jpg', 'https://5.imimg.com/data5/AX/RT/MY-10953353/physics-part-1-class-12th-ncert-book-500x500.jpg', '2023-11-05 16:30:59', '2023-11-22 08:12:28', NULL),
(4, 'Physics', 1, 2, 'https://5.imimg.com/data5/AX/RT/MY-10953353/physics-part-1-class-12th-ncert-book-500x500.jpg', 'https://5.imimg.com/data5/AX/RT/MY-10953353/physics-part-1-class-12th-ncert-book-500x500.jpg', '2023-11-05 16:32:24', '2023-11-22 08:12:31', NULL),
(5, 'test', 1, 2, 'pdf_link/5AvJzRi4EPhfG96QApNDKQBkTJyflnsCT0PhMAn8.pdf', 'cover_link/k9LNMLCDAvjPsgSzFqE12pEtyXAYPZKMOzHdkLiM.png', '2023-11-22 11:12:54', NULL, NULL),
(6, 'Physics', 1, 1, 'pdf_link/QYRE2ql2K5xU35erVsmVkssYAg4m4EvvhrZZikzp.pdf', 'cover_link/Az0WsAnDYusD5kuc0F0AbvsYwaJiYpcE7O5xaIsZ.jpg', '2023-11-22 11:13:09', NULL, NULL);

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
-- Table structure for table `long`
--

CREATE TABLE `long` (
  `id` int(11) NOT NULL,
  `question` varchar(522) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  `bid` int(11) NOT NULL,
  `std` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `long`
--

INSERT INTO `long` (`id`, `question`, `answer`, `bid`, `std`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test is long?', '12', 1, 23476436, '2023-11-29 10:34:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mcq`
--

CREATE TABLE `mcq` (
  `id` int(11) NOT NULL,
  `bid` int(52) NOT NULL,
  `std` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `answer` varchar(522) NOT NULL,
  `solution` varchar(522) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mcq`
--

INSERT INTO `mcq` (`id`, `bid`, `std`, `question`, `option1`, `option2`, `option3`, `option4`, `answer`, `solution`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 23476436, 'test is test?', '12', '23', '34', '55', '12', 'sfdsfgdsg', '2023-11-28 14:16:03', NULL, NULL);

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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `onetwo`
--

CREATE TABLE `onetwo` (
  `id` int(11) NOT NULL,
  `question` varchar(522) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  `bid` int(11) NOT NULL,
  `std` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `onetwo`
--

INSERT INTO `onetwo` (`id`, `question`, `answer`, `bid`, `std`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test is one?', '12', 1, 23476436, '2023-11-29 10:34:14', NULL, NULL);

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
(1, 'App\\Models\\User', 7, 'Personal Access Token', 'f0cecc5b2e5c20627d52fab95307fe9de5c7ebacfbcc26fd2e4f602877cf1c57', '[\"*\"]', NULL, NULL, '2023-11-05 08:40:46', '2023-11-05 08:40:46'),
(2, 'App\\Models\\User', 10, 'Personal Access Token', 'ec39ca4b6ae5bb8128d30c5a20ea86372125cc30e5035bc01fa8bd382859b894', '[\"*\"]', NULL, NULL, '2023-11-05 08:48:14', '2023-11-05 08:48:14'),
(3, 'App\\Models\\User', 10, 'auth_token', 'e62a9d5441a32c14211931468e91ddb7696579e67d9d7aa44e6704968b7b3013', '[\"*\"]', NULL, NULL, '2023-11-05 08:48:22', '2023-11-05 08:48:22'),
(4, 'App\\Models\\User', 10, 'auth_token', '54379176b7e523985bbacf1cc9fc52eb98423a2620fa74e8203496c39099ec68', '[\"*\"]', NULL, NULL, '2023-11-13 06:18:14', '2023-11-13 06:18:14'),
(5, 'App\\Models\\User', 11, 'Personal Access Token', '5299a8427e3f325afa536a71df8f457ae22c951a0468edc7a191264465921dab', '[\"*\"]', NULL, NULL, '2023-11-13 06:23:05', '2023-11-13 06:23:05'),
(6, 'App\\Models\\User', 10, 'auth_token', '418c6ca60231bec542e27bd76da1c630d3cf20be79f541d7105e8dff8f8286e5', '[\"*\"]', '2023-11-13 08:52:47', NULL, '2023-11-13 08:31:06', '2023-11-13 08:52:47'),
(7, 'App\\Models\\User', 10, 'auth_token', 'a3d963ea2176d9b168b83297807f4990973f2f4faeaf30c8b516c3b4a1efc85a', '[\"*\"]', NULL, NULL, '2023-11-13 08:47:47', '2023-11-13 08:47:47'),
(8, 'App\\Models\\User', 10, 'auth_token', 'd2b265bfa41e8cb781cd903ecb479ff1206705398dea807a78d7783d84bf1146', '[\"*\"]', NULL, NULL, '2023-11-13 08:50:00', '2023-11-13 08:50:00'),
(9, 'App\\Models\\User', 10, 'auth_token', '5b88d36601533109f4711439b87696a7e830c78e91d118d946646d0ab530082c', '[\"*\"]', NULL, NULL, '2023-11-13 08:50:23', '2023-11-13 08:50:23'),
(10, 'App\\Models\\User', 10, 'auth_token', '08c5bc5506326a817f3deb6740c159db863f9d6971b45de537372ad51e69445e', '[\"*\"]', NULL, NULL, '2023-11-13 08:52:37', '2023-11-13 08:52:37'),
(11, 'App\\Models\\User', 10, 'auth_token', 'c92d535fef93052ca7f8d62a3efcb094e4c5876708731a2c5116c586eba4aed5', '[\"*\"]', NULL, NULL, '2023-11-13 08:53:22', '2023-11-13 08:53:22'),
(12, 'App\\Models\\User', 10, 'auth_token', '299decfb42ed453963a7b19060fef8b24080123291204948813a91e6894671d4', '[\"*\"]', NULL, NULL, '2023-11-13 08:54:38', '2023-11-13 08:54:38'),
(13, 'App\\Models\\User', 10, 'auth_token', '2ce0a71e880f763a81a7df2ebfaef4ee25a5c353ea93afeb18905becee5c84dd', '[\"*\"]', NULL, NULL, '2023-11-13 08:55:11', '2023-11-13 08:55:11'),
(14, 'App\\Models\\User', 10, 'auth_token', 'ef16605dcad660432919683022a21314b2f2b5d4c37a2245a792d53d6f9b4014', '[\"*\"]', NULL, NULL, '2023-11-13 08:59:23', '2023-11-13 08:59:23'),
(15, 'App\\Models\\User', 10, 'auth_token', '4869f7562a54473a78b2df34c583099805f4ee7a07d4578c3da8b379be00e316', '[\"*\"]', '2023-11-16 06:25:25', NULL, '2023-11-13 08:59:43', '2023-11-16 06:25:25'),
(16, 'App\\Models\\User', 10, 'auth_token', '1a5d38e2726bcfd21fb9980eb79f4a119026861b891baeba3ddd4bd9a96b3743', '[\"*\"]', NULL, NULL, '2023-11-16 06:40:10', '2023-11-16 06:40:10'),
(17, 'App\\Models\\User', 10, 'auth_token', '368cf059055f3bccc5d28ff1b037aeb1b3d9850fc3b6107d0325bf4944d734a7', '[\"*\"]', NULL, NULL, '2023-11-16 06:41:04', '2023-11-16 06:41:04'),
(18, 'App\\Models\\User', 10, 'auth_token', '6107f1283735ef48ed244e23eb60b1d55494e8c60defc15d5f3a4e60b6074ff3', '[\"*\"]', '2023-11-28 08:37:49', NULL, '2023-11-16 06:42:00', '2023-11-28 08:37:49'),
(19, 'App\\Models\\User', 10, 'auth_token', '12e0eee4078454298ae4c74d02bf4d2e70e5793793b11237ef46c5ab56e19da2', '[\"*\"]', NULL, NULL, '2023-11-16 06:42:30', '2023-11-16 06:42:30'),
(20, 'App\\Models\\User', 10, 'auth_token', '35bb6082c0fbf1976b3d76204532993dcc0cc1e667ba83c4a72a04a407cab695', '[\"*\"]', NULL, NULL, '2023-11-16 06:43:15', '2023-11-16 06:43:15'),
(21, 'App\\Models\\User', 10, 'auth_token', '3be22116a65f24ef78b22dc05483055f2a5812f7cd2ed5a8aba4bc00d783f6b1', '[\"*\"]', NULL, NULL, '2023-11-16 06:43:46', '2023-11-16 06:43:46'),
(22, 'App\\Models\\User', 10, 'auth_token', 'be663256ee4f34ca4dccbc2622bdf7fa54e45c6e4eaf6ea0ff4c6c070eeed8ea', '[\"*\"]', NULL, NULL, '2023-11-16 06:45:07', '2023-11-16 06:45:07'),
(23, 'App\\Models\\User', 10, 'auth_token', 'eb431efd3d8c7f104ad162b6b31f136914ab781c887095d320b55f4ce704782f', '[\"*\"]', NULL, NULL, '2023-11-16 06:46:19', '2023-11-16 06:46:19'),
(24, 'App\\Models\\User', 10, 'auth_token', '0a2b5e60d3cdeaafc4f4b7cd8e451b3adb0da2dd2eafd47a1c26780bd4c4daed', '[\"*\"]', NULL, NULL, '2023-11-16 07:06:49', '2023-11-16 07:06:49'),
(25, 'App\\Models\\User', 10, 'auth_token', '503e9ae1038afb3238a82a100995599fbeb64613beb6490c021029775b659fd9', '[\"*\"]', NULL, NULL, '2023-11-16 07:07:45', '2023-11-16 07:07:45'),
(26, 'App\\Models\\User', 10, 'auth_token', '835a6ac698a8fcf10c98087230a88887585d3f1d564f02bac79fd18620f0dfed', '[\"*\"]', NULL, NULL, '2023-11-16 07:09:26', '2023-11-16 07:09:26'),
(27, 'App\\Models\\User', 10, 'auth_token', 'c5bc409c5e5f0beda860fcec4fe26995440afe5d88ae09694230472255f0fc83', '[\"*\"]', NULL, NULL, '2023-11-16 07:09:52', '2023-11-16 07:09:52'),
(28, 'App\\Models\\User', 10, 'auth_token', '4a90c7fc84a5d59b5f8a18d9fb62b92fcf33149860c3e91913b8bc84ebfcb939', '[\"*\"]', NULL, NULL, '2023-11-16 07:10:11', '2023-11-16 07:10:11'),
(29, 'App\\Models\\User', 10, 'auth_token', 'a489897fc35b53f80dae4ff3a951f744ff6033968b339ffb9f567362a03fa941', '[\"*\"]', NULL, NULL, '2023-11-16 07:30:07', '2023-11-16 07:30:07'),
(30, 'App\\Models\\User', 10, 'auth_token', '88ae8295b1f9bd60f596bb4bcb965ecc271ab00c59d0116e8d3f284fbd1c8484', '[\"*\"]', NULL, NULL, '2023-11-16 07:32:43', '2023-11-16 07:32:43'),
(31, 'App\\Models\\User', 10, 'auth_token', 'f73e58f8d3a26f684b578e1c60030b2254f92df4fd214eee0e64310378eabb61', '[\"*\"]', '2023-11-17 00:27:37', NULL, '2023-11-16 07:33:30', '2023-11-17 00:27:37'),
(32, 'App\\Models\\User', 10, 'auth_token', '59a3cf9e1597bdd86404dfe26efd7f41010681e7c596b6c49de9f88ed671ee8c', '[\"*\"]', '2023-11-29 09:14:32', NULL, '2023-11-17 00:48:01', '2023-11-29 09:14:32'),
(33, 'App\\Models\\User', 12, 'Personal Access Token', '5b72450e87243a056d818bd3bc10d88370797923276ada9cc37eef447b54fef4', '[\"*\"]', NULL, NULL, '2023-11-24 23:51:47', '2023-11-24 23:51:47'),
(34, 'App\\Models\\User', 13, 'Personal Access Token', '6247111b516caef76964690a8e9293b21705dc4e869688ba8fd41ab22ca512aa', '[\"*\"]', NULL, NULL, '2023-11-25 04:44:09', '2023-11-25 04:44:09'),
(35, 'App\\Models\\User', 14, 'Personal Access Token', '16e2dd8cc4a082b985b66949fd9270ecdbc24d0ff97690c7c00d51bb03fafeea', '[\"*\"]', NULL, NULL, '2023-11-25 04:45:26', '2023-11-25 04:45:26'),
(36, 'App\\Models\\User', 15, 'Personal Access Token', '32fbf4ef665a7fa96238e97e0efc01624014cc1725b0569fd96493e4e0737dbb', '[\"*\"]', NULL, NULL, '2023-11-25 04:47:05', '2023-11-25 04:47:05'),
(37, 'App\\Models\\User', 17, 'Personal Access Token', '9bf4b69f6248e862b3b18eafdd0c387a6d040bfe02102de94140c8a4ab839e17', '[\"*\"]', NULL, NULL, '2023-11-25 04:47:24', '2023-11-25 04:47:24'),
(38, 'App\\Models\\User', 19, 'Personal Access Token', 'e2e7dc7494ea3fc47893e7187386153bbc506fc9a599c134ccb6a9915718d5b4', '[\"*\"]', NULL, NULL, '2023-11-25 04:48:13', '2023-11-25 04:48:13'),
(39, 'App\\Models\\User', 20, 'Personal Access Token', 'e340698f1dafc7b45668d920b1fccb04ec3bed52f9ca0d4bb8516a885e1e6a40', '[\"*\"]', NULL, NULL, '2023-11-25 04:48:55', '2023-11-25 04:48:55'),
(40, 'App\\Models\\User', 21, 'Personal Access Token', '30184c0d839301495517122503207f0120eabe2e7b1adabcaba94c9e9e34db05', '[\"*\"]', NULL, NULL, '2023-11-25 23:11:14', '2023-11-25 23:11:14'),
(41, 'App\\Models\\User', 22, 'Personal Access Token', 'ea6091e238ea4ee21c5bc856c17604ebac5c2c926547d9940102801078b6121e', '[\"*\"]', NULL, NULL, '2023-11-25 23:14:04', '2023-11-25 23:14:04'),
(42, 'App\\Models\\User', 23, 'Personal Access Token', '23ec7aed04d041ac25b04714bedcdd6d7758a1bb32273e72c47c70d94d9274ef', '[\"*\"]', NULL, NULL, '2023-11-25 23:14:24', '2023-11-25 23:14:24'),
(43, 'App\\Models\\User', 24, 'Personal Access Token', '11bf7bca02cd62c7f6ba6b0a6969e85c4bf6aedb45d743119c9736d19a5dc446', '[\"*\"]', NULL, NULL, '2023-11-25 23:14:56', '2023-11-25 23:14:56'),
(44, 'App\\Models\\User', 25, 'Personal Access Token', 'c634523a035afd565418acaa0bca45245c40ce46c1339d6eb60baf0997cfb5c0', '[\"*\"]', NULL, NULL, '2023-11-25 23:16:24', '2023-11-25 23:16:24'),
(45, 'App\\Models\\User', 26, 'Personal Access Token', 'dfbb883c54c329a778836355ba0d379109c3a4fdf55f75e95cc2344d429030d2', '[\"*\"]', NULL, NULL, '2023-11-25 23:16:47', '2023-11-25 23:16:47'),
(46, 'App\\Models\\User', 27, 'Personal Access Token', 'a9b926531a2a801cdc5318b3391839bb654673b96499531381d7647acb96c549', '[\"*\"]', NULL, NULL, '2023-11-26 02:56:13', '2023-11-26 02:56:13'),
(47, 'App\\Models\\User', 28, 'Personal Access Token', 'eb9a826e1301a191ae244c8e6e6c2a1e38ebfca5f5fa71fa7d5cbd40c67cdd8a', '[\"*\"]', NULL, NULL, '2023-11-26 03:07:07', '2023-11-26 03:07:07'),
(48, 'App\\Models\\User', 29, 'Personal Access Token', '0278408834d36b9f9e43b048ec59456ace0e3bb8570580b12bb627c9d1cbe513', '[\"*\"]', NULL, NULL, '2023-11-26 03:07:08', '2023-11-26 03:07:08'),
(49, 'App\\Models\\User', 34, 'Personal Access Token', '48062be0affb2cbfd97b77902ca29c9a3dec1c4ead7f5b00de9165b318e7ddbc', '[\"*\"]', NULL, NULL, '2023-11-26 04:33:10', '2023-11-26 04:33:10'),
(50, 'App\\Models\\User', 45, 'Personal Access Token', '623cf726dd8e748139a64027037adc53ac56bd128c45e8b04fbf2d0529798808', '[\"*\"]', NULL, NULL, '2023-11-26 05:03:31', '2023-11-26 05:03:31'),
(51, 'App\\Models\\User', 47, 'Personal Access Token', 'bee48fc222c8b4315fa076bd2c8bfeb5b8df3ad8117d34c8082defd7c08ffc0f', '[\"*\"]', NULL, NULL, '2023-11-26 05:04:12', '2023-11-26 05:04:12'),
(52, 'App\\Models\\User', 48, 'Personal Access Token', '2789d5d886839c7a2c10736bc098fa46ddd4bb59c6c0677dc4f81f28d9636fef', '[\"*\"]', NULL, NULL, '2023-11-26 07:20:57', '2023-11-26 07:20:57'),
(53, 'App\\Models\\User', 49, 'Personal Access Token', 'a29fd4548b85dd9b664a6fc1e27a0759cdf94ad605e4ccca7863ff46d9c57323', '[\"*\"]', NULL, NULL, '2023-11-26 07:21:57', '2023-11-26 07:21:57'),
(54, 'App\\Models\\User', 50, 'Personal Access Token', '4f11bc4c75880d3dd21b0b3f06c9de75d9d3c26d9cfac494a63cf58420b790ae', '[\"*\"]', NULL, NULL, '2023-11-26 07:26:54', '2023-11-26 07:26:54'),
(55, 'App\\Models\\User', 51, 'Personal Access Token', '678d7bd5ce383a71224f1733b1e7cd09899a68ad3350f5c33f2f8cdefa5234da', '[\"*\"]', NULL, NULL, '2023-11-26 07:28:00', '2023-11-26 07:28:00'),
(56, 'App\\Models\\User', 52, 'Personal Access Token', 'b6a9a5ebcf1cc046c8c51b2d2381ba39987657440981a4febaa0bd62b4ef0864', '[\"*\"]', NULL, NULL, '2023-11-26 07:28:01', '2023-11-26 07:28:01'),
(57, 'App\\Models\\User', 53, 'Personal Access Token', '25c2b696950c4d168594d63c4b14ded2948fc233fdb24d1c26dd679146bfc79b', '[\"*\"]', NULL, NULL, '2023-11-26 07:28:02', '2023-11-26 07:28:02');

-- --------------------------------------------------------

--
-- Table structure for table `short`
--

CREATE TABLE `short` (
  `id` int(11) NOT NULL,
  `question` varchar(522) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  `bid` int(11) NOT NULL,
  `std` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `short`
--

INSERT INTO `short` (`id`, `question`, `answer`, `bid`, `std`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test is short?', '12', 1, 23476436, '2023-11-29 10:33:51', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `name`) VALUES
(1, 'Physics');

-- --------------------------------------------------------

--
-- Table structure for table `true_false`
--

CREATE TABLE `true_false` (
  `id` int(11) NOT NULL,
  `bid` int(52) NOT NULL,
  `std` int(11) NOT NULL,
  `question` varchar(522) NOT NULL,
  `answer` varchar(522) NOT NULL,
  `solution` varchar(522) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `true_false`
--

INSERT INTO `true_false` (`id`, `bid`, `std`, `question`, `answer`, `solution`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 23476436, 'test is true false?', '12', 'sfdsfgdsg', '2023-11-29 06:28:09', '2023-11-29 06:38:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` varchar(12) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `std` int(20) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_verified` int(1) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `number`, `user_type`, `std`, `school`, `subject`, `email_verified_at`, `password`, `is_verified`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '0', '1234567890', 'student', 1, 'test', NULL, NULL, 'test', 1, NULL, NULL, NULL, '2023-11-26 04:56:22'),
(3, '0', '1234567891', 'student', 1, 'test', NULL, NULL, 'test', 0, NULL, NULL, NULL, '2023-11-26 04:58:40'),
(4, '0', '1234567893', 'test', 1, 'test', NULL, NULL, 'test', 0, NULL, NULL, NULL, NULL),
(6, '0', '1234567894', 'test', 1, 'test', NULL, NULL, 'test', 0, NULL, NULL, NULL, NULL),
(7, '0', '1234567895', 'test', 1, 'test', NULL, NULL, '$2y$12$VEUP0eGTzFpdIPAa5TNN2eR8bOyoojtvolisMbVH9/6v/pBS0x9la', 0, NULL, '2023-11-05 08:40:46', '2023-11-05 08:40:46', NULL),
(10, '0', '1234567896', 'test', 1, 'test', NULL, NULL, '$2y$12$Wy6wdnRbIlewMyhqfDt.q..syK9zTnRDRGeeHeVad7WljdPj1rRvG', 1, NULL, '2023-11-05 08:48:14', '2023-11-05 08:48:14', NULL),
(11, '0', '1234567897', 'teacher', 1, 'test', 'Physics', NULL, '$2y$12$yqadjhneNYsSThCUYDgBuudxXorxbSDrOifMpj0BqlYanEbPLBt5K', 0, NULL, '2023-11-13 06:23:05', '2023-11-13 06:23:05', '2023-11-28 07:51:32'),
(12, 'test', '1235768628', 'teacher', 1, 'test', NULL, NULL, '$2y$12$hM2n0EWQLi8qcoOhRymjiuufcFrhs7kLNs1dlHn7UXHJ9EjXLCHNi', 0, NULL, '2023-11-24 23:51:47', '2023-11-24 23:51:47', NULL),
(13, 'sid', '1334567328', 'teacher', 1, 'sid', NULL, NULL, '$2y$12$KOzzYJcDE2/R8Ru/pZiz2eAWNFzmaY4Kl.kRwutU//WEDpHtPWvjy', 0, NULL, '2023-11-25 04:44:09', '2023-11-25 04:44:09', NULL),
(14, 'safs', '2454657874', 'teacher', 10, 'saf', NULL, NULL, '$2y$12$9kBV7Cs7Hay/dnyOTFNTYOxVjPJXQJNZA9g86CZNjOI6/erRcQR4i', 0, NULL, '2023-11-25 04:45:26', '2023-11-25 04:45:26', NULL),
(15, 'dsf', '2345678909', 'teacher', 10, 'sdf', NULL, NULL, '$2y$12$sFmeri2DMfwpSOiNGc7IQ.zQDkHH.XE0jkJtdhDizD2avCN5veuFe', 0, NULL, '2023-11-25 04:47:05', '2023-11-25 04:47:05', NULL),
(17, 'test', '2342343243', 'teacher', 1, 'test', NULL, NULL, '$2y$12$5/SU1nJ5O4soNrWQyLf0..zVX3sgnOlsmptCi9ncskFkFsd77FtbW', 0, NULL, '2023-11-25 04:47:24', '2023-11-25 04:47:24', NULL),
(19, 'test', '234234321', 'teacher', 1, 'test', NULL, NULL, '$2y$12$fUvhs4owhsX2i1tOdQXh3.KpV4fbtkLaKwCcAvRqnBUsOZsaO0.0G', 0, NULL, '2023-11-25 04:48:13', '2023-11-25 04:48:13', NULL),
(20, 'test', '234234', 'teacher', 1, 'test', 'Physics', NULL, '$2y$12$J.Me90YJ00MimpkzjzyVCO3xG27EiFuVVc6rl/H69umobbS83bGRi', 0, NULL, '2023-11-25 04:48:55', '2023-11-25 04:48:55', NULL),
(21, 'test', '1', 'student', 2, 'abc', NULL, NULL, '$2y$12$IUB.My74tYDeVRE6d7GrIO67X5huYGYpNzjAowy4OQSsxI83gwP2C', 0, NULL, '2023-11-25 23:11:14', '2023-11-25 23:11:14', NULL),
(22, 'test', '3243767653', 'student', 9, 'rer', NULL, NULL, '$2y$12$FcUmpX4dIFojRLx.JSJVYOtGSVEKXGWarxljubAxe71YRSuOaRDN.', 0, NULL, '2023-11-25 23:14:04', '2023-11-25 23:14:04', NULL),
(23, 'sfs', '3546789765', 'student', 9, 'dvx', NULL, NULL, '$2y$12$qbzBZT8jspw6KWVkanlwIu9eI7.GELSHOPGzWqttkSyrlPYP7e..i', 0, NULL, '2023-11-25 23:14:24', '2023-11-25 23:14:24', NULL),
(24, 'dsf', '3456746477', 'student', 9, 'vd5ds', NULL, NULL, '$2y$12$hMidd0Ni8VAuzC8XgetGDulNWq0jfkBDBRQjDiyLDeKmLGcLb4NNu', 0, NULL, '2023-11-25 23:14:56', '2023-11-25 23:14:56', NULL),
(25, 'fsd', '4356789765', 'student', 8, 'dvx', NULL, NULL, '$2y$12$gVA45Ljgv1w831kApeYwluBYWBmtwHTynkbC.uNIJyqMj83tqbLVW', 0, NULL, '2023-11-25 23:16:24', '2023-11-25 23:16:24', NULL),
(26, 'rsdgb', '3546789087', 'student', 9, 'cxvb', NULL, NULL, '$2y$12$3f5oKiwnSu88USc/DszKFeyQIsjZVLLOUVbNE8UGM12zVtl4MVMPS', 0, NULL, '2023-11-25 23:16:47', '2023-11-25 23:16:47', NULL),
(27, 'ds', '2345676867', 'teacher', 10, 'dgd', 'Physics', NULL, '$2y$12$B5ULcbzHQc0pGk4Q0LKQwe/D8jjijNR.rFKnnPqHJ2KsKlx/Z8P2m', 0, NULL, '2023-11-26 02:56:13', '2023-11-26 02:56:13', NULL),
(28, 'sid', '2347864365', 'teacher', 0, 'sd', 'sds', NULL, '$2y$12$px4ITnt8IbU3Coe2uV.6y.fmxSSmtJ9udxoItJDxP6GSvNxPav8su', 0, NULL, '2023-11-26 03:07:07', '2023-11-26 03:07:07', NULL),
(29, 'sid1', '2347824365', 'teacher', 0, 'sd', 'sds', NULL, '$2y$12$IDVKfUSsWhrXhWSGJ.7iV.TUhT.kmWISh/SpmZ1pUXiuBNEzd5A8q', 0, NULL, '2023-11-26 03:07:08', '2023-11-26 03:07:08', NULL),
(34, 'sid', '234764365', 'teacher', 0, 'sd', 'sds', NULL, '$2y$12$8kYVH2v60MICNCqLpJhUEOyYXk15q9nDWSyoGv6CQIMiZkhKmGACu', 0, NULL, '2023-11-26 04:33:10', '2023-11-26 04:33:10', NULL),
(45, 'sid', '23476436', 'student', 0, 'sd', NULL, NULL, '$2y$12$x96NHizx/m1bWoGJ2wuQjuV/S6u9Wgti74lEO5VZtnTos3x8t48oe', 0, NULL, '2023-11-26 05:03:31', '2023-11-26 05:03:31', NULL),
(47, 'sid', '234766365', 'student', 0, 'sd', NULL, NULL, '$2y$12$ZgLXwp15ke7PHTv9DZ6rSun12sNgpuGbE0FyyGbLA.lOmUCJSdCiW', 0, NULL, '2023-11-26 05:04:12', '2023-11-26 05:04:12', NULL),
(48, 'Siddharth', '8347387478', 'teacher', 8, 'hjsh', 'Physics', NULL, '$2y$12$mZlm3FWQJSj5V3gs4i8u7ODrBYKY9umdodB17rIVvXogfh9ionC86', 0, NULL, '2023-11-26 07:20:57', '2023-11-26 07:20:57', NULL),
(49, 'sid', '875837887', 'teacher', 0, 'sd', 'sds', NULL, '$2y$12$MocY2Mai934.t1cBNhqXpOjGMX7HneyGBhCNRUgJbk90drZwOgGuW', 0, NULL, '2023-11-26 07:21:57', '2023-11-26 07:21:57', NULL),
(50, 'test', '8573875456', 'teacher', 6, 'skdhfjg', 'Physics', NULL, '$2y$12$sSZRp9GmyGEoiYPTqWPn8u5Pu0ogdCjGEarVSFNZyI/bHbc7fIt/e', 0, NULL, '2023-11-26 07:26:54', '2023-11-26 07:26:54', NULL),
(51, 'sid', '875877887', 'teacher', 0, 'sd', 'sds', NULL, '$2y$12$elLwE4z3zbVQO.9tWqKORuZDGqM1WFIYqeUa8hadRs8izMH4DbBmy', 0, NULL, '2023-11-26 07:28:00', '2023-11-26 07:28:00', NULL),
(52, 'sid', '8758776887', 'teacher', 0, 'sd', 'sds', NULL, '$2y$12$bkPziqxFGUn/yqfKk89j4urH4d.jFUMhlqrEFr2XTiTSDhVpaq/hq', 1, NULL, '2023-11-26 07:28:01', '2023-11-26 07:28:01', NULL),
(53, 'sid', '875844887', 'teacher', 0, 'sd', 'sds', NULL, '$2y$12$0e67Mte1IQhy1SxrbIWDQOdW9N8WvDw/f317mGSDwU1v9ERy3If8m', 1, NULL, '2023-11-26 07:28:02', '2023-11-26 07:28:02', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blanks`
--
ALTER TABLE `blanks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `long`
--
ALTER TABLE `long`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mcq`
--
ALTER TABLE `mcq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `onetwo`
--
ALTER TABLE `onetwo`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `short`
--
ALTER TABLE `short`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `true_false`
--
ALTER TABLE `true_false`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blanks`
--
ALTER TABLE `blanks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `board`
--
ALTER TABLE `board`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `long`
--
ALTER TABLE `long`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mcq`
--
ALTER TABLE `mcq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `onetwo`
--
ALTER TABLE `onetwo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `short`
--
ALTER TABLE `short`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `true_false`
--
ALTER TABLE `true_false`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2025 at 12:46 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `worksquare-fullstack-task`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `listings`
--

CREATE TABLE `listings` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `bedrooms` int NOT NULL,
  `bathrooms` int NOT NULL,
  `status` json NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `listings`
--

INSERT INTO `listings` (`id`, `title`, `type`, `location`, `price`, `bedrooms`, `bathrooms`, `status`, `image`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Brand New 4 Bedroom Fully Detached Duplex With BQ', 'house', 'Lekki, Lagos', 2500000.00, 4, 4, '{\"type\": \"house\", \"status\": \"rent\"}', '/assets/images/property1.jpg', 'A beautiful property located in Lekki, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(2, 'Luxury 5 Bedroom Duplex with Pool', 'house', 'Gwarinpa, Abuja', 3800000.00, 5, 5, '{\"type\": \"house\", \"status\": \"rent\"}', '/assets/images/property2.jpg', 'A beautiful property located in Gwarinpa, Abuja', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(3, '3 Bedroom Flat with Modern Finishing', 'flat', 'Ikeja, Lagos', 1200000.00, 3, 2, '{\"type\": \"flat\", \"status\": \"rent\"}', '/assets/images/property3.jpg', 'A beautiful property located in Ikeja, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(4, 'Spacious 4 Bedroom Terrace in Secure Estate', 'terrace', 'Maitama, Abuja', 2000000.00, 4, 3, '{\"type\": \"terrace\", \"status\": \"rent\"}', '/assets/images/property4.jpg', 'A beautiful property located in Maitama, Abuja', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(5, 'Massive 6 Bedroom Mansion with 2 Living Rooms', 'house', 'Lekki Phase 1, Lagos', 4500000.00, 6, 5, '{\"type\": \"house\", \"status\": \"lease\"}', '/assets/images/property5.jpg', 'A beautiful property located in Lekki Phase 1, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(6, 'Affordable 2 Bedroom Bungalow in Gated Estate', 'house', 'Abeokuta, Ogun', 1000000.00, 2, 2, '{\"type\": \"house\", \"status\": \"rent\"}', '/assets/images/property6.jpg', 'A beautiful property located in Abeokuta, Ogun', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(7, 'Fully Serviced 5 Bedroom Duplex', 'house', 'Asokoro, Abuja', 3200000.00, 5, 4, '{\"type\": \"house\", \"status\": \"rent\"}', '/assets/images/property7.jpg', 'A beautiful property located in Asokoro, Abuja', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(8, 'One Bedroom Apartment for Single Professionals', 'flat', 'Surulere, Lagos', 850000.00, 1, 1, '{\"type\": \"flat\", \"status\": \"rent\"}', '/assets/images/property8.jpg', 'A beautiful property located in Surulere, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(9, 'Elegant 4 Bedroom Terrace in Central Abuja', 'terrace', 'Wuse 2, Abuja', 2800000.00, 4, 4, '{\"type\": \"terrace\", \"status\": \"lease\"}', '/assets/images/property9.jpg', 'A beautiful property located in Wuse 2, Abuja', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(10, '3 Bedroom Apartment with Ample Parking', 'flat', 'Magodo, Lagos', 1700000.00, 3, 3, '{\"type\": \"flat\", \"status\": \"rent\"}', '/assets/images/property10.jpg', 'A beautiful property located in Magodo, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(11, 'High-End 5 Bedroom Penthouse with Ocean View', 'penthouse', 'Ikoyi, Lagos', 3500000.00, 5, 4, '{\"type\": \"penthouse\", \"status\": \"lease\"}', '/assets/images/property11.jpg', 'A beautiful property located in Ikoyi, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(12, 'Newly Renovated 4 Bedroom Duplex', 'house', 'Yaba, Lagos', 2000000.00, 4, 3, '{\"type\": \"house\", \"status\": \"rent\"}', '/assets/images/property12.jpg', 'A beautiful property located in Yaba, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(13, 'Spacious Duplex with Modern Kitchen', 'duplex', 'Lugbe, Abuja', 2900000.00, 4, 4, '{\"type\": \"duplex\", \"status\": \"rent\"}', '/assets/images/property13.jpg', 'A beautiful property located in Lugbe, Abuja', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(14, '3 Bedroom Unit in a Gated Community', 'flat', 'Ogudu, Lagos', 1300000.00, 3, 2, '{\"type\": \"flat\", \"status\": \"rent\"}', '/assets/images/property14.jpg', 'A beautiful property located in Ogudu, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(15, 'Ultra-Modern Mansion with Elevator & Cinema', 'house', 'Banana Island, Lagos', 5000000.00, 6, 5, '{\"type\": \"house\", \"status\": \"lease\"}', '/assets/images/property15.jpg', 'A beautiful property located in Banana Island, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(16, 'Budget Friendly 2 Bedroom Flat', 'flat', 'Apapa, Lagos', 1000000.00, 2, 1, '{\"type\": \"flat\", \"status\": \"rent\"}', '/assets/images/property16.jpg', 'A beautiful property located in Apapa, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(17, 'Executive 4 Bedroom Duplex with BQ', 'duplex', 'Utako, Abuja', 2300000.00, 4, 3, '{\"type\": \"duplex\", \"status\": \"rent\"}', '/assets/images/property17.jpg', 'A beautiful property located in Utako, Abuja', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(18, 'Fully Furnished 4 Bedroom Short Let', 'short let', 'Lekki, Lagos', 2600000.00, 4, 4, '{\"type\": \"short let\", \"status\": \"rent\"}', '/assets/images/property18.jpg', 'A beautiful property located in Lekki, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(19, 'Brand New 4 Bedroom Semi Detached', 'house', 'Jahi, Abuja', 3000000.00, 4, 3, '{\"type\": \"house\", \"status\": \"lease\"}', '/assets/images/property19.jpg', 'A beautiful property located in Jahi, Abuja', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(20, 'Affordable 3 Bedroom Apartment', 'flat', 'Ojodu Berger, Lagos', 1500000.00, 3, 2, '{\"type\": \"flat\", \"status\": \"rent\"}', '/assets/images/property20.jpg', 'A beautiful property located in Ojodu Berger, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(21, 'Brand New 4 Bedroom Fully Detached Duplex With BQ', 'house', 'Lekki, Lagos', 2500000.00, 4, 4, '{\"type\": \"house\", \"status\": \"rent\"}', '/assets/images/property1.jpg', 'A beautiful property located in Lekki, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(22, 'Modern 3 Bedroom Terrace With Smart Features', 'house', 'Gwarinpa, Abuja', 1800000.00, 3, 3, '{\"type\": \"house\", \"status\": \"rent\"}', '/assets/images/property2.jpg', 'A beautiful property located in Gwarinpa, Abuja', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(23, 'Luxury 5 Bedroom Duplex with Pool & Cinema', 'house', 'Maitama, Abuja', 5500000.00, 5, 6, '{\"type\": \"house\", \"status\": \"rent\"}', '/assets/images/property3.jpg', 'A beautiful property located in Maitama, Abuja', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(24, 'Elegant 2 Bedroom Apartment in Secure Estate', 'apartment', 'Ikeja, Lagos', 950000.00, 2, 2, '{\"type\": \"apartment\", \"status\": \"rent\"}', '/assets/images/property4.jpg', 'A beautiful property located in Ikeja, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(25, '4 Bedroom Semi Detached with BQ', 'house', 'Ajah, Lagos', 2000000.00, 4, 4, '{\"type\": \"house\", \"status\": \"rent\"}', '/assets/images/property5.jpg', 'A beautiful property located in Ajah, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(26, 'Smart 1 Bedroom Studio Apartment', 'apartment', 'Yaba, Lagos', 600000.00, 1, 1, '{\"type\": \"apartment\", \"status\": \"rent\"}', '/assets/images/property6.jpg', 'A beautiful property located in Yaba, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(27, 'Newly Built 3 Bedroom Flat', 'flat', 'Abule Egba, Lagos', 1300000.00, 3, 3, '{\"type\": \"flat\", \"status\": \"rent\"}', '/assets/images/property7.jpg', 'A beautiful property located in Abule Egba, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(28, 'Furnished 2 Bedroom Shortlet Apartment', 'apartment', 'Wuse 2, Abuja', 200000.00, 2, 2, '{\"type\": \"apartment\", \"status\": \"shortlet\"}', '/assets/images/property8.jpg', 'A beautiful property located in Wuse 2, Abuja', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(29, '5 Bedroom Duplex with Parking Space', 'house', 'Asokoro, Abuja', 3000000.00, 5, 5, '{\"type\": \"house\", \"status\": \"rent\"}', '/assets/images/property9.jpg', 'A beautiful property located in Asokoro, Abuja', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(30, '3 Bedroom Apartment in Gated Estate', 'flat', 'Chevron, Lekki', 1700000.00, 3, 3, '{\"type\": \"flat\", \"status\": \"rent\"}', '/assets/images/property10.jpg', 'A beautiful property located in Chevron, Lekki', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(31, 'Newly Renovated 2 Bedroom Apartment', 'apartment', 'Gbagada, Lagos', 1000000.00, 2, 2, '{\"type\": \"apartment\", \"status\": \"rent\"}', '/assets/images/property11.jpg', 'A beautiful property located in Gbagada, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(32, 'Fully Furnished 1 Bedroom Apartment', 'apartment', 'Ilupeju, Lagos', 750000.00, 1, 1, '{\"type\": \"apartment\", \"status\": \"rent\"}', '/assets/images/property12.jpg', 'A beautiful property located in Ilupeju, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(33, 'Brand New 4 Bedroom Duplex + BQ', 'house', 'Osapa, Lekki', 2800000.00, 4, 4, '{\"type\": \"house\", \"status\": \"rent\"}', '/assets/images/property13.jpg', 'A beautiful property located in Osapa, Lekki', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(34, '4 Bedroom Terrace + BQ in Gated Estate', 'terrace', 'Life Camp, Abuja', 2400000.00, 4, 4, '{\"type\": \"terrace\", \"status\": \"rent\"}', '/assets/images/property14.jpg', 'A beautiful property located in Life Camp, Abuja', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(35, '3 Bedroom Penthouse Apartment', 'penthouse', 'Ikoyi, Lagos', 3200000.00, 3, 4, '{\"type\": \"penthouse\", \"status\": \"rent\"}', '/assets/images/property15.jpg', 'A beautiful property located in Ikoyi, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(36, 'Serviced Studio Apartment with Gym', 'apartment', 'Katampe, Abuja', 850000.00, 1, 1, '{\"type\": \"apartment\", \"status\": \"rent\"}', '/assets/images/property16.jpg', 'A beautiful property located in Katampe, Abuja', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(37, 'Furnished 4 Bedroom Duplex + BQ', 'house', 'Lekki Phase 1, Lagos', 3500000.00, 4, 5, '{\"type\": \"house\", \"status\": \"rent\"}', '/assets/images/property17.jpg', 'A beautiful property located in Lekki Phase 1, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(38, 'Luxury 1 Bedroom Apartment – Shortlet', 'apartment', 'Victoria Island, Lagos', 150000.00, 1, 1, '{\"type\": \"apartment\", \"status\": \"shortlet\"}', '/assets/images/property18.jpg', 'A beautiful property located in Victoria Island, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(39, 'Detached 5 Bedroom Mansion + Pool', 'mansion', 'Banana Island, Lagos', 6000000.00, 5, 6, '{\"type\": \"mansion\", \"status\": \"rent\"}', '/assets/images/property19.jpg', 'A beautiful property located in Banana Island, Lagos', '2025-05-29 10:37:39', '2025-05-29 10:37:39'),
(40, '3 Bedroom Smart Apartment', 'apartment', 'Lokogoma, Abuja', 1900000.00, 3, 3, '{\"type\": \"apartment\", \"status\": \"rent\"}', '/assets/images/property20.jpg', 'A beautiful property located in Lokogoma, Abuja', '2025-05-29 10:37:39', '2025-05-29 10:37:39');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_05_27_220501_create_listings_table', 1),
(6, '2025_05_29_105334_add_type_to_listings_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth-token', 'f5f1ef618be513bdfa1b98904c3c5d25bdeee0e649077815ad2a8c27d661aabe', '[\"*\"]', '2025-05-29 02:03:49', NULL, '2025-05-29 01:39:25', '2025-05-29 02:03:49'),
(2, 'App\\Models\\User', 1, 'token', '71f924931b57d11aebf209b2ac35f78c580db025e5c57a94743432cfaf864b7f', '[\"*\"]', NULL, NULL, '2025-05-29 01:42:35', '2025-05-29 01:42:35'),
(3, 'App\\Models\\User', 1, 'token', 'db447efe7490f0cec709416d8ddb360d4f1e109bf70cda99082d66ed71f3331c', '[\"*\"]', NULL, NULL, '2025-05-29 01:44:31', '2025-05-29 01:44:31'),
(4, 'App\\Models\\User', 1, 'token', '24c591c70cd46967ffdfd617fde4353f492269798cc156aba115f0145776543a', '[\"*\"]', NULL, NULL, '2025-05-29 01:52:37', '2025-05-29 01:52:37'),
(5, 'App\\Models\\User', 1, 'token', 'fe728630922dbcb6864023ff3989143576d105c90b6726d92db345b4fd23211a', '[\"*\"]', '2025-05-29 02:01:54', NULL, '2025-05-29 01:53:46', '2025-05-29 02:01:54'),
(6, 'App\\Models\\User', 1, 'token', '9a7715cb7be28f29e6ddb7c74cd3326e64cb862b7c744f0bbc80b53c06f5f390', '[\"*\"]', '2025-05-29 02:19:44', NULL, '2025-05-29 02:03:15', '2025-05-29 02:19:44'),
(7, 'App\\Models\\User', 1, 'token', 'a6fa0c76ab817c363803f5595aaf04d63571b6f1d0d2e4e7cf23dcafedd9baee', '[\"*\"]', '2025-05-29 02:26:02', NULL, '2025-05-29 02:23:36', '2025-05-29 02:26:02'),
(8, 'App\\Models\\User', 2, 'auth-token', 'f392cdc369c025d73362e5b6443ea80b165ad3918036219676932580ee07aee2', '[\"*\"]', NULL, NULL, '2025-05-29 02:24:40', '2025-05-29 02:24:40'),
(9, 'App\\Models\\User', 2, 'token', '00725db4161702af0318957d2982f398f6c08139c3d189d02a475f80e0ab80ec', '[\"*\"]', '2025-05-29 02:27:05', NULL, '2025-05-29 02:26:37', '2025-05-29 02:27:05'),
(11, 'App\\Models\\User', 3, 'auth-token', 'b144e3e5ef16e480854827028f682c33902380abc99c3460040acb22cfa812fb', '[\"*\"]', NULL, NULL, '2025-05-29 09:29:44', '2025-05-29 09:29:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Chijindu', 'test@example.com', NULL, '$2y$10$YR/7kU3n0EbxLJQ89H63jucTuN5Yv23Xy83RpMaMfIlJbjVmMTabm', NULL, '2025-05-29 01:39:25', '2025-05-29 01:39:25'),
(2, 'Chibuike', 'test2@example.com', NULL, '$2y$10$brFiuxEt/67xmMFSB0q6t.F4ciUaWVEMVk0b/iwhbfDIzwq7ytmgS', NULL, '2025-05-29 02:24:40', '2025-05-29 02:24:40'),
(3, 'Obinna', 'test3@example.com', NULL, '$2y$10$HPdClBYu689y.gxwv9470eAoH/wNJPvbzNVyreC2.9FlpEFkgWD7.', NULL, '2025-05-29 09:29:44', '2025-05-29 09:29:44'),
(4, 'Sunday', 'test4@example.com', NULL, '$2y$10$RqXwXEEnpfkLJf659eIeuOgH9Q0beI.xFc9gl5VocRUpaid6OjjdW', NULL, '2025-05-29 11:29:18', '2025-05-29 11:29:18'),
(5, 'Sunday', 'test5@example.com', NULL, '$2y$10$FZdeUr7qeknUTSLmyf6h/e9Xmpjnv4bvL7SPMisuO3P9bKjS3EtPO', NULL, '2025-05-29 11:34:59', '2025-05-29 11:34:59'),
(6, 'Bright', 'test6@example.com', NULL, '$2y$10$2ZndglTkKtRoMNAE5WskRuLBkkUAuLpEyWbGGibqXtR8mqtczx.HG', NULL, '2025-05-29 11:53:56', '2025-05-29 11:53:56'),
(7, 'Funny', 'test7@example.com', NULL, '$2y$10$anJojXykd7ZkmAvgdUWsouc.H/XbwKblU0E8HSh0gktVxh9WhHipK', NULL, '2025-05-29 21:50:54', '2025-05-29 21:50:54');

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
-- Indexes for table `listings`
--
ALTER TABLE `listings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `listings`
--
ALTER TABLE `listings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

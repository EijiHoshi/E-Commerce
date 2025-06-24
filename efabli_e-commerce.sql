-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jun 2025 pada 14.20
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `efabli_e-commerce`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `street_address` varchar(255) NOT NULL,
  `detail` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `name`, `phone`, `province`, `city`, `district`, `postal_code`, `street_address`, `detail`, `created_at`, `updated_at`) VALUES
(1, 3, 'Rumah', '081234567890', 'Jawa Barat', 'Bandung', 'Cicendo', '40171', 'Jl. Contoh No. 123', 'Dekat pasar', '2025-06-13 04:54:45', '2025-06-13 04:54:45'),
(2, 11, 'Rumah', '081234567890', 'Jawa Barat', 'Bandung', 'Cicendo', '40171', 'Jl. Contoh No. 123', 'Dekat pasar', '2025-06-20 03:28:27', '2025-06-20 03:28:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `banners`
--

INSERT INTO `banners` (`id`, `title`, `image`, `link`, `created_at`, `updated_at`) VALUES
(1, 'Promo Akhir Tahun', 'images/banners/promo-akhir-tahun.jpg', '/promo/akhir-tahun', '2025-06-13 04:52:35', '2025-06-13 04:52:35'),
(2, 'Produk Terbaru', 'images/banners/produk-terbaru.jpg', '/produk/terbaru', '2025-06-13 04:52:35', '2025-06-13 04:52:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 2, '2025-06-13 04:55:04', '2025-06-13 04:55:04'),
(8, 10, 1, 2, '2025-06-24 04:04:17', '2025-06-24 04:05:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Elektronik', 'elektronik', 'Produk elektronik seperti smartphone, laptop, dan gadget lainnya', 'images/categories/elektronik.jpg', 1, '2025-06-13 04:52:35', '2025-06-13 04:52:35', NULL),
(2, 'Fashion', 'fashion', 'Pakaian, sepatu, dan aksesoris fashion', 'images/categories/fashion.jpg', 1, '2025-06-13 04:52:35', '2025-06-13 04:52:35', NULL),
(3, 'Kesehatan', 'kesehatan', 'Produk kesehatan dan kecantikan', 'images/categories/kesehatan.jpg', 1, '2025-06-13 04:52:35', '2025-06-13 04:52:35', NULL),
(4, 'Rumah Tangga', 'rumah-tangga', 'Peralatan dan perlengkapan rumah tangga', 'images/categories/rumah-tangga.jpg', 1, '2025-06-13 04:52:35', '2025-06-13 04:52:35', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_03_19_create_notifications_table', 1),
(6, '2024_03_19_create_payment_methods_table', 1),
(7, '2025_04_28_111845_create_addresses_table', 1),
(8, '2025_04_28_112021_create_orders_table', 1),
(9, '2025_04_28_112200_create_order_tracking_table', 1),
(10, '2025_04_28_112250_create_payments_table', 1),
(11, '2025_05_23_001124_add_gender_to_users_table', 1),
(12, '2025_05_25_105937_create_banners_table', 1),
(13, '2025_05_27_022724_add_status_dibatalkan_to_orders_table', 1),
(14, '2025_06_13_104257_create_categories_table', 1),
(15, '2025_06_13_104258_create_products_table', 1),
(16, '2025_06_13_104300_create_product_reviews_table', 1),
(17, '2025_06_13_104400_create_wishlists_table', 1),
(18, '2025_06_13_104500_create_carts_table', 1),
(19, '2025_06_13_104600_create_cart_items_table', 1),
(20, '2025_06_13_104700_create_order_items_table', 1),
(21, '2025_06_13_104800_add_is_recommended_to_products_table', 1),
(22, '2025_06_24_003832_add_email_verification_token_to_users_table', 2),
(23, '2025_06_24_005356_add_email_verification_code_to_users_table', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'unread',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `type`, `status`, `data`, `created_at`, `updated_at`) VALUES
(1, 3, 'Pembayaran Diterima', 'Pembayaran untuk pesanan #1 telah diterima', 'payment_received', 'unread', '{\"order_id\":1,\"payment_id\":1}', '2025-06-13 04:55:57', '2025-06-13 04:55:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('Menunggu Pembayaran','Diproses','Dikirim','Diterima','Dibatalkan') NOT NULL DEFAULT 'Menunggu Pembayaran',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address_id`, `total_amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 10000000.00, 'Menunggu Pembayaran', '2025-06-13 04:55:27', '2025-06-13 04:55:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 5000000.00, '2025-06-13 04:55:27', '2025-06-13 04:55:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_tracking`
--

CREATE TABLE `order_tracking` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('efabliapp@gmail.com', '$2y$12$yDCVjuBoRK6D8WvAUYmAi.ULnkQt1rdqWN6xgT2dxQUQewjypD206', '2025-06-20 03:51:15'),
('eijisla7@gmail.com', '$2y$12$mLQYZlsu.0lpyvaxmRYWles2tZvifhKGVIikL/LIK5hdTGGXDodO6', '2025-06-20 03:50:28'),
('febriansyah1469@gmail.com', '$2y$12$CMlo91hZNhfvDwvU2s.FIewFheN/iAUQ10PUNNFFbNgS6grOTQovq', '2025-06-18 03:52:48'),
('putrabintangramadhan26@gmail.com', '$2y$12$jnAh1gaXbKytraj6/G6pi.92DEEONSKknEnNCcivX/iiAYZIVDuzC', '2025-06-23 08:18:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `payment_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_details`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `payment_method_id`, `amount`, `status`, `transaction_id`, `payment_details`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10000000.00, 'pending', NULL, '{\"transaction_id\":\"TRX684c11cdda8a8\",\"payment_url\":\"https:\\/\\/payment-gateway.com\\/pay\\/TRX684c11cdda8a9\",\"expired_at\":\"2025-06-14T11:55:57.895165Z\"}', '2025-06-13 04:55:57', '2025-06-13 04:55:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`config`)),
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `code`, `type`, `config`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Transfer Bank', 'bank_transfer', 'bank_transfer', '{\"banks\":{\"bca\":\"Bank Central Asia\",\"mandiri\":\"Bank Mandiri\",\"bni\":\"Bank Negara Indonesia\"}}', 1, '2025-06-13 04:52:35', '2025-06-13 04:52:35'),
(2, 'E-Wallet', 'e_wallet', 'e_wallet', '{\"providers\":{\"gopay\":\"GoPay\",\"ovo\":\"OVO\",\"dana\":\"DANA\"}}', 1, '2025-06-13 04:52:35', '2025-06-13 04:52:35'),
(3, 'Kartu Kredit', 'credit_card', 'credit_card', '{\"processors\":{\"visa\":\"Visa\",\"mastercard\":\"Mastercard\",\"jcb\":\"JCB\"}}', 1, '2025-06-13 04:52:35', '2025-06-13 04:52:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
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
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'auth_token', '329601446ce4aecc20af30f9d14150a869b1606b529ac7b9ccb827cd673fd872', '[\"*\"]', '2025-06-20 02:48:17', NULL, '2025-06-13 04:53:57', '2025-06-20 02:48:17'),
(2, 'App\\Models\\User', 1, 'auth_token', '30bee69b7d7bcb132e90db829c962f575210ceddddfe7e6c417d37ea149332a2', '[\"*\"]', NULL, NULL, '2025-06-13 06:18:44', '2025-06-13 06:18:44'),
(3, 'App\\Models\\User', 1, 'auth_token', 'b3f49c7bc2d4a54232e69e542381024f861d76be4e54aaaacf97d2592558d9eb', '[\"*\"]', NULL, NULL, '2025-06-13 06:18:57', '2025-06-13 06:18:57'),
(4, 'App\\Models\\User', 1, 'auth_token', '2f20abc55b9d0583c71f7d064d08b3c88e36623859ab1785a9865d023712dc89', '[\"*\"]', NULL, NULL, '2025-06-13 06:20:28', '2025-06-13 06:20:28'),
(5, 'App\\Models\\User', 1, 'auth_token', 'c3a27497be0631c13542389369de2075897ed602a096c733bc0b6fcb71682a7c', '[\"*\"]', NULL, NULL, '2025-06-13 06:26:53', '2025-06-13 06:26:53'),
(6, 'App\\Models\\User', 1, 'auth_token', '3cbe7cba8231c412bbbac22bb8d12df43bd5acc2d05940b95180324c9963bc2f', '[\"*\"]', NULL, NULL, '2025-06-13 06:27:03', '2025-06-13 06:27:03'),
(7, 'App\\Models\\User', 1, 'auth_token', 'e31d6da89a15940c07c1b72b0e1b0a23ec324a5b0c3789de6aa2aff83b6f885f', '[\"*\"]', NULL, NULL, '2025-06-13 06:27:23', '2025-06-13 06:27:23'),
(8, 'App\\Models\\User', 3, 'auth_token', 'e6ea0a4b122d6abf3e3890b375abb2d36d5619a7a9998c327e7ddc6023807af1', '[\"*\"]', NULL, NULL, '2025-06-13 06:30:52', '2025-06-13 06:30:52'),
(9, 'App\\Models\\User', 5, 'auth_token', '8fc93e5a61f714e169216e41a7dcd6a235eeae79a1ecb3b39b4f0f5f2a01c0c7', '[\"*\"]', NULL, NULL, '2025-06-13 07:16:15', '2025-06-13 07:16:15'),
(10, 'App\\Models\\User', 6, 'auth_token', 'cd2688e1b5af73629b64edc40e1cb7ac54ca3317f1e52db0b3e0c3811ffca3d9', '[\"*\"]', NULL, NULL, '2025-06-17 19:33:36', '2025-06-17 19:33:36'),
(11, 'App\\Models\\User', 7, 'auth_token', '549ad48a7a15176efd8dcfd6e47a59aa0c9c029829abe4be355da1369a98f52c', '[\"*\"]', NULL, NULL, '2025-06-17 21:35:30', '2025-06-17 21:35:30'),
(12, 'App\\Models\\User', 7, 'auth_token', 'be5b6ee38dab77703706e9d402ecf7dcc1c5bc26e8748f947f8362a1a69143a1', '[\"*\"]', NULL, NULL, '2025-06-17 21:37:20', '2025-06-17 21:37:20'),
(13, 'App\\Models\\User', 7, 'auth_token', '6a14378624622dd65a22a9b9c03e932842312bd1785971c345b22f380cd30ee9', '[\"*\"]', NULL, NULL, '2025-06-17 21:52:12', '2025-06-17 21:52:12'),
(14, 'App\\Models\\User', 7, 'auth_token', 'dba20b371a9d9cbcb5d8bd1a410ef05eb02531ba82d1f12b53f1224a5ade3883', '[\"*\"]', NULL, NULL, '2025-06-17 21:56:28', '2025-06-17 21:56:28'),
(15, 'App\\Models\\User', 7, 'auth_token', 'f53d6fc8213f9df91a9d03f59b715ecdfb6f60f5e8bd08ef29e8582f225536f2', '[\"*\"]', NULL, NULL, '2025-06-17 21:59:38', '2025-06-17 21:59:38'),
(16, 'App\\Models\\User', 7, 'auth_token', 'a4ea7ecabb6d3a8265c748063a2eed9d22ce556f96bd50fbd23a50c186d6de53', '[\"*\"]', NULL, NULL, '2025-06-17 22:04:59', '2025-06-17 22:04:59'),
(17, 'App\\Models\\User', 7, 'auth_token', 'f3e22c8101f03cdca5f0e8951b545e9690793402278483ad653fd526938956f7', '[\"*\"]', NULL, NULL, '2025-06-17 22:05:25', '2025-06-17 22:05:25'),
(18, 'App\\Models\\User', 7, 'auth_token', '0876201af393ff122b268fb47b5ee8fc1ebf81f18637c3bc5ee291f867dc4af9', '[\"*\"]', NULL, NULL, '2025-06-17 22:06:12', '2025-06-17 22:06:12'),
(19, 'App\\Models\\User', 7, 'auth_token', '350c35dd350dfa9bde04984a49824ed59f3e87f50389848e40f4d7a03ee964a7', '[\"*\"]', NULL, NULL, '2025-06-17 22:07:56', '2025-06-17 22:07:56'),
(20, 'App\\Models\\User', 7, 'auth_token', '6a5888b452ff4744180e4f23a183055b289e6b4a3d54f72dda16db7e9d9947d1', '[\"*\"]', NULL, NULL, '2025-06-17 22:09:56', '2025-06-17 22:09:56'),
(21, 'App\\Models\\User', 7, 'auth_token', 'c04b1e700c20b2e5a735871e142d86f69ff585cbd8d56ba424e1c90c89a98003', '[\"*\"]', NULL, NULL, '2025-06-17 22:13:48', '2025-06-17 22:13:48'),
(22, 'App\\Models\\User', 7, 'auth_token', 'fae83beba175fe6116d2afb774e5f079339875b1c923b0c1d842227a9cff26bb', '[\"*\"]', NULL, NULL, '2025-06-17 22:16:02', '2025-06-17 22:16:02'),
(23, 'App\\Models\\User', 7, 'auth_token', '78d040ba70472d03e9bb080aa57a1ace2b988b3561c601b479d6a827008140c8', '[\"*\"]', NULL, NULL, '2025-06-17 22:18:05', '2025-06-17 22:18:05'),
(24, 'App\\Models\\User', 7, 'auth_token', '99ed230a0687ce46496ddc759a3d5bad9d0edf8301cb8501697f6d796f3817f4', '[\"*\"]', NULL, NULL, '2025-06-17 22:35:08', '2025-06-17 22:35:08'),
(25, 'App\\Models\\User', 7, 'auth_token', '9820cd9b34f6c3c232d6f91f8aa76ae74a79a4da979a6a5224ed39f8b30a4c01', '[\"*\"]', NULL, NULL, '2025-06-17 22:35:56', '2025-06-17 22:35:56'),
(26, 'App\\Models\\User', 7, 'auth_token', '4b855e419ee62b197248b2c00990b7cee52cbb45ce1f262ee814cd2f156a0937', '[\"*\"]', NULL, NULL, '2025-06-17 22:39:22', '2025-06-17 22:39:22'),
(27, 'App\\Models\\User', 7, 'auth_token', '989585e058578b8fa65540ce2f1c845b35a359f60aa371b41d7d4d0cc5fda1dd', '[\"*\"]', NULL, NULL, '2025-06-17 22:41:02', '2025-06-17 22:41:02'),
(28, 'App\\Models\\User', 7, 'auth_token', '13f7fbe9f7cae785a7ece45349e466a649664d218ab4495721dc0848bfce5b69', '[\"*\"]', NULL, NULL, '2025-06-17 22:42:39', '2025-06-17 22:42:39'),
(29, 'App\\Models\\User', 7, 'auth_token', '18501fb3428e71ffe68e7461b9c875b38f4b67a08308a40452c74935be1723b0', '[\"*\"]', NULL, NULL, '2025-06-17 22:44:39', '2025-06-17 22:44:39'),
(30, 'App\\Models\\User', 7, 'auth_token', 'b827c0b0985ef704ca970e12cd6cf7b56e68ec7a7ff9c3af15cbd56b679ba161', '[\"*\"]', NULL, NULL, '2025-06-17 22:46:00', '2025-06-17 22:46:00'),
(31, 'App\\Models\\User', 7, 'auth_token', '81dee75726341e9ca88d1569a80041c6092472898a727b7464ebf1df74af687f', '[\"*\"]', NULL, NULL, '2025-06-17 22:50:41', '2025-06-17 22:50:41'),
(32, 'App\\Models\\User', 7, 'auth_token', '127154ae1597e6e61ac3a149e952fb9056ccdc3eeac1c6548d6ef79113ce01b4', '[\"*\"]', NULL, NULL, '2025-06-17 22:58:36', '2025-06-17 22:58:36'),
(33, 'App\\Models\\User', 7, 'auth_token', '9baaafcaac00196fe0abb46ab1254deb2b91a90e0b4b8d31175fee762050b0d2', '[\"*\"]', NULL, NULL, '2025-06-17 22:58:54', '2025-06-17 22:58:54'),
(34, 'App\\Models\\User', 7, 'auth_token', '55a0d50e4ff960d80d360713f1ed3cb5a85ededcc191eff661fc3bdab153b542', '[\"*\"]', NULL, NULL, '2025-06-17 22:59:00', '2025-06-17 22:59:00'),
(35, 'App\\Models\\User', 7, 'auth_token', 'ad486c0fb82bc152c3045d2c21fed4599f9fbe739be643c28279e9c1dae3d4db', '[\"*\"]', NULL, NULL, '2025-06-17 22:59:36', '2025-06-17 22:59:36'),
(36, 'App\\Models\\User', 7, 'auth_token', '859d974ae9c79d4266f9d8663f8cc65e1e92fd7c627490a3b07d9b2b508516db', '[\"*\"]', NULL, NULL, '2025-06-17 23:04:56', '2025-06-17 23:04:56'),
(37, 'App\\Models\\User', 7, 'auth_token', '5c5d1c7b95871fa8e95466b351fb8deb508e61d10834d50cc8f1cb0629e8236a', '[\"*\"]', NULL, NULL, '2025-06-17 23:07:57', '2025-06-17 23:07:57'),
(38, 'App\\Models\\User', 7, 'auth_token', 'fccb0b51f603784eacdd3939ca26bd59ffd797faaf480f96018a378f8b3527c4', '[\"*\"]', NULL, NULL, '2025-06-17 23:20:17', '2025-06-17 23:20:17'),
(39, 'App\\Models\\User', 7, 'auth_token', '927c4f4861eee113aab97ffc9886e02fd777933f1c9032516d44bc3a763c208b', '[\"*\"]', NULL, NULL, '2025-06-17 23:22:04', '2025-06-17 23:22:04'),
(40, 'App\\Models\\User', 7, 'auth_token', '08fcd658dce8bf0571f38988eb3d369e65d67f8a691b513cccdba6e1ec7afbf7', '[\"*\"]', NULL, NULL, '2025-06-17 23:26:51', '2025-06-17 23:26:51'),
(41, 'App\\Models\\User', 7, 'auth_token', '0320318613fe6ebf4a923a337e63a57cbbfef9387549435f2197dddb9bfaa07a', '[\"*\"]', NULL, NULL, '2025-06-17 23:35:48', '2025-06-17 23:35:48'),
(42, 'App\\Models\\User', 7, 'auth_token', '0dbb33990c6a4f8b48c7956ddab18de049c8667efbced2feab3b5a7d2a84718c', '[\"*\"]', NULL, NULL, '2025-06-17 23:36:42', '2025-06-17 23:36:42'),
(43, 'App\\Models\\User', 7, 'auth_token', 'feab28370f82a0fa4d337c6d47001c55d0ef74d177d5ee6b6d503b35d4d12a74', '[\"*\"]', NULL, NULL, '2025-06-17 23:39:09', '2025-06-17 23:39:09'),
(44, 'App\\Models\\User', 7, 'auth_token', 'f8c1f067ac6bd92add9238189dd7b2e772a01c26c7d8fb9b9775a92a66213ed7', '[\"*\"]', NULL, NULL, '2025-06-17 23:50:37', '2025-06-17 23:50:37'),
(45, 'App\\Models\\User', 7, 'auth_token', '3388fd6f253946bcd8ee636764ec8b5787234de650bdc639bdaa841831552dba', '[\"*\"]', NULL, NULL, '2025-06-17 23:52:48', '2025-06-17 23:52:48'),
(46, 'App\\Models\\User', 7, 'auth_token', '760684780b45cbc8869ff8a4cf49c441fd14149351a9f21d7762f72d654c597f', '[\"*\"]', NULL, NULL, '2025-06-17 23:53:50', '2025-06-17 23:53:50'),
(47, 'App\\Models\\User', 7, 'auth_token', '091965a972809378d1f65d77f949cf8d93d5c76251f467ae68674a0289b36ed9', '[\"*\"]', NULL, NULL, '2025-06-17 23:56:45', '2025-06-17 23:56:45'),
(48, 'App\\Models\\User', 7, 'auth_token', '74c25b51e307f2483ad3def1262701b8bcefdb4a76a02aa97c6a241b48edb4ae', '[\"*\"]', NULL, NULL, '2025-06-18 00:01:48', '2025-06-18 00:01:48'),
(49, 'App\\Models\\User', 7, 'auth_token', 'f38f82791afd93dde01fd2317a5e93852509704f15ff97373ab9415198f48e01', '[\"*\"]', NULL, NULL, '2025-06-18 00:03:21', '2025-06-18 00:03:21'),
(50, 'App\\Models\\User', 7, 'auth_token', '98f3660b367c7a7ab57dec8a6bec282f9a7f4be37369b1fe477d2368540dcfb1', '[\"*\"]', NULL, NULL, '2025-06-18 00:07:09', '2025-06-18 00:07:09'),
(51, 'App\\Models\\User', 7, 'auth_token', 'dd5e470ef40b35c1a7949378481b68d45b2f62d2bc37242438d4615691862ac6', '[\"*\"]', NULL, NULL, '2025-06-18 00:18:55', '2025-06-18 00:18:55'),
(52, 'App\\Models\\User', 7, 'auth_token', '235dc7b114fc4c701058462ad6b2d639e8546c9b666bc26bd03c8e0b19a4747b', '[\"*\"]', NULL, NULL, '2025-06-18 00:26:09', '2025-06-18 00:26:09'),
(53, 'App\\Models\\User', 7, 'auth_token', '809037ff2adb3a2b190862a192183f24f7d0099b8148770b22eaade5c71a531e', '[\"*\"]', NULL, NULL, '2025-06-18 00:30:15', '2025-06-18 00:30:15'),
(54, 'App\\Models\\User', 7, 'auth_token', '3cc7bfb5a8371e32ce55aa13014eb441f80a13fe836ad033f62bdb0ccc95ee22', '[\"*\"]', NULL, NULL, '2025-06-18 00:39:44', '2025-06-18 00:39:44'),
(55, 'App\\Models\\User', 7, 'auth_token', '83a8bd97bcf51659de4713dcaa5c5327528d7d8493697998f602f5c859def8d6', '[\"*\"]', NULL, NULL, '2025-06-18 00:42:53', '2025-06-18 00:42:53'),
(56, 'App\\Models\\User', 7, 'auth_token', 'cefdbd472d70cc134c264db49253d7b40f4c1c9ba720577adf257ced0c563047', '[\"*\"]', NULL, NULL, '2025-06-18 00:44:40', '2025-06-18 00:44:40'),
(57, 'App\\Models\\User', 7, 'auth_token', 'e96ae0ca182fc9cd3ab18fdf69b4a1fa36569e2d607742061fae2513a9c23e57', '[\"*\"]', NULL, NULL, '2025-06-18 00:46:06', '2025-06-18 00:46:06'),
(58, 'App\\Models\\User', 7, 'auth_token', '01ce52cc7748d5501003fcdfa3aaeb8e4aed09ef83d67e28ba25be2ee6714bc0', '[\"*\"]', NULL, NULL, '2025-06-18 00:48:10', '2025-06-18 00:48:10'),
(59, 'App\\Models\\User', 7, 'auth_token', 'ab2c2b7b9d7944b26d8e615576253d0bed697321a54d359948a7ff3fcf9df1dc', '[\"*\"]', NULL, NULL, '2025-06-18 00:49:59', '2025-06-18 00:49:59'),
(60, 'App\\Models\\User', 7, 'auth_token', 'c9b35e998783d228c3aed9bf486b14d8c15bdf0a9bee25318fee5ac5515cb73a', '[\"*\"]', NULL, NULL, '2025-06-18 03:55:23', '2025-06-18 03:55:23'),
(61, 'App\\Models\\User', 7, 'auth_token', '006e18f848a55c447e65b79b91016f0d97357b0b7bcb7e2430ace7a3319f4c5e', '[\"*\"]', NULL, NULL, '2025-06-18 04:01:19', '2025-06-18 04:01:19'),
(62, 'App\\Models\\User', 7, 'auth_token', '96ddbbfd62584d065addf28b62fcf3dccdca8d5ec7daaeaf3e32005d3157d933', '[\"*\"]', NULL, NULL, '2025-06-20 00:55:24', '2025-06-20 00:55:24'),
(63, 'App\\Models\\User', 9, 'auth_token', '81e27336f9866fadc6df20039933c828c2e26b356cf31d842b4d03551d8247c7', '[\"*\"]', NULL, NULL, '2025-06-20 01:03:17', '2025-06-20 01:03:17'),
(64, 'App\\Models\\User', 9, 'auth_token', '6a3c2620e948875e35af1bcaeac08bc215e1d4614a181205e63a2b403543a14f', '[\"*\"]', NULL, NULL, '2025-06-20 01:06:13', '2025-06-20 01:06:13'),
(65, 'App\\Models\\User', 9, 'auth_token', 'e1b04ce9da2b5948f564229a9089f08cd3047ecaae5edfca861c38ea175781ca', '[\"*\"]', NULL, NULL, '2025-06-20 01:38:55', '2025-06-20 01:38:55'),
(66, 'App\\Models\\User', 10, 'auth_token', '2f79b9efd5c9cb191ebba55156d5f6251e75ae44ede434b220246aa2fe0f90ae', '[\"*\"]', NULL, NULL, '2025-06-20 02:15:18', '2025-06-20 02:15:18'),
(67, 'App\\Models\\User', 10, 'auth_token', 'f134773a9a3bdbe9d581f9f382fc4f68e677c56afddaa2ffaec0b6399c85ca2a', '[\"*\"]', NULL, NULL, '2025-06-20 02:33:33', '2025-06-20 02:33:33'),
(68, 'App\\Models\\User', 10, 'auth_token', '36a9299219814f6b0e96cf322fdb9e9e800e868bf38f2b8c7bdb78e647ecb1cb', '[\"*\"]', NULL, NULL, '2025-06-20 02:36:32', '2025-06-20 02:36:32'),
(69, 'App\\Models\\User', 10, 'auth_token', '40b44e7575b7280b799151896c06ef65ffc8dc8fd9a5920f9fb63f29754a1bc6', '[\"*\"]', NULL, NULL, '2025-06-20 02:42:43', '2025-06-20 02:42:43'),
(70, 'App\\Models\\User', 3, 'auth_token', '172dc935c552a1f05115ddceaf0461cd0e2a1361596bc6dc8e88431b43301ed9', '[\"*\"]', NULL, NULL, '2025-06-20 02:48:38', '2025-06-20 02:48:38'),
(71, 'App\\Models\\User', 11, 'auth_token', '6618ecc0ff74149cc88050042878422208e94957f56f0eb360b1c43e1155ae34', '[\"*\"]', NULL, NULL, '2025-06-20 02:54:07', '2025-06-20 02:54:07'),
(72, 'App\\Models\\User', 11, 'auth_token', 'd25038c051b1ab1043d9f3567af13af5ba5b7d850a527d6d685277cc23281d84', '[\"*\"]', NULL, NULL, '2025-06-20 03:08:05', '2025-06-20 03:08:05'),
(73, 'App\\Models\\User', 11, 'auth_token', '81596de4b74d51dbbe5c88de8bd1935befb286bc2011445f9cd8d2f61196cbf0', '[\"*\"]', '2025-06-20 03:08:51', NULL, '2025-06-20 03:08:25', '2025-06-20 03:08:51'),
(74, 'App\\Models\\User', 11, 'auth_token', 'e81b49376f19734ff2c0b4668f8c9359ab18f06e8a106e9e61cc3b2b1ab57365', '[\"*\"]', '2025-06-20 03:28:27', NULL, '2025-06-20 03:28:04', '2025-06-20 03:28:27'),
(75, 'App\\Models\\User', 11, 'auth_token', 'b5c2d6204dc433e2fd6c2faa0d47bad4ce49525e50d3132131e247e44f166a51', '[\"*\"]', NULL, NULL, '2025-06-20 03:39:57', '2025-06-20 03:39:57'),
(76, 'App\\Models\\User', 10, 'auth_token', '7830d683417ba40439e84178cc5160eac558c678908e9d5e7ca7d5b8249f42dc', '[\"*\"]', NULL, NULL, '2025-06-20 03:50:13', '2025-06-20 03:50:13'),
(77, 'App\\Models\\User', 10, 'auth_token', 'a31ab7d6d79e12be85bf1dd562ae6c9e5e6a2db5f8a0207d6f13287e7f3b7c93', '[\"*\"]', NULL, NULL, '2025-06-20 03:55:53', '2025-06-20 03:55:53'),
(78, 'App\\Models\\User', 10, 'auth_token', 'd029feebb3845c43b7d81ff8ce448e69f18ef30976cddc4650d736fb5e0dc026', '[\"*\"]', '2025-06-20 04:10:24', NULL, '2025-06-20 04:10:06', '2025-06-20 04:10:24'),
(79, 'App\\Models\\User', 10, 'auth_token', 'eb43a62dbe698eb0cfe1dd8553857c3c66728b5fbe9bc67d7062e053df628369', '[\"*\"]', NULL, NULL, '2025-06-20 04:36:00', '2025-06-20 04:36:00'),
(80, 'App\\Models\\User', 10, 'auth_token', '4ef77a7d6c466d7d774dde20d18160fc68be6715267a81d116e70cab0d5db862', '[\"*\"]', NULL, NULL, '2025-06-20 05:42:37', '2025-06-20 05:42:37'),
(81, 'App\\Models\\User', 10, 'auth_token', '7158f0cbe189b280c656f65aa160f08035f018c27a38f501eb98514777d56f80', '[\"*\"]', NULL, NULL, '2025-06-20 05:58:02', '2025-06-20 05:58:02'),
(82, 'App\\Models\\User', 10, 'auth_token', '1b15f57a66d0386aaebb280eb900af5ef4c0f666dac95d3fec1439a4788d516c', '[\"*\"]', NULL, NULL, '2025-06-20 05:58:05', '2025-06-20 05:58:05'),
(83, 'App\\Models\\User', 10, 'auth_token', 'e54b337aae15b049245ac9b9dc813c8c2dae603c1b84097cd3e1082e9ae5140d', '[\"*\"]', NULL, NULL, '2025-06-20 05:58:14', '2025-06-20 05:58:14'),
(84, 'App\\Models\\User', 10, 'auth_token', '8919e8f015973394efb33ae0b03028986be21b808e74edad139f210134769ab1', '[\"*\"]', NULL, NULL, '2025-06-20 05:58:19', '2025-06-20 05:58:19'),
(85, 'App\\Models\\User', 10, 'auth_token', '4995b140c69ca2ebfdeeceb202752d324b3a1be5a748231fc9830a5566ecbabc', '[\"*\"]', NULL, NULL, '2025-06-20 05:59:30', '2025-06-20 05:59:30'),
(86, 'App\\Models\\User', 10, 'auth_token', '68eeb600cf84211a7cb5060249f040aa14f946eda5e5a313f932b1a542f734ea', '[\"*\"]', NULL, NULL, '2025-06-20 06:06:43', '2025-06-20 06:06:43'),
(87, 'App\\Models\\User', 10, 'auth_token', 'af43368129026853c7b6dd8a5780d0532cf8d97871ee34d3e60e24aef55a2a0e', '[\"*\"]', NULL, NULL, '2025-06-20 06:06:46', '2025-06-20 06:06:46'),
(88, 'App\\Models\\User', 10, 'auth_token', '812cb33c75f9d2620b43a9c6e94ceebaf4d5253ed8d3545187c0a9cf371fa97a', '[\"*\"]', NULL, NULL, '2025-06-20 06:09:45', '2025-06-20 06:09:45'),
(89, 'App\\Models\\User', 10, 'auth_token', '1c8efae7c7ecec879a25e8efcba6fb37b836b0528d75ba2a69efc104dd6289a9', '[\"*\"]', NULL, NULL, '2025-06-20 06:09:56', '2025-06-20 06:09:56'),
(90, 'App\\Models\\User', 10, 'auth_token', '3a430b6ed8b8bbfb1b8570f644e9eaf4e01aa9ccb3dbbe15e35d30ede005e2fe', '[\"*\"]', NULL, NULL, '2025-06-20 06:10:14', '2025-06-20 06:10:14'),
(91, 'App\\Models\\User', 10, 'auth_token', '8d4c260dd1a6c318e096aa9c5d4924ec1b2e066b7fd3f1be3cb88ab59127cf39', '[\"*\"]', '2025-06-20 07:23:19', NULL, '2025-06-20 06:14:07', '2025-06-20 07:23:19'),
(92, 'App\\Models\\User', 10, 'auth_token', '329a9972a6e120e2e413f028523a552544e0f830fba46be59099903d6dd4fae7', '[\"*\"]', NULL, NULL, '2025-06-20 07:46:51', '2025-06-20 07:46:51'),
(93, 'App\\Models\\User', 10, 'auth_token', 'a70387ca53ac14c6d2b9f81ff3d14c908205807b5709b8c626dd383bb4ac55af', '[\"*\"]', NULL, NULL, '2025-06-20 07:47:04', '2025-06-20 07:47:04'),
(94, 'App\\Models\\User', 10, 'auth_token', '980c1af89d0885b834f7f4bff21a36b450b622b4a36df7fe834a86b4fd019137', '[\"*\"]', '2025-06-20 07:53:00', NULL, '2025-06-20 07:47:21', '2025-06-20 07:53:00'),
(95, 'App\\Models\\User', 10, 'auth_token', '62c6932451b5c7949e9e6190e1750da0429411320aa56dd2e56d225a1d291f4f', '[\"*\"]', NULL, NULL, '2025-06-20 08:43:42', '2025-06-20 08:43:42'),
(96, 'App\\Models\\User', 10, 'auth_token', 'ba9a46a1f0c09c5abb2b3a0adeb12d430b7f8bb2fd5df0fe8eda90a711417dc1', '[\"*\"]', NULL, NULL, '2025-06-20 08:43:56', '2025-06-20 08:43:56'),
(97, 'App\\Models\\User', 10, 'auth_token', '7ecab93d44017cd5d14850aff6d9a6dd954a8dc992ca9673ca464077967a62e8', '[\"*\"]', NULL, NULL, '2025-06-20 08:45:34', '2025-06-20 08:45:34'),
(98, 'App\\Models\\User', 10, 'auth_token', '3e55fa6d77680d9b525f960f214a361756604f2ceea5753d0ffc199bb9d8e8b9', '[\"*\"]', NULL, NULL, '2025-06-20 08:48:07', '2025-06-20 08:48:07'),
(99, 'App\\Models\\User', 10, 'auth_token', '54d22c3c2da56edaa45488844fc2845d2b672b42f39f649fcee3b520c8859be9', '[\"*\"]', NULL, NULL, '2025-06-20 08:50:18', '2025-06-20 08:50:18'),
(100, 'App\\Models\\User', 10, 'auth_token', '3c264d048ca89021375968e9d29d4e1306c73479d621c1fa117f24e860870824', '[\"*\"]', NULL, NULL, '2025-06-20 08:50:40', '2025-06-20 08:50:40'),
(101, 'App\\Models\\User', 10, 'auth_token', '85318915f0b8776a8d514355bd63fe6a0ab7d41bc697ed29bd30bcf334d10239', '[\"*\"]', '2025-06-21 00:04:35', NULL, '2025-06-20 08:53:58', '2025-06-21 00:04:35'),
(102, 'App\\Models\\User', 10, 'auth_token', 'fa8c1f011cf1e45a197dc5726192b635353ff3218fe6e5860ee993608612f5ef', '[\"*\"]', NULL, NULL, '2025-06-20 08:54:33', '2025-06-20 08:54:33'),
(103, 'App\\Models\\User', 10, 'auth_token', 'adce9c45a4b9047a57312c9ab76d55f21799c8c44f72140b83dfed9833e83bcb', '[\"*\"]', NULL, NULL, '2025-06-20 08:57:18', '2025-06-20 08:57:18'),
(104, 'App\\Models\\User', 10, 'auth_token', 'b7d01c8230701ab5bacfc505f4ca0b83d69aa52f7d7008d4a2b1c7e0d782da82', '[\"*\"]', NULL, NULL, '2025-06-20 08:57:22', '2025-06-20 08:57:22'),
(105, 'App\\Models\\User', 10, 'auth_token', 'fb12972009acfe9c34c2b5e8cdb923a8f91dc34500eff5d7b29c48db3420aeaa', '[\"*\"]', NULL, NULL, '2025-06-20 08:57:31', '2025-06-20 08:57:31'),
(106, 'App\\Models\\User', 10, 'auth_token', 'dcd9f68cecbdadf6d99467dcfb311ffb925cf88f8694168702a3153717730f6e', '[\"*\"]', NULL, NULL, '2025-06-20 08:57:33', '2025-06-20 08:57:33'),
(107, 'App\\Models\\User', 10, 'auth_token', '5bfb5483c01c52fa4fc33195e43c2a45580e2bb052445022717ef5ee507ebd36', '[\"*\"]', NULL, NULL, '2025-06-20 09:00:40', '2025-06-20 09:00:40'),
(108, 'App\\Models\\User', 10, 'auth_token', 'eb8cbdfcf564b1ba6b2d1557e9e703cb0cf3f00d3ea0511469f49f22f5c0c2b3', '[\"*\"]', NULL, NULL, '2025-06-20 09:01:29', '2025-06-20 09:01:29'),
(109, 'App\\Models\\User', 10, 'auth_token', '89551f22092ba1da2ef48315e646d05f6c998b1e67094fb8d1d29891b91a9db9', '[\"*\"]', NULL, NULL, '2025-06-20 09:03:47', '2025-06-20 09:03:47'),
(110, 'App\\Models\\User', 10, 'auth_token', 'b15fef8cb82c555ffc2064be671a8bb276e8bf7ad1c528e36982be57cc401900', '[\"*\"]', NULL, NULL, '2025-06-20 09:14:12', '2025-06-20 09:14:12'),
(111, 'App\\Models\\User', 10, 'auth_token', '2bc2f53f85adef2426ddd7c4448fa16d3a07fab073a9328615f5917badbea3d2', '[\"*\"]', NULL, NULL, '2025-06-20 09:14:17', '2025-06-20 09:14:17'),
(112, 'App\\Models\\User', 10, 'auth_token', '1065181e003880503d29a0ac6d7c945ce54c42c5f4c61832805e9b64eee8a3a2', '[\"*\"]', NULL, NULL, '2025-06-20 09:14:20', '2025-06-20 09:14:20'),
(113, 'App\\Models\\User', 10, 'auth_token', 'bd5577165131120f0afb3fa5ef517861ade3ff2c2bdb668ae0b454db0a727de8', '[\"*\"]', NULL, NULL, '2025-06-20 22:59:23', '2025-06-20 22:59:23'),
(114, 'App\\Models\\User', 10, 'auth_token', '77cc1b3d8717287532e8b1546b75e6e241295fa8d0262d22eba563002a37a747', '[\"*\"]', NULL, NULL, '2025-06-20 23:00:56', '2025-06-20 23:00:56'),
(115, 'App\\Models\\User', 10, 'auth_token', '02a4b544088a6f8e26068d87e1c58e7332da0d7d9d3401f3807c7e4172182db3', '[\"*\"]', NULL, NULL, '2025-06-20 23:01:02', '2025-06-20 23:01:02'),
(116, 'App\\Models\\User', 10, 'auth_token', '9c8182581e68937c7f0e0f5488830ad1a5b34b2a70ac0b733787d6df5547536c', '[\"*\"]', NULL, NULL, '2025-06-22 05:04:44', '2025-06-22 05:04:44'),
(117, 'App\\Models\\User', 10, 'auth_token', 'ec5797e2fc72c6379bd36c00ca561c5e521db2fb23c1701ee34dec1dc7f71837', '[\"*\"]', NULL, NULL, '2025-06-22 05:08:08', '2025-06-22 05:08:08'),
(118, 'App\\Models\\User', 10, 'auth_token', '5b5c051ecec81ee6ce9cdd78828362046f858e22cddb3af483e74791333d2e4c', '[\"*\"]', '2025-06-23 08:14:27', NULL, '2025-06-23 07:31:14', '2025-06-23 08:14:27'),
(119, 'App\\Models\\User', 10, 'auth_token', '5ff72da649b4d0f8cceacc722e5bbeb1177d62a9c918eba4c09a295d5d5c75c3', '[\"*\"]', NULL, NULL, '2025-06-23 08:29:29', '2025-06-23 08:29:29'),
(120, 'App\\Models\\User', 10, 'auth_token', '4557f2b42865431a9c57a380d4f2188fee3446366fe437e62970f0a6ec0e5922', '[\"*\"]', NULL, NULL, '2025-06-23 08:34:44', '2025-06-23 08:34:44'),
(121, 'App\\Models\\User', 10, 'auth_token', '60ba61ca240cb9febab4fe3bfc8442f61b677b226484ec1e0c6d8bb8834b9264', '[\"*\"]', NULL, NULL, '2025-06-23 08:45:41', '2025-06-23 08:45:41'),
(122, 'App\\Models\\User', 10, 'auth_token', '3e5bf268ef28c59f2c043b856b37799f29ddd4d21785d95333986a4993903fed', '[\"*\"]', NULL, NULL, '2025-06-23 08:45:43', '2025-06-23 08:45:43'),
(123, 'App\\Models\\User', 10, 'auth_token', '1e3afd8f8e352e4488cd6ccc10e30fd02a0f2fdbd82a95545ca8842eca6e2fe5', '[\"*\"]', NULL, NULL, '2025-06-23 08:45:54', '2025-06-23 08:45:54'),
(124, 'App\\Models\\User', 10, 'auth_token', 'a3b2e85611004318f83a63888160bc1bdad49e4303a7f1aa50d5a8ed2f659a9d', '[\"*\"]', NULL, NULL, '2025-06-23 08:45:55', '2025-06-23 08:45:55'),
(125, 'App\\Models\\User', 10, 'auth_token', '519bb0f5e62ac693fadf343f38a9abe575683b37085aa99fe8131b01d2c97d36', '[\"*\"]', NULL, NULL, '2025-06-23 08:47:22', '2025-06-23 08:47:22'),
(126, 'App\\Models\\User', 10, 'auth_token', '98b7b1baa0bd0db72bc136cf3532ef1f9920a6c37ff438125c9774525fb7d867', '[\"*\"]', NULL, NULL, '2025-06-23 08:49:12', '2025-06-23 08:49:12'),
(127, 'App\\Models\\User', 10, 'auth_token', '9799a9b38a8da5bdd774104ebea2cc0074d854aeb98ff8fbf613d91c403b3fd5', '[\"*\"]', NULL, NULL, '2025-06-23 08:49:30', '2025-06-23 08:49:30'),
(128, 'App\\Models\\User', 10, 'auth_token', '677732f4d265b9541376ee2d9b57976fa4b7711b6f9be789c14940d45d51453e', '[\"*\"]', NULL, NULL, '2025-06-23 08:51:19', '2025-06-23 08:51:19'),
(129, 'App\\Models\\User', 10, 'auth_token', 'c839d96832147ba0199864eb25e246137e380505084b0757e2c405e39297691f', '[\"*\"]', NULL, NULL, '2025-06-23 08:52:47', '2025-06-23 08:52:47'),
(130, 'App\\Models\\User', 10, 'auth_token', '87ba1fe820e5195a5e838b5af22f3d00a53623c7a4d6ce4b0994e82ad849a190', '[\"*\"]', NULL, NULL, '2025-06-23 08:52:54', '2025-06-23 08:52:54'),
(131, 'App\\Models\\User', 10, 'auth_token', 'e70b1115223046efbc03190de51055fc4527d5170158cdb3655fa8ccdd136666', '[\"*\"]', NULL, NULL, '2025-06-23 08:53:48', '2025-06-23 08:53:48'),
(132, 'App\\Models\\User', 10, 'auth_token', '1e9a510b35655bda53973ac8c46f5adad291b92d4e73f1cba27320f68c83157a', '[\"*\"]', NULL, NULL, '2025-06-23 08:54:40', '2025-06-23 08:54:40'),
(133, 'App\\Models\\User', 10, 'auth_token', 'fb6530c4f9878e38d01fb4d9ed7c371dc6ee7cdddf5c818d453e5a3bc4fca576', '[\"*\"]', NULL, NULL, '2025-06-23 08:54:54', '2025-06-23 08:54:54'),
(134, 'App\\Models\\User', 10, 'auth_token', '265d85ec1d4cf5f3b177c7e12985a74196654ddf95eb8a3741c714bf4741a268', '[\"*\"]', NULL, NULL, '2025-06-23 08:54:57', '2025-06-23 08:54:57'),
(135, 'App\\Models\\User', 10, 'auth_token', 'e63f2730bfe337e5a4f4395d744ee173df8870836f8cb69d153794fdfde0fba0', '[\"*\"]', NULL, NULL, '2025-06-23 08:55:37', '2025-06-23 08:55:37'),
(136, 'App\\Models\\User', 10, 'auth_token', 'fa79c68d31909d88e2cf96592def62cd39a053fa4c608a541a3794f2b480671e', '[\"*\"]', NULL, NULL, '2025-06-23 09:01:02', '2025-06-23 09:01:02'),
(137, 'App\\Models\\User', 10, 'auth_token', '6193160e4fb3b0f4549650004e00eabba2179927ef641d0945dc7c9a6a704e67', '[\"*\"]', NULL, NULL, '2025-06-23 09:01:13', '2025-06-23 09:01:13'),
(138, 'App\\Models\\User', 10, 'auth_token', '3ae935259e8f2ae7e3f977d2bfd759ecd9901e57ea0cce288f37344a9c360f66', '[\"*\"]', NULL, NULL, '2025-06-23 09:02:17', '2025-06-23 09:02:17'),
(139, 'App\\Models\\User', 10, 'auth_token', '727841f2c538336b58475dc218d414189a94ef6df7281f28b5bf18cb63da5170', '[\"*\"]', NULL, NULL, '2025-06-23 09:02:44', '2025-06-23 09:02:44'),
(140, 'App\\Models\\User', 10, 'auth_token', '9ca78961072fe244e3399e89a1161eac59952af0b6a5a0e0bc725effa16e9007', '[\"*\"]', NULL, NULL, '2025-06-23 09:02:48', '2025-06-23 09:02:48'),
(141, 'App\\Models\\User', 10, 'auth_token', '251e3bd3fb18c0672041d2f253dd7593df62012f5460814be0372c30538b5459', '[\"*\"]', NULL, NULL, '2025-06-23 09:16:53', '2025-06-23 09:16:53'),
(142, 'App\\Models\\User', 10, 'auth_token', '3eb7877284343fa79a438e9ed8486c4b8d6d7e2435fcaddb24980d145a7c74d1', '[\"*\"]', NULL, NULL, '2025-06-23 09:16:57', '2025-06-23 09:16:57'),
(143, 'App\\Models\\User', 10, 'auth_token', '564adf925f4b9dab4913c56628057e564cdbbc4fd04818da394b45d980ae0e81', '[\"*\"]', NULL, NULL, '2025-06-23 09:17:09', '2025-06-23 09:17:09'),
(144, 'App\\Models\\User', 10, 'auth_token', 'f2c3944ed8628b96431424b203102dce87d4bccdf7397895c283f5224f3096b7', '[\"*\"]', NULL, NULL, '2025-06-23 09:17:11', '2025-06-23 09:17:11'),
(145, 'App\\Models\\User', 10, 'auth_token', 'e028a8575d522ced8d34873bd3ad64e67f1e187553d8c125947ca804f49bc5ed', '[\"*\"]', NULL, NULL, '2025-06-23 09:17:39', '2025-06-23 09:17:39'),
(146, 'App\\Models\\User', 10, 'auth_token', 'e3f484d09dd5887883e06113fba8667bb9504a5c5ecc16a058843f983a833bcd', '[\"*\"]', NULL, NULL, '2025-06-23 09:17:41', '2025-06-23 09:17:41'),
(147, 'App\\Models\\User', 10, 'auth_token', '755b7a4854651a4b02edda3ee207fd0f49f84eed2a0339efcbbdeb9ae3c98982', '[\"*\"]', NULL, NULL, '2025-06-23 09:17:43', '2025-06-23 09:17:43'),
(148, 'App\\Models\\User', 10, 'auth_token', 'ab7f07842b283c00c12d53490daa443427d68370574ea22d71fac911d6b31345', '[\"*\"]', '2025-06-23 09:39:52', NULL, '2025-06-23 09:17:49', '2025-06-23 09:39:52'),
(149, 'App\\Models\\User', 10, 'auth_token', '66576b275df11e703f6e0a37f899a55e0fd728c6f25dba2068cb0b0a6dc0262a', '[\"*\"]', NULL, NULL, '2025-06-23 09:40:09', '2025-06-23 09:40:09'),
(150, 'App\\Models\\User', 10, 'auth_token', 'aa2dc722f7ac6d6201d9a8e0a42ed911d91dd74ac6a3019e338eab6b2b36f905', '[\"*\"]', '2025-06-23 09:42:35', NULL, '2025-06-23 09:40:19', '2025-06-23 09:42:35'),
(151, 'App\\Models\\User', 10, 'auth_token', '9b39c8a922b82b2a8aeda600f23c4e761b6cb290bcfca1abe7482aec51aa99d9', '[\"*\"]', '2025-06-23 09:57:37', NULL, '2025-06-23 09:43:09', '2025-06-23 09:57:37'),
(152, 'App\\Models\\User', 10, 'auth_token', '3f601e1ec83e92f388566c38d3f77e04663c1485542ae9bcf0a3b434e33e698d', '[\"*\"]', '2025-06-23 10:08:59', NULL, '2025-06-23 09:58:12', '2025-06-23 10:08:59'),
(153, 'App\\Models\\User', 10, 'auth_token', '994bb45e203d052f51c71ddcbb4fd6aa4709779dd6063dadfdebd75edc56f32e', '[\"*\"]', NULL, NULL, '2025-06-23 10:09:33', '2025-06-23 10:09:33'),
(154, 'App\\Models\\User', 10, 'auth_token', 'd0d7601cf28dfa48de50b9b28f2e1bdcffb9249135877961318a521cfda637e9', '[\"*\"]', NULL, NULL, '2025-06-23 10:09:37', '2025-06-23 10:09:37'),
(155, 'App\\Models\\User', 10, 'auth_token', '2d9bfc1820a0c3f1bad6a2f9f7a616d90f29b1f011c60cfd21b436299196506a', '[\"*\"]', '2025-06-23 10:13:35', NULL, '2025-06-23 10:09:40', '2025-06-23 10:13:35'),
(156, 'App\\Models\\User', 10, 'auth_token', '2790a72b230f8cf28eba6e3084be131a50f5d4d5b409c996e2684ca9fe7911cb', '[\"*\"]', '2025-06-23 11:11:38', NULL, '2025-06-23 11:11:35', '2025-06-23 11:11:38'),
(157, 'App\\Models\\User', 10, 'auth_token', '5bb640a08a5b4895a1e66c976eadff7da896baed3252870474b6899f4199b527', '[\"*\"]', '2025-06-23 11:26:22', NULL, '2025-06-23 11:13:07', '2025-06-23 11:26:22'),
(158, 'App\\Models\\User', 10, 'auth_token', '24547e210343ad76268d0cd9d2b41d2d7a1306f11fd8ca3ae3838a71651c2954', '[\"*\"]', '2025-06-23 11:30:46', NULL, '2025-06-23 11:26:26', '2025-06-23 11:30:46'),
(159, 'App\\Models\\User', 10, 'auth_token', '759508f116952666aee24ea6febe74b5e56a97ec43651fbeb83eda2043d76fb3', '[\"*\"]', '2025-06-23 11:36:01', NULL, '2025-06-23 11:31:32', '2025-06-23 11:36:01'),
(160, 'App\\Models\\User', 10, 'auth_token', '269d225731d3e4b007120cac6663502521fc4ce44e0ed84bc87cbcf802849ac5', '[\"*\"]', '2025-06-23 11:54:31', NULL, '2025-06-23 11:36:07', '2025-06-23 11:54:31'),
(161, 'App\\Models\\User', 10, 'auth_token', '16c4e478790c311cf6ce9a057ceb108b5d4b42b1085e041dcc0c2905da2bb1dd', '[\"*\"]', '2025-06-23 11:54:51', NULL, '2025-06-23 11:54:50', '2025-06-23 11:54:51'),
(162, 'App\\Models\\User', 10, 'auth_token', 'bfc6c92135adc0bfb42181a297e866800d08446cf49b8603c083c5e0c05ccd58', '[\"*\"]', '2025-06-23 13:26:22', NULL, '2025-06-23 11:55:08', '2025-06-23 13:26:22'),
(163, 'App\\Models\\User', 10, 'auth_token', '517c6153fed26cf5d15d2553e081722ae146e2916f905fb3015427c9b9ec3375', '[\"*\"]', '2025-06-23 13:39:26', NULL, '2025-06-23 13:26:54', '2025-06-23 13:39:26'),
(164, 'App\\Models\\User', 10, 'auth_token', '8af58ea855873048d8ab9f5c2115abefd7ee56e49ba9aade39f91ffbefb2580e', '[\"*\"]', '2025-06-23 13:42:20', NULL, '2025-06-23 13:41:49', '2025-06-23 13:42:20'),
(165, 'App\\Models\\User', 10, 'auth_token', '55560d138466fbab7a5cdffd6825c53b004e80932fde892845afc456a7f91304', '[\"*\"]', '2025-06-23 13:54:44', NULL, '2025-06-23 13:42:37', '2025-06-23 13:54:44'),
(166, 'App\\Models\\User', 12, 'auth_token', '05699c53ffc5ed1e8f6bbe4bd8eb6918121c17d6bc19bad8c7fd6c536fc3c8ba', '[\"*\"]', '2025-06-23 17:58:07', NULL, '2025-06-23 17:49:36', '2025-06-23 17:58:07'),
(167, 'App\\Models\\User', 15, 'auth_token', '3eb5e06da675943818f4d8c27c58e83476436a0018d137e2b92a58499a21b43c', '[\"*\"]', '2025-06-23 18:43:45', NULL, '2025-06-23 18:32:01', '2025-06-23 18:43:45'),
(168, 'App\\Models\\User', 10, 'auth_token', 'cf600d757822fa077a95181a9e7e1b856664620d724bf0f4aebb35a3ea77f301', '[\"*\"]', '2025-06-23 18:52:59', NULL, '2025-06-23 18:52:57', '2025-06-23 18:52:59'),
(169, 'App\\Models\\User', 10, 'auth_token', '864ce0d990a9261176d6cb134eb72513ff982b994c3b4af94d0ddfdd97134d54', '[\"*\"]', '2025-06-23 18:55:10', NULL, '2025-06-23 18:55:09', '2025-06-23 18:55:10'),
(170, 'App\\Models\\User', 10, 'auth_token', 'b2f05cd1450fdfb1ac8af48ba67b88460c43f272c69d60f4758095a7ea92b697', '[\"*\"]', '2025-06-24 05:17:18', NULL, '2025-06-23 18:55:57', '2025-06-24 05:17:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `minimum_stock` int(11) NOT NULL DEFAULT 5,
  `track_stock` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_recommended` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `minimum_stock`, `track_stock`, `image`, `category_id`, `created_at`, `updated_at`, `deleted_at`, `is_recommended`) VALUES
(1, 'Smartphone X', 'Smartphone terbaru dengan kamera 108MP', 5000000.00, 50, 5, 1, 'images/products/smartphone-x.jpg', 1, '2025-06-13 04:52:35', '2025-06-13 04:52:35', NULL, 1),
(2, 'Laptop Pro', 'Laptop performa tinggi untuk gaming dan kerja', 15000000.00, 20, 3, 1, 'images/products/laptop-pro.jpg', 1, '2025-06-13 04:52:35', '2025-06-13 04:52:35', NULL, 1),
(3, 'Kemeja Casual', 'Kemeja casual nyaman untuk sehari-hari', 250000.00, 100, 10, 1, 'images/products/kemeja-casual.jpg', 2, '2025-06-13 04:52:35', '2025-06-13 04:52:35', NULL, 0),
(4, 'Headphone Wireless', 'Headphone bluetooth dengan noise cancelling', 750000.00, 30, 5, 1, 'images/products/headphone-wireless.jpg', 1, '2025-06-18 07:36:46', '2025-06-18 07:36:46', NULL, 0),
(5, 'Smartwatch Fit', 'Smartwatch dengan fitur kesehatan lengkap', 1200000.00, 25, 5, 1, 'images/products/smartwatch-fit.jpg', 1, '2025-06-18 07:36:46', '2025-06-18 07:36:46', NULL, 0),
(6, 'Kamera Mirrorless', 'Kamera mirrorless 24MP, cocok untuk traveling', 5500000.00, 10, 2, 1, 'images/products/kamera-mirrorless.jpg', 1, '2025-06-18 07:36:46', '2025-06-18 07:36:46', NULL, 0),
(7, 'Sepatu Sneakers', 'Sneakers trendy untuk sehari-hari', 400000.00, 40, 5, 1, 'images/products/sepatu-sneakers.jpg', 2, '2025-06-18 07:36:46', '2025-06-18 07:36:46', NULL, 0),
(8, 'Jaket Hoodie', 'Hoodie nyaman dan stylish', 350000.00, 35, 5, 1, 'images/products/jaket-hoodie.jpg', 2, '2025-06-18 07:36:46', '2025-06-18 07:36:46', NULL, 0),
(9, 'Celana Jeans', 'Celana jeans slim fit', 300000.00, 50, 5, 1, 'images/products/celana-jeans.jpg', 2, '2025-06-18 07:36:46', '2025-06-18 07:36:46', NULL, 0),
(10, 'Masker Medis', 'Masker 3 ply untuk perlindungan harian', 50000.00, 100, 10, 1, 'images/products/masker-medis.jpg', 3, '2025-06-18 07:36:46', '2025-06-18 07:36:46', NULL, 0),
(11, 'Vitamin C', 'Suplemen vitamin C 1000mg', 80000.00, 80, 10, 1, 'images/products/vitamin-c.jpg', 3, '2025-06-18 07:36:46', '2025-06-18 07:36:46', NULL, 0),
(12, 'Alat Pijat Elektrik', 'Alat pijat portable untuk relaksasi', 250000.00, 20, 2, 1, 'images/products/alat-pijat-elektrik.jpg', 3, '2025-06-18 07:36:46', '2025-06-18 07:36:46', NULL, 0),
(13, 'Blender', 'Blender serbaguna untuk dapur', 450000.00, 15, 3, 1, 'images/products/blender.jpg', 4, '2025-06-18 07:36:46', '2025-06-18 07:36:46', NULL, 0),
(14, 'Setrika Uap', 'Setrika uap anti lengket', 300000.00, 18, 3, 1, 'images/products/setrika-uap.jpg', 4, '2025-06-18 07:36:46', '2025-06-18 07:36:46', NULL, 0),
(15, 'Dispenser Air', 'Dispenser air panas & dingin', 700000.00, 12, 2, 1, 'images/products/dispenser-air.jpg', 4, '2025-06-18 07:36:46', '2025-06-18 07:36:46', NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `is_verified_purchase` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('customer','admin') NOT NULL DEFAULT 'customer',
  `birth_date` date NOT NULL,
  `gender` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `email_verification_token` varchar(255) DEFAULT NULL,
  `email_verification_code` varchar(6) DEFAULT NULL,
  `email_verification_expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `birth_date`, `gender`, `remember_token`, `email_verification_token`, `email_verification_code`, `email_verification_expires_at`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@example.com', NULL, '$2y$12$Y2NbbePtgBSkVevuGf2aYuLOyA18T8vAk7t2tbOQS92w7T924X/kW', 'admin', '1990-01-01', 'male', NULL, NULL, NULL, NULL, '2025-06-13 04:52:35', '2025-06-13 04:52:35'),
(2, 'User', 'user@example.com', NULL, '$2y$12$tIvcXmIZCGfjrA3WiSR2cOh90/.JCjjN8sBXKBqjZkqAdpSppbDwe', 'customer', '1995-01-01', 'female', NULL, NULL, NULL, NULL, '2025-06-13 04:52:35', '2025-06-13 04:52:35'),
(3, 'putra', 'putra@example.com', NULL, '$2y$12$ay6xntGx20NsDB9larLbbefpW9FI0iE.YtE0Tz7kDisQE68Y2CWcu', 'customer', '1990-01-01', 'male', NULL, NULL, NULL, NULL, '2025-06-13 04:53:43', '2025-06-13 04:53:43'),
(4, 'Putra Bintang Ramadhan', 'putra2@gmail.com', NULL, '$2y$12$OKR/iSuz.Ybz3GD3GSibJuUIDt3tEKd4Ajd6H6JLzORSPE5Kj4MFW', 'customer', '1999-10-26', 'male', NULL, NULL, NULL, NULL, '2025-06-13 07:10:21', '2025-06-13 07:10:21'),
(5, 'febri', 'febri1@gmail.com', NULL, '$2y$12$zW.IZQeZlRUXcBfapFE/9eL4z0FyDHyGVdwmvwQU1Jl/afaDLg1S2', 'customer', '1999-04-12', 'male', NULL, NULL, NULL, NULL, '2025-06-13 07:16:05', '2025-06-13 07:16:05'),
(6, 'test', 'tester@gmail.com', NULL, '$2y$12$e4Gk.yti7ZYn9/YKixqlNuMYwj2XndrPem3Ddxtgf7JuAAwcWPBwK', 'customer', '1999-10-26', 'female', NULL, NULL, NULL, NULL, '2025-06-17 19:33:18', '2025-06-17 19:33:18'),
(7, 'Putra Bintang Ramadhan', 'putrabintangramadhan26@gmail.com', NULL, '$2y$12$bNR0yQmaJiKLEOmnJp.Dnu0Q73Q2IzHk7RUnJHgGnwP667ysLVqaC', 'customer', '2000-10-26', 'male', 'z6K5TJXxqPafNP6yUa3KGSHFXYxA9Pb96RsUNkQvWGU3RRLDVj0piESThJZg', NULL, NULL, NULL, '2025-06-17 20:15:06', '2025-06-17 21:35:07'),
(8, 'Febriansyah', 'febriansyah1469@gmail.com', NULL, '$2y$12$LIM0M4efdTx777tNT5YQA.PbOhQZcuANcmyO2gaBDfsSyuglPkwIC', 'customer', '2000-03-26', 'male', NULL, NULL, NULL, NULL, '2025-06-18 03:52:25', '2025-06-18 03:52:25'),
(10, 'eiji', 'eijisla7@gmail.com', '2025-06-23 18:26:08', '$2y$12$iHvZZnNgOtYinYlBGbth/.KMrFNdFhvkfrHYTTeI8vn6eKsVVWiYi', 'customer', '2000-10-26', 'male', 'dT0owZwCwPMdC4hy9phZBjHUJeylofY7dJ8Ajo2qNIzxsEypV9wZ4CWkobHy', NULL, NULL, NULL, '2025-06-20 02:15:13', '2025-06-23 18:26:08'),
(11, 'eijihoshi', 'eijihoshi74@gmail.com', NULL, '$2y$12$6rbjWu3up0BtYJAQpXLL8OObr/ABXyCc8qpWPMAYr4sYwj3gOawQ.', 'customer', '1990-01-01', 'male', NULL, NULL, NULL, NULL, '2025-06-20 02:53:35', '2025-06-20 02:53:35'),
(15, 'efabli', 'efabliapp@gmail.com', '2025-06-23 18:31:46', '$2y$12$xmtCUO7qa3Xp0qJBjerQMO9BGQKlwKtb6bxVBPpw/wYGeI21La3f.', 'customer', '2000-10-26', 'male', NULL, NULL, NULL, NULL, '2025-06-23 18:31:14', '2025-06-23 18:31:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2025-06-13 04:58:05', '2025-06-13 04:58:05');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_address_id_foreign` (`address_id`);

--
-- Indeks untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_tracking_order_id_foreign` (`order_id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`),
  ADD KEY `payments_payment_method_id_foreign` (`payment_method_id`);

--
-- Indeks untuk tabel `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_methods_code_unique` (`code`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wishlists_user_id_product_id_unique` (`user_id`,`product_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `order_tracking`
--
ALTER TABLE `order_tracking`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD CONSTRAINT `order_tracking_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

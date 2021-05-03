-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2021 at 04:21 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `0_targetditeapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

CREATE TABLE `abouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `home_page` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `about_translations`
--

CREATE TABLE `about_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `about_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `additions`
--

CREATE TABLE `additions` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `price` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount` double(8,2) UNSIGNED DEFAULT NULL,
  `title_en` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_ar` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addition_translations`
--

CREATE TABLE `addition_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `addition_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ad_translations`
--

CREATE TABLE `ad_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `ad_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `home_page` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs_translations`
--

CREATE TABLE `blogs_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `blogs_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `home_page` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `breakfasts`
--

CREATE TABLE `breakfasts` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `breakfasts`
--

INSERT INTO `breakfasts` (`id`, `status`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'active', 'WRDa5aYb7kH0odmllr1zQwChl7rDQVk8aXANSvq2.jpeg', '2021-03-12 21:14:26', '2021-03-26 17:10:42', NULL),
(3, 'active', 'vpbPe5wZN6XIBxbqChozsiLLLqNfuiIxa8AMPcYo.jpeg', '2021-03-26 17:10:48', '2021-03-26 17:11:13', NULL),
(4, 'active', 'X8DuINf1g0f3aRq6brXWIu2tQYBdDhwKCjAF8ydl.jpeg', '2021-03-26 17:10:50', '2021-03-26 17:11:43', NULL),
(5, 'active', 'fBVcVgZkb3yBhG1NO3LD523ROgLoTNPjgLOh6M1u.jpeg', '2021-03-26 17:10:53', '2021-03-26 17:11:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `breakfast_translations`
--

CREATE TABLE `breakfast_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `breakfast_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `breakfast_translations`
--

INSERT INTO `breakfast_translations` (`id`, `title`, `short_description`, `description`, `extra_description`, `locale`, `breakfast_id`) VALUES
(1, 'وجبة فطار رقم 1', NULL, 'هذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب. \r\nهذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب.', NULL, 'ar', 1),
(2, 'وجبة فطار رقم 1', NULL, 'هذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب. \r\nهذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب.', NULL, 'en', 1),
(5, 'وجبة فطار رقم 2', NULL, 'هذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب. \r\nهذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب.', NULL, 'ar', 3),
(6, 'وجبة فطار رقم 2', NULL, 'هذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب. \r\nهذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب.', NULL, 'en', 3),
(7, 'وجبة فطار رقم  3', NULL, 'هذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب. \r\nهذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب.', NULL, 'ar', 4),
(8, 'وجبة فطار رقم  3', NULL, 'هذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب. \r\nهذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب.', NULL, 'en', 4),
(9, 'وجبة فطار رقم  4', NULL, 'هذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب. \r\nهذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب.', NULL, 'ar', 5),
(10, 'وجبة فطار رقم  4', NULL, 'هذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب. \r\nهذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب.', NULL, 'en', 5);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'kg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

CREATE TABLE `cart_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED NOT NULL,
  `addition_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `home_page` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `section_id`, `status`, `home_page`, `image`, `icon`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:47', '2021-03-12 12:40:47', NULL),
(2, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:48', '2021-03-12 12:40:48', NULL),
(3, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:49', '2021-03-12 12:40:49', NULL),
(4, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:50', '2021-03-12 12:40:50', NULL),
(5, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:50', '2021-03-12 12:40:50', NULL),
(6, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:51', '2021-03-12 12:40:51', NULL),
(7, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:51', '2021-03-12 12:40:51', NULL),
(8, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:52', '2021-03-12 12:40:52', NULL),
(9, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:52', '2021-03-12 12:40:52', NULL),
(10, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:52', '2021-03-12 12:40:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_galleries`
--

CREATE TABLE `category_galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_gallery_translations`
--

CREATE TABLE `category_gallery_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_gallery_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `title`, `short_description`, `description`, `seo_key`, `seo_description`, `locale`) VALUES
(1, 1, 'عنوان التصنيف 1', 'وصف قصير 1', 'وصف التصنيف 1', NULL, NULL, 'ar'),
(2, 1, 'title  1', 'short_description1', 'description1', NULL, NULL, 'en'),
(3, 2, 'عنوان التصنيف 2', 'وصف قصير 2', 'وصف التصنيف 2', NULL, NULL, 'ar'),
(4, 2, 'title  2', 'short_description2', 'description2', NULL, NULL, 'en'),
(5, 3, 'عنوان التصنيف 3', 'وصف قصير 3', 'وصف التصنيف 3', NULL, NULL, 'ar'),
(6, 3, 'title  3', 'short_description3', 'description3', NULL, NULL, 'en'),
(7, 4, 'عنوان التصنيف 4', 'وصف قصير 4', 'وصف التصنيف 4', NULL, NULL, 'ar'),
(8, 4, 'title  4', 'short_description4', 'description4', NULL, NULL, 'en'),
(9, 5, 'عنوان التصنيف 5', 'وصف قصير 5', 'وصف التصنيف 5', NULL, NULL, 'ar'),
(10, 5, 'title  5', 'short_description5', 'description5', NULL, NULL, 'en'),
(11, 6, 'عنوان التصنيف 6', 'وصف قصير 6', 'وصف التصنيف 6', NULL, NULL, 'ar'),
(12, 6, 'title  6', 'short_description6', 'description6', NULL, NULL, 'en'),
(13, 7, 'عنوان التصنيف 7', 'وصف قصير 7', 'وصف التصنيف 7', NULL, NULL, 'ar'),
(14, 7, 'title  7', 'short_description7', 'description7', NULL, NULL, 'en'),
(15, 8, 'عنوان التصنيف 8', 'وصف قصير 8', 'وصف التصنيف 8', NULL, NULL, 'ar'),
(16, 8, 'title  8', 'short_description8', 'description8', NULL, NULL, 'en'),
(17, 9, 'عنوان التصنيف 9', 'وصف قصير 9', 'وصف التصنيف 9', NULL, NULL, 'ar'),
(18, 9, 'title  9', 'short_description9', 'description9', NULL, NULL, 'en'),
(19, 10, 'عنوان التصنيف 10', 'وصف قصير 10', 'وصف التصنيف 10', NULL, NULL, 'ar'),
(20, 10, 'title  10', 'short_description10', 'description10', NULL, NULL, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `choose_meals`
--

CREATE TABLE `choose_meals` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `subscribe_id` int(10) UNSIGNED NOT NULL,
  `breakfast_id` int(10) UNSIGNED NOT NULL,
  `breakfastNotes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dinner_id` int(10) UNSIGNED NOT NULL,
  `dinnerNotes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `launche_id` int(10) UNSIGNED NOT NULL,
  `launcheNotes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snack_id` int(10) UNSIGNED NOT NULL,
  `snackNotes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_id`, `status`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'active', 'default.png', '2021-03-17 22:52:29', '2021-03-17 22:52:29', NULL),
(2, 2, 'active', 'default.png', '2021-03-17 22:53:43', '2021-03-17 22:53:43', NULL),
(3, 2, 'active', 'default.png', '2021-03-18 15:10:00', '2021-03-18 15:10:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `city_translations`
--

CREATE TABLE `city_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `city_translations`
--

INSERT INTO `city_translations` (`id`, `title`, `description`, `locale`, `city_id`) VALUES
(1, 'القاهرة', NULL, 'ar', 1),
(2, 'cairo', NULL, 'en', 1),
(3, 'الجيزة', NULL, 'ar', 2),
(4, 'Giza', NULL, 'en', 2),
(5, 'الاسكندرية', NULL, 'ar', 3),
(6, 'ALEX', NULL, 'en', 3);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `price` double NOT NULL DEFAULT 0,
  `program_id` int(10) UNSIGNED NOT NULL,
  `isBreakfast` tinyint(1) NOT NULL DEFAULT 0,
  `isDinner` tinyint(1) NOT NULL DEFAULT 0,
  `isLaunch` tinyint(1) NOT NULL DEFAULT 0,
  `numberSnaks` int(11) NOT NULL DEFAULT 0,
  `day_id` int(10) UNSIGNED NOT NULL,
  `promo_code_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `status`, `image`, `price`, `program_id`, `isBreakfast`, `isDinner`, `isLaunch`, `numberSnaks`, `day_id`, `promo_code_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'active', '8E2O8iQwvccgQXDFgNBYWAUTlbV0vlgh9LMt6YnF.jpeg', 50, 3, 1, 1, 1, 3, 1, NULL, '2021-03-26 17:18:13', '2021-03-26 17:19:48', NULL),
(3, 'active', 'FYrWvG0HrCGaLF0kpleHMtMGhP57KNo8Ms9RLKPv.jpeg', 80, 4, 0, 1, 0, 2, 2, NULL, '2021-03-26 17:20:42', '2021-03-26 17:20:42', NULL),
(4, 'active', 'DVBhaUAi73dsV9WmCIkLLJUbf60lFMGykvGalyaG.jpeg', 80, 5, 0, 1, 1, 3, 1, NULL, '2021-03-26 17:22:00', '2021-03-26 17:22:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `collection_translations`
--

CREATE TABLE `collection_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `collection_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collection_translations`
--

INSERT INTO `collection_translations` (`id`, `title`, `short_description`, `description`, `extra_description`, `locale`, `collection_id`) VALUES
(3, 'كوكلشن الاول', NULL, 'الوصف باللغة العربيه', NULL, 'ar', 2),
(4, 'كوكلشن الاول', NULL, 'الوصف باللغة الانجليزيه', NULL, 'en', 2),
(5, 'كوكلشن 2', NULL, 'الوصف باللغة العربيه', NULL, 'ar', 3),
(6, 'كوكلشن 2', NULL, 'الوصف باللغة الانجليزيه', NULL, 'en', 3),
(7, 'كوكلشن 3', NULL, 'الوصف باللغة العربيه', NULL, 'ar', 4),
(8, 'كوكلشن 3', NULL, 'الوصف باللغة الانجليزيه', NULL, 'en', 4);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `status`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'active', 'default.png', '2021-03-17 22:51:33', '2021-03-17 22:51:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country_translations`
--

CREATE TABLE `country_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country_translations`
--

INSERT INTO `country_translations` (`id`, `title`, `description`, `locale`, `country_id`) VALUES
(3, 'الكويت', NULL, 'ar', 2),
(4, 'Kuwait', NULL, 'en', 2);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 1,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deviceType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebaseToken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `term_condition` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `approved` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `city_id` int(10) DEFAULT NULL,
  `state_id` int(10) DEFAULT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_region` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_street` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_home_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_floor_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_appartment_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_comments_extra` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `verified`, `full_name`, `dateOfBirth`, `phone`, `email`, `social_id`, `deviceType`, `firebaseToken`, `term_condition`, `status`, `gender`, `image`, `approved`, `email_verified_at`, `password`, `provider`, `provider_id`, `lat`, `lng`, `city_id`, `state_id`, `customer_address`, `customer_region`, `customer_street`, `customer_home_number`, `customer_floor_number`, `customer_appartment_number`, `customer_postal_code`, `customer_comments_extra`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(8, 1, 'qweqw', '2021-03-10', '01142117402', 'tarek@gmail.com', NULL, 'ios', NULL, '0', '1', 'male', 'default.png', '1', NULL, '$2y$10$iN4Ukq.XVAWgtD2jzeFgFetmV9hBgt/DNf9pXZFNRYQmkrazhXFDK', NULL, NULL, 1.52, 11522.2, 1, 1, 'Egypt- giza-elmohandseen', NULL, NULL, NULL, NULL, NULL, NULL, 'any extra  comment', NULL, NULL, '2021-03-26 17:51:07', '2021-03-26 17:54:16');

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `id` int(10) UNSIGNED NOT NULL,
  `day` int(11) NOT NULL DEFAULT 1,
  `dayOff` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fri,sat',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`id`, `day`, `dayOff`, `created_at`, `updated_at`) VALUES
(1, 28, 'Friday', '2021-03-12 20:12:43', '2021-03-18 03:04:49'),
(2, 22, 'Saturday', '2021-03-12 20:12:52', '2021-03-18 03:04:34'),
(3, 14, 'Saturday and Friday', '2021-03-12 20:13:01', '2021-03-18 03:04:15');

-- --------------------------------------------------------

--
-- Table structure for table `dinners`
--

CREATE TABLE `dinners` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dinners`
--

INSERT INTO `dinners` (`id`, `status`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'active', '1mItYrUM6wKUYWn8Lmah1UbLk6RbEBAa6uYUayaW.jpeg', '2021-03-26 17:07:33', '2021-03-26 17:07:33', NULL),
(4, 'active', 'hJvLb3RL0gTrKY9ndTT5cStBebgDg2AlSoLhtKd3.jpeg', '2021-03-26 17:07:38', '2021-03-26 17:08:03', NULL),
(5, 'active', 'QTi47ADcgrs5OprauHPQ0Y7Ho0i2qe9DbPALlhYr.jpeg', '2021-03-26 17:07:41', '2021-03-26 17:08:27', NULL),
(6, 'active', 'pQrpisMujmR4DvRnpjOvXDvq91zIwfNqVsG3HuFH.jpeg', '2021-03-26 17:07:44', '2021-03-26 17:08:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dinner_translations`
--

CREATE TABLE `dinner_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dinner_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dinner_translations`
--

INSERT INTO `dinner_translations` (`id`, `title`, `short_description`, `description`, `extra_description`, `locale`, `dinner_id`) VALUES
(5, 'وجبة عشاء رقم 1', NULL, 'هذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب. \r\nهذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب.', NULL, 'ar', 3),
(6, 'وجبة عشاء رقم 1', NULL, 'هذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب. \r\nهذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب.', NULL, 'en', 3),
(7, 'وجبة عشاء رقم 2', NULL, 'هذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب. \r\nهذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب.', NULL, 'ar', 4),
(8, 'وجبة عشاء رقم 2', NULL, 'هذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب. \r\nهذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب.', NULL, 'en', 4),
(9, 'وجبة عشاء رقم 3', NULL, 'هذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب. \r\nهذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب.', NULL, 'ar', 5),
(10, 'وجبة عشاء رقم 3', NULL, 'هذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب. \r\nهذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب.', NULL, 'en', 5),
(11, 'وجبة عشاء رقم4', NULL, 'هذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب. \r\nهذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب.', NULL, 'ar', 6),
(12, 'وجبة عشاء رقم4', NULL, 'هذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب. \r\nهذا النظام الغذائي مجرد نموذج لكيفية اتباع نظام غذائي صحي مفيد للقلب ويمكن استبدال بعض الأكلات بأكلات أخرى ترغبونها ولكن بنفس المعدل من العناصر الغذائية. لمعرفة معلومات أكثر عن أغذية صحية مفيدة لمرضى القلب.', NULL, 'en', 6);

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_gallery_id` int(10) UNSIGNED DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `image_services`
--

CREATE TABLE `image_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `service_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inboxes`
--

CREATE TABLE `inboxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inbox',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not_active',
  `updated_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inboxes`
--

INSERT INTO `inboxes` (`id`, `type`, `name`, `phone`, `email`, `message`, `status`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'inbox', 'tarek ', '456789321', 'info@Gamil.com', 'Your message', 'active', NULL, '2021-03-12 12:40:46', '2021-03-12 12:40:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `instructions`
--

CREATE TABLE `instructions` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `prepare_at` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '10',
  `cook_at` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `serves_no` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instruction_translations`
--

CREATE TABLE `instruction_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `instruction_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ingredient` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `customer_country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'egy',
  `invoice_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `service_id` int(10) UNSIGNED DEFAULT NULL,
  `title_service_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `item_price` decimal(8,2) DEFAULT NULL,
  `total` decimal(8,2) DEFAULT NULL,
  `discount` decimal(8,2) DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fees` double DEFAULT NULL,
  `vat` decimal(8,2) DEFAULT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly',
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cach',
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Not completed',
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `launches`
--

CREATE TABLE `launches` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `launches`
--

INSERT INTO `launches` (`id`, `status`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'active', 'cBAteOIFqoBexEopVWxZaAEZhpC94rgG8EkkiSbI.jpeg', '2021-03-26 16:58:03', '2021-03-26 17:00:46', NULL),
(10, 'active', 'CIjzxflj5nC1wg20SEpNQlPeQGqzc1QkK912p6O3.jpeg', '2021-03-26 17:00:19', '2021-03-26 17:01:05', NULL),
(11, 'active', 'r1YGqjKCMAArHciPXmtjuEmdH2aeRfpiCSh17Gud.jpeg', '2021-03-26 17:00:24', '2021-03-26 17:01:27', NULL),
(12, 'active', 'i9RuQRH5f3fl1uorW4Cm1l5S7FiBlKPNKK6dNTcb.jpeg', '2021-03-26 17:00:29', '2021-03-26 17:01:50', NULL),
(13, 'active', 'XVvl3KuypbyCGyFbYp9Yq77pmpWQEmeDPuRQ8Z9u.jpeg', '2021-03-26 17:00:33', '2021-03-26 17:02:15', NULL),
(14, 'active', 'cBAteOIFqoBexEopVWxZaAEZhpC94rgG8EkkiSbI.jpeg', '2021-03-26 17:02:25', '2021-03-26 17:02:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `launch_translations`
--

CREATE TABLE `launch_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `launch_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `launch_translations`
--

INSERT INTO `launch_translations` (`id`, `title`, `short_description`, `description`, `extra_description`, `locale`, `launch_id`) VALUES
(3, 'وجبة  رقم_2', NULL, 'الحصول على القوام الرشيق ليس من الأمور المستحيلة خاصة لو عرفنا أصول تحضير الطعام بطريقة صحية وخالية من الدهون ليكون \" اللحم بالخضروات\" متصدر قائمة الأكلات السريعة التى لا يستغرق إعدادها سوى 10 دقائق ليكون بعدها لدينا طبق شهى ومميز.', NULL, 'ar', 3),
(4, 'وجبة  رقم_2', NULL, 'الحصول على القوام الرشيق ليس من الأمور المستحيلة خاصة لو عرفنا أصول تحضير الطعام بطريقة صحية وخالية من الدهون ليكون \" اللحم بالخضروات\" متصدر قائمة الأكلات السريعة التى لا يستغرق إعدادها سوى 10 دقائق ليكون بعدها لدينا طبق شهى ومميز.', NULL, 'en', 3),
(17, 'وجبة  رقم_3', NULL, 'الحصول على القوام الرشيق ليس من الأمور المستحيلة خاصة لو عرفنا أصول تحضير الطعام بطريقة صحية وخالية من الدهون ليكون \" اللحم بالخضروات\" متصدر قائمة الأكلات السريعة التى لا يستغرق إعدادها سوى 10 دقائق ليكون بعدها لدينا طبق شهى ومميز.', NULL, 'ar', 10),
(18, 'وجبة  رقم_3', NULL, 'الحصول على القوام الرشيق ليس من الأمور المستحيلة خاصة لو عرفنا أصول تحضير الطعام بطريقة صحية وخالية من الدهون ليكون \" اللحم بالخضروات\" متصدر قائمة الأكلات السريعة التى لا يستغرق إعدادها سوى 10 دقائق ليكون بعدها لدينا طبق شهى ومميز.', NULL, 'en', 10),
(19, 'وجبة  رقم_4', NULL, 'الحصول على القوام الرشيق ليس من الأمور المستحيلة خاصة لو عرفنا أصول تحضير الطعام بطريقة صحية وخالية من الدهون ليكون \" اللحم بالخضروات\" متصدر قائمة الأكلات السريعة التى لا يستغرق إعدادها سوى 10 دقائق ليكون بعدها لدينا طبق شهى ومميز.', NULL, 'ar', 11),
(20, 'وجبة  رقم_4', NULL, 'الحصول على القوام الرشيق ليس من الأمور المستحيلة خاصة لو عرفنا أصول تحضير الطعام بطريقة صحية وخالية من الدهون ليكون \" اللحم بالخضروات\" متصدر قائمة الأكلات السريعة التى لا يستغرق إعدادها سوى 10 دقائق ليكون بعدها لدينا طبق شهى ومميز.', NULL, 'en', 11),
(21, 'وجبة  رقم_5', NULL, 'الحصول على القوام الرشيق ليس من الأمور المستحيلة خاصة لو عرفنا أصول تحضير الطعام بطريقة صحية وخالية من الدهون ليكون \" اللحم بالخضروات\" متصدر قائمة الأكلات السريعة التى لا يستغرق إعدادها سوى 10 دقائق ليكون بعدها لدينا طبق شهى ومميز.', NULL, 'ar', 12),
(22, 'وجبة  رقم_5', NULL, 'الحصول على القوام الرشيق ليس من الأمور المستحيلة خاصة لو عرفنا أصول تحضير الطعام بطريقة صحية وخالية من الدهون ليكون \" اللحم بالخضروات\" متصدر قائمة الأكلات السريعة التى لا يستغرق إعدادها سوى 10 دقائق ليكون بعدها لدينا طبق شهى ومميز.', NULL, 'en', 12),
(23, 'وجبة  رقم_7', NULL, 'الحصول على القوام الرشيق ليس من الأمور المستحيلة خاصة لو عرفنا أصول تحضير الطعام بطريقة صحية وخالية من الدهون ليكون \" اللحم بالخضروات\" متصدر قائمة الأكلات السريعة التى لا يستغرق إعدادها سوى 10 دقائق ليكون بعدها لدينا طبق شهى ومميز.', NULL, 'ar', 13),
(24, 'وجبة  رقم_7', NULL, 'الحصول على القوام الرشيق ليس من الأمور المستحيلة خاصة لو عرفنا أصول تحضير الطعام بطريقة صحية وخالية من الدهون ليكون \" اللحم بالخضروات\" متصدر قائمة الأكلات السريعة التى لا يستغرق إعدادها سوى 10 دقائق ليكون بعدها لدينا طبق شهى ومميز.', NULL, 'en', 13),
(25, 'وجبة  رقم_33', NULL, 'الحصول على القوام الرشيق ليس من الأمور المستحيلة خاصة لو عرفنا أصول تحضير الطعام بطريقة صحية وخالية من الدهون ليكون \" اللحم بالخضروات\" متصدر قائمة الأكلات السريعة التى لا يستغرق إعدادها سوى 10 دقائق ليكون بعدها لدينا طبق شهى ومميز.', NULL, 'ar', 14),
(26, 'وجبة  رقم_43', NULL, 'الحصول على القوام الرشيق ليس من الأمور المستحيلة خاصة لو عرفنا أصول تحضير الطعام بطريقة صحية وخالية من الدهون ليكون \" اللحم بالخضروات\" متصدر قائمة الأكلات السريعة التى لا يستغرق إعدادها سوى 10 دقائق ليكون بعدها لدينا طبق شهى ومميز.', NULL, 'en', 14);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_01_10_124214_laratrust_setup_tables', 1),
(9, '2019_01_10_124215_create_sections_table', 1),
(10, '2019_01_10_124216_create_section_translations_table', 1),
(11, '2019_01_24_145852_create_categories_table', 1),
(12, '2019_01_28_194130_create_category_translations_table', 1),
(13, '2019_01_28_194131_create_sub_categories_table', 1),
(14, '2019_01_28_194132_create_sub_category_translations_table', 1),
(15, '2019_02_05_031022_create_products_table', 1),
(16, '2019_02_05_031035_create_product_translations_table', 1),
(17, '2019_02_19_064134_create_clients_table', 1),
(18, '2019_02_21_081632_create_inboxes_table', 1),
(19, '2019_02_21_081748_create_socail_media_table', 1),
(20, '2019_03_26_105116_create_sliders_table', 1),
(21, '2019_03_26_105327_create_slider_translations_table', 1),
(22, '2019_03_28_095647_create_brands_table', 1),
(23, '2019_03_28_121350_create_abouts_table', 1),
(24, '2019_03_28_121426_create_about_translations_table', 1),
(25, '2019_06_23_081318_create_parteners_table', 1),
(26, '2019_06_23_081336_create_parteners_translations_table', 1),
(27, '2019_08_29_090025_create_testimonails_table', 1),
(28, '2019_08_29_090108_create_testimonails_translations_table', 1),
(29, '2019_11_13_113316_create_blogs_table', 1),
(30, '2019_11_13_113326_create_blogs_translations_table', 1),
(31, '2020_11_11_091125_create_services_table', 1),
(32, '2020_11_11_091126_create_service_translations_table', 1),
(33, '2020_11_11_091147_create_plans_table', 1),
(34, '2020_11_11_091203_create_plan_translations_table', 1),
(35, '2020_11_11_094331_create_image_services_table', 1),
(36, '2020_11_12_093103_create_tags_table', 1),
(37, '2020_11_12_093137_create_tag_translations_table', 1),
(38, '2020_11_12_094626_create_product_tags_table', 1),
(39, '2020_11_12_104153_create_packages_table', 1),
(40, '2020_11_12_104211_create_package_translations_table', 1),
(41, '2020_11_15_120213_create_settings_table', 1),
(42, '2020_11_15_120309_create_setting_translations_table', 1),
(43, '2020_11_18_094146_create_customers_table', 1),
(44, '2020_11_18_094255_create_tickets_table', 1),
(45, '2020_11_18_094305_create_ticket_details_table', 1),
(46, '2020_11_18_132749_create_quotes_table', 1),
(47, '2020_11_22_092535_create_vendors_table', 1),
(48, '2020_12_01_122343_create_pages_table', 1),
(49, '2020_12_01_122417_create_page_translations_table', 1),
(50, '2020_12_15_084009_create_promo_codes_table', 1),
(51, '2020_12_15_084048_create_promo_code_translations_table', 1),
(52, '2020_12_21_142816_create_rates_table', 1),
(53, '2020_12_21_142853_create_wishlists_table', 1),
(54, '2020_12_21_143142_create_carts_table', 1),
(55, '2020_12_21_143641_create_orders_table', 1),
(56, '2020_12_21_143653_create_order_details_table', 1),
(57, '2020_12_21_143707_create_invoices_table', 1),
(58, '2020_12_21_143859_create_invoice_details_table', 1),
(59, '2020_12_21_144348_create_instructions_table', 1),
(60, '2020_12_21_144359_create_instruction_translations_table', 1),
(61, '2020_12_21_144911_create_additions_table', 1),
(62, '2020_12_21_144924_create_addition_translations_table', 1),
(63, '2020_12_21_150835_create_category_galleries_table', 1),
(64, '2020_12_21_150847_create_category_gallery_translations_table', 1),
(65, '2020_12_21_150900_create_galleries_table', 1),
(66, '2020_12_21_151507_create_addresses_table', 1),
(67, '2020_12_22_144606_create_images_table', 1),
(68, '2020_12_23_150434_create_pieces_table', 1),
(69, '2020_12_23_150445_create_piece_translations_table', 1),
(70, '2020_12_23_150754_create_product_pieces_table', 1),
(71, '2020_12_27_132200_create_notifications_table', 1),
(72, '2020_12_27_132444_create_ads_table', 1),
(73, '2020_12_27_132457_create_ad_translations_table', 1),
(74, '2021_01_05_115255_create_cart_details_table', 1),
(75, '2021_01_06_120410_create_countries_table', 1),
(76, '2021_01_06_120438_create_country_translations_table', 1),
(77, '2021_01_06_120502_create_cities_table', 1),
(78, '2021_01_06_120518_create_city_translations_table', 1),
(79, '2021_01_06_120532_create_states_table', 1),
(80, '2021_01_06_120551_create_state_translations_table', 1),
(81, '2021_01_10_123523_create_order_additions_table', 1),
(82, '2021_01_18_142637_create_provenances_table', 1),
(83, '2021_01_18_142828_create_provenance_translations_table', 1),
(84, '2021_02_07_131746_create_weights_table', 1),
(85, '2021_02_07_131755_create_weight_translations_table', 1),
(86, '2021_02_07_131802_create_product_weights_table', 1),
(87, '2021_03_12_133200_create_programs_table', 1),
(88, '2021_03_12_133343_create_program_translations_table', 1),
(89, '2021_03_12_133356_create_days_table', 1),
(90, '2021_03_12_133415_create_collections_table', 1),
(91, '2021_03_12_133427_create_collection_translations_table', 1),
(92, '2021_03_12_133448_create_breakfasts_table', 1),
(93, '2021_03_12_133459_create_breakfast_translations_table', 1),
(94, '2021_03_12_133528_create_dinners_table', 1),
(95, '2021_03_12_133540_create_dinner_translations_table', 1),
(96, '2021_03_12_133606_create_launches_table', 1),
(97, '2021_03_12_133617_create_launch_translations_table', 1),
(98, '2021_03_12_133631_create_snacks_table', 1),
(99, '2021_03_12_133642_create_snack_translations_table', 1),
(100, '2021_03_12_133651_create_subscribes_table', 1),
(101, '2021_03_12_133701_create_choose_meals_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('b00a68df3979c7557b620e68909a9be45239e783711efab20bdcdfc30aee8215e111e9717ccc2409', 8, 1, 'Personal Access Token', '[]', 0, '2021-03-26 17:54:16', '2021-03-26 17:54:16', '2022-03-26 19:54:16'),
('de8387025671d5ab3f49cf115b19344a8a501c166c253daea366cac597bdc091864e4888069902b5', 8, 1, 'Personal Access Token', '[]', 0, '2021-03-26 17:52:55', '2021-03-26 17:52:55', '2022-03-26 19:52:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'fofI0MqsnVykHolUElMjv2yg8cdgUz3ObMHHChHE', 'http://localhost', 1, 0, 0, '2021-03-26 17:52:43', '2021-03-26 17:52:43'),
(2, NULL, 'Laravel Password Grant Client', 'zbAo7CLNzcY9VeGjYKRwMLmZmhtuAUWZlksFNpM2', 'http://localhost', 0, 1, 0, '2021-03-26 17:52:43', '2021-03-26 17:52:43');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-03-26 17:52:43', '2021-03-26 17:52:43');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `device_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'desktop',
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `type_delivery` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employees` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pendding',
  `shipping_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_region` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_street` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_home_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_floor_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_appartment_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_comments_extra` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `langtude` double(8,2) NOT NULL DEFAULT 0.00,
  `lattude` double(8,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'visa',
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Not Complete',
  `taxes` double DEFAULT NULL,
  `delivery_fees` double DEFAULT NULL,
  `promocode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_additions`
--

CREATE TABLE `order_additions` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `addition_id` int(10) UNSIGNED DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price_before_discount` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price_before_discount` int(11) DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'kg',
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `falg` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Popular',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `home_page` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `background_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#e67e22',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `price_egy_monthly` double(8,2) DEFAULT NULL,
  `offer_egy_monthly` double(8,2) DEFAULT NULL,
  `price_egy_yearly` double(8,2) DEFAULT NULL,
  `offer_egy_yearly` double(8,2) DEFAULT NULL,
  `price_dollar_monthly` double(8,2) DEFAULT NULL,
  `offer_dollar_monthly` double(8,2) DEFAULT NULL,
  `price_dollar_yearly` double(8,2) DEFAULT NULL,
  `offer_dollar_yearly` double(8,2) DEFAULT NULL,
  `time_period` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Monthly',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_translations`
--

CREATE TABLE `package_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `num1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_google_analatic` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_messanger` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `type`, `link`, `image`, `num1`, `num2`, `email`, `num3`, `map`, `seo_google_analatic`, `facebook_messanger`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'polices', NULL, 'v3VdFWPsftyz2uN6EQEo28edJm52GGc553ZxNP8L.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-17 23:01:06', '2021-03-17 23:01:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_translations`
--

CREATE TABLE `page_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_translations`
--

INSERT INTO `page_translations` (`id`, `page_id`, `title`, `short_description`, `description`, `extra_description`, `seo_key`, `seo_description`, `locale`) VALUES
(1, 1, 'السياسات', NULL, 'سياسات التطبيق', NULL, NULL, NULL, 'ar'),
(2, 1, 'Conditions', NULL, '<p>App conditions&nbsp;</p>', NULL, NULL, NULL, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `parteners`
--

CREATE TABLE `parteners` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `home_page` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `fb_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tw_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `in_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ln_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yt_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gh_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parteners_translations`
--

CREATE TABLE `parteners_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `parteners_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'create_programs', 'Create Programs', 'Create Programs', '2021-03-12 12:40:26', '2021-03-12 12:40:26'),
(2, 'read_programs', 'Read Programs', 'Read Programs', '2021-03-12 12:40:26', '2021-03-12 12:40:26'),
(3, 'update_programs', 'Update Programs', 'Update Programs', '2021-03-12 12:40:27', '2021-03-12 12:40:27'),
(4, 'delete_programs', 'Delete Programs', 'Delete Programs', '2021-03-12 12:40:27', '2021-03-12 12:40:27'),
(5, 'create_days', 'Create Days', 'Create Days', '2021-03-12 12:40:27', '2021-03-12 12:40:27'),
(6, 'read_days', 'Read Days', 'Read Days', '2021-03-12 12:40:27', '2021-03-12 12:40:27'),
(7, 'update_days', 'Update Days', 'Update Days', '2021-03-12 12:40:27', '2021-03-12 12:40:27'),
(8, 'delete_days', 'Delete Days', 'Delete Days', '2021-03-12 12:40:27', '2021-03-12 12:40:27'),
(9, 'create_collections', 'Create Collections', 'Create Collections', '2021-03-12 12:40:27', '2021-03-12 12:40:27'),
(10, 'read_collections', 'Read Collections', 'Read Collections', '2021-03-12 12:40:27', '2021-03-12 12:40:27'),
(11, 'update_collections', 'Update Collections', 'Update Collections', '2021-03-12 12:40:27', '2021-03-12 12:40:27'),
(12, 'delete_collections', 'Delete Collections', 'Delete Collections', '2021-03-12 12:40:27', '2021-03-12 12:40:27'),
(13, 'create_preakfasts', 'Create Preakfasts', 'Create Preakfasts', '2021-03-12 12:40:27', '2021-03-12 12:40:27'),
(14, 'read_preakfasts', 'Read Preakfasts', 'Read Preakfasts', '2021-03-12 12:40:27', '2021-03-12 12:40:27'),
(15, 'update_preakfasts', 'Update Preakfasts', 'Update Preakfasts', '2021-03-12 12:40:27', '2021-03-12 12:40:27'),
(16, 'delete_preakfasts', 'Delete Preakfasts', 'Delete Preakfasts', '2021-03-12 12:40:27', '2021-03-12 12:40:27'),
(17, 'create_dinners', 'Create Dinners', 'Create Dinners', '2021-03-12 12:40:27', '2021-03-12 12:40:27'),
(18, 'read_dinners', 'Read Dinners', 'Read Dinners', '2021-03-12 12:40:27', '2021-03-12 12:40:27'),
(19, 'update_dinners', 'Update Dinners', 'Update Dinners', '2021-03-12 12:40:27', '2021-03-12 12:40:27'),
(20, 'delete_dinners', 'Delete Dinners', 'Delete Dinners', '2021-03-12 12:40:27', '2021-03-12 12:40:27'),
(21, 'create_launchs', 'Create Launchs', 'Create Launchs', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(22, 'read_launchs', 'Read Launchs', 'Read Launchs', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(23, 'update_launchs', 'Update Launchs', 'Update Launchs', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(24, 'delete_launchs', 'Delete Launchs', 'Delete Launchs', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(25, 'create_snacks', 'Create Snacks', 'Create Snacks', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(26, 'read_snacks', 'Read Snacks', 'Read Snacks', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(27, 'update_snacks', 'Update Snacks', 'Update Snacks', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(28, 'delete_snacks', 'Delete Snacks', 'Delete Snacks', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(29, 'create_subscribes', 'Create Subscribes', 'Create Subscribes', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(30, 'read_subscribes', 'Read Subscribes', 'Read Subscribes', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(31, 'update_subscribes', 'Update Subscribes', 'Update Subscribes', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(32, 'delete_subscribes', 'Delete Subscribes', 'Delete Subscribes', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(33, 'create_choosedMeals', 'Create ChoosedMeals', 'Create ChoosedMeals', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(34, 'read_choosedMeals', 'Read ChoosedMeals', 'Read ChoosedMeals', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(35, 'update_choosedMeals', 'Update ChoosedMeals', 'Update ChoosedMeals', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(36, 'delete_choosedMeals', 'Delete ChoosedMeals', 'Delete ChoosedMeals', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(37, 'create_countries', 'Create Countries', 'Create Countries', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(38, 'read_countries', 'Read Countries', 'Read Countries', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(39, 'update_countries', 'Update Countries', 'Update Countries', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(40, 'delete_countries', 'Delete Countries', 'Delete Countries', '2021-03-12 12:40:28', '2021-03-12 12:40:28'),
(41, 'create_cities', 'Create Cities', 'Create Cities', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(42, 'read_cities', 'Read Cities', 'Read Cities', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(43, 'update_cities', 'Update Cities', 'Update Cities', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(44, 'delete_cities', 'Delete Cities', 'Delete Cities', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(45, 'create_states', 'Create States', 'Create States', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(46, 'read_states', 'Read States', 'Read States', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(47, 'update_states', 'Update States', 'Update States', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(48, 'delete_states', 'Delete States', 'Delete States', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(49, 'create_provenances', 'Create Provenances', 'Create Provenances', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(50, 'read_provenances', 'Read Provenances', 'Read Provenances', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(51, 'update_provenances', 'Update Provenances', 'Update Provenances', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(52, 'delete_provenances', 'Delete Provenances', 'Delete Provenances', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(53, 'create_weights', 'Create Weights', 'Create Weights', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(54, 'read_weights', 'Read Weights', 'Read Weights', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(55, 'update_weights', 'Update Weights', 'Update Weights', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(56, 'delete_weights', 'Delete Weights', 'Delete Weights', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(57, 'create_productWeights', 'Create ProductWeights', 'Create ProductWeights', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(58, 'read_productWeights', 'Read ProductWeights', 'Read ProductWeights', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(59, 'update_productWeights', 'Update ProductWeights', 'Update ProductWeights', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(60, 'delete_productWeights', 'Delete ProductWeights', 'Delete ProductWeights', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(61, 'create_sections', 'Create Sections', 'Create Sections', '2021-03-12 12:40:29', '2021-03-12 12:40:29'),
(62, 'read_sections', 'Read Sections', 'Read Sections', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(63, 'update_sections', 'Update Sections', 'Update Sections', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(64, 'delete_sections', 'Delete Sections', 'Delete Sections', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(65, 'create_subCategories', 'Create SubCategories', 'Create SubCategories', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(66, 'read_subCategories', 'Read SubCategories', 'Read SubCategories', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(67, 'update_subCategories', 'Update SubCategories', 'Update SubCategories', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(68, 'delete_subCategories', 'Delete SubCategories', 'Delete SubCategories', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(69, 'create_instructions', 'Create Instructions', 'Create Instructions', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(70, 'read_instructions', 'Read Instructions', 'Read Instructions', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(71, 'update_instructions', 'Update Instructions', 'Update Instructions', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(72, 'delete_instructions', 'Delete Instructions', 'Delete Instructions', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(73, 'create_galleries', 'Create Galleries', 'Create Galleries', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(74, 'read_galleries', 'Read Galleries', 'Read Galleries', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(75, 'update_galleries', 'Update Galleries', 'Update Galleries', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(76, 'delete_galleries', 'Delete Galleries', 'Delete Galleries', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(77, 'create_rates', 'Create Rates', 'Create Rates', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(78, 'read_rates', 'Read Rates', 'Read Rates', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(79, 'update_rates', 'Update Rates', 'Update Rates', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(80, 'delete_rates', 'Delete Rates', 'Delete Rates', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(81, 'create_wishlists', 'Create Wishlists', 'Create Wishlists', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(82, 'read_wishlists', 'Read Wishlists', 'Read Wishlists', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(83, 'update_wishlists', 'Update Wishlists', 'Update Wishlists', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(84, 'delete_wishlists', 'Delete Wishlists', 'Delete Wishlists', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(85, 'create_carts', 'Create Carts', 'Create Carts', '2021-03-12 12:40:30', '2021-03-12 12:40:30'),
(86, 'read_carts', 'Read Carts', 'Read Carts', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(87, 'update_carts', 'Update Carts', 'Update Carts', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(88, 'delete_carts', 'Delete Carts', 'Delete Carts', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(89, 'create_orders', 'Create Orders', 'Create Orders', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(90, 'read_orders', 'Read Orders', 'Read Orders', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(91, 'update_orders', 'Update Orders', 'Update Orders', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(92, 'delete_orders', 'Delete Orders', 'Delete Orders', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(93, 'create_invoices', 'Create Invoices', 'Create Invoices', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(94, 'read_invoices', 'Read Invoices', 'Read Invoices', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(95, 'update_invoices', 'Update Invoices', 'Update Invoices', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(96, 'delete_invoices', 'Delete Invoices', 'Delete Invoices', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(97, 'create_additions', 'Create Additions', 'Create Additions', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(98, 'read_additions', 'Read Additions', 'Read Additions', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(99, 'update_additions', 'Update Additions', 'Update Additions', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(100, 'delete_additions', 'Delete Additions', 'Delete Additions', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(101, 'create_addresses', 'Create Addresses', 'Create Addresses', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(102, 'read_addresses', 'Read Addresses', 'Read Addresses', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(103, 'update_addresses', 'Update Addresses', 'Update Addresses', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(104, 'delete_addresses', 'Delete Addresses', 'Delete Addresses', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(105, 'create_pieces', 'Create Pieces', 'Create Pieces', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(106, 'read_pieces', 'Read Pieces', 'Read Pieces', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(107, 'update_pieces', 'Update Pieces', 'Update Pieces', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(108, 'delete_pieces', 'Delete Pieces', 'Delete Pieces', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(109, 'create_notifications', 'Create Notifications', 'Create Notifications', '2021-03-12 12:40:31', '2021-03-12 12:40:31'),
(110, 'read_notifications', 'Read Notifications', 'Read Notifications', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(111, 'update_notifications', 'Update Notifications', 'Update Notifications', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(112, 'delete_notifications', 'Delete Notifications', 'Delete Notifications', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(113, 'create_ads', 'Create Ads', 'Create Ads', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(114, 'read_ads', 'Read Ads', 'Read Ads', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(115, 'update_ads', 'Update Ads', 'Update Ads', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(116, 'delete_ads', 'Delete Ads', 'Delete Ads', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(117, 'create_customers', 'Create Customers', 'Create Customers', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(118, 'read_customers', 'Read Customers', 'Read Customers', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(119, 'update_customers', 'Update Customers', 'Update Customers', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(120, 'delete_customers', 'Delete Customers', 'Delete Customers', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(121, 'create_quotes', 'Create Quotes', 'Create Quotes', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(122, 'read_quotes', 'Read Quotes', 'Read Quotes', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(123, 'update_quotes', 'Update Quotes', 'Update Quotes', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(124, 'delete_quotes', 'Delete Quotes', 'Delete Quotes', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(125, 'create_tickets', 'Create Tickets', 'Create Tickets', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(126, 'read_tickets', 'Read Tickets', 'Read Tickets', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(127, 'update_tickets', 'Update Tickets', 'Update Tickets', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(128, 'delete_tickets', 'Delete Tickets', 'Delete Tickets', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(129, 'create_subscribe', 'Create Subscribe', 'Create Subscribe', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(130, 'read_subscribe', 'Read Subscribe', 'Read Subscribe', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(131, 'update_subscribe', 'Update Subscribe', 'Update Subscribe', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(132, 'delete_subscribe', 'Delete Subscribe', 'Delete Subscribe', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(133, 'create_pages', 'Create Pages', 'Create Pages', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(134, 'read_pages', 'Read Pages', 'Read Pages', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(135, 'update_pages', 'Update Pages', 'Update Pages', '2021-03-12 12:40:32', '2021-03-12 12:40:32'),
(136, 'delete_pages', 'Delete Pages', 'Delete Pages', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(137, 'create_promocodes', 'Create Promocodes', 'Create Promocodes', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(138, 'read_promocodes', 'Read Promocodes', 'Read Promocodes', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(139, 'update_promocodes', 'Update Promocodes', 'Update Promocodes', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(140, 'delete_promocodes', 'Delete Promocodes', 'Delete Promocodes', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(141, 'create_brands', 'Create Brands', 'Create Brands', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(142, 'read_brands', 'Read Brands', 'Read Brands', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(143, 'update_brands', 'Update Brands', 'Update Brands', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(144, 'delete_brands', 'Delete Brands', 'Delete Brands', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(145, 'create_packages', 'Create Packages', 'Create Packages', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(146, 'read_packages', 'Read Packages', 'Read Packages', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(147, 'update_packages', 'Update Packages', 'Update Packages', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(148, 'delete_packages', 'Delete Packages', 'Delete Packages', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(149, 'create_services', 'Create Services', 'Create Services', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(150, 'read_services', 'Read Services', 'Read Services', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(151, 'update_services', 'Update Services', 'Update Services', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(152, 'delete_services', 'Delete Services', 'Delete Services', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(153, 'create_plans', 'Create Plans', 'Create Plans', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(154, 'read_plans', 'Read Plans', 'Read Plans', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(155, 'update_plans', 'Update Plans', 'Update Plans', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(156, 'delete_plans', 'Delete Plans', 'Delete Plans', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(157, 'create_parteners', 'Create Parteners', 'Create Parteners', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(158, 'read_parteners', 'Read Parteners', 'Read Parteners', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(159, 'update_parteners', 'Update Parteners', 'Update Parteners', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(160, 'delete_parteners', 'Delete Parteners', 'Delete Parteners', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(161, 'create_tags', 'Create Tags', 'Create Tags', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(162, 'read_tags', 'Read Tags', 'Read Tags', '2021-03-12 12:40:33', '2021-03-12 12:40:33'),
(163, 'update_tags', 'Update Tags', 'Update Tags', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(164, 'delete_tags', 'Delete Tags', 'Delete Tags', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(165, 'create_testimonails', 'Create Testimonails', 'Create Testimonails', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(166, 'read_testimonails', 'Read Testimonails', 'Read Testimonails', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(167, 'update_testimonails', 'Update Testimonails', 'Update Testimonails', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(168, 'delete_testimonails', 'Delete Testimonails', 'Delete Testimonails', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(169, 'create_blogs', 'Create Blogs', 'Create Blogs', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(170, 'read_blogs', 'Read Blogs', 'Read Blogs', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(171, 'update_blogs', 'Update Blogs', 'Update Blogs', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(172, 'delete_blogs', 'Delete Blogs', 'Delete Blogs', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(173, 'create_abouts', 'Create Abouts', 'Create Abouts', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(174, 'read_abouts', 'Read Abouts', 'Read Abouts', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(175, 'update_abouts', 'Update Abouts', 'Update Abouts', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(176, 'delete_abouts', 'Delete Abouts', 'Delete Abouts', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(177, 'create_inbox', 'Create Inbox', 'Create Inbox', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(178, 'read_inbox', 'Read Inbox', 'Read Inbox', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(179, 'update_inbox', 'Update Inbox', 'Update Inbox', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(180, 'delete_inbox', 'Delete Inbox', 'Delete Inbox', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(181, 'create_socail', 'Create Socail', 'Create Socail', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(182, 'read_socail', 'Read Socail', 'Read Socail', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(183, 'update_socail', 'Update Socail', 'Update Socail', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(184, 'delete_socail', 'Delete Socail', 'Delete Socail', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(185, 'create_sliders', 'Create Sliders', 'Create Sliders', '2021-03-12 12:40:34', '2021-03-12 12:40:34'),
(186, 'read_sliders', 'Read Sliders', 'Read Sliders', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(187, 'update_sliders', 'Update Sliders', 'Update Sliders', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(188, 'delete_sliders', 'Delete Sliders', 'Delete Sliders', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(189, 'create_categories', 'Create Categories', 'Create Categories', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(190, 'read_categories', 'Read Categories', 'Read Categories', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(191, 'update_categories', 'Update Categories', 'Update Categories', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(192, 'delete_categories', 'Delete Categories', 'Delete Categories', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(193, 'create_products', 'Create Products', 'Create Products', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(194, 'read_products', 'Read Products', 'Read Products', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(195, 'update_products', 'Update Products', 'Update Products', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(196, 'delete_products', 'Delete Products', 'Delete Products', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(197, 'create_clients', 'Create Clients', 'Create Clients', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(198, 'read_clients', 'Read Clients', 'Read Clients', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(199, 'update_clients', 'Update Clients', 'Update Clients', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(200, 'delete_clients', 'Delete Clients', 'Delete Clients', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(201, 'create_options', 'Create Options', 'Create Options', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(202, 'read_options', 'Read Options', 'Read Options', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(203, 'update_options', 'Update Options', 'Update Options', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(204, 'delete_options', 'Delete Options', 'Delete Options', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(205, 'create_settings', 'Create Settings', 'Create Settings', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(206, 'read_settings', 'Read Settings', 'Read Settings', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(207, 'update_settings', 'Update Settings', 'Update Settings', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(208, 'delete_settings', 'Delete Settings', 'Delete Settings', '2021-03-12 12:40:35', '2021-03-12 12:40:35'),
(209, 'create_users', 'Create Users', 'Create Users', '2021-03-12 12:40:36', '2021-03-12 12:40:36'),
(210, 'read_users', 'Read Users', 'Read Users', '2021-03-12 12:40:36', '2021-03-12 12:40:36'),
(211, 'update_users', 'Update Users', 'Update Users', '2021-03-12 12:40:36', '2021-03-12 12:40:36'),
(212, 'delete_users', 'Delete Users', 'Delete Users', '2021-03-12 12:40:36', '2021-03-12 12:40:36'),
(213, 'create_roles', 'Create Roles', 'Create Roles', '2021-03-12 12:40:36', '2021-03-12 12:40:36'),
(214, 'read_roles', 'Read Roles', 'Read Roles', '2021-03-12 12:40:36', '2021-03-12 12:40:36'),
(215, 'update_roles', 'Update Roles', 'Update Roles', '2021-03-12 12:40:36', '2021-03-12 12:40:36'),
(216, 'delete_roles', 'Delete Roles', 'Delete Roles', '2021-03-12 12:40:36', '2021-03-12 12:40:36'),
(217, 'delete_breakfasts', 'delete_breakfasts', 'delete_breakfasts', '2021-03-12 21:06:36', '2021-03-12 21:06:36'),
(218, 'create_breakfasts', 'create_breakfasts', 'create_breakfasts', '2021-03-12 21:06:36', '2021-03-12 21:06:36'),
(219, 'read_breakfasts', 'read_breakfasts', 'read_breakfasts', '2021-03-12 21:06:37', '2021-03-12 21:06:37'),
(220, 'update_breakfasts', 'update_breakfasts', 'update_breakfasts', '2021-03-12 21:06:37', '2021-03-12 21:06:37');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 1),
(193, 1),
(194, 1),
(195, 1),
(196, 1),
(197, 1),
(198, 1),
(199, 1),
(200, 1),
(201, 1),
(202, 1),
(203, 1),
(204, 1),
(205, 1),
(206, 1),
(207, 1),
(208, 1),
(209, 1),
(210, 1),
(211, 1),
(212, 1),
(213, 1),
(214, 1),
(215, 1),
(216, 1),
(217, 1),
(218, 1),
(219, 1),
(220, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pieces`
--

CREATE TABLE `pieces` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piece_translations`
--

CREATE TABLE `piece_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `piece_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `home_page` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `price_egy` double(8,2) DEFAULT NULL,
  `offer_egy` double(8,2) DEFAULT NULL,
  `price_usd` double(8,2) DEFAULT NULL,
  `offer_usd` double(8,2) DEFAULT NULL,
  `time_period` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Monthly',
  `background_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#FF6515',
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plan_translations`
--

CREATE TABLE `plan_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `subCategory_id` int(10) UNSIGNED NOT NULL,
  `price` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount` double(8,2) UNSIGNED DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `stock_limit_alert` int(11) DEFAULT 0,
  `count_solid` int(11) DEFAULT 0,
  `number_views` int(11) DEFAULT 0,
  `number_clicks` int(11) DEFAULT 0,
  `provenance_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Ausralia',
  `falg` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `panSearing` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `chilies` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `frozen` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `hermonFree` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'yes',
  `roasting` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `expiration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_flag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `featured` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not_active',
  `trending` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not_active',
  `best_seller` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not_active',
  `spicail_pag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `home_page` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `background_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#e67e22',
  `measr_unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'per_unit',
  `ifram` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serve_number` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_pieces`
--

CREATE TABLE `product_pieces` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `piece_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE `product_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_translations`
--

CREATE TABLE `product_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frozenInstructions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_weights`
--

CREATE TABLE `product_weights` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `weight_id` int(10) UNSIGNED NOT NULL,
  `price` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount` double(8,2) UNSIGNED DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `status`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'active', 'is1S1O7jqR3AvFXelJB0vNtv89pq2MghBMAxqgzR.jpeg', '2021-03-26 17:15:18', '2021-03-26 17:15:18', NULL),
(4, 'active', 'P0XA3a4JO9jfYzQt3w6jw6lggv4GJWgR6irgLFlX.jpeg', '2021-03-26 17:15:50', '2021-03-26 17:15:50', NULL),
(5, 'active', '7rCVEYMs1PMIIsD1DrAFsUzC11K4JWyuVDRcEP8P.jpeg', '2021-03-26 17:16:12', '2021-03-26 17:16:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `program_translations`
--

CREATE TABLE `program_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `program_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program_translations`
--

INSERT INTO `program_translations` (`id`, `title`, `short_description`, `description`, `extra_description`, `locale`, `program_id`) VALUES
(5, 'برنامج صحتك ثروتك', NULL, 'الوصف باللغة العربيه', NULL, 'ar', 3),
(6, 'برنامج صحتك ثروتك', NULL, 'الوصف باللغة الانجليزيه', NULL, 'en', 3),
(7, 'برنامج التخسيس الاول', NULL, 'الوصف باللغة العربيه', NULL, 'ar', 4),
(8, 'برنامج التخسيس الاول', NULL, 'الوصف باللغة الانجليزيه', NULL, 'en', 4),
(9, 'برنامج التخسيس القاسي', NULL, 'الوصف باللغة العربيه', NULL, 'ar', 5),
(10, 'برنامج التخسيس القاسي', NULL, '2 العنوان باللغة الانجليزيه', NULL, 'en', 5);

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `used` int(11) NOT NULL DEFAULT 0,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promo_codes`
--

INSERT INTO `promo_codes` (`id`, `status`, `code`, `startDate`, `endDate`, `startTime`, `endTime`, `limit`, `used`, `type`, `discount_amount`, `created_at`, `updated_at`) VALUES
(4, 'active', 'First20', '2021-03-26', '2021-04-10', NULL, NULL, NULL, 0, 'percent', 21, '2021-03-26 16:51:42', '2021-03-26 16:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `promo_code_translations`
--

CREATE TABLE `promo_code_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `promo_code_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promo_code_translations`
--

INSERT INTO `promo_code_translations` (`id`, `promo_code_id`, `title`, `short_description`, `description`, `extra_description`, `locale`) VALUES
(7, 4, 'BjjBnXqSJn', NULL, 'sFSpyfG5Va', NULL, 'ar'),
(8, 4, 'ceDdvgkW7F', NULL, 'twftp12DcZ', NULL, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `provenances`
--

CREATE TABLE `provenances` (
  `id` int(10) UNSIGNED NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provenance_translations`
--

CREATE TABLE `provenance_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `provenance_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialization` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'notactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `rate` int(11) NOT NULL DEFAULT 0,
  `feedback` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not_active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'Super Admin', 'Super Admin', '2021-03-12 12:40:26', '2021-03-12 12:40:26'),
(2, 'admin', 'Admin', 'Admin', '2021-03-12 12:40:46', '2021-03-12 12:40:46');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\User');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `home_page` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `status`, `home_page`, `image`, `icon`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:47', '2021-03-12 12:40:47', NULL),
(2, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:48', '2021-03-12 12:40:48', NULL),
(3, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:49', '2021-03-12 12:40:49', NULL),
(4, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:50', '2021-03-12 12:40:50', NULL),
(5, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:50', '2021-03-12 12:40:50', NULL),
(6, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:51', '2021-03-12 12:40:51', NULL),
(7, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:51', '2021-03-12 12:40:51', NULL),
(8, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:52', '2021-03-12 12:40:52', NULL),
(9, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:52', '2021-03-12 12:40:52', NULL),
(10, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:52', '2021-03-12 12:40:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `section_translations`
--

CREATE TABLE `section_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_translations`
--

INSERT INTO `section_translations` (`id`, `section_id`, `title`, `short_description`, `description`, `seo_key`, `seo_description`, `locale`) VALUES
(1, 1, 'عنوان  السكشن 1', 'وصف قصير 1', 'وصف  السكشن 1', NULL, NULL, 'ar'),
(2, 1, 'title  1', 'short_description1', 'description1', NULL, NULL, 'en'),
(3, 2, 'عنوان  السكشن 2', 'وصف قصير 2', 'وصف  السكشن 2', NULL, NULL, 'ar'),
(4, 2, 'title  2', 'short_description2', 'description2', NULL, NULL, 'en'),
(5, 3, 'عنوان  السكشن 3', 'وصف قصير 3', 'وصف  السكشن 3', NULL, NULL, 'ar'),
(6, 3, 'title  3', 'short_description3', 'description3', NULL, NULL, 'en'),
(7, 4, 'عنوان  السكشن 4', 'وصف قصير 4', 'وصف  السكشن 4', NULL, NULL, 'ar'),
(8, 4, 'title  4', 'short_description4', 'description4', NULL, NULL, 'en'),
(9, 5, 'عنوان  السكشن 5', 'وصف قصير 5', 'وصف  السكشن 5', NULL, NULL, 'ar'),
(10, 5, 'title  5', 'short_description5', 'description5', NULL, NULL, 'en'),
(11, 6, 'عنوان  السكشن 6', 'وصف قصير 6', 'وصف  السكشن 6', NULL, NULL, 'ar'),
(12, 6, 'title  6', 'short_description6', 'description6', NULL, NULL, 'en'),
(13, 7, 'عنوان  السكشن 7', 'وصف قصير 7', 'وصف  السكشن 7', NULL, NULL, 'ar'),
(14, 7, 'title  7', 'short_description7', 'description7', NULL, NULL, 'en'),
(15, 8, 'عنوان  السكشن 8', 'وصف قصير 8', 'وصف  السكشن 8', NULL, NULL, 'ar'),
(16, 8, 'title  8', 'short_description8', 'description8', NULL, NULL, 'en'),
(17, 9, 'عنوان  السكشن 9', 'وصف قصير 9', 'وصف  السكشن 9', NULL, NULL, 'ar'),
(18, 9, 'title  9', 'short_description9', 'description9', NULL, NULL, 'en'),
(19, 10, 'عنوان  السكشن 10', 'وصف قصير 10', 'وصف  السكشن 10', NULL, NULL, 'ar'),
(20, 10, 'title  10', 'short_description10', 'description10', NULL, NULL, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `home_page` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_translations`
--

CREATE TABLE `service_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `footer_logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `num1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_download` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_youtube` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_google_analatic` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_messanger` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo`, `icon`, `footer_logo`, `num1`, `num2`, `email`, `num3`, `link_download`, `link_youtube`, `map`, `seo_google_analatic`, `facebook_messanger`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'default.png', 'default.png', 'default.png', '97755972', NULL, 'info@domain.com', NULL, NULL, NULL, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d7286615.899145397!2d30.8768375!3d26.906099949999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2seg!4v1601994116144!5m2!1sen!2seg\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\" aria-hidden=\"false\" tabindex=\"0\"></iframe>', 'https://www.google.com/maps', NULL, '2021-03-12 12:40:53', '2021-03-17 16:53:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `setting_translations`
--

CREATE TABLE `setting_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `setting_id` int(10) UNSIGNED NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_hours` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_des` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting_translations`
--

INSERT INTO `setting_translations` (`id`, `setting_id`, `address`, `working_hours`, `title`, `seo_title`, `seo_key`, `seo_des`, `locale`, `created_at`, `updated_at`) VALUES
(1, 1, 'address ar', NULL, 'title ar', 'seo_title ar', 'seo_key ar', 'seo_des ar', 'ar', NULL, NULL),
(2, 1, 'address en', NULL, 'title en', 'seo_title en', 'seo_key en', 'seo_des en', 'en', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slider_translations`
--

CREATE TABLE `slider_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `slider_id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `snacks`
--

CREATE TABLE `snacks` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `snacks`
--

INSERT INTO `snacks` (`id`, `status`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'active', 'pvNPrMBDtEyiNH6yhG30pp6vNVIfqqNsGV1Lupzv.jpeg', '2021-03-26 16:53:58', '2021-03-26 16:53:58', NULL),
(3, 'active', '51u3mCX7Ks0dlHdFcXpnNfyNd3vxJtTx9CQnr9Qa.jpeg', '2021-03-26 16:55:11', '2021-03-26 16:55:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `snack_translations`
--

CREATE TABLE `snack_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `snack_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `snack_translations`
--

INSERT INTO `snack_translations` (`id`, `title`, `short_description`, `description`, `extra_description`, `locale`, `snack_id`) VALUES
(3, 'مكسرات', NULL, 'وصف المكسرات', NULL, 'ar', 2),
(4, 'مكسرات', NULL, 'وصف المكسرات', NULL, 'en', 2),
(5, 'قطعة كيك', NULL, 'الوصف باللغة العربيه', NULL, 'ar', 3),
(6, 'قطعة كيك', NULL, 'الوصف باللغة الانجليزيه', NULL, 'en', 3);

-- --------------------------------------------------------

--
-- Table structure for table `socail_media`
--

CREATE TABLE `socail_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socail_media`
--

INSERT INTO `socail_media` (`id`, `name`, `link`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'facebook', '#', 'fab fa-facebook-f', '2021-03-12 12:40:46', '2021-03-12 12:40:46'),
(2, 'twitter', '#', 'fab fa-twitter', '2021-03-12 12:40:46', '2021-03-12 12:40:46'),
(3, 'instagram', '#', 'fab fa-instagram', '2021-03-12 12:40:46', '2021-03-12 12:40:46'),
(4, 'snapchat', '#', 'fab fa-snapchat', '2021-03-12 12:40:46', '2021-03-12 12:40:46'),
(5, 'linkedin', '#', 'fab fa-linkedin-in', '2021-03-12 12:40:46', '2021-03-12 12:40:46'),
(6, 'youtube', '#', 'fab fa-youtube', '2021-03-12 12:40:46', '2021-03-12 12:40:46'),
(7, 'google', '#', 'fab  fa-google-plus-g', '2021-03-12 12:40:46', '2021-03-12 12:40:46');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `price` double DEFAULT 0,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `city_id`, `price`, `status`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 0, 'active', 'default.png', '2021-03-18 15:04:27', '2021-03-26 16:48:58', NULL),
(2, 1, NULL, 'active', 'default.png', '2021-03-26 16:50:07', '2021-03-26 16:50:07', NULL),
(3, 2, NULL, 'active', 'default.png', '2021-03-26 16:50:27', '2021-03-26 16:50:27', NULL),
(4, 1, NULL, 'active', 'default.png', '2021-03-26 16:50:38', '2021-03-26 16:50:38', NULL),
(5, 3, NULL, 'active', 'default.png', '2021-03-26 16:50:53', '2021-03-26 16:50:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `state_translations`
--

CREATE TABLE `state_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `state_translations`
--

INSERT INTO `state_translations` (`id`, `title`, `description`, `locale`, `state_id`) VALUES
(1, 'القاهرة الجديدة', NULL, 'ar', 1),
(2, 'New Cairo', NULL, 'en', 1),
(3, 'التجمع الخامس', NULL, 'ar', 2),
(4, 'Eltgamo  elkhames', NULL, 'en', 2),
(5, 'فيصل', NULL, 'ar', 3),
(6, 'fesal', NULL, 'en', 3),
(7, 'التحرير', NULL, 'ar', 4),
(8, 'Tahrer', NULL, 'en', 4),
(9, 'شط استنلي', NULL, 'ar', 5),
(10, 'Estanly', NULL, 'en', 5);

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE `subscribes` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `collection_id` int(10) UNSIGNED NOT NULL,
  `subcribe_date` date NOT NULL,
  `start_programe_date` date NOT NULL,
  `end_programe_date` date NOT NULL,
  `expired` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `choosed_meals` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `home_page` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `status`, `home_page`, `image`, `icon`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:48', '2021-03-12 12:40:48', NULL),
(2, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:48', '2021-03-12 12:40:48', NULL),
(3, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:50', '2021-03-12 12:40:50', NULL),
(4, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:50', '2021-03-12 12:40:50', NULL),
(5, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:50', '2021-03-12 12:40:50', NULL),
(6, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:51', '2021-03-12 12:40:51', NULL),
(7, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:51', '2021-03-12 12:40:51', NULL),
(8, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:52', '2021-03-12 12:40:52', NULL),
(9, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:52', '2021-03-12 12:40:52', NULL),
(10, 1, 'active', 'active', 'default.png', 'default.png', '2021-03-12 12:40:53', '2021-03-12 12:40:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_category_translations`
--

CREATE TABLE `sub_category_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `sub_category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_category_translations`
--

INSERT INTO `sub_category_translations` (`id`, `sub_category_id`, `title`, `short_description`, `description`, `seo_key`, `seo_description`, `locale`) VALUES
(1, 1, 'عنوان  الكاتيجوري 1', 'وصف قصير 1', 'وصف  الكاتيجوري 1', NULL, NULL, 'ar'),
(2, 1, 'title  1', 'short_description1', 'description1', NULL, NULL, 'en'),
(3, 2, 'عنوان  الكاتيجوري 2', 'وصف قصير 2', 'وصف  الكاتيجوري 2', NULL, NULL, 'ar'),
(4, 2, 'title  2', 'short_description2', 'description2', NULL, NULL, 'en'),
(5, 3, 'عنوان  الكاتيجوري 3', 'وصف قصير 3', 'وصف  الكاتيجوري 3', NULL, NULL, 'ar'),
(6, 3, 'title  3', 'short_description3', 'description3', NULL, NULL, 'en'),
(7, 4, 'عنوان  الكاتيجوري 4', 'وصف قصير 4', 'وصف  الكاتيجوري 4', NULL, NULL, 'ar'),
(8, 4, 'title  4', 'short_description4', 'description4', NULL, NULL, 'en'),
(9, 5, 'عنوان  الكاتيجوري 5', 'وصف قصير 5', 'وصف  الكاتيجوري 5', NULL, NULL, 'ar'),
(10, 5, 'title  5', 'short_description5', 'description5', NULL, NULL, 'en'),
(11, 6, 'عنوان  الكاتيجوري 6', 'وصف قصير 6', 'وصف  الكاتيجوري 6', NULL, NULL, 'ar'),
(12, 6, 'title  6', 'short_description6', 'description6', NULL, NULL, 'en'),
(13, 7, 'عنوان  الكاتيجوري 7', 'وصف قصير 7', 'وصف  الكاتيجوري 7', NULL, NULL, 'ar'),
(14, 7, 'title  7', 'short_description7', 'description7', NULL, NULL, 'en'),
(15, 8, 'عنوان  الكاتيجوري 8', 'وصف قصير 8', 'وصف  الكاتيجوري 8', NULL, NULL, 'ar'),
(16, 8, 'title  8', 'short_description8', 'description8', NULL, NULL, 'en'),
(17, 9, 'عنوان  الكاتيجوري 9', 'وصف قصير 9', 'وصف  الكاتيجوري 9', NULL, NULL, 'ar'),
(18, 9, 'title  9', 'short_description9', 'description9', NULL, NULL, 'en'),
(19, 10, 'عنوان  الكاتيجوري 10', 'وصف قصير 10', 'وصف  الكاتيجوري 10', NULL, NULL, 'ar'),
(20, 10, 'title  10', 'short_description10', 'description10', NULL, NULL, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, '2021-03-12 12:40:47', '2021-03-12 12:40:47'),
(2, NULL, NULL, '2021-03-12 12:40:48', '2021-03-12 12:40:48'),
(3, NULL, NULL, '2021-03-12 12:40:49', '2021-03-12 12:40:49'),
(4, NULL, NULL, '2021-03-12 12:40:50', '2021-03-12 12:40:50'),
(5, NULL, NULL, '2021-03-12 12:40:50', '2021-03-12 12:40:50'),
(6, NULL, NULL, '2021-03-12 12:40:51', '2021-03-12 12:40:51'),
(7, NULL, NULL, '2021-03-12 12:40:51', '2021-03-12 12:40:51'),
(8, NULL, NULL, '2021-03-12 12:40:51', '2021-03-12 12:40:51'),
(9, NULL, NULL, '2021-03-12 12:40:52', '2021-03-12 12:40:52'),
(10, NULL, NULL, '2021-03-12 12:40:52', '2021-03-12 12:40:52');

-- --------------------------------------------------------

--
-- Table structure for table `tag_translations`
--

CREATE TABLE `tag_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tag_translations`
--

INSERT INTO `tag_translations` (`id`, `tag_id`, `title`, `locale`) VALUES
(1, 1, 'وسم1', 'ar'),
(2, 1, 'Tag1', 'en'),
(3, 2, 'وسم2', 'ar'),
(4, 2, 'Tag2', 'en'),
(5, 3, 'وسم3', 'ar'),
(6, 3, 'Tag3', 'en'),
(7, 4, 'وسم4', 'ar'),
(8, 4, 'Tag4', 'en'),
(9, 5, 'وسم5', 'ar'),
(10, 5, 'Tag5', 'en'),
(11, 6, 'وسم6', 'ar'),
(12, 6, 'Tag6', 'en'),
(13, 7, 'وسم7', 'ar'),
(14, 7, 'Tag7', 'en'),
(15, 8, 'وسم8', 'ar'),
(16, 8, 'Tag8', 'en'),
(17, 9, 'وسم9', 'ar'),
(18, 9, 'Tag9', 'en'),
(19, 10, 'وسم10', 'ar'),
(20, 10, 'Tag10', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `testimonails`
--

CREATE TABLE `testimonails` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `home_page` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `image2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `type` int(11) NOT NULL DEFAULT 1,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonails_translations`
--

CREATE TABLE `testimonails_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `testimonails_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `section` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'technical',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Normal',
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_details`
--

CREATE TABLE `ticket_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `image`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'super', 'admin', 'super_admin@app.com', 'default.png', NULL, '$2y$10$kb3ds/hPjxUOK60SncUlCOiXhMENRiYDUoVNPT1.1FSSNRrJnA24u', 'CVBup7RmQBVbsDJNUMNDVlcHwmd664arquilvVxb3l9A14Ps7xt97vBe2PhU', '2021-03-12 12:40:46', '2021-03-12 12:40:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deviceType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebaseToken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `term_condition` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `approved` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_region` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_street` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_home_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_floor_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_appartment_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_comments_extra` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weights`
--

CREATE TABLE `weights` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weight_translations`
--

CREATE TABLE `weight_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `weight_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_translations`
--
ALTER TABLE `about_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `about_translations_about_id_locale_unique` (`about_id`,`locale`),
  ADD KEY `about_translations_locale_index` (`locale`);

--
-- Indexes for table `additions`
--
ALTER TABLE `additions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `additions_product_id_foreign` (`product_id`);

--
-- Indexes for table `addition_translations`
--
ALTER TABLE `addition_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `addition_translations_addition_id_locale_unique` (`addition_id`,`locale`),
  ADD KEY `addition_translations_locale_index` (`locale`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ad_translations`
--
ALTER TABLE `ad_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ad_translations_ad_id_locale_unique` (`ad_id`,`locale`),
  ADD KEY `ad_translations_locale_index` (`locale`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs_translations`
--
ALTER TABLE `blogs_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_translations_blogs_id_locale_unique` (`blogs_id`,`locale`),
  ADD KEY `blogs_translations_locale_index` (`locale`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `breakfasts`
--
ALTER TABLE `breakfasts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `breakfast_translations`
--
ALTER TABLE `breakfast_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `breakfast_translations_breakfast_id_locale_unique` (`breakfast_id`,`locale`),
  ADD KEY `breakfast_translations_locale_index` (`locale`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_customer_id_foreign` (`customer_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_details_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_details_addition_id_foreign` (`addition_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_section_id_foreign` (`section_id`);

--
-- Indexes for table `category_galleries`
--
ALTER TABLE `category_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_gallery_translations`
--
ALTER TABLE `category_gallery_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_gallery_translations_category_gallery_id_locale_unique` (`category_gallery_id`,`locale`),
  ADD KEY `category_gallery_translations_locale_index` (`locale`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_translations_category_id_locale_unique` (`category_id`,`locale`),
  ADD KEY `category_translations_locale_index` (`locale`);

--
-- Indexes for table `choose_meals`
--
ALTER TABLE `choose_meals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `choose_meals_customer_id_foreign` (`customer_id`),
  ADD KEY `choose_meals_subscribe_id_foreign` (`subscribe_id`),
  ADD KEY `choose_meals_breakfast_id_foreign` (`breakfast_id`),
  ADD KEY `choose_meals_dinner_id_foreign` (`dinner_id`),
  ADD KEY `choose_meals_launche_id_foreign` (`launche_id`),
  ADD KEY `choose_meals_snack_id_foreign` (`snack_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_country_id_foreign` (`country_id`);

--
-- Indexes for table `city_translations`
--
ALTER TABLE `city_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `city_translations_city_id_locale_unique` (`city_id`,`locale`),
  ADD KEY `city_translations_locale_index` (`locale`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collections_program_id_foreign` (`program_id`),
  ADD KEY `collections_day_id_foreign` (`day_id`);

--
-- Indexes for table `collection_translations`
--
ALTER TABLE `collection_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `collection_translations_collection_id_locale_unique` (`collection_id`,`locale`),
  ADD KEY `collection_translations_locale_index` (`locale`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_translations`
--
ALTER TABLE `country_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `country_translations_country_id_locale_unique` (`country_id`,`locale`),
  ADD KEY `country_translations_locale_index` (`locale`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_phone_unique` (`phone`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dinners`
--
ALTER TABLE `dinners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dinner_translations`
--
ALTER TABLE `dinner_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dinner_translations_dinner_id_locale_unique` (`dinner_id`,`locale`),
  ADD KEY `dinner_translations_locale_index` (`locale`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_category_gallery_id_foreign` (`category_gallery_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_product_id_foreign` (`product_id`);

--
-- Indexes for table `image_services`
--
ALTER TABLE `image_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image_services_service_id_foreign` (`service_id`);

--
-- Indexes for table `inboxes`
--
ALTER TABLE `inboxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instructions`
--
ALTER TABLE `instructions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instructions_product_id_foreign` (`product_id`);

--
-- Indexes for table `instruction_translations`
--
ALTER TABLE `instruction_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `instruction_translations_instruction_id_locale_unique` (`instruction_id`,`locale`),
  ADD KEY `instruction_translations_locale_index` (`locale`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_order_id_foreign` (`order_id`),
  ADD KEY `invoices_package_id_foreign` (`package_id`),
  ADD KEY `invoices_service_id_foreign` (`service_id`),
  ADD KEY `invoices_product_id_foreign` (`product_id`),
  ADD KEY `invoices_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `launches`
--
ALTER TABLE `launches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `launch_translations`
--
ALTER TABLE `launch_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `launch_translations_launche_id_locale_unique` (`launch_id`,`locale`),
  ADD KEY `launch_translations_locale_index` (`locale`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_customer_id_foreign` (`customer_id`);

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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `order_additions`
--
ALTER TABLE `order_additions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_additions_order_id_foreign` (`order_id`),
  ADD KEY `order_additions_addition_id_foreign` (`addition_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_translations`
--
ALTER TABLE `package_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `package_translations_package_id_locale_unique` (`package_id`,`locale`),
  ADD KEY `package_translations_locale_index` (`locale`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_translations_page_id_locale_unique` (`page_id`,`locale`),
  ADD KEY `page_translations_locale_index` (`locale`);

--
-- Indexes for table `parteners`
--
ALTER TABLE `parteners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parteners_translations`
--
ALTER TABLE `parteners_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parteners_translations_parteners_id_locale_unique` (`parteners_id`,`locale`),
  ADD KEY `parteners_translations_locale_index` (`locale`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `pieces`
--
ALTER TABLE `pieces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pieces_category_id_foreign` (`category_id`);

--
-- Indexes for table `piece_translations`
--
ALTER TABLE `piece_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `piece_translations_piece_id_locale_unique` (`piece_id`,`locale`),
  ADD KEY `piece_translations_locale_index` (`locale`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plans_service_id_foreign` (`service_id`);

--
-- Indexes for table `plan_translations`
--
ALTER TABLE `plan_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plan_translations_plan_id_locale_unique` (`plan_id`,`locale`),
  ADD KEY `plan_translations_locale_index` (`locale`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_section_id_foreign` (`section_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_subcategory_id_foreign` (`subCategory_id`);

--
-- Indexes for table `product_pieces`
--
ALTER TABLE `product_pieces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_pieces_product_id_foreign` (`product_id`),
  ADD KEY `product_pieces_piece_id_foreign` (`piece_id`);

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_tags_tag_id_foreign` (`tag_id`),
  ADD KEY `product_tags_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_translations_product_id_locale_unique` (`product_id`,`locale`),
  ADD KEY `product_translations_locale_index` (`locale`);

--
-- Indexes for table `product_weights`
--
ALTER TABLE `product_weights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_weights_product_id_foreign` (`product_id`),
  ADD KEY `product_weights_weight_id_foreign` (`weight_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_translations`
--
ALTER TABLE `program_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `program_translations_program_id_locale_unique` (`program_id`,`locale`),
  ADD KEY `program_translations_locale_index` (`locale`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `promo_codes_code_unique` (`code`);

--
-- Indexes for table `promo_code_translations`
--
ALTER TABLE `promo_code_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `promo_code_translations_promo_code_id_locale_unique` (`promo_code_id`,`locale`),
  ADD KEY `promo_code_translations_locale_index` (`locale`);

--
-- Indexes for table `provenances`
--
ALTER TABLE `provenances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provenance_translations`
--
ALTER TABLE `provenance_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `provenance_translations_provenance_id_locale_unique` (`provenance_id`,`locale`),
  ADD KEY `provenance_translations_locale_index` (`locale`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rates_product_id_foreign` (`product_id`),
  ADD KEY `rates_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_translations`
--
ALTER TABLE `section_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `section_translations_section_id_locale_unique` (`section_id`,`locale`),
  ADD KEY `section_translations_locale_index` (`locale`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_translations`
--
ALTER TABLE `service_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_translations_service_id_locale_unique` (`service_id`,`locale`),
  ADD KEY `service_translations_locale_index` (`locale`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting_translations`
--
ALTER TABLE `setting_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_translations_setting_id_locale_unique` (`setting_id`,`locale`),
  ADD KEY `setting_translations_locale_index` (`locale`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider_translations`
--
ALTER TABLE `slider_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slider_translations_slider_id_locale_unique` (`slider_id`,`locale`),
  ADD KEY `slider_translations_locale_index` (`locale`);

--
-- Indexes for table `snacks`
--
ALTER TABLE `snacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `snack_translations`
--
ALTER TABLE `snack_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `snack_translations_snack_id_locale_unique` (`snack_id`,`locale`),
  ADD KEY `snack_translations_locale_index` (`locale`);

--
-- Indexes for table `socail_media`
--
ALTER TABLE `socail_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_city_id_foreign` (`city_id`);

--
-- Indexes for table `state_translations`
--
ALTER TABLE `state_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `state_translations_state_id_locale_unique` (`state_id`,`locale`),
  ADD KEY `state_translations_locale_index` (`locale`);

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscribes_customer_id_foreign` (`customer_id`),
  ADD KEY `subscribes_collection_id_foreign` (`collection_id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `sub_category_translations`
--
ALTER TABLE `sub_category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sub_category_translations_sub_category_id_locale_unique` (`sub_category_id`,`locale`),
  ADD KEY `sub_category_translations_locale_index` (`locale`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_translations`
--
ALTER TABLE `tag_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag_translations_tag_id_locale_unique` (`tag_id`,`locale`),
  ADD KEY `tag_translations_locale_index` (`locale`);

--
-- Indexes for table `testimonails`
--
ALTER TABLE `testimonails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonails_translations`
--
ALTER TABLE `testimonails_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `testimonails_translations_testimonails_id_locale_unique` (`testimonails_id`,`locale`),
  ADD KEY `testimonails_translations_locale_index` (`locale`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_details_ticket_id_foreign` (`ticket_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_phone_unique` (`phone`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`);

--
-- Indexes for table `weights`
--
ALTER TABLE `weights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weight_translations`
--
ALTER TABLE `weight_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `weight_translations_weight_id_locale_unique` (`weight_id`,`locale`),
  ADD KEY `weight_translations_locale_index` (`locale`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_customer_id_foreign` (`customer_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `about_translations`
--
ALTER TABLE `about_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `additions`
--
ALTER TABLE `additions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addition_translations`
--
ALTER TABLE `addition_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ad_translations`
--
ALTER TABLE `ad_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs_translations`
--
ALTER TABLE `blogs_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `breakfasts`
--
ALTER TABLE `breakfasts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `breakfast_translations`
--
ALTER TABLE `breakfast_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_details`
--
ALTER TABLE `cart_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category_galleries`
--
ALTER TABLE `category_galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_gallery_translations`
--
ALTER TABLE `category_gallery_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `choose_meals`
--
ALTER TABLE `choose_meals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `city_translations`
--
ALTER TABLE `city_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `collection_translations`
--
ALTER TABLE `collection_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `country_translations`
--
ALTER TABLE `country_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dinners`
--
ALTER TABLE `dinners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dinner_translations`
--
ALTER TABLE `dinner_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image_services`
--
ALTER TABLE `image_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inboxes`
--
ALTER TABLE `inboxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `instructions`
--
ALTER TABLE `instructions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instruction_translations`
--
ALTER TABLE `instruction_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `launches`
--
ALTER TABLE `launches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `launch_translations`
--
ALTER TABLE `launch_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_additions`
--
ALTER TABLE `order_additions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package_translations`
--
ALTER TABLE `package_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_translations`
--
ALTER TABLE `page_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `parteners`
--
ALTER TABLE `parteners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parteners_translations`
--
ALTER TABLE `parteners_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `pieces`
--
ALTER TABLE `pieces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `piece_translations`
--
ALTER TABLE `piece_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plan_translations`
--
ALTER TABLE `plan_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_pieces`
--
ALTER TABLE `product_pieces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_translations`
--
ALTER TABLE `product_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_weights`
--
ALTER TABLE `product_weights`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `program_translations`
--
ALTER TABLE `program_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `promo_code_translations`
--
ALTER TABLE `promo_code_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `provenances`
--
ALTER TABLE `provenances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provenance_translations`
--
ALTER TABLE `provenance_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `section_translations`
--
ALTER TABLE `section_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_translations`
--
ALTER TABLE `service_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `setting_translations`
--
ALTER TABLE `setting_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slider_translations`
--
ALTER TABLE `slider_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `snacks`
--
ALTER TABLE `snacks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `snack_translations`
--
ALTER TABLE `snack_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `socail_media`
--
ALTER TABLE `socail_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `state_translations`
--
ALTER TABLE `state_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sub_category_translations`
--
ALTER TABLE `sub_category_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tag_translations`
--
ALTER TABLE `tag_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `testimonails`
--
ALTER TABLE `testimonails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonails_translations`
--
ALTER TABLE `testimonails_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_details`
--
ALTER TABLE `ticket_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weights`
--
ALTER TABLE `weights`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weight_translations`
--
ALTER TABLE `weight_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `about_translations`
--
ALTER TABLE `about_translations`
  ADD CONSTRAINT `about_translations_about_id_foreign` FOREIGN KEY (`about_id`) REFERENCES `abouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `additions`
--
ALTER TABLE `additions`
  ADD CONSTRAINT `additions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `addition_translations`
--
ALTER TABLE `addition_translations`
  ADD CONSTRAINT `addition_translations_addition_id_foreign` FOREIGN KEY (`addition_id`) REFERENCES `additions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ad_translations`
--
ALTER TABLE `ad_translations`
  ADD CONSTRAINT `ad_translations_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogs_translations`
--
ALTER TABLE `blogs_translations`
  ADD CONSTRAINT `blogs_translations_blogs_id_foreign` FOREIGN KEY (`blogs_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `breakfast_translations`
--
ALTER TABLE `breakfast_translations`
  ADD CONSTRAINT `breakfast_translations_breakfast_id_foreign` FOREIGN KEY (`breakfast_id`) REFERENCES `breakfasts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD CONSTRAINT `cart_details_addition_id_foreign` FOREIGN KEY (`addition_id`) REFERENCES `additions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_details_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_gallery_translations`
--
ALTER TABLE `category_gallery_translations`
  ADD CONSTRAINT `category_gallery_translations_category_gallery_id_foreign` FOREIGN KEY (`category_gallery_id`) REFERENCES `category_galleries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `choose_meals`
--
ALTER TABLE `choose_meals`
  ADD CONSTRAINT `choose_meals_breakfast_id_foreign` FOREIGN KEY (`breakfast_id`) REFERENCES `breakfasts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `choose_meals_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `choose_meals_dinner_id_foreign` FOREIGN KEY (`dinner_id`) REFERENCES `dinners` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `choose_meals_launche_id_foreign` FOREIGN KEY (`launche_id`) REFERENCES `launches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `choose_meals_snack_id_foreign` FOREIGN KEY (`snack_id`) REFERENCES `snacks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `choose_meals_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `city_translations`
--
ALTER TABLE `city_translations`
  ADD CONSTRAINT `city_translations_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `collections`
--
ALTER TABLE `collections`
  ADD CONSTRAINT `collections_day_id_foreign` FOREIGN KEY (`day_id`) REFERENCES `days` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `collections_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `collection_translations`
--
ALTER TABLE `collection_translations`
  ADD CONSTRAINT `collection_translations_collection_id_foreign` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `country_translations`
--
ALTER TABLE `country_translations`
  ADD CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dinner_translations`
--
ALTER TABLE `dinner_translations`
  ADD CONSTRAINT `dinner_translations_dinner_id_foreign` FOREIGN KEY (`dinner_id`) REFERENCES `dinners` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_category_gallery_id_foreign` FOREIGN KEY (`category_gallery_id`) REFERENCES `category_galleries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `image_services`
--
ALTER TABLE `image_services`
  ADD CONSTRAINT `image_services_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `instructions`
--
ALTER TABLE `instructions`
  ADD CONSTRAINT `instructions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `instruction_translations`
--
ALTER TABLE `instruction_translations`
  ADD CONSTRAINT `instruction_translations_instruction_id_foreign` FOREIGN KEY (`instruction_id`) REFERENCES `instructions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `launch_translations`
--
ALTER TABLE `launch_translations`
  ADD CONSTRAINT `launch_translations_launche_id_foreign` FOREIGN KEY (`launch_id`) REFERENCES `launches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_additions`
--
ALTER TABLE `order_additions`
  ADD CONSTRAINT `order_additions_addition_id_foreign` FOREIGN KEY (`addition_id`) REFERENCES `additions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_additions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `package_translations`
--
ALTER TABLE `package_translations`
  ADD CONSTRAINT `package_translations_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `parteners_translations`
--
ALTER TABLE `parteners_translations`
  ADD CONSTRAINT `parteners_translations_parteners_id_foreign` FOREIGN KEY (`parteners_id`) REFERENCES `parteners` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pieces`
--
ALTER TABLE `pieces`
  ADD CONSTRAINT `pieces_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `piece_translations`
--
ALTER TABLE `piece_translations`
  ADD CONSTRAINT `piece_translations_piece_id_foreign` FOREIGN KEY (`piece_id`) REFERENCES `pieces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `plans`
--
ALTER TABLE `plans`
  ADD CONSTRAINT `plans_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `plan_translations`
--
ALTER TABLE `plan_translations`
  ADD CONSTRAINT `plan_translations_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subCategory_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_pieces`
--
ALTER TABLE `product_pieces`
  ADD CONSTRAINT `product_pieces_piece_id_foreign` FOREIGN KEY (`piece_id`) REFERENCES `pieces` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_pieces_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD CONSTRAINT `product_tags_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD CONSTRAINT `product_translations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_weights`
--
ALTER TABLE `product_weights`
  ADD CONSTRAINT `product_weights_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_weights_weight_id_foreign` FOREIGN KEY (`weight_id`) REFERENCES `weights` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `program_translations`
--
ALTER TABLE `program_translations`
  ADD CONSTRAINT `program_translations_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promo_code_translations`
--
ALTER TABLE `promo_code_translations`
  ADD CONSTRAINT `promo_code_translations_promo_code_id_foreign` FOREIGN KEY (`promo_code_id`) REFERENCES `promo_codes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `provenance_translations`
--
ALTER TABLE `provenance_translations`
  ADD CONSTRAINT `provenance_translations_provenance_id_foreign` FOREIGN KEY (`provenance_id`) REFERENCES `provenances` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rates`
--
ALTER TABLE `rates`
  ADD CONSTRAINT `rates_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rates_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `section_translations`
--
ALTER TABLE `section_translations`
  ADD CONSTRAINT `section_translations_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_translations`
--
ALTER TABLE `service_translations`
  ADD CONSTRAINT `service_translations_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `setting_translations`
--
ALTER TABLE `setting_translations`
  ADD CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `slider_translations`
--
ALTER TABLE `slider_translations`
  ADD CONSTRAINT `slider_translations_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `snack_translations`
--
ALTER TABLE `snack_translations`
  ADD CONSTRAINT `snack_translations_snack_id_foreign` FOREIGN KEY (`snack_id`) REFERENCES `snacks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `state_translations`
--
ALTER TABLE `state_translations`
  ADD CONSTRAINT `state_translations_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD CONSTRAINT `subscribes_collection_id_foreign` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscribes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_category_translations`
--
ALTER TABLE `sub_category_translations`
  ADD CONSTRAINT `sub_category_translations_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tag_translations`
--
ALTER TABLE `tag_translations`
  ADD CONSTRAINT `tag_translations_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `testimonails_translations`
--
ALTER TABLE `testimonails_translations`
  ADD CONSTRAINT `testimonails_translations_testimonails_id_foreign` FOREIGN KEY (`testimonails_id`) REFERENCES `testimonails` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD CONSTRAINT `ticket_details_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `weight_translations`
--
ALTER TABLE `weight_translations`
  ADD CONSTRAINT `weight_translations_weight_id_foreign` FOREIGN KEY (`weight_id`) REFERENCES `weights` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

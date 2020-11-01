-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 01, 2020 lúc 03:54 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `d4zone`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `title` varchar(66) NOT NULL,
  `meta_title` varchar(666) DEFAULT NULL,
  `meta_description` varchar(666) DEFAULT NULL,
  `slug` varchar(66) NOT NULL,
  `summary` varchar(666) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `parent_id`, `title`, `meta_title`, `meta_description`, `slug`, `summary`, `content`, `created_at`, `updated_at`) VALUES
('113ba666-9c09-405d-a861-39be3a03cd59', 'ce78c1e3-082a-4c39-a17b-04b24f3e64a0', 'Developer', 'Developer', 'Developer', 'developer', 'Developer', 'Developer', '2020-10-25 14:25:04', '2020-10-25 14:25:04'),
('37304923-92f1-4288-83df-28ea68d4455d', NULL, 'Software', 'Software', 'Software', 'software', 'Software', 'Software', '2020-10-25 14:25:04', '2020-10-25 14:25:04'),
('5092bec8-0e4e-4526-85d3-3c32a9bf7b82', NULL, 'Books', 'Books', 'Books', 'books', 'Books', 'Books', '2020-10-25 14:25:04', '2020-10-25 14:25:04'),
('50ef080f-6115-4bfb-9c29-6fb68096a6a9', NULL, 'Hacking', 'Hacking', 'Hacking', 'hacking', 'Hacking', 'Hacking', '2020-10-25 14:25:04', '2020-10-25 14:25:04'),
('74f192d9-9645-48fa-b856-11123c255dc4', '50ef080f-6115-4bfb-9c29-6fb68096a6a9', 'Trojan horse', 'Trojan horse', 'Trojan horse', 'trojan-horse', 'Trojan horse', 'Trojan horse', '2020-10-25 14:25:04', '2020-10-25 14:25:04'),
('8ebbd28c-4b5f-4a98-8f51-23c604106d98', 'ce78c1e3-082a-4c39-a17b-04b24f3e64a0', 'Tester', 'Tester', 'Tester', 'tester', 'Tester', 'Tester', '2020-10-25 14:25:04', '2020-10-25 14:25:04'),
('b40358c4-29cd-41cc-bc34-15c1615660f1', '74f192d9-9645-48fa-b856-11123c255dc4', 'Backdoor Trojans', 'Backdoor Trojans', 'Backdoor Trojans', 'backdoor-trojans', 'Backdoor Trojans', 'Backdoor Trojans', '2020-10-25 14:25:04', '2020-10-25 14:25:04'),
('ce78c1e3-082a-4c39-a17b-04b24f3e64a0', NULL, 'Programmer', 'Programmer', 'Programmer', 'programmer', 'Programmer', 'Programmer', '2020-10-25 14:25:04', '2020-10-25 14:25:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` char(36) NOT NULL,
  `post_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `content` text NOT NULL,
  `published` tinyint(1) UNSIGNED NOT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission`
--

CREATE TABLE `permission` (
  `id` char(36) NOT NULL,
  `title` varchar(66) NOT NULL,
  `slug` varchar(66) NOT NULL,
  `description` varchar(666) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `permission`
--

INSERT INTO `permission` (`id`, `title`, `slug`, `description`, `active`, `created_at`, `updated_at`) VALUES
('777b6be8-e54b-4233-9ad0-9e2ce22056c2', 'Update', 'update', 'Update', 1, '2020-10-25 14:25:05', '2020-10-25 14:25:05'),
('93ba4606-dcf8-44b1-ace6-43a0e93f01af', 'Create', 'create', 'Create', 1, '2020-10-25 14:25:05', '2020-10-25 14:25:05'),
('9c95cc50-cdf5-4cb1-bee7-c154646b9858', 'Delete', 'delete', 'Delete', 1, '2020-10-25 14:25:05', '2020-10-25 14:25:05'),
('dc81e4ad-0678-48ab-8a72-ae946fe3299c', 'Resources', 'resources', 'Resources', 1, '2020-10-25 14:25:05', '2020-10-25 14:25:05'),
('e5c3f352-1047-4e84-ac4a-1d2c2a0d6d51', 'Read', 'read', 'Read', 1, '2020-10-25 14:25:05', '2020-10-25 14:25:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post`
--

CREATE TABLE `post` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `title` varchar(666) NOT NULL,
  `meta_title` varchar(666) NOT NULL,
  `meta_description` varchar(666) NOT NULL,
  `slug` varchar(166) NOT NULL,
  `summary` varchar(666) DEFAULT NULL,
  `image` varchar(666) DEFAULT NULL,
  `content` text NOT NULL,
  `published` tinyint(1) UNSIGNED NOT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `post`
--

INSERT INTO `post` (`id`, `user_id`, `parent_id`, `title`, `meta_title`, `meta_description`, `slug`, `summary`, `image`, `content`, `published`, `published_at`, `created_at`, `updated_at`) VALUES
('1129bf92-a4e9-4759-9754-3d2ff9ac928b', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-6', 'ReactJS-6', 'ReactJS-6 is the best', 'reactjs-6', 'ReactJS-6 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-6 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:21', '2020-10-31 03:56:21'),
('1161d1c4-9397-4488-b347-03870335912f', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-9', 'ReactJS-9', 'ReactJS-9 is the best', 'reactjs-9', 'ReactJS-9 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-9 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('11e928a4-d49d-4054-a54f-3af8444e0342', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-56', 'ReactJS-56', 'ReactJS-56 is the best', 'reactjs-56', 'ReactJS-56 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-56 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('152e1944-0cbd-4172-8551-6e8f545a3b0c', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-5', 'ReactJS-5', 'ReactJS-5 is the best', 'reactjs-5', 'ReactJS-5 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-5 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:21', '2020-10-31 03:56:21'),
('1891240e-c9cd-4e1e-9ad2-d826080e4b2e', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-40', 'ReactJS-40', 'ReactJS-40 is the best', 'reactjs-40', 'ReactJS-40 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-40 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('1a7d809e-e857-4899-ad25-ee5e8967cae9', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-62', 'ReactJS-62', 'ReactJS-62 is the best', 'reactjs-62', 'ReactJS-62 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-62 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:24', '2020-10-31 03:56:24'),
('1be97cb6-12eb-4a94-b9db-326c942b1b00', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-66', 'ReactJS-66', 'ReactJS-66 is the best', 'reactjs-66', 'ReactJS-66 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-66 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:24', '2020-10-31 03:56:24'),
('1fa2c14a-343a-48f2-9fea-95a3a7f41702', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-42', 'ReactJS-42', 'ReactJS-42 is the best', 'reactjs-42', 'ReactJS-42 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-42 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('201318c3-6a18-4fd8-980d-9400145fe24b', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-48', 'ReactJS-48', 'ReactJS-48 is the best', 'reactjs-48', 'ReactJS-48 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-48 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('264b346d-5206-4a58-bf07-cf28deff7167', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-46', 'ReactJS-46', 'ReactJS-46 is the best', 'reactjs-46', 'ReactJS-46 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-46 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('27d574ea-54b8-472a-ab85-2ebcc7eb417f', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-53', 'ReactJS-53', 'ReactJS-53 is the best', 'reactjs-53', 'ReactJS-53 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-53 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('2943efec-5e79-4cfa-a483-3e56b5849f71', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-19', 'ReactJS-19', 'ReactJS-19 is the best', 'reactjs-19', 'ReactJS-19 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-19 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('3293dcb9-6444-433f-86fa-0da16bd4d8b9', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-61', 'ReactJS-61', 'ReactJS-61 is the best', 'reactjs-61', 'ReactJS-61 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-61 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:24', '2020-10-31 03:56:24'),
('34c94542-079e-4ba4-b5ff-611b47baa82c', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-17', 'ReactJS-17', 'ReactJS-17 is the best', 'reactjs-17', 'ReactJS-17 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-17 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('3bff98d2-0f20-479b-9d1b-b1a9d04bde2f', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-34', 'ReactJS-34', 'ReactJS-34 is the best', 'reactjs-34', 'ReactJS-34 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-34 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('3da18419-de87-43c5-bd27-7c29b25ee325', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-24', 'ReactJS-24', 'ReactJS-24 is the best', 'reactjs-24', 'ReactJS-24 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-24 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('4aca6444-e26c-4ef5-ba80-c4d0e1467462', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-63', 'ReactJS-63', 'ReactJS-63 is the best', 'reactjs-63', 'ReactJS-63 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-63 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:24', '2020-10-31 03:56:24'),
('514624fc-ee2c-43a5-93d0-119cc95540ef', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-59', 'ReactJS-59', 'ReactJS-59 is the best', 'reactjs-59', 'ReactJS-59 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-59 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:24', '2020-10-31 03:56:24'),
('550983ab-6f4e-4ada-8592-ead189e23a46', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-58', 'ReactJS-58', 'ReactJS-58 is the best', 'reactjs-58', 'ReactJS-58 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-58 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:24', '2020-10-31 03:56:24'),
('55bcdf1a-0929-4670-95ed-856c38c33e73', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-7', 'ReactJS-7', 'ReactJS-7 is the best', 'reactjs-7', 'ReactJS-7 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-7 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:21', '2020-10-31 03:56:21'),
('57bcdf72-c7fc-492b-9a19-26d9351d1616', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-55', 'ReactJS-55', 'ReactJS-55 is the best', 'reactjs-55', 'ReactJS-55 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-55 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('5a7b5bda-701d-42ec-bd1b-f6fe663cf6ea', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-12', 'ReactJS-12', 'ReactJS-12 is the best', 'reactjs-12', 'ReactJS-12 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-12 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('5bc4874a-b747-4b21-9e80-8e3d8af43866', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-26', 'ReactJS-26', 'ReactJS-26 is the best', 'reactjs-26', 'ReactJS-26 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-26 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('5ce5fdd5-436c-4b9a-a775-b71cdcfebc26', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-32', 'ReactJS-32', 'ReactJS-32 is the best', 'reactjs-32', 'ReactJS-32 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-32 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('610ba4e3-733c-4c99-9cc1-3006820d5a76', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-13', 'ReactJS-13', 'ReactJS-13 is the best', 'reactjs-13', 'ReactJS-13 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-13 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('6549b1a0-2ade-407a-a56e-c54da4c06813', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-16', 'ReactJS-16', 'ReactJS-16 is the best', 'reactjs-16', 'ReactJS-16 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-16 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('66bf2cc9-6177-4ac2-bbb8-eb5348187b58', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-36', 'ReactJS-36', 'ReactJS-36 is the best', 'reactjs-36', 'ReactJS-36 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-36 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('694c0528-ab03-4afc-9534-cb0a88ae7a9c', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-44', 'ReactJS-44', 'ReactJS-44 is the best', 'reactjs-44', 'ReactJS-44 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-44 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('6dcf8e5d-a909-4f01-aa0b-47a64cc8140b', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-52', 'ReactJS-52', 'ReactJS-52 is the best', 'reactjs-52', 'ReactJS-52 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-52 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('73c85723-f98f-496b-857e-d3888f8ab0ba', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-18', 'ReactJS-18', 'ReactJS-18 is the best', 'reactjs-18', 'ReactJS-18 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-18 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('73d4068f-7829-418e-b494-fc3546443ab9', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-43', 'ReactJS-43', 'ReactJS-43 is the best', 'reactjs-43', 'ReactJS-43 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-43 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('76fb2303-7e48-4191-9e17-e973c6975652', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-57', 'ReactJS-57', 'ReactJS-57 is the best', 'reactjs-57', 'ReactJS-57 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-57 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('7861610e-8f20-4502-b1de-ffd7802660ed', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-65', 'ReactJS-65', 'ReactJS-65 is the best', 'reactjs-65', 'ReactJS-65 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-65 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:24', '2020-10-31 03:56:24'),
('79ce4cae-df7d-4ef2-ad42-00a135caa4b2', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-37', 'ReactJS-37', 'ReactJS-37 is the best', 'reactjs-37', 'ReactJS-37 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-37 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('79da2f72-39f2-4593-992e-e5f6421010a0', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-33', 'ReactJS-33', 'ReactJS-33 is the best', 'reactjs-33', 'ReactJS-33 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-33 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('828f684b-d16e-4a00-99c3-c8d0ddff7080', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-11', 'ReactJS-11', 'ReactJS-11 is the best', 'reactjs-11', 'ReactJS-11 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-11 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('8bf89c2f-024d-4fb7-a2b0-e716453a3bba', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-64', 'ReactJS-64', 'ReactJS-64 is the best', 'reactjs-64', 'ReactJS-64 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-64 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:24', '2020-10-31 03:56:24'),
('9355006f-5caa-4f09-bf63-8415b3d0ed56', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-15', 'ReactJS-15', 'ReactJS-15 is the best', 'reactjs-15', 'ReactJS-15 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-15 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('99f9f569-2448-44cf-8beb-aa88e7f86942', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-50', 'ReactJS-50', 'ReactJS-50 is the best', 'reactjs-50', 'ReactJS-50 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-50 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('9f369918-3ccd-4668-8ab4-ff5f5ae8bbb4', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-31', 'ReactJS-31', 'ReactJS-31 is the best', 'reactjs-31', 'ReactJS-31 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-31 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('a1ed018b-f0a0-4c3c-9c86-r34rae338f60', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-4', 'ReactJS-4', 'ReactJS-4 is the best', 'reactjs-4', 'ReactJS-4 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-4 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:21', '2020-10-31 03:56:21'),
('a3688413-3ba6-4c17-8b5b-fc07fede22fb', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-2', 'ReactJS-2', 'ReactJS-2 is the best', 'reactjs-2', 'ReactJS-2 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-2 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:21', '2020-10-31 03:56:21'),
('a70e1014-fb12-4f28-bb7d-586e93a2a5d1', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-28', 'ReactJS-28', 'ReactJS-28 is the best', 'reactjs-28', 'ReactJS-28 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-28 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('a832e596-fb56-4cbf-9e3d-edc2721b2e5c', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-1', 'ReactJS-1', 'ReactJS-1 is the best', 'reactjs-1', 'ReactJS-1 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-1 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:21', '2020-10-31 03:56:21'),
('adfb6eec-67d6-4d86-9d98-b54519575e61', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-38', 'ReactJS-38', 'ReactJS-38 is the best', 'reactjs-38', 'ReactJS-38 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-38 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('bb2368bf-2743-4a53-a075-f2a94678e382', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-14', 'ReactJS-14', 'ReactJS-14 is the best', 'reactjs-14', 'ReactJS-14 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-14 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('bcf12657-a16e-4f63-a7c5-d2662ce983f2', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-41', 'ReactJS-41', 'ReactJS-41 is the best', 'reactjs-41', 'ReactJS-41 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-41 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('c024bfc6-f2e2-4ec3-b0e2-122810c279e4', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-39', 'ReactJS-39', 'ReactJS-39 is the best', 'reactjs-39', 'ReactJS-39 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-39 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('c0fc6c1b-cd4e-48df-966a-00b41f89a2e4', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-47', 'ReactJS-47', 'ReactJS-47 is the best', 'reactjs-47', 'ReactJS-47 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-47 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('c213d753-693a-4cf4-a820-e503e3a36990', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-8', 'ReactJS-8', 'ReactJS-8 is the best', 'reactjs-8', 'ReactJS-8 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-8 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('c4054a5f-d3cd-48f8-b660-8d11d8b30ab4', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-20', 'ReactJS-20', 'ReactJS-20 is the best', 'reactjs-20', 'ReactJS-20 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-20 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('c97fb337-2504-4d10-89a7-a7975526cc8d', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-29', 'ReactJS-29', 'ReactJS-29 is the best', 'reactjs-29', 'ReactJS-29 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-29 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('cb79ea00-3b73-4e23-b3f1-119ab2124477', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-21', 'ReactJS-21', 'ReactJS-21 is the best', 'reactjs-21', 'ReactJS-21 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-21 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('cba2b22d-fbbe-4b9c-a085-54923f4c779a', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-49', 'ReactJS-49', 'ReactJS-49 is the best', 'reactjs-49', 'ReactJS-49 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-49 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('cd287f07-e570-4c9c-86b2-da39ee387dae', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-35', 'ReactJS-35', 'ReactJS-35 is the best', 'reactjs-35', 'ReactJS-35 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-35 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('d3ac9cf0-9c54-4b0f-8fd3-243976baa032', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-54', 'ReactJS-54', 'ReactJS-54 is the best', 'reactjs-54', 'ReactJS-54 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-54 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('d408d818-4a45-4daa-9fc7-fa6f03165a97', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-45', 'ReactJS-45', 'ReactJS-45 is the best', 'reactjs-45', 'ReactJS-45 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-45 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('d656be38-5eb3-4102-bf94-e2fe0b91244c', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-30', 'ReactJS-30', 'ReactJS-30 is the best', 'reactjs-30', 'ReactJS-30 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-30 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('d6abaac0-545d-4d89-8c18-da9b6451a145', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-51', 'ReactJS-51', 'ReactJS-51 is the best', 'reactjs-51', 'ReactJS-51 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-51 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:23', '2020-10-31 03:56:23'),
('e6a37f95-70d8-4b21-815d-4687afa7974f', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-22', 'ReactJS-22', 'ReactJS-22 is the best', 'reactjs-22', 'ReactJS-22 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-22 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('ebe71e7a-9728-4c76-87c5-f47e8e5d4407', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-23', 'ReactJS-23', 'ReactJS-23 is the best', 'reactjs-23', 'ReactJS-23 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-23 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('ed00b6c5-9221-45a7-a48e-cf73cc4d7bca', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-27', 'ReactJS-27', 'ReactJS-27 is the best', 'reactjs-27', 'ReactJS-27 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-27 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('f8887ecf-c251-4785-97f8-6290d1268fb0', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-3', 'ReactJS-3', 'ReactJS-3 is the best', 'reactjs-3', 'ReactJS-3 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-3 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:21', '2020-10-31 03:56:21'),
('f9067fef-087f-4f9a-a638-3f4552d01b48', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-25', 'ReactJS-25', 'ReactJS-25 is the best', 'reactjs-25', 'ReactJS-25 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-25 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22'),
('f9189a40-d0a1-43d9-833b-a8555ec3ca61', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-60', 'ReactJS-60', 'ReactJS-60 is the best', 'reactjs-60', 'ReactJS-60 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-60 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:24', '2020-10-31 03:56:24'),
('fd7d634d-8ad4-4e28-bfa2-3b3c83a7a7a3', '8dc535df-17e1-41a1-bb35-b96468cc5988', NULL, 'ReactJS-10', 'ReactJS-10', 'ReactJS-10 is the best', 'reactjs-10', 'ReactJS-10 is the best', '/images/react-redux.png', '<p style=\"text-align: center;\"><span style=\"background-color: #c2e0f4; color: #236fa1;\"><strong>ReactJS-10 is the best</strong></span></p>', 1, '2020-10-31 03:14:14', '2020-10-31 03:56:22', '2020-10-31 03:56:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_category`
--

CREATE TABLE `post_category` (
  `post_id` char(36) NOT NULL,
  `category_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `post_category`
--

INSERT INTO `post_category` (`post_id`, `category_id`, `created_at`, `updated_at`) VALUES
('1a7d809e-e857-4899-ad25-ee5e8967cae9', '37304923-92f1-4288-83df-28ea68d4455d', '2020-10-31 14:09:54', '2020-10-31 14:09:54'),
('6549b1a0-2ade-407a-a56e-c54da4c06813', '113ba666-9c09-405d-a861-39be3a03cd59', '2020-10-31 14:00:51', '2020-10-31 14:00:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_tag`
--

CREATE TABLE `post_tag` (
  `post_id` char(36) NOT NULL,
  `tag_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `post_tag`
--

INSERT INTO `post_tag` (`post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
('1a7d809e-e857-4899-ad25-ee5e8967cae9', 'ac8b3d4c-16cc-4df8-b4df-586d859cbf31', '2020-10-31 14:09:54', '2020-10-31 14:09:54'),
('6549b1a0-2ade-407a-a56e-c54da4c06813', 'ac8b3d4c-16cc-4df8-b4df-586d859cbf31', '2020-10-31 14:00:51', '2020-10-31 14:00:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` char(36) NOT NULL,
  `title` varchar(66) NOT NULL,
  `slug` varchar(66) NOT NULL,
  `description` varchar(666) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `title`, `slug`, `description`, `active`, `created_at`, `updated_at`) VALUES
('dfe0cb60-e0a2-49f5-afb9-28c80d36bbe9', 'Guest', 'guest', 'Guest', 1, '2020-10-25 14:25:08', '2020-10-25 14:25:08'),
('e3ef8a53-afed-4f68-a959-8a34015556af', 'Admin', 'admin', 'Admin', 1, '2020-10-25 14:25:08', '2020-10-25 14:25:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_permission`
--

CREATE TABLE `role_permission` (
  `role_id` char(36) NOT NULL,
  `permission_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `role_permission`
--

INSERT INTO `role_permission` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
('dfe0cb60-e0a2-49f5-afb9-28c80d36bbe9', 'e5c3f352-1047-4e84-ac4a-1d2c2a0d6d51', '2020-10-25 14:25:08', '2020-10-25 14:25:08'),
('e3ef8a53-afed-4f68-a959-8a34015556af', 'dc81e4ad-0678-48ab-8a72-ae946fe3299c', '2020-10-25 14:25:08', '2020-10-25 14:25:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` char(36) NOT NULL,
  `title` varchar(66) NOT NULL,
  `image` varchar(66) NOT NULL,
  `description` varchar(666) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tag`
--

CREATE TABLE `tag` (
  `id` char(36) NOT NULL,
  `title` varchar(666) NOT NULL,
  `meta_title` varchar(666) DEFAULT NULL,
  `meta_description` varchar(666) DEFAULT NULL,
  `slug` varchar(66) NOT NULL,
  `summary` varchar(666) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tag`
--

INSERT INTO `tag` (`id`, `title`, `meta_title`, `meta_description`, `slug`, `summary`, `content`, `created_at`, `updated_at`) VALUES
('07824d7a-b9e7-4c78-b2cf-256c9b08d07b', 'react', 'react', 'react', 'react', NULL, 'react', '2020-10-29 14:08:39', '2020-11-01 02:51:19'),
('3d6fa19c-67b9-46fd-bc0e-a4c1a2f00a56', 'angular', 'angular', 'angular', 'angular', NULL, 'angular', '2020-10-29 14:08:39', '2020-11-01 02:51:35'),
('79b8509e-d8e4-4df3-bb9a-cd9131840e84', 'vue', 'vue', 'vue', 'vue', NULL, 'vue', '2020-10-29 14:08:39', '2020-11-01 02:52:41'),
('8dd68850-32da-4186-87c2-379c37f0a7eb', 'redux', 'redux', 'redux', 'redux', NULL, 'redux', '2020-10-29 14:08:39', '2020-11-01 02:53:19'),
('ac8b3d4c-16cc-4df8-b4df-586d859cbf31', 'react-redux', 'react-redux', 'react-redux', 'react-redux', NULL, 'react-redux', '2020-10-30 02:30:00', '2020-11-01 02:53:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` char(36) NOT NULL,
  `role_id` char(36) NOT NULL,
  `first_name` varchar(66) NOT NULL,
  `last_name` varchar(66) NOT NULL,
  `user_name` varchar(66) NOT NULL,
  `email` varchar(66) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(666) NOT NULL,
  `remember_token` varchar(666) DEFAULT NULL,
  `auth_token` varchar(6666) DEFAULT NULL,
  `phone_number` varchar(66) DEFAULT NULL,
  `address` varchar(666) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `image` varchar(666) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `role_id`, `first_name`, `last_name`, `user_name`, `email`, `email_verified_at`, `password`, `remember_token`, `auth_token`, `phone_number`, `address`, `gender`, `image`, `created_at`, `updated_at`) VALUES
('006bc212-a69f-4556-887b-2078528b8e91', 'dfe0cb60-e0a2-49f5-afb9-28c80d36bbe9', 'Le', 'Hieu', 'Hieu123', 'Hieu@gmail.com', NULL, '$2y$10$fm5livaWpzvn8WGXkvYcouMFnMVB93O6T0f7ZKvmghSLQuurldsn2', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC80M2NhN2EzM2M0NmEubmdyb2suaW9cL2FwaVwvdXNlcnNcL2xvZ2luIiwiaWF0IjoxNjAyOTM5NjE0LCJleHAiOjE2MDI5NDMyMTQsIm5iZiI6MTYwMjkzOTYxNCwianRpIjoiTjVUVXNhSDVQRUVIV29GMiIsInN1YiI6IjAwNmJjMjEyLWE2OWYtNDU1Ni04ODdiLTIwNzg1MjhiOGU5MSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjciLCJpZCI6IjAwNmJjMjEyLWE2OWYtNDU1Ni04ODdiLTIwNzg1MjhiOGU5MSIsInVzZXJfbmFtZSI6IkhpZXUxMjMiLCJlbWFpbCI6IkhpZXVAZ21haWwuY29tIiwicm9sZSI6Imd1ZXN0In0.K9QlOtx2UmcHdYPGYZUY9pYBDfYs5B-K6kaqt6qWoRU', '840394196964', 'Tp.Hcm', 'male', 'sefaawdad', '2020-10-25 14:25:10', '2020-10-25 14:25:10'),
('3ab4fd95-2d3c-4994-81bf-29feabb76400', 'dfe0cb60-e0a2-49f5-afb9-28c80d36bbe9', 'UyenVy', 'VyVy', 'uyenvyvy', 'ggsadg@gg.com', NULL, '$2y$10$J/BsjIl5z1Ga/1bq7hYZYe8LeM.ysjTjgkPIhvfYlOeIQqz6KKly.', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6NTAwMFwvYXBpXC91c2Vyc1wvcmVnaXN0ZXIiLCJpYXQiOjE2MDI5MTczMDEsImV4cCI6MTYwMjkyMDkwMSwibmJmIjoxNjAyOTE3MzAxLCJqdGkiOiJxdkRQeWI4UmZHeUhNclczIiwic3ViIjoiM2FiNGZkOTUtMmQzYy00OTk0LTgxYmYtMjlmZWFiYjc2NDAwIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsImlkIjoiM2FiNGZkOTUtMmQzYy00OTk0LTgxYmYtMjlmZWFiYjc2NDAwIiwidXNlcl9uYW1lIjoidXllbnZ5dnkiLCJlbWFpbCI6Imdnc2FkZ0BnZy5jb20iLCJyb2xlIjoiZ3Vlc3QifQ.0RJkNKd-9AHxoYk51mttW3hnCRmEFbghxSlDTgP6clg', '840056060032', 'New York City, WashingTon DC', 'female', NULL, '2020-10-25 14:25:10', '2020-10-25 14:25:10'),
('539dffb0-cc40-473f-98be-4d077d01d1aa', 'dfe0cb60-e0a2-49f5-afb9-28c80d36bbe9', 'sadasdsad', 'sadasd', 'uyenvyvyd', 'nhtansadonymous@gmail.com', NULL, '$2y$10$o03rbW.ncpW6aQ1mOL1.Eugt3JoTr210suD4gDAR7om5C043gA64O', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6NTAwMFwvYXBpXC91c2Vyc1wvcmVnaXN0ZXIiLCJpYXQiOjE2MDI5MTgxNDcsImV4cCI6MTYwMjkyMTc0NywibmJmIjoxNjAyOTE4MTQ3LCJqdGkiOiJJTGdMMll3OXhCV0YyYnYwIiwic3ViIjoiNTM5ZGZmYjAtY2M0MC00NzNmLTk4YmUtNGQwNzdkMDFkMWFhIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsImlkIjoiNTM5ZGZmYjAtY2M0MC00NzNmLTk4YmUtNGQwNzdkMDFkMWFhIiwidXNlcl9uYW1lIjoidXllbnZ5dnlkIiwiZW1haWwiOiJuaHRhbnNhZG9ueW1vdXNAZ21haWwuY29tIiwicm9sZSI6Imd1ZXN0In0.H7w7LVwDePmx7EHyfIz4RogVY64u4VORqPqX_YPWisg', NULL, NULL, 'orther', NULL, '2020-10-25 14:25:10', '2020-10-25 14:25:10'),
('598b7099-f693-445b-97dd-df764da0cdae', 'dfe0cb60-e0a2-49f5-afb9-28c80d36bbe9', 'saddddddd', 'ddsadsad', 'sadsadkjae', 'nhtanonymsadous@gmail.com', NULL, '$2y$10$9BbFectgeAVgURTNpC23SuSILXK09lDd1TpBkbessifKoCwh1ry.m', NULL, NULL, '840225622626626', 'NewYork City', 'male', 'https://static.ghost.org/v2.0.0/images/ghost.png', '2020-10-25 14:25:10', '2020-10-25 14:25:10'),
('69869fca-4a8c-4750-a216-8f2f2f71f9bf', 'dfe0cb60-e0a2-49f5-afb9-28c80d36bbe9', 'saddddddd', 'ddsadsad', 'sadsadkjaesad', 'nhtanonymsadosadasdus@gmail.com', NULL, '$2y$10$pCDcROxJTvcwrG4/SUjimuIzaHifc.nIUPl6CyaIRO8oZODAuUbYu', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6NTAwMFwvYXBpXC91c2Vyc1wvcmVnaXN0ZXIiLCJpYXQiOjE2MDIzMTEwNDgsImV4cCI6MTYwMjMxNDY0OCwibmJmIjoxNjAyMzExMDQ4LCJqdGkiOiJXc3hCMW5HVXMwVWQ0Qk1yIiwic3ViIjoiNjk4NjlmY2EtNGE4Yy00NzUwLWEyMTYtOGYyZjJmNzFmOWJmIiwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSIsImlkIjoiNjk4NjlmY2EtNGE4Yy00NzUwLWEyMTYtOGYyZjJmNzFmOWJmIiwidXNlcl9uYW1lIjoic2Fkc2Fka2phZXNhZCIsImVtYWlsIjoibmh0YW5vbnltc2Fkb3NhZGFzZHVzQGdtYWlsLmNvbSIsInJvbGUiOiJndWVzdCJ9.IVsdy5KaomUx8VySbYMZuYg5nDIxQ0n08NhbUeLd-Ho', '840225622626626', 'NewYork City', 'male', 'https://static.ghost.org/v2.0.0/images/ghost.png', '2020-10-25 14:25:10', '2020-10-25 14:25:10'),
('7691b2b0-b4fa-41e2-ba11-a21e3f2ec966', 'dfe0cb60-e0a2-49f5-afb9-28c80d36bbe9', 'Vy', 'Lê Thị Uyên', 'uyenvy', 'uvy@gmail.com', NULL, '$2y$10$i8xJ8IWweZmn0.9aSOrDL.j2yE6nMe4MFLLw4UXx0t/vcyFC5MBbe', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6NTAwMFwvYXBpXC91c2Vyc1wvbG9naW4iLCJpYXQiOjE2MDI5MTM4MjYsImV4cCI6MTYwMjkxNzQyNiwibmJmIjoxNjAyOTEzODI2LCJqdGkiOiI2T1lEWFlNOHUxMGRHS21oIiwic3ViIjoiNzY5MWIyYjAtYjRmYS00MWUyLWJhMTEtYTIxZTNmMmVjOTY2IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsImlkIjoiNzY5MWIyYjAtYjRmYS00MWUyLWJhMTEtYTIxZTNmMmVjOTY2IiwidXNlcl9uYW1lIjoidXllbnZ5IiwiZW1haWwiOiJ1dnlAZ21haWwuY29tIiwicm9sZSI6Imd1ZXN0In0.e2qGIh8PFvBsFx09Aq4Wm1iWT61PZljztulpIVumTWI', '840935248216', 'Tay Ninh', 'female', 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg', '2020-10-25 14:25:10', '2020-10-25 14:25:10'),
('7ec5dcc6-58b4-4fe7-a703-18c85625a47a', 'dfe0cb60-e0a2-49f5-afb9-28c80d36bbe9', 'asdasda', 'sadasd', 'uyenvyvysad', 'nhtanonymasdous@gmail.com', NULL, '$2y$10$3Z8WsS4gx84l8fdP76N0rOB9miJRwNZYuc4.07Mt63BTmzlq3AlwS', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6NTAwMFwvYXBpXC91c2Vyc1wvcmVnaXN0ZXIiLCJpYXQiOjE2MDI5MTc3MTAsImV4cCI6MTYwMjkyMTMxMCwibmJmIjoxNjAyOTE3NzEwLCJqdGkiOiJ1RVFpQTRwOVJNd1JuSHpwIiwic3ViIjoiN2VjNWRjYzYtNThiNC00ZmU3LWE3MDMtMThjODU2MjVhNDdhIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsImlkIjoiN2VjNWRjYzYtNThiNC00ZmU3LWE3MDMtMThjODU2MjVhNDdhIiwidXNlcl9uYW1lIjoidXllbnZ5dnlzYWQiLCJlbWFpbCI6Im5odGFub255bWFzZG91c0BnbWFpbC5jb20iLCJyb2xlIjoiZ3Vlc3QifQ.zV8sn8pMsjYisY71s2ceaeSZhspqAkJmD2ta-9OCrGw', '84045450454543', 'sadsadsad', 'male', NULL, '2020-10-25 14:25:10', '2020-10-25 14:25:10'),
('8dc535df-17e1-41a1-bb35-b96468cc5988', 'e3ef8a53-afed-4f68-a959-8a34015556af', 'Thuc', 'Nguyen', 'de4thzone', 'd4z@d4z.com', NULL, '$2y$10$.bIzNnLcE9WeyT8Pu9s45O1VPleOjTCLGJALHH1SHotiXHw6/CUJG', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9uZ3V5ZW50aHVjb2ZmaWNpYWwuY29tXC9hcGlcL3VzZXJzXC9sb2dpbiIsImlhdCI6MTYwNDE1NjU2NCwiZXhwIjoxNjA0MTYwMTY0LCJuYmYiOjE2MDQxNTY1NjQsImp0aSI6Ilh4UWVrZWx3SG0wQWJyOU8iLCJzdWIiOiI4ZGM1MzVkZi0xN2UxLTQxYTEtYmIzNS1iOTY0NjhjYzU5ODgiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3IiwiaWQiOiI4ZGM1MzVkZi0xN2UxLTQxYTEtYmIzNS1iOTY0NjhjYzU5ODgiLCJ1c2VyX25hbWUiOiJkZTR0aHpvbmUiLCJlbWFpbCI6ImQ0ekBkNHouY29tIiwicm9sZSI6ImFkbWluIn0.t4wUzddhUCTAmwU7Bfk6_AiiPM4_-GDY-5jGVV5IhS8', '099136456666', 'New York City, WashingTon DC', '1', 'https://static.ghost.org/v2.0.0/images/ghost.png', '2020-10-25 14:25:10', '2020-10-31 15:02:44'),
('a66e9441-06bd-47da-9ace-5c534cc02889', 'dfe0cb60-e0a2-49f5-afb9-28c80d36bbe9', 'sadsad', 'sad', 'uyenvyvysadsad', 'nhtanssonymous@gmail.com', NULL, '$2y$10$NvnUIDSucaNpsf46DrorDe.mjukyNWU65Uau1hVQ/YUDzao6OZC4G', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6NTAwMFwvYXBpXC91c2Vyc1wvcmVnaXN0ZXIiLCJpYXQiOjE2MDI5MTgzODcsImV4cCI6MTYwMjkyMTk4NywibmJmIjoxNjAyOTE4Mzg3LCJqdGkiOiJDc21KQmNqMXI3TE9lU055Iiwic3ViIjoiYTY2ZTk0NDEtMDZiZC00N2RhLTlhY2UtNWM1MzRjYzAyODg5IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsImlkIjoiYTY2ZTk0NDEtMDZiZC00N2RhLTlhY2UtNWM1MzRjYzAyODg5IiwidXNlcl9uYW1lIjoidXllbnZ5dnlzYWRzYWQiLCJlbWFpbCI6Im5odGFuc3Nvbnltb3VzQGdtYWlsLmNvbSIsInJvbGUiOiJndWVzdCJ9.t0wEe29cJhgrVju4DqITGT31VWevORoiDnr3qf1diTc', NULL, NULL, 'female', 'sefaawdad', '2020-10-25 14:25:10', '2020-10-25 14:25:10'),
('da981d48-78d0-4d6e-bc38-4801a5d24961', 'dfe0cb60-e0a2-49f5-afb9-28c80d36bbe9', 'sadasd', 'sadasd', 'uyenvyvyad', 'nhtanosnysadmous@gmail.com', NULL, '$2y$10$Vk1V4.WVM2U4kiHcE/N2tegLdpQdv7lKAvort6QI9RI9VkY/yrsk6', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6NTAwMFwvYXBpXC91c2Vyc1wvcmVnaXN0ZXIiLCJpYXQiOjE2MDI5MTgyNDQsImV4cCI6MTYwMjkyMTg0NCwibmJmIjoxNjAyOTE4MjQ0LCJqdGkiOiJlZ1pSY0hQaFZaeThkRlA4Iiwic3ViIjoiZGE5ODFkNDgtNzhkMC00ZDZlLWJjMzgtNDgwMWE1ZDI0OTYxIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsImlkIjoiZGE5ODFkNDgtNzhkMC00ZDZlLWJjMzgtNDgwMWE1ZDI0OTYxIiwidXNlcl9uYW1lIjoidXllbnZ5dnlhZCIsImVtYWlsIjoibmh0YW5vc255c2FkbW91c0BnbWFpbC5jb20iLCJyb2xlIjoiZ3Vlc3QifQ.9eLJS-WP4KE42GT9f8YYBohzWra3ww8GQgw1T1NuM3o', NULL, NULL, 'male', NULL, '2020-10-25 14:25:10', '2020-10-25 14:25:10');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_category_slug` (`slug`),
  ADD KEY `idx_category_parent_id` (`parent_id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_comment_post_id` (`post_id`),
  ADD KEY `idx_comment_parent_id` (`parent_id`),
  ADD KEY `fk_comment_user` (`user_id`);

--
-- Chỉ mục cho bảng `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_permission_slug` (`slug`);

--
-- Chỉ mục cho bảng `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_post_slug` (`slug`),
  ADD KEY `idx_post_user_id` (`user_id`),
  ADD KEY `idx_post_parent_id` (`parent_id`);

--
-- Chỉ mục cho bảng `post_category`
--
ALTER TABLE `post_category`
  ADD PRIMARY KEY (`post_id`,`category_id`),
  ADD KEY `idx_p_c_post_id` (`post_id`),
  ADD KEY `idx_p_c_category_id` (`category_id`);

--
-- Chỉ mục cho bảng `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`post_id`,`tag_id`),
  ADD KEY `idx_p_t_post_id` (`post_id`),
  ADD KEY `idx_p_t_tag_id` (`tag_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_role_slug` (`slug`);

--
-- Chỉ mục cho bảng `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `idx_r_p_role_id` (`role_id`),
  ADD KEY `idx_r_p_permission_id` (`permission_id`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_tag_slug` (`slug`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_u_user_name` (`user_name`),
  ADD UNIQUE KEY `unq_u_email` (`email`),
  ADD KEY `idx_role_id` (`role_id`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `fk_category_parent` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_parent` FOREIGN KEY (`parent_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comment_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `fk_post_parent` FOREIGN KEY (`parent_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `fk_post_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `post_category`
--
ALTER TABLE `post_category`
  ADD CONSTRAINT `fk_p_c_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_p_c_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `fk_p_t_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_p_t_tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `fk_r_p_permission` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`),
  ADD CONSTRAINT `fk_r_p_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

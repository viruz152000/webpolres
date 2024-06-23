-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2024 at 01:42 PM
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
-- Database: `dj_polres`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add level model', 6, 'add_levelmodel'),
(22, 'Can change level model', 6, 'change_levelmodel'),
(23, 'Can delete level model', 6, 'delete_levelmodel'),
(24, 'Can view level model', 6, 'view_levelmodel'),
(25, 'Can add post model', 7, 'add_postmodel'),
(26, 'Can change post model', 7, 'change_postmodel'),
(27, 'Can delete post model', 7, 'delete_postmodel'),
(28, 'Can view post model', 7, 'view_postmodel'),
(29, 'Can add user', 8, 'add_customuser'),
(30, 'Can change user', 8, 'change_customuser'),
(31, 'Can delete user', 8, 'delete_customuser'),
(32, 'Can view user', 8, 'view_customuser'),
(33, 'Can add decrypt model', 9, 'add_decryptmodel'),
(34, 'Can change decrypt model', 9, 'change_decryptmodel'),
(35, 'Can delete decrypt model', 9, 'delete_decryptmodel'),
(36, 'Can view decrypt model', 9, 'view_decryptmodel'),
(37, 'Can add encrypt model', 10, 'add_encryptmodel'),
(38, 'Can change encrypt model', 10, 'change_encryptmodel'),
(39, 'Can delete encrypt model', 10, 'delete_encryptmodel'),
(40, 'Can view encrypt model', 10, 'view_encryptmodel');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(8, 'rsa', 'customuser'),
(9, 'rsa', 'decryptmodel'),
(10, 'rsa', 'encryptmodel'),
(6, 'rsa', 'levelmodel'),
(7, 'rsa', 'postmodel'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-05-31 12:17:37.048075'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-05-31 12:17:37.091529'),
(3, 'auth', '0001_initial', '2024-05-31 12:17:37.279708'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-05-31 12:17:37.323609'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-05-31 12:17:37.328612'),
(6, 'auth', '0004_alter_user_username_opts', '2024-05-31 12:17:37.333259'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-05-31 12:17:37.337289'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-05-31 12:17:37.339273'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-05-31 12:17:37.343633'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-05-31 12:17:37.347401'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-05-31 12:17:37.351817'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-05-31 12:17:37.361670'),
(13, 'auth', '0011_update_proxy_permissions', '2024-05-31 12:17:37.378102'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-05-31 12:17:37.381435'),
(15, 'rsa', '0001_initial', '2024-05-31 12:17:37.861688'),
(16, 'admin', '0001_initial', '2024-05-31 12:17:38.000385'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-05-31 12:17:38.010351'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-05-31 12:17:38.018499'),
(19, 'sessions', '0001_initial', '2024-05-31 12:17:38.046751');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0s07ksgls8jiiz6abg3p1bpzbplh3abe', '.eJxVjM0OwiAQhN-FsyH8LSkevfsMZGFXqRpISnsyvrsl6UEzt_m-mbeIuK0lbp2XOJM4Cy1Ov13C_OQ6AD2w3pvMra7LnORQ5EG7vDbi1-Vw_w4K9rKv2SVrHCYFENAx-nDLwdIErO1EDj0QO6U92qzYQ_A2-4FMArMni88X4g03bQ:1sHfRj:ANVCmuS6U_Ri27g5R2AAWgR8b-A7MDrPa208OZmG0qw', '2024-06-27 08:04:35.335811');

-- --------------------------------------------------------

--
-- Table structure for table `rsa_customuser`
--

CREATE TABLE `rsa_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `pangkat` varchar(50) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `level_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rsa_customuser`
--

INSERT INTO `rsa_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `nip`, `alamat`, `pangkat`, `jabatan`, `foto`, `level_id`, `post_id`) VALUES
(1, 'pbkdf2_sha256$720000$r9oOrOe3xuQSs2I04v6ivF$QMhOC38S40Mvn1XiDAr7CrnaTvBrKqQpuHVggU8WyY0=', '2024-06-13 08:04:35.332866', 1, 'admin5190411444', 'Rasyad', 'Reza', 'reza@gmail.com', 1, 1, '2024-05-31 12:19:41.857600', '5190411444', 'Grabag', 'AKP', 'Security Enginer', 'foto/polisi_bts.jpg', 1, 1),
(2, 'pbkdf2_sha256$720000$xFKM8Vb7dKN0p2E6jUkzBx$Hlvbg6Pz1t25FFqEYpetLTAdNIvTYGdLunC043CiuYM=', '2024-06-13 07:26:49.318712', 0, 'firman5190411333', 'Firman', '', '', 0, 1, '2024-06-06 16:42:44.270407', '5190411333', 'Rindam IV Diponegoro', 'KOMPOL', 'Kapolres', 'foto/polisi_indo.jpg', 3, 1),
(3, 'pbkdf2_sha256$720000$PcTlLJT3Ajl8kFNsLeIiwd$8902oUf0LEfxBuEaKtRplcgut9Wozo/ZyPlry/HLc0c=', '2024-06-13 08:04:23.604236', 0, 'yoga5190411555', 'Yoga', '', '', 0, 1, '2024-06-06 16:45:05.498403', '5190411555', 'Payaman', 'Briptu', 'Satlantas', 'foto/polisi_india.jpg', 3, 1),
(4, 'pbkdf2_sha256$720000$sSPcb3pCGhQMybErYuwhoz$nCpdDW1LfubUymuiCd8/JAOKWp6DuEhms0Mex4XQO4U=', NULL, 0, 'sandi5190411331', 'Sandi', '', '', 0, 1, '2024-06-13 07:25:35.894669', '5190411331', 'nanggulan', 'IPTU', 'Humas', 'foto/3cXtiCyg_400x400.jpg', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `rsa_customuser_groups`
--

CREATE TABLE `rsa_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rsa_customuser_user_permissions`
--

CREATE TABLE `rsa_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rsa_decryptmodel`
--

CREATE TABLE `rsa_decryptmodel` (
  `id` bigint(20) NOT NULL,
  `filename` varchar(256) DEFAULT NULL,
  `file` varchar(100) NOT NULL,
  `result` varchar(100) DEFAULT NULL,
  `size` varchar(256) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rsa_decryptmodel`
--

INSERT INTO `rsa_decryptmodel` (`id`, `filename`, `file`, `result`, `size`, `created`, `slug`, `user_id`) VALUES
(1, 'EKTA_BHAYANGKARI (1).enc', 'uploads/EKTA_BHAYANGKARI_1.enc', 'decrypt/EKTA_BHAYANGKARI_1-dec.pdf', '617189', '2024-05-31 12:44:46.107239', 'WAhw0b7', 1),
(2, 'Gam_PNS2019.enc', 'uploads/Gam_PNS2019.enc', 'decrypt/Gam_PNS2019-dec.pdf', '30130265', '2024-05-31 12:49:37.965244', 'ySISXkz', 1),
(3, 'ST_PANGGIL_MINGGU_1 (1).enc', 'uploads/ST_PANGGIL_MINGGU_1_1.enc', 'decrypt/ST_PANGGIL_MINGGU_1_1-dec.pdf', '331622', '2024-05-31 12:51:50.317944', 'PmIgDJX', 1),
(5, 'BRB_25001.enc', 'uploads/BRB_25001.enc', 'decrypt/BRB_25001-dec.pdf', '433732', '2024-05-31 13:08:33.327762', 'fbkyhHV', 1),
(6, 'BRB_29_A016.enc', 'uploads/BRB_29_A016.enc', 'decrypt/BRB_29_A016-dec.pdf', '453528', '2024-05-31 13:13:20.505604', 'FAlEtwr', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rsa_encryptmodel`
--

CREATE TABLE `rsa_encryptmodel` (
  `id` bigint(20) NOT NULL,
  `filename` varchar(256) DEFAULT NULL,
  `file` varchar(100) NOT NULL,
  `result` varchar(100) DEFAULT NULL,
  `size` varchar(256) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rsa_encryptmodel`
--

INSERT INTO `rsa_encryptmodel` (`id`, `filename`, `file`, `result`, `size`, `created`, `slug`, `user_id`) VALUES
(1, 'EKTA BHAYANGKARI.pdf', 'uploads/EKTA_BHAYANGKARI.pdf', 'encrypt/EKTA_BHAYANGKARI.enc', '225107', '2024-05-31 12:44:31.253858', 'wCNc89B', 1),
(2, 'Gam_PNS2019.pdf', 'uploads/Gam_PNS2019.pdf', 'encrypt/Gam_PNS2019.enc', '11596232', '2024-05-31 12:49:12.170346', 'uO9wT1P', 1),
(3, 'ST PANGGIL MINGGU 1.pdf', 'uploads/ST_PANGGIL_MINGGU_1.pdf', 'encrypt/ST_PANGGIL_MINGGU_1.enc', '135462', '2024-05-31 12:51:35.455641', 'Qha1Igb', 1),
(4, 'BRB 25001.pdf', 'uploads/BRB_25001.pdf', 'encrypt/BRB_25001.enc', '180367', '2024-05-31 13:08:15.888481', '3D8N9m7', 1),
(5, 'BRB 29 A016.pdf', 'uploads/BRB_29_A016.pdf', 'encrypt/BRB_29_A016.enc', '158917', '2024-05-31 13:13:06.931655', 'g8mJDwA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rsa_levelmodel`
--

CREATE TABLE `rsa_levelmodel` (
  `id` bigint(20) NOT NULL,
  `level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rsa_levelmodel`
--

INSERT INTO `rsa_levelmodel` (`id`, `level`) VALUES
(1, 'Administrator'),
(2, 'User'),
(3, 'Pimpinan');

-- --------------------------------------------------------

--
-- Table structure for table `rsa_postmodel`
--

CREATE TABLE `rsa_postmodel` (
  `id` bigint(20) NOT NULL,
  `post` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rsa_postmodel`
--

INSERT INTO `rsa_postmodel` (`id`, `post`, `description`) VALUES
(1, 'Polres Kota Magelang', ''),
(2, 'Polsek Magelang Tengah', ''),
(3, 'Polsek Magelang Utara', ''),
(4, 'Polsek Magelang Selatan', ''),
(5, 'Polsek Magelang Mortoyudan', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_rsa_customuser_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `rsa_customuser`
--
ALTER TABLE `rsa_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD KEY `rsa_customuser_level_id_00bd916b_fk_rsa_levelmodel_id` (`level_id`),
  ADD KEY `rsa_customuser_post_id_00121201_fk_rsa_postmodel_id` (`post_id`);

--
-- Indexes for table `rsa_customuser_groups`
--
ALTER TABLE `rsa_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rsa_customuser_groups_customuser_id_group_id_fbc9ca5e_uniq` (`customuser_id`,`group_id`),
  ADD KEY `rsa_customuser_groups_group_id_82da950a_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `rsa_customuser_user_permissions`
--
ALTER TABLE `rsa_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rsa_customuser_user_perm_customuser_id_permission_43a812e7_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `rsa_customuser_user__permission_id_94f67055_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `rsa_decryptmodel`
--
ALTER TABLE `rsa_decryptmodel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `rsa_decryptmodel_user_id_cb48b912_fk_rsa_customuser_id` (`user_id`);

--
-- Indexes for table `rsa_encryptmodel`
--
ALTER TABLE `rsa_encryptmodel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `rsa_encryptmodel_user_id_a2b61a6a_fk_rsa_customuser_id` (`user_id`);

--
-- Indexes for table `rsa_levelmodel`
--
ALTER TABLE `rsa_levelmodel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rsa_postmodel`
--
ALTER TABLE `rsa_postmodel`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `rsa_customuser`
--
ALTER TABLE `rsa_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rsa_customuser_groups`
--
ALTER TABLE `rsa_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rsa_customuser_user_permissions`
--
ALTER TABLE `rsa_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rsa_decryptmodel`
--
ALTER TABLE `rsa_decryptmodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rsa_encryptmodel`
--
ALTER TABLE `rsa_encryptmodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rsa_levelmodel`
--
ALTER TABLE `rsa_levelmodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rsa_postmodel`
--
ALTER TABLE `rsa_postmodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_rsa_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `rsa_customuser` (`id`);

--
-- Constraints for table `rsa_customuser`
--
ALTER TABLE `rsa_customuser`
  ADD CONSTRAINT `rsa_customuser_level_id_00bd916b_fk_rsa_levelmodel_id` FOREIGN KEY (`level_id`) REFERENCES `rsa_levelmodel` (`id`),
  ADD CONSTRAINT `rsa_customuser_post_id_00121201_fk_rsa_postmodel_id` FOREIGN KEY (`post_id`) REFERENCES `rsa_postmodel` (`id`);

--
-- Constraints for table `rsa_customuser_groups`
--
ALTER TABLE `rsa_customuser_groups`
  ADD CONSTRAINT `rsa_customuser_group_customuser_id_95a896fe_fk_rsa_custo` FOREIGN KEY (`customuser_id`) REFERENCES `rsa_customuser` (`id`),
  ADD CONSTRAINT `rsa_customuser_groups_group_id_82da950a_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `rsa_customuser_user_permissions`
--
ALTER TABLE `rsa_customuser_user_permissions`
  ADD CONSTRAINT `rsa_customuser_user__customuser_id_088a51a0_fk_rsa_custo` FOREIGN KEY (`customuser_id`) REFERENCES `rsa_customuser` (`id`),
  ADD CONSTRAINT `rsa_customuser_user__permission_id_94f67055_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `rsa_decryptmodel`
--
ALTER TABLE `rsa_decryptmodel`
  ADD CONSTRAINT `rsa_decryptmodel_user_id_cb48b912_fk_rsa_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `rsa_customuser` (`id`);

--
-- Constraints for table `rsa_encryptmodel`
--
ALTER TABLE `rsa_encryptmodel`
  ADD CONSTRAINT `rsa_encryptmodel_user_id_a2b61a6a_fk_rsa_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `rsa_customuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

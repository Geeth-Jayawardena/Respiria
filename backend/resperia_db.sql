-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 09, 2023 at 08:04 AM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resperia_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('037b3386ff0649940f29d08eed7326c55b7e3bfe', '2023-03-08 19:44:48.854376', 6),
('132611e1ca5d641c396e09a7630f15a0ecec6dd1', '2023-03-09 07:13:32.654206', 4),
('44fc9a49a559a4a5d42c78de11dc58b473ea92b5', '2023-03-09 06:12:19.589164', 1),
('52d6599cda324be9d7d0fea7d29033f5b5b171ae', '2023-03-09 06:10:11.154397', 5),
('9305c93f00bb524d22576554f504b6f262c36f40', '2023-03-08 19:35:31.056513', 3),
('b8c40692ca28f4058534c26741a713571a7a3d69', '2023-03-09 06:52:25.993950', 8),
('fde60df658a5b4351308d4a14b20c80b39bfdaee', '2023-03-09 06:48:38.360106', 7);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(21, 'Can add Token', 6, 'add_token'),
(22, 'Can change Token', 6, 'change_token'),
(23, 'Can delete Token', 6, 'delete_token'),
(24, 'Can view Token', 6, 'view_token'),
(25, 'Can add token', 7, 'add_tokenproxy'),
(26, 'Can change token', 7, 'change_tokenproxy'),
(27, 'Can delete token', 7, 'delete_tokenproxy'),
(28, 'Can view token', 7, 'view_tokenproxy'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add patient', 9, 'add_patient'),
(34, 'Can change patient', 9, 'change_patient'),
(35, 'Can delete patient', 9, 'delete_patient'),
(36, 'Can view patient', 9, 'view_patient'),
(37, 'Can add hospital', 10, 'add_hospital'),
(38, 'Can change hospital', 10, 'change_hospital'),
(39, 'Can delete hospital', 10, 'delete_hospital'),
(40, 'Can view hospital', 10, 'view_hospital'),
(41, 'Can add doctor', 11, 'add_doctor'),
(42, 'Can change doctor', 11, 'change_doctor'),
(43, 'Can delete doctor', 11, 'delete_doctor'),
(44, 'Can view doctor', 11, 'view_doctor'),
(45, 'Can add admin', 12, 'add_admin'),
(46, 'Can change admin', 12, 'change_admin'),
(47, 'Can delete admin', 12, 'delete_admin'),
(48, 'Can view admin', 12, 'view_admin'),
(49, 'Can add message', 13, 'add_message'),
(50, 'Can change message', 13, 'change_message'),
(51, 'Can delete message', 13, 'delete_message'),
(52, 'Can view message', 13, 'view_message');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-03-08 18:41:04.589921', '2', 'patient@user.com', 1, '[{\"added\": {}}]', 8, 1),
(2, '2023-03-08 18:41:30.668360', '2', 'patient@user.com', 3, '', 8, 1),
(3, '2023-03-08 18:42:04.187225', '3', 'patient@user.com', 1, '[{\"added\": {}}]', 8, 1),
(4, '2023-03-08 18:42:22.395399', '4', 'hospital@user.com', 1, '[{\"added\": {}}]', 8, 1),
(5, '2023-03-08 18:42:39.724476', '5', 'doctor@user.com', 1, '[{\"added\": {}}]', 8, 1),
(6, '2023-03-08 18:43:10.008962', '5', 'doctor@user.com', 2, '[{\"changed\": {\"fields\": [\"Role\", \"Name\", \"Contact number\"]}}]', 8, 1),
(7, '2023-03-08 18:43:29.554304', '4', 'hospital@user.com', 2, '[{\"changed\": {\"fields\": [\"Role\", \"Name\", \"Contact number\"]}}]', 8, 1),
(8, '2023-03-08 18:43:46.651581', '3', 'patient@user.com', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Contact number\"]}}]', 8, 1),
(9, '2023-03-08 18:44:34.135827', '1', 'Hospital object (1)', 1, '[{\"added\": {}}]', 10, 1),
(10, '2023-03-08 18:45:02.645045', '1', 'Doctor object (1)', 1, '[{\"added\": {}}]', 11, 1),
(11, '2023-03-08 18:46:21.330892', '1', 'Patient object (1)', 1, '[{\"added\": {}}]', 9, 1),
(12, '2023-03-09 06:12:15.008251', '1', 'Admin object (1)', 1, '[{\"added\": {}}]', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(6, 'authtoken', 'token'),
(7, 'authtoken', 'tokenproxy'),
(4, 'contenttypes', 'contenttype'),
(13, 'nlp_prediction', 'message'),
(5, 'sessions', 'session'),
(12, 'user', 'admin'),
(11, 'user', 'doctor'),
(10, 'user', 'hospital'),
(9, 'user', 'patient'),
(8, 'user', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-03-08 18:33:57.820365'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-03-08 18:33:57.891616'),
(3, 'auth', '0001_initial', '2023-03-08 18:33:58.039853'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-03-08 18:33:58.078903'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-03-08 18:33:58.091674'),
(6, 'auth', '0004_alter_user_username_opts', '2023-03-08 18:33:58.110372'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-03-08 18:33:58.125588'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-03-08 18:33:58.135856'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-03-08 18:33:58.157499'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-03-08 18:33:58.177041'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-03-08 18:33:58.197389'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-03-08 18:33:58.216092'),
(13, 'auth', '0011_update_proxy_permissions', '2023-03-08 18:33:58.229816'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-03-08 18:33:58.240600'),
(15, 'user', '0001_initial', '2023-03-08 18:33:58.573709'),
(16, 'admin', '0001_initial', '2023-03-08 18:33:58.648613'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-03-08 18:33:58.690730'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-08 18:33:58.721940'),
(19, 'authtoken', '0001_initial', '2023-03-08 18:33:58.785211'),
(20, 'authtoken', '0002_auto_20160226_1747', '2023-03-08 18:33:58.853117'),
(21, 'authtoken', '0003_tokenproxy', '2023-03-08 18:33:58.863827'),
(22, 'user', '0002_admin', '2023-03-08 18:33:58.931779'),
(23, 'nlp_prediction', '0001_initial', '2023-03-08 18:33:59.016539'),
(24, 'nlp_prediction', '0002_alter_message_patient', '2023-03-08 18:33:59.103256'),
(25, 'sessions', '0001_initial', '2023-03-08 18:33:59.136182'),
(26, 'user', '0003_auto_20220706_0241', '2023-03-08 18:33:59.428516'),
(27, 'user', '0004_auto_20220706_0249', '2023-03-08 18:33:59.558882'),
(28, 'user', '0005_auto_20220706_0258', '2023-03-08 18:33:59.605891'),
(29, 'user', '0006_patient_address', '2023-03-08 18:33:59.658127'),
(30, 'user', '0007_auto_20230308_1847', '2023-03-08 18:47:23.813358');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('xijo8exsej07inkfdg04l0lif9pbuyjw', '.eJxVjEEOwiAQRe_C2hAGHXBcuu8ZCAyDVA1NSrsy3l2bdKHb_977LxXiutSwdpnDmNVFgTr8binyQ9oG8j2226R5ass8Jr0peqddD1OW53V3_w5q7PVbIyVnhFmkJJ-h-MQC3hVnjEeQTIQlAwIbsoXIFz5HpKMYiycUm9T7Awa1OEk:1pZyeb:3-B_Ak8hNRWR0W1SgVq1rQ4w45Bz3Yj_gcKpnkwYUiw', '2023-03-22 18:36:45.537234');

-- --------------------------------------------------------

--
-- Table structure for table `nlp_prediction_message`
--

CREATE TABLE `nlp_prediction_message` (
  `id` int(11) NOT NULL,
  `message` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `patient_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_admin`
--

CREATE TABLE `user_admin` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_admin`
--

INSERT INTO `user_admin` (`id`, `user_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_doctor`
--

CREATE TABLE `user_doctor` (
  `id` bigint(20) NOT NULL,
  `registration_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nic` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `hospital_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_doctor`
--

INSERT INTO `user_doctor` (`id`, `registration_number`, `nic`, `user_id`, `hospital_id`) VALUES
(1, 'HYG412584', '854545454v', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_hospital`
--

CREATE TABLE `user_hospital` (
  `id` bigint(20) NOT NULL,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_hospital`
--

INSERT INTO `user_hospital` (`id`, `location`, `user_id`) VALUES
(1, 'Colombo', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_patient`
--

CREATE TABLE `user_patient` (
  `id` bigint(20) NOT NULL,
  `nic` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `doctor_id` bigint(20) DEFAULT NULL,
  `hospital_id` bigint(20) NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_patient`
--

INSERT INTO `user_patient` (`id`, `nic`, `dob`, `user_id`, `doctor_id`, `hospital_id`, `address`) VALUES
(1, '9945443434v', '1998-01-19 18:46:19.000000', 3, 1, 1, 'First Lane, Colombo.'),
(2, '8848483848v', '2003-03-19 00:00:00.000000', 6, NULL, 1, 'Second street, Colombo');

-- --------------------------------------------------------

--
-- Table structure for table `user_user`
--

CREATE TABLE `user_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_user`
--

INSERT INTO `user_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `name`, `contact_number`, `role`) VALUES
(1, 'pbkdf2_sha256$260000$3JjHGFcwKQ52xIUdxxdU9o$xlxjM2E5p2rArZtLk3qaGnsmHRXb6guKVrWhCezXwxg=', '2023-03-08 18:36:45.531995', 1, 'admin@user.com', '', '', '', 1, 1, '2023-03-08 18:35:52.121048', 'admin', '0771234567', 'ADMIN'),
(3, 'pbkdf2_sha256$260000$Xew81B24QdiBcBdZEubCe3$3RyqZGrgO/nS4aJa77iiMM0oXFEu05wNLoeMw7tpa08=', NULL, 0, 'patient@user.com', '', '', '', 0, 1, '2023-03-08 18:42:03.000000', 'Patient', '0771234567', 'PATIENT'),
(4, 'pbkdf2_sha256$260000$x3fxo3sUmuUNklX6PNlAI0$1J0BZYCzJMJIeeb7E5O70xliG9OiL90WYCXkIDFXSQw=', NULL, 0, 'hospital@user.com', '', '', '', 0, 1, '2023-03-08 18:42:21.000000', 'Hospital', '0771234567', 'HOSPITAL'),
(5, 'pbkdf2_sha256$260000$XmkLFixRlgaRjHiB1TiDdi$59piZmAYng1/gbUMQotozfqHYvHrYU+p9BCaXm9C+ps=', NULL, 0, 'doctor@user.com', '', '', '', 0, 1, '2023-03-08 18:42:39.000000', 'Doctor', '0771234567', 'DOCTOR'),
(6, 'pbkdf2_sha256$260000$MeCDSARR46baPvXRelGGpp$rX5rZUzD5pC+D+776hT8vvjL0XZDVA9jJ27+SFPCLqc=', NULL, 0, 'user@user.com', '', '', '', 0, 1, '2023-03-08 19:44:48.564778', 'user', '0771234567', 'PATIENT'),
(7, 'pbkdf2_sha256$260000$KcCJIOvtYnsCj7W77oO0lb$hO1JwRjWCpkF7g2FohCWyQq5C9LPiAkS8AFWU3d9AGQ=', NULL, 0, 'daqycumy@mailinator.com', '', '', '', 0, 1, '2023-03-09 06:48:37.600567', 'Quemby Carney', '0771234567', 'DOCTOR'),
(8, 'pbkdf2_sha256$260000$SaNBUuc7rqW0R0eAw5zyFQ$9XHhQn1RFxyeYV4COLWjiGvW5dT4cYHEqANdqvD52So=', NULL, 0, 'veqiryp@mailinator.com', '', '', '', 0, 1, '2023-03-09 06:52:25.706362', 'He', '0771234567', 'HOSPITAL');

-- --------------------------------------------------------

--
-- Table structure for table `user_user_groups`
--

CREATE TABLE `user_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_user_user_permissions`
--

CREATE TABLE `user_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

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
  ADD KEY `django_admin_log_user_id_c564eba6_fk_user_user_id` (`user_id`);

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
-- Indexes for table `nlp_prediction_message`
--
ALTER TABLE `nlp_prediction_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nlp_prediction_message_patient_id_69e151cb` (`patient_id`);

--
-- Indexes for table `user_admin`
--
ALTER TABLE `user_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `user_doctor`
--
ALTER TABLE `user_doctor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `user_doctor_hospital_id_38fa630a_fk_user_hospital_id` (`hospital_id`);

--
-- Indexes for table `user_hospital`
--
ALTER TABLE `user_hospital`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `user_patient`
--
ALTER TABLE `user_patient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `user_patient_hospital_id_3d3dd52f_fk_user_hospital_id` (`hospital_id`),
  ADD KEY `user_patient_doctor_id_3a4821df_fk_user_doctor_id` (`doctor_id`);

--
-- Indexes for table `user_user`
--
ALTER TABLE `user_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_user_groups`
--
ALTER TABLE `user_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_user_groups_user_id_group_id_bb60391f_uniq` (`user_id`,`group_id`),
  ADD KEY `user_user_groups_group_id_c57f13c0_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `user_user_user_permissions`
--
ALTER TABLE `user_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq` (`user_id`,`permission_id`),
  ADD KEY `user_user_user_permi_permission_id_ce49d4de_fk_auth_perm` (`permission_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `nlp_prediction_message`
--
ALTER TABLE `nlp_prediction_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_admin`
--
ALTER TABLE `user_admin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_doctor`
--
ALTER TABLE `user_doctor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_hospital`
--
ALTER TABLE `user_hospital`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_patient`
--
ALTER TABLE `user_patient`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_user`
--
ALTER TABLE `user_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_user_groups`
--
ALTER TABLE `user_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_user_user_permissions`
--
ALTER TABLE `user_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`);

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
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`);

--
-- Constraints for table `nlp_prediction_message`
--
ALTER TABLE `nlp_prediction_message`
  ADD CONSTRAINT `nlp_prediction_message_patient_id_69e151cb_fk_user_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `user_patient` (`id`);

--
-- Constraints for table `user_admin`
--
ALTER TABLE `user_admin`
  ADD CONSTRAINT `user_admin_user_id_38057951_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`);

--
-- Constraints for table `user_doctor`
--
ALTER TABLE `user_doctor`
  ADD CONSTRAINT `user_doctor_hospital_id_38fa630a_fk_user_hospital_id` FOREIGN KEY (`hospital_id`) REFERENCES `user_hospital` (`id`),
  ADD CONSTRAINT `user_doctor_user_id_ac818471_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`);

--
-- Constraints for table `user_hospital`
--
ALTER TABLE `user_hospital`
  ADD CONSTRAINT `user_hospital_user_id_01b0798c_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`);

--
-- Constraints for table `user_patient`
--
ALTER TABLE `user_patient`
  ADD CONSTRAINT `user_patient_doctor_id_3a4821df_fk_user_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `user_doctor` (`id`),
  ADD CONSTRAINT `user_patient_hospital_id_3d3dd52f_fk_user_hospital_id` FOREIGN KEY (`hospital_id`) REFERENCES `user_hospital` (`id`),
  ADD CONSTRAINT `user_patient_user_id_df9c78cb_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`);

--
-- Constraints for table `user_user_groups`
--
ALTER TABLE `user_user_groups`
  ADD CONSTRAINT `user_user_groups_group_id_c57f13c0_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_user_groups_user_id_13f9a20d_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`);

--
-- Constraints for table `user_user_user_permissions`
--
ALTER TABLE `user_user_user_permissions`
  ADD CONSTRAINT `user_user_user_permi_permission_id_ce49d4de_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_user_user_permissions_user_id_31782f58_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

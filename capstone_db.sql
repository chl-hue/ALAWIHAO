-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2026 at 09:33 AM
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
-- Database: `capstone_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `action_description` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `children`
--

CREATE TABLE `children` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `child_name` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `father_name` varchar(150) DEFAULT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `birth_date` date NOT NULL,
  `weight_kg` decimal(5,2) DEFAULT NULL,
  `height_cm` decimal(5,2) DEFAULT NULL,
  `weight` float NOT NULL,
  `blood_type` varchar(10) DEFAULT NULL,
  `place_of_birth` varchar(255) NOT NULL,
  `family_no` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `barangay` varchar(100) DEFAULT NULL,
  `health_center` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Pending','Approved') DEFAULT 'Pending',
  `vaccination_status` varchar(20) DEFAULT 'None',
  `vaccine_taken` text DEFAULT NULL,
  `administered_by` varchar(255) DEFAULT NULL,
  `family_serial` varchar(50) DEFAULT NULL,
  `birth_height` varchar(20) DEFAULT NULL,
  `immunization_records` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `children`
--

INSERT INTO `children` (`id`, `user_id`, `child_name`, `mother_name`, `father_name`, `gender`, `birth_date`, `weight_kg`, `height_cm`, `weight`, `blood_type`, `place_of_birth`, `family_no`, `address`, `barangay`, `health_center`, `created_at`, `status`, `vaccination_status`, `vaccine_taken`, `administered_by`, `family_serial`, `birth_height`, `immunization_records`) VALUES
(1, 2, 'jannarah abres', 'Mikaela Jay', '-', 'Female', '2026-09-09', 3.20, 45.00, 0, 'A+', 'bicol center', '123', ' purok 6 Urban Rich', 'Alawihao', 'Alawihao Health Center', '2026-09-16 16:05:44', 'Approved', 'None', 'BCG (2026-09-09)', 'bicol center', NULL, NULL, NULL),
(2, 1, 'abegail  pimentel', 'Mikaela Joy', 'cy', 'Female', '2026-09-09', 3.20, 45.00, 0, 'A+', 'bicol center', '123', ' purok 6 Urban Rich', 'Alawihao', 'Alawihao Health Center', '2026-09-21 06:56:43', 'Pending', 'None', 'BCG (2026-09-10)', 'bicol center', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `health_logs`
--

CREATE TABLE `health_logs` (
  `log_id` int(11) NOT NULL,
  `child_id` int(11) DEFAULT NULL,
  `weight_kg` decimal(5,2) DEFAULT NULL,
  `height_cm` decimal(5,2) DEFAULT NULL,
  `checkup_date` date DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `vaccine_name` varchar(100) DEFAULT 'None',
  `dose_number` varchar(20) DEFAULT 'N/A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_workers`
--

CREATE TABLE `health_workers` (
  `worker_id` int(11) NOT NULL,
  `generated_id` varchar(20) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `status` enum('pending','approved','disapproved') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `password` varchar(255) NOT NULL,
  `last_activity` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `health_workers`
--

INSERT INTO `health_workers` (`worker_id`, `generated_id`, `first_name`, `last_name`, `contact_number`, `address`, `email`, `status`, `created_at`, `password`, `last_activity`) VALUES
(1, '2026-0001', 'mikaela ', 'pimentel', '09207715121', 'alawihao', 'mikaelasalazarpimentel@gmail.com', 'approved', '2026-09-19 14:27:02', 'Welcome123', NULL),
(19, '2026-0002', 'juane', 'tamad', '09123456789', ' purok 6 Alawihao Daet', 'juane@gmail.com', 'approved', '2026-09-21 06:01:49', 'Welcome123', NULL),
(21, '2026-0003', 'juaney', 'tamad', '09123456789', ' purok 6 Alawihao Daet', 'juaney@gmail.com', 'approved', '2026-09-21 06:45:27', 'Welcome123', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `infant_records`
--

CREATE TABLE `infant_records` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `child_id` int(11) DEFAULT NULL,
  `baby_name` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `weight_kg` decimal(5,2) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `vaccine_taken` varchar(255) DEFAULT NULL,
  `vaccine_date` date DEFAULT NULL,
  `next_checkup` date DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `parent_guardian` varchar(100) NOT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `health_worker_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `administered_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `infant_records`
--

INSERT INTO `infant_records` (`id`, `user_id`, `child_id`, `baby_name`, `birth_date`, `gender`, `weight_kg`, `height`, `vaccine_taken`, `vaccine_date`, `next_checkup`, `remarks`, `parent_guardian`, `contact_number`, `address`, `health_worker_id`, `status`, `parent_id`, `created_at`, `administered_by`) VALUES
(1, NULL, NULL, 'jannah', '2026-07-17', 'Female', 0.00, NULL, NULL, NULL, NULL, NULL, 'mikaela pimentel', NULL, 'ldh', NULL, 'Pending', 2, '2026-08-16 13:05:02', NULL),
(2, NULL, NULL, 'jannarah', '2026-08-12', 'Female', 0.00, NULL, NULL, NULL, NULL, NULL, 'janner salazar', NULL, 'daet', NULL, 'Pending', 3, '2026-08-17 07:17:19', NULL),
(3, NULL, NULL, 'jannarah', '2026-08-12', 'Female', 0.00, NULL, NULL, NULL, NULL, NULL, 'janner salazar', NULL, 'daet', NULL, 'Pending', 3, '2026-08-17 08:50:58', NULL),
(4, NULL, NULL, 'mikaela pimentel', '2004-09-09', 'Female', 0.00, NULL, NULL, NULL, NULL, NULL, 'riezza rogacion', NULL, 'alawihao', NULL, 'Pending', 8, '2026-08-17 19:19:24', NULL),
(5, NULL, 63, '', '0000-00-00', 'Male', 78.00, 45.50, 'Hepatitis B Vaccine', '2026-08-18', '2026-08-27', '', '', NULL, NULL, 1, 'Pending', NULL, '2026-08-17 19:20:30', 'ela'),
(6, NULL, 0, '', '0000-00-00', 'Male', 15.00, 51.00, 'BCG Vaccine - Dose 1', '2026-09-09', '2026-09-25', '', '', NULL, NULL, 1, 'Pending', NULL, '2026-09-16 16:25:05', 'ela'),
(7, NULL, 0, '', '0000-00-00', 'Male', 15.00, 50.00, 'Hepatitis B Vaccine - Dose 1', '2026-09-17', '2026-10-02', '', '', NULL, NULL, 1, 'Pending', NULL, '2026-09-17 13:34:47', 'ela'),
(8, NULL, 0, '', '0000-00-00', 'Male', 16.00, 50.00, 'Pentavalent Vaccine (DPT-Hep B-HIB) - Dose 1', '2026-09-17', '2026-10-01', '', '', NULL, NULL, 1, 'Pending', NULL, '2026-09-17 14:23:05', 'ela'),
(9, NULL, 0, '', '0000-00-00', 'Male', 17.00, 51.00, 'Pentavalent Vaccine (DPT-Hep B-HIB) - Dose 2', '2026-09-17', '2026-10-10', '', '', NULL, NULL, 1, 'Pending', NULL, '2026-09-17 14:51:00', 'ela'),
(10, NULL, 0, '', '0000-00-00', 'Male', 18.00, 52.00, 'Pentavalent Vaccine (DPT-Hep B-HIB) - Dose 3', '2026-09-18', '2026-09-24', '', '', NULL, NULL, 1, 'Pending', NULL, '2026-09-17 16:13:47', 'ela'),
(11, NULL, 0, '', '0000-00-00', 'Male', 19.00, 53.00, 'Oral Polio Vaccine (OPV) - Dose 1', '2026-09-18', '2026-10-03', '', '', NULL, NULL, 1, 'Pending', NULL, '2026-09-17 16:55:54', 'ela');

-- --------------------------------------------------------

--
-- Table structure for table `infant_schedule`
--

CREATE TABLE `infant_schedule` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `child_name` varchar(255) DEFAULT NULL,
  `schedule_date` date NOT NULL,
  `schedule_time` time DEFAULT NULL,
  `vaccine_type` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Approved','Completed','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `infant_schedule`
--

INSERT INTO `infant_schedule` (`id`, `patient_id`, `appointment_date`, `child_name`, `schedule_date`, `schedule_time`, `vaccine_type`, `status`, `created_at`) VALUES
(1, 1, NULL, 'Baby Test', '2026-08-21', '06:10:00', 'BCG Vaccine', '', '2026-08-15 10:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `maternal_logs`
--

CREATE TABLE `maternal_logs` (
  `id` int(11) NOT NULL,
  `mother_id` int(11) DEFAULT NULL,
  `weight_kg` decimal(5,2) DEFAULT NULL,
  `blood_pressure` varchar(10) DEFAULT NULL,
  `fundal_height` decimal(5,2) DEFAULT NULL,
  `fetal_heart_tone` int(11) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `checkup_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maternal_records`
--

CREATE TABLE `maternal_records` (
  `id` int(11) NOT NULL,
  `mother_id` int(11) NOT NULL,
  `pregnancy_order` int(11) DEFAULT 1,
  `weight_kg` decimal(5,2) DEFAULT NULL,
  `bp` varchar(20) DEFAULT NULL,
  `temperature` decimal(4,2) DEFAULT NULL,
  `pulse_rate` int(11) DEFAULT NULL,
  `height_cm` decimal(5,2) DEFAULT NULL,
  `muac_cm` decimal(5,2) DEFAULT NULL,
  `bmi` decimal(4,2) DEFAULT NULL,
  `bmi_category` varchar(50) DEFAULT NULL,
  `conjunctiva` varchar(50) DEFAULT NULL,
  `neck_findings` varchar(255) DEFAULT NULL,
  `breast_findings` varchar(255) DEFAULT NULL,
  `thorax_findings` varchar(255) DEFAULT NULL,
  `abdomen_findings` varchar(255) DEFAULT NULL,
  `vaginal_exam` varchar(255) DEFAULT NULL,
  `extremities_findings` varchar(255) DEFAULT NULL,
  `fetal_heart_rate` varchar(50) DEFAULT NULL,
  `fetal_position` varchar(50) DEFAULT NULL,
  `impression_diagnosis` text DEFAULT NULL,
  `tt_status` varchar(50) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `next_visit_date` date DEFAULT NULL,
  `checkup_date` date DEFAULT NULL,
  `gestational_age_weeks` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `breast_left_size` varchar(50) DEFAULT NULL,
  `breast_right_size` varchar(50) DEFAULT NULL,
  `nutritional_status` varchar(50) DEFAULT NULL,
  `pagsusuri_kalagayan` text DEFAULT NULL,
  `mga_payo` text DEFAULT NULL,
  `birthplan_changes` text DEFAULT NULL,
  `pagsusuri_ngipin` text DEFAULT NULL,
  `lab_test_done` text DEFAULT NULL,
  `hemoglobin_count` varchar(50) DEFAULT NULL,
  `urinalysis` varchar(50) DEFAULT NULL,
  `cbc` varchar(50) DEFAULT NULL,
  `stis_approach` varchar(100) DEFAULT NULL,
  `stool_exam` varchar(50) DEFAULT NULL,
  `acetic_acid_wash` varchar(50) DEFAULT NULL,
  `tetanus_vaccine_date` date DEFAULT NULL,
  `treatments_given` text DEFAULT NULL,
  `serbisyong_binigay` text DEFAULT NULL,
  `provider_name` varchar(100) DEFAULT NULL,
  `hospital_referral` text DEFAULT NULL,
  `pap_smear_done` tinyint(1) DEFAULT 0,
  `gestational_diabetes_test` tinyint(1) DEFAULT 0,
  `blood_rh_group_done` tinyint(1) DEFAULT 0,
  `treat_deworming` tinyint(1) DEFAULT 0,
  `srv_previous_discussion` tinyint(1) DEFAULT 0,
  `srv_postpartum` tinyint(1) DEFAULT 0,
  `srv_spacing` tinyint(1) DEFAULT 0,
  `srv_tetanus_followup` tinyint(1) DEFAULT 0,
  `smoking_sticks_per_day` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maternal_records`
--

INSERT INTO `maternal_records` (`id`, `mother_id`, `pregnancy_order`, `weight_kg`, `bp`, `temperature`, `pulse_rate`, `height_cm`, `muac_cm`, `bmi`, `bmi_category`, `conjunctiva`, `neck_findings`, `breast_findings`, `thorax_findings`, `abdomen_findings`, `vaginal_exam`, `extremities_findings`, `fetal_heart_rate`, `fetal_position`, `impression_diagnosis`, `tt_status`, `remarks`, `next_visit_date`, `checkup_date`, `gestational_age_weeks`, `created_at`, `breast_left_size`, `breast_right_size`, `nutritional_status`, `pagsusuri_kalagayan`, `mga_payo`, `birthplan_changes`, `pagsusuri_ngipin`, `lab_test_done`, `hemoglobin_count`, `urinalysis`, `cbc`, `stis_approach`, `stool_exam`, `acetic_acid_wash`, `tetanus_vaccine_date`, `treatments_given`, `serbisyong_binigay`, `provider_name`, `hospital_referral`, `pap_smear_done`, `gestational_diabetes_test`, `blood_rh_group_done`, `treat_deworming`, `srv_previous_discussion`, `srv_postpartum`, `srv_spacing`, `srv_tetanus_followup`, `smoking_sticks_per_day`) VALUES
(1, 6, 1, 53.00, '120/80', NULL, NULL, 41.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-16', '2026-08-20', 3, '2026-08-16 12:35:14', NULL, NULL, 'Normal', 'blah', 'sheesh', 'whee', 'check', '', NULL, 'Done', NULL, NULL, 'Done', 'Done', '2026-07-30', '', 'Pag-iwas sa alcohol, tabacco, at illegal na droga, Pagpapayo tungkol sa tamang pagkain, Pagpapayo sa safe sex, Paggamit ng mga insecticide-treated na kulambo, Birthplan', 'cyrus kish', 'ldh', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 8, 1, 53.00, '120/80', NULL, NULL, 41.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-04', '2026-08-17', 3, '2026-08-17 01:12:03', NULL, NULL, 'Normal', 'ko', 'ki', 'we', 'ad', 'wew', '12', 'Done', NULL, NULL, 'Done', 'Done', '2026-08-01', 'Syphilis', 'Pag-iwas sa alcohol, tabacco, at illegal na droga', 'elay', '', 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `maternal_registration`
--

CREATE TABLE `maternal_registration` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `family_serial` varchar(50) DEFAULT NULL,
  `client_lname` varchar(100) NOT NULL,
  `client_fname` varchar(100) NOT NULL,
  `client_mi` varchar(5) DEFAULT NULL,
  `client_ext` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `blood_type` varchar(5) DEFAULT NULL,
  `lmp` date DEFAULT NULL,
  `highest_educ` varchar(100) DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `spouse_lname` varchar(100) DEFAULT NULL,
  `spouse_fname` varchar(100) DEFAULT NULL,
  `spouse_mi` varchar(5) DEFAULT NULL,
  `spouse_ext` varchar(10) DEFAULT NULL,
  `spouse_dob` date DEFAULT NULL,
  `spouse_blood` varchar(5) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `barangay` varchar(100) DEFAULT 'Alawihao',
  `municipality` varchar(100) DEFAULT 'Daet',
  `province` varchar(100) DEFAULT 'Camarines Norte',
  `income` varchar(50) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `phic_cat` varchar(50) DEFAULT NULL,
  `philhealth_no` varchar(50) DEFAULT NULL,
  `living_children` int(11) DEFAULT 0,
  `birth_plan` varchar(50) DEFAULT NULL,
  `num_preg` int(11) DEFAULT 0,
  `status` varchar(20) DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `birthdate` date DEFAULT NULL,
  `pregnancy_order` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maternal_registration`
--

INSERT INTO `maternal_registration` (`id`, `user_id`, `family_serial`, `client_lname`, `client_fname`, `client_mi`, `client_ext`, `dob`, `age`, `blood_type`, `lmp`, `highest_educ`, `occupation`, `spouse_lname`, `spouse_fname`, `spouse_mi`, `spouse_ext`, `spouse_dob`, `spouse_blood`, `street`, `barangay`, `municipality`, `province`, `income`, `contact`, `phic_cat`, `philhealth_no`, `living_children`, `birth_plan`, `num_preg`, `status`, `created_at`, `birthdate`, `pregnancy_order`) VALUES
(6, 3, '', 'janner', 'salazar', 's', '', '2000-10-24', 25, 'B+', '2026-06-18', 'COLLEGE', 'NONE', 'malik', 'zane', '', '', '2001-01-13', '', 'purok6', 'Alawihao', 'Daet', 'Camarines Norte', '50000', '0987654321', '12345', '6789', 0, '0', 1, 'Approved', '2026-08-16 12:23:30', NULL, 1),
(8, 5, '', 'david', 'lexy', 's', '', '2000-09-13', 25, 'B+', '2026-06-28', 'College', 'accountant', 'david', 'lorence', '', '', '2001-12-17', '', 'purok 6', 'Alawihao', 'Daet', 'Camarines Norte', '60000', '0990092739', '123', '1234', 0, '0', 0, 'Approved', '2026-08-17 00:50:11', NULL, 1),
(9, 3, '', 'salazar', 'janner ', '', '', '2000-10-24', 25, 'A+', '2026-06-10', '', '', 'ramores', 'james', '', '', '2000-11-09', '', 'purok6', 'Alawihao', 'Daet', 'Camarines Norte', '50000', '092077151215', '123', '6789', 0, '0', 0, 'Approved', '2026-08-17 05:49:14', NULL, 1),
(10, 3, '', 'salazar', 'janner', '', '', '2000-10-24', 25, 'A-', '2026-06-18', 'COLLEGE', 'NONE', 'dames', 'axle', '', '', '2000-07-18', '', 'purok6 Alawihao Daet', 'Alawihao', 'Daet', 'Camarines Norte', '50000', '13333333332', '123', '456', 0, '0', 0, 'Approved', '2026-08-17 07:04:31', NULL, 1),
(11, 7, '', 'lopez', 'gerry', 's.', '', '2004-09-09', 21, 'B-', '2026-06-18', '', '', 'lopez', 'gerry', '', '', '2004-09-09', '', 'alawihao', 'Alawihao', 'Daet', 'Camarines Norte', '60000', '092356478', '123', '1234', 0, '0', 0, 'Approved', '2026-08-17 19:08:31', NULL, 1),
(12, 7, '', 'riezza', 'che', 's', '', '2004-09-09', 22, 'A-', '2026-07-09', 'college', '', 'mikaela', 'pimentel', 's', '', '2004-09-09', '', '', 'Alawihao', 'Daet', 'Camarines Norte', '0', '', '', '', 0, '0', 0, 'Approved', '2026-09-10 21:42:32', NULL, 1),
(16, 2, '', 'joy', 'mikaela', 'm', '', '2004-09-09', 22, 'B-', '2026-03-19', 'COLLEGE', 'NONE', 'joy', 'mikaela', 'v', '', '2004-09-09', '', ' purok 6', 'Alawihao', 'Daet', 'Camarines Norte', '0', '', '', '', 0, '0', 0, 'Approved', '2026-09-13 06:03:28', NULL, 1),
(18, 1, '', 'borres', 'eyya', 's', '', '2004-08-09', 22, '', '2026-06-21', 'COLLEGE', 'NONE', 'david', 'theo', 'v', '', '2000-01-13', '', ' purok 6', 'Alawihao', 'Daet', 'Camarines Norte', '50000', '09207715124', '', '', 0, '0', 0, 'Approved', '2026-09-21 06:44:21', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `maternal_schedules`
--

CREATE TABLE `maternal_schedules` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `schedule_date` date NOT NULL,
  `schedule_time` time DEFAULT NULL,
  `purpose` varchar(255) DEFAULT 'Maternal Check-up',
  `status` enum('Pending','Approved','Completed','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `target_role` enum('User','Admin','Super Admin') NOT NULL DEFAULT 'User',
  `schedule_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` enum('new_schedule','updated_schedule','cancelled_schedule','reminder') DEFAULT 'new_schedule',
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `target_role`, `schedule_id`, `title`, `message`, `type`, `is_read`, `created_at`) VALUES
(1, 7, 'User', 5, 'Schedule Updated', 'Your schedule for prenatal checkup has been updated. New date: September 2, 2026 at 5:01 PM.', 'updated_schedule', 1, '2026-09-02 00:40:34'),
(2, 7, 'User', 5, 'Reschedule Request Rejected', 'Your reschedule request for prenatal checkup was not approved. The original schedule remains.', 'updated_schedule', 1, '2026-09-02 00:56:10'),
(3, 1, 'Super Admin', 5, 'Reschedule Request: gerry lopez', 'gerry lopez has requested to reschedule their prenatal checkup (currently on September 2, 2026) appointment. Requested: September 3, 2026 at 1:00 PM Reason: sick', 'updated_schedule', 1, '2026-09-02 01:36:43'),
(4, 5, 'Admin', 5, 'Reschedule Request: gerry lopez', 'gerry lopez has requested to reschedule their prenatal checkup (currently on September 2, 2026) appointment. Requested: September 3, 2026 at 1:00 PM Reason: sick', 'updated_schedule', 0, '2026-09-02 01:36:43'),
(5, 8, 'Admin', 5, 'Reschedule Request: gerry lopez', 'gerry lopez has requested to reschedule their prenatal checkup (currently on September 2, 2026) appointment. Requested: September 3, 2026 at 1:00 PM Reason: sick', 'updated_schedule', 0, '2026-09-02 01:36:43'),
(6, 7, 'User', 5, 'Reschedule Request Approved', 'Your reschedule request for prenatal checkup has been approved. New date: September 2, 2026 at 5:01 PM.', 'updated_schedule', 1, '2026-09-02 01:37:59'),
(7, 7, 'User', 5, 'Reschedule Request Approved', 'Your reschedule request for prenatal checkup has been approved. New date: September 2, 2026 at 5:01 PM.', 'updated_schedule', 1, '2026-09-02 01:39:02'),
(8, 1, 'Super Admin', 5, 'Reschedule Request: gerry lopez', 'gerry lopez has requested to reschedule their prenatal checkup appointment (currently on September 2, 2026). Requested date: September 3, 2026 at 8:00 AM. Reason: sick', 'updated_schedule', 1, '2026-09-02 02:26:35'),
(9, 5, 'Admin', 5, 'Reschedule Request: gerry lopez', 'gerry lopez has requested to reschedule their prenatal checkup appointment (currently on September 2, 2026). Requested date: September 3, 2026 at 8:00 AM. Reason: sick', 'updated_schedule', 0, '2026-09-02 02:26:35'),
(10, 8, 'Admin', 5, 'Reschedule Request: gerry lopez', 'gerry lopez has requested to reschedule their prenatal checkup appointment (currently on September 2, 2026). Requested date: September 3, 2026 at 8:00 AM. Reason: sick', 'updated_schedule', 0, '2026-09-02 02:26:35'),
(11, 8, 'User', 7, 'New Schedule: check up', 'You have a new schedule for mikaela pimentel — check up on September 7, 2026 at 8:00 AM.', 'new_schedule', 0, '2026-09-06 05:24:13'),
(12, 7, 'User', 3, 'Schedule Updated', 'Your schedule for prenatal checkup has been moved to September 7, 2026 at 8:00 AM.', 'updated_schedule', 1, '2026-09-06 05:25:47'),
(13, 8, 'User', 7, 'Schedule Updated', 'Your schedule for check up has been moved to September 8, 2026 at 8:00 AM.', 'updated_schedule', 0, '2026-09-06 05:28:01'),
(14, 7, 'User', 5, 'Reschedule Request Approved', 'Your reschedule request for prenatal checkup has been approved. New date: September 2, 2026 at 5:01 PM.', 'updated_schedule', 1, '2026-09-10 19:32:23'),
(15, 7, 'User', 5, 'Reschedule Request Approved', 'Your reschedule request for prenatal checkup has been approved. New date: September 2, 2026 at 5:01 PM.', 'updated_schedule', 1, '2026-09-10 20:08:48'),
(16, 7, 'User', 3, 'Schedule Updated', 'Your schedule for prenatal checkup has been moved to September 12, 2026 at 8:00 AM.', 'updated_schedule', 1, '2026-09-10 22:04:34'),
(17, 2, 'User', 7, 'New Schedule: immunization', 'You have a new schedule for jannarah abres — immunization on September 17, 2026 at 8:00 AM.', 'new_schedule', 1, '2026-09-17 17:04:06');

-- --------------------------------------------------------

--
-- Table structure for table `old_maternal_backup`
--

CREATE TABLE `old_maternal_backup` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `lmp` date DEFAULT NULL,
  `edc` date DEFAULT NULL,
  `address` text DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `blood_type` varchar(5) DEFAULT NULL,
  `allergies` text DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `old_maternal_backup`
--

INSERT INTO `old_maternal_backup` (`id`, `user_id`, `full_name`, `age`, `lmp`, `edc`, `address`, `contact_number`, `height`, `weight`, `blood_type`, `allergies`, `status`, `created_at`) VALUES
(26, NULL, 'chelo foster', 26, '2026-01-30', '2026-11-24', 'daet', '09207715121', 69.00, 60.00, '0', '', 'Approved', '2026-03-29 21:49:59');

-- --------------------------------------------------------

--
-- Table structure for table `old_records_backup`
--

CREATE TABLE `old_records_backup` (
  `id` int(11) NOT NULL,
  `mother_id` int(11) NOT NULL,
  `weight_kg` decimal(5,2) DEFAULT NULL,
  `bp` varchar(20) DEFAULT NULL,
  `temperature` decimal(4,2) DEFAULT NULL,
  `fetal_heart_rate` int(11) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `health_worker_id` int(11) DEFAULT NULL,
  `checkup_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pregnancy_history`
--

CREATE TABLE `pregnancy_history` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `pregnancy_no` int(11) NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_type` varchar(50) DEFAULT NULL,
  `birth_outcome` varchar(50) DEFAULT NULL,
  `child_count` varchar(50) DEFAULT NULL,
  `multiple_qty` int(11) DEFAULT NULL,
  `review_of_systems` text DEFAULT NULL,
  `family_history` text DEFAULT NULL,
  `past_health_history` text DEFAULT NULL,
  `social_history` text DEFAULT NULL,
  `gravida` int(11) DEFAULT 0,
  `para` int(11) DEFAULT 0,
  `full_term` int(11) DEFAULT 0,
  `premature` int(11) DEFAULT 0,
  `abortion` int(11) DEFAULT 0,
  `living_children` int(11) DEFAULT 0,
  `last_delivery_attendant` varchar(100) DEFAULT NULL,
  `past_lmp` date DEFAULT NULL,
  `bleeding_duration_days` int(11) DEFAULT NULL,
  `pads_per_day` int(11) DEFAULT NULL,
  `prev_fp_method` varchar(100) DEFAULT NULL,
  `fp_duration` varchar(100) DEFAULT NULL,
  `covid_vax_status` text DEFAULT NULL,
  `heent_findings` text DEFAULT NULL,
  `neck` text DEFAULT NULL,
  `chest_heart` text DEFAULT NULL,
  `abdomen_med` text DEFAULT NULL,
  `genital_med` text DEFAULT NULL,
  `extremities_med` text DEFAULT NULL,
  `skin_med` text DEFAULT NULL,
  `family_history_details` text DEFAULT NULL,
  `past_health_details` text DEFAULT NULL,
  `social_history_details` text DEFAULT NULL,
  `physical_exam_vitals` text DEFAULT NULL,
  `physical_exam_findings` text DEFAULT NULL,
  `breast` varchar(255) DEFAULT NULL,
  `tt_status` varchar(50) DEFAULT NULL,
  `muac` varchar(50) DEFAULT NULL,
  `bmi` varchar(50) DEFAULT NULL,
  `breast_left_size` varchar(50) DEFAULT NULL,
  `breast_right_size` varchar(50) DEFAULT NULL,
  `smoking_sticks_per_day` varchar(50) DEFAULT NULL,
  `alcohol_amount_per_day` varchar(50) DEFAULT NULL,
  `obstetric_findings` text DEFAULT NULL,
  `past_menstrual_period` varchar(100) DEFAULT NULL,
  `character_menstrual_bleeding_pads` varchar(100) DEFAULT NULL,
  `fp_previous_method` varchar(100) DEFAULT NULL,
  `vs_bp` varchar(50) DEFAULT NULL,
  `vs_weight` varchar(50) DEFAULT NULL,
  `vs_pulse` varchar(50) DEFAULT NULL,
  `vs_height` varchar(50) DEFAULT NULL,
  `vs_muac` varchar(50) DEFAULT NULL,
  `vs_bmi` varchar(50) DEFAULT NULL,
  `vs_bmi_category` varchar(50) DEFAULT NULL,
  `pe_conjunctiva` text DEFAULT NULL,
  `pe_neck` text DEFAULT NULL,
  `pe_breast` text DEFAULT NULL,
  `pe_breast_mass_left` varchar(100) DEFAULT NULL,
  `pe_breast_mass_right` varchar(100) DEFAULT NULL,
  `pe_thorax` text DEFAULT NULL,
  `pe_abdomen` text DEFAULT NULL,
  `pe_vaginal` text DEFAULT NULL,
  `pe_vaginal_others` text DEFAULT NULL,
  `pe_extremities` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pregnancy_history`
--

INSERT INTO `pregnancy_history` (`id`, `patient_id`, `pregnancy_no`, `delivery_date`, `delivery_type`, `birth_outcome`, `child_count`, `multiple_qty`, `review_of_systems`, `family_history`, `past_health_history`, `social_history`, `gravida`, `para`, `full_term`, `premature`, `abortion`, `living_children`, `last_delivery_attendant`, `past_lmp`, `bleeding_duration_days`, `pads_per_day`, `prev_fp_method`, `fp_duration`, `covid_vax_status`, `heent_findings`, `neck`, `chest_heart`, `abdomen_med`, `genital_med`, `extremities_med`, `skin_med`, `family_history_details`, `past_health_details`, `social_history_details`, `physical_exam_vitals`, `physical_exam_findings`, `breast`, `tt_status`, `muac`, `bmi`, `breast_left_size`, `breast_right_size`, `smoking_sticks_per_day`, `alcohol_amount_per_day`, `obstetric_findings`, `past_menstrual_period`, `character_menstrual_bleeding_pads`, `fp_previous_method`, `vs_bp`, `vs_weight`, `vs_pulse`, `vs_height`, `vs_muac`, `vs_bmi`, `vs_bmi_category`, `pe_conjunctiva`, `pe_neck`, `pe_breast`, `pe_breast_mass_left`, `pe_breast_mass_right`, `pe_thorax`, `pe_abdomen`, `pe_vaginal`, `pe_vaginal_others`, `pe_extremities`) VALUES
(5, 6, 1, '2024-12-17', 'Normal', 'Alive', 'Single', NULL, NULL, 'CVA (stroke)', 'Allergies', '', 2, 2, 0, 0, 0, 0, 'cyrus kish', '2026-06-18', 5, NULL, NULL, '3 years', NULL, 'Epilepsy / Convulsions / Seizures', NULL, 'Severe chest pain', 'Mass in the abdomen', 'Vaginal discharge', 'Severe varicosities', 'Yellowish', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '', '', '', '2026-02-28', '3', 'pills', '120/80', '50', '90', '50', '', '', '', 'Pale', 'Enlarged Thyroid', 'Mass', '13', '14', 'Abnormal heart sound / cardiac rate', 'Enlarge Liver', 'Bleeding', '', 'Edema'),
(6, 8, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'CVA (stroke)', 'Allergies', 'Smoking', 1, 0, 0, 0, 0, 0, '', '2026-06-28', 5, NULL, NULL, '3 years', NULL, 'Epilepsy / Convulsions / Seizures', NULL, 'Severe chest pain', 'Mass in the abdomen', 'Vaginal discharge', 'Severe varicosities', 'Yellowish', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2', '', '', '', '3', 'pills', '120/80', '50', '90', '50', '123', '', '', 'Yellowish', 'Enlarged Thyroid', '', '14', '15', 'Abnormal heart sound / cardiac rate', 'Enlarge Liver', 'Bleeding', '', 'Edema'),
(7, 9, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'CVA (stroke)', 'Bleeding tendencies (nose, gums, etc.)', '', 1, 0, 0, 0, 0, 0, '', '2026-06-10', 5, NULL, NULL, '3 years', NULL, 'Epilepsy / Convulsions / Seizures', NULL, 'Severe chest pain', 'Mass in the abdomen', 'Vaginal discharge', 'Severe varicosities', 'Yellowish', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2', '', '', '', '3', 'pills', '120/80', '50', '90', '50', '123', '', '', 'Pale', 'Enlarged Thyroid', '', '15', '16', 'Abnormal heart sound / cardiac rate', '', 'Bleeding', '', 'Edema'),
(8, 10, 0, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 1, 0, 0, 0, 0, 0, '', '2026-06-18', 0, NULL, NULL, '', NULL, 'Epilepsy / Convulsions / Seizures', NULL, 'Severe chest pain', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Bleeding', '', ''),
(9, 11, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'Heart Disease', 'Bleeding tendencies (nose, gums, etc.)', '', 1, 0, 0, 0, 0, 0, '', '2026-06-18', 5, NULL, NULL, '3 years', NULL, 'Epilepsy / Convulsions / Seizures', NULL, 'Severe chest pain', 'Mass in the abdomen', 'Vaginal discharge', 'Swelling or severe pain in the legs not related to injuries', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2', '', '', '', '3', 'pills', '120/80', '50', '90', '50', '123', '', '', 'Yellowish', '', '', '15', '16', 'Abnormal breath sound / respiratory rate', '', 'Bleeding', '', 'Varicosities'),
(10, 13, 0, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 1, 0, 0, 0, 0, 0, '', '2004-09-09', 0, NULL, NULL, '', NULL, '', NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(11, 16, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'Hypertension', 'Bleeding tendencies (nose, gums, etc.)', 'Obesity, Treated STIs in the past', 1, 0, 0, 0, 0, 0, '', '2026-03-19', 0, NULL, NULL, '', NULL, 'Epilepsy / Convulsions / Seizures', NULL, 'Shortness of breath and easy fatigability', 'History of Gall Bladder disease', 'Intermenstrual bleeding', 'Swelling or severe pain in the legs not related to injuries', 'Yellowish', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', 'condom', '', '', '', '', '', '', '', 'Pale', 'Enlarged Thyroid', 'Mass', '13', '14', 'Abnormal heart sound / cardiac rate', '', 'Bleeding, Discharges', '', 'Varicosities'),
(12, 12, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'Heart Disease', 'Diabetes', 'Obesity', 1, 0, 0, 0, 0, 0, '', '2026-07-09', 0, NULL, NULL, '', NULL, 'Epilepsy / Convulsions / Seizures', NULL, 'Severe chest pain', 'Mass in the abdomen', 'Vaginal discharge', 'Severe varicosities', 'Yellowish', NULL, NULL, NULL, NULL, NULL, NULL, 'partial', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '15', '16', 'Abnormal breath sound / respiratory rate', 'Mass', 'Bleeding', '', 'Varicosities'),
(13, 18, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'Hypertension', 'Bleeding tendencies (nose, gums, etc.)', '', 1, 0, 0, 0, 0, 0, '', '2026-06-21', 0, NULL, NULL, '', NULL, 'Epilepsy / Convulsions / Seizures', NULL, 'Breast and axillary masses', 'Mass in the abdomen', 'Postcoital bleeding', 'Severe varicosities', 'Yellowish', NULL, NULL, NULL, NULL, NULL, NULL, 'partial', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '14', '16', '', '', 'Bleeding', '', 'Edema');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `category` enum('Child','Maternal') NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `service_type` varchar(255) NOT NULL,
  `schedule_date` date NOT NULL,
  `schedule_time` time NOT NULL,
  `status` enum('Pending','Completed','Cancelled','Reschedule Requested') DEFAULT 'Pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `category`, `patient_name`, `service_type`, `schedule_date`, `schedule_time`, `status`, `notes`, `created_at`) VALUES
(1, 'Maternal', 'lexy david', 'prenatal checkup', '2026-08-17', '08:00:00', 'Completed', '| Request: 2026-08-20 09:00 | Reason: busy | Rescheduled (Orig: 2026-08-19) | Request: 2026-08-20 09:00 | Reason: busy | Request: 2026-08-20 09:00 | Reason: busy | Request: 2026-08-20 09:00 | Reason: busy', '2026-08-17 01:16:16'),
(3, 'Maternal', 'gerry lopez', 'prenatal checkup', '2026-09-12', '08:00:00', 'Reschedule Requested', '| Request: 2026-08-20 08:00 | Reason: sick | Rescheduled (Orig: 2026-08-18) | Request: 2026-08-20 08:00 | Reason: sick', '2026-08-17 19:10:45'),
(4, 'Maternal', 'janner  salazar', 'prenatal checkup', '2026-08-18', '08:00:00', 'Completed', '', '2026-08-17 19:10:45'),
(5, 'Maternal', 'gerry lopez', 'prenatal checkup', '2026-09-02', '17:01:00', '', '| Request: 2026-09-03 08:30 | Reason: work | Reschedule Rejected | Request: 2026-09-03 13:00 | Reason: sick | Rescheduled (Orig: 2026-09-02) | Request: 2026-09-03 08:00 | Reason: sick', '2026-08-17 19:11:22'),
(6, 'Maternal', 'janner  salazar', 'prenatal checkup', '2026-08-18', '08:00:00', 'Pending', '', '2026-08-17 19:11:23'),
(7, 'Child', 'jannarah abres', 'immunization', '2026-09-17', '08:00:00', 'Pending', '', '2026-09-17 17:04:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `generated_id` varchar(20) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Super Admin','Admin','User') DEFAULT 'User',
  `status` enum('Pending','Approved','Disapproved') DEFAULT 'Approved',
  `reset_code` varchar(6) DEFAULT NULL,
  `reset_expiry` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_activity` datetime DEFAULT current_timestamp(),
  `contact_number` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `position` varchar(100) DEFAULT 'Administrator',
  `total_children` int(11) DEFAULT 0,
  `current_pregnancy_status` varchar(100) DEFAULT '1st Pregnancy'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `generated_id`, `first_name`, `last_name`, `email`, `password`, `role`, `status`, `reset_code`, `reset_expiry`, `created_at`, `last_activity`, `contact_number`, `birthday`, `gender`, `address`, `profile_picture`, `position`, `total_children`, `current_pregnancy_status`) VALUES
(1, NULL, 'Super', 'Admin', 'alawihaohealth@gmail.com', 'admin123', 'Super Admin', 'Approved', '788869', '2026-09-22 15:41:43', '2026-09-13 05:10:34', '2026-09-22 14:26:28', NULL, NULL, NULL, NULL, NULL, 'Administrator', 0, '1st Pregnancy'),
(2, NULL, 'mikaela', 'jay', 'elay@gmail.com', 'Welcome123', 'User', 'Approved', NULL, NULL, '2026-09-13 05:22:55', '2026-09-21 14:54:21', NULL, NULL, NULL, NULL, NULL, 'Administrator', 0, '1st Pregnancy'),
(3, '2026-0001', 'mikaela', 'pimentel', 'chelomaefoster@gmail.com', 'Welcome123', 'Admin', 'Approved', NULL, NULL, '2026-09-19 14:27:02', '2026-09-22 13:19:32', '09207715121', '2004-09-09', 'Female', '', 'uploads/profile/profile_3_1789837483_c5ee1c0a.jpg', 'Administrator', 0, '1st Pregnancy'),
(11, '2026-0003', 'juane', 'tamad', 'juane@gmail.com', 'Welcome123', 'Admin', 'Approved', NULL, NULL, '2026-09-21 06:01:49', NULL, NULL, NULL, NULL, NULL, NULL, 'Administrator', 0, '1st Pregnancy'),
(12, '2026-0004', 'juaney', 'tamad', 'juaney@gmail.com', 'Welcome123', 'Admin', 'Pending', NULL, NULL, '2026-09-21 06:45:27', NULL, NULL, NULL, NULL, NULL, NULL, 'Administrator', 0, '1st Pregnancy');

-- --------------------------------------------------------

--
-- Table structure for table `vaccination_records`
--

CREATE TABLE `vaccination_records` (
  `id` int(11) NOT NULL,
  `patient_name` varchar(150) NOT NULL,
  `vaccine_name` varchar(100) NOT NULL,
  `dose_number` varchar(50) NOT NULL,
  `date_administered` date NOT NULL,
  `health_worker_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccines`
--

CREATE TABLE `vaccines` (
  `id` int(11) NOT NULL,
  `vaccine_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(50) DEFAULT 'Baby',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_received` int(11) DEFAULT 0,
  `available_stock` int(11) DEFAULT 0,
  `stock_in_date` date DEFAULT NULL,
  `received_by` varchar(255) DEFAULT NULL,
  `provided_by` varchar(255) DEFAULT NULL,
  `stock_in_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vaccines`
--

INSERT INTO `vaccines` (`id`, `vaccine_name`, `description`, `category`, `created_at`, `total_received`, `available_stock`, `stock_in_date`, `received_by`, `provided_by`, `stock_in_datetime`) VALUES
(7, 'Pentavalent (DPT-HepB-Hib)', '', 'Baby', '2026-08-30 01:17:58', 100, 1, '0000-00-00', 'riezza', 'daet', '2026-08-30 00:00:00'),
(8, 'BCG (Bacillus Calmette–Guérin)', '', 'Baby', '2026-08-30 01:18:36', 23, 56, '2026-08-30', 'riezza', 'daet', '2026-08-30 17:18:36'),
(10, 'Tetanus Toxoid (TT)', '', 'Maternal', '2026-08-30 21:13:15', 5, 2, '0000-00-00', 'Mikaela', 'Daet', '2026-09-08 05:12:00'),
(11, 'Hepatitis B', '', 'Baby', '2026-09-20 16:04:09', 100, 0, '0000-00-00', 'juan', 'ollh', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_logs`
--

CREATE TABLE `vaccine_logs` (
  `id` int(11) NOT NULL,
  `vaccine_id` int(11) DEFAULT NULL,
  `action_type` enum('IN','OUT') NOT NULL,
  `quantity` int(11) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `transaction_date` datetime DEFAULT current_timestamp(),
  `recorded_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vaccine_logs`
--

INSERT INTO `vaccine_logs` (`id`, `vaccine_id`, `action_type`, `quantity`, `remarks`, `transaction_date`, `recorded_by`) VALUES
(1, 11, 'IN', 50, 'New stock received from ollh', '0000-00-00 00:00:00', 'juan'),
(2, 11, 'IN', 100, 'Stock updated/adjusted', '0000-00-00 00:00:00', 'juan'),
(3, 11, 'IN', 100, 'Stock updated/adjusted', '0000-00-00 00:00:00', 'juan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `children`
--
ALTER TABLE `children`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `health_logs`
--
ALTER TABLE `health_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `child_id` (`child_id`);

--
-- Indexes for table `health_workers`
--
ALTER TABLE `health_workers`
  ADD PRIMARY KEY (`worker_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `infant_records`
--
ALTER TABLE `infant_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `health_worker_id` (`health_worker_id`);

--
-- Indexes for table `infant_schedule`
--
ALTER TABLE `infant_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maternal_logs`
--
ALTER TABLE `maternal_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maternal_records`
--
ALTER TABLE `maternal_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mother_rec` (`mother_id`);

--
-- Indexes for table `maternal_registration`
--
ALTER TABLE `maternal_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maternal_schedules`
--
ALTER TABLE `maternal_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_read` (`user_id`,`is_read`),
  ADD KEY `idx_created` (`created_at`);

--
-- Indexes for table `old_maternal_backup`
--
ALTER TABLE `old_maternal_backup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `old_records_backup`
--
ALTER TABLE `old_records_backup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mother_id` (`mother_id`);

--
-- Indexes for table `pregnancy_history`
--
ALTER TABLE `pregnancy_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_maternal_new` (`patient_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `vaccination_records`
--
ALTER TABLE `vaccination_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vaccines`
--
ALTER TABLE `vaccines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vaccine_logs`
--
ALTER TABLE `vaccine_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `children`
--
ALTER TABLE `children`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `health_workers`
--
ALTER TABLE `health_workers`
  MODIFY `worker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `infant_records`
--
ALTER TABLE `infant_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `infant_schedule`
--
ALTER TABLE `infant_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `maternal_logs`
--
ALTER TABLE `maternal_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maternal_records`
--
ALTER TABLE `maternal_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `maternal_registration`
--
ALTER TABLE `maternal_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `maternal_schedules`
--
ALTER TABLE `maternal_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `old_maternal_backup`
--
ALTER TABLE `old_maternal_backup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `old_records_backup`
--
ALTER TABLE `old_records_backup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pregnancy_history`
--
ALTER TABLE `pregnancy_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `vaccination_records`
--
ALTER TABLE `vaccination_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccines`
--
ALTER TABLE `vaccines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vaccine_logs`
--
ALTER TABLE `vaccine_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

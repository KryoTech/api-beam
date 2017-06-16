-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2017 at 04:11 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beam`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_admins`
--

CREATE TABLE `accounts_admins` (
  `id` int(11) NOT NULL,
  `username` varchar(5) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `phone_number` varchar(13) NOT NULL,
  `verified_user` tinyint(1) NOT NULL DEFAULT '0',
  `department` varchar(5) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `last_verified` timestamp NULL DEFAULT NULL,
  `password_hash` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts_admins`
--

INSERT INTO `accounts_admins` (`id`, `username`, `active`, `phone_number`, `verified_user`, `department`, `first_name`, `middle_name`, `last_name`, `last_verified`, `password_hash`) VALUES
(1, '00000', 1, '+639108757647', 1, 'IT', 'Baldwin John', 'Rosales', 'Sumatra', '2017-01-31 19:28:07', '$2y$10$w6IPWe5yMtBt/aFUquYioegooDqUi7t3WBUNDQyrYatvTqCwyx9.a');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_pending`
--

CREATE TABLE `accounts_pending` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `verification_code` varchar(6) NOT NULL,
  `sent` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts_pending`
--

INSERT INTO `accounts_pending` (`id`, `phone_number`, `verification_code`, `sent`) VALUES
(1, '+639430282128', '486361', 0);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_students`
--

CREATE TABLE `accounts_students` (
  `id` int(11) NOT NULL,
  `username` varchar(5) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `phone_number` varchar(13) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `verified_user` tinyint(1) NOT NULL DEFAULT '0',
  `campus` enum('Jacinto','Mintal','HCIT') NOT NULL,
  `course_abv` enum('IT','BA','CR','ED') NOT NULL,
  `year_level` enum('1','2','3','4') NOT NULL DEFAULT '1',
  `course` text NOT NULL,
  `last_verified` timestamp NULL DEFAULT NULL,
  `password_hash` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts_students`
--

INSERT INTO `accounts_students` (`id`, `username`, `active`, `phone_number`, `first_name`, `middle_name`, `last_name`, `verified_user`, `campus`, `course_abv`, `year_level`, `course`, `last_verified`, `password_hash`) VALUES
(1, '01187', 1, '+639068995050', 'Frank', 'Lawson', 'Franklin', 1, 'Jacinto', 'IT', '4', 'Information Technology', NULL, '$2y$10$2.6PpbU0OvbXOwNBK.Ey8efTtmE5FHBV/BNH9zx1gvptf.5Zmmx2S'),
(2, '06615', 1, '+639233355234', 'Robin', 'Richardson', 'Smith', 1, 'Jacinto', 'IT', '4', 'Information Technology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(3, '06019', 1, '+639982933720', 'Demo', 'Account', '3', 1, 'Jacinto', 'IT', '2', 'Information Technology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(4, '06020', 1, '+639291728129', 'Steve', 'Armstrong', 'Elliott', 1, 'Mintal', 'ED', '2', 'Education', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(5, '66824', 1, '+639308427220', 'Shirley', 'Smith', 'Phillips', 1, 'Mintal', 'IT', '4', 'Information Technology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(6, '77777', 1, '+639329107091', 'Jerry', 'Fernandez', 'Hamilton', 1, 'Jacinto', 'IT', '4', 'Information Technology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(7, '06052', 1, '+639470709145', 'Michelle', 'Larson', 'Watkins', 1, 'Jacinto', 'BA', '3', 'Business Administration', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(8, '06055', 1, '+639434952420', 'Albert', 'Long', 'Bell', 1, 'Mintal', 'IT', '4', 'Information Technology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(9, '01782', 1, '+639460032772', 'Jonathan', 'Parker', 'Ryan', 1, 'Mintal', 'CR', '3', 'Criminology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(10, '06616', 1, '+639460042477', 'Juan', 'Hunter', 'Howell', 1, 'Jacinto', 'IT', '4', 'Information Technology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(11, '99999', 1, '+639462574387', 'Randy', 'Gonzales', 'Moreno', 1, 'Mintal', 'IT', '1', 'Information Technology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(12, '01188', 1, '+639069636711', 'Juan', 'Hansen', 'Martinez', 1, 'HCIT', 'IT', '3', 'Information Technology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(13, '66825', 1, '+639475780622', 'Bruce', 'Hill', 'Watkins', 1, 'Jacinto', 'IT', '3', 'Information Technology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(14, '88888', 1, '+639486539338', 'Frances', 'Gordon', 'Hunt', 1, 'Mintal', 'IT', '1', 'Information Technology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(15, '66851', 1, '+639751818956', 'Robert', 'Moreno', 'Wallace', 1, 'Mintal', 'ED', '2', 'Education', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(16, '66852', 1, '+639758674315', 'Peter', 'Wheeler', 'Wagner', 1, 'Jacinto', 'IT', '4', 'Information Technology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(17, '06021', 1, '+639079184936', 'Lawrence', 'Wallace', 'Gilbert', 1, 'Jacinto', 'IT', '4', 'Information Technology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(18, '66850', 1, '+639093392210', 'Debra', 'Ray', 'Robertson', 1, 'Mintal', 'IT', '3', 'Information Technology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(19, '05649', 1, '+639095399587', 'Antonio', 'Davis', 'Gibson', 1, 'Jacinto', 'IT', '4', 'Information Technology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(20, '06051', 1, '+639097901106', 'Evelyn', 'Jacobs', 'Long', 1, 'Mintal', 'IT', '3', 'Information Technology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(21, '06001', 1, '+639099574846', 'Howard', 'Black', 'Knight', 1, 'Jacinto', 'IT', '4', 'Information Technology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(22, '06004', 1, '+639106680961', 'Martin', 'Olson', 'Thomas', 1, 'Jacinto', 'IT', '4', 'Information Technology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(23, '06011', 1, '+639125131403', 'Rebecca', 'Fowler', 'Pierce', 1, 'Mintal', 'IT', '4', 'Information Technology', NULL, '$2y$10$Yq0q8pyXrg0389bXt7Cqie23luhpcim6S/IwofGTFuX4qHDRReRai'),
(24, '11111', 1, '+639430282127', 'Demo', 'Account', '1', 1, 'Jacinto', 'IT', '2', 'Information Technology', NULL, '$2y$10$Xq8qDOn1zDPxeFOaG18.juyRU5/H2nF/O4eaJohLh7E07SeRr2dui'),
(25, '00000', 1, '+639430282128', 'Demo', 'Account', '2', 0, 'Jacinto', 'IT', '2', 'Information Technology', NULL, '$2y$10$YgTzt85kp637z/y85ntiAO6UXO2IeJWT9467E/2lxEdmmtPHEI8Pe'),
(26, '00601', 0, '+639470709146', 'Juan', 'Reyes', 'Dela Cruz', 0, 'Jacinto', 'IT', '3', 'Information Technology', NULL, '$2y$10$kFYuznVNV/JlzNyD1at36uNGOCY1EbgXMlIcItjqq08/S7ERdcmoi'),
(27, '07261', 0, '+639993370102', 'Baldwin John', 'Rosales', 'Sumatra', 0, 'Jacinto', 'IT', '4', 'Information Technology', NULL, '$2y$10$2pOhUH.3c34saxhYrJ7xB.3gNDhUiOPqMW08OhRn3KOiIUz71OT0a');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_teachers`
--

CREATE TABLE `accounts_teachers` (
  `id` int(11) NOT NULL,
  `username` varchar(5) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `phone_number` varchar(13) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `department` varchar(5) NOT NULL,
  `verified_user` tinyint(1) NOT NULL DEFAULT '0',
  `last_verified` timestamp NULL DEFAULT NULL,
  `password_hash` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts_teachers`
--

INSERT INTO `accounts_teachers` (`id`, `username`, `active`, `phone_number`, `first_name`, `middle_name`, `last_name`, `department`, `verified_user`, `last_verified`, `password_hash`) VALUES
(1, '00000', 1, '+639430282129', 'Kenneth', 'Dano', 'Billiones', 'IT', 1, NULL, '$2y$10$F4BzG299EAgTymLkz4L0qe3TdKY1zOiLabqJP9o0xeUsHHVOjhaei');

-- --------------------------------------------------------

--
-- Table structure for table `beam_events`
--

CREATE TABLE `beam_events` (
  `id` int(11) NOT NULL,
  `code` varchar(4) NOT NULL,
  `name` varchar(150) NOT NULL,
  `schedule` text NOT NULL,
  `location` text NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `beam_events`
--

INSERT INTO `beam_events` (`id`, `code`, `name`, `schedule`, `location`, `details`) VALUES
(1, '3281', 'XYZ Seminar', 'Sun, March 26, 2017, 8:00 AM - 5:00 PM', '2nd Floor, F Building', 'Free Python Workshop');

-- --------------------------------------------------------

--
-- Table structure for table `beam_event_attendees`
--

CREATE TABLE `beam_event_attendees` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `beam_groups`
--

CREATE TABLE `beam_groups` (
  `id` int(11) NOT NULL,
  `code` varchar(6) NOT NULL,
  `name` varchar(150) NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `beam_groups`
--

INSERT INTO `beam_groups` (`id`, `code`, `name`, `details`) VALUES
(1, '315605', 'Capstone Project 2', 'Sun, 9:00AM - 12:00NN, COMPLAB, HCCD Mintal Campus');

-- --------------------------------------------------------

--
-- Table structure for table `beam_group_members`
--

CREATE TABLE `beam_group_members` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `beam_group_members`
--

INSERT INTO `beam_group_members` (`id`, `group_id`, `student_id`) VALUES
(1, 1, 24),
(2, 1, 27);

-- --------------------------------------------------------

--
-- Table structure for table `beam_group_moderators`
--

CREATE TABLE `beam_group_moderators` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `beam_group_moderators`
--

INSERT INTO `beam_group_moderators` (`id`, `teacher_id`, `group_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `beam_keywords`
--

CREATE TABLE `beam_keywords` (
  `id` int(11) NOT NULL,
  `keyword` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `beam_polls`
--

CREATE TABLE `beam_polls` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `targets` int(11) NOT NULL,
  `attending` int(11) NOT NULL DEFAULT '0',
  `not_going` int(11) NOT NULL DEFAULT '0',
  `undecided` int(11) NOT NULL DEFAULT '0',
  `no_reply` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `beam_polls`
--

INSERT INTO `beam_polls` (`id`, `event_id`, `targets`, `attending`, `not_going`, `undecided`, `no_reply`) VALUES
(1, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `logs_admin_actions`
--

CREATE TABLE `logs_admin_actions` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `action` text NOT NULL,
  `details` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logs_admin_actions`
--

INSERT INTO `logs_admin_actions` (`id`, `admin_id`, `action`, `details`, `timestamp`) VALUES
(1, 1, 'Registered Teacher: ID# 11111 "Fdfs, Hadsd"', '', '2017-03-15 10:27:05'),
(2, 1, 'Created Event: XYZ Seminar (7384)', '', '2017-03-16 10:39:24'),
(3, 1, 'Deleted Teacher: ID# 11111', 'Name: Hadsd Fasd Fdfs\nDepartment: BA', '2017-03-16 11:47:42'),
(4, 1, 'Deleted Poll: XYZ Seminar', 'Attending - 2\nNot Going - 1\nUndecided - 0', '2017-03-16 11:48:17'),
(5, 1, 'Deleted Event: XYZ Seminar', '', '2017-03-16 11:48:23'),
(6, 1, 'Created Event: RSVP Demo (1302)', '', '2017-03-16 11:49:39'),
(7, 1, 'Created Event: XYZ Seminar (3281)', '', '2017-03-19 14:26:02');

-- --------------------------------------------------------

--
-- Table structure for table `logs_poll_replies`
--

CREATE TABLE `logs_poll_replies` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `reply` varchar(1) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logs_requests`
--

CREATE TABLE `logs_requests` (
  `id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of all requests filed';

-- --------------------------------------------------------

--
-- Table structure for table `logs_sent_messages`
--

CREATE TABLE `logs_sent_messages` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pending_requests`
--

CREATE TABLE `pending_requests` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `keyword` varchar(25) NOT NULL,
  `message` text NOT NULL,
  `request_code` varchar(3) NOT NULL,
  `status` enum('pending','approved','denied') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_admins`
--
ALTER TABLE `accounts_admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `id_number` (`username`);

--
-- Indexes for table `accounts_pending`
--
ALTER TABLE `accounts_pending`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `verification_code` (`verification_code`);

--
-- Indexes for table `accounts_students`
--
ALTER TABLE `accounts_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `id_number` (`username`);

--
-- Indexes for table `accounts_teachers`
--
ALTER TABLE `accounts_teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `id_number` (`username`);

--
-- Indexes for table `beam_events`
--
ALTER TABLE `beam_events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `beam_event_attendees`
--
ALTER TABLE `beam_event_attendees`
  ADD PRIMARY KEY (`id`,`event_id`,`student_id`);

--
-- Indexes for table `beam_groups`
--
ALTER TABLE `beam_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `beam_group_members`
--
ALTER TABLE `beam_group_members`
  ADD PRIMARY KEY (`id`,`student_id`,`group_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `beam_group_moderators`
--
ALTER TABLE `beam_group_moderators`
  ADD PRIMARY KEY (`id`,`teacher_id`,`group_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `beam_keywords`
--
ALTER TABLE `beam_keywords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beam_polls`
--
ALTER TABLE `beam_polls`
  ADD PRIMARY KEY (`id`,`event_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `logs_admin_actions`
--
ALTER TABLE `logs_admin_actions`
  ADD PRIMARY KEY (`id`,`admin_id`);

--
-- Indexes for table `logs_poll_replies`
--
ALTER TABLE `logs_poll_replies`
  ADD PRIMARY KEY (`id`,`student_id`,`event_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `logs_requests`
--
ALTER TABLE `logs_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `request_idx` (`request_id`);

--
-- Indexes for table `logs_sent_messages`
--
ALTER TABLE `logs_sent_messages`
  ADD PRIMARY KEY (`id`,`student_id`,`request_id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `pending_requests`
--
ALTER TABLE `pending_requests`
  ADD PRIMARY KEY (`id`,`teacher_id`),
  ADD UNIQUE KEY `request_code` (`request_code`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_admins`
--
ALTER TABLE `accounts_admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `accounts_pending`
--
ALTER TABLE `accounts_pending`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `accounts_students`
--
ALTER TABLE `accounts_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `accounts_teachers`
--
ALTER TABLE `accounts_teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `beam_events`
--
ALTER TABLE `beam_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `beam_event_attendees`
--
ALTER TABLE `beam_event_attendees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `beam_groups`
--
ALTER TABLE `beam_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `beam_group_members`
--
ALTER TABLE `beam_group_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `beam_group_moderators`
--
ALTER TABLE `beam_group_moderators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `beam_keywords`
--
ALTER TABLE `beam_keywords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `beam_polls`
--
ALTER TABLE `beam_polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `logs_admin_actions`
--
ALTER TABLE `logs_admin_actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `logs_poll_replies`
--
ALTER TABLE `logs_poll_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logs_requests`
--
ALTER TABLE `logs_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logs_sent_messages`
--
ALTER TABLE `logs_sent_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pending_requests`
--
ALTER TABLE `pending_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `beam_group_members`
--
ALTER TABLE `beam_group_members`
  ADD CONSTRAINT `beam_group_members_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `accounts_students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `beam_group_members_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `beam_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `beam_group_moderators`
--
ALTER TABLE `beam_group_moderators`
  ADD CONSTRAINT `beam_group_moderators_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `accounts_teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `beam_polls`
--
ALTER TABLE `beam_polls`
  ADD CONSTRAINT `beam_polls_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `beam_events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `logs_poll_replies`
--
ALTER TABLE `logs_poll_replies`
  ADD CONSTRAINT `logs_poll_replies_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `accounts_students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `logs_poll_replies_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `beam_events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `logs_requests`
--
ALTER TABLE `logs_requests`
  ADD CONSTRAINT `logs_requests_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `pending_requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `logs_sent_messages`
--
ALTER TABLE `logs_sent_messages`
  ADD CONSTRAINT `logs_sent_messages_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `pending_requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `logs_sent_messages_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `accounts_students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pending_requests`
--
ALTER TABLE `pending_requests`
  ADD CONSTRAINT `pending_requests_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `accounts_teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2024 at 01:39 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `osticket`
--

-- --------------------------------------------------------

--
-- Table structure for table `ost_api_key`
--

CREATE TABLE `ost_api_key` (
  `id` int(10) UNSIGNED NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT 1,
  `ipaddr` varchar(64) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `can_create_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `can_exec_cron` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `notes` text DEFAULT NULL,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_attachment`
--

CREATE TABLE `ost_attachment` (
  `id` int(10) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `type` char(1) NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `inline` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `lang` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_attachment`
--

INSERT INTO `ost_attachment` (`id`, `object_id`, `type`, `file_id`, `name`, `inline`, `lang`) VALUES
(1, 1, 'C', 2, NULL, 0, NULL),
(2, 8, 'T', 1, NULL, 1, NULL),
(3, 9, 'T', 1, NULL, 1, NULL),
(4, 10, 'T', 1, NULL, 1, NULL),
(5, 11, 'T', 1, NULL, 1, NULL),
(6, 12, 'T', 1, NULL, 1, NULL),
(7, 13, 'T', 1, NULL, 1, NULL),
(8, 14, 'T', 1, NULL, 1, NULL),
(9, 16, 'T', 1, NULL, 1, NULL),
(10, 17, 'T', 1, NULL, 1, NULL),
(11, 18, 'T', 1, NULL, 1, NULL),
(12, 19, 'T', 1, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_canned_response`
--

CREATE TABLE `ost_canned_response` (
  `canned_id` int(10) UNSIGNED NOT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `isenabled` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_canned_response`
--

INSERT INTO `ost_canned_response` (`canned_id`, `dept_id`, `isenabled`, `title`, `response`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'What is osTicket (sample)?', 'osTicket is a widely-used open source support ticket system, an\nattractive alternative to higher-cost and complex customer support\nsystems - simple, lightweight, reliable, open source, web-based and easy\nto setup and use.', 'en_US', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(2, 0, 1, 'Sample (with variables)', 'Hi %{ticket.name.first},\n<br>\n<br>\nYour ticket #%{ticket.number} created on %{ticket.create_date} is in\n%{ticket.dept.name} department.', 'en_US', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25');

-- --------------------------------------------------------

--
-- Table structure for table `ost_config`
--

CREATE TABLE `ost_config` (
  `id` int(11) UNSIGNED NOT NULL,
  `namespace` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_config`
--

INSERT INTO `ost_config` (`id`, `namespace`, `key`, `value`, `updated`) VALUES
(1, 'core', 'admin_email', 'harithkly@gmail.com', '2023-11-16 07:21:25'),
(2, 'core', 'helpdesk_url', 'http://localhost/osticket/', '2023-11-16 07:21:25'),
(3, 'core', 'helpdesk_title', 'D\'Harmoni HelpDesk', '2023-11-16 07:21:25'),
(4, 'core', 'schema_signature', '5fb92bef17f3b603659e024c01cc7a59', '2023-11-16 07:21:25'),
(5, 'schedule.1', 'configuration', '{\"holidays\":[4]}', '2023-11-16 07:21:24'),
(6, 'core', 'time_format', 'hh:mm a', '2023-11-16 07:21:24'),
(7, 'core', 'date_format', 'MM/dd/y', '2023-11-16 07:21:24'),
(8, 'core', 'datetime_format', 'MM/dd/y h:mm a', '2023-11-16 07:21:24'),
(9, 'core', 'daydatetime_format', 'EEE, MMM d y h:mm a', '2023-11-16 07:21:24'),
(10, 'core', 'default_priority_id', '2', '2023-11-16 07:21:24'),
(11, 'core', 'enable_daylight_saving', '', '2023-11-16 07:21:24'),
(12, 'core', 'reply_separator', '-- reply above this line --', '2023-11-16 07:21:24'),
(13, 'core', 'isonline', '1', '2023-11-16 07:21:24'),
(14, 'core', 'staff_ip_binding', '', '2023-11-16 07:21:24'),
(15, 'core', 'staff_max_logins', '4', '2023-11-16 07:21:24'),
(16, 'core', 'staff_login_timeout', '2', '2023-11-16 07:21:24'),
(17, 'core', 'staff_session_timeout', '30', '2023-11-16 07:21:24'),
(18, 'core', 'passwd_reset_period', '', '2023-11-16 07:21:24'),
(19, 'core', 'client_max_logins', '4', '2023-11-16 07:21:24'),
(20, 'core', 'client_login_timeout', '2', '2023-11-16 07:21:24'),
(21, 'core', 'client_session_timeout', '30', '2023-11-16 07:21:24'),
(22, 'core', 'max_page_size', '25', '2023-11-16 07:21:24'),
(23, 'core', 'max_open_tickets', '', '2023-11-16 07:21:24'),
(24, 'core', 'autolock_minutes', '3', '2023-11-16 07:21:24'),
(25, 'core', 'default_smtp_id', '0', '2023-12-07 03:27:22'),
(26, 'core', 'use_email_priority', '0', '2023-12-07 03:27:22'),
(27, 'core', 'enable_kb', '', '2023-11-16 07:21:24'),
(28, 'core', 'enable_premade', '1', '2023-11-16 07:21:24'),
(29, 'core', 'enable_captcha', '', '2023-11-16 07:21:24'),
(30, 'core', 'enable_auto_cron', '0', '2023-12-07 03:27:22'),
(31, 'core', 'enable_mail_polling', '0', '2023-12-07 03:27:22'),
(32, 'core', 'send_sys_errors', '1', '2023-11-16 07:21:24'),
(33, 'core', 'send_sql_errors', '1', '2023-11-16 07:21:24'),
(34, 'core', 'send_login_errors', '1', '2023-11-16 07:21:24'),
(35, 'core', 'save_email_headers', '1', '2023-11-16 07:21:24'),
(36, 'core', 'strip_quoted_reply', '0', '2024-01-16 03:53:04'),
(37, 'core', 'ticket_autoresponder', '', '2023-11-16 07:21:24'),
(38, 'core', 'message_autoresponder', '', '2023-11-16 07:21:24'),
(39, 'core', 'ticket_notice_active', '1', '2023-11-16 07:21:24'),
(40, 'core', 'ticket_alert_active', '1', '2023-11-16 07:21:24'),
(41, 'core', 'ticket_alert_admin', '1', '2023-11-16 07:21:24'),
(42, 'core', 'ticket_alert_dept_manager', '1', '2023-11-16 07:21:24'),
(43, 'core', 'ticket_alert_dept_members', '', '2023-11-16 07:21:24'),
(44, 'core', 'message_alert_active', '1', '2023-11-16 07:21:24'),
(45, 'core', 'message_alert_laststaff', '1', '2023-11-16 07:21:24'),
(46, 'core', 'message_alert_assigned', '1', '2023-11-16 07:21:24'),
(47, 'core', 'message_alert_dept_manager', '', '2023-11-16 07:21:24'),
(48, 'core', 'note_alert_active', '', '2023-11-16 07:21:24'),
(49, 'core', 'note_alert_laststaff', '1', '2023-11-16 07:21:24'),
(50, 'core', 'note_alert_assigned', '1', '2023-11-16 07:21:24'),
(51, 'core', 'note_alert_dept_manager', '', '2023-11-16 07:21:24'),
(52, 'core', 'transfer_alert_active', '', '2023-11-16 07:21:24'),
(53, 'core', 'transfer_alert_assigned', '', '2023-11-16 07:21:24'),
(54, 'core', 'transfer_alert_dept_manager', '1', '2023-11-16 07:21:24'),
(55, 'core', 'transfer_alert_dept_members', '', '2023-11-16 07:21:24'),
(56, 'core', 'overdue_alert_active', '1', '2023-11-16 07:21:24'),
(57, 'core', 'overdue_alert_assigned', '1', '2023-11-16 07:21:24'),
(58, 'core', 'overdue_alert_dept_manager', '1', '2023-11-16 07:21:24'),
(59, 'core', 'overdue_alert_dept_members', '', '2023-11-16 07:21:24'),
(60, 'core', 'assigned_alert_active', '1', '2023-11-16 07:21:24'),
(61, 'core', 'assigned_alert_staff', '1', '2023-11-16 07:21:24'),
(62, 'core', 'assigned_alert_team_lead', '', '2023-11-16 07:21:24'),
(63, 'core', 'assigned_alert_team_members', '', '2023-11-16 07:21:24'),
(64, 'core', 'auto_claim_tickets', '1', '2023-11-16 07:21:24'),
(65, 'core', 'auto_refer_closed', '1', '2023-11-16 07:21:24'),
(66, 'core', 'collaborator_ticket_visibility', '1', '2023-11-16 07:21:24'),
(67, 'core', 'require_topic_to_close', '', '2023-11-16 07:21:24'),
(68, 'core', 'show_related_tickets', '1', '2023-11-16 07:21:24'),
(69, 'core', 'show_assigned_tickets', '1', '2023-11-16 07:21:24'),
(70, 'core', 'show_answered_tickets', '', '2023-11-16 07:21:24'),
(71, 'core', 'hide_staff_name', '', '2023-11-16 07:21:24'),
(72, 'core', 'disable_agent_collabs', '', '2023-11-16 07:21:24'),
(73, 'core', 'overlimit_notice_active', '', '2023-11-16 07:21:24'),
(74, 'core', 'email_attachments', '0', '2024-01-16 03:53:04'),
(75, 'core', 'ticket_number_format', '######', '2023-11-16 07:21:24'),
(76, 'core', 'ticket_sequence_id', '', '2023-11-16 07:21:24'),
(77, 'core', 'queue_bucket_counts', '', '2023-11-16 07:21:24'),
(78, 'core', 'allow_external_images', '', '2023-11-16 07:21:24'),
(79, 'core', 'task_number_format', '#', '2023-11-16 07:21:24'),
(80, 'core', 'task_sequence_id', '2', '2023-11-16 07:21:24'),
(81, 'core', 'log_level', '2', '2023-11-16 07:21:24'),
(82, 'core', 'log_graceperiod', '12', '2023-11-16 07:21:24'),
(83, 'core', 'client_registration', 'public', '2023-11-16 07:21:24'),
(84, 'core', 'default_ticket_queue', '1', '2023-11-16 07:21:24'),
(85, 'core', 'embedded_domain_whitelist', 'youtube.com, dailymotion.com, vimeo.com, player.vimeo.com, web.microsoftstream.com', '2023-11-16 07:21:24'),
(86, 'core', 'max_file_size', '33554432', '2023-11-16 07:21:24'),
(87, 'core', 'landing_page_id', '1', '2023-11-16 07:21:24'),
(88, 'core', 'thank-you_page_id', '2', '2023-11-16 07:21:24'),
(89, 'core', 'offline_page_id', '3', '2023-11-16 07:21:24'),
(90, 'core', 'system_language', 'en_US', '2023-11-16 07:21:25'),
(91, 'mysqlsearch', 'reindex', '0', '2023-11-16 07:25:46'),
(92, 'core', 'default_email_id', '4', '2024-01-08 01:14:32'),
(93, 'core', 'alert_email_id', '0', '2024-01-08 01:23:25'),
(94, 'core', 'default_dept_id', '1', '2023-11-16 07:21:25'),
(95, 'core', 'default_sla_id', '1', '2023-11-16 07:21:25'),
(96, 'core', 'schedule_id', '1', '2023-11-16 07:21:25'),
(97, 'core', 'default_template_id', '1', '2023-11-16 07:21:25'),
(98, 'core', 'default_timezone', 'Asia/Shanghai', '2023-11-16 07:21:25'),
(99, 'core', 'client_logo_id', '3', '2023-11-16 07:24:10'),
(100, 'core', 'staff_logo_id', '3', '2023-11-16 07:24:10'),
(101, 'core', 'staff_backdrop_id', '', '2023-11-16 07:24:04'),
(102, 'pwreset', 'BfPLlW2l6veBumVDRwBYW2EYIFeHlUk0DuL3Zd0lBKV6Egoq', 'c2', '2023-11-21 07:15:15'),
(103, 'pwreset', '_DRRM6nxcbjuN9zpjMgrXCyHTREJWmf9eIdS1QldZLmeoSVc', 'c3', '2023-12-07 02:37:50'),
(104, 'pwreset', 'QVL7Ezwl98VKT4UYyAiiYHfaXi8iU7MiVLBbas5kKTg0vS6x', 'c2', '2023-12-07 02:39:26'),
(105, 'pwreset', 'H9GJHbh41teRuTf6cpNgL5VjD6pK4vPumfV4e9jh5UKUb_0y', 'c17', '2023-12-07 02:49:44'),
(106, 'core', 'verify_email_addrs', '0', '2024-01-16 03:53:04'),
(107, 'core', 'accept_unregistered_email', '0', '2024-01-16 03:53:04'),
(108, 'core', 'add_email_collabs', '0', '2024-01-16 03:53:04'),
(109, 'pwreset', '7lHbDsk66zYkOjqNInSchHxZceoRAjniuGMmh0jVi0bnAmz5', 'c17', '2023-12-07 03:27:36'),
(110, 'pwreset', '5Tr4udVKUuXYsgIQbi7xFrdwmI8cCjEgUvh4RxJbQKbrkfUu', 'c17', '2023-12-07 03:37:45'),
(111, 'pwreset', 'OmiFXxyjo2owdwD6k0kddqFS50nedOqnG=JY2AsMz3hSqSTj', 'c17', '2024-01-05 03:22:50'),
(114, 'core', 'help_topic_sort_mode', 'm', '2024-01-24 04:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `ost_content`
--

CREATE TABLE `ost_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(32) NOT NULL DEFAULT 'other',
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_content`
--

INSERT INTO `ost_content` (`id`, `isactive`, `type`, `name`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'landing', 'Landing', '<h1>Welcome to the Support Center</h1> <p> In order to streamline support requests and better serve you, we utilize a support ticket system. Every support request is assigned a unique ticket number which you can use to track the progress and responses online. For your reference we provide complete archives and history of all your support requests. A valid email address is required to submit a ticket. </p>', 'The Landing Page refers to the content of the Customer Portal\'s initial view. The template modifies the content seen above the two links <strong>Open a New Ticket</strong> and <strong>Check Ticket Status</strong>.', '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(2, 1, 'thank-you', 'Thank You', '<div>%{ticket.name}, <br /> <br /> Thank you for contacting us. <br /> <br /> A support ticket request has been created and a representative will be getting back to you shortly if necessary. <br /> <br /> Support Team </div>', '<p>This template defines the content displayed on the Thank-You page after a Client submits a new ticket in the Client Portal.</p>', '2023-11-16 15:21:24', '2023-11-17 11:07:49'),
(3, 1, 'offline', 'Offline', '<div><h1>\n<span style=\"font-size: medium\">Support Ticket System Offline</span>\n</h1>\n<p>Thank you for your interest in contacting us.</p>\n<p>Our helpdesk is offline at the moment, please check back at a later\ntime.</p>\n</div>', 'The Offline Page appears in the Customer Portal when the Help Desk is offline.', '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(4, 1, 'registration-staff', 'Welcome to osTicket', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System<br /> %{company.name}</em> </div>', 'This template defines the initial email (optional) sent to Agents when an account is created on their behalf.', '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(5, 1, 'pwreset-staff', 'osTicket Staff Password Reset', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width: 126px\" /> </div>', 'This template defines the email sent to Staff who select the <strong>Forgot My Password</strong> link on the Staff Control Panel Log In page.', '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(6, 1, 'banner-staff', 'Authentication Required', '', 'This is the initial message and banner shown on the Staff Log In page. The first input field refers to the red-formatted text that appears at the top. The latter textarea is for the banner content which should serve as a disclaimer.', '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(7, 1, 'registration-client', 'Welcome to %{company.name}', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'This template defines the email sent to Clients when their account has been created in the Client Portal or by an Agent on their behalf. This email serves as an email address verification. Please use %{link} somewhere in the body.', '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(8, 1, 'pwreset-client', '%{company.name} Help Desk Access', '<h3><strong>Hi %{user.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'This template defines the email sent to Clients who select the <strong>Forgot My Password</strong> link on the Client Log In page.', '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(9, 1, 'banner-client', 'Sign in to %{company.name}', 'To better serve you, we encourage our Clients to register for an account.', 'This composes the header on the Client Log In page. It can be useful to inform your Clients about your log in and registration policies.', '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(10, 1, 'registration-confirm', 'Account registration', '<div><strong>Thanks for registering for an account.</strong><br/> <br /> We\'ve just sent you an email to the address you entered. Please follow the link in the email to confirm your account and gain access to your tickets. </div>', 'This templates defines the page shown to Clients after completing the registration form. The template should mention that the system is sending them an email confirmation link and what is the next step in the registration process.', '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(11, 1, 'registration-thanks', 'Account Confirmed!', '<div> <strong>Thanks for registering for an account.</strong><br /> <br /> You\'ve confirmed your email address and successfully activated your account. You may proceed to open a new ticket or manage existing tickets.<br /> <br /> <em>Your friendly support center</em><br /> %{company.name} </div>', 'This template defines the content displayed after Clients successfully register by confirming their account. This page should inform the user that registration is complete and that the Client can now submit a ticket or access existing tickets.', '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(12, 1, 'access-link', 'Ticket [#%{ticket.number}] Access Link', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> An access link request for ticket #%{ticket.number} has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> Follow the link below to check the status of the ticket #%{ticket.number}.<br /> <br /> <a href=\"%{recipient.ticket_link}\">%{recipient.ticket_link}</a><br /> <br /> If you <strong>did not</strong> make the request, please delete and disregard this email. Your account is still secure and no one has been given access to the ticket. Someone could have mistakenly entered your email address.<br /> <br /> --<br /> %{company.name} </div>', 'This template defines the notification for Clients that an access link was sent to their email. The ticket number and email address trigger the access link.', '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(13, 1, 'email2fa-staff', 'osTicket Two Factor Authentication', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div> You have just logged into for the helpdesk at %{url}.<br /> <br /> Use the verification code below to finish logging into the helpdesk.<br /> <br /> %{otp}<br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width: 126px\" /> </div>', 'This template defines the email sent to Staff who use Email for Two Factor Authentication', '2023-11-16 15:21:25', '2023-11-16 15:21:25');

-- --------------------------------------------------------

--
-- Table structure for table `ost_department`
--

CREATE TABLE `ost_department` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED DEFAULT NULL,
  `tpl_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `schedule_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `email_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `autoresp_email_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manager_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `group_membership` tinyint(1) NOT NULL DEFAULT 0,
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT 1,
  `message_auto_response` tinyint(1) NOT NULL DEFAULT 0,
  `path` varchar(128) NOT NULL DEFAULT '/',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_department`
--

INSERT INTO `ost_department` (`id`, `pid`, `tpl_id`, `sla_id`, `schedule_id`, `email_id`, `autoresp_email_id`, `manager_id`, `flags`, `name`, `signature`, `ispublic`, `group_membership`, `ticket_auto_response`, `message_auto_response`, `path`, `updated`, `created`) VALUES
(1, NULL, 0, 0, 0, 0, 0, 0, 4, 'Support', 'Support Department', 1, 1, 1, 1, '/1/', '2023-11-16 15:21:23', '2023-11-16 15:21:23');

-- --------------------------------------------------------

--
-- Table structure for table `ost_draft`
--

CREATE TABLE `ost_draft` (
  `id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `namespace` varchar(32) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `extra` text DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_email`
--

CREATE TABLE `ost_email` (
  `email_id` int(11) UNSIGNED NOT NULL,
  `noautoresp` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `priority_id` int(11) UNSIGNED NOT NULL DEFAULT 2,
  `dept_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `topic_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_email`
--

INSERT INTO `ost_email` (`email_id`, `noautoresp`, `priority_id`, `dept_id`, `topic_id`, `email`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 2, 1, 0, 'harith.dharmoni@gmail.com', 'Support', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(2, 0, 2, 1, 0, 'alerts@gmail.com', 'osTicket Alerts', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(3, 0, 2, 1, 0, 'noreply@gmail.com', '', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(4, 0, 2, 0, 0, 'harithhakim@localhost.com', 'harith', NULL, '2024-01-08 09:14:15', '2024-01-08 09:14:15');

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_account`
--

CREATE TABLE `ost_email_account` (
  `id` int(11) UNSIGNED NOT NULL,
  `email_id` int(11) UNSIGNED NOT NULL,
  `type` enum('mailbox','smtp') NOT NULL DEFAULT 'mailbox',
  `auth_bk` varchar(128) NOT NULL,
  `auth_id` varchar(16) DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `host` varchar(128) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL,
  `folder` varchar(255) DEFAULT NULL,
  `protocol` enum('IMAP','POP','SMTP','OTHER') NOT NULL DEFAULT 'OTHER',
  `encryption` enum('NONE','AUTO','SSL') NOT NULL DEFAULT 'AUTO',
  `fetchfreq` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `fetchmax` tinyint(4) UNSIGNED DEFAULT 30,
  `postfetch` enum('archive','delete','nothing') NOT NULL DEFAULT 'nothing',
  `archivefolder` varchar(255) DEFAULT NULL,
  `allow_spoofing` tinyint(1) UNSIGNED DEFAULT 0,
  `num_errors` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `last_error_msg` tinytext DEFAULT NULL,
  `last_error` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_template`
--

CREATE TABLE `ost_email_template` (
  `id` int(11) UNSIGNED NOT NULL,
  `tpl_id` int(11) UNSIGNED NOT NULL,
  `code_name` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_email_template`
--

INSERT INTO `ost_email_template` (`id`, `tpl_id`, `code_name`, `subject`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'ticket.autoresp', 'Support Ticket Opened [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <p>A request for support has been created and assigned #%{ticket.number}. A representative will follow-up with you as soon as possible. You can <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. </p> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team, <br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(2, 1, 'ticket.autoreply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> A request for support has been created and assigned ticket <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> with the following automatic reply <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>We hope this response has sufficiently answered your questions. If you wish to provide additional comments or information, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(3, 1, 'message.autoresp', 'Message Confirmation', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Your reply to support request <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> has been noted <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You can view the support request progress <a href=\"%%7Brecipient.ticket_link%7D\">online here</a></em> </div>', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(4, 1, 'ticket.notice', '%{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Our customer care team has created a ticket, <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> on your behalf, with the following details and summary: <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{message} <br /> <br /> %{response} <br /> <br /> If need be, a representative will follow-up with you as soon as possible. You can also <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(5, 1, 'ticket.overlimit', 'Open Tickets Limit Reached', '<h3><strong>Dear %{ticket.name.first},</strong></h3> You have reached the maximum number of open tickets allowed. To be able to open another ticket, one of your pending tickets must be closed. To update or add comments to an open ticket simply <a href=\"%%7Burl%7D/tickets.php?e=%%7Bticket.email%7D\">login to our helpdesk</a>. <br /> <br /> Thank you,<br /> Support Ticket System', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(6, 1, 'ticket.reply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>We hope this response has sufficiently answered your questions. If not, please do not send another email. Instead, reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">login to your account</a> for a complete archive of all your support requests and responses.</em></div>', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(7, 1, 'ticket.activity.notice', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a ticket in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on ticket <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">#%{ticket.number}</a>. To participate, simply reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">click here</a> for a complete archive of the ticket thread.</em> </div>', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(8, 1, 'ticket.alert', 'New Ticket Alert', '<h2>Hi %{recipient.name},</h2> New ticket #%{ticket.number} created <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{ticket.name} &lt;%{ticket.email}&gt; </td> </tr> <tr><td><strong>Department</strong>: </td> <td>%{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(9, 1, 'message.alert', 'New Message Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> New message appended to ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{poster.name} &lt;%{ticket.email}&gt; </td> </tr> <tr><td><strong>Department</strong>: </td> <td>%{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(10, 1, 'note.alert', 'New Internal Activity Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> An agent has logged activity on ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{note.poster} </td> </tr> <tr><td><strong>Title</strong>: </td> <td>%{note.title} </td> </tr> </tbody> </table> <br /> %{note.message} <br /> <br /> <hr /> To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system <br /> <br /> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(11, 1, 'assigned.alert', 'Ticket Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{ticket.name} &lt;%{ticket.email}&gt; </td> </tr> <tr><td><strong>Subject</strong>: </td> <td>%{ticket.subject} </td> </tr> </tbody> </table> <br /> %{comments} <br /> <br /> <hr /> <div>To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(12, 1, 'transfer.alert', 'Ticket #%{ticket.number} transfer - %{ticket.dept.name}', '<h3>Hi %{recipient.name},</h3> Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been transferred to the %{ticket.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> <blockquote>%{comments} </blockquote> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(13, 1, 'ticket.overdue', 'Stale Ticket Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> A ticket, <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tickets are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{ticket.dept.manager.name} <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system. You\'re receiving this notice because the ticket is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(14, 1, 'task.alert', 'New Task Alert', '<h2>Hi %{recipient.name},</h2> New task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> created <br /> <br /> <table><tbody><tr><td><strong>Department</strong>: </td> <td>%{task.dept.name} </td> </tr> </tbody> </table> <br /> %{task.description} <br /> <br /> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(15, 1, 'task.activity.notice', 'Re: %{task.title} [#%{task.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a task in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on task #%{task.number}. To participate, simply reply to this email.</em> </div>', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(16, 1, 'task.activity.alert', 'Task Activity [#%{task.number}] - %{activity.title}', '<h3><strong>Hi %{recipient.name},</strong></h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> updated: %{activity.description} <br /> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(17, 1, 'task.assignment.alert', 'Task Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> %{comments} <br /> <br /> <hr /> <div>To view/respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(18, 1, 'task.transfer.alert', 'Task #%{task.number} transfer - %{task.dept.name}', '<h3>Hi %{recipient.name},</h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been transferred to the %{task.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> <blockquote>%{comments} </blockquote> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(19, 1, 'task.overdue.alert', 'Stale Task Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> A task, <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tasks are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{task.dept.manager.name} <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system. You\'re receiving this notice because the task is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />', NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25');

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_template_group`
--

CREATE TABLE `ost_email_template_group` (
  `tpl_id` int(11) NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL DEFAULT '',
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_email_template_group`
--

INSERT INTO `ost_email_template_group` (`tpl_id`, `isactive`, `name`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 1, 'osTicket Default Template (HTML)', 'en_US', 'Default osTicket templates', '2023-11-16 15:21:25', '2023-11-16 07:21:25');

-- --------------------------------------------------------

--
-- Table structure for table `ost_event`
--

CREATE TABLE `ost_event` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_event`
--

INSERT INTO `ost_event` (`id`, `name`, `description`) VALUES
(1, 'created', NULL),
(2, 'closed', NULL),
(3, 'reopened', NULL),
(4, 'assigned', NULL),
(5, 'released', NULL),
(6, 'transferred', NULL),
(7, 'referred', NULL),
(8, 'overdue', NULL),
(9, 'edited', NULL),
(10, 'viewed', NULL),
(11, 'error', NULL),
(12, 'collab', NULL),
(13, 'resent', NULL),
(14, 'deleted', NULL),
(15, 'merged', NULL),
(16, 'unlinked', NULL),
(17, 'linked', NULL),
(18, 'login', NULL),
(19, 'logout', NULL),
(20, 'message', NULL),
(21, 'note', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq`
--

CREATE TABLE `ost_faq` (
  `faq_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ispublished` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `keywords` tinytext DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq_category`
--

CREATE TABLE `ost_faq_category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_pid` int(10) UNSIGNED DEFAULT NULL,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(125) DEFAULT NULL,
  `description` text NOT NULL,
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq_topic`
--

CREATE TABLE `ost_faq_topic` (
  `faq_id` int(10) UNSIGNED NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_file`
--

CREATE TABLE `ost_file` (
  `id` int(11) NOT NULL,
  `ft` char(1) NOT NULL DEFAULT 'T',
  `bk` char(1) NOT NULL DEFAULT 'D',
  `type` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `key` varchar(86) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `signature` varchar(86) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `attrs` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_file`
--

INSERT INTO `ost_file` (`id`, `ft`, `bk`, `type`, `size`, `key`, `signature`, `name`, `attrs`, `created`) VALUES
(1, 'T', 'D', 'image/png', 9452, 'b56944cb4722cc5cda9d1e23a3ea7fbc', 'gjMyblHhAxCQvzLfPBW3EjMUY1AmQQmz', 'powered-by-osticket.png', NULL, '2023-11-16 15:21:24'),
(2, 'T', 'D', 'text/plain', 24, 'G9HNhMWtx86n3ccfeGGNagoRoTDtol7o', 'MWtx86n3ccfeGGNafaacpitTxmJ4h3Ls', 'osTicket.txt', NULL, '2023-11-16 15:21:25'),
(3, 'L', 'D', 'image/png', 30665, 'NEPGzXxE2or3GBDo9zVQb_mA878m0VwU', 'XxE2or3GBDo9zVQbLU1B9EDuhWAqH3xy', 'logo-dharmoni-final-11.02.2021.png', NULL, '2023-11-16 15:24:04');

-- --------------------------------------------------------

--
-- Table structure for table `ost_file_chunk`
--

CREATE TABLE `ost_file_chunk` (
  `file_id` int(11) NOT NULL,
  `chunk_id` int(11) NOT NULL,
  `filedata` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_file_chunk`
--

INSERT INTO `ost_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(1, 0, 0x89504e470d0a1a0a0000000d49484452000000da0000002808060000009847e4c900000a43694343504943432070726f66696c65000078da9d53775893f7163edff7650f5642d8f0b1976c81002223ac08c81059a21092006184101240c585880a561415119c4855c482d50a489d88e2a028b867418a885a8b555c38ee1fdca7b57d7aefededfbd7fbbce79ce7fcce79cf0f8011122691e6a26a003952853c3ad81f8f4f48c4c9bd80021548e0042010e6cbc26705c50000f00379787e74b03ffc01af6f00020070d52e2412c7e1ff83ba50265700209100e02212e70b01905200c82e54c81400c81800b053b3640a009400006c797c422200aa0d00ecf4493e0500d8a993dc1700d8a21ca908008d0100992847240240bb00605581522c02c0c200a0ac40222e04c0ae018059b632470280bd0500768e58900f4060008099422ccc0020380200431e13cd03204c03a030d2bfe0a95f7085b8480100c0cb95cd974bd23314b895d01a77f2f0e0e221e2c26cb142611729106609e4229c979b231348e7034cce0c00001af9d1c1fe383f90e7e6e4e1e666e76ceff4c5a2fe6bf06f223e21f1dffebc8c020400104ecfefda5fe5e5d60370c701b075bf6ba95b00da560068dff95d33db09a05a0ad07af98b7938fc401e9ea150c83c1d1c0a0b0bed2562a1bd30e38b3eff33e16fe08b7ef6fc401efedb7af000719a4099adc0a383fd71616e76ae528ee7cb0442316ef7e723fec7857ffd8e29d1e234b15c2c158af15889b850224dc779b952914421c995e212e97f32f11f96fd0993770d00ac864fc04eb607b5cb6cc07eee01028b0e58d27600407ef32d8c1a0b91001067343279f7000093bff98f402b0100cd97a4e30000bce8185ca894174cc608000044a0812ab041070cc114acc00e9cc11dbcc01702610644400c24c03c104206e4801c0aa11896411954c03ad804b5b0031aa0119ae110b4c131380de7e0125c81eb70170660189ec218bc86090441c8081361213a8811628ed822ce0817998e04226148349280a420e988145122c5c872a402a9426a915d4823f22d7214398d5c40fa90dbc820328afc8abc47319481b25103d4027540b9a81f1a8ac6a073d174340f5d8096a26bd11ab41e3d80b6a2a7d14be87574007d8a8e6380d1310e668cd9615c8c87456089581a26c71663e55835568f35631d583776151bc09e61ef0824028b8013ec085e8410c26c82909047584c5843a825ec23b412ba085709838431c2272293a84fb4257a12f9c478623ab1905846ac26ee211e219e255e270e135f9348240ec992e44e0a21259032490b496b48db482da453a43ed210699c4c26eb906dc9dee408b280ac209791b7900f904f92fbc9c3e4b7143ac588e24c09a22452a494124a35653fe504a59f324299a0aa51cda99ed408aa883a9f5a496da076502f5387a91334759a25cd9b1643cba42da3d5d09a696769f7682fe974ba09dd831e4597d097d26be807e9e7e983f4770c0d860d83c7486228196b197b19a718b7192f994ca605d39799c85430d7321b9967980f986f55582af62a7c1591ca12953a9556957e95e7aa545573553fd579aa0b54ab550fab5e567da64655b350e3a909d416abd5a91d55bba936aece5277528f50cf515fa3be5ffd82fa630db2868546a08648a35463b7c6198d2116c63265f15842d6725603eb2c6b984d625bb2f9ec4c7605fb1b762f7b4c534373aa66ac6691669de671cd010ec6b1e0f039d99c4ace21ce0dce7b2d032d3f2db1d66aad66ad7ead37da7adabeda62ed72ed16edebdaef75709d409d2c9df53a6d3af77509ba36ba51ba85badb75cfea3ed363eb79e909f5caf50ee9ddd147f56df4a3f517eaefd6efd11f373034083690196c313863f0cc9063e86b9869b8d1f084e1a811cb68ba91c468a3d149a327b826ee8767e33578173e66ac6f1c62ac34de65dc6b3c61626932dba4c4a4c5e4be29cd946b9a66bad1b4d374ccccc82cdcacd8acc9ec8e39d59c6b9e61bed9bcdbfc8d85a5459cc54a8b368bc796da967ccb05964d96f7ac98563e567956f556d7ac49d65ceb2ceb6dd6576c501b579b0c9b3a9bcbb6a8ad9badc4769b6ddf14e2148f29d229f5536eda31ecfcec0aec9aec06ed39f661f625f66df6cf1dcc1c121dd63b743b7c727475cc766c70bceba4e134c3a9c4a9c3e957671b67a1739df33517a64b90cb1297769717536da78aa76e9f7acb95e51aeebad2b5d3f5a39bbb9bdcadd96dd4ddcc3dc57dabfb4d2e9b1bc95dc33def41f4f0f758e271cce39da79ba7c2f390e72f5e765e595efbbd1e4fb39c269ed6306dc8dbc45be0bdcb7b603a3e3d65facee9033ec63e029f7a9f87bea6be22df3dbe237ed67e997e07fc9efb3bfacbfd8ff8bfe179f216f14e056001c101e501bd811a81b3036b031f049904a50735058d05bb062f0c3e15420c090d591f72936fc017f21bf96333dc672c9ad115ca089d155a1bfa30cc264c1ed6118e86cf08df107e6fa6f94ce9ccb60888e0476c88b81f69199917f97d14292a32aa2eea51b453747174f72cd6ace459fb67bd8ef18fa98cb93bdb6ab6727667ac6a6c526c63ec9bb880b8aab8817887f845f1971274132409ed89e4c4d8c43d89e37302e76c9a339ce49a54967463aee5dca2b917e6e9cecb9e773c593559907c3885981297b23fe5832042502f184fe5a76e4d1d13f2849b854f45bea28da251b1b7b84a3c92e69d5695f638dd3b7d43fa68864f4675c633094f522b79911992b923f34d5644d6deaccfd971d92d39949c949ca3520d6996b42bd730b728b74f662b2b930de479e66dca1b9387caf7e423f973f3db156c854cd1a3b452ae500e164c2fa82b785b185b78b848bd485ad433df66feeaf9230b82167cbd90b050b8b0b3d8b87859f1e022bf45bb16238b5317772e315d52ba647869f0d27dcb68cbb296fd50e2585255f26a79dcf28e5283d2a5a5432b82573495a994c9cb6eaef45ab9631561956455ef6a97d55b567f2a17955fac70aca8aef8b046b8e6e2574e5fd57cf5796ddadade4ab7caedeb48eba4eb6eacf759bfaf4abd6a41d5d086f00dad1bf18de51b5f6d4ade74a17a6af58ecdb4cdcacd03356135ed5bccb6acdbf2a136a3f67a9d7f5dcb56fdadabb7bed926dad6bfdd777bf30e831d153bdeef94ecbcb52b78576bbd457df56ed2ee82dd8f1a621bbabfe67eddb847774fc59e8f7ba57b07f645efeb6a746f6cdcafbfbfb2096d52368d1e483a70e59b806fda9bed9a77b5705a2a0ec241e5c127dfa67c7be350e8a1cec3dcc3cddf997fb7f508eb48792bd23abf75ac2da36da03da1bdefe88ca39d1d5e1d47beb7ff7eef31e36375c7358f579ea09d283df1f9e48293e3a764a79e9d4e3f3dd499dc79f74cfc996b5d515dbd6743cf9e3f1774ee4cb75ff7c9f3dee78f5df0bc70f422f762db25b74bad3dae3d477e70fde148af5b6feb65f7cbed573cae74f44deb3bd1efd37ffa6ac0d573d7f8d72e5d9f79bdefc6ec1bb76e26dd1cb825baf5f876f6ed17770aee4cdc5d7a8f78affcbedafdea07fa0fea7fb4feb165c06de0f860c060cfc3590fef0e09879efe94ffd387e1d247cc47d52346238d8f9d1f1f1b0d1abdf264ce93e1a7b2a713cfca7e56ff79eb73abe7dffde2fb4bcf58fcd8f00bf98bcfbfae79a9f372efaba9af3ac723c71fbcce793df1a6fcadcedb7defb8efbadfc7bd1f9928fc40fe50f3d1fa63c7a7d04ff73ee77cfefc2ff784f3fb803925110000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000032869545874584d4c3a636f6d2e61646f62652e786d7000000000003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e203c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e362d633031342037392e3135363739372c20323031342f30382f32302d30393a35333a30322020202020202020223e203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e203c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f2220786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f2220786d6c6e733a73745265663d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f75726365526566232220786d703a43726561746f72546f6f6c3d2241646f62652050686f746f73686f70204343203230313420284d6163696e746f7368292220786d704d4d3a496e7374616e636549443d22786d702e6969643a36453243393544454136373331314534424443444446393146414639344441352220786d704d4d3a446f63756d656e7449443d22786d702e6469643a3645324339354446413637333131453442444344444639314641463934444135223e203c786d704d4d3a4465726976656446726f6d2073745265663a696e7374616e636549443d22786d702e6969643a4346413734453446413637313131453442444344444639314641463934444135222073745265663a646f63756d656e7449443d22786d702e6469643a4346413734453530413637313131453442444344444639314641463934444135222f3e203c2f7264663a4465736372697074696f6e3e203c2f7264663a5244463e203c2f783a786d706d6574613e203c3f787061636b657420656e643d2272223f3e8bfef6ca0000170b4944415478daec5d099c53d5d53f2f7b32c9646680617118905d3637d0cfad282aa82d0af6f3b3b62ef52bd6d685ba206eb54a15c1adf6538b52b4d53a564454a42c0565d132a86c82a0ac82ec8b0233ccc24c9297f7dd9bfc6f73e64e92c90c5071ccf9fd0e249397f7eebbf7fccff99f73efbb31860f1f4e593936a4da74d2d8eeef53b17f2f51c4fd5d6b7e4ba19385ee177a9bd0ed8d3e832534dfa4d2351ebafaad3cb2d92cb219cd636c6d59f3ceca11920b849e27f4c742af68f4b7a342f34c5ab8de4d3f9b12a4b0005d7301991447d63ebed7e2125a283457a85d680d22d2be26463405995d8dfeb63f4a4b44241bfa463e5902642d7d518a5a59a065e5bb29ad849e2a7480d0d384b617ea05e024bb89080d093d287495d0e94267093d90c1b9edf85f82b4a2d19451006dc65617ed2bb3538f76618a449b57c76781f6fd908e42af14fabf42bb65f89dde42af12ba4ce848a10bd21c9b23741803f3bb42c709fd6d4657921015003b74c8205f8ed9ec4096cdd19abf7884de2e74210cbf5b13ce2123e05ca1f7e37cc9e45788921c3af703d80d47b3a049b3b739e989d21c2aca8d36cb81c802adf94a6ba15385fe41e87147c04e1e018dbc00399da49b4542ef4d13b97e2d343fed999d16d57ee3a0498b7dd426b779e56559ead8fce504a16f0aed7584cf7b2e72bbbd426b01b8d6691c763f8a97fa1f4c471bb71db4d194b51e6a17c8022d2bdf1d9151e695a30032253ee47c99caef285ecd1c9b92df0aea58e88fc672b3e654d2cf52c7e62d922af6ff96ae2de3d152a1cb8556b1bfcb4249cb3a47ca54cc23fec93569fe1a0f4522061946f31d946c443be65c5fe470befd736aca64f19193f5427f227487d00e427f29f432e477dfc4efcf8abbf76094e6adf4d0a4955e9ab6d14d6e41218de63cac59cb3e86bc9e11a592eda79019f60aab6b74f54de64a7725f9bb9c3c2eff0fddc2c342bf04555c47f142493f11e7a6935d00cc6fc6d0f4e55e07fdf4a502ba654690262ef791d76191c76135efb1cd9af7b123d2a36f3e14a4903d4c5eabd1fe5d468e9edadf4a854e04008347b9f9e385be56871afaa22171232119c50e96dbe9c036173d58eaa7399b5c541532c8efb2a87bab08990263d1e68db32cd08e297a61086bb36cb4fa4031f5cfdf127b9da104845ea3fd4d4694a1145f62d5e62837fd39a1a312ad11912b274aabd67b68f1976eea901fa1055b5cf468690eb5f34763343127271eb14debfb31b68eb3cf3e3b6be1c7904c9bbf8cdedcdd8bfab7d824dc7cc67ef02c8a97dd95940178df20b66c10dae22834572ed31a416ad58808c2729de2e37372c914579db5c94d0b05d00c579472dd227ab5689eab3eb211ed3b99a75994e7aa8a17452c8f30de8c5cbe5c31ef62ef1f12ba04afe522e12784be91c178cbfcea75d04c59ccc8a37839df29b412f95e5b009b50f45856e70c820e4e58e1a5cdbb9d542822598fb689758bdf57906581760c8add885255d843353541f2d84399d04759363f91bdff40e8abda316b8456537c82399dc849ee0758cae8a3c42a907244ca2280f64ca18384ce8e013d2a401834e9ab3d4eca775a146a19891539be2570c9f6ca2561edf17e8fd079420f6581969598f8edb5b4a2a20d95ecec4bc33b7f4854eb6fe82b8329be1e51c95f11c5b874a1d4eb1489196349ec559ec8b142229456daaac856673e4cca761457a653e2319b7cf258bbb6ee70d1b0c979b4eda09d5a78a37252ad1dc527b723a0b029fd0bc5579a48aa5b20d48df6ca08bab109dd2823f23d4207328afb43a1dbb240cb4a4c2c11481c24cbddb528f11b149f074e29329aa9b027170fbf9be498ae1ab5d42f2acff027725a9f4b44dcfb561e9d2828dfd567098c1db2c59b107b80c650935d6159c720b96adf8a3d42b39d0a22347e6e80566e7752f7b691588e46f155ff72517315ce904a64e4dc041a7abef437147f22e079a13765a963568e8a14b8aae9fdbddde8e4e00eea259442fe5460cb038553f24fd03b5d4e4e79b15819de7a37e2b61e731cb4d17df302f4e4877e6a2fa8dfac0d6eaa0e1bb4b7d246c37ad7d0c80b2a880ec46696db89e6b48c3529d7dc459ee8a1454b7cf4d66a0f15b73415c808f91c01340d492ef2c2969478b6cddbc42e8c6ac0361b88a8474a8e475ff786d39891055a7a31601c4e78e3508ae33c38a6065efec82418369376d40468555911f50aec8d47b6e4f36a72deac2f5eef448ea58ba461dd539aa3db9a496dc2b74c9c951b1afb5e20669d9d5acb0286413336ba636b0f0f08a0e57b2c1a39a052dcb14057b55125a0b05ae464f3b7d718e3576df6866f9e9627724b8a1dc74af68af65530c33759dea7447e26172aaf07d8f2d1ff9587317effe985263d50483a09efc76581d6b0c8817e01b98f7cd46434c59f3ae6d287e2eb0adbe3987b8ed4c5a30254c7b92b68b22cf38b88d6397777aacd7ae4fc5800afbf04fdd2e5062d874b80cc4e2f52dbf0cdcfcccc0ddd332d488581682b9f61150b70796d762bd2ca67c9a7a537b7f24523f3b63ae9ea92022ab9f28004db12ea5a3b78f906d7ce817715c92a89af4b71a83857e05180cc0580c8b63c04f07b589e269dd2a39478505452cf3b50c49120fc239c979b9ab225c2b727ed19c8482fbc648196a22641f179a90ef83f999517a0b2e54c6ac8870b36e1903d22b2391ca174391a5fa8bb32491e24dbf500e94bed2cda2d22d96801b2179ef9672eddfe76b0b038dfbcc9618b3da8d99e5d4d562a17442d7ab263303a7ff27a3779dfc9a347cfaf282f793dbf7cd2a75e5bb9d3bab66361e41671813ed1ba516a8bd0c729be624497afd96b79839f4a40e3fdd66398e5a44b96b7a1a0a36c657f16680d4b84d1c50329a8e341786e19fd761f8d46380d934ab69d4277772a25476c5ecd96cc8b2af944fb4c56dcfe86aa20972951d378c0e631d74e1054f1376fe69dd12edf7cce65a753a256ec3e5e84d1c8fce807422f911a8ed2bdc707cd715345def6c53e3b2ddeee143431fa74aff6a111a66944c5e7938d3855947d271fd11922f44f42cf107a9d9623f19ccdc5de77a2f8960b76383bb984ec1f49ba463ec83a18d4b91011b312e3b080e24f103444e5e5b3729782d606e18cc653dd6df22ea6f814462125a638e48a9b49ac827922faba9386a78be18465db2a1c48e04e45c366a3027435c5e74b1623c1ae4c929b0c42e2e7c54517c13311e3d936500895a0cbfd248a1156373203f6e33b1edce81e50221931fac393c8b9a0f9e0f2c40ca115dab91e83d4055c7913a8d520e42816aa72ff22aa57b23e139d9583aadd7a16fa53f17d1b8b14ea7c3f419fc8364ea3f88a0c79ce8b700e3948ab9200a2ad8a1ec436c2310c8b361fcaa750d41e075a7d69cd220fa78db2523706c512259206de4fdee8c48dfbedd18b1f6b4355216a2f403631e0b27a09ca27f3895b847ea5e577d7a3fa375600715fae2bf67dea986f5e651834221436b6898ebdc2a80ff47384fe1db6f421c5d75c72e2ca6b9e4a4e02ad54f29724409351f74eaabfae53c9f9a0a5e9e6cc241b795a285f16f53aeb7be9c0e4130757012c94a40db7012f8310b975b9041a73d60e7886e7d1b07168e80fd817e682e7abd02e9fde7d099e8a8b1cec6728be625b1ad673f04c37e3fc5246a1e42baf251fa128c1df47c33822f03412a47281ea29da3556c218168236498fd91946f50d3aef200658523e39b1da513b4729dab412efefa6f813c05e96d34cc8b052c6238bccd32e637f1b05e02fc2a0f5c0352f64d4497a6639b92ce79be6087d4f672b3e7b38be06b2be7871ef2aeaeec06bb9825edf5a6035a2ca72b975c0dc751efabacaa016bee81d22924990cd455b7507548b5cb50ad1718cc8df66e5ba2de90ccfb5e2cdba2f49342538b47b30c63722572b6ba01fab01bc54858c47615fe9641302433ab6f6a80632d9c6e1b8df7600dd59ecf3b5c82dbba3df7bc0b6fa30c79f4eec3656fdf1c2e0fb2131fd9a798817019a020040814c469979e8401f3af63a78e6103aac2f2b459fc3ae752e5e0710663d300809b25718c85622628510a64bd01935ac3347a0ed8468741e0cb823c02bc1f5193e3f0bf7e0c7bd3d82f698308e7d309ece1974a0c9bcd710b4750dfe5688b6ca39ac298c6674d1bc7e3bbc9e579f395874c874c68a23290a364578fd3972a2f3e138b8bc1feb5f4b80cc1fa5671704e80e919715e644fb8a9cec06ac9abf2b09c8b8bc0a1b90ece15aadf4fe759aef2d40df47f0dd4ccaf2a9a2dd4d1ac8c2601fd2f15e4ef10d825e461008a5c8ab09c7ddc8decf60202314b8ce624ce54644da7e9478d68e40379f84d31f053ac9dbfe216cf23119c06c1a979527fe394070298b6203e1010650624ee65550aef371ace2acf701040bf1fe7480e838189d92229627aa0d5c2621c2aa05b2b7e3264f4747d78262de0b6e1d66605d0bca3012e7e8064e3d1c6d3f9112cf6bf5c2ebdb1958ef46243f1714b5b1320614fc62500a15b106c1d89570b6309819eb7bf5124541196f68bf8c7caeea64f9591eebb7452cc7716a51659830d7ed5460d2cb4b7c3462662e15e444c9668bf5878cda6fb3e89e4ed444f87fc381aad2fd3d6c2c75d98131b95ca3a48d957614df558b8bbcee50b09a77c042ae475ffb293117a700bb034e9f6fa9b00481a196a51043d8e712c47fc6e726d281fbd8e79781cd3c0150717eff36aaaeb29d636d5a989ec0e6623ec609945c04a35586f104a302ff82272018f879f83e21dcb646bee447b42c0705cd47e408b2ca4d4f16c966200fca017551e7ec0bc0d5e0fd6e78aaa9888aaa48f019724c173cdc348a3f662fe517a07152a683ea124acabf078dc9a41225650522a389c8328e1d73211cd6a78c21a81caf27f37ecbeb700d234a65110fe5b92b523d759dcbfa6d03a35e4abe821155927ca8b2ca46ef6f709343bcf60bfa28685f6f16493399cc5d0e70754234fb2bae712ea2d6431897028db6495bd9494d9b6754116d288bfc0446f287469c672f22ea5896b7ae41fff05d99af003323b0a82949ce3507e3ad72d801acc063d3a87dcaaae347dafb8540a90340511bbe7c00bac2450128884e919ee57794d8cca5150cfe7544ce4b0096fe68d42ae459aa43a5112e8331dbe0557258343c9e79a2c5cc903bb2c8f95f42bf40874431707e166d78de56cbdeaf03e8bb6708b4355a65f22b78d0e3e048b602cc27c3500d44e9beac9feb806c77ad9ffa04f6500719cdcc64f978ec3e5d68f716fcad428bb09bd50f47bcbed447afadf052b7c2887cc8d260fd9ce98f51ec8113ea0276f011a2dbd3a0c00f42bf86432c45eeb688524ff8672a03b5f72f36f2fb39a070aa382103c4ad8ce613ec94afa07122425a0c3435781d4832c5a2072d473aa09949383325a9bed524f1827c998b1b615919db190015013c1edcb4a45abd19c857b39bd80f301bec26aad1e6cf61546ecde055b9d8c3a2d35a749a9d1213a6657008aa1ad8d4690e2345bf998c46a836ce06fde90c2adb07ed5c0be7f36f17bead26482709903dd06336b96d2210c4b636a85710e9c61cdc4a561451530f712aeab2a862a793a62cf3519ba0a99e64b6b17bce34d2f07b72b2b11c08ca7521c6b21fe8d71046a16ea3a62de8b592cc17963761aeed4cadb89183ea376940e37b509e4ce996ae252490c206281dd0f42771fbb063b6800214c31b77609e946040f90c8835180809b40b1065f6c0b0d4e31a97b2c8f239c01566d5a3a19a975625f508aeafa2939d4d2896c3abfa71ce61f0faea7307bedf17f75180e8a8775ecb0c9377d20a1c525a30c7b28b45cd4fe0746e60c587c5e897b86559063dde6d2e15f9f7922706325faafd434e60c6ae8a2821966bc7fb4dd0c48dfb1d34759d9bba251ebc3429b18f48a65b1cf8d02f11aa3b191b01f5fd107d5c8cfe389b152ae458fc8cd4063d4d77680d1a740ad1135c2722dc0ac684ec5a7e1b4d33b513812d39d938da523889a41f0e67865f4075574e7fc0e634bab2ea939acfb99b356235cbf3545e520c63530f10560268a762e03e62002318e48fd8353aa12cfb77cc6354a7a8506d619dd70ff9a2fabc27a620fe0f45096530c35815d48e42498b46785c791dbe95c055ecf522ad38a1728e1fe3f55bfc8445de723a217f0b051d358864494196c768ed275a345774b0b681b6af67ce3413e986b2f676e43cc751fd5d882df4ff5c140706e2d8412812351560116d0e2caf09e79a8cc2899256a81afa5864afd12aa6e750628ef53ca61742252bfb23632e562aa0e911ed14508e1994982c56d59979283a8c00b04623227c4675378699c1aa6c2b0028bf96b4efc580f462f3149fb282cc6078da975052fd1237d59d150f2a29f92e5e5528e85c8ece9c8af73b0186b6e884ab50d0990083790305971e1ac01b0299eac7f1e8fc001c886acb1bec3899a7fd1ac704d01f1ff393dedd7901d9648551e665a99fae1e0c5af309c6454fc0b7fddb68c206752988d0d0eeb5b468bb33b6210e9b5b5355c427a8e15f8c198871fc1ba2f5c7282efd94524f0eaf42d1621cf2ba579b18d1b668efafd48b470dc84e14abd6c0299eceeee90e7c56a61546fc68ffc126445deef4ea453413206b8f12797f366877e2f517a03ddfe0c43f44a9bd279bb3b99575fc622de1547310fb984795b29479ad7988ac07603897a20cdf1dc73c850a612b56c20d68f73209f31f11789aab31d7d1964d41bc817997296cde6b24b8fcb3ac1c1d4891c3799937fc1cfd740da2956acb48f4012f362dd34ac075263c7d22a251c4956e407bb36af04b1ab52e60112d4eb1420605da86e99ad3ab687fb54d2f5e95829d5cdf80111531765302c32f474a509421bd360f23a2bda339b611193a4362fdb10bf6f080e6181e44c48d52dd5fcc398df886430d8bfe53555d5345343bbcf218d0421faa6faf22a228f907f8f7507829278ce503ccb570cab20f03d409de9dd39c7b01885012ef340509fee5302c17403a15d14c958d7f815c6a13d55ff0f96718f930388230ee63068b2221dceb2c783737aef11a0a149df09d64fb227e8168e083e793e7ba19f9de7e50953949b8fd2c4653e7d43b6b6d4046323f0a25fb357a7c3afab83568d044eddb43d87447c254455493e57d2dfecb717a1ce77b0aa5fb6949eeb31051bf330cfe23e6cc6474fe2dc621d91c4457440cd223772365261cb09a1af1c0514e44fb7781950c80dd946aed71b2a2d47b70a4a318061e076b9b08a7a3162bdc8f7b180f675a0bc7ab72d0a56c0cabc122fc6c8e6d246cdb702449123f8031bb603cc9f8cb3a2493ea07ec4269e6629642939d635d9acedd806b38718db0768d43946492579315e87855de0f27b91f799ebfc0a118aca0f05192e90e2e07883d6f0419858133b581568598202596fe7c46f5d73d8a56ca072bad9e18248b45275e391b4ff5374bed01cf4cf51c83e8bdb25a1b850e19e4c8abb349ce3478f88761b0cfc24195e13ecec4679dd08fb7b3b3be00605f0b631c073a1ac1980d46b42844e49d7e184033d1b73329b1be533ab8df205f3f08f0b580935ca84d29e8b4ee1938d67e782f03c6efc1c64621d5506ee97f702f07d8bde502d8250c685b70dd8b5865732cdabec491a20a6965904cd311981fc9440ef7814a4b4b728fd675944198294ac0772202f664b4b1fef2a5785eb618cce257c8fb0a700fd310c9e624b9c60044f728a22d8b5d069d5d14a2d33a86686bb99de76984fc6433febf15aa8ff12bf0ee3bd8df556efe340a4bc9b650280350c768fdebd70a3b5e061ebbc6b2942c075d7c9e018458becbabb105547709569ec6de760004bc10750baabf8fe0be9e625328c114d5d9965a3f3d0c6718607892dad1a135c04d59391a92835c53816c33a8653a59096ae6426ea976a14a3597730306fb7ad27f9d53d0c62e27d4d2259b6a68cc9c80005a3d5ff01aa2f3a598f66801606f06655b9ae2bacb29f123f132a76907b0ec039d9f4dc937d7998e625618f7f515ab844e4074f253fd5f195d8aebfd08ff7766154875cd994865a6e37f0b6dd0e9ffdb486b06205ab544dbbdf8ee2728989d838ab91f4e541ebb15e77c5f3be722b4eb564a4c8dc99469bef1f2cb2ff742688ca0911bb3b838e222a9c62fe12177c2fb7f9aecc0ebca4635e5fc7654212b51c1ad2f4193464f0fd298d21cea10349b439f1a70306a43950a4acc2736b8a3519a7ed40b377644332fd84235a8aad540db5a2070c9e3cbfe5f800100b3e0af98735d4afd0000000049454e44ae426082),
(2, 0, 0x43616e6e6564204174746163686d656e747320526f636b21);
INSERT INTO `ost_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(3, 0, 0x89504e470d0a1a0a0000000d4948445200000357000000de0806000000d195fa7d0000000467414d410000b18e7cfb5193000000206348524d0000870f00008c0f0000fd520000814000007d790000e98b00003ce5000019cc733c857700000a2f694343504943432050726f66696c65000048c79d96775454d71687cfbd777aa1cd30d2197a932e3080f42e201d045118660618ca00c30c4d6c88a840441111014590a08001a3a148ac88622128a8600f48105062308aa8a86446d64a7c7979efe5e5f7c7bddfda67ef73f7d97b9fb52e00244f1f2e2f059602209927e0077a38d3578547d0b1fd0006788001a6003059e9a9be41eec140242f37177abac809fc8bde0c0148fcbe65e8e94fa783ff4fd2ac54be0000c85fc4e66c4e3a4bc4f9224eca14a48aed3322a6c6248a194689992f4a50c472628e5be4a59f7d16d951ccec641e5bc4e29c53d9c96c31f788787b86902362c447c405195c4ea6886f8b58334998cc15f15b716c3287990e008a24b60b38ac78119b8898c40f0e7411f1720070a4b82f38e60b1670b204e243b9a4a466f3b971f102ba2e4b8f6e6a6dcda07b723293380281a13f9395c8e4b3e92e29c9a94c5e36008b67fe2c19716de9a2225b9a5a5b5a1a9a19997e51a8ffbaf83725eeed22bd0af8dc3388d6f787edaffc52ea0060cc8a6ab3eb0f5bcc7e003ab6022077ff0f9be6210024457d6bbff1c57968e279891708526d8c8d3333338db81c9691b8a0bfeb7f3afc0d7df13d23f176bf9787eeca89650a93047471dd58294929423e3d3d95c9e2d00dff3cc4ff38f0aff3581ac889e5f0393c5144a868cab8bc3851bb796cae809bc2a37379ffa989ff30ec4f5a9c6b9128f59f0035ca0848dda002e4e73e80a21001127950dcf5dffbe6830f05e29b17a63ab138f79f05fdfbae7089f891ce8dfb1ce712184c6709f9198b6be26b09d08000240115c80315a001748121300356c016380237b002f88160100ed602168807c9800f32412ed80c0a4011d805f6824a5003ea41236801274007380d2e80cbe03ab809ee800760048c83e76006bc01f310046121324481e42155480b3280cc2006640fb9413e5020140e454371100f1242b9d016a8082a852aa15aa811fa163a055d80ae4203d03d68149a827e85dec3084c82a9b032ac0d1bc30cd809f68683e135701c9c06e7c0f9f04eb802ae838fc1edf005f83a7c071e819fc3b3084088080d51430c1106e282f82111482cc24736208548395287b4205d482f720b1941a69177280c8a82a2a30c51b6284f54088a854a436d4015a32a514751eda81ed42dd4286a06f5094d462ba10dd036682ff42a741c3a135d802e4737a0dbd097d077d0e3e837180c8686d1c158613c31e19804cc3a4c31e600a615731e338019c3cc62b15879ac01d60eeb87656205d802ec7eec31ec39ec20761cfb1647c4a9e2cc70eeb8081c0f97872bc735e1cee2067113b879bc145e0b6f83f7c3b3f1d9f8127c3dbe0b7f033f8e9f274813740876846042026133a182d042b844784878452412d589d6c4002297b88958413c4ebc421c25be23c990f4492ea4489290b4937484749e748ff48a4c266b931dc91164017927b9917c91fc98fc5682226124e125c196d8285125d12e3128f142122fa925e924b9563247b25cf2a4e40dc96929bc94b6948b14536a835495d429a961a959698ab4a9b49f74b274b17493f455e94919ac8cb68c9b0c5b265fe6b0cc4599310a42d1a0b85058942d947aca25ca381543d5a17a5113a845d46fa8fdd4195919d965b2a1b259b255b267644768084d9be6454ba295d04ed08668ef97282f715ac259b26349cb92c12573728a728e721cb942b956b93b72efe5e9f26ef289f2bbe53be41f29a014f415021432150e2a5c529856a42ada2ab2140b154f28de578295f4950295d6291d56ea539a555651f6504e55deaf7c51795a85a6e2a892a052a67256654a95a26aafca552d533da7fa8c2e4b77a227d12be83df4193525354f35a15aad5abfdabcba8e7a887a9e7aabfa230d8206432356a34ca35b63465355d3573357b359f3be165e8ba115afb54fab576b4e5b473b4c7b9b7687f6a48e9c8e974e8e4eb3ce435db2ae836e9a6e9dee6d3d8c1e432f51ef80de4d7d58df423f5ebf4aff86016c6069c035386030b014bdd47a296f69ddd2614392a193618661b3e1a811cdc8c728cfa8c3e885b1a67184f16ee35ee34f2616264926f5260f4c654c5798e6997699fe6aa66fc632ab32bb6d4e367737df68de69fe7299c132ceb283cbee5a502c7c2db659745b7cb4b4b2e45bb6584e59695a455b555b0d33a80c7f4631e38a35dadad97aa3f569eb77369636029b1336bfd81ada26da36d94e2ed759ce595ebf7ccc4edd8e69576b37624fb78fb63f643fe2a0e6c074a87378e2a8e1c8766c709c70d2734a703ae6f4c2d9c499efdce63ce762e3b2dee5bc2be2eae15ae8daef26e316e256e9f6d85ddd3dcebdd97dc6c3c2639dc7794fb4a7b7e76ecf612f652f9657a3d7cc0aab15eb57f47893bc83bc2bbd9ff8e8fbf07dba7c61df15be7b7c1faed45ac95bd9e107fcbcfcf6f83df2d7f14ff3ff3e0013e01f5015f034d0343037b03788121415d414f426d839b824f841886e8830a43b54323432b431742ecc35ac346c6495f1aaf5abae872b8473c33b23b011a1110d11b3abdd56ef5d3d1e6911591039b446674dd69aab6b15d626ad3d132519c58c3a198d8e0e8b6e8afec0f463d6316763bc62aa6366582eac7dace76c4776197b8a63c729e54cc4dac596c64ec6d9c5ed899b8a77882f8f9fe6ba702bb92f133c136a12e612fd128f242e248525b526e392a3934ff1647889bc9e149594ac94815483d482d491349bb4bd69337c6f7e433a94be26bd534015fd4cf50975855b85a319f61955196f3343334f664967f1b2fab2f5b377644fe4b8e77cbd0eb58eb5ae3b572d7773eee87aa7f5b51ba00d311bba376a6cccdf38bec963d3d1cd84cd899b7fc833c92bcd7bbd256c4b57be72fea6fcb1ad1e5b9b0b240af805c3db6cb7d56c476de76eefdf61be63ff8e4f85ecc26b452645e5451f8a59c5d7be32fdaae2ab859db13bfb4b2c4b0eeec2ece2ed1adaedb0fb68a974694ee9d81edf3ded65f4b2c2b2d77ba3f65e2d5f565eb38fb04fb86fa4c2a7a273bfe6fe5dfb3f54c657dea972ae6aad56aade513d77807d60f0a0e3c1961ae59aa29af787b887eed67ad4b6d769d7951fc61cce38fcb43eb4bef76bc6d78d0d0a0d450d1f8ff08e8c1c0d3cdad368d5d8d8a4d454d20c370b9ba78e451ebbf98deb379d2d862db5adb4d6a2e3e0b8f0f8b36fa3bf1d3ae17da2fb24e364cb775adf55b751da0adba1f6ecf6998ef88e91cef0ce81532b4e7577d976b57d6ff4fd91d36aa7abcec89e29394b389b7f76e15cceb9d9f3a9e7a72fc45d18eb8eea7e7071d5c5db3d013dfd97bc2f5db9ec7ef962af53efb92b76574e5fb5b97aea1ae35ac775cbebed7d167d6d3f58fcd0d66fd9df7ec3ea46e74deb9b5d03cb07ce0e3a0c5eb8e57aebf26dafdbd7efacbc333014327477387278e42efbeee4bda47b2fef67dc9f7fb0e921fa61e123a947e58f951ed7fda8f763eb88e5c89951d7d1be27414f1e8cb1c69eff94fed387f1fca7e4a7e513aa138d936693a7a7dca76e3e5bfd6cfc79eaf3f9e9829fa57fae7ea1fbe2bb5f1c7fe99b593533fe92ff72e1d7e257f2af8ebc5ef6ba7bd67ff6f19be437f373856fe5df1e7dc778d7fb3eecfdc47ce607ec878a8f7a1fbb3e797f7ab890bcb0f01bf784f3fb3704291e000000097048597300002e2300002e230178a53f7600000021744558744372656174696f6e2054696d6500323032313a30323a31312031333a30393a3132f238bf4500006cd749444154785eed9d0b605c559dffcfb993c7a42dcf552885be7823569236a1499b34a9f800451157055c15585c81d51551db02fed79a75913e54601717d4758545055ce4e1ea82eba369d39294a449d82a6f689bd05210b514da4c2633f7fc7fbf7b4fd23ceeccdc3b7367e6dec9f7a39739e7dce9e4ce9d73cefd7dcff99ddf914a290100000000000a8b615c1459bcf86dd34d534c1395d1691169ce90323243986a9a6118d34ca9664821674845e7a59a4626db74c1794979a5a6715a097a0ffd23fab8413a6264d5c5c8b88b0b29e39c1742d141e54a0cf13943c8985026bd8f5ee9502249797e95b108bfaa041d46cc348d58227130168b89d81ffe2028bf3a419f0300c800c41500000000409e209124ebea561f5b56356d0e89a439d25027929839892cb01349d0cc93421c476f23d114789274b0807b8d8ebd23079991afd077e0f41e7ac79e4442ec7df3cd83af6edfbe9ac51d00530e882b000000008022d2d0d07a78245239cb34e4cc88218e55521e4f02ec78122d270829e6d05bf838960e9ea10a036c5cfe890e125d8a0ef932d99b0342cadd24305f12c944bf69c6fbb76c59fd67ebdd0094101057000000000001c7305acbeaeba3278832312f22c53c1260f349789d28859c47a7f998c56fe3f78688834aa87e9262fd24245f5242920033fb59802585312087f7eedcb2e55b3c5b06406880b802000000000839279ed81a3d7676e589653272b292ea64763d94529d4aa61e1de2043ac226bc1836525fa1ffbe48dfe94512603b498ceda0eff6bc4ccae7b76c59f5b2699a306441a080b8020000000028614e3bed9acab7be75e629aa3cf236a9e4db8414a74925ac573a5d69bf2b941c20e1f502bd3e4fdfe505619acf26957cda30079fddbc79f5abf65b00282c1057000000000053108e56d8d0b070bea8906790d83a4b0ab94049f50e7a3d854e87657d572afe42c7334aa8a7a5104f0965fe3e19974f7676c6fa4d73b569bf0500ff81b8020000000000a3d4d4ac9c3e63c65b1790bcaa262b718194e21d547c161d87596f08376f92e07a8ac4e47625c51fc810fe7d7c30f67f5bb7aee6888700e40cc4150000000000488b61b41a8b9b2a4f2f13f26c258d3a125c6753318bae0aeb0de1e755b289fbe87bf59842f48ab8eae9e8b8fe05ace9025e81b80200000000009ee1201ac71f3fad5a95b1d0527552c8c554cc2e85a5c2eb64276f23c1f5b850b22b31241eefe858f1923e07802310570000000000c017962cb9e958a3bcac4948d144a264291555d311f6f55ba328a17693f9dc41a90e99908feddb77b0071b2683b1405c010000000080bc5057b7ee88e874d94c626b3965f958404718c3c2a782f7e1da4ae6f44621cc4d4307629d5d5dab0fdaa7c05404e20a00000000001484c6c6d6635479d5bb0c25ce21c1f56e324567eb53a5429c4ceb4e29d56f4d257ed3b169f071d35c9dd0e7c01400e20a00000000001485fa65ebce2c8f88f72b25df2fa558424565f69992e17525d46fa4a91e3513c947b66cb961b72e07250ac4150000000000283a672d5b7bd46111e35ca9c4878414efa3a219f69992818dee27c8f47e5826130fb5b75fdf6717835202e20a0000000000040a2b12e19c69ef51525d2885bc808a8eb2cf94143b496efd4c24c5bdeded2bba751908391057000000000020b09c76da35956f9d79c279c2101749213e4045d3ed33a50359e3cfd37fee9349713709ad67743108211057000000000020142c58d03ae3c8a3a31f51d2b85c4ad14445a4b74a8e4eb2ce7f2813e21e125a6fe832101220ae000000000040e86868b9f1943259713925afa0e318abb0b47883ccf4bb452271fbe6cdd7ff5e9781800371050000000000428bed3678fc47a594570b3be260a941e6bafab514ea5b5b365dff6bd33461bc0718882b00000000005012342e5f5b2784b1520a71216523766949d12794f8fa964dab1e84c80a2610570000000000a0a458ba74edc94685f1254ab2db60a555585a3c2154f286f6b6ebfe47e7414080b8020000000000254963e337e6cab2b2af0a293f45d952dba098f9b51a4e7c116bb28203c41500000000002869ea9bd79c5a6e18ff4ca6ef47755129314cf6fccd4307065bbbba561fd465a048405c010000000080294163cbba6552ca5b29596d979414cf25cde4e58f6dbc6e8bce8712c330ca4e38e18433e9777adbc0c0c07d26a14f8502882b00000000003065308c8b224b9b177d862ce03552c8c37571a99024dbfe6b8f6d1afc8669ae0e8528994944cbcb9ba561d453f66c3a6ae8a8a2e3df76ecdaf5597a0d151057000000000060ca51b76cdd9cca88fc9e14e2bdbaa894f8c5bed70e5eb27dfbea37753e30cc9d3bb7ca506a392990f3a494efa2a2d3e898b819f42029c35376eddab55be74303c45581686c5ef321298cc554755895db28d547bfc0ae645c3ef4d863ab76ea523085696a59db4bcdb25a08f3daf6b6eb6ed1c5008010b064d9da16c390d4c7ab28e7a5126709298fb44e4e801ebd3bb9ffe7b4146a9f489a9deded37745a27010005c3a046bba479eddf91657f3365a7d9a525c336357cf07d9b37af7e55e78bc6d1471f7de4e133667c90c4d45f53f6dd74f0cc546a94fad68efefe2feb5c2878f4b4d32adff7dc7371b9a469cdb954af56e9f282400f95bdf4507946671d51a6e824d917e3747228f6f4d6adabf75a2742063f6c2306375836985312134adc72e08dc1b53d3dabf7e9324f3435afbd8c1ee297ea6c41890f0e5ee2e5f759bcb875664555d53d3a5b504c53adddb269d5a33a1b28f46ff8439dddbbbb7f70fe8b2faeb6da40d0686c59775d2146fac61aa02951aacf54d26a378f6d5ad566951519dfef0f7dc7f68dabaed5b95073e289add1e3e7441fa43ed112207e508c76ddd8b8e67419612125f4a059da3ede2dd4de559b1272a34c26da0a21b61a9bd7dd23a598a9b3b9a1d4d3bb0762d716bbdff2f53ba5a0bd6de5729db4a0fefb66eabf0bbe8687eda9cd1b575ea2b320071a1b6f7abb2c2ffb19254fb54b4a86df1f3493efdcb6f1ba3fea7cc120e11a993d7bf6bb0d3b1cfe0574b80d897f209e48ccdfbd7b77c1af391bb6d59cfd7659669c114fc61fabefe9d92d1b97ad196bd085814e6d703dc3024c9a6ae7e6cdd73dadcf058aa6a66fd48b48d9064aba3522f6264d754936066263cbdaaf492157eb6c4149c6d57c2f336f4b96ac9d17a9903b74b6b028753919a977ea5c60b00dce2abe27870c02a56e09aa414dc6cb0fc978b94c670388ea534a3ecdfd844c9a0fb5b75fdfa74f14847cdc1fa5cc0b376fbcee219d0d2d4dcdeb6e2231729dcefa4381daf5c285ad474e3f3c7a31899f6b483c9fae8bf3498c9e77f74a33796bbeea7053cb3aee77e6d9393f508feeee8f5d584c81e5ff779a0c89ab712e4cf437f959df62e70aca4eba96f93a0d72a4ae6edd11d119f25e4a9e6b97940cdb626f1e5c56a84882279c70c25bca0ce33352ca2b293bc72ef5c4b777ecdac57b940596fb172ca838a972c687a923f828d91a3f5fb8edf1ff1cd9d479925b201b79334f88d6d39ba38621aea1b784a18259a37d74fc4a25c4a341115b875cbcbca0f625e3a2265737c191df917e43eaece545b919026a1f19aa8f4ababfc234fbf2f1906f6abaa95a1806dfab0b48ec7fc82ecd9a4e21ccfb92a6ec0bca4c46269a5ad67c4108835d12c6128b0f0ece0fc3ac2dcf46462aa3a71b52ce9452adf26914df4f76524ff75d33aeee2d860bae3dd062d40b259bb3addf74fd4fefe91fac09ea6ca61bf4c0ca5394cc62d64a3d4afdd05da6527b0bedcdc0bf9f32caae24c17c3165335d7b27fd586d4aaaa1b11e18638918e2742a9f49f5612e7d261be42e84807ad434c5adf99ca1e3d938d390332352be97ac037af667db8e8b2fb0c6c2bf5f5246d8a669a16721db358eae9a13889168bf934ca587f937f4fa2ce13eb1ac325a6dc8d1675a0e33696a1fd5953b924afd2aa29231b88fe617c3682d5bba6cda1d428a2b74514940f5f8decd1b56e47596930353545556b237dcdfd131dd2af4cea088c54edaf1ca2b2feb7ca0e8a9ab9b638832fe7e543fd423a648ae5ad8d5f59a7dd66692b89a884bb7361750e720e421a35c91c12ec513528963a9e3196bf8b39b45aeee227be9f31f4a0e8bb5c55acba46722fe42c96c8c883e7a3035f8f9605aba6c2dbb7ff20ca5a70e9e474d876383d716d290b1dc6dca8cdb29e9711450f58964f2eab03d78b49b24097187df26c0b357e9686c5e7731198d2c16b33528b8ddeab6ab62d44b6de51419468be9bf236d2acb51e2fc1ba9e9d00283dba2e7eba7fb70fde6b6956b7436743435af7d300b71c9fdf9f5c59871b6fb4d7153fae71f1bbe828df05fbdfc52ac2d9b7edbaa13e5567d7031b844fd9c12b716e27ee8ebba861ade65740fdc089231044b608d60f5b7d1e86abacf57e922273a55c2bcdccf815aed2accde25de6c027a061c7823d69aed9201901df63aac35df924296843bf608a650976ed9b0f23f75d637384005098a9552ca1594cd565459902e59b7b3bfbfa0cb9532c1f5a17bd1e2774ba1aea63a713e153d4bd779754d77e726fb1de3c928ae186dfcf134bbcb4e413dcac61009a79d493af6be14ebf4dac18ef5675752f2685396332f3cdaa9be5b68779adcc415a3ae6e6f5b7587cef882162d6cc4bbbda6b6897ee58542df3f76b3e03ae0027f66fc8a81f6d5ff82ce4e2434b35713d16eb11d3a9b01d59734c5b55e67244666849430aef4dc4728b166f7c0606b318c3f5dbf1fa1a4578115dafaa00778f83b7b2146466e4da1bd11b4017e7b7aa1a3f6d173eed683fb63b7f869f8723f4d757a950bb7d2ce645c5d52883ecfb601a23f2493c1a3278bea3bb03fb63c88c240afcbe299c809a83e7af6721868df49e1a190122554ebe6b6555fd35950049a5ad6dd46fd40e84281a7e14ffb93e6294f6c5ac5f6a92f90b06aa6e7ef7fd071a22eca85bf98429cbc6bd7ae3feb7c51d972d659474d2b9f7629f5153c18c3110d63a4296e7c61e8c0ba8f6cdf1eb7dee4802b71c5a4ee882633d117d90fd8d77dda6155e7d235b0ff663623d69d2299b8b690b31a4d2d6bc990c8cead927e963b376f5cc90b007dc5935f7891d727d1fda3ca2c79062b334a3d44d77aa1ce850657031721fd6e0cd53716576e0472ce42de165a91d55eda1cf57e4fcb64f29242afc962bc89cf43f06c72d816b0db62324adfd5b30744410778f83a67cda9fa023dc0d2cf30146036c1dd0ca7356b766da1fa69afe2c0269802cbf6ca91fc3c1c4f1e9f7bf69abd2a76757235c0191f1c3c2e8c0329a58461b41a4b9aab7e2a8515e1ae54b8a97dc38a1b743a6b0c62ce09277c554af98f9cb54b7344a9cfefe8efff579d2b1a3d75750ba528bb9a9e051fa7ac154192ec855f0b35fcf735ddddcf733e1dae6f8694a6e596532cb8632683e25e7ed0aa8479068b0f2af632e26c19324dcd6b6fe70e4e97e5157aa09001a4b232daa4547959b3a284daa89319490e8ba2ae574ac6857bb72de9fe7b0589f268151b2ae91fb4527ec85a931646942ad860060f9cb4b7ad3a8f8d23fac3ae0c39ea384f2741c6fd42c18373f0f5b2b8d359d7f0209725cc42c4f1732a79a0c47b1d56bc7eb230701b2361d54b75e226caa66893bcfe545c42c6f7b5f9160b3c23653def846ad5450ec823a942fc9007f278a04617e60dde1ec234d5796edb978dac9e7e787443a19ebb6e618f1a9d1c874ae6afcfd275c6d5e773df0061557c7813de03fb5ee348ccdbed9292e0caa54bbf943e0c7a06485755cc9d3dfbc724ac7820ca2f61f57fbb5e7ac9dd807a1ed878e289d1be450d9feaab6de83044d9367a167c9a8a5958ed3585fa9b9aae8ef7b811568ceb1b629a323011f9d8458467750eec1f3c8e7a206feb0fa4bc8a3afa1d85304eb823e5113bfbe138e961c4ae1c6da98dab71ebd07c835d35753223c576b1f3f2f73978854e860636e6dcce06534f56944890392345da2d17f28135ea9c34977b3000a396815a048195b57888448af600f28a6df4671bc934fd961d7ec1b31822626cb0c4766a76aa846ae0413e9d2f08ec169659d0c8732baaa24fb1eba52ec81bd65a45ab7d090f86bf2db078364e17141d7607767afee6db0595c4b9abe79a542a3036d754a7b777dd81a412175172d02e093d478b8a63b2ee2b78c68a8415afdb7267bfb883cc38f977a6692674be6074d5d4cfefabab5f7bc45f1d3b40aae82eb25b46f481492df68ed79343672ceceafc892e73856b71a512de4758f30d8b97f68d2baf17c94483b7116079248748e745f7ba206f58336ef4706c6f5b7514872c4f9a6a39bb4dd2319f472537b7ad3c837adb499bc5d2f729aab02102b508b924f12298acd9ab70cd563049b338fd86e5e6671b80eeeb310bac02df636bf3d8ac90d5b68b56f0b18207780e8660c36b7675326ff006ef116b2d58ba6be4359d6a79b122d1b2a0314d91c115541e6918f2c142082ced46ebf15ec8ea48850c94c022313d512016fbb93b8a12f6de7d20183cd6b6e229fa554a66fd9ba164d6fb30ce39e1040e5ac162d3379452dfdab56bd7e33a9b775a4920f62d6a785f6f5dc32fcbcbe4f3d41baca4e2b7d8672db60bd36caaeeeabcbab9a7c7735bf4672aafc8b07b0d8728f6388b159552dcc3fb43e97cdee19918c770aea679974e8d4246575e3a799337707607dc11f2886500798d9a16a2d98a20601b80ca5ba4a702df6325c5eb3a3906b7aec4c6aa42b882e582e5ce3a292a1b0bca6c45a5bff0ba4e298d072999d63597854db167f259602921aed7d954445960b160d4f9a0c1ebc80225b000704beccd17d98dbfe0de18f9809e3d0b75d213f367cd9a2fa5f4db6eeeee7fe9255eb795777aeaeaded25b5bbff282458b9f2705f44b29c4fba878ac163a483dfef5a6482caadeb6f5315de6999210570c4ff1f32c96ed3ee17eb49a37dee510a93a5b140e1c884f7e682b719f4ef90a3d9c4b7246ca3055a8c4a01dded92bb23ac0465320b1236e7a59f728ab8be21e380632e4d98076d34eed90d241261271087ec06ed2c51f95b707d63207cc614153acb0fd13b1c2f02b9529f26d940563b1eb711a20b05ce030ab068a4c57d71dc3ca2c8dd92bb27d67eba437caca78635f5701595cf267158f5f649a66cac87b7ed05bdb50df57577f9721ca06481caea5a2491b6f2ba17e39941c3ab3ba6beb9a855d5dc3ba382b4a465c8d60bb4f288eace64160899b0ae122988ae9d3cb27f8f9ab7dbb076205f5eb0f3ba62943231a6d8194ddbe717af128f08212b7ea945b2ed0af45c172c156cadd360c525e15d460277a206042a43bdec36fc8d72d26b2c19ab172b30e8c844cd0f615a367c325aedce08bb58ed01d24b0446f6803f51400de845a27418078ac7df07e7ae9b773a1e630fdea0de96bd4c461954c5ebcf3e5975fd4795fe9a9ab9b4682ead37d750ddba4141cadf653543c59182ab14798e2a3355d9de72feee9f1c543a1e4c415334660b9866efc0fad45cd45404522e37ce495906b83b6f122f0070ef52ce5e450c6e923828d8567af8a37101046f44085fbf624b3db3ec14fe89a79f6caddc87500dd45753d9f745d3c2b57ecbecdda474a4877e1c44dd365bb2c1cd6fd536626f7401b296fb7bf6f41a0faea6996f8480e22028105c28469ae4e503df77d13de22e079a668feb1c71e472f7eb9a22b659a9fd9f9d24bbfd679dfe8ae5e7c5a6f6dfdcd86287b89fa99ef53512a17c8245dc66df137c419d5db3a5834fb46498a2bc672e3b04232bb261a31e43d850e176b6dec2be4d89da83b8336520afcc30e492dc6bbc3287587de28d255e43829c5cd6cbcea2cc8806dcc7b8abc152db6cb926d402b7706b410f54113dcb3e644d9d57afc4358a9878aed5e6789be32790f2533b71fde5fae08fb9fb9416f8aef467cd3f73578afac4210e3e8b8f4ea2102260416082189e4cf742accecd1afae4954546437db351945c73fec1c18f06d3fb98d8651d65357ffa1beba865f95951b4f492939e0d351f659477a93c9e492eaaece7f38fb998efdbacc374a565c31564866b7ee353633a71f16cd622d4c76b001470fbe472839f2a0dfc93beeeb3428316c41648c15d24c2c1e8bd9a3e3c9e4d5d66b66666a9106dce369fd4224922c7aa0087b23537733014112dc1c6463c28011134b0e0b6fc145f2c0f1b3ab3872a13b433e80b356e33179dd801beaed0dd9f30f47c7dddd3fc8db207810d1b6c02a96e708005ed9b2e52b4fd0cb9fec5c3851de061c47f0e33bc7c92ebf74c7ae5ddfd1f99ce85eb078666f6dfdff3b62d1e2170c213938d17be890d64967de504a7de9f56d5bcf5ed4f378dea21396b4b862b4e1eadeb092f2aa4274f256f8df0ad14bc99111721656cb8b1d910ae48fe3675bc27de268fe1d231b455aa3e49917ab6b8c5598bd728f52d293b8a28e20186eb949d3edecfb4c5dbf8a4e4534caee80e3eba612b714bb6fb3fa7529dc052f0af0acd5087aed9acb7a2d6f2e5464499e75dddd1fbb906ea22781c5e1f00b11461e805c314d93675e02dd3fb8c07324bc818101165759f7e374d3f6a864f29c1dfdfd77eba2ac2141b5acafaee19eb24a639794f2eb5434c73e931a12940f2586cc336bba3bbfdd9ce7fdb44a5e5cd986abeb113e8b8821dcf9e367013fe01a9bd7dd6387ff1dd957453d1a1f1c6c80b02a5d2cc36652486ab157afad3984fbd1f299b3e65485629fa32020e50457cc0cc4e3718f622c3fb081af9470e73a41f5ab80eb6b1cb105cca42d06a89e0f167d16c8303247061c21e93d084ac1d1aea36e031f45b5e82d08a302cbf560918515461e020b8402255ed0a9502213f2973ae90912483fd7492fd0634cdc4dc7829d2fbdb4599779e6b1b7bdedb09ebac57f4fa26a3b09aa8d5474b190a2c23e9b0e35600a75614d57e785b5ffb7754017e6959217574c7bdb75b7d0cdf5b2d0d6f790d7bc968b43ff565455ed20436f647dc45ea5cc0bdbdb569d37327b014a13326cd84d6ac24c933929708917635a0ab13ae8fb1c05080fe24aed0b527b1c8e0dba0dcdceeb89f23630e406a78129aacfd74eace785863787a6f6e25678c6f6be14f3b06ea87890087c58273343a2b7906b09f9376fdfb8ea42d7830336105820149050f8a34e860f257adadb5764b55f57d234bfc333503a9b099ee2fb6552a9253b77edfad4ae5dbbfeaccb3dd1b5b0feccbebafa7f9d36fd88970c61b03be1dbed3319a13fad6e397860ff990bbb3abd0cf4e4cc9410570cdd604f23a752c84b7532679a5ad67c61fae1d11d3af42f19d86a1f5dd02d07f60f9ea117268312466fa43a6e96893a9ca75385a4f6624c6bd106d2a017cbbb372a9508d436087af6dd65700b796eb1f642b3d7f54c5acfd4b979e3cae2df4f23e2a53fef2cb618748b1681aeafd5a810050fcd4ebfffe55908ac47021c461e007aa4abbceecb944f9414dfd549cf0c0c0c3cdb3f30304f98e607c88efd0fb2659ea4d783faf430e55f644145e99543c3c32791a83abfbfbfdff360554f5d5d794f5dfdc77aeb1a369447e476bae39fa3e2c3edb3ae783c9948d6d574775ebbe4c927dfd0650563ca88ab3d0343ecffedfe8129e587fc8b60645c401f782455e947e92173c9eefed871ed1b575dcb8b7ff51b4029631893f7d35166ca90d49631ed619f23cc5e65c030aed4295724f3b481772ed842dc6d700ba3e0c12dec28ab0efb46b90fd29237ac7b71c85b20234a2876370905ba0ff1e29571914e14141658aefbb41182bd4f170055fa356cecd9b3eb604ea1e44dd31cde3130f08b1dfdfd5790783a935ea7ef1a1888ecd8b5ab82f296a0a2f4fa3d7bf6785eead2b970e1f1bdb5f5ad8628db6508799fb4f74a4c17a06222fbc9cefe87e7b76d5db2a8f7718e6b5014a68cb8b21e42cacb025b7ac8460c5f468095326f8d0f0e1ec7ee7f3c8a1b965151903bec8ec4425d6735aa2fd38c653c16e375826eea49b43c5a1588400641c4728392d2bd81a6d4438f6d5ad5a6738181fb0cde234a673331afd0ebf1a61f1665613529584b108242cc9a5d45ed6f647d6b66e83e07eef74f8b52ae4785d935d2ea938a40fbc65557bbdfcf4f038105028a12f2589d0c174a7c3d1f3628092e53273d631886ec5bb4f85d7db50d3f8b462a774a29bf4ac5bca796279410f70b337e464d77c76d1f31cda42e2e0a53465c69dcfba71352c8669dcc0936a4b1a66a8ae2b4c1ab8b08705e5cc1a41497619f98c9f08c855121c76e759001b58f446dd1675a52a1f7ee73e5465cc8f578daed7542b016eb5e163d880523a5f2e212189af55623789e6933224599bd62783fbfac0456cb1a04ef018182fad81375323c28f17f5b3675f3a6ba81a0a7aeee88bebafacff72c5afc2429ac5fd34dfd301597d9673db19394ddf9355d1d1faddeb6cdf3fe5df9604a89ab036fc4bcae6f2aca081f280decb52f13d6a07808f1ec29d4b293ebe1148685d5f173a20ff248bd2eca04cf0c5d12f44110bd5794ab19cd8245878b183c733a41c0aad600dd4b2ffdf8deb079161c7c63c8d34c9b92b2a8c1226c81e57a165663dccc01a1740680a2c2332df412b601cda492e6a74df3bea2cee830dd0b1757f7d5367cd75065bbc946e2c8acd946b91da6638d2912672eeceac82afa61be9852e28ad73851a7ee65e3b42866044036b0712fe5a43528310fa1d6f57a0a97db08f8ba4630dcb02b2009ab0eba296e8d481256ea426b6628e058db3528718bcea687a3c3e579cf3e3d8030e13eabbe54c15a0a8dbdf6ccbd4b205d7be8d6c17a5dbb2b852afa1acdcd6d2bd708a5dceee166c101a120b0401058baf4c6b3e8e5083b170e94526b376f58d5a5b305e7d1d34eabecad5dfc89beba862d6511a3971af467e898ae4f67c36324aa165577755cbfb0ab6b24a04660986a6e81f45b7ad85098310c18acc033c7cfa99c1c392d8b3528da4875b7283412296a18ee20c0eb332215928595ab766b0db62413cbc320ac46d07b46b9eac73834ba2d30fcc71e403026d5395e1b1694d99f59b32a3d861e97210d32e44514ca23ed0024c5a57de3aa3b21b04028292b3b4fa7c2c296c7360d16c5bb65ebc285f34850dd74ece147f7d3f382370f5e629fc91225f609535dfdf0b6ad4d24aab6ebd2c031e5c495521ec59574bb5e03001bdb98352686488fe920159e60235529935dc1dcd052ac30dcc584ef378baaa696753b787d0615b91b9927b17b70ff60437bfb0da15a6363d709cb3dd005b2da16fafea383668c172f4a3d1424a16a1ad2db2c8d0adfcc958d3751386d5a65d167af983102cbb518b70456f33a6ee700148ba2ad5bcc823d22213e669aab133a9f775a0dc3e8ad5d7c2e89aa872b2395cf53d175528863ecb3d9a384fa4962c83ca37a5be71dab7308a05108a4a2a7b41bd8d526522177e86c5adadb56b23f6a202123ec6632c05c2f8ee5c5b7ec23aeb3a187dd842286dca0b36950ec42c9beb04545ef0d9691645ccdb75ca602008fac4ebc6e5e6360b9c2644953cbda5e369475360daaafbd6d558dce141df7f54db451bfb15ca733c2c11a2aa2517647bb80dddfec5277509777a739ac5a83505f9cea8adbba4c62b2835e5cac2752fbe283b133fc5c0365ddffaa2a7e1e8c1d7c8ad1b59fe1f2daf9df669c554a9a6a792ed11bad4873b6e07605d70d2b6c78c870df3fd8e47a5f19fa0db95d8f753bdd496d78be4e7b82370de6cd8329e97a30d38fdfcacfefe01616861c84486753526ab647a9d0b06ceda2b288d1adb341e760d24cbef3b18dd76dd5f9bcd27566fd5f954f939753e5bd928cb7937571ee28f13c7d8fbf5fd4f3f8af7549e0997a335752bcae93ae904a8433dc66cec823d9e82bf6a12f2634b0d149d73d71d66aef9efe4177eb6452e07e136c591dced92b75240bb1894763cbbaeb58805847f3ba7bd818a2439161ffb26534bb17566448aaab794b0436c88222c473c2f51e52f248bfc3f5ebcf1b6f082b714bd0eeab92de66ae3cbb8d07066f335711e96153ed02c0b39dbcee9192ee67b048a060060b149a32c3f8079d0c3a49ea932f2984b0dab6f0ecb37b6b1b7e48c26a80b2eb7d13564af046cdff1cfbe39e7784495831536fcd9572b97e05802ca8884659584d187d55adb9ae41b1f7c572b74f5b313691cd1d59cd335c130f32766f1a15dbf646b02e0334a83e52a477d071b9bdc7dccae5ed6dabee28a52d11acf57b2e3766f5335c3f7f8ec3c8fb5ebd162c60284fed404935a493a1427975770f208704967bd74c2db0ee095f7f07c288bd6fa2f8b8ce0619254cf3d3ed6d2b7eaef3bed339776e1509aabfedab6de88e44225bf533c1c78d95d526fa1635d55d1dff58bf6bd7a02e0c0d5370e6cadb48a692e2159d9c62b05ba06a2df6a12f26143436ae399d9ef613f7fb61373d7f22a725dded7b45cccbd73a9be0c32e70d686dd35bc6929afe928254135117b2f2997c668c4f06794dfe173c8b8bf3628412cc6223d18ea164aced5a9b0e1e9de53dfeaedbe14086bbd5ed25ceeba4e133ce8c2db2e4060817c63545ade34e5762eb028faff67adf58c79a0b7b6f6e4beba866f458f99b59bdade0fa8935da44ff9c56bf43cb962e1b6c75baab7753ca9cb42c7145c73b5ee26aa0cd7e96c6694ba3c5f95b418b0ab15cf08e86c3af2ee7bee067601d3c9b40461cd5553f3da07e9493fce4d4d29f3427bd6c91f9cfe460af6eeee1f9c5f6c83d77d7d537d49337590868894ef75df6ed5a3bbfb631706d1d89f482e6bae46b037589d1cb5cf911cfb33e7354cded7f951bb2ec89aabc6e675179301708fce66c48f753cc5a0a965ed23f43877bf7f5532917320977cae57b2665923067dbea730fa9edb7d3ebf432ab0e62a9c2c69be6961c428e350e6419e9430a9de5cb579c34a5f370abedf302227d7d4bd5f48e36a7a0ebf878af2710f588edca56462c5c2aeaed7745968997a33576e238969a8a696eca837f00fcb18982c7adafc145616eef7c99a19aed92bb98f8de85447fbc695d7b3e1abdf9c0179eef1b3a3ae0deab06387eb57ee42fc4b7953b661b8ad9901faf73a7b88a4195831622ae5a9ff26a337506b91dc233dcddac4e3c381768fb75c5ead192c2fcf5f6af798c10279c0305a8d8811f9374eda2581645899ea523f8555474dcd31bdb50d379cbc68f18b74131e2661c50338f9b807cf98429c53d3dd717929082b66ca892baf0f4f43991057203391c8ed3a758864d26d0875d7e875362e8363c8d51c604367420fcf2890c0ba5767d3434277aa2c76e7917ade5b4a67333173fa61d1ac02c59060656135ae3eb1e0f5ba775b4149785e631b56c3dcd3732d0caeb25caf9271d540490fbfa125b03a82b08f17281d96344ffb1cd5adc53a1b440e90b0ba909e913fd2f99ce8a9ab6becadabff7155243a4036f38d5434c73ee33b431cac6beffe3f9fb5b0abc38d4755689872e28acc014f9d6e3c1e87b80269d1d1f9c687c456eaa17c199d7abf2c17ae2ff2481d60a364d833307839dd5c97813dc465ec76a7b3258db55685ea9ccea647caabbc06b7705e4f2862c3b141b7a2ae28ecdd1bf3da7f877530c28b280cf4acd558d83d960416cf60791158d5d30f8f6e80c0027ed0d0bce66d5288acb751c9374aa8dd89a4d94cc2ea97ba282b362e5830a36f51fd557d750d7d86286b97427e5c4851a14ffb8f52bf4b0c9b67d574777eeddc679e096520a1744c297165bb0bc8d37536234a88a74b79313cf0072927878c5742de3736a4b89f47a4324a7558b95b8742067129cd5ef12c0dafaba0efef4ab8f27a267b4d52e9931cb6d6acb9596f12159188bb355a1a19b1dc012718f0e6f541ef1fedf5379e82378475e6ca4b1b0f8db86220b040b158baf44b556546e42794f4310a9eaf6c53f1c4e28e4dabb6e9bc677aeaea4eefad6bb8f588e8f4978421d903e72cfb4c7e20bbfa55a5cc4f2eec79fc5db57d5b9fd1c525c7941257c79d10e585ab1e1e9eea3e9d00c091a696b557f1835c67479152dc3336a4b8df07fd05b78bd7a3a5367bc506f381fdb1e53cf8a18b3260dccc810d74a664b1826028e1763fb516b7fba159ef9b18a885eebdbdd62bf82825bdac7b9ce957c8fa42e15d4084efb9c675fbc0fec11aba760fde00b6c0b2c267039005b262e677e825af62236b947820f6e6c1655bb6dcb05b97b886045579dfa2868ff4d5d6ffd610654f4a213e4fdff6087d3a5f287a6efcfb50eccd336abab7fec8344dca962e534a5c49292fd249772494bbf51d604aa2674283bfd171166e6041a7a767f53e33aecea3a4abd16c12bb3f5cba6cadfb686a2145ef35e56a36494ae3f64c8bfff9bcd3ccac50e6f55ea2b21513a53c8a898874b9975a30987658a597ebe58189503ed7b8cdf3a08a578115a9901058c0334dcbd7fd03898e2006eb49509f76fd964dab3ed2d5b5faa02e7345e7c285c7f7d6d67f4d8ab21d64fdff173d04de49c58588eefd2429abe69aae8ebfabdfbefdcfbaaca49962e2ca8a74e20a1e99ddbcf93a9723e3602aa2a3f18d5fe06fcfa6b0cb5ea10e776e6086117c11e8111ecd56099304962bb7afa861c8074b4d644e84050f3dc4dc065299396b4e346d787bbb8e4f989955ea21dfa360e691975f8a513bf1e01aa864b34e85033979e63c35aa8d458ace848eec0496e06d6420b0806b9a5ad6be871ad6b7753648bc6c9ac9776d6e5bb9c6edcc8f410fbe9ebafa77f6d635fc573452b98307cb484d1daf4fe79b83f43cfacaf3b1376b6aba3bda75d99460caec73d5d4f48d7a1129ebd0d98c94ea1e13d69a1dcbad2c23d8e72a0dbc8ea9a22afa1435a1b12e397be3838335855c87d2d4bcf66632aedcad294a266b0a1dd9cd437d6ba3fac6eb2a3c6309a64884dbb60b975fb54f25544350064efcd8e7ca096a377c3fc607597126467fef0ca7bf97a28ec748d0d6e47aff0ab5cfd5086ef716b251fbdadb561da53381c761afa694d0e3fe92cd1b57fa3273558c3da246e019550ebb4e75d3cb6cb4b5766b6c5d2fc677c03e57c146ef67c57dce61764960d8103f78f0e36eed8b9ebaba23a42afb24d5b5ab29fb36bbb48028f16862d8fc6ced135b5fd425538aa9337365443cac3b51fb860763a1584f008a83bd8e69e20697e6da422ff0771f399028c1d92b8605a369aa0b29e9e23ec8236599f148c98f622793fc40754334522e1c835b501da7fa32a18e2b75471867f4bdb906ca23c335c3a9dc5e6b6ccfc06068661cd33126b08dabc8a19a79910ad15beab3d7207bea9bd79c4ac2ea7f2819246195a07abe7acbc6ee77bbb12ffa16359cd557577fbb21ca5e2261f5af54546861b5970771aabb3bce9baac28a9912e2ca5a6b317983d734a8d6a047c102c5c38abe37392cf5ce622cf0e77aaa84628195196bef2777410cc2068722a70eddad7ffc3ca3423e52ca91c4ac194a12423a9b1eaa1713d7a35906e8e43abe77f7402cd0a1d753c1ae81da65d7152a1209c5fa3c5b284c1ce47186be7f6b58d6c9b9213b8145f72a626c80c00213a96fb9717eb961fc8692c7da2581e0595389a5ed1b56fe9369de97d46593b87fc1828a9ebafa8ff7d535b49355df47f59cfbee19f6d98261525bbce3f5e4d01935dd1d533e5e41c98b2b6b41b6213d841d567ded6dd7b98db805a62015d128872b1de782a694796db10c973dfd31de83c3d5608063708212c1727752ca95c092429cce91c43205740833f158ac956aa6abf535dc478ebb174e9b622b159a201613e1eb364de576368febc735a1a81b8671a94e6540f5ede91f2cb9e71affaeed6dabce534adca98b5c008105c663092b59f13baa1bb37551b1e1153bff167bf360cd96b6158febb249f4d4d5cde9adadbff1a4e88c0143c81f5351a37da6e03c618ac492eaaeceab9b7b7a42bba6d34f4a5e5ccd9a53f50536a4743633eedd69c014448fe84f98fd517dc55ce06f1bbca6bbd92b21ab4b75f68a69dfb8ea4e5eaba0b31990d5bc6ea35405963dfbeeee5e701fa903b4f09a100e5b3f61bd96eae37bab33a184d76e7930c2678edc8fa0926206dd99a479795885b11b366f5c797936028b12087231c56968b9f1947259be919241a90b2f09953c7f73db8acf3a4503b4035434bca7afaee1614394bd28a5bc81faef63f4e9c2a2c401faef8ad7b76dad5dd8d5b5d52e044c498b2b3684a9d2b91ea9e7ceb9bdfd864e9d0560324eeb96c870d1a9a2a15d12a7fcec15632d0257cae528bd3c77d6ecaa1fea4cc961d70bb791d58c9b782d9a940e6bb00250c7fd603836c86e8d2e5dbe8d554116de7affbaccd7a7c49a4207b2290659092c88ab29cd92e69bde51262b36515d08c28c95a2ff7d2ff6a67a7b7bdb75bcee6b1c5bce3aeba8dedafa2ff62c5cfc2c19eebfa2a20fd211b14e1603a57ea1c4f099d55d1ddf6c36cd842e059a921557d60c833d32e5f2e1a81edd333088592b9012a7cd54a983792808860b8f4a2b65baacbfb2baa9658dbb088321a57de3aa6bdd1a5a24262e6e6a5e3bd90dae04b0dde184db7552d14885e42883e3b717b0069d4ac338b766f394727b3f66ce9a5d19c8b55796e893d2cdc6d83bf5de6753024b60b99eb906539925cbd635468c329eb11ad7df158917e838a7bd6dc5955d5d2b5fb78b6c7a6b1b16f5d5d5ff607ac5b4dd52ca6f09294ed6a78a821262b730c547abbb3b3f50d3ddbd4b17830994a4b86a6c5c73ba2dacdc2df46561c50b634bd96d02e48ec38c4f4c255d1b6a79c7764d743d4b11e851793fb0074b5c2e7697f22a0e8bae73250507fbe041009dcdc4444323a6677b4a06cb75d4b5f0366e0e62e093e367476fa2974c46a1157a7caa3dd778e61a020ba4a3b179fd472211f9bf942c76db4e525dbdf9cd7d7f3cab7dc30a9e0cb0e89c3bb7aaa76ef1657d750d5ba514ddd413fd2d1557d9678b46522975cbe081d7cfa8ded671bf2e032928397165b9b594198fb81756a213c22afc1886caab50686a597b15d5a9f10ba00318969a3a3fb74645d0d694f8fefb719bb6a3890957aebebcdf5463cbbab49bea8695e4b0b5b170167d9c797d29464ef5e042366ffae1d17b743a10587d51e6bded26ede934952805812595acd449e0234dcbd7af9086e0ad198a2d563a9530eb366f58f9c5dede75bc7649f4d6d69edc5bdbb03e7accac014318ecae7e3697171d25b6517fb9b8a6bbf3da254f3ef9862e0569282971d5d4bcf632dec782922efda855df81fd83e741583912aa590dd390799bdab747ae27cf5ae93da602850eace1764dc94dd6a2f8609097ebe0b6cd6d9cdbba2e4a8b14e226ee4774b63894f9bf0ec432b295f0142d8e439717637b8142e15e60c9738332abc99b72d3f5648a7e3ba585d5087aed6568d70a52fb0b4adf5c122c58d05ad1d4b2ee07945c4747316ddf3fd16f7be5968d07976edeb0aaf77ec388f4d4d59fdf5bd7f04b29cb9f91527c99def357f65b8bce1bd4475efb7ccf5612561ddb74197081eb0a96ef99815c60e397773d175292d2773963a5c49addfdb1869e9ed5081be90c3a76cdf4c31c5c70947a34b823fa6e23078a6879b48abf5bde20b152f47e83db78322e7806cb9db149fd883d53595ae8b537eeebac32431b7add2d6e059635ab59e4289bec951131c483944cd7a620acc66045b80cb1c002fed0d8d87acc916f99f65beadbd9bdae5828aa8bff117bf3e0e99b37acf85e4fcdcfffaaaf6ef175272f5afc9c21e47fd3b3f27df49ee04c7828f1407c58bc8d44d52d1f31cd947b6c01675cff90f99c19c805defc72fae1554f91da7735dacca3b122996868dfb8b2e40d0727e8e1ec3e2c7d91f1b2d62122f313f5c91a29760a776c2603376b35829e6d7055b7b9dde4d36834a45b91aef2eafbcec6261b9d9474292ee4ed8598ad904a1ca193a318323ff782fb3b1e85d4d9f428f550beb617d06bfd5cb55743e6ffb9a30556c64d2f25896e7be6a8f0701bb5bd32520f1ef2b3adc0c26ae2b324903642d0049674d9d751df8c48863eb0b465fdd9b2bcaa9b92c5da038a505b9366b2a1bd6de515df37ffe7d4beda86bb855131403d1c0f6eceb7df131094d8a594f9c1eaee8ebf3ebbafe3255d0a3ce25a5c05cd2867d79da696b5bd86211fa1acbb4e5d89357bfa076ba674b87525e7ea544678a454278bc2f4e9e5eeeb5c1e0c5216771183674327110b721dd28306aeaf4f4ae3f6fcb907cad3742203f2c87cbb285a466732c92e82ee36d6b5662bd6dd93d7c01fd2a15f9546defa5a12122c2232d58dbc066a9935abd275bf2285384b27f30add974b6c033c5ddd90dc1f6c28f4babca6e67537511b7d90ffbe2e9a8c7eb6154a58e93631b1bd46ad605201840596692a6afbd9ac3bf41725a5cb7b94df01a7a9c0d29675571a521433d4fa1e53a84bff593efaaeef1c78f8acdebafa5e61185ba863fb049d0bda9aba8452e29b7f4cc6ceace9defadfba0c64896b71a5945cac9345c372ffa3075b53cbba97c922641740973bacabbea93c5b350e397173d0d444ca4551466947509188fb30c84a36eb946f4c3fbc8a5d701c0c4115a820168e28b751032d66565455e567335d0ff5ad221acd7bd86b0e299e342d1741b7337b171f3f27da910fa351dfef49f7470ae57b5d1e47a68dd2f31ca8459649f7fd8a87fa932b6c80c7076367d00d481b6152afcb7bd0cbcc7a36f07622f4acdb407f309d98db598c67db7127441d7f43199105fbbdbcc251334960b96efbf980eb0cd51f977d89acce771d2b55162c689dd1d4b2fe478694ecc5510c1113534a7de38b431b3e70db1b0fd41cb17f70809e25df95ae6dd682b3359134eb6aba3b56bcbbb7d70aae0172c395b8d21b4bbad953c3826795d87d22d78e8147b2d91d8247eee821d341c6ee5ff8c146a75c8c70ab7d6c24a88479467bdbaaa93d5ba5b1f6fe121e04939497ea54c161c3933aa22b75363352b4f835d3c67fdb5ac397f25ec9d3031408c219e9b913af3f7e76f41e3f1fe64d4ddf6043cb8b217d914ee595c736ad6ad346964b64b52c339ea27eed663f7f77badfd4a73acd46c8967cd62f6bcf2aea1b7576227b770fc4f21d7add7dbba6fa53c8d9105e4749cf8bf3e8fea49fc592f243d30f8fee60d751bf0d604b54917813910807674ad97e78add881fdc5f1c430648adf507ae8b38b40b105d6b4c3ab3cade59c7e78657183eb84106e3f47be65da367a9efc8d2e2a24ca10eade2b073bafbdedc08367cf1ffe4bb7e4c89eb2e821df53a05ea77ee41f1edeb675496dcfd692d8cb30284852d73ae90c0b25aa18373b1b01ae69a327c13e25c5133a6f619a544e18068f76e980194a9e46426e2647ca713fc23316f5a850e23e3210ee9df2b3546320b17031dd578e32e5d168538fc607639717327883659447caf85abd8e82eea407e7d5d6be3e59622d1aafb05c01338802d547f7e5bc2006b5601140464eb69b04efa4b6da9a6bfbe119666abf1c61d1d36c18af7d198e0d5e5b88fb6af76d8e6e9f19b0fb98036fc41eca26200e8bf7e36757ada67e957fa314f747f10cdbb52c047581afb078aba88a3e35a95f275161ad51c9032c9248a4f2fdf6d8aef37b2f5261dda368947fa7142278041ec893770833f170b642c7ee7704cfdc5e407f2bed0c2eb71169266e2d86a8d2f586bd46525f2309f7782cd61adc803fb6019e622fcc9ded6d2b7d5f03c3027cfa6155abd2b7f91470f0ad81c156d833e931c8905cba6ced35748fd750b6e0b355e5c2dcf2a9a1aedf9f35bcfb7c7af61daf8b83ccbda6487c716157d7cb3a0f7c6492b8e2ce3352193d5dafb1cad8d1171b5ec44b5fe26925e55633aeee4594241b6b16a74c707429fa1dad19a8dcdc35ec4d481f2645dc678d7cfb083f78a233a2d5f6427ee3222fb3a4cea83e25e47d24b43a331964a37f9b043e7588efa522f7332d0cdf17a936264dd967986a6f31f6bde25962baf6a821a9bd4ac9c129fc98f5d84bdfed5eba8f5b4da5f6ee7d29d699eee1ce863307bdd1f791fa8d9cea5b8c1af62d49a57e1551e63ebfebdb58b408cc366222df8f4ebad64e21cd57b80e2487624f3b199523f787db23ddd36be86fba1b38a2fa652af15deae762b137637d7e46376d6a5943869e3126acb7eae3597e9df18509759347e1bd1996e36953cabcd554725faafb9c0f2cc3d89a4130aea16ca6d971aa13aa8d7eafad24b89ee6b6c3857cbd7ffca3d837f384e868bbb0da8a5273e9bef03336c3e7b28013772687c5ad857ec68d04f18858bf21078e7235d03aa60d2703b9463585c0f24d5cf120615246a28621a80d58337a39f4cb6a9f52929ec1e6c3c3b1a1ce200bd762b064c94dc7462acb78e086d7d515944a95d8f1d1a1275e5a9cd8c56dbbdc2e0d3664f77fa9a6bbf3db3a0bf2806c5cb626cbd1db624046333db0a8837f820de74c06df5482dd537801bece1694645ccdf7f2c0d7b3433b74b6b08c1999cfe73da30734d994f9a5a9651ddf435f5c215d31f6de35affb2189e0a2b8acf87d6fd9ed98fa14df8214589b972a3937dff72769aae5b9cce658336873a21df418b05d4893c99a5c852cd5c9f1a37585228f336e63613775ea332ed583180580d74eaabb0eec1fbab350db8614a25f2944ffe806078195b5b8b2d6c7791d9cf387bcccb68585a5cbd75e6808e3bb947cab5d5218a262f8cf1f187a32d634fce22c49bd7ec8d8118bbd595bbf7dfb9f751ef88c6c6cfc46b58a1845ddbf633c32c6c249672cfc1eb12d4578749147c874b6a01cdc1fbbc5cbefc323c1d30e8f66ebb6961332693e346240e6f39e591b58e6199e7950ee46917d61ecbdb3c2b77b5fd7e50bf9b8b77ede4b7677b66661f37c7fccb8b833d7590c1e5de7c03164e9f25aa39c370c2ed666bb63eb66a118e93fe8de2da62be07e249759390d892925da48a06f3cf8c6505b319e7b85e8570ad13fba450ff6b130624199bdb86a5e7b992a42f87432ecf7b5b75de76983f052a0ae6edd119533c42d525833e205a34a0c1f3c2ffe74a429fe42659930756928f9797557077b99803c2033adb902000000407a6ca15a4622cb5e3f6ced61964a604f5c83ac545fb1c414b0059651212e9baa42256c3436af7baf34c4f7a995152cc47aa54a24de137fa6ac65f87951214a634f5d32ffffb6a6bb23249e6be102e20a0000000000041a9ead8a4e17df1652fead2eca3b24aa14092a794efc399eb5d2a525c39f0713b1331a7a7b5fd579e0131057000000000020b034b6acbb404a791b254fb04bf20b892ab16cf80571cef07362ba8aebd2124489ef557777047a0b8530027105000000000002475df34dc7551a65ff2285f8882eca2b5346541d22294cf18eea6d1d4fea3cf001882b000000000010180ce3a2c892e6da2b4954dd48d9bc076e9a82a26a2c3fabeeea2888789d2a405c01000000008040d0b87c6d9d14c6bf51b2d62ec91fd3d4b0681e7e5eb490b09a36f544d5086a38a916d4f574fe41e7418e405c010000000080a2b27469ebd146f934de77f0d39435ecd2fc70981a12ef8c3f279a865f149522a14ba72e4aa8bb6aba3a8bb277652902710500000000008a8261187249f34d974b61aca16c5e37033eca1c14e70c3f2b960cef14e5b987544f922a7983c4608cd20749a00c4a217983ec723a0ea37347d3b90a7e63e051229e1832e7d66edfba5797801c80b802000000000005a771f9da1a1255ff4ac9a576497e9869ee17ef8a3f276a130322e265f35f25f691407a922ce52749353d234cf359329df70831bce7f9dede573e629a29151a8bc6ad679c7db4ac54b38d883cd510f2edf47975f4798be9f451f6bb8203e981ff57d3ddc96bdc408e405c01000000008082b17871ebcc8a69d3be4ec9cbe988588579e0c4e49fc4bbe3cf88b7275d4dc8f00c540fd9c58f9379bc356e0e752eeee9d9699ff28ffb0d2332bfba76512412395f09759114f2547daad8ec5cb86deb89a6694218e408c4150000000000c83b279ed81a3d7e6ed517c9fcbc8eb287d9a5fe2285126f4fec15ef8a3f2b4e34ffa44b1d216d23b69315fcbf4a8a5fc75fddd35ebf6bd7a03e57307a6beb1b4860fd3d5df845946597c2a2419260594d7747bbce822c191557f3e6ccb9411620328b13740d77ee1c18f8b9ce8e326ff6ec0f4a290bb6c08eee44f7cefefe6fe8ec2466cf9e7d6a9994ec133c8e1dfdfd1fd6c9403073e6cc19d148e43419899c21a43c826e700d151f6d9f1d8394bfa573afab64f2a99dbb776fd3a50561def1c72f72757d844a243a6522b167c72bafbc6c950780f973e63ca093a3a4aac763495587124a5d373030f0accefac2c46bcc54bf4770fa6ef920ddf5a4ba4f39a3eb5452a93f4486869e29449da2be753df5ad27e9ec2883f1f8a7f6eeddfba6ce060efe0d22429c2e0d6336d5ed794edf817f43eaa35fe7fb49efd9936b1df6f177ff33fdd6bd9cf0f3b70e43fbcd16dfefbd4fcf1627dbc44d5feb8554dfddcdb3ddb7fe72e479679a0349219ef6bb3e151b6b5d55d39a8ba461dde7b976a9bf94a9a4589ce817cb879f17c79a6fe8d2490c515bfa2d09b0071331f58b20ad31eaadad9d2b65d957a9325c4ad9bccde6a5059b0afbc2a8b8b23a08292fb43285e7733b76edfa8e4e8f327feedccfd20befc85d18947a305d676a0982b2b26e9d1d85ae9dfafee232ffd8638f13d1e887e9d7bc982ea651177b83be3f3fb462c3c3bff3dbe8b3aeafb2f21c4a7e38eb7aa6d473f4fdee2463e9fe623f78a86eda0d673c8ef5782ca9ea109330cdd3fcfc5e93ae3143fd1e21c577f39f34d793ee3ef90ad529aa8fb70e0e0ddd950fa1630d1019c6c33a3b0e6a6bdf24637985ce06023da0f541ba2757e822cff0f73285f8657f7f7f9b2e724d5e7f77bbff7898fa8fef67dbcec2d07eb3259ff79eeb841c1afa76360237856d92b1aff542aaefeee6d99ed7fe52a91f90d0fa51366d2948e8d0ea3753322febaa785f2adea36ad9f08b62861ad2a5e3185442fd4228f9c0f01be27fce7ea663bf2e0f24dd0b175797458c3b28c96bb30a0a55e6577fbe6deb71ab4dd3c3c2343091bc86ba04f9871f0ad6c3271add43d9dbb216560c3dc0d810acaaac7c831e189fe519307d266b78449047eeadeb93f26e8787a47ba43c850cbf1bcb0ce319facecfb221a8cf9404fcbdf87ee92c280454a7e8bfb7719d9f33674e8b5de80fdc7ea8be7e53672741e7becced57678b0a7f776e539610cc415831fcbd22526eb0da6840be9f85dd7f7c59f71f0ff8ddd6d07e53c3f79d9f013c0be5c77365ca406d71a42df9dd3f1582a54bd79edcb87cfd3d24acb672d62ef50f9e9dba78a8577cfdc023e27df1a7260a2b93c4e9ef941257c4f78b99355d9d1fabe9eeb837e8c28aa9edd9daf7fcb6ad4b9552ff8fb2058d134f36e431e757d736e82cc892d1992b7e28444cd39bff6b59d92d138d791ea112c9e4bd3aeb8a542e5f6ce0d3cbb8992bbadacd2291f882cefa4ad230de4837f298cbe896dfe899a0ef50e79b5aac28f5033adfcb6e06c23477eb520b76c9a37b3987ce9f97529029f55c42a9f3b3198db55c132b2a3e4f0fd5949167acdf52a947e83dafb3eb9f2eb6302391c3e8a172269dafe1078c2e9e0c8f4627939714daad31c568654e335723f835029eedc8b7e37753ea93ece2a373be90aebda5ba4f544fb2725d1ea94fd43fcdb30cbd14505bb9c02f77a349fd17cf9231b6a0b3e036b073d7ae269d2d0a96db55aa764a7586ae77d47d58978ee2a61fa17bfe15b7ee6c7efdeef419f55642a973e8dad20de8789a010943fbcd163feefdb87626c40563ebfa085eeb3c0b6187df30d833571efbcb092ef2cb9cee9b053dd307e3f12f04d99d9859b2e4a6632395652c0c3e4387efa1c84f4bbe2a5ae2cf8b33937b590c4ce439aa7fff3e9c903f39bbafe3255d165afa162d6e1686713f25df62971484b5d55d1dbc260e64494e012df2dde94d324e983c3f60d2914b07ec273c82c5a3593a3b0efa3dbfe9d5ed65c4a590928e2e985e0d4e16ea6552fec2f101c16248a92f7b753de47b2f22918b5319c6f499ae0d383f707ca0fa24ae183f0cb46c8d33a7efc6065621056cbedb5a3a773d118bcdca757d0e0f2ef06c98ce5a70dba4facb91a726f6699fa4dfe5473a5750a80fff04b5d3bb75f610744d64c43de4a58da6eb47dcb6cf7cfdeedaddf19b4e7d12ff2e6edd33c3d07eb3251ff73e55fdf2d25f87515ce5da5f5ad713897cc5e17b5be2343634745e10055653d3fac354447c494af145cafa1aac82d7539d9d1810cdc3cf8b59e684c92725e2a4b21e3085fa7eedb6c737945ab4bbae9afa53cbcbe4af2939c72ec93b3d24ae82e3751042e0161832d848701256dce1f2039d8d04af0f753624f941c5ff9e3f47178fc246a85b77174b5819c633938c18165524d2c8383895859ad707033fa82c03880c5f363274f1283cf26eb91f96087031ca2f5c07b9beebec385465251b063911ada858ad93a3f0a007afedd2d94390f1590c5729eb6f3a18be7c5f58ec796da323fd88d34c87d53ec960d4d982c3bf3789c5852ca474d1283c60c3b3773aeb0b68bf365c8fb8dfd7d951b83e58621c38c2cf3b4b482bf5495d340aa9bdc66865e5233a1b08162c68ad685cbefef3a24cbc40c28afb3edf84d5112a26ce8f3f29be7ef01171c950cf5861c5fb4b3d46c78ac1646c3689814b167675feae14c388d7f5763e1b1f164b955039cf88bba47acb5967056e1fae3001711522f861ed34da6e8dbceedad594eb4829ff7b1e117312583c1395c900e487a525ac26c09fc7868d1fee569601678fde7ece2e39443e8ca442c0a3b88ef71c065a5ee1facef75e6747e17aa4935961b5d3899fa1d483fcf7b460995477d98556270b46b4bcfc9d3a390adf8f5cfb116bc4dec9288c44aed6c9a2c0f79e07685208ac1bb35dd382f69b1eabdf1f71891d8b1de008a421a53825811584679d61b41a4d2debffe6c8b74c7b9aaee9562a7aab7d2677e626ff223e15eb12ad071e15ef8d3f2d66a83895aad7c9a0f8a930c5a5c28c1f47826a291ddf6ce8ed7dd5fe57a50bbb382612e25c4ae63dc22d6154555435eb34c80288ab1061b9da4d848c36b72e2d6e600324699a93d73849794a55652587074d0daf019b001b1df97061d02e214e02aba823e4d940d7fc7a4a510b032dbf2493bfd229df700ae9ac92c9d1354d4eb3575c6f0bfd3b4bc398ad93a3705dd4c99c60a350270f9163a00cbfb0fa4b5e8f3a818810dfd3494fa0fdbae2f7faf510bcc60864448bd3c98315459cfd6351b574f9ba8f2d6daeda4e4a8fdbfa7cfb4c6e58ae7fc3fd62c5c10de2cb831b445d6280daa5c9c2fcdba650e79822f9d6eaee8e8baab775fc67f5b66d7fb4ffd5d4a1aeb7734732917c3f1956077451de207180a0163900711512acc8784e6b988686785d9aaf5823d77667fe391e3563371ff63dd782c6117d7d93fcc3652cf631bf85d508d6f538b9084622f7e86468e07b0403adf0580bc97dc412f613db010f808c597fc1bfb5d368b49328cb27740d033a79080e00e113969b31f51d630f7daaf80c0dfda34e1d82fa57ab1fcb02b45fef38d63fe0883558e130fbe7870bb31778afaaa696f51f5eda3cadcf10f23e6a346fd3a772e228f3a0f8c0d01f2cd7bf4f0e7527e6987fdea4945a658ac419d55d1da7d2f12576f95bd8d535acffc9946551efe3bd422adfedbec9c83a9d005900711512a4434867766fc975e17d2ab83367f1c2a366ae16e61ac6a4d9b37c5edf086367044661232964b3570c0cb4c2a2dd5cbf6ae70ee174ffdde224ec9deaa8a3ab1489b26c8dfb6ce0a0323a7908ba060e20e0475de3411a6bade498439f2a3a56bfe4307b45fd6cd6f71fedd719bdb66fd2c09b63fd03e9f827fd3a0ad5d79c5c98dda245d5079736afed1152fc8c8a16d8677283a3fe7d3ad629be36f8bf7f79f7f0d33f99a686fee640fce031d55d9dcd35dd9deb484c3daddf0ac640f7e72ea5c49d3a9b2f16b5d20fafd3c023b87121c09afa7798b5e28d3a75b2a8f0f5b10fb8ce8e5288eb6383cdd1188e442ed6a95091c9402b46e0835284ef635545c52d4eed4a98665681517464b4719fc7030ca94445d20e533c0e5e5359a8df98eb9ad30c1a1bc25cd7e8fb3ccbeb3a58f095a83098bc316b8eae8b68bfe3e1ef9b22b8cb72be573a0b5c9050ea719d1c47bedbe6d2e635e793a87a9c4415aff7aeb64bb3679a1a16ef8c3f276e38f89be73f37d8beee1dc3bb9bdfe8ee38a6a6abf36f167675fe64e9134ffc45bf15a461bf3974ad5082f737cd17875f50b3f8249d061e81b80a01c9ca4ac7a866f1783c6348e04290eafa0ab6abbc5293222791d89b6c34868474061a478982c0ca1e9ed164c16085497730a42d319445e015eb377188bc278786bead9393b0da87835b6b21835bf07765435767c7434291d775b0e0b3c4d6dcb98a67b5e8f8774a7f960340845974a5da8728d7752c68bff63d64515e5551d133717685057dcecf06a5aed175d19783f7ecd49f1c5852059a890871ba4efa06cf542d59beeebca6e5eb3a0d23f2df5494b34bef9ce45fd487e3bfffc3570f3cfae50fbcf9c449e76dfdd529d55d9dab6aba3b37359b664137ca2d059a7b7af65163caebb34249d3f7ba355508df3e578c8341922b09a5aecb14258b0db37ceebd938a54f721df7fd72dc5be3e7e883b4551cce7df67435327c792ed3e578effce1af525638cbec4f88dbac96863e32dd3c8efa46ba476a3232da6c5e9bbf1dfa4ce22e705c4f439dd3b73d8ef28ebb6efe0963411ea0bb3de2b2d451bc87edf331ff6daf202d7351db066727feb025d3f3852681b8b966c5d000bd9c7a6fa5bbc362cd5f587a1fd668b6f6d2e455be3810b1e6cf05aaf53d81905c14dbd73ec2fd3d4a15c70fa5b846f369715a862d9b40f0929381261ceaef51522294e4ebef6ec19c37bfffdecd77bee58f2e493e3f6fe03b9d35bd7b0812a6956914e3341f260654d7747c96c715348c23973c51dadcf47c4347dddf06eca9307019c12d3dcad532545aa117036d60a3d026e19880eedc6eb419f93db08a8c367ba3ad24175d53286b21556f64cc72451e2b8a7d5042cb756323a75f6100e9137f309d73536d0d898e4992cbea689f52e1dba7e5c41c7dd6ca0b311386fce9cf56cb0ebb74c3982d47e73c2a93da53b9ce0f56d4ab50f4a09e33a8018c64591a5cbd77d7c69f3b427a882f29aaa9cdaed916af0d593ccd7bea95e1f3aeabb9bbe79da173a7eb41ec22a3f2891b8ce7ac903522acc5c6509dc020108302563a0050ddbd8fba43543d4dfffe19c46992b2bbfae5387a0cfce34333182a3eb2019a9d9eebb942becb2c5e1ca79ef3c1288875951fee8fb5822d0c3a009bb8359426b8e3f0132c208daaf8684377b17b03b2e8bee5c5d2f2df14ff5d2afc3ea0ba62075755795372e5ffbb74b9b6b9f3284fc3115bddd3ee31d43a8e1696af8bf444234fc77db578fbd73e3da15bfeb59bd4f9f0679626157d756925693b7e9f10125e4893a093c123ab740eb2195487c41677d23964c3e93c9182aa4cbca58d8c88a48b9416747c9f7df758bd3efc414eafa8af1f7b375cff0e25634966c5c8c265da34bb722c7efc6c6758a352a5e481ac61b6e36a94dd5d62c43281d86713cf5496fa7fb7419bd8e0f56a1d47309a5ce77f3f7dde2789df477e83e7b1213bc0e8cd737e9ac0d7d0e6fbeed56a41512ab3e4622a771287baa2c67d1bdae9f583727c26b6d32ad672b641f9bea6f7108f95475240ced375bb26e7313a136c87ba8916d318fbeef0593daa1c64d7d60f26d6730b9d43ba7fe92ef59c1dc02a96fa67a31795fb9349c78626b74d6dc697f4b5f6e2565e7daa559f3045dc40ff627d58f9ed8b40ac1288a40dfa2c5cdd4eefc5fe3aec4f3d5dd1d8eed17a4277c6baef2fc804947211ffc63e1515f5e50aeb3a3a433020a49aafbc2a3de85300c7924745248da3cd713c7875c1ec515e3d540cbd6382ba4b1900a3fda9ab5168fb730982cb21ee4f0e87e7c9f7973e7b64ffc3de8f339c4fae44d53d3a0a47ceba4cfb1f1d588cc275c3f2b2a2a6a0d21de3fa93d6a32d5a342f6b1d9acd50c43fbcd967cdd7bfe5c0e18e154bfd9053553700b882b1b6bb62f1a9d141dcecbdf5ab0a075c6916f89fe1d29606e9fb3ecd2ac789d4cc71fcba4f8617bfb8a49f70d149ebebafa2e32e9fdde4b7070e1b6add34dd39c54c7417ae01618022c0135714f1c8204d7bb75322ff003c78dfb46aa8e3d5a5efe4e9dcc2b290cb907f46bc9c0c657d2342745b863a3654ab918b98447c579e687dacef8fd8cc85063438a678b74495658c6b993206231c7c6a087c3f1736c6ecbd585ca093658271efa54d670fd1c7129e4819549f79d08d406df5236e9d42148c0e894ef4cd5f6cbcf0727d748c6c9230338a32a2a1c37757523ac162f6e9dd9d8b2eec623df32ad9fcc3e7643ce4658f158fc2653a84b636f1e9cb5b96dc56721ac8203fd2edfd3493fa9da7ac6d947eb34f000c4555890f2569d3a8452d7e894ef8c8ee445a37b78648e8daf74bef2d4eb7e452747b1660df20c5dd72774723c4343bfd5a992828536cf58eaec281058ceb041bba3bfffd329eae78d3cf394cd3de37f5388fa6d919fe0166f675137f6f053c48ddc77ea18266e947c4a10d65fe9dfafe0833253b5fda612964cb1d616860daaaf97e9e4211c0630c652dfbce6d4a696f5dfad98366d07fd7b1e4c3aca3ee38957a8ff5c2712e20c1254cd5b36acfccfaeaed507f539101012fb8dfbe8c5f7dfa5ac2a718c4e020f405c8504c7c86364a8a4141739222391f1c6a83dba7e41aa30bab178fc5f74f2107c7db66b675eb08c4187bd85d8902e6418eb420381e51d8e04e8b4616eb6f7cc0a5beee46e98705e30eff6a04ff99cfd6163a0b667b956f98812d686a0e38946f3e17236c93d3208915975d8f9490cc6e30fe964de98aaedd7f2c0702022e5993a095260b57f1e0499804a266fd7c971342e5fd340a2ea67e546e429aa58bc5979d43ee39a247512ff43c75fc7de7c61f6e6b695abdadb574c5a9a0082c3d9cf74eca71a31b95fcf99f22374027800e22a24f0c81fbd38195e77fb3d126c0922878e3c29ac4eda11be3e27e395b88ddda774da37d80051d1e84f75f6104a3de728f44a0c082cefb09ba01f024bcff04c0aa032b28e2b9783d79138b94ff9ee4e974cdeab5363b92d0fb34a93a28fc94462d2ba9142a2bfe3a4df8ff89cee67f30edaef21a84d0ee8247080eb8263fb57ea41ee3374cedaa38a04d5071b5bd66f9422f21855261e2cf16ae3eda00f5e1d57c3f3dbdb56bc9f8e07babaee18d6e740d031651e66decd2375027800e22a44580b781dd60470b00bbf5c2bf44cd864c351a96f665a786c19af0e7bf6f0a2f15cd7b78c8547f1ac9dffc910d145a37034b8421948c5269381a6b3600c7e082c5559f9459d3cc4044327279ca2a1fa3c0b6c5dab834b51c4307ee097c0623762be6e9db5a1fb54cc5965fe6e4ec18158d0fa1920c10d53adfda6f2b290f178974e8209707f64d58589ed88191ab2fa83d34ebba6b271f9facb9736576da7caf3b094629975de3d6f2aa1ee4c26cde55b36ae3aa97dc3ca7fdada7603046f08793dfee6a3f412b3737e61405c6501c455c8188cc73f956a6170ba355199e07fc7ebaaa8139fec66c7d1ace2f1569d4d0b2f6677145852de489fff6c2eb3587c8dfc1dadb5600e0f1b365452b99e942ae90c349d0413d0830093d760b910586c9c3badd5e1592b9dcc192d7c9c022bf81adc82fa922f4cec4bf81eb0f8602197edec09ff3b6aebffee749f124af1869745818d7b2761c570c0059d2c2853a5fd5a837fce2edcdf2c6517ee5c483788c82ec4479f7e6da269f9baaf1e33eb040e69f81f546bdea64fbb819abe6813a679f9bed70e1eb779c3cacb1fdbb4aa0d51e1c24df3f6ed6fd22feb6b487629d5949945f71388ab90c1b3329621e014898b8d190e406147fffa44a611684bac90d8e1f75b215e9d7cbae9e1e71426381d96c07272112441c4b358f4f79ee5992c7e786432e0f83bf077a1e3dff91a1d0d5b361063b159534d588d90ca4003a9b1d660390d026410586552aed1c951f8737c9bb51a418f4a4fa2d261c3e22c19e94b260a2ccd6d231bbe5a7d440651c7e7d980e6f7f3bfa3b63e297801f709856ca3fc1b721fc37d0df739744d8e0347dc771473b6bb54db2fdfff913ae1141590efbddb41bba902d7577ede595b3ca418449c7ed8db2e9a7dea17ae9a6644faa9c7e2fb77ac7d263374cf9fa7feea1fd5f0f0fcf60d2b96b76f5c75e7f6edaba784a7c754817ee3dfe9a45f94eb57e081f0ed73c5388feafa02dd8d6e36bc74761cdcf139ed85e1e7f5d0ef71278faceb6c5ab81376321826c20f31faa1ffa8b3e9f6d419071b436eafc50936b8d885ca49104d62c23d74758d4a3d47f7ebcbb95c63b650dd746a3819eb7e8a3ae44b9b49e5f2340abb644da17daedcc0869f63fd74b8576c283a868e26e33c1fa3efa9aecdefdf828de06845c5e7e96f659c7d9bd89758380cca8c83daa9dbcd9bfde8635df76f4a7d85d7677a11566168bfd9e2ebf32d439de07ae476d02edf7606934b7fe3d85f3ab59374646a4344a4ecb0c7de7adc8786caca8fe02500aefb4125d47e29e44f93497557e7e6ebb66076aab4e95b545f2b0ce99fabada93e5fbdadf35f750eb8249ce22a9fa47980a57cf8f88ba7fbc7869115f98ac3b23bf9657bc50e9dfc4f1c35cbafd15c2db22ea7a7c1653e5de3835e44683e08a2b862d21a682e8db3a924ae9894228667a4fafb57e82cf7773cfb31aefe4e7c8f9fe8b6fd86ce1e82da28fd8e7e079ef03618e20236308569aef7d24e0bd1c7f26f268786be9d8d200e43fbcd96823cdff8f922e5ad5eee5718c5959f54448fd972e45f2d3bbea272e63c5de406936ef6ef9429ee1a3a38f80042a74f1dee378cc8c98b16efa3a42fee7cd45f7eb1a6bbf3669d052e815b60c86101c40f1936b62cd712a53e49c70fac87985bec91c9cff1bfe7cfa1e3477e092b868d189e0d1cbd46fa5bd6df747b8db698fa0acfa4f1e6a46c601453580519b8087a87c5111bdc3a3b0a8b0c165e9cd6b3c4930606d848d749dfd16dd02942685eb660d0ed74051b9449a596739bd37d833bb83ddb7dcf2779366fe7ae5d4d8168a7baffe0efc4dfcdfa8e015de75392ed573f5f7880c67abef8288a4a12ba5f865179fb11472ffde9f1f3aefcd331b33eb6d483b0fa03d5f5eb133131b77dc3ca776fdeb8f2471056538b8f9866922a518fcefa802cd309e0819c66ae78946de29e251c66d7af079735925a5696cd4ee25993348c3752b9af58ee3391485e1f7c7ede3f26d535a7fb9e8526d5ef5cc89912aff048a74e8ee2e6b773fa3dfcfecd19a77beaf63777fa6eb164f2193f05772652d5db7cd609a7efcdf0772f2f2f9f35b1af2b441b0a52fb4dd54efdacbf7ef5b1f968534c18da6fb6f875ef193fef49beed0c2697fe2655bfe18591df7669cbba258610bc15ca47a8b8c23e9b9197c98cbbc754891f3fb6f17a1f8d6a1056faea1a78b0f04b762e37482360e62a0b7212570000000000203b4e3cb1357adcdcaa8f49213e2785acd3c5997893acde07c8f4fdf1964d3dbf35cdfb92ba1c00d15bbbf813521a19d7e3bb43fd7d7557a7e366d520351057000000000005a46ed9ba399586b8524af977947dab5d9a9624d96bbf154adc7d60ff6b0ff6f6ae3ba0cb0118474f5ddd424394f9e2e54112e18a9aee8effd059e012882b00000000803c6318865cb2eca6e552189f1552f09e8f99d7b328d1a3a4faf19099bca76be3f5bebbba82d283c4d53412571c0c29e7b80aa6507fb3b0abf3273a0b5c027105000000009027162c689d71c45ba67d4a0af1f7943dd32e4dcb0ba4aaee4998e63d1d1baf7b529701e09abeba7ade076db6ce668d52e65fd7746f7d4067814b20ae00000000007ca6b171cde9b2ccb84a487919658fb04b53c2b352f78984b86fcb96555bb11f15c885beda864d428a269dcd1a53a873167675fabd3171c903710500000000e0030b16b4561c7174d587a521afa46c331de9f6cafa0b1d3f3393e67d1d9b7b36203005f08bbeba86ffa4974fdab91c304575f5b68e27740eb804e20a000000002007ea5b6e9c5f2ecb3f4366d5e5943dd62e75e420595d3f27a3f5be3fee7de991679eb975489703e01bbdb50ddf90525cafb359131f16b3cfeeeb784967814b20ae00000000003c621817451a9a6ace338c08cf529d4747c43a3199613a7ea54c759f34e5c3eded2b38d8000079a3afaee11a7ab9c5ce654fecd53dd3ea77ed1ad459e012882b00a630bc01a68c44ced8d1dfff235d044282b5b9aa10a7c786877f57c80d9e0198ead435df745ca58c5ca1c3a8cfb14b279114426d1024a88687d4839d9dd7fd49970390777a6b1b2e9652dca3b3d972b0baab63ba4e030f405c013005993973e68caa8a0a1ed55a4616c067fafbfbdbec338798377bf607c978e085d8e3a01ee3859dfdfd2b74362563fec6d124de3e6c973a3322148494bc00f72ff4f9dfb0cf38c39f1d8d444e936565f542a973124a5d373030f0ac3e3d097d2d1fa2640b1d475b8552fe56c4620fec78e515d7e18de71f7bec71aaa2a28eaf530a71129765fa6e5ed062f72b83f1f8a732092637bf2100c01f388c7a43e34de7c8887125b5fd0ba8a8dc3e330e938e4dd449de7750257fb66de3757fb48b01282cbdb5f5e7d0f3fb373a9b2d2f90b83a59a7810720ae009862b09029338c67a8ed7f33168fb73a19f12c224434ba4767c7a14cf3829d03033fd7d994cc9f33e701122117727ac7ae5d8e8bba47ae45676d947a309d60993767ce7a7a687c59672d542251bb73f76ec74d131dffc618e83e7c259398b3445565e517adbfabd473d46bde495fa85f25934fa5fabbd930e69e7d8eeed977ecd2f45822d8301ee6dfd38de80500b867c9929b8e352a229753bbbc82dabc93a1c982ea311654f1c183f76fddba7aaf5d0c40f1e85b545f2b0cd9a5b3d9b281c4d53b751a7800e20a8029c4a8d0c82060d8c8a7bee14e619abb75d1286ec4040b203246eac91869e47c2a71c5b32ffcca026fdedcb9edd6fb335d1b091d9e6d9a33674e4b44ca0d5c964a5ce9d99d1e4afe7edcf78944de4b42e9462b4da4138c742f3e41dfe56e4ebb1596d930229274560c0e0d1de6d6dd0f020b00ffe0b5544b97d5bc973a8a2b84141fa0a289b3546c386d6541650e0fffd7962d374cea270128267d8b1a4e118648e9cde10625d45d355d9d93bc57406672debd1900101e2286f1032b3134f459ebd5012d262ea4a389d763c944620f0b979143bf2d25d6bf274828dd6b15a481c5c38880904ab972a11971e33392c98c8bc2a3e5e53ceaf64f2cd658148d7e8ffefe6fb078e159287e9f93fb23a345e2dd64496de6f7e74b585918c68a84699ea673a2aab2f2529dcc085f170b2b9e5963d1a98b01001e686cfcc6dcc69675ad4b9b17ed1032f24beac47890674458b1a0ea2483f34bb1a49ad7be6145437bdb8a5b20ac4010194a1cdcaf93592385ecd749e011882b00a608f3e7cefdac9e19fa41aa7546963ba09ea5b15ce0381d8dee6191619dcb8036ec3f1c94d913198f7791b0720cd6c1a28eddfb74f6cffa75141689236e80b1a1a1f3dcce226583f5b7488cf2ba311649baf8b691993d372495fa3ebf4684f89e977f07c054a6aeeeaaf2a696f51fa6e397b2bcfc056af35fa59e63b63e6d92a47a6caca0dabc61e5b7bb36ad84d109024d7945454c277340a19e6709c415005305a538342b9336f001bbd8d17b3f4946fe57c6ccec7c994516bb155a6f7280cf9161ff790ec6a08b8a4ea6601524684ee457954cde6e1568c68a4c0e16c1336096c09c33e7017d7cc22f01c39fa3a4bc727068e82ececba1a16f5b27082fb357a3013da43c45cfd801005250dfbce6d4c696756ba3334e1aa08ee06774bc8f8a3994baa994d8a484b8c68c0fcf696f5bb114820a848d37fef4a7dcf74f33d54e9d021e81b802600a60892232ba39cd4118ac4207588cb0db1ccff6b0eb1cbd9ecaeb8cf469c1ebb59c66b058209449f90b7637cce70c8f9f58e248ca2b78266fa2bba3aaace48d402da8937cbf954826efb5d66d09f176165ebc962b9dd8748b25a04c73fdc87de3df20dbd92bfa2e0ff20b89e10f5a7900c0287575add31a9bd77da2b165fdc67223f234b5939554cc1bfe26e9682341f5d99899386173db8ae6cd1b56fc0b5cfe405869dbb933ae9359134f1a4feb24f008c415005300123e67eba48825932923e739c1eb79c6ae4f1a2b3c1836fea395958f24943a3fd34c5190e030e6d65aaa78fc0bbae81052f286a0cce7d8c57174bd16df8b787c21ff3b16ab96a0cc0116aaf459174f5ccb95edec157dd60b5682452300c0a2a9697d7dd3f2f5b747674cdb2d0d79b7946219155397a5fe971acdd5c9a1c4f1ed1b562c2741f56f5d1baf0f4d1f06402a569b2647b1e4235bf6d7ffdf560c2e6409c415005301298fd0296bad914eba86ff8d4a262fe1b414a2d62ad4587b2d99e6fa74fb4c050d5e7fa6a43c2dd55a2a6b6d5a0af8fda652ff68654860f1de549ce4887d63dc06c71da966b8acf0ee4a1d3bf1fda2b2726c1876d7b357524ab87100402c5edc3a7369cbba2f93a8fabd28131d5474151d95743c640a75e9fea479ece6b695ef6d6f5b71c7638f5dff0aff1b00c0284f933e533a0d3c0271050070c518d7b9d1e00f240438b2e01564d45f3649201c5ae3c5efb3cafc70a3cb957973e6dc40d756933648859ea54b85d386bdd23066d3bde0288b938e88691ea6df360adf0b127127b168a5e3c649c718774c2fb357004c5538384563f3fa0f35b5ac7fb862dab40143caf54aa8d96421de4b82eaa27daf1d3ca67dc38a0bb76c58f99f4f6c5af517fdcf000013a0769372f900c80cc415005380a4527fd0493132d3922d4aa9432e6c4343bfe500188ee24088d13d9b46ca8687871d37262e1456687562477fffa7d3cde08d5c3b7dd77956411a3854bd9588c51eb0ee85c3e1e48a5926e51abe2796bba1d3c1ae827a0d15e16ef68a44a3f5c26e8b004c119634dff48ea6e5eb6f8ece3869b734c483428a25d406ee36cde407f6ec1a3c76f386159790a0fae9f6edab3dcfda031062a47ef58e12105739804d84019802b0615e555969ed0b45426bb9d3cc4b26d8ed8df762dab96b57932e4a0bbbded1cb6d9c4eb589f058acd92e9ee9c9b089f0082c1265595937a759c0b020b14e3830b22e8cdd1727ae6f6278162922e5473888c748deda6c9989c5664d5c4b36fab75d5eeb44ac7f1f897c25d3bf1dfb1d89cfd17d1ceb2e3889918d98a95fffcac87701a01459bab4f568a37cdac7c97ce4595d76556697d8879249f3e1cecd3deda6791f07a900604ad25357576e88b2ac835a98429cbfb0abe3973a0b3c82992b00a600d69a291d818e1afd12ab70022c40581059c7848880247c78cfa70fb22b9d2e0a0d2c505858f2da2627f745162496904a267fa5ff8915d67cc42d4f45a33f1d7b3f2cd7c6b2b29160189ec3ce5bee802498124a5da78b526209c631b35796c04d01ff7e236bc54840df6f1502504218c64591a5cbd69edbb87cfd3d46c5b4dd24acaea416fa68d24c2c6adfb0623e1dd73eb669551b841598eabc118bf1fac2ac31cc78af4e822cc0cc150053044b2044a3960b9bd34cd2c8ecce88813ec6a8a7a4bad369c6271d6e67ae58e02829df3afa7719fdb79d66765860b048b266b946b0d748fd7ee275f2fa2a7aef8d3a9b1afaf7f4b726ad07d3334cf7d0df3a85af69e43a59a8c6e2f1d674ae8513b166c70ce30713bf278b2ca76020233385e3decfd0b5d2dffff2c4dfc3ba2f86f1309dff017d974feb620042cfd2e5eb1618427c8a4c968b29bbd354ea6131ac1edab265d5f3f63b000063e95cb0e0e86874c69f74d62baf547775ccd46990051057004c21c6089e942e669608d0011878ad90170131162bcc7859d92c4ea773d96301a3939370fa77633f7722bcfe69ac0b5fbacf1ecbc47f3711b7df251d96788d444ed3d95152dd632fdf933f9bf7dd6211c861f3b3fdcd00080a8d8dadc7c832cbedefaf8512af0a65fe77ec60ec175d5dab5fd36f0100a4a0fb1d8b6797551ad96e7cfd08892bde541b6409c41500530c0eea20a5fc32bbbd799d8d02c164e4374d98e669610a890fc0584e3cb1357adcdcaa0f4a21df45826a58a9e4232f0f0cfde6c51757c7f45b00002ee8adad3d43caf22775d61b4a7dadbabbb355e74016405c013005996f8750bf9b9219832480e062b97a56567e87dd1593a679058415081b8661c8fac6354b8d885c28791faa8468dfb2e5e0e3a6b93a970d500198d2742f5c5c5716311ed7596f98e6fbaab76d7d44e74016405c013045b1dcce78135b218ec21a9df03126a2210432081d0d0deb4f90e56a9e94e69122219fc6fa2900fca3b7b6fe1c29e56f74d60b6af8a07a6bdd1f3ab35daf0508882b00a638bc5e076b74c2077e371046162c68ad98364d1c6d18e26047c7eafdba1800e0233d75f51f3584fca9ce7ae1c9eaae8e33751a6409c41500000000000025426f6dc367a414dfd559f728f1bdeaee8e2b750e6409f6b9020000000000a04490d23c5a273da184d8ac93200720ae0000000000002819e4313ae18964dc6cd3499003105700000000000094084a886375d23d4a3c5ffb7f5b07740ee400c4150000000000002582cc62e68a04d9069d0439027105000000000040e9304bbfba4649954de876e000c415000000000000a5c36cfdea96643c7600e2ca2720ae0000000000002801b69c75d651f472989d734d77fdf6ed7fd669902310570000000000009400d3cacbbdce5a09a5d4af7412f800c415000000000000258092dec595699abfd449e0031057000000000000940086a9bc8aab577ed1d7ddadd3c00720ae000000000000280194947374d21d4afccf6ad334750ef800c415000000000000258014e2449d7487120feb14f009882b0000000000004a01294ed1a9cc287120f6da9effd539e0131057000000000000841cc33024bdb8175742fcaa7ed7ae419d063e017105000000000040c8e95eb46826bdb8dee3ca94ea019d043e027105000000000040c8912ae265d62a96d82fff5ba7818f405c0100000000001072a414a7ea644694508f9efd4cc77e9d053e027105000000000040f8713d73254df9539d043e037105000000000040c851429ca993e951e2c0ebf137e112982720ae000000000000083952c8053a991625d5c3cddbb7bfa9b3c06720ae00000000000008313d757547d0cb6c3b971e25e44f7412e401882b000000000000428c611aec12c8fb5ca547893f0a91c0c6c17904e20a00000000008010a3a4e1ce2550889f2cecea1ad659900720ae000000000000083152aab7eb645acc64f22e9d047902e20a00000000008070f30efd9a8e2716f53edeabd3204f405c01000000000010525a0d83ec7959adb329514adca993208f405c0100000000001052deff8e3ade3cf8703b9792586250ddadd3208f405c01000000000010528c72b9482753a2847aa0ee0f9d7fd259904720ae000000000000082986c82caecca4f97d9d047906e20a000000000080f092565c29a19eadebebdea8b320cf405c0100000000001042ec6016a2c6cea540893b4cd3543a07f20cc41500000000000021e4829ac5a7d34bba6016070f0e0f224a600181b802000000000020842829ea753205eadea54f3cf1179d010500e20a000000000080302245834e39628ae47774121408882b0000000000004288146967ae362feceaead169502020ae00000000000008193d757547d0cbdbecdc644ca1fe4527410181b80200000000002064a8a43c9b5e52d9f2fd6f6c7bfc419d060504e20a000000000080906118c6529d9c8452ea3bcda699d059504020ae00000000000008195288269d9cc81bfbcdf8f7741a1418882b00000000000042c4fd0b165408291d835928a57ed0dcd3b34f67418181b802000000000020449c54397d11bd4cb373e348d0ff6fd169500420ae0000000000000817295c02d57fd57477efd219500420ae0000000000000813522cd3a9b1a84452add369502420ae00000000000008091b0da34c0ae93473f5686dcfd63e9d064502e20a0000000000809070d8a245bcdeea703b7708a5d41a9d044504e20a000000000080902055d9393a3996c76aba3b37e93428221057000000000000840429c43b75f210a6b851a7409181b802000000000020046c3cf1c428a9ab253a6ba3c4b685bd5b1fd139506420ae000000000000080187fdd5312cacaaec9c8d29d53f9ba6a974161419882b000000000000428021e47b74d24689ffabddf6f8c33a070200c415000000000000e16082b832ff09b356c1422a85df0300000000008020d35153734c5559742f2525e795507d8bb63dbe10e22a5860e60a00000000008080535956f92e7ab18415234df93508abe0017105000000000040c031843c5727472204fe5ce7408080b802000000000020c0b41a86a18478afce0a538ad598b50a26105700000000000004980f2c5a5427853886d3a4a8b62ceceaf8a57502040e882b000000000000028c5491f3745248d3fc8a4e8200027105000000000040809152bcdf4a28f168f5b6ad1bad34082410570000000000000494be458b6691bc5a444965ca0466ad020ec4150000000000000145c98af3e98543b0dfb7b0ababc72a048105e20a000000000080802285fa8050229e8863ad551880b80200000000002080fcbaa666ba90f21c25c4edb54f6c7d511783000371050000000000400079ab113d4f08155732f1cfba08041c882b0000000000008288a13e2c845cbbb0abeb355d02020ec41500000000000001e3d1d34eab2461f5f6d8ab7b6ed1452004405c010000000000103066ce38fa1c53a835f5bb760dea22100220ae00000000000008184a8a136ab73d7e8fce829000710500000000004080e8a9ab2b1762b8dd344da58b4048904ae1370300000000002028dc6f18918f98665267416810e2ff03961c8d5c6a480b380000000049454e44ae426082);

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter`
--

CREATE TABLE `ost_filter` (
  `id` int(11) UNSIGNED NOT NULL,
  `execorder` int(10) UNSIGNED NOT NULL DEFAULT 99,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `flags` int(10) UNSIGNED DEFAULT 0,
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `match_all_rules` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `stop_onmatch` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `target` enum('Any','Web','Email','API') NOT NULL DEFAULT 'Any',
  `email_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_filter`
--

INSERT INTO `ost_filter` (`id`, `execorder`, `isactive`, `flags`, `status`, `match_all_rules`, `stop_onmatch`, `target`, `email_id`, `name`, `notes`, `created`, `updated`) VALUES
(1, 99, 1, 0, 0, 0, 0, 'Email', 0, 'SYSTEM BAN LIST', 'Internal list for email banning. Do not remove', '2023-11-16 15:21:24', '2023-11-16 15:21:24');

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter_action`
--

CREATE TABLE `ost_filter_action` (
  `id` int(11) UNSIGNED NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(24) NOT NULL,
  `configuration` text DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_filter_action`
--

INSERT INTO `ost_filter_action` (`id`, `filter_id`, `sort`, `type`, `configuration`, `updated`) VALUES
(1, 1, 1, 'reject', '[]', '2023-11-16 15:21:24');

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter_rule`
--

CREATE TABLE `ost_filter_rule` (
  `id` int(11) UNSIGNED NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `what` varchar(32) NOT NULL,
  `how` enum('equal','not_equal','contains','dn_contain','starts','ends','match','not_match') NOT NULL,
  `val` varchar(255) NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_filter_rule`
--

INSERT INTO `ost_filter_rule` (`id`, `filter_id`, `what`, `how`, `val`, `isactive`, `notes`, `created`, `updated`) VALUES
(1, 1, 'email', 'equal', 'test@example.com', 1, '', '0000-00-00 00:00:00', '2023-11-16 15:21:24');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form`
--

CREATE TABLE `ost_form` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(8) NOT NULL DEFAULT 'G',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `instructions` varchar(512) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_form`
--

INSERT INTO `ost_form` (`id`, `pid`, `type`, `flags`, `title`, `instructions`, `name`, `notes`, `created`, `updated`) VALUES
(1, NULL, 'U', 1, 'Contact Information', NULL, '', NULL, '2023-11-16 15:21:23', '2023-11-16 15:21:23'),
(2, NULL, 'T', 1, 'Ticket Details', '<p>Please Describe Your Issue</p>', '', '&lt;p&gt;This form will be attached to every ticket, regardless of its source. You can add any fields to this form and they will be available to all tickets, and will be searchable with advanced search and filterable.&lt;/p&gt;', '2023-11-16 15:21:24', '2024-01-24 12:53:43'),
(3, NULL, 'C', 1, 'Company Information', 'Details available in email templates', '', NULL, '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(4, NULL, 'O', 1, 'Organization Information', 'Details on user organization', '', NULL, '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(5, NULL, 'A', 1, 'Task Details', 'Please Describe The Issue', '', 'This form is used to create a task.', '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(6, NULL, 'L1', 0, 'Ticket Status Properties', 'Properties that can be set on a ticket status.', '', NULL, '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(7, NULL, 'L2', 1, ' Categories Properties', NULL, '', NULL, '2024-01-24 12:58:20', '2024-01-24 12:58:20');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_entry`
--

CREATE TABLE `ost_form_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED DEFAULT NULL,
  `object_type` char(1) NOT NULL DEFAULT 'T',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `extra` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_form_entry`
--

INSERT INTO `ost_form_entry` (`id`, `form_id`, `object_id`, `object_type`, `sort`, `extra`, `created`, `updated`) VALUES
(1, 4, 1, 'O', 1, NULL, '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(2, 3, NULL, 'C', 1, NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(3, 1, 1, 'U', 1, NULL, '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(4, 2, 1, 'T', 0, '{\"disable\":[]}', '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(5, 1, 2, 'U', 1, NULL, '2023-11-21 15:15:15', '2023-11-21 15:15:15'),
(6, 2, 2, 'T', 0, '{\"disable\":[]}', '2023-12-07 10:25:18', '2023-12-07 10:25:18'),
(7, 1, 3, 'U', 1, NULL, '2023-12-07 10:36:33', '2023-12-07 10:36:33'),
(8, 2, 3, 'T', 0, '{\"disable\":[]}', '2023-12-07 10:36:33', '2023-12-07 10:36:33'),
(9, 1, 4, 'U', 1, NULL, '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(10, 1, 5, 'U', 1, NULL, '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(11, 1, 6, 'U', 1, NULL, '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(12, 1, 7, 'U', 1, NULL, '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(13, 1, 8, 'U', 1, NULL, '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(14, 1, 9, 'U', 1, NULL, '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(15, 1, 10, 'U', 1, NULL, '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(16, 1, 11, 'U', 1, NULL, '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(17, 1, 12, 'U', 1, NULL, '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(18, 1, 13, 'U', 1, NULL, '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(19, 1, 14, 'U', 1, NULL, '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(20, 1, 15, 'U', 1, NULL, '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(21, 1, 16, 'U', 1, NULL, '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(22, 1, 17, 'U', 1, NULL, '2023-12-07 10:47:41', '2023-12-07 10:47:41'),
(23, 1, 18, 'U', 1, NULL, '2023-12-07 10:47:41', '2023-12-07 10:47:41'),
(24, 1, 19, 'U', 1, NULL, '2023-12-07 10:47:41', '2023-12-07 10:47:41'),
(25, 1, 20, 'U', 1, NULL, '2024-01-08 09:24:09', '2024-01-08 09:24:09'),
(26, 2, 4, 'T', 0, '{\"disable\":[]}', '2024-01-08 09:26:56', '2024-01-08 09:26:56');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_entry_values`
--

CREATE TABLE `ost_form_entry_values` (
  `entry_id` int(11) UNSIGNED NOT NULL,
  `field_id` int(11) UNSIGNED NOT NULL,
  `value` text DEFAULT NULL,
  `value_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_form_entry_values`
--

INSERT INTO `ost_form_entry_values` (`entry_id`, `field_id`, `value`, `value_id`) VALUES
(2, 23, 'D\'Harmoni Telco Infra Sdn Bhd', NULL),
(2, 24, 'www.dharmoni.com', NULL),
(2, 25, NULL, NULL),
(2, 26, NULL, NULL),
(4, 20, 'osTicket Installed!', NULL),
(4, 22, NULL, NULL),
(5, 3, NULL, NULL),
(5, 4, NULL, NULL),
(6, 20, 'Laptop issue', NULL),
(6, 22, 'Normal', 2),
(7, 3, NULL, NULL),
(7, 4, NULL, NULL),
(8, 20, 'Printer', NULL),
(8, 22, 'Normal', 2),
(9, 3, NULL, NULL),
(9, 4, NULL, NULL),
(10, 3, NULL, NULL),
(10, 4, NULL, NULL),
(11, 3, NULL, NULL),
(11, 4, NULL, NULL),
(12, 3, NULL, NULL),
(12, 4, NULL, NULL),
(13, 3, NULL, NULL),
(13, 4, NULL, NULL),
(14, 3, NULL, NULL),
(14, 4, NULL, NULL),
(15, 3, NULL, NULL),
(15, 4, NULL, NULL),
(16, 3, NULL, NULL),
(16, 4, NULL, NULL),
(17, 3, NULL, NULL),
(17, 4, NULL, NULL),
(18, 3, NULL, NULL),
(18, 4, NULL, NULL),
(19, 3, NULL, NULL),
(19, 4, NULL, NULL),
(20, 3, NULL, NULL),
(20, 4, NULL, NULL),
(21, 3, NULL, NULL),
(21, 4, NULL, NULL),
(22, 3, NULL, NULL),
(22, 4, NULL, NULL),
(23, 3, NULL, NULL),
(23, 4, NULL, NULL),
(24, 3, NULL, NULL),
(24, 4, NULL, NULL),
(25, 3, NULL, NULL),
(25, 4, NULL, NULL),
(26, 20, 'printer', NULL),
(26, 22, 'Normal', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_field`
--

CREATE TABLE `ost_form_field` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED DEFAULT 1,
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `label` varchar(255) NOT NULL,
  `name` varchar(64) NOT NULL,
  `configuration` text DEFAULT NULL,
  `sort` int(11) UNSIGNED NOT NULL,
  `hint` varchar(512) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_form_field`
--

INSERT INTO `ost_form_field` (`id`, `form_id`, `flags`, `type`, `label`, `name`, `configuration`, `sort`, `hint`, `created`, `updated`) VALUES
(1, 1, 489395, 'text', 'Email Address', 'email', '{\"size\":40,\"length\":64,\"validator\":\"email\"}', 1, NULL, '2023-11-16 15:21:23', '2023-11-16 15:21:23'),
(2, 1, 489395, 'text', 'Full Name', 'name', '{\"size\":40,\"length\":64}', 2, NULL, '2023-11-16 15:21:23', '2023-11-16 15:21:23'),
(3, 1, 13057, 'phone', 'Phone Number', 'phone', NULL, 3, NULL, '2023-11-16 15:21:23', '2023-11-16 15:21:23'),
(4, 1, 12289, 'memo', 'Internal Notes', 'notes', '{\"rows\":4,\"cols\":40}', 4, NULL, '2023-11-16 15:21:23', '2023-11-16 15:21:23'),
(20, 2, 489265, 'text', 'Summary', 'subject', '{\"size\":\"40\",\"length\":\"50\",\"validator\":\"\",\"regex\":\"\",\"validator-error\":\"\",\"placeholder\":\"\"}', 2, NULL, '2023-11-16 15:21:24', '2024-01-24 17:34:48'),
(21, 2, 480547, 'thread', 'Issue Details', 'message', NULL, 3, 'Details on the reason(s) for opening the ticket.', '2023-11-16 15:21:24', '2024-01-24 17:04:40'),
(22, 2, 274609, 'priority', 'Priority Level', 'priority', NULL, 4, NULL, '2023-11-16 15:21:24', '2024-01-24 17:04:40'),
(23, 3, 291249, 'text', 'Company Name', 'name', '{\"size\":40,\"length\":64}', 1, NULL, '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(24, 3, 274705, 'text', 'Website', 'website', '{\"size\":40,\"length\":64}', 2, NULL, '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(25, 3, 274705, 'phone', 'Phone Number', 'phone', '{\"ext\":false}', 3, NULL, '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(26, 3, 12545, 'memo', 'Address', 'address', '{\"rows\":2,\"cols\":40,\"html\":false,\"length\":100}', 4, NULL, '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(27, 4, 489395, 'text', 'Name', 'name', '{\"size\":40,\"length\":64}', 1, NULL, '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(28, 4, 13057, 'memo', 'Address', 'address', '{\"rows\":2,\"cols\":40,\"length\":100,\"html\":false}', 2, NULL, '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(29, 4, 13057, 'phone', 'Phone', 'phone', NULL, 3, NULL, '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(30, 4, 13057, 'text', 'Website', 'website', '{\"size\":40,\"length\":0}', 4, NULL, '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(31, 4, 12289, 'memo', 'Internal Notes', 'notes', '{\"rows\":4,\"cols\":40}', 5, NULL, '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(32, 5, 487601, 'text', 'Title', 'title', '{\"size\":40,\"length\":50}', 1, NULL, '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(33, 5, 413939, 'thread', 'Description', 'description', NULL, 2, 'Details on the reason(s) for creating the task.', '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(34, 6, 487665, 'state', 'State', 'state', '{\"prompt\":\"State of a ticket\"}', 1, NULL, '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(35, 6, 471073, 'memo', 'Description', 'description', '{\"rows\":\"2\",\"cols\":\"40\",\"html\":\"\",\"length\":\"100\"}', 3, NULL, '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(37, 2, 13057, 'list-2', ' Categories', '', '{\"multiselect\":false,\"widget\":\"dropdown\",\"validator-error\":\"\",\"prompt\":\"\",\"default\":null}', 1, NULL, '2024-01-24 12:56:01', '2024-01-24 17:34:48');

-- --------------------------------------------------------

--
-- Table structure for table `ost_group`
--

CREATE TABLE `ost_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(120) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_help_topic`
--

CREATE TABLE `ost_help_topic` (
  `topic_id` int(11) UNSIGNED NOT NULL,
  `topic_pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `noautoresp` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED DEFAULT 0,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `priority_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `page_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sequence_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `topic` varchar(128) NOT NULL DEFAULT '',
  `number_format` varchar(32) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_help_topic`
--

INSERT INTO `ost_help_topic` (`topic_id`, `topic_pid`, `ispublic`, `noautoresp`, `flags`, `status_id`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `page_id`, `sequence_id`, `sort`, `topic`, `number_format`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 1, 'General Inquiry', NULL, 'Questions about products or services', '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(2, 0, 1, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 3, 'New Request', NULL, '<p>Tickets that primarily concern the sales and billing departments</p>', '2023-11-16 15:21:24', '2024-01-24 12:52:47'),
(10, 0, 1, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 2, 'Report a Problem', NULL, 'Product, service, or equipment related issues', '2023-11-16 15:21:24', '2024-01-24 12:52:47');

-- --------------------------------------------------------

--
-- Table structure for table `ost_help_topic_form`
--

CREATE TABLE `ost_help_topic_form` (
  `id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `extra` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_help_topic_form`
--

INSERT INTO `ost_help_topic_form` (`id`, `topic_id`, `form_id`, `sort`, `extra`) VALUES
(1, 1, 2, 1, '{\"disable\":[]}'),
(2, 2, 2, 1, '{\"disable\":[]}'),
(3, 10, 2, 1, '{\"disable\":[]}'),
(4, 11, 2, 1, '{\"disable\":[]}');

-- --------------------------------------------------------

--
-- Table structure for table `ost_list`
--

CREATE TABLE `ost_list` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_plural` varchar(255) DEFAULT NULL,
  `sort_mode` enum('Alpha','-Alpha','SortCol') NOT NULL DEFAULT 'Alpha',
  `masks` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(16) DEFAULT NULL,
  `configuration` text NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_list`
--

INSERT INTO `ost_list` (`id`, `name`, `name_plural`, `sort_mode`, `masks`, `type`, `configuration`, `notes`, `created`, `updated`) VALUES
(1, 'Ticket Status', 'Ticket Statuses', 'SortCol', 13, 'ticket-status', '{\"handler\":\"TicketStatusList\"}', 'Ticket statuses', '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(2, ' Category', ' Categories', 'Alpha', 0, NULL, '', NULL, '2024-01-24 12:58:20', '2024-01-24 12:59:24');

-- --------------------------------------------------------

--
-- Table structure for table `ost_list_items`
--

CREATE TABLE `ost_list_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `list_id` int(11) DEFAULT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `value` varchar(255) NOT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 1,
  `properties` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_list_items`
--

INSERT INTO `ost_list_items` (`id`, `list_id`, `status`, `value`, `extra`, `sort`, `properties`) VALUES
(1, 2, 1, 'Printer', NULL, 1, '[]'),
(2, 2, 1, 'Infotech', NULL, 1, '[]'),
(3, 2, 1, 'Microsoft Office', NULL, 1, '[]'),
(4, 2, 1, 'Network | Server', NULL, 1, '[]'),
(5, 2, 1, 'UBS', NULL, 1, '[]'),
(6, 2, 1, 'CCTV', NULL, 1, '[]'),
(7, 2, 1, 'Social Media | Website', NULL, 1, '[]'),
(8, 2, 1, 'Computer', NULL, 1, '[]'),
(9, 2, 1, 'Others', NULL, 1, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `ost_lock`
--

CREATE TABLE `ost_lock` (
  `lock_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `expire` datetime DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_note`
--

CREATE TABLE `ost_note` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED DEFAULT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `ext_id` varchar(10) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_organization`
--

CREATE TABLE `ost_organization` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `manager` varchar(16) NOT NULL DEFAULT '',
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `domain` varchar(256) NOT NULL DEFAULT '',
  `extra` text DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_organization`
--

INSERT INTO `ost_organization` (`id`, `name`, `manager`, `status`, `domain`, `extra`, `created`, `updated`) VALUES
(1, 'osTicket', '', 8, '', NULL, '2023-11-16 07:21:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_organization__cdata`
--

CREATE TABLE `ost_organization__cdata` (
  `org_id` int(11) UNSIGNED NOT NULL,
  `name` mediumtext DEFAULT NULL,
  `address` mediumtext DEFAULT NULL,
  `phone` mediumtext DEFAULT NULL,
  `website` mediumtext DEFAULT NULL,
  `notes` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_plugin`
--

CREATE TABLE `ost_plugin` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `install_path` varchar(60) NOT NULL,
  `isphar` tinyint(1) NOT NULL DEFAULT 0,
  `isactive` tinyint(1) NOT NULL DEFAULT 0,
  `version` varchar(64) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `installed` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_plugin_instance`
--

CREATE TABLE `ost_plugin_instance` (
  `id` int(11) UNSIGNED NOT NULL,
  `plugin_id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue`
--

CREATE TABLE `ost_queue` (
  `id` int(11) UNSIGNED NOT NULL,
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `columns_id` int(11) UNSIGNED DEFAULT NULL,
  `sort_id` int(11) UNSIGNED DEFAULT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(60) DEFAULT NULL,
  `config` text DEFAULT NULL,
  `filter` varchar(64) DEFAULT NULL,
  `root` varchar(32) DEFAULT NULL,
  `path` varchar(80) NOT NULL DEFAULT '/',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_queue`
--

INSERT INTO `ost_queue` (`id`, `parent_id`, `columns_id`, `sort_id`, `flags`, `staff_id`, `sort`, `title`, `config`, `filter`, `root`, `path`, `created`, `updated`) VALUES
(1, 0, NULL, 1, 3, 0, 1, 'Open', '[[\"status__state\",\"includes\",{\"open\":\"Open\"}]]', NULL, 'T', '/', '2023-11-16 15:21:24', '0000-00-00 00:00:00'),
(2, 1, NULL, 4, 43, 0, 1, 'Open', '{\"criteria\":[[\"isanswered\",\"nset\",null]],\"conditions\":[]}', NULL, 'T', '/', '2023-11-16 15:21:24', '0000-00-00 00:00:00'),
(3, 1, NULL, 4, 43, 0, 2, 'Answered', '{\"criteria\":[[\"isanswered\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2023-11-16 15:21:24', '0000-00-00 00:00:00'),
(4, 1, NULL, 4, 43, 0, 3, 'Overdue', '{\"criteria\":[[\"isoverdue\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2023-11-16 15:21:24', '0000-00-00 00:00:00'),
(5, 0, NULL, 3, 3, 0, 3, 'My Tickets', '{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\",\"T\":\"One of my teams\"}],[\"status__state\",\"includes\",{\"open\":\"Open\"}]],\"conditions\":[]}', NULL, 'T', '/', '2023-11-16 15:21:24', '0000-00-00 00:00:00'),
(6, 5, NULL, NULL, 43, 0, 1, 'Assigned to Me', '{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\"}]],\"conditions\":[]}', NULL, 'T', '/', '2023-11-16 15:21:24', '0000-00-00 00:00:00'),
(7, 5, NULL, NULL, 43, 0, 2, 'Assigned to Teams', '{\"criteria\":[[\"assignee\",\"!includes\",{\"M\":\"Me\"}]],\"conditions\":[]}', NULL, 'T', '/', '2023-11-16 15:21:24', '0000-00-00 00:00:00'),
(8, 0, NULL, 5, 3, 0, 4, 'Closed', '{\"criteria\":[[\"status__state\",\"includes\",{\"closed\":\"Closed\"}]],\"conditions\":[]}', NULL, 'T', '/', '2023-11-16 15:21:24', '0000-00-00 00:00:00'),
(9, 8, NULL, 5, 43, 0, 1, 'Today', '{\"criteria\":[[\"closed\",\"period\",\"td\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-11-16 15:21:24', '0000-00-00 00:00:00'),
(10, 8, NULL, 5, 43, 0, 2, 'Yesterday', '{\"criteria\":[[\"closed\",\"period\",\"yd\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-11-16 15:21:24', '0000-00-00 00:00:00'),
(11, 8, NULL, 5, 43, 0, 3, 'This Week', '{\"criteria\":[[\"closed\",\"period\",\"tw\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-11-16 15:21:24', '0000-00-00 00:00:00'),
(12, 8, NULL, 5, 43, 0, 4, 'This Month', '{\"criteria\":[[\"closed\",\"period\",\"tm\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-11-16 15:21:24', '0000-00-00 00:00:00'),
(13, 8, NULL, 6, 43, 0, 5, 'This Quarter', '{\"criteria\":[[\"closed\",\"period\",\"tq\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-11-16 15:21:24', '0000-00-00 00:00:00'),
(14, 8, NULL, 7, 43, 0, 6, 'This Year', '{\"criteria\":[[\"closed\",\"period\",\"ty\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-11-16 15:21:24', '0000-00-00 00:00:00'),
(16, 1, NULL, NULL, 57, 1, 0, 'Status', '{\"criteria\":[[\"status__id\",\"includes\",{\"1\":\"Open\",\"2\":\"Resolved\",\"3\":\"Closed\"}]],\"conditions\":[]}', NULL, 'T', '/1/16/', '2024-01-08 09:34:23', '2024-01-08 09:34:59'),
(18, 0, NULL, NULL, 1, 1, 0, 'Categories', '{\"criteria\":[[\"cdata__field_37\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2024-01-24 17:45:39', '2024-01-24 17:45:39');

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_column`
--

CREATE TABLE `ost_queue_column` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL DEFAULT '',
  `primary` varchar(64) NOT NULL DEFAULT '',
  `secondary` varchar(64) DEFAULT NULL,
  `filter` varchar(32) DEFAULT NULL,
  `truncate` varchar(16) DEFAULT NULL,
  `annotations` text DEFAULT NULL,
  `conditions` text DEFAULT NULL,
  `extra` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_queue_column`
--

INSERT INTO `ost_queue_column` (`id`, `flags`, `name`, `primary`, `secondary`, `filter`, `truncate`, `annotations`, `conditions`, `extra`) VALUES
(1, 0, 'Ticket #', 'number', NULL, 'link:ticketP', 'wrap', '[{\"c\":\"TicketSourceDecoration\",\"p\":\"b\"}]', '[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]', NULL),
(2, 0, 'Date Created', 'created', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(3, 0, 'Subject', 'cdata__subject', NULL, 'link:ticket', 'ellipsis', '[{\"c\":\"TicketThreadCount\",\"p\":\">\"},{\"c\":\"ThreadAttachmentCount\",\"p\":\"a\"},{\"c\":\"OverdueFlagDecoration\",\"p\":\"<\"},{\"c\":\"LockDecoration\",\"p\":\"<\"}]', '[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]', NULL),
(4, 0, 'User Name', 'user__name', NULL, NULL, 'wrap', '[{\"c\":\"ThreadCollaboratorCount\",\"p\":\">\"}]', '[]', NULL),
(5, 0, 'Priority', 'cdata__priority', NULL, NULL, 'wrap', '[]', '[]', NULL),
(6, 0, 'Status', 'status__id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(7, 0, 'Close Date', 'closed', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(8, 0, 'Assignee', 'assignee', NULL, NULL, 'wrap', '[]', '[]', NULL),
(9, 0, 'Due Date', 'duedate', 'est_duedate', 'date:human', 'wrap', '[]', '[]', NULL),
(10, 0, 'Last Updated', 'lastupdate', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(11, 0, 'Department', 'dept_id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(12, 0, 'Last Message', 'thread__lastmessage', NULL, 'date:human', 'wrap', '[]', '[]', NULL),
(13, 0, 'Last Response', 'thread__lastresponse', NULL, 'date:human', 'wrap', '[]', '[]', NULL),
(14, 0, 'Team', 'team_id', NULL, NULL, 'wrap', '[]', '[]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_columns`
--

CREATE TABLE `ost_queue_columns` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `column_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `bits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `heading` varchar(64) DEFAULT NULL,
  `width` int(10) UNSIGNED NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_queue_columns`
--

INSERT INTO `ost_queue_columns` (`queue_id`, `column_id`, `staff_id`, `bits`, `sort`, `heading`, `width`) VALUES
(1, 1, 0, 1, 1, 'Ticket', 100),
(1, 3, 0, 1, 3, 'Subject', 300),
(1, 4, 0, 1, 4, 'From', 185),
(1, 5, 0, 1, 5, 'Priority', 85),
(1, 8, 0, 1, 6, 'Assigned To', 160),
(1, 10, 0, 1, 2, 'Last Updated', 150),
(2, 1, 0, 1, 0, 'Ticket', 100),
(2, 3, 0, 1, 2, 'Subject', 300),
(2, 4, 0, 1, 3, 'From', 185),
(2, 5, 0, 1, 4, 'Priority', 85),
(2, 8, 0, 1, 5, 'Assigned To', 160),
(2, 10, 0, 1, 1, 'Last Updated', 150),
(3, 1, 0, 1, 1, 'Ticket', 100),
(3, 3, 0, 1, 3, 'Subject', 300),
(3, 4, 0, 1, 4, 'From', 185),
(3, 5, 0, 1, 5, 'Priority', 85),
(3, 8, 0, 1, 6, 'Assigned To', 160),
(3, 10, 0, 1, 2, 'Last Updated', 150),
(4, 1, 0, 1, 1, 'Ticket', 100),
(4, 3, 0, 1, 3, 'Subject', 300),
(4, 4, 0, 1, 4, 'From', 185),
(4, 5, 0, 1, 5, 'Priority', 85),
(4, 8, 0, 1, 6, 'Assigned To', 160),
(4, 9, 0, 1, 9, 'Due Date', 150),
(5, 1, 0, 1, 1, 'Ticket', 100),
(5, 3, 0, 1, 3, 'Subject', 300),
(5, 4, 0, 1, 4, 'From', 185),
(5, 5, 0, 1, 5, 'Priority', 85),
(5, 10, 0, 1, 2, 'Last Update', 150),
(5, 11, 0, 1, 6, 'Department', 160),
(6, 1, 0, 1, 1, 'Ticket', 100),
(6, 3, 0, 1, 3, 'Subject', 300),
(6, 4, 0, 1, 4, 'From', 185),
(6, 5, 0, 1, 5, 'Priority', 85),
(6, 10, 0, 1, 2, 'Last Update', 150),
(6, 11, 0, 1, 6, 'Department', 160),
(7, 1, 0, 1, 1, 'Ticket', 100),
(7, 3, 0, 1, 3, 'Subject', 300),
(7, 4, 0, 1, 4, 'From', 185),
(7, 5, 0, 1, 5, 'Priority', 85),
(7, 10, 0, 1, 2, 'Last Update', 150),
(7, 14, 0, 1, 6, 'Team', 160),
(8, 1, 0, 1, 1, 'Ticket', 100),
(8, 3, 0, 1, 3, 'Subject', 300),
(8, 4, 0, 1, 4, 'From', 185),
(8, 7, 0, 1, 2, 'Date Closed', 150),
(8, 8, 0, 1, 6, 'Closed By', 160),
(9, 1, 0, 1, 1, 'Ticket', 100),
(9, 3, 0, 1, 3, 'Subject', 300),
(9, 4, 0, 1, 4, 'From', 185),
(9, 7, 0, 1, 2, 'Date Closed', 150),
(9, 8, 0, 1, 6, 'Closed By', 160),
(10, 1, 0, 1, 1, 'Ticket', 100),
(10, 3, 0, 1, 3, 'Subject', 300),
(10, 4, 0, 1, 4, 'From', 185),
(10, 7, 0, 1, 2, 'Date Closed', 150),
(10, 8, 0, 1, 6, 'Closed By', 160),
(11, 1, 0, 1, 1, 'Ticket', 100),
(11, 3, 0, 1, 3, 'Subject', 300),
(11, 4, 0, 1, 4, 'From', 185),
(11, 7, 0, 1, 2, 'Date Closed', 150),
(11, 8, 0, 1, 6, 'Closed By', 160),
(12, 1, 0, 1, 1, 'Ticket', 100),
(12, 3, 0, 1, 3, 'Subject', 300),
(12, 4, 0, 1, 4, 'From', 185),
(12, 7, 0, 1, 2, 'Date Closed', 150),
(12, 8, 0, 1, 6, 'Closed By', 160),
(13, 1, 0, 1, 1, 'Ticket', 100),
(13, 3, 0, 1, 3, 'Subject', 300),
(13, 4, 0, 1, 4, 'From', 185),
(13, 7, 0, 1, 2, 'Date Closed', 150),
(13, 8, 0, 1, 6, 'Closed By', 160),
(14, 1, 0, 1, 1, 'Ticket', 100),
(14, 3, 0, 1, 3, 'Subject', 300),
(14, 4, 0, 1, 4, 'From', 185),
(14, 7, 0, 1, 2, 'Date Closed', 150),
(14, 8, 0, 1, 6, 'Closed By', 160);

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_config`
--

CREATE TABLE `ost_queue_config` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `setting` text DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_export`
--

CREATE TABLE `ost_queue_export` (
  `id` int(11) UNSIGNED NOT NULL,
  `queue_id` int(11) UNSIGNED NOT NULL,
  `path` varchar(64) NOT NULL DEFAULT '',
  `heading` varchar(64) DEFAULT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_sort`
--

CREATE TABLE `ost_queue_sort` (
  `id` int(11) UNSIGNED NOT NULL,
  `root` varchar(32) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `columns` text DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_queue_sort`
--

INSERT INTO `ost_queue_sort` (`id`, `root`, `name`, `columns`, `updated`) VALUES
(1, NULL, 'Priority + Most Recently Updated', '[\"-cdata__priority\",\"-lastupdate\"]', '2023-11-16 15:21:24'),
(2, NULL, 'Priority + Most Recently Created', '[\"-cdata__priority\",\"-created\"]', '2023-11-16 15:21:24'),
(3, NULL, 'Priority + Due Date', '[\"-cdata__priority\",\"-est_duedate\"]', '2023-11-16 15:21:24'),
(4, NULL, 'Due Date', '[\"-est_duedate\"]', '2023-11-16 15:21:24'),
(5, NULL, 'Closed Date', '[\"-closed\"]', '2023-11-16 15:21:24'),
(6, NULL, 'Create Date', '[\"-created\"]', '2023-11-16 15:21:24'),
(7, NULL, 'Update Date', '[\"-lastupdate\"]', '2023-11-16 15:21:24');

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_sorts`
--

CREATE TABLE `ost_queue_sorts` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `sort_id` int(11) UNSIGNED NOT NULL,
  `bits` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_queue_sorts`
--

INSERT INTO `ost_queue_sorts` (`queue_id`, `sort_id`, `bits`, `sort`) VALUES
(1, 1, 0, 0),
(1, 2, 0, 0),
(1, 3, 0, 0),
(1, 4, 0, 0),
(1, 6, 0, 0),
(1, 7, 0, 0),
(5, 1, 0, 0),
(5, 2, 0, 0),
(5, 3, 0, 0),
(5, 4, 0, 0),
(5, 6, 0, 0),
(5, 7, 0, 0),
(6, 1, 0, 0),
(6, 2, 0, 0),
(6, 3, 0, 0),
(6, 4, 0, 0),
(6, 6, 0, 0),
(6, 7, 0, 0),
(7, 1, 0, 0),
(7, 2, 0, 0),
(7, 3, 0, 0),
(7, 4, 0, 0),
(7, 6, 0, 0),
(7, 7, 0, 0),
(8, 1, 0, 0),
(8, 2, 0, 0),
(8, 3, 0, 0),
(8, 4, 0, 0),
(8, 5, 0, 0),
(8, 6, 0, 0),
(8, 7, 0, 0),
(9, 1, 0, 0),
(9, 2, 0, 0),
(9, 3, 0, 0),
(9, 4, 0, 0),
(9, 5, 0, 0),
(9, 6, 0, 0),
(9, 7, 0, 0),
(10, 1, 0, 0),
(10, 2, 0, 0),
(10, 3, 0, 0),
(10, 4, 0, 0),
(10, 5, 0, 0),
(10, 6, 0, 0),
(10, 7, 0, 0),
(11, 1, 0, 0),
(11, 2, 0, 0),
(11, 3, 0, 0),
(11, 4, 0, 0),
(11, 5, 0, 0),
(11, 6, 0, 0),
(11, 7, 0, 0),
(12, 1, 0, 0),
(12, 2, 0, 0),
(12, 3, 0, 0),
(12, 4, 0, 0),
(12, 5, 0, 0),
(12, 6, 0, 0),
(12, 7, 0, 0),
(13, 1, 0, 0),
(13, 2, 0, 0),
(13, 3, 0, 0),
(13, 4, 0, 0),
(13, 5, 0, 0),
(13, 6, 0, 0),
(13, 7, 0, 0),
(14, 1, 0, 0),
(14, 2, 0, 0),
(14, 3, 0, 0),
(14, 4, 0, 0),
(14, 5, 0, 0),
(14, 6, 0, 0),
(14, 7, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ost_role`
--

CREATE TABLE `ost_role` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(64) DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_role`
--

INSERT INTO `ost_role` (`id`, `flags`, `name`, `permissions`, `notes`, `created`, `updated`) VALUES
(1, 1, 'All Access', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.delete\":1,\"ticket.edit\":1,\"thread.edit\":1,\"ticket.link\":1,\"ticket.markanswered\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.delete\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}', 'Role with unlimited access', '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(2, 1, 'Expanded Access', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.edit\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}', 'Role with expanded access', '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(3, 1, 'Limited Access', '{\"ticket.assign\":1,\"ticket.create\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.reply\":1,\"task.transfer\":1}', 'Role with limited access', '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(4, 1, 'View only', NULL, 'Simple role with no permissions', '2023-11-16 15:21:24', '2023-11-16 15:21:24');

-- --------------------------------------------------------

--
-- Table structure for table `ost_schedule`
--

CREATE TABLE `ost_schedule` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_schedule`
--

INSERT INTO `ost_schedule` (`id`, `flags`, `name`, `timezone`, `description`, `created`, `updated`) VALUES
(1, 1, 'Monday - Friday 8am - 5pm with U.S. Holidays', NULL, '', '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(2, 1, '24/7', NULL, '', '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(3, 1, '24/5', NULL, '', '2023-11-16 15:21:24', '2023-11-16 15:21:24'),
(4, 0, 'U.S. Holidays', NULL, '', '2023-11-16 15:21:24', '2023-11-16 15:21:24');

-- --------------------------------------------------------

--
-- Table structure for table `ost_schedule_entry`
--

CREATE TABLE `ost_schedule_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `schedule_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `repeats` varchar(16) NOT NULL DEFAULT 'never',
  `starts_on` date DEFAULT NULL,
  `starts_at` time DEFAULT NULL,
  `ends_on` date DEFAULT NULL,
  `ends_at` time DEFAULT NULL,
  `stops_on` datetime DEFAULT NULL,
  `day` tinyint(4) DEFAULT NULL,
  `week` tinyint(4) DEFAULT NULL,
  `month` tinyint(4) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_schedule_entry`
--

INSERT INTO `ost_schedule_entry` (`id`, `schedule_id`, `flags`, `sort`, `name`, `repeats`, `starts_on`, `starts_at`, `ends_on`, `ends_at`, `stops_on`, `day`, `week`, `month`, `created`, `updated`) VALUES
(1, 1, 0, 0, 'Monday', 'weekly', '2019-01-07', '08:00:00', '2019-01-07', '17:00:00', NULL, 1, NULL, NULL, '0000-00-00 00:00:00', '2023-11-16 15:21:24'),
(2, 1, 0, 0, 'Tuesday', 'weekly', '2019-01-08', '08:00:00', '2019-01-08', '17:00:00', NULL, 2, NULL, NULL, '0000-00-00 00:00:00', '2023-11-16 15:21:24'),
(3, 1, 0, 0, 'Wednesday', 'weekly', '2019-01-09', '08:00:00', '2019-01-09', '17:00:00', NULL, 3, NULL, NULL, '0000-00-00 00:00:00', '2023-11-16 15:21:24'),
(4, 1, 0, 0, 'Thursday', 'weekly', '2019-01-10', '08:00:00', '2019-01-10', '17:00:00', NULL, 4, NULL, NULL, '0000-00-00 00:00:00', '2023-11-16 15:21:24'),
(5, 1, 0, 0, 'Friday', 'weekly', '2019-01-11', '08:00:00', '2019-01-11', '17:00:00', NULL, 5, NULL, NULL, '0000-00-00 00:00:00', '2023-11-16 15:21:24'),
(6, 2, 0, 0, 'Daily', 'daily', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2023-11-16 15:21:24'),
(7, 3, 0, 0, 'Weekdays', 'weekdays', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2023-11-16 15:21:24'),
(8, 4, 0, 0, 'New Year\'s Day', 'yearly', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, 1, NULL, 1, '0000-00-00 00:00:00', '2023-11-16 15:21:24'),
(9, 4, 0, 0, 'MLK Day', 'yearly', '2019-01-21', '00:00:00', '2019-01-21', '23:59:59', NULL, 1, 3, 1, '0000-00-00 00:00:00', '2023-11-16 15:21:24'),
(10, 4, 0, 0, 'Memorial Day', 'yearly', '2019-05-27', '00:00:00', '2019-05-27', '23:59:59', NULL, 1, -1, 5, '0000-00-00 00:00:00', '2023-11-16 15:21:24'),
(11, 4, 0, 0, 'Independence Day (4th of July)', 'yearly', '2019-07-04', '00:00:00', '2019-07-04', '23:59:59', NULL, 4, NULL, 7, '0000-00-00 00:00:00', '2023-11-16 15:21:24'),
(12, 4, 0, 0, 'Labor Day', 'yearly', '2019-09-02', '00:00:00', '2019-09-02', '23:59:59', NULL, 1, 1, 9, '0000-00-00 00:00:00', '2023-11-16 15:21:24'),
(13, 4, 0, 0, 'Indigenous Peoples\' Day (Whodat Columbus)', 'yearly', '2019-10-14', '00:00:00', '2019-10-14', '23:59:59', NULL, 1, 2, 10, '0000-00-00 00:00:00', '2023-11-16 15:21:24'),
(14, 4, 0, 0, 'Veterans Day', 'yearly', '2019-11-11', '00:00:00', '2019-11-11', '23:59:59', NULL, 11, NULL, 11, '0000-00-00 00:00:00', '2023-11-16 15:21:24'),
(15, 4, 0, 0, 'Thanksgiving Day', 'yearly', '2019-11-28', '00:00:00', '2019-11-28', '23:59:59', NULL, 4, 4, 11, '0000-00-00 00:00:00', '2023-11-16 15:21:24'),
(16, 4, 0, 0, 'Christmas Day', 'yearly', '2019-11-25', '00:00:00', '2019-11-25', '23:59:59', NULL, 25, NULL, 12, '0000-00-00 00:00:00', '2023-11-16 15:21:24');

-- --------------------------------------------------------

--
-- Table structure for table `ost_sequence`
--

CREATE TABLE `ost_sequence` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `flags` int(10) UNSIGNED DEFAULT NULL,
  `next` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `increment` int(11) DEFAULT 1,
  `padding` char(1) DEFAULT '0',
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_sequence`
--

INSERT INTO `ost_sequence` (`id`, `name`, `flags`, `next`, `increment`, `padding`, `updated`) VALUES
(1, 'General Tickets', 1, 1, 1, '0', '0000-00-00 00:00:00'),
(2, 'Tasks Sequence', 1, 1, 1, '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_session`
--

CREATE TABLE `ost_session` (
  `session_id` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `session_data` blob DEFAULT NULL,
  `session_expire` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `user_id` varchar(16) NOT NULL DEFAULT '0' COMMENT 'osTicket staff/client ID',
  `user_ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ost_session`
--

INSERT INTO `ost_session` (`session_id`, `session_data`, `session_expire`, `session_updated`, `user_id`, `user_ip`, `user_agent`) VALUES
('64uc7nvq02e0le2kap47jvq8ka', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2230383834326530353262363235316235323930633737653062393861653461366630653531303737223b733a343a2274696d65223b693a313730363439393636303b7d5f617574687c613a323a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31373a226c6f63616c3a48617269746848616b696d223b733a333a22326661223b4e3b7d733a343a2275736572223b613a313a7b733a373a22737472696b6573223b693a313b7d7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31343a222f6f737469636b65742f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2234383965313837323034376261643366316337623466363763616339323838373a313730363439393631383a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313730363530313135353b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d31312d31362031353a32313a3234223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e554c344350667a7a304239626e346b486357624d3146653d436268725270776e223b613a323a7b733a363a22636f756e7473223b613a31363a7b733a333a22713136223b643a323b733a333a22713138223b643a303b733a323a227131223b643a323b733a323a227132223b643a323b733a323a227136223b643a313b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a323b733a323a227135223b643a313b733a333a22713131223b643a303b733a323a227138223b643a323b733a333a22713132223b643a313b733a333a22713133223b643a313b733a333a22713134223b643a313b7d733a343a2274696d65223b693a313730363439393334353b7d7d6c61737463726f6e63616c6c7c693a313730363439393533333b3a513a75736572737c4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a343a2255736572223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a373a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a31313a226163636f756e745f5f6964223b733a31313a226163636f756e745f5f6964223b733a31353a226163636f756e745f5f737461747573223b733a31353a226163636f756e745f5f737461747573223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31323a227469636b65745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a227469636b65745f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a373a227469636b657473223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d3a3a513a417c733a303a22223b3a51413a3a736f72747c613a323a7b693a303b733a373a2263726561746564223b693a313b693a303b7d3a513a7461736b737c4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a343a225461736b223b733a31313a22636f6e73747261696e7473223b613a323a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31333a22666c6167735f5f686173626974223b693a313b7d7d7d7d693a313b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a323b693a323b613a333a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31333a22666c6167735f5f686173626974223b693a313b733a383a2273746166665f6964223b693a313b7d7d693a313b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31363a227469636b65745f5f73746166665f6964223b693a313b733a32313a227469636b65745f5f7374617475735f5f7374617465223b733a343a226f70656e223b7d7d693a323b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31313a22646570745f69645f5f696e223b613a333a7b693a303b693a313b693a313b693a323b693a323b693a333b7d7d7d7d7d7d7d7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a383a222d63726561746564223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a31333a7b733a323a226964223b733a323a226964223b733a363a226e756d626572223b733a363a226e756d626572223b733a373a2263726561746564223b733a373a2263726561746564223b733a383a2273746166665f6964223b733a383a2273746166665f6964223b733a373a227465616d5f6964223b733a373a227465616d5f6964223b733a31363a2273746166665f5f66697273746e616d65223b733a31363a2273746166665f5f66697273746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31323a2263646174615f5f7469746c65223b733a31323a2263646174615f5f7469746c65223b733a353a22666c616773223b733a353a22666c616773223b733a31343a227469636b65745f5f6e756d626572223b733a31343a227469636b65745f5f6e756d626572223b733a31373a227469636b65745f5f7469636b65745f6964223b733a31373a227469636b65745f5f7469636b65745f6964223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a333a7b733a31323a22636f6c6c61625f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a22636f6c6c61625f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a32313a227468726561645f5f636f6c6c61626f7261746f7273223b733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d733a31363a226174746163686d656e745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31363a226174746163686d656e745f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a22616c696173223b4e3b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a33363a227468726561645f5f656e74726965735f5f6174746163686d656e74735f5f696e6c696e65223b7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a32383a227468726561645f5f656e74726965735f5f6174746163686d656e7473223b7d733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d733a31323a227468726561645f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a227468726561645f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a22616c696173223b4e3b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a33303a227468726561645f5f656e74726965735f5f666c6167735f5f686173626974223b693a343b7d7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a31393a227468726561645f5f656e74726965735f5f6964223b7d733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d, '2024-01-29 12:10:18', '2024-01-29 11:41:00', '1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'),
('6s7oakt31ji7ovsf05kpeq9haf', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232623635626161646438323663336262373664306433646133666138386435653436373433383339223b733a343a2274696d65223b693a313731313036373731303b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2024-03-23 08:35:10', '2024-03-22 08:35:10', '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36'),
('be696clg6p23t3lmc6032fej04', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2234306137663834326435636536336439643561633939653063643633393565376566346338346139223b733a343a2274696d65223b693a313730363038313930313b7d5f617574687c613a313a7b733a343a2275736572223b4e3b7d, '2024-01-25 15:38:18', '2024-01-24 15:38:21', '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'),
('g9j1jg42fkl731nju10e1s70e9', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233316165306537303334396231636263333766323766633661383238366231646661396436303438223b733a343a2274696d65223b693a313730363038393536303b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31343a222f6f737469636b65742f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31373a226c6f63616c3a48617269746848616b696d223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2233653536383838323931653237653964393535336364646163373836636132313a313730363038393532323a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313730363039303632363b3a3a513a547c693a353b736f72747c613a323a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d31312d31362031353a32313a3234223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d693a353b613a323a7b733a333a22636f6c223b693a31313b733a333a22646972223b693a313b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e554c344350667a7a304239626e346b486357624d3146653d436268725270776e223b613a323a7b733a363a22636f756e7473223b613a31353a7b733a333a22713136223b643a323b733a323a227131223b643a323b733a323a227132223b643a323b733a323a227136223b643a313b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a323b733a323a227135223b643a313b733a333a22713131223b643a303b733a323a227138223b643a323b733a333a22713132223b643a313b733a333a22713133223b643a313b733a333a22713134223b643a313b7d733a343a2274696d65223b693a313730363038393437323b7d7d6c61737463726f6e63616c6c7c693a313730363038393436303b3a513a75736572737c4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a343a2255736572223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a373a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a31313a226163636f756e745f5f6964223b733a31313a226163636f756e745f5f6964223b733a31353a226163636f756e745f5f737461747573223b733a31353a226163636f756e745f5f737461747573223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31323a227469636b65745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a227469636b65745f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a373a227469636b657473223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d3a3a513a417c733a303a22223b3a51413a3a736f72747c613a323a7b693a303b733a343a2264657074223b693a313b733a313a2231223b7d3a513a7461736b737c4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a343a225461736b223b733a31313a22636f6e73747261696e7473223b613a323a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31333a22666c6167735f5f686173626974223b693a313b7d7d7d7d693a313b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a323b693a323b613a333a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31333a22666c6167735f5f686173626974223b693a313b733a383a2273746166665f6964223b693a313b7d7d693a313b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31363a227469636b65745f5f73746166665f6964223b693a313b733a32313a227469636b65745f5f7374617475735f5f7374617465223b733a343a226f70656e223b7d7d693a323b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31313a22646570745f69645f5f696e223b613a333a7b693a303b693a313b693a313b693a323b693a323b693a333b7d7d7d7d7d7d7d7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b613a323a7b693a303b733a31303a22646570745f5f6e616d65223b693a313b733a333a22415343223b7d7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a31333a7b733a323a226964223b733a323a226964223b733a363a226e756d626572223b733a363a226e756d626572223b733a373a2263726561746564223b733a373a2263726561746564223b733a383a2273746166665f6964223b733a383a2273746166665f6964223b733a373a227465616d5f6964223b733a373a227465616d5f6964223b733a31363a2273746166665f5f66697273746e616d65223b733a31363a2273746166665f5f66697273746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31323a2263646174615f5f7469746c65223b733a31323a2263646174615f5f7469746c65223b733a353a22666c616773223b733a353a22666c616773223b733a31343a227469636b65745f5f6e756d626572223b733a31343a227469636b65745f5f6e756d626572223b733a31373a227469636b65745f5f7469636b65745f6964223b733a31373a227469636b65745f5f7469636b65745f6964223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a333a7b733a31323a22636f6c6c61625f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a22636f6c6c61625f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a32313a227468726561645f5f636f6c6c61626f7261746f7273223b733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d733a31363a226174746163686d656e745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31363a226174746163686d656e745f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a22616c696173223b4e3b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a33363a227468726561645f5f656e74726965735f5f6174746163686d656e74735f5f696e6c696e65223b7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a32383a227468726561645f5f656e74726965735f5f6174746163686d656e7473223b7d733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d733a31323a227468726561645f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a227468726561645f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a22616c696173223b4e3b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a33303a227468726561645f5f656e74726965735f5f666c6167735f5f686173626974223b693a343b7d7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a31393a227468726561645f5f656e74726965735f5f6964223b7d733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d3a553a7469636b6574737c4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a363a225469636b6574223b733a31313a22636f6e73747261696e7473223b613a323a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31333a227469636b65745f69645f5f696e223b4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a363a225469636b6574223b733a31313a22636f6e73747261696e7473223b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a373a22757365725f6964223b693a393b7d7d7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a303a7b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a313a7b693a303b733a393a227469636b65745f6964223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a303a7b7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a313a7b693a303b613a323a7b693a303b4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a363a225469636b6574223b733a31313a22636f6e73747261696e7473223b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a33303a227468726561645f5f636f6c6c61626f7261746f72735f5f757365725f6964223b693a393b7d7d7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a303a7b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a313a7b693a303b733a393a227469636b65745f6964223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a303a7b7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a333b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d693a313b623a303b7d7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a333b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d7d7d693a313b4f3a313a2251223a333a7b693a303b693a303b693a313b693a323b693a323b613a333a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31333a227374617475735f5f7374617465223b733a343a226f70656e223b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a323b693a323b613a333a7b733a383a2273746166665f6964223b693a313b733a33343a227468726561645f5f726566657272616c735f5f6167656e745f5f73746166665f6964223b693a313b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a32353a226368696c645f7468726561645f5f6f626a6563745f74797065223b733a313a2243223b733a34303a226368696c645f7468726561645f5f726566657272616c735f5f6167656e745f5f73746166665f6964223b693a313b7d7d7d7d7d7d7d7d693a313b4f3a313a2251223a333a7b693a303b693a303b693a313b693a323b693a323b613a323a7b733a31313a22646570745f69645f5f696e223b613a333a7b693a303b693a313b693a313b693a323b693a323b693a333b7d733a33313a227468726561645f5f726566657272616c735f5f646570745f5f69645f5f696e223b613a333a7b693a303b693a313b693a313b693a323b693a323b693a333b7d7d7d693a323b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a32353a226368696c645f7468726561645f5f6f626a6563745f74797065223b733a313a2243223b733a33373a226368696c645f7468726561645f5f726566657272616c735f5f646570745f5f69645f5f696e223b613a333a7b693a303b693a313b693a313b693a323b693a323b693a333b7d7d7d7d7d7d7d7d733a31363a22706174685f636f6e73747261696e7473223b613a313a7b733a343a226c6f636b223b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31363a226c6f636b5f5f6578706972655f5f6774223b4f3a31313a2253716c46756e6374696f6e223a333a7b733a353a22616c696173223b4e3b733a343a2266756e63223b733a333a224e4f57223b733a343a2261726773223b613a303a7b7d7d7d7d7d7d733a383a226f72646572696e67223b613a313a7b693a303b733a383a222d63726561746564223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a32313a7b733a383a2273746166665f6964223b733a383a2273746166665f6964223b733a31363a2273746166665f5f66697273746e616d65223b733a31363a2273746166665f5f66697273746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a227465616d5f5f6e616d65223b733a373a227465616d5f6964223b733a373a227465616d5f6964223b733a31333a226c6f636b5f5f6c6f636b5f6964223b733a31333a226c6f636b5f5f6c6f636b5f6964223b733a31343a226c6f636b5f5f73746166665f6964223b733a31343a226c6f636b5f5f73746166665f6964223b733a393a2269736f766572647565223b733a393a2269736f766572647565223b733a393a227374617475735f6964223b733a393a227374617475735f6964223b733a31323a227374617475735f5f6e616d65223b733a31323a227374617475735f5f6e616d65223b733a31333a227374617475735f5f7374617465223b733a31333a227374617475735f5f7374617465223b733a363a226e756d626572223b733a363a226e756d626572223b733a31343a2263646174615f5f7375626a656374223b733a31343a2263646174615f5f7375626a656374223b733a393a227469636b65745f6964223b733a393a227469636b65745f6964223b733a363a22736f75726365223b733a363a22736f75726365223b733a373a22646570745f6964223b733a373a22646570745f6964223b733a31303a22646570745f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a373a22757365725f6964223b733a373a22757365725f6964223b733a32383a22757365725f5f64656661756c745f656d61696c5f5f61646472657373223b733a32383a22757365725f5f64656661756c745f656d61696c5f5f61646472657373223b733a31303a22757365725f5f6e616d65223b733a31303a22757365725f5f6e616d65223b733a31303a226c617374757064617465223b733a31303a226c617374757064617465223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a333a7b733a31323a22636f6c6c61625f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a22636f6c6c61625f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a32313a227468726561645f5f636f6c6c61626f7261746f7273223b733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d733a31363a226174746163686d656e745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31363a226174746163686d656e745f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a22616c696173223b4e3b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a33363a227468726561645f5f656e74726965735f5f6174746163686d656e74735f5f696e6c696e65223b7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a32383a227468726561645f5f656e74726965735f5f6174746163686d656e7473223b7d733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d733a31323a227468726561645f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a227468726561645f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a22616c696173223b4e3b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a33303a227468726561645f5f656e74726965735f5f666c6167735f5f686173626974223b693a343b7d7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a31393a227468726561645f5f656e74726965735f5f6964223b7d733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a313a7b693a303b733a393a227469636b65745f6964223b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d3a666f726d2d646174617c613a333a7b733a31343a226337613537313565663436643833223b733a303a22223b733a31343a223233333363303762336539383564223b613a313a7b693a303b733a303a22223b7d733a31343a223235373538313236343861613934223b733a303a22223b7d6164767365617263687c613a313a7b733a31303a2258695837774937427134223b613a313a7b693a303b613a333a7b693a303b733a31353a2263646174615f5f6669656c645f3337223b693a313b733a333a22736574223b693a323b4e3b7d7d7d, '2024-01-24 18:15:22', '2024-01-24 17:46:01', '1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'),
('i3ce0q92ajhda7dvbimif2u61s', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2230383834326530353262363235316235323930633737653062393861653461366630653531303737223b733a343a2274696d65223b693a313730363439393335343b7d5f617574687c613a323a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31373a226c6f63616c3a48617269746848616b696d223b733a333a22326661223b4e3b7d733a343a2275736572223b613a313a7b733a373a22737472696b6573223b693a313b7d7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31343a222f6f737469636b65742f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2230623735366632303430363039633530353166386562613331613961376466633a313730363439393334343a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313730363439393335343b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d31312d31362031353a32313a3234223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e554c344350667a7a304239626e346b486357624d3146653d436268725270776e223b613a323a7b733a363a22636f756e7473223b613a31363a7b733a333a22713136223b643a323b733a333a22713138223b643a303b733a323a227131223b643a323b733a323a227132223b643a323b733a323a227136223b643a313b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a323b733a323a227135223b643a313b733a333a22713131223b643a303b733a323a227138223b643a323b733a333a22713132223b643a313b733a333a22713133223b643a313b733a333a22713134223b643a313b7d733a343a2274696d65223b693a313730363439393334353b7d7d6c61737463726f6e63616c6c7c693a313730363439393334353b3a513a75736572737c4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a343a2255736572223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a373a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a31313a226163636f756e745f5f6964223b733a31313a226163636f756e745f5f6964223b733a31353a226163636f756e745f5f737461747573223b733a31353a226163636f756e745f5f737461747573223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31323a227469636b65745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a227469636b65745f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a373a227469636b657473223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d3a3a513a417c733a303a22223b3a51413a3a736f72747c613a323a7b693a303b733a373a2263726561746564223b693a313b693a303b7d3a513a7461736b737c4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a343a225461736b223b733a31313a22636f6e73747261696e7473223b613a323a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31333a22666c6167735f5f686173626974223b693a313b7d7d7d7d693a313b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a323b693a323b613a333a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31333a22666c6167735f5f686173626974223b693a313b733a383a2273746166665f6964223b693a313b7d7d693a313b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31363a227469636b65745f5f73746166665f6964223b693a313b733a32313a227469636b65745f5f7374617475735f5f7374617465223b733a343a226f70656e223b7d7d693a323b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31313a22646570745f69645f5f696e223b613a333a7b693a303b693a313b693a313b693a323b693a323b693a333b7d7d7d7d7d7d7d7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a383a222d63726561746564223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a31333a7b733a323a226964223b733a323a226964223b733a363a226e756d626572223b733a363a226e756d626572223b733a373a2263726561746564223b733a373a2263726561746564223b733a383a2273746166665f6964223b733a383a2273746166665f6964223b733a373a227465616d5f6964223b733a373a227465616d5f6964223b733a31363a2273746166665f5f66697273746e616d65223b733a31363a2273746166665f5f66697273746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31323a2263646174615f5f7469746c65223b733a31323a2263646174615f5f7469746c65223b733a353a22666c616773223b733a353a22666c616773223b733a31343a227469636b65745f5f6e756d626572223b733a31343a227469636b65745f5f6e756d626572223b733a31373a227469636b65745f5f7469636b65745f6964223b733a31373a227469636b65745f5f7469636b65745f6964223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a333a7b733a31323a22636f6c6c61625f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a22636f6c6c61625f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a32313a227468726561645f5f636f6c6c61626f7261746f7273223b733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d733a31363a226174746163686d656e745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31363a226174746163686d656e745f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a22616c696173223b4e3b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a33363a227468726561645f5f656e74726965735f5f6174746163686d656e74735f5f696e6c696e65223b7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a32383a227468726561645f5f656e74726965735f5f6174746163686d656e7473223b7d733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d733a31323a227468726561645f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a227468726561645f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a22616c696173223b4e3b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a33303a227468726561645f5f656e74726965735f5f666c6167735f5f686173626974223b693a343b7d7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a31393a227468726561645f5f656e74726965735f5f6964223b7d733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d5454447c693a313730363439393437353b, '2024-01-29 11:37:55', '2024-01-29 11:35:55', '1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'),
('o5isa8l141kdar110ll7r38079', 0x637372667c4e3b, '2024-01-25 11:18:50', '2024-01-24 11:18:50', '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'),
('pi3ou5p53suubq0jl5jk7ktj48', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264386238616537336131396664653837353365643266313132366664626138386332353735383439223b733a343a2274696d65223b693a313730363439393236393b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31343a222f6f737469636b65742f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31373a226c6f63616c3a48617269746848616b696d223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2234376666366330393466623964366564663564323630306630656233363631363a313730363439393235393a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313730363439393236393b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d31312d31362031353a32313a3234223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22417369612f53696e6761706f7265223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e554c344350667a7a304239626e346b486357624d3146653d436268725270776e223b613a323a7b733a363a22636f756e7473223b613a31363a7b733a333a22713136223b643a323b733a333a22713138223b643a303b733a323a227131223b643a323b733a323a227132223b643a323b733a323a227136223b643a313b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a323b733a323a227135223b643a313b733a333a22713131223b643a303b733a323a227138223b643a323b733a333a22713132223b643a313b733a333a22713133223b643a313b733a333a22713134223b643a313b7d733a343a2274696d65223b693a313730363439393236303b7d7d6c61737463726f6e63616c6c7c693a313730363439393236313b3a3a513a417c733a303a22223b3a51413a3a736f72747c613a323a7b693a303b733a373a2263726561746564223b693a313b693a303b7d3a513a7461736b737c4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a343a225461736b223b733a31313a22636f6e73747261696e7473223b613a323a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31333a22666c6167735f5f686173626974223b693a313b7d7d7d7d693a313b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a323b693a323b613a333a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31333a22666c6167735f5f686173626974223b693a313b733a383a2273746166665f6964223b693a313b7d7d693a313b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31363a227469636b65745f5f73746166665f6964223b693a313b733a32313a227469636b65745f5f7374617475735f5f7374617465223b733a343a226f70656e223b7d7d693a323b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31313a22646570745f69645f5f696e223b613a333a7b693a303b693a313b693a313b693a323b693a323b693a333b7d7d7d7d7d7d7d7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a383a222d63726561746564223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a31333a7b733a323a226964223b733a323a226964223b733a363a226e756d626572223b733a363a226e756d626572223b733a373a2263726561746564223b733a373a2263726561746564223b733a383a2273746166665f6964223b733a383a2273746166665f6964223b733a373a227465616d5f6964223b733a373a227465616d5f6964223b733a31363a2273746166665f5f66697273746e616d65223b733a31363a2273746166665f5f66697273746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31323a2263646174615f5f7469746c65223b733a31323a2263646174615f5f7469746c65223b733a353a22666c616773223b733a353a22666c616773223b733a31343a227469636b65745f5f6e756d626572223b733a31343a227469636b65745f5f6e756d626572223b733a31373a227469636b65745f5f7469636b65745f6964223b733a31373a227469636b65745f5f7469636b65745f6964223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a333a7b733a31323a22636f6c6c61625f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a22636f6c6c61625f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a32313a227468726561645f5f636f6c6c61626f7261746f7273223b733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d733a31363a226174746163686d656e745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31363a226174746163686d656e745f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a22616c696173223b4e3b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a33363a227468726561645f5f656e74726965735f5f6174746163686d656e74735f5f696e6c696e65223b7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a32383a227468726561645f5f656e74726965735f5f6174746163686d656e7473223b7d733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d733a31323a227468726561645f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a227468726561645f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a22616c696173223b4e3b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a33303a227468726561645f5f656e74726965735f5f666c6167735f5f686173626974223b693a343b7d7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a31393a227468726561645f5f656e74726965735f5f6964223b7d733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d3a513a75736572737c4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a343a2255736572223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a373a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a31313a226163636f756e745f5f6964223b733a31313a226163636f756e745f5f6964223b733a31353a226163636f756e745f5f737461747573223b733a31353a226163636f756e745f5f737461747573223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31323a227469636b65745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a227469636b65745f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a373a227469636b657473223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d5454447c693a313730363439393339303b, '2024-01-29 11:36:30', '2024-01-29 11:34:30', '1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `ost_sla`
--

CREATE TABLE `ost_sla` (
  `id` int(11) UNSIGNED NOT NULL,
  `schedule_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 3,
  `grace_period` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_sla`
--

INSERT INTO `ost_sla` (`id`, `schedule_id`, `flags`, `grace_period`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 3, 18, 'Default SLA', NULL, '2023-11-16 15:21:23', '2023-11-16 15:21:23');

-- --------------------------------------------------------

--
-- Table structure for table `ost_staff`
--

CREATE TABLE `ost_staff` (
  `staff_id` int(11) UNSIGNED NOT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `locale` varchar(16) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT 1,
  `isadmin` tinyint(1) NOT NULL DEFAULT 0,
  `isvisible` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `onvacation` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `assigned_only` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `show_assigned_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `change_passwd` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `max_page_size` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `auto_refresh_rate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `default_signature_type` enum('none','mine','dept') NOT NULL DEFAULT 'none',
  `default_paper_size` enum('Letter','Legal','Ledger','A4','A3') NOT NULL DEFAULT 'Letter',
  `extra` text DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `passwdreset` datetime DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_staff`
--

INSERT INTO `ost_staff` (`staff_id`, `dept_id`, `role_id`, `username`, `firstname`, `lastname`, `passwd`, `backend`, `email`, `phone`, `phone_ext`, `mobile`, `signature`, `lang`, `timezone`, `locale`, `notes`, `isactive`, `isadmin`, `isvisible`, `onvacation`, `assigned_only`, `show_assigned_tickets`, `change_passwd`, `max_page_size`, `auto_refresh_rate`, `default_signature_type`, `default_paper_size`, `extra`, `permissions`, `created`, `lastlogin`, `passwdreset`, `updated`) VALUES
(1, 1, 1, 'HarithHakim', 'Harith', 'hakim', '$2a$08$L6DPz8ZDaMsBTiAC0/ePouJ6uXtndlpXi4qGAvFSvdj7aseNrHwI6', NULL, 'harithkly@gmail.com', '', NULL, '', '', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 25, 0, 'none', 'Letter', '{\"browser_lang\":\"en_US\"}', '{\"user.create\":1,\"user.delete\":1,\"user.edit\":1,\"user.manage\":1,\"user.dir\":1,\"org.create\":1,\"org.delete\":1,\"org.edit\":1,\"faq.manage\":1,\"visibility.agents\":1,\"emails.banlist\":1,\"visibility.departments\":1}', '2023-11-16 15:21:25', '2024-03-22 08:35:07', '2023-11-16 15:21:25', '2024-03-22 08:35:07');

-- --------------------------------------------------------

--
-- Table structure for table `ost_staff_dept_access`
--

CREATE TABLE `ost_staff_dept_access` (
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_syslog`
--

CREATE TABLE `ost_syslog` (
  `log_id` int(11) UNSIGNED NOT NULL,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_syslog`
--

INSERT INTO `ost_syslog` (`log_id`, `log_type`, `title`, `log`, `logger`, `ip_address`, `created`, `updated`) VALUES
(14, 'Warning', 'Failed login attempt (user)', 'Username: HarithHakim IP: ::1 Time: Jan 24, 2024, 3:54 am UTC Attempts: 3', '', '::1', '2024-01-24 11:54:39', '2024-01-24 11:54:39'),
(15, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [df04574d0347c92a1d37ae09210dceafef95471e] on http://localhost/osticket/login.php', '', '::1', '2024-01-24 11:55:31', '2024-01-24 11:55:31'),
(16, 'Warning', 'Failed agent login attempt (HarithHakim)', 'Username: HarithHakim IP: ::1 Time: Mar 22, 2024, 12:34 am UTC Attempts: 3', '', '::1', '2024-03-22 08:34:42', '2024-03-22 08:34:42');

-- --------------------------------------------------------

--
-- Table structure for table `ost_task`
--

CREATE TABLE `ost_task` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `object_type` char(1) NOT NULL,
  `number` varchar(20) DEFAULT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lock_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `duedate` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_task__cdata`
--

CREATE TABLE `ost_task__cdata` (
  `task_id` int(11) UNSIGNED NOT NULL,
  `title` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_team`
--

CREATE TABLE `ost_team` (
  `team_id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(125) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_team`
--

INSERT INTO `ost_team` (`team_id`, `lead_id`, `flags`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'Level I Support', 'Tier 1 support, responsible for the initial iteraction with customers', '2023-11-16 15:21:24', '2023-11-16 15:21:24');

-- --------------------------------------------------------

--
-- Table structure for table `ost_team_member`
--

CREATE TABLE `ost_team_member` (
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread`
--

CREATE TABLE `ost_thread` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` char(1) NOT NULL,
  `extra` text DEFAULT NULL,
  `lastresponse` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_thread`
--

INSERT INTO `ost_thread` (`id`, `object_id`, `object_type`, `extra`, `lastresponse`, `lastmessage`, `created`) VALUES
(1, 1, 'T', NULL, '2023-12-07 10:36:56', '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(2, 2, 'T', NULL, NULL, '2023-12-07 10:25:18', '2023-12-07 10:25:18'),
(3, 3, 'T', NULL, NULL, '2023-12-07 10:36:33', '2023-12-07 10:36:33'),
(4, 4, 'T', NULL, NULL, '2024-01-08 09:26:56', '2024-01-08 09:26:56');

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_collaborator`
--

CREATE TABLE `ost_thread_collaborator` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `role` char(1) NOT NULL DEFAULT 'M',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_entry`
--

CREATE TABLE `ost_thread_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `type` char(1) NOT NULL DEFAULT '',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `poster` varchar(128) NOT NULL DEFAULT '',
  `editor` int(10) UNSIGNED DEFAULT NULL,
  `editor_type` char(1) DEFAULT NULL,
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `format` varchar(16) NOT NULL DEFAULT 'html',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `extra` text DEFAULT NULL,
  `recipients` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_thread_entry`
--

INSERT INTO `ost_thread_entry` (`id`, `pid`, `thread_id`, `staff_id`, `user_id`, `type`, `flags`, `poster`, `editor`, `editor_type`, `source`, `title`, `body`, `format`, `ip_address`, `extra`, `recipients`, `created`, `updated`) VALUES
(1, 0, 1, 0, 1, 'M', 65, 'osTicket Team', NULL, NULL, 'Web', 'osTicket Installed!', ' <p>Thank you for choosing osTicket. </p> <p>Please make sure you join the <a href=\"https://forum.osticket.com\">osTicket forums</a> and our <a href=\"https://osticket.com\">mailing list</a> to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the <a href=\"https://docs.osticket.com\">osTicket Docs</a> provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community. </p> <p>If you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs. </p> <p>If the idea of managing and upgrading this osTicket installation is daunting, you can try osTicket as a hosted service at <a href=\"https://supportsystem.com\">https://supportsystem.com/</a> -- no installation required and we can import your data! With SupportSystem\'s turnkey infrastructure, you get osTicket at its best, leaving you free to focus on your customers without the burden of making sure the application is stable, maintained, and secure. </p> <p>Cheers, </p> <p>-<br /> osTicket Team - https://osticket.com/ </p> <p><strong>PS.</strong> Don\'t just make customers happy, make happy customers! </p>', 'html', '::1', NULL, NULL, '2023-11-16 15:21:25', '0000-00-00 00:00:00'),
(2, 0, 2, 0, 2, 'M', 65, 'test test', NULL, NULL, '', NULL, '<p>Laptop cannot boot! Help</p>', 'html', '::1', NULL, NULL, '2023-12-07 10:25:18', '0000-00-00 00:00:00'),
(3, 0, 3, 0, 3, 'M', 65, 'harith hakim', NULL, NULL, '', NULL, '<p>Cannot print </p>', 'html', '::1', NULL, NULL, '2023-12-07 10:36:33', '0000-00-00 00:00:00'),
(4, 1, 1, 1, 0, 'R', 576, 'Harith hakim', NULL, NULL, '', NULL, '<p><br /></p> <blockquote><p>Thank you for choosing osTicket. </p> <p>Please make sure you join the <a href=\"https://forum.osticket.com\">osTicket forums</a> and our <a href=\"https://osticket.com\">mailing list</a> to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the <a href=\"https://docs.osticket.com\">osTicket Docs</a> provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community. </p> <p>If you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs. </p> <p>If the idea of managing and upgrading this osTicket installation is daunting, you can try osTicket as a hosted service at <a href=\"https://supportsystem.com\">https://supportsystem.com/</a> -- no installation required and we can import your data! With SupportSystem\'s turnkey infrastructure, you get osTicket at its best, leaving you free to focus on your customers without the burden of making sure the application is stable, maintained, and secure. </p> <p>Cheers, </p> <p>-<br /> osTicket Team - https://osticket.com/ </p> <p><strong>PS.</strong> Don\'t just make customers happy, make happy customers! </p></blockquote> <p><br /></p>', 'html', '::1', NULL, '{\"to\":{\"1\":\"osTicket Team <feedback@osticket.com>\"}}', '2023-12-07 10:36:56', '0000-00-00 00:00:00'),
(5, 0, 4, 0, 20, 'M', 65, 'Test', NULL, NULL, '', NULL, '<p>Cannot connect to printer</p>', 'html', '::1', NULL, NULL, '2024-01-08 09:26:56', '0000-00-00 00:00:00'),
(6, 0, 4, 1, 0, 'N', 64, 'Harith hakim', NULL, NULL, '', 'Status Changed', '<p>resolved</p> <p><br /></p>', 'html', '::1', NULL, NULL, '2024-01-08 09:33:34', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_entry_email`
--

CREATE TABLE `ost_thread_entry_email` (
  `id` int(11) UNSIGNED NOT NULL,
  `thread_entry_id` int(11) UNSIGNED NOT NULL,
  `email_id` int(11) UNSIGNED DEFAULT NULL,
  `mid` varchar(255) NOT NULL,
  `headers` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_entry_merge`
--

CREATE TABLE `ost_thread_entry_merge` (
  `id` int(11) UNSIGNED NOT NULL,
  `thread_entry_id` int(11) UNSIGNED NOT NULL,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_event`
--

CREATE TABLE `ost_thread_event` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `thread_type` char(1) NOT NULL DEFAULT '',
  `event_id` int(11) UNSIGNED DEFAULT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `team_id` int(11) UNSIGNED NOT NULL,
  `dept_id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL,
  `data` varchar(1024) DEFAULT NULL COMMENT 'Encoded differences',
  `username` varchar(128) NOT NULL DEFAULT 'SYSTEM',
  `uid` int(11) UNSIGNED DEFAULT NULL,
  `uid_type` char(1) NOT NULL DEFAULT 'S',
  `annulled` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_thread_event`
--

INSERT INTO `ost_thread_event` (`id`, `thread_id`, `thread_type`, `event_id`, `staff_id`, `team_id`, `dept_id`, `topic_id`, `data`, `username`, `uid`, `uid_type`, `annulled`, `timestamp`) VALUES
(1, 1, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 1, 'U', 0, '2023-11-16 15:21:25'),
(2, 1, 'T', 8, 0, 0, 1, 1, NULL, 'SYSTEM', NULL, 'S', 0, '2023-11-21 15:19:06'),
(3, 2, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 2, 'U', 0, '2023-12-07 10:25:18'),
(4, 3, 'T', 1, 0, 0, 3, 10, NULL, 'SYSTEM', 3, 'U', 0, '2023-12-07 10:36:33'),
(5, 1, 'T', 2, 1, 0, 1, 1, '{\"status\":[2,\"Resolved\"]}', 'HarithHakim', 1, 'S', 0, '2023-12-07 10:36:56'),
(6, 2, 'T', 8, 0, 0, 1, 1, NULL, 'SYSTEM', NULL, 'S', 0, '2024-01-05 11:22:13'),
(7, 3, 'T', 8, 0, 0, 3, 10, NULL, 'SYSTEM', NULL, 'S', 0, '2024-01-05 11:22:13'),
(8, 3, 'T', 4, 1, 0, 3, 10, '{\"claim\":true}', 'HarithHakim', 1, 'S', 0, '2024-01-05 12:09:05'),
(9, 4, 'T', 1, 0, 0, 1, 1, NULL, 'Test', 20, 'U', 0, '2024-01-08 09:26:56'),
(10, 4, 'T', 4, 1, 0, 1, 1, '{\"claim\":true}', 'HarithHakim', 1, 'S', 0, '2024-01-08 09:32:52'),
(11, 4, 'T', 2, 1, 0, 1, 1, '{\"status\":[2,\"Resolved\"]}', 'HarithHakim', 1, 'S', 0, '2024-01-08 09:33:34');

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_referral`
--

CREATE TABLE `ost_thread_referral` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` char(1) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_thread_referral`
--

INSERT INTO `ost_thread_referral` (`id`, `thread_id`, `object_id`, `object_type`, `created`) VALUES
(1, 1, 1, 'S', '2023-12-07 10:36:56'),
(2, 4, 1, 'S', '2024-01-08 09:33:34');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket`
--

CREATE TABLE `ost_ticket` (
  `ticket_id` int(11) UNSIGNED NOT NULL,
  `ticket_pid` int(11) UNSIGNED DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_email_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `topic_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `email_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `lock_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `source` enum('Web','Email','Phone','API','Other') NOT NULL DEFAULT 'Other',
  `source_extra` varchar(40) DEFAULT NULL,
  `isoverdue` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `isanswered` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `duedate` datetime DEFAULT NULL,
  `est_duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastupdate` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_ticket`
--

INSERT INTO `ost_ticket` (`ticket_id`, `ticket_pid`, `number`, `user_id`, `user_email_id`, `status_id`, `dept_id`, `sla_id`, `topic_id`, `staff_id`, `team_id`, `email_id`, `lock_id`, `flags`, `sort`, `ip_address`, `source`, `source_extra`, `isoverdue`, `isanswered`, `duedate`, `est_duedate`, `reopened`, `closed`, `lastupdate`, `created`, `updated`) VALUES
(1, NULL, '400339', 1, 0, 2, 1, 1, 1, 1, 0, 0, 0, 0, 0, '::1', 'Web', NULL, 0, 1, NULL, NULL, NULL, '2023-12-07 10:36:56', '2023-12-07 10:36:56', '2023-11-16 15:21:25', '2023-12-07 10:36:58'),
(2, NULL, '541188', 2, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '::1', 'Web', NULL, 1, 0, NULL, '2023-12-11 10:25:18', NULL, NULL, '2023-12-07 10:25:18', '2023-12-07 10:25:18', '2024-01-05 11:22:13'),
(3, NULL, '694117', 3, 0, 1, 1, 1, 10, 1, 0, 0, 0, 0, 0, '::1', 'Web', NULL, 1, 0, NULL, '2023-12-11 10:36:33', NULL, NULL, '2023-12-07 10:36:33', '2023-12-07 10:36:33', '2024-01-05 12:09:05'),
(4, NULL, '324360', 20, 0, 2, 1, 1, 1, 1, 0, 0, 0, 0, 0, '::1', 'Web', NULL, 0, 0, NULL, '2024-01-10 09:26:56', NULL, '2024-01-08 09:33:34', '2024-01-08 09:33:34', '2024-01-08 09:26:56', '2024-01-08 09:33:34');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_priority`
--

CREATE TABLE `ost_ticket_priority` (
  `priority_id` tinyint(4) NOT NULL,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(7) NOT NULL DEFAULT '',
  `priority_urgency` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ispublic` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_ticket_priority`
--

INSERT INTO `ost_ticket_priority` (`priority_id`, `priority`, `priority_desc`, `priority_color`, `priority_urgency`, `ispublic`) VALUES
(1, 'low', 'Low', '#DDFFDD', 4, 1),
(2, 'normal', 'Normal', '#FFFFF0', 3, 1),
(3, 'high', 'High', '#FEE7E7', 2, 1),
(4, 'emergency', 'Emergency', '#FEE7E7', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_status`
--

CREATE TABLE `ost_ticket_status` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `state` varchar(16) DEFAULT NULL,
  `mode` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `properties` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_ticket_status`
--

INSERT INTO `ost_ticket_status` (`id`, `name`, `state`, `mode`, `flags`, `sort`, `properties`, `created`, `updated`) VALUES
(1, 'Open', 'open', 3, 0, 1, '{\"description\":\"Open tickets.\"}', '2023-11-16 15:21:24', '0000-00-00 00:00:00'),
(2, 'Resolved', 'closed', 1, 0, 2, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Resolved tickets\"}', '2023-11-16 15:21:24', '0000-00-00 00:00:00'),
(3, 'Closed', 'closed', 3, 0, 3, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Closed tickets. Tickets will still be accessible on client and staff panels.\"}', '2023-11-16 15:21:24', '0000-00-00 00:00:00'),
(4, 'Archived', 'archived', 3, 0, 4, '{\"description\":\"Tickets only adminstratively available but no longer accessible on ticket queues and client panel.\"}', '2023-11-16 15:21:24', '0000-00-00 00:00:00'),
(5, 'Deleted', 'deleted', 3, 0, 5, '{\"description\":\"Tickets queued for deletion. Not accessible on ticket queues.\"}', '2023-11-16 15:21:24', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket__cdata`
--

CREATE TABLE `ost_ticket__cdata` (
  `ticket_id` int(11) UNSIGNED NOT NULL,
  `subject` mediumtext DEFAULT NULL,
  `priority` mediumtext DEFAULT NULL,
  `field_37` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_ticket__cdata`
--

INSERT INTO `ost_ticket__cdata` (`ticket_id`, `subject`, `priority`, `field_37`) VALUES
(1, 'osTicket Installed!', NULL, NULL),
(2, 'Laptop issue', '2', NULL),
(3, 'Printer', '2', NULL),
(4, 'printer', '2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_translation`
--

CREATE TABLE `ost_translation` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_hash` char(16) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `type` enum('phrase','article','override') DEFAULT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `revision` int(11) UNSIGNED DEFAULT NULL,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lang` varchar(16) NOT NULL DEFAULT '',
  `text` mediumtext NOT NULL,
  `source_text` text DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ost_user`
--

CREATE TABLE `ost_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `org_id` int(10) UNSIGNED NOT NULL,
  `default_email_id` int(10) NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_user`
--

INSERT INTO `ost_user` (`id`, `org_id`, `default_email_id`, `status`, `name`, `created`, `updated`) VALUES
(1, 1, 1, 0, 'osTicket Team', '2023-11-16 15:21:25', '2023-11-16 15:21:25'),
(2, 0, 2, 0, 'test test', '2023-11-21 15:15:15', '2023-11-21 15:15:15'),
(3, 0, 3, 0, 'harith hakim', '2023-12-07 10:36:33', '2023-12-07 10:36:33'),
(4, 0, 4, 0, 'SALLEH OTHMAN', '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(5, 0, 5, 0, 'JUNAIDAH KHAIRUDIN', '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(6, 0, 6, 0, 'AZNAH SAHRAN', '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(7, 0, 7, 0, 'MORITA MAAMOR', '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(8, 0, 8, 0, 'NADIAH MAAROP', '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(9, 0, 9, 0, 'HAZIQ OTHMAN', '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(10, 0, 10, 0, 'MOHD NOR ARIFFIN ABDUL HAMID', '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(11, 0, 11, 0, 'IRENA IDRIS', '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(12, 0, 12, 0, 'MOHD SUHAIMI MOHAMAD', '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(13, 0, 13, 0, 'DZULJALALIKRAM ABDUL HALIM', '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(14, 0, 14, 0, 'NUR FARAHIN MOHD SAMSUDIN', '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(15, 0, 15, 0, 'MUHAMMAD IQBAL AIZAT MAT MAZLAN', '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(16, 0, 16, 0, 'YUSAINI TASLIM', '2023-12-07 10:45:13', '2023-12-07 10:45:13'),
(17, 0, 17, 0, 'MUHAMMAD HARITH HAKIM ROSMAN', '2023-12-07 10:47:41', '2023-12-07 10:47:41'),
(18, 0, 18, 0, 'FATIN SYAHIRAH BINTI ZULKAFLE', '2023-12-07 10:47:41', '2023-12-07 10:47:41'),
(19, 0, 19, 0, 'MUHAMMAD NABIL IRFAN BIN KHAIRUL ANUAR', '2023-12-07 10:47:41', '2023-12-07 10:47:41'),
(20, 0, 20, 0, 'Test', '2024-01-08 09:24:09', '2024-01-08 09:24:09');

-- --------------------------------------------------------

--
-- Table structure for table `ost_user_account`
--

CREATE TABLE `ost_user_account` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `timezone` varchar(64) DEFAULT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `passwd` varchar(128) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `extra` text DEFAULT NULL,
  `registered` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_user_account`
--

INSERT INTO `ost_user_account` (`id`, `user_id`, `status`, `timezone`, `lang`, `username`, `passwd`, `backend`, `extra`, `registered`) VALUES
(1, 2, 0, 'Asia/Singapore', NULL, NULL, '$2a$08$1jtpAbVBuza1m3BXITt52OzkcP8l2iEl0ZgSpHpIWispHVVHh02hK', NULL, NULL, '2023-11-21 07:15:15'),
(2, 3, 0, 'Asia/Shanghai', NULL, NULL, '$2a$08$KwysI0VsMckpBawYqJexaeHNSqF3wlDLVrndHbGRFQNCGf7/Uv9w6', NULL, NULL, '2023-12-07 02:37:50'),
(3, 17, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-07 02:49:44'),
(4, 20, 1, 'Asia/Shanghai', NULL, NULL, '$2a$08$SANpSF.nphdQZjzQukoUie4/3zVLjG9.6GczOPuTZyP2XnLRQvMge', NULL, '{\"browser_lang\":\"en_US\"}', '2024-01-08 01:24:09');

-- --------------------------------------------------------

--
-- Table structure for table `ost_user_email`
--

CREATE TABLE `ost_user_email` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_user_email`
--

INSERT INTO `ost_user_email` (`id`, `user_id`, `flags`, `address`) VALUES
(1, 1, 0, 'feedback@osticket.com'),
(2, 2, 0, 'shooteronline01@gmail.com'),
(3, 3, 0, 'harith@dharmoni.com'),
(4, 4, 0, 'salleh@dharmoni.com'),
(5, 5, 0, 'jun@dharmoni.com'),
(6, 6, 0, 'aznah@dharmoni.com'),
(7, 7, 0, 'morita@dharmoni.com'),
(8, 8, 0, 'nadiah@dharmoni.com'),
(9, 9, 0, 'haziq@dharmoni.com'),
(10, 10, 0, 'ariffin@dharmoni.com'),
(11, 11, 0, 'irene@dharmoni.com'),
(12, 12, 0, 'suhaimi@dharmoni.com'),
(13, 13, 0, 'zul@dharmoni.com'),
(14, 14, 0, 'farahin@dharmoni.com'),
(15, 15, 0, 'iqbal@dharmoni.com'),
(16, 16, 0, 'yus@dharmoni.com'),
(17, 17, 0, 'harith.dharmoni@gmail.com'),
(18, 18, 0, 'fatin@dharmoni.com'),
(19, 19, 0, 'nabil@dharmoni.com'),
(20, 20, 0, 'email2@localhost.com');

-- --------------------------------------------------------

--
-- Table structure for table `ost_user__cdata`
--

CREATE TABLE `ost_user__cdata` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `email` mediumtext DEFAULT NULL,
  `name` mediumtext DEFAULT NULL,
  `phone` mediumtext DEFAULT NULL,
  `notes` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost_user__cdata`
--

INSERT INTO `ost_user__cdata` (`user_id`, `email`, `name`, `phone`, `notes`) VALUES
(2, NULL, NULL, '', ''),
(3, NULL, NULL, '', ''),
(4, NULL, NULL, '', ''),
(5, NULL, NULL, '', ''),
(6, NULL, NULL, '', ''),
(7, NULL, NULL, '', ''),
(8, NULL, NULL, '', ''),
(9, NULL, NULL, '', ''),
(10, NULL, NULL, '', ''),
(11, NULL, NULL, '', ''),
(12, NULL, NULL, '', ''),
(13, NULL, NULL, '', ''),
(14, NULL, NULL, '', ''),
(15, NULL, NULL, '', ''),
(16, NULL, NULL, '', ''),
(17, NULL, NULL, '', ''),
(18, NULL, NULL, '', ''),
(19, NULL, NULL, '', ''),
(20, NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ost__search`
--

CREATE TABLE `ost__search` (
  `object_type` varchar(8) NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ost__search`
--

INSERT INTO `ost__search` (`object_type`, `object_id`, `title`, `content`) VALUES
('H', 1, 'osTicket Installed!', 'Thank you for choosing osTicket. Please make sure you join the osTicket forums and our mailing list to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the osTicket Docs provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community. If you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs. If the idea of managing and upgrading this osTicket installation is daunting, you can try osTicket as a hosted service at https://supportsystem.com/ -- no installation required and we can import your data! With SupportSystem\'s turnkey infrastructure, you get osTicket at its best, leaving you free to focus on your customers without the burden of making sure the application is stable, maintained, and secure. Cheers, - osTicket Team - https://osticket.com/ PS. Don\'t just make customers happy, make happy customers!'),
('H', 2, '', 'Laptop cannot boot! Help'),
('H', 3, '', 'Cannot print'),
('H', 4, '', 'Thank you for choosing osTicket. Please make sure you join the osTicket forums and our mailing list to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the osTicket Docs provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community. If you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs. If the idea of managing and upgrading this osTicket installation is daunting, you can try osTicket as a hosted service at https://supportsystem.com/ -- no installation required and we can import your data! With SupportSystem\'s turnkey infrastructure, you get osTicket at its best, leaving you free to focus on your customers without the burden of making sure the application is stable, maintained, and secure. Cheers, - osTicket Team - https://osticket.com/ PS. Don\'t just make customers happy, make happy customers!'),
('H', 5, '', 'Cannot connect to printer'),
('H', 6, 'Status Changed', 'resolved'),
('O', 1, 'osTicket', ''),
('T', 1, '400339 osTicket Installed!', 'osTicket Installed!'),
('T', 2, '541188 Laptop issue', 'Laptop issue'),
('T', 3, '694117 Printer', 'Printer'),
('T', 4, '324360 printer', 'printer'),
('U', 1, 'osTicket Team', 'feedback@osticket.com'),
('U', 2, 'test test', ' shooteronline01@gmail.com\nshooteronline01@gmail.com'),
('U', 3, 'harith hakim', ' harith@dharmoni.com\nharith@dharmoni.com'),
('U', 4, 'SALLEH OTHMAN', ' salleh@dharmoni.com\nsalleh@dharmoni.com'),
('U', 5, 'JUNAIDAH KHAIRUDIN', ' jun@dharmoni.com\njun@dharmoni.com'),
('U', 6, 'AZNAH SAHRAN', ' aznah@dharmoni.com\naznah@dharmoni.com'),
('U', 7, 'MORITA MAAMOR', ' morita@dharmoni.com\nmorita@dharmoni.com'),
('U', 8, 'NADIAH MAAROP', ' nadiah@dharmoni.com\nnadiah@dharmoni.com'),
('U', 9, 'HAZIQ OTHMAN', ' haziq@dharmoni.com\nhaziq@dharmoni.com'),
('U', 10, 'MOHD NOR ARIFFIN ABDUL HAMID', ' ariffin@dharmoni.com\nariffin@dharmoni.com'),
('U', 11, 'IRENA IDRIS', ' irene@dharmoni.com\nirene@dharmoni.com'),
('U', 12, 'MOHD SUHAIMI MOHAMAD', ' suhaimi@dharmoni.com\nsuhaimi@dharmoni.com'),
('U', 13, 'DZULJALALIKRAM ABDUL HALIM', ' zul@dharmoni.com\nzul@dharmoni.com'),
('U', 14, 'NUR FARAHIN MOHD SAMSUDIN', ' farahin@dharmoni.com\nfarahin@dharmoni.com'),
('U', 15, 'MUHAMMAD IQBAL AIZAT MAT MAZLAN', ' iqbal@dharmoni.com\niqbal@dharmoni.com'),
('U', 16, 'YUSAINI TASLIM', ' yus@dharmoni.com\nyus@dharmoni.com'),
('U', 17, 'MUHAMMAD HARITH HAKIM ROSMAN', ' harith.dharmoni@gmail.com\nharith.dharmoni@gmail.com'),
('U', 18, 'FATIN SYAHIRAH BINTI ZULKAFLE', ' fatin@dharmoni.com\nfatin@dharmoni.com'),
('U', 19, 'MUHAMMAD NABIL IRFAN BIN KHAIRUL ANUAR', ' nabil@dharmoni.com\nnabil@dharmoni.com'),
('U', 20, 'Test', ' email2@localhost.com\nemail2@localhost.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ost_api_key`
--
ALTER TABLE `ost_api_key`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apikey` (`apikey`),
  ADD KEY `ipaddr` (`ipaddr`);

--
-- Indexes for table `ost_attachment`
--
ALTER TABLE `ost_attachment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file-type` (`object_id`,`file_id`,`type`),
  ADD UNIQUE KEY `file_object` (`file_id`,`object_id`);

--
-- Indexes for table `ost_canned_response`
--
ALTER TABLE `ost_canned_response`
  ADD PRIMARY KEY (`canned_id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `active` (`isenabled`);

--
-- Indexes for table `ost_config`
--
ALTER TABLE `ost_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `namespace` (`namespace`,`key`);

--
-- Indexes for table `ost_content`
--
ALTER TABLE `ost_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ost_department`
--
ALTER TABLE `ost_department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`pid`),
  ADD KEY `manager_id` (`manager_id`),
  ADD KEY `autoresp_email_id` (`autoresp_email_id`),
  ADD KEY `tpl_id` (`tpl_id`),
  ADD KEY `flags` (`flags`);

--
-- Indexes for table `ost_draft`
--
ALTER TABLE `ost_draft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `namespace` (`namespace`);

--
-- Indexes for table `ost_email`
--
ALTER TABLE `ost_email`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `ost_email_account`
--
ALTER TABLE `ost_email_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_id` (`email_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ost_email_template`
--
ALTER TABLE `ost_email_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `template_lookup` (`tpl_id`,`code_name`);

--
-- Indexes for table `ost_email_template_group`
--
ALTER TABLE `ost_email_template_group`
  ADD PRIMARY KEY (`tpl_id`);

--
-- Indexes for table `ost_event`
--
ALTER TABLE `ost_event`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ost_faq`
--
ALTER TABLE `ost_faq`
  ADD PRIMARY KEY (`faq_id`),
  ADD UNIQUE KEY `question` (`question`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `ispublished` (`ispublished`);

--
-- Indexes for table `ost_faq_category`
--
ALTER TABLE `ost_faq_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `ispublic` (`ispublic`);

--
-- Indexes for table `ost_faq_topic`
--
ALTER TABLE `ost_faq_topic`
  ADD PRIMARY KEY (`faq_id`,`topic_id`);

--
-- Indexes for table `ost_file`
--
ALTER TABLE `ost_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ft` (`ft`),
  ADD KEY `key` (`key`),
  ADD KEY `signature` (`signature`),
  ADD KEY `type` (`type`),
  ADD KEY `created` (`created`),
  ADD KEY `size` (`size`);

--
-- Indexes for table `ost_file_chunk`
--
ALTER TABLE `ost_file_chunk`
  ADD PRIMARY KEY (`file_id`,`chunk_id`);

--
-- Indexes for table `ost_filter`
--
ALTER TABLE `ost_filter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `ost_filter_action`
--
ALTER TABLE `ost_filter_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Indexes for table `ost_filter_rule`
--
ALTER TABLE `ost_filter_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filter` (`filter_id`,`what`,`how`,`val`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Indexes for table `ost_form`
--
ALTER TABLE `ost_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ost_form_entry`
--
ALTER TABLE `ost_form_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_lookup` (`object_type`,`object_id`);

--
-- Indexes for table `ost_form_entry_values`
--
ALTER TABLE `ost_form_entry_values`
  ADD PRIMARY KEY (`entry_id`,`field_id`);

--
-- Indexes for table `ost_form_field`
--
ALTER TABLE `ost_form_field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`form_id`),
  ADD KEY `sort` (`sort`);

--
-- Indexes for table `ost_group`
--
ALTER TABLE `ost_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `ost_help_topic`
--
ALTER TABLE `ost_help_topic`
  ADD PRIMARY KEY (`topic_id`),
  ADD UNIQUE KEY `topic` (`topic`,`topic_pid`),
  ADD KEY `topic_pid` (`topic_pid`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`,`team_id`),
  ADD KEY `sla_id` (`sla_id`),
  ADD KEY `page_id` (`page_id`);

--
-- Indexes for table `ost_help_topic_form`
--
ALTER TABLE `ost_help_topic_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic-form` (`topic_id`,`form_id`);

--
-- Indexes for table `ost_list`
--
ALTER TABLE `ost_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ost_list_items`
--
ALTER TABLE `ost_list_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_item_lookup` (`list_id`);

--
-- Indexes for table `ost_lock`
--
ALTER TABLE `ost_lock`
  ADD PRIMARY KEY (`lock_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `ost_note`
--
ALTER TABLE `ost_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ext_id` (`ext_id`);

--
-- Indexes for table `ost_organization`
--
ALTER TABLE `ost_organization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_organization__cdata`
--
ALTER TABLE `ost_organization__cdata`
  ADD PRIMARY KEY (`org_id`);

--
-- Indexes for table `ost_plugin`
--
ALTER TABLE `ost_plugin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `install_path` (`install_path`);

--
-- Indexes for table `ost_plugin_instance`
--
ALTER TABLE `ost_plugin_instance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plugin_id` (`plugin_id`);

--
-- Indexes for table `ost_queue`
--
ALTER TABLE `ost_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `ost_queue_column`
--
ALTER TABLE `ost_queue_column`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_queue_columns`
--
ALTER TABLE `ost_queue_columns`
  ADD PRIMARY KEY (`queue_id`,`column_id`,`staff_id`);

--
-- Indexes for table `ost_queue_config`
--
ALTER TABLE `ost_queue_config`
  ADD PRIMARY KEY (`queue_id`,`staff_id`);

--
-- Indexes for table `ost_queue_export`
--
ALTER TABLE `ost_queue_export`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_id` (`queue_id`);

--
-- Indexes for table `ost_queue_sort`
--
ALTER TABLE `ost_queue_sort`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_queue_sorts`
--
ALTER TABLE `ost_queue_sorts`
  ADD PRIMARY KEY (`queue_id`,`sort_id`);

--
-- Indexes for table `ost_role`
--
ALTER TABLE `ost_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ost_schedule`
--
ALTER TABLE `ost_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_schedule_entry`
--
ALTER TABLE `ost_schedule_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `repeats` (`repeats`);

--
-- Indexes for table `ost_sequence`
--
ALTER TABLE `ost_sequence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_session`
--
ALTER TABLE `ost_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `updated` (`session_updated`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ost_sla`
--
ALTER TABLE `ost_sla`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ost_staff`
--
ALTER TABLE `ost_staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `issuperuser` (`isadmin`),
  ADD KEY `isactive` (`isactive`),
  ADD KEY `onvacation` (`onvacation`);

--
-- Indexes for table `ost_staff_dept_access`
--
ALTER TABLE `ost_staff_dept_access`
  ADD PRIMARY KEY (`staff_id`,`dept_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `ost_syslog`
--
ALTER TABLE `ost_syslog`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_type` (`log_type`);

--
-- Indexes for table `ost_task`
--
ALTER TABLE `ost_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `created` (`created`),
  ADD KEY `object` (`object_id`,`object_type`),
  ADD KEY `flags` (`flags`);

--
-- Indexes for table `ost_task__cdata`
--
ALTER TABLE `ost_task__cdata`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `ost_team`
--
ALTER TABLE `ost_team`
  ADD PRIMARY KEY (`team_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indexes for table `ost_team_member`
--
ALTER TABLE `ost_team_member`
  ADD PRIMARY KEY (`team_id`,`staff_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `ost_thread`
--
ALTER TABLE `ost_thread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `object_type` (`object_type`);

--
-- Indexes for table `ost_thread_collaborator`
--
ALTER TABLE `ost_thread_collaborator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `collab` (`thread_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ost_thread_entry`
--
ALTER TABLE `ost_thread_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `thread_id` (`thread_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ost_thread_entry_email`
--
ALTER TABLE `ost_thread_entry_email`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_entry_id` (`thread_entry_id`),
  ADD KEY `mid` (`mid`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `ost_thread_entry_merge`
--
ALTER TABLE `ost_thread_entry_merge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_entry_id` (`thread_entry_id`);

--
-- Indexes for table `ost_thread_event`
--
ALTER TABLE `ost_thread_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_state` (`thread_id`,`event_id`,`timestamp`),
  ADD KEY `ticket_stats` (`timestamp`,`event_id`);

--
-- Indexes for table `ost_thread_referral`
--
ALTER TABLE `ost_thread_referral`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref` (`object_id`,`object_type`,`thread_id`),
  ADD KEY `thread_id` (`thread_id`);

--
-- Indexes for table `ost_ticket`
--
ALTER TABLE `ost_ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created` (`created`),
  ADD KEY `closed` (`closed`),
  ADD KEY `duedate` (`duedate`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `sla_id` (`sla_id`),
  ADD KEY `ticket_pid` (`ticket_pid`);

--
-- Indexes for table `ost_ticket_priority`
--
ALTER TABLE `ost_ticket_priority`
  ADD PRIMARY KEY (`priority_id`),
  ADD UNIQUE KEY `priority` (`priority`),
  ADD KEY `priority_urgency` (`priority_urgency`),
  ADD KEY `ispublic` (`ispublic`);

--
-- Indexes for table `ost_ticket_status`
--
ALTER TABLE `ost_ticket_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `state` (`state`);

--
-- Indexes for table `ost_ticket__cdata`
--
ALTER TABLE `ost_ticket__cdata`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `ost_translation`
--
ALTER TABLE `ost_translation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`lang`),
  ADD KEY `object_hash` (`object_hash`);

--
-- Indexes for table `ost_user`
--
ALTER TABLE `ost_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `org_id` (`org_id`),
  ADD KEY `default_email_id` (`default_email_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `ost_user_account`
--
ALTER TABLE `ost_user_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ost_user_email`
--
ALTER TABLE `ost_user_email`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `address` (`address`),
  ADD KEY `user_email_lookup` (`user_id`);

--
-- Indexes for table `ost_user__cdata`
--
ALTER TABLE `ost_user__cdata`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `ost__search`
--
ALTER TABLE `ost__search`
  ADD PRIMARY KEY (`object_type`,`object_id`);
ALTER TABLE `ost__search` ADD FULLTEXT KEY `search` (`title`,`content`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ost_api_key`
--
ALTER TABLE `ost_api_key`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_attachment`
--
ALTER TABLE `ost_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ost_canned_response`
--
ALTER TABLE `ost_canned_response`
  MODIFY `canned_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ost_config`
--
ALTER TABLE `ost_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `ost_content`
--
ALTER TABLE `ost_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ost_department`
--
ALTER TABLE `ost_department`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ost_draft`
--
ALTER TABLE `ost_draft`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_email`
--
ALTER TABLE `ost_email`
  MODIFY `email_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_email_account`
--
ALTER TABLE `ost_email_account`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_email_template`
--
ALTER TABLE `ost_email_template`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ost_email_template_group`
--
ALTER TABLE `ost_email_template_group`
  MODIFY `tpl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_event`
--
ALTER TABLE `ost_event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `ost_faq`
--
ALTER TABLE `ost_faq`
  MODIFY `faq_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_faq_category`
--
ALTER TABLE `ost_faq_category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_file`
--
ALTER TABLE `ost_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_filter`
--
ALTER TABLE `ost_filter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_filter_action`
--
ALTER TABLE `ost_filter_action`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_filter_rule`
--
ALTER TABLE `ost_filter_rule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_form`
--
ALTER TABLE `ost_form`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ost_form_entry`
--
ALTER TABLE `ost_form_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `ost_form_field`
--
ALTER TABLE `ost_form_field`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `ost_group`
--
ALTER TABLE `ost_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_help_topic`
--
ALTER TABLE `ost_help_topic`
  MODIFY `topic_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ost_help_topic_form`
--
ALTER TABLE `ost_help_topic_form`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_list`
--
ALTER TABLE `ost_list`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ost_list_items`
--
ALTER TABLE `ost_list_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ost_lock`
--
ALTER TABLE `ost_lock`
  MODIFY `lock_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_note`
--
ALTER TABLE `ost_note`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_organization`
--
ALTER TABLE `ost_organization`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_plugin`
--
ALTER TABLE `ost_plugin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_plugin_instance`
--
ALTER TABLE `ost_plugin_instance`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_queue`
--
ALTER TABLE `ost_queue`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ost_queue_column`
--
ALTER TABLE `ost_queue_column`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ost_queue_export`
--
ALTER TABLE `ost_queue_export`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_queue_sort`
--
ALTER TABLE `ost_queue_sort`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ost_role`
--
ALTER TABLE `ost_role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_schedule`
--
ALTER TABLE `ost_schedule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_schedule_entry`
--
ALTER TABLE `ost_schedule_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ost_sequence`
--
ALTER TABLE `ost_sequence`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ost_sla`
--
ALTER TABLE `ost_sla`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_staff`
--
ALTER TABLE `ost_staff`
  MODIFY `staff_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_syslog`
--
ALTER TABLE `ost_syslog`
  MODIFY `log_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ost_task`
--
ALTER TABLE `ost_task`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_team`
--
ALTER TABLE `ost_team`
  MODIFY `team_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_thread`
--
ALTER TABLE `ost_thread`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_thread_collaborator`
--
ALTER TABLE `ost_thread_collaborator`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_thread_entry`
--
ALTER TABLE `ost_thread_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ost_thread_entry_email`
--
ALTER TABLE `ost_thread_entry_email`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_thread_entry_merge`
--
ALTER TABLE `ost_thread_entry_merge`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_thread_event`
--
ALTER TABLE `ost_thread_event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ost_thread_referral`
--
ALTER TABLE `ost_thread_referral`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ost_ticket`
--
ALTER TABLE `ost_ticket`
  MODIFY `ticket_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_ticket_priority`
--
ALTER TABLE `ost_ticket_priority`
  MODIFY `priority_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_ticket_status`
--
ALTER TABLE `ost_ticket_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ost_translation`
--
ALTER TABLE `ost_translation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_user`
--
ALTER TABLE `ost_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ost_user_account`
--
ALTER TABLE `ost_user_account`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_user_email`
--
ALTER TABLE `ost_user_email`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

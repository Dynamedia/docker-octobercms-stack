-- MySQL dump 10.13  Distrib 8.0.13, for Linux (x86_64)
--
-- Host: localhost    Database: october
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `backend_access_log`
--

DROP TABLE IF EXISTS `backend_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `backend_access_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_access_log`
--

LOCK TABLES `backend_access_log` WRITE;
/*!40000 ALTER TABLE `backend_access_log` DISABLE KEYS */;
INSERT INTO `backend_access_log` VALUES (1,1,'172.18.0.5','2019-02-08 14:25:53','2019-02-08 14:25:53'),(2,1,'172.18.0.2','2019-09-13 10:13:40','2019-09-13 10:13:40'),(3,1,'172.18.0.2','2019-09-13 10:31:21','2019-09-13 10:31:21');
/*!40000 ALTER TABLE `backend_access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_groups`
--

DROP TABLE IF EXISTS `backend_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `backend_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_groups`
--

LOCK TABLES `backend_user_groups` WRITE;
/*!40000 ALTER TABLE `backend_user_groups` DISABLE KEYS */;
INSERT INTO `backend_user_groups` VALUES (1,'Owners','2019-02-08 12:48:57','2019-02-08 12:48:57','owners','Default group for website owners.',0);
/*!40000 ALTER TABLE `backend_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_preferences`
--

DROP TABLE IF EXISTS `backend_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `backend_user_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_preferences`
--

LOCK TABLES `backend_user_preferences` WRITE;
/*!40000 ALTER TABLE `backend_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_roles`
--

DROP TABLE IF EXISTS `backend_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `backend_user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_unique` (`name`),
  KEY `role_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_roles`
--

LOCK TABLES `backend_user_roles` WRITE;
/*!40000 ALTER TABLE `backend_user_roles` DISABLE KEYS */;
INSERT INTO `backend_user_roles` VALUES (1,'Publisher','publisher','Site editor with access to publishing tools.','',1,'2019-02-08 12:48:57','2019-02-08 12:48:57'),(2,'Developer','developer','Site administrator with access to developer tools.','',1,'2019-02-08 12:48:57','2019-02-08 12:48:57');
/*!40000 ALTER TABLE `backend_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_throttle`
--

DROP TABLE IF EXISTS `backend_user_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `backend_user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_throttle`
--

LOCK TABLES `backend_user_throttle` WRITE;
/*!40000 ALTER TABLE `backend_user_throttle` DISABLE KEYS */;
INSERT INTO `backend_user_throttle` VALUES (1,1,'172.18.0.5',0,NULL,0,NULL,0,NULL),(2,1,'172.18.0.3',0,NULL,0,NULL,0,NULL),(3,1,'172.18.0.2',0,NULL,0,NULL,0,NULL);
/*!40000 ALTER TABLE `backend_user_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_users`
--

DROP TABLE IF EXISTS `backend_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `backend_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(10) unsigned DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`),
  KEY `admin_role_index` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_users`
--

LOCK TABLES `backend_users` WRITE;
/*!40000 ALTER TABLE `backend_users` DISABLE KEYS */;
INSERT INTO `backend_users` VALUES (1,'Admin','Person','admin','admin@domain.tld','$2y$10$sjw/88apWtohFdrX4QhXlu22jni8o.i/OHU.xzUsDQ.G/zUJwlBcq',NULL,'$2y$10$7T4seXQQLvzFHOOSYjRF5eS63tQxQK6OxMQkxfLxI859zCmU5u1oq',NULL,'',1,2,NULL,'2019-09-13 10:31:21','2019-02-08 12:48:57','2019-09-13 10:31:21',NULL,1);
/*!40000 ALTER TABLE `backend_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_users_groups`
--

DROP TABLE IF EXISTS `backend_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `backend_users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_users_groups`
--

LOCK TABLES `backend_users_groups` WRITE;
/*!40000 ALTER TABLE `backend_users_groups` DISABLE KEYS */;
INSERT INTO `backend_users_groups` VALUES (1,1);
/*!40000 ALTER TABLE `backend_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_theme_data`
--

DROP TABLE IF EXISTS `cms_theme_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cms_theme_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_theme_data`
--

LOCK TABLES `cms_theme_data` WRITE;
/*!40000 ALTER TABLE `cms_theme_data` DISABLE KEYS */;
INSERT INTO `cms_theme_data` VALUES (1,'starter','{\"is_ga_enabled\":\"1\",\"site_name\":\"The Site\",\"site_owner\":\"The Owner\",\"site_owner_type\":\"company\",\"site_owner_company_number\":\"1234\",\"site_owner_vat_number\":\"5678\",\"site_owner_email\":\"admin@thecompany.com\",\"site_owner_telephone\":\"01482123456\",\"site_owner_business_address\":\"<p>The House<\\/p>\\r\\n\\r\\n<p>The Street<\\/p>\\r\\n\\r\\n<p>City<\\/p>\",\"ga_identifier\":\"UA-12345\",\"social_facebook_url\":\"http:\\/\\/facebook.com\\/test\",\"social_facebook_app_id\":\"12345\",\"social_twitter_url\":\"http:\\/\\/twitter.com\\/test\",\"social_twitter_username\":\"thetest\"}','2019-02-08 12:49:39','2019-02-11 15:59:24'),(2,'base','{\"is_ga_enabled\":true}','2019-03-01 15:57:30','2019-03-01 15:57:30');
/*!40000 ALTER TABLE `cms_theme_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_theme_logs`
--

DROP TABLE IF EXISTS `cms_theme_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cms_theme_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `old_content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_logs_type_index` (`type`),
  KEY `cms_theme_logs_theme_index` (`theme`),
  KEY `cms_theme_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_theme_logs`
--

LOCK TABLES `cms_theme_logs` WRITE;
/*!40000 ALTER TABLE `cms_theme_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_theme_templates`
--

DROP TABLE IF EXISTS `cms_theme_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cms_theme_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int(10) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_templates_source_index` (`source`),
  KEY `cms_theme_templates_path_index` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_theme_templates`
--

LOCK TABLES `cms_theme_templates` WRITE;
/*!40000 ALTER TABLE `cms_theme_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deferred_bindings`
--

DROP TABLE IF EXISTS `deferred_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `deferred_bindings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deferred_bindings_master_type_index` (`master_type`),
  KEY `deferred_bindings_master_field_index` (`master_field`),
  KEY `deferred_bindings_slave_type_index` (`slave_type`),
  KEY `deferred_bindings_slave_id_index` (`slave_id`),
  KEY `deferred_bindings_session_key_index` (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deferred_bindings`
--

LOCK TABLES `deferred_bindings` WRITE;
/*!40000 ALTER TABLE `deferred_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `deferred_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_contactform_form_sub`
--

DROP TABLE IF EXISTS `dynamedia_contactform_form_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_contactform_form_sub` (
  `form_id` int(10) unsigned NOT NULL,
  `subject_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_contactform_form_sub`
--

LOCK TABLES `dynamedia_contactform_form_sub` WRITE;
/*!40000 ALTER TABLE `dynamedia_contactform_form_sub` DISABLE KEYS */;
INSERT INTO `dynamedia_contactform_form_sub` VALUES (1,1);
/*!40000 ALTER TABLE `dynamedia_contactform_form_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_contactform_forms`
--

DROP TABLE IF EXISTS `dynamedia_contactform_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_contactform_forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_email_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `message_mailer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message_mailer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmation_mailer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmation_mailer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_include_name` tinyint(1) NOT NULL DEFAULT '1',
  `is_require_name` tinyint(1) NOT NULL DEFAULT '1',
  `is_include_email` tinyint(1) NOT NULL DEFAULT '1',
  `is_require_email` tinyint(1) NOT NULL DEFAULT '1',
  `is_include_telephone` tinyint(1) NOT NULL DEFAULT '0',
  `is_require_telephone` tinyint(1) NOT NULL DEFAULT '0',
  `is_include_subject` tinyint(1) NOT NULL DEFAULT '1',
  `is_freeform_subject` tinyint(1) NOT NULL DEFAULT '1',
  `is_email_confirmation` tinyint(1) NOT NULL DEFAULT '0',
  `is_captcha` tinyint(1) NOT NULL DEFAULT '1',
  `is_antispam` tinyint(1) NOT NULL DEFAULT '1',
  `captcha_service` int(11) NOT NULL DEFAULT '1',
  `antispam_service` int(11) NOT NULL DEFAULT '1',
  `conftemplate_id` int(10) unsigned DEFAULT NULL,
  `rectemplate_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dynamedia_contactform_forms_conftemplate_id_foreign` (`conftemplate_id`),
  KEY `dynamedia_contactform_forms_rectemplate_id_foreign` (`rectemplate_id`),
  CONSTRAINT `dynamedia_contactform_forms_conftemplate_id_foreign` FOREIGN KEY (`conftemplate_id`) REFERENCES `system_mail_templates` (`id`),
  CONSTRAINT `dynamedia_contactform_forms_rectemplate_id_foreign` FOREIGN KEY (`rectemplate_id`) REFERENCES `system_mail_templates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_contactform_forms`
--

LOCK TABLES `dynamedia_contactform_forms` WRITE;
/*!40000 ALTER TABLE `dynamedia_contactform_forms` DISABLE KEYS */;
INSERT INTO `dynamedia_contactform_forms` VALUES (1,'Contact Us',0,NULL,NULL,NULL,NULL,1,1,1,1,0,1,1,0,0,0,1,1,1,NULL,NULL,'2019-02-28 17:11:15','2019-03-01 11:30:31');
/*!40000 ALTER TABLE `dynamedia_contactform_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_contactform_messages`
--

DROP TABLE IF EXISTS `dynamedia_contactform_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_contactform_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned DEFAULT NULL,
  `subject_id` int(10) unsigned DEFAULT NULL,
  `sender_id` int(10) unsigned DEFAULT NULL,
  `subject_string` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `messagebody` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dynamedia_contactform_messages_form_id_foreign` (`form_id`),
  KEY `dynamedia_contactform_messages_subject_id_foreign` (`subject_id`),
  KEY `dynamedia_contactform_messages_sender_id_foreign` (`sender_id`),
  CONSTRAINT `dynamedia_contactform_messages_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `dynamedia_contactform_forms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `dynamedia_contactform_messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `dynamedia_contactform_senders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dynamedia_contactform_messages_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `dynamedia_contactform_subjects` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_contactform_messages`
--

LOCK TABLES `dynamedia_contactform_messages` WRITE;
/*!40000 ALTER TABLE `dynamedia_contactform_messages` DISABLE KEYS */;
INSERT INTO `dynamedia_contactform_messages` VALUES (1,1,NULL,1,'No Subject','test','2019-03-01 11:25:21','2019-03-01 11:25:21');
/*!40000 ALTER TABLE `dynamedia_contactform_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_contactform_rec_form`
--

DROP TABLE IF EXISTS `dynamedia_contactform_rec_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_contactform_rec_form` (
  `recipient_id` int(10) unsigned NOT NULL,
  `form_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_contactform_rec_form`
--

LOCK TABLES `dynamedia_contactform_rec_form` WRITE;
/*!40000 ALTER TABLE `dynamedia_contactform_rec_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamedia_contactform_rec_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_contactform_rec_msg`
--

DROP TABLE IF EXISTS `dynamedia_contactform_rec_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_contactform_rec_msg` (
  `recipient_id` int(10) unsigned NOT NULL,
  `message_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_contactform_rec_msg`
--

LOCK TABLES `dynamedia_contactform_rec_msg` WRITE;
/*!40000 ALTER TABLE `dynamedia_contactform_rec_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamedia_contactform_rec_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_contactform_rec_sub`
--

DROP TABLE IF EXISTS `dynamedia_contactform_rec_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_contactform_rec_sub` (
  `recipient_id` int(10) unsigned NOT NULL,
  `subject_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_contactform_rec_sub`
--

LOCK TABLES `dynamedia_contactform_rec_sub` WRITE;
/*!40000 ALTER TABLE `dynamedia_contactform_rec_sub` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamedia_contactform_rec_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_contactform_recbc_form`
--

DROP TABLE IF EXISTS `dynamedia_contactform_recbc_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_contactform_recbc_form` (
  `recipient_id` int(10) unsigned NOT NULL,
  `form_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_contactform_recbc_form`
--

LOCK TABLES `dynamedia_contactform_recbc_form` WRITE;
/*!40000 ALTER TABLE `dynamedia_contactform_recbc_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamedia_contactform_recbc_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_contactform_recbc_msg`
--

DROP TABLE IF EXISTS `dynamedia_contactform_recbc_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_contactform_recbc_msg` (
  `recipient_id` int(10) unsigned NOT NULL,
  `message_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_contactform_recbc_msg`
--

LOCK TABLES `dynamedia_contactform_recbc_msg` WRITE;
/*!40000 ALTER TABLE `dynamedia_contactform_recbc_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamedia_contactform_recbc_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_contactform_recbc_sub`
--

DROP TABLE IF EXISTS `dynamedia_contactform_recbc_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_contactform_recbc_sub` (
  `recipient_id` int(10) unsigned NOT NULL,
  `subject_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_contactform_recbc_sub`
--

LOCK TABLES `dynamedia_contactform_recbc_sub` WRITE;
/*!40000 ALTER TABLE `dynamedia_contactform_recbc_sub` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamedia_contactform_recbc_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_contactform_reccc_form`
--

DROP TABLE IF EXISTS `dynamedia_contactform_reccc_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_contactform_reccc_form` (
  `recipient_id` int(10) unsigned NOT NULL,
  `form_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_contactform_reccc_form`
--

LOCK TABLES `dynamedia_contactform_reccc_form` WRITE;
/*!40000 ALTER TABLE `dynamedia_contactform_reccc_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamedia_contactform_reccc_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_contactform_reccc_msg`
--

DROP TABLE IF EXISTS `dynamedia_contactform_reccc_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_contactform_reccc_msg` (
  `recipient_id` int(10) unsigned NOT NULL,
  `message_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_contactform_reccc_msg`
--

LOCK TABLES `dynamedia_contactform_reccc_msg` WRITE;
/*!40000 ALTER TABLE `dynamedia_contactform_reccc_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamedia_contactform_reccc_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_contactform_reccc_sub`
--

DROP TABLE IF EXISTS `dynamedia_contactform_reccc_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_contactform_reccc_sub` (
  `recipient_id` int(10) unsigned NOT NULL,
  `subject_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_contactform_reccc_sub`
--

LOCK TABLES `dynamedia_contactform_reccc_sub` WRITE;
/*!40000 ALTER TABLE `dynamedia_contactform_reccc_sub` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamedia_contactform_reccc_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_contactform_recipients`
--

DROP TABLE IF EXISTS `dynamedia_contactform_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_contactform_recipients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_contactform_recipients`
--

LOCK TABLES `dynamedia_contactform_recipients` WRITE;
/*!40000 ALTER TABLE `dynamedia_contactform_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamedia_contactform_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_contactform_senders`
--

DROP TABLE IF EXISTS `dynamedia_contactform_senders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_contactform_senders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dynamedia_contactform_senders_email_index` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_contactform_senders`
--

LOCK TABLES `dynamedia_contactform_senders` WRITE;
/*!40000 ALTER TABLE `dynamedia_contactform_senders` DISABLE KEYS */;
INSERT INTO `dynamedia_contactform_senders` VALUES (1,'','Robert','Ballantyne','Robert Ballantyne','rob@robballantyne.co.uk','','','','','','','','','','2019-03-01 11:25:21','2019-03-01 11:25:21');
/*!40000 ALTER TABLE `dynamedia_contactform_senders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_contactform_subjects`
--

DROP TABLE IF EXISTS `dynamedia_contactform_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_contactform_subjects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_custom_recmailer` tinyint(1) NOT NULL DEFAULT '0',
  `message_mailer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message_mailer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_custom_rectemplate` tinyint(1) NOT NULL DEFAULT '0',
  `is_custom_confmailer` tinyint(1) NOT NULL DEFAULT '0',
  `confirmation_mailer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmation_mailer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_custom_conftemplate` tinyint(1) NOT NULL DEFAULT '0',
  `is_custom_recipients` tinyint(1) NOT NULL DEFAULT '0',
  `is_override_recipients` tinyint(1) NOT NULL DEFAULT '0',
  `conftemplate_id` int(10) unsigned DEFAULT NULL,
  `rectemplate_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dynamedia_contactform_subjects_conftemplate_id_foreign` (`conftemplate_id`),
  KEY `dynamedia_contactform_subjects_rectemplate_id_foreign` (`rectemplate_id`),
  CONSTRAINT `dynamedia_contactform_subjects_conftemplate_id_foreign` FOREIGN KEY (`conftemplate_id`) REFERENCES `system_mail_templates` (`id`),
  CONSTRAINT `dynamedia_contactform_subjects_rectemplate_id_foreign` FOREIGN KEY (`rectemplate_id`) REFERENCES `system_mail_templates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_contactform_subjects`
--

LOCK TABLES `dynamedia_contactform_subjects` WRITE;
/*!40000 ALTER TABLE `dynamedia_contactform_subjects` DISABLE KEYS */;
INSERT INTO `dynamedia_contactform_subjects` VALUES (1,'General Enquiry','General Enquiry',0,'','',0,0,'','',0,0,1,NULL,NULL,'2019-03-01 11:30:12','2019-03-01 11:30:12');
/*!40000 ALTER TABLE `dynamedia_contactform_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_items_categories`
--

DROP TABLE IF EXISTS `dynamedia_items_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_items_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dynamedia_items_categories_slug_index` (`slug`),
  KEY `dynamedia_items_categories_parent_id_index` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_items_categories`
--

LOCK TABLES `dynamedia_items_categories` WRITE;
/*!40000 ALTER TABLE `dynamedia_items_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamedia_items_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_items_category_item`
--

DROP TABLE IF EXISTS `dynamedia_items_category_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_items_category_item` (
  `category_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`category_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_items_category_item`
--

LOCK TABLES `dynamedia_items_category_item` WRITE;
/*!40000 ALTER TABLE `dynamedia_items_category_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamedia_items_category_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_items_fields`
--

DROP TABLE IF EXISTS `dynamedia_items_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_items_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_validate` tinyint(1) NOT NULL DEFAULT '0',
  `is_sortable` tinyint(1) NOT NULL DEFAULT '0',
  `is_searchable` tinyint(1) NOT NULL DEFAULT '0',
  `validation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_config` json DEFAULT NULL,
  `layout` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dynamedia_items_fields_slug_index` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_items_fields`
--

LOCK TABLES `dynamedia_items_fields` WRITE;
/*!40000 ALTER TABLE `dynamedia_items_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamedia_items_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_items_items`
--

DROP TABLE IF EXISTS `dynamedia_items_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_items_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `introduction` text COLLATE utf8mb4_unicode_ci,
  `html` mediumtext COLLATE utf8mb4_unicode_ci,
  `fields` json DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `type_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dynamedia_items_items_type_id_foreign` (`type_id`),
  KEY `dynamedia_items_items_timestamps` (`created_at`,`updated_at`),
  KEY `dynamedia_items_items_title_index` (`title`),
  KEY `dynamedia_items_items_slug_index` (`slug`),
  KEY `dynamedia_items_items_sort_order_index` (`sort_order`),
  FULLTEXT KEY `dynamedia_items_items_fulltext_index` (`html`,`introduction`,`title`),
  CONSTRAINT `dynamedia_items_items_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `dynamedia_items_types` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_items_items`
--

LOCK TABLES `dynamedia_items_items` WRITE;
/*!40000 ALTER TABLE `dynamedia_items_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamedia_items_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_items_type_field`
--

DROP TABLE IF EXISTS `dynamedia_items_type_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_items_type_field` (
  `type_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `tab` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `span` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`type_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_items_type_field`
--

LOCK TABLES `dynamedia_items_type_field` WRITE;
/*!40000 ALTER TABLE `dynamedia_items_type_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamedia_items_type_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamedia_items_types`
--

DROP TABLE IF EXISTS `dynamedia_items_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamedia_items_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `introduction` text COLLATE utf8mb4_unicode_ci,
  `html` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dynamedia_items_types_slug_index` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamedia_items_types`
--

LOCK TABLES `dynamedia_items_types` WRITE;
/*!40000 ALTER TABLE `dynamedia_items_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamedia_items_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_10_01_000001_Db_Deferred_Bindings',1),(2,'2013_10_01_000002_Db_System_Files',1),(3,'2013_10_01_000003_Db_System_Plugin_Versions',1),(4,'2013_10_01_000004_Db_System_Plugin_History',1),(5,'2013_10_01_000005_Db_System_Settings',1),(6,'2013_10_01_000006_Db_System_Parameters',1),(7,'2013_10_01_000007_Db_System_Add_Disabled_Flag',1),(8,'2013_10_01_000008_Db_System_Mail_Templates',1),(9,'2013_10_01_000009_Db_System_Mail_Layouts',1),(10,'2014_10_01_000010_Db_Jobs',1),(11,'2014_10_01_000011_Db_System_Event_Logs',1),(12,'2014_10_01_000012_Db_System_Request_Logs',1),(13,'2014_10_01_000013_Db_System_Sessions',1),(14,'2015_10_01_000014_Db_System_Mail_Layout_Rename',1),(15,'2015_10_01_000015_Db_System_Add_Frozen_Flag',1),(16,'2015_10_01_000016_Db_Cache',1),(17,'2015_10_01_000017_Db_System_Revisions',1),(18,'2015_10_01_000018_Db_FailedJobs',1),(19,'2016_10_01_000019_Db_System_Plugin_History_Detail_Text',1),(20,'2016_10_01_000020_Db_System_Timestamp_Fix',1),(21,'2017_08_04_121309_Db_Deferred_Bindings_Add_Index_Session',1),(22,'2017_10_01_000021_Db_System_Sessions_Update',1),(23,'2017_10_01_000022_Db_Jobs_FailedJobs_Update',1),(24,'2017_10_01_000023_Db_System_Mail_Partials',1),(25,'2017_10_23_000024_Db_System_Mail_Layouts_Add_Options_Field',1),(26,'2013_10_01_000001_Db_Backend_Users',2),(27,'2013_10_01_000002_Db_Backend_User_Groups',2),(28,'2013_10_01_000003_Db_Backend_Users_Groups',2),(29,'2013_10_01_000004_Db_Backend_User_Throttle',2),(30,'2014_01_04_000005_Db_Backend_User_Preferences',2),(31,'2014_10_01_000006_Db_Backend_Access_Log',2),(32,'2014_10_01_000007_Db_Backend_Add_Description_Field',2),(33,'2015_10_01_000008_Db_Backend_Add_Superuser_Flag',2),(34,'2016_10_01_000009_Db_Backend_Timestamp_Fix',2),(35,'2017_10_01_000010_Db_Backend_User_Roles',2),(36,'2018_12_16_000011_Db_Backend_Add_Deleted_At',2),(37,'2014_10_01_000001_Db_Cms_Theme_Data',3),(38,'2016_10_01_000002_Db_Cms_Timestamp_Fix',3),(39,'2017_10_01_000003_Db_Cms_Theme_Logs',3),(40,'2018_11_01_000001_Db_Cms_Theme_Templates',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_gdpr_cookie_groups`
--

DROP TABLE IF EXISTS `offline_gdpr_cookie_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `offline_gdpr_cookie_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(10) unsigned DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offline_gdpr_cookie_groups_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_gdpr_cookie_groups`
--

LOCK TABLES `offline_gdpr_cookie_groups` WRITE;
/*!40000 ALTER TABLE `offline_gdpr_cookie_groups` DISABLE KEYS */;
INSERT INTO `offline_gdpr_cookie_groups` VALUES (1,1,'essential-cookies','Essential Cookies','<p>These cookies are essential for the website to function correctly and cannot be disabled.</p>',1,'2019-09-13 11:17:22','2019-09-13 11:17:22'),(2,2,'analytics','Analytics','<p>These cookies are are used so we can monitor our page views.</p>',0,'2019-09-13 11:23:23','2019-09-13 11:23:23');
/*!40000 ALTER TABLE `offline_gdpr_cookie_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_gdpr_cookies`
--

DROP TABLE IF EXISTS `offline_gdpr_cookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `offline_gdpr_cookies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(10) unsigned DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `initial_status` tinyint(1) NOT NULL DEFAULT '1',
  `levels` text COLLATE utf8mb4_unicode_ci,
  `default_level` int(10) unsigned NOT NULL DEFAULT '0',
  `cookie_group_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contact_details_dpo` text COLLATE utf8mb4_unicode_ci,
  `contact_links_dpo` text COLLATE utf8mb4_unicode_ci,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_details` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offline_gdpr_cookies_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_gdpr_cookies`
--

LOCK TABLES `offline_gdpr_cookies` WRITE;
/*!40000 ALTER TABLE `offline_gdpr_cookies` DISABLE KEYS */;
INSERT INTO `offline_gdpr_cookies` VALUES (1,1,'dynamedia-limited','Dynamedia Limited','<p>The session cookie.</p>',1,'[]',0,1,'2019-09-13 11:20:59','2019-09-13 11:20:59','<p>Dynamedia Limited,</p>\r\n\r\n<p>One Business Village,</p>\r\n\r\n<p>1 Emily Street,</p>\r\n\r\n<p>Hull,</p>\r\n\r\n<p>HU9 5DR</p>\r\n\r\n<p>Attention: Data Protection Officer</p>','[]','dynamedia.uk','[{\"detail_name\":\"october_session\",\"detail_expiry\":\"Session\",\"detail_type\":\"Session Cookie\"}]'),(2,2,'cloudflare','Cloudflare','<p>These cookies are from Cloudflare and they are used to help keep our website secure.</p>',1,'[]',0,1,'2019-09-13 11:22:38','2019-09-13 11:22:38','<p>Cloudflare, Inc.&nbsp;</p>\r\n\r\n<p>101 Townsend St. San Francisco,&nbsp;</p>\r\n\r\n<p>CA&nbsp;</p>\r\n\r\n<p>94107.</p>\r\n\r\n<p>USA</p>\r\n\r\n<p>Attention: Data Protection Officer</p>','[]','cloudflare.com','[{\"detail_name\":\"__cfduid\",\"detail_expiry\":\"1 Year\",\"detail_type\":\"HTTP Cookie\"}]'),(3,3,'google-analytics','Google Analytics','<p>These cookies help us monitor when and how our website is used</p>',1,'[]',0,2,'2019-09-13 11:25:58','2019-09-13 11:25:58','<p>1600 Amphitheatre Parkway,</p>\r\n\r\n<p>Mountain View,</p>\r\n\r\n<p>CA.</p>\r\n\r\n<p>94043</p>\r\n\r\n<p>USA</p>\r\n\r\n<p>Attention: Data Protection Officer</p>','[]','analytics.google.com','[{\"detail_name\":\"_ga\",\"detail_expiry\":\"2 Years\",\"detail_type\":\"HTTP Cookie\"},{\"detail_name\":\"_gid\",\"detail_expiry\":\"24 Hours\",\"detail_type\":\"HTTP Cookie\"},{\"detail_name\":\"_gat\",\"detail_expiry\":\"1 Minute\",\"detail_type\":\"HTTP Cookie\"}]');
/*!40000 ALTER TABLE `offline_gdpr_cookies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_blog_categories`
--

DROP TABLE IF EXISTS `rainlab_blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rainlab_blog_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_blog_categories_slug_index` (`slug`),
  KEY `rainlab_blog_categories_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_blog_categories`
--

LOCK TABLES `rainlab_blog_categories` WRITE;
/*!40000 ALTER TABLE `rainlab_blog_categories` DISABLE KEYS */;
INSERT INTO `rainlab_blog_categories` VALUES (1,'rainlab.blog::lang.categories.uncategorized','uncategorized',NULL,NULL,NULL,1,2,0,'2019-02-08 12:49:02','2019-02-08 12:49:02');
/*!40000 ALTER TABLE `rainlab_blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_blog_posts`
--

DROP TABLE IF EXISTS `rainlab_blog_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rainlab_blog_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `content_html` longtext COLLATE utf8mb4_unicode_ci,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rainlab_blog_posts_user_id_index` (`user_id`),
  KEY `rainlab_blog_posts_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_blog_posts`
--

LOCK TABLES `rainlab_blog_posts` WRITE;
/*!40000 ALTER TABLE `rainlab_blog_posts` DISABLE KEYS */;
INSERT INTO `rainlab_blog_posts` VALUES (1,NULL,'First blog post','first-blog-post','The first ever blog post is here. It might be a good idea to update this post with some more relevant content.','This is your first ever **blog post**! It might be a good idea to update this post with some more relevant content.\n\nYou can edit this content by selecting **Blog** from the administration back-end menu.\n\n*Enjoy the good times!*','<p>This is your first ever <strong>blog post</strong>! It might be a good idea to update this post with some more relevant content.</p>\n<p>You can edit this content by selecting <strong>Blog</strong> from the administration back-end menu.</p>\n<p><em>Enjoy the good times!</em></p>','2019-02-08 12:49:02',1,'2019-02-08 12:49:02','2019-02-08 12:49:02',NULL);
/*!40000 ALTER TABLE `rainlab_blog_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_blog_posts_categories`
--

DROP TABLE IF EXISTS `rainlab_blog_posts_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rainlab_blog_posts_categories` (
  `post_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_blog_posts_categories`
--

LOCK TABLES `rainlab_blog_posts_categories` WRITE;
/*!40000 ALTER TABLE `rainlab_blog_posts_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_blog_posts_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_sitemap_definitions`
--

DROP TABLE IF EXISTS `rainlab_sitemap_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rainlab_sitemap_definitions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_sitemap_definitions_theme_index` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_sitemap_definitions`
--

LOCK TABLES `rainlab_sitemap_definitions` WRITE;
/*!40000 ALTER TABLE `rainlab_sitemap_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_sitemap_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int(11) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_event_logs`
--

DROP TABLE IF EXISTS `system_event_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `system_event_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `details` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_event_logs`
--

LOCK TABLES `system_event_logs` WRITE;
/*!40000 ALTER TABLE `system_event_logs` DISABLE KEYS */;
INSERT INTO `system_event_logs` VALUES (1,'error','Twig_Error_Syntax: Unexpected token \"name\" of value \"Website\" (\"end of print statement\" expected) in \"/var/www/app/themes/starter/partials/meta/detail.htm\" at line 8. in /var/www/app/vendor/twig/twig/lib/Twig/TokenStream.php:80\nStack trace:\n#0 /var/www/app/vendor/twig/twig/lib/Twig/Parser.php(126): Twig_TokenStream->expect(4)\n#1 /var/www/app/vendor/twig/twig/lib/Twig/Parser.php(81): Twig_Parser->subparse(NULL, false)\n#2 /var/www/app/vendor/twig/twig/lib/Twig/Environment.php(533): Twig_Parser->parse(Object(Twig_TokenStream))\n#3 /var/www/app/vendor/twig/twig/lib/Twig/Environment.php(565): Twig_Environment->parse(Object(Twig_TokenStream))\n#4 /var/www/app/vendor/twig/twig/lib/Twig/Environment.php(368): Twig_Environment->compileSource(Object(Twig_Source))\n#5 /var/www/app/modules/cms/classes/Controller.php(1089): Twig_Environment->loadTemplate(\'/var/www/app/th...\')\n#6 /var/www/app/modules/cms/twig/Extension.php(102): Cms\\Classes\\Controller->renderPartial(\'meta/detail\', Array, true)\n#7 /var/www/app/storage/cms/twig/59/595f31272170663596effb7e440f9b36dcc40b6e83d4b381056ecda59c4c8f50.php(24): Cms\\Twig\\Extension->partialFunction(\'meta/detail\', Array, true)\n#8 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(386): __TwigTemplate_d0d0bdca72ac037ca11ccae39b5ff4e073bce30a8f3f1bb075ae64f7ab39245a->doDisplay(Array, Array)\n#9 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(363): Twig_Template->displayWithErrorHandling(Array, Array)\n#10 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(371): Twig_Template->display(Array)\n#11 /var/www/app/modules/cms/classes/Controller.php(1090): Twig_Template->render(Array)\n#12 /var/www/app/modules/cms/twig/Extension.php(102): Cms\\Classes\\Controller->renderPartial(\'meta/default\', Array, true)\n#13 /var/www/app/storage/cms/twig/71/71b51cae5d61296340e36b496327ec414b60d3230517479d2c8ce00abe11eeee.php(24): Cms\\Twig\\Extension->partialFunction(\'meta/default\', Array, true)\n#14 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(386): __TwigTemplate_992b8c24556c8ecd19f215e66e0fa34d531a1035f2cd1bed18aa5d9f56206a83->doDisplay(Array, Array)\n#15 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(363): Twig_Template->displayWithErrorHandling(Array, Array)\n#16 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(371): Twig_Template->display(Array)\n#17 /var/www/app/modules/cms/classes/Controller.php(1090): Twig_Template->render(Array)\n#18 /var/www/app/modules/cms/twig/Extension.php(102): Cms\\Classes\\Controller->renderPartial(\'layout/default/...\', Array, true)\n#19 /var/www/app/storage/cms/twig/66/66e3d9ee0915bbb6fe266371bbc41486d842add22c623130fc34fdbe5caa7e2a.php(30): Cms\\Twig\\Extension->partialFunction(\'layout/default/...\', Array, true)\n#20 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(386): __TwigTemplate_a33e7f30e3e72da1f214dbc1b57be5b688ede342dbb1e7bf4ec379906f9d2d48->doDisplay(Array, Array)\n#21 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(363): Twig_Template->displayWithErrorHandling(Array, Array)\n#22 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(371): Twig_Template->display(Array)\n#23 /var/www/app/modules/cms/classes/Controller.php(434): Twig_Template->render(Array)\n#24 /var/www/app/modules/cms/classes/Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#25 /var/www/app/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#26 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#27 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#28 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#29 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#30 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#31 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#32 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#34 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /var/www/app/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /var/www/app/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#46 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#49 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#50 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#51 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#52 /var/www/app/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#53 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#54 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#55 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#56 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#57 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#59 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#60 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#61 /var/www/app/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#62 {main}',NULL,'2019-02-08 14:48:24','2019-02-08 14:48:24'),(2,'error','Twig_Error_Syntax: Invalid syntax in the placeholder tag. Line 5 in \"/var/www/app/themes/starter/partials/meta/detail.htm\" at line 5 in /var/www/app/modules/cms/twig/PlaceholderTokenParser.php:77\nStack trace:\n#0 /var/www/app/modules/cms/twig/PlaceholderTokenParser.php(39): Cms\\Twig\\PlaceholderTokenParser->loadParams(Object(Twig_TokenStream))\n#1 /var/www/app/vendor/twig/twig/lib/Twig/Parser.php(168): Cms\\Twig\\PlaceholderTokenParser->parse(Object(Twig_Token))\n#2 /var/www/app/vendor/twig/twig/lib/Twig/TokenParser/Spaceless.php(32): Twig_Parser->subparse(Array, true)\n#3 /var/www/app/vendor/twig/twig/lib/Twig/Parser.php(168): Twig_TokenParser_Spaceless->parse(Object(Twig_Token))\n#4 /var/www/app/vendor/twig/twig/lib/Twig/Parser.php(81): Twig_Parser->subparse(NULL, false)\n#5 /var/www/app/vendor/twig/twig/lib/Twig/Environment.php(533): Twig_Parser->parse(Object(Twig_TokenStream))\n#6 /var/www/app/vendor/twig/twig/lib/Twig/Environment.php(565): Twig_Environment->parse(Object(Twig_TokenStream))\n#7 /var/www/app/vendor/twig/twig/lib/Twig/Environment.php(368): Twig_Environment->compileSource(Object(Twig_Source))\n#8 /var/www/app/modules/cms/classes/Controller.php(1089): Twig_Environment->loadTemplate(\'/var/www/app/th...\')\n#9 /var/www/app/modules/cms/twig/Extension.php(102): Cms\\Classes\\Controller->renderPartial(\'meta/detail\', Array, true)\n#10 /var/www/app/storage/cms/twig/59/595f31272170663596effb7e440f9b36dcc40b6e83d4b381056ecda59c4c8f50.php(24): Cms\\Twig\\Extension->partialFunction(\'meta/detail\', Array, true)\n#11 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(386): __TwigTemplate_d0d0bdca72ac037ca11ccae39b5ff4e073bce30a8f3f1bb075ae64f7ab39245a->doDisplay(Array, Array)\n#12 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(363): Twig_Template->displayWithErrorHandling(Array, Array)\n#13 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(371): Twig_Template->display(Array)\n#14 /var/www/app/modules/cms/classes/Controller.php(1090): Twig_Template->render(Array)\n#15 /var/www/app/modules/cms/twig/Extension.php(102): Cms\\Classes\\Controller->renderPartial(\'meta/default\', Array, true)\n#16 /var/www/app/storage/cms/twig/71/71b51cae5d61296340e36b496327ec414b60d3230517479d2c8ce00abe11eeee.php(24): Cms\\Twig\\Extension->partialFunction(\'meta/default\', Array, true)\n#17 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(386): __TwigTemplate_992b8c24556c8ecd19f215e66e0fa34d531a1035f2cd1bed18aa5d9f56206a83->doDisplay(Array, Array)\n#18 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(363): Twig_Template->displayWithErrorHandling(Array, Array)\n#19 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(371): Twig_Template->display(Array)\n#20 /var/www/app/modules/cms/classes/Controller.php(1090): Twig_Template->render(Array)\n#21 /var/www/app/modules/cms/twig/Extension.php(102): Cms\\Classes\\Controller->renderPartial(\'layout/default/...\', Array, true)\n#22 /var/www/app/storage/cms/twig/66/66e3d9ee0915bbb6fe266371bbc41486d842add22c623130fc34fdbe5caa7e2a.php(30): Cms\\Twig\\Extension->partialFunction(\'layout/default/...\', Array, true)\n#23 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(386): __TwigTemplate_a33e7f30e3e72da1f214dbc1b57be5b688ede342dbb1e7bf4ec379906f9d2d48->doDisplay(Array, Array)\n#24 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(363): Twig_Template->displayWithErrorHandling(Array, Array)\n#25 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(371): Twig_Template->display(Array)\n#26 /var/www/app/modules/cms/classes/Controller.php(434): Twig_Template->render(Array)\n#27 /var/www/app/modules/cms/classes/Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#28 /var/www/app/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#29 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#30 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#31 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#32 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#33 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#34 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#35 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /var/www/app/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /var/www/app/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#46 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#49 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#50 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#51 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#52 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#53 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#54 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#55 /var/www/app/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#56 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#57 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#58 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#59 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#60 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#61 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#62 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#63 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#64 /var/www/app/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#65 {main}',NULL,'2019-02-08 15:30:04','2019-02-08 15:30:04'),(3,'error','Cms\\Classes\\CmsException: The partial \'layout/default/page\' is not found. in /var/www/app/modules/cms/classes/Controller.php:1032\nStack trace:\n#0 /var/www/app/modules/cms/twig/Extension.php(102): Cms\\Classes\\Controller->renderPartial(\'layout/default/...\', Array, true)\n#1 /var/www/app/storage/cms/twig/66/66e3d9ee0915bbb6fe266371bbc41486d842add22c623130fc34fdbe5caa7e2a.php(55): Cms\\Twig\\Extension->partialFunction(\'layout/default/...\', Array, true)\n#2 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(386): __TwigTemplate_a33e7f30e3e72da1f214dbc1b57be5b688ede342dbb1e7bf4ec379906f9d2d48->doDisplay(Array, Array)\n#3 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(363): Twig_Template->displayWithErrorHandling(Array, Array)\n#4 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(371): Twig_Template->display(Array)\n#5 /var/www/app/modules/cms/classes/Controller.php(434): Twig_Template->render(Array)\n#6 /var/www/app/modules/cms/classes/Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#7 /var/www/app/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#8 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#14 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /var/www/app/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /var/www/app/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#33 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#34 /var/www/app/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#35 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#36 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#42 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#43 /var/www/app/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#44 {main}\n\nNext Twig_Error_Runtime: An exception has been thrown during the rendering of a template (\"The partial \'layout/default/page\' is not found.\") in \"/var/www/app/themes/starter/layouts/default.htm\" at line 14. in /var/www/app/vendor/twig/twig/lib/Twig/Template.php:401\nStack trace:\n#0 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(363): Twig_Template->displayWithErrorHandling(Array, Array)\n#1 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(371): Twig_Template->display(Array)\n#2 /var/www/app/modules/cms/classes/Controller.php(434): Twig_Template->render(Array)\n#3 /var/www/app/modules/cms/classes/Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 /var/www/app/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#6 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#7 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#14 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /var/www/app/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#30 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#31 /var/www/app/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#32 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#33 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#34 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#39 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#40 /var/www/app/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#41 {main}',NULL,'2019-02-11 16:38:52','2019-02-11 16:38:52'),(4,'error','ErrorException: Illegal offset type in isset or empty in /var/www/app/modules/cms/classes/Controller.php:1475\nStack trace:\n#0 /var/www/app/modules/cms/classes/Controller.php(1475): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Illegal offset ...\', \'/var/www/app/mo...\', 1475, Array)\n#1 /var/www/app/modules/cms/classes/Controller.php(1211): Cms\\Classes\\Controller->findComponentByName(Object(RainLab\\Pages\\Components\\StaticMenu))\n#2 /var/www/app/modules/cms/twig/Extension.php(124): Cms\\Classes\\Controller->renderComponent(Object(RainLab\\Pages\\Components\\StaticMenu), Array)\n#3 /var/www/app/storage/cms/twig/ed/edbe6316c4662c1b3d153b5f1c1e08262db970a15231f4239df5d875a8711d8e.php(31): Cms\\Twig\\Extension->componentFunction(Object(RainLab\\Pages\\Components\\StaticMenu), Array)\n#4 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(386): __TwigTemplate_e4af57835732127218fc6c77c4c63d0eca5388574af43bc088d15478f468f8f6->doDisplay(Array, Array)\n#5 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(363): Twig_Template->displayWithErrorHandling(Array, Array)\n#6 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(371): Twig_Template->display(Array)\n#7 /var/www/app/modules/cms/classes/Controller.php(1090): Twig_Template->render(Array)\n#8 /var/www/app/modules/cms/twig/Extension.php(102): Cms\\Classes\\Controller->renderPartial(\'layout/default/...\', Array, true)\n#9 /var/www/app/storage/cms/twig/66/66e3d9ee0915bbb6fe266371bbc41486d842add22c623130fc34fdbe5caa7e2a.php(47): Cms\\Twig\\Extension->partialFunction(\'layout/default/...\', Array, true)\n#10 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(386): __TwigTemplate_a33e7f30e3e72da1f214dbc1b57be5b688ede342dbb1e7bf4ec379906f9d2d48->doDisplay(Array, Array)\n#11 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(363): Twig_Template->displayWithErrorHandling(Array, Array)\n#12 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(371): Twig_Template->display(Array)\n#13 /var/www/app/modules/cms/classes/Controller.php(434): Twig_Template->render(Array)\n#14 /var/www/app/modules/cms/classes/Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#15 /var/www/app/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#16 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#17 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#18 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#21 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#22 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#23 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#25 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 /var/www/app/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 /var/www/app/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#40 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#41 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#42 /var/www/app/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#43 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#44 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#46 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#49 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#50 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#51 /var/www/app/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#52 {main}\n\nNext Twig_Error_Runtime: An exception has been thrown during the rendering of a template (\"Illegal offset type in isset or empty\") in \"/var/www/app/themes/starter/partials/layout/default/header.htm\" at line 6. in /var/www/app/vendor/twig/twig/lib/Twig/Template.php:401\nStack trace:\n#0 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(363): Twig_Template->displayWithErrorHandling(Array, Array)\n#1 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(371): Twig_Template->display(Array)\n#2 /var/www/app/modules/cms/classes/Controller.php(1090): Twig_Template->render(Array)\n#3 /var/www/app/modules/cms/twig/Extension.php(102): Cms\\Classes\\Controller->renderPartial(\'layout/default/...\', Array, true)\n#4 /var/www/app/storage/cms/twig/66/66e3d9ee0915bbb6fe266371bbc41486d842add22c623130fc34fdbe5caa7e2a.php(47): Cms\\Twig\\Extension->partialFunction(\'layout/default/...\', Array, true)\n#5 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(386): __TwigTemplate_a33e7f30e3e72da1f214dbc1b57be5b688ede342dbb1e7bf4ec379906f9d2d48->doDisplay(Array, Array)\n#6 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(363): Twig_Template->displayWithErrorHandling(Array, Array)\n#7 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(371): Twig_Template->display(Array)\n#8 /var/www/app/modules/cms/classes/Controller.php(434): Twig_Template->render(Array)\n#9 /var/www/app/modules/cms/classes/Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#10 /var/www/app/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#11 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#14 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#16 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#17 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /var/www/app/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /var/www/app/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#34 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#35 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#36 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#37 /var/www/app/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#38 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#39 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#44 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#45 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#46 /var/www/app/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#47 {main}',NULL,'2019-02-12 12:05:58','2019-02-12 12:05:58'),(5,'error','Cms\\Classes\\CmsException: The partial \'navigation/hamburger-left-slidout\' is not found. in /var/www/app/modules/cms/classes/Controller.php:1032\nStack trace:\n#0 /var/www/app/modules/cms/twig/Extension.php(102): Cms\\Classes\\Controller->renderPartial(\'navigation/hamb...\', Array, true)\n#1 /var/www/app/storage/cms/twig/66/66e3d9ee0915bbb6fe266371bbc41486d842add22c623130fc34fdbe5caa7e2a.php(55): Cms\\Twig\\Extension->partialFunction(\'navigation/hamb...\', Array, true)\n#2 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(386): __TwigTemplate_a33e7f30e3e72da1f214dbc1b57be5b688ede342dbb1e7bf4ec379906f9d2d48->doDisplay(Array, Array)\n#3 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(363): Twig_Template->displayWithErrorHandling(Array, Array)\n#4 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(371): Twig_Template->display(Array)\n#5 /var/www/app/modules/cms/classes/Controller.php(434): Twig_Template->render(Array)\n#6 /var/www/app/modules/cms/classes/Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#7 /var/www/app/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#8 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#14 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /var/www/app/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /var/www/app/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#33 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#34 /var/www/app/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#35 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#36 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#42 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#43 /var/www/app/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#44 {main}\n\nNext Twig_Error_Runtime: An exception has been thrown during the rendering of a template (\"The partial \'navigation/hamburger-left-slidout\' is not found.\") in \"/var/www/app/themes/starter/layouts/default.htm\" at line 14. in /var/www/app/vendor/twig/twig/lib/Twig/Template.php:401\nStack trace:\n#0 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(363): Twig_Template->displayWithErrorHandling(Array, Array)\n#1 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(371): Twig_Template->display(Array)\n#2 /var/www/app/modules/cms/classes/Controller.php(434): Twig_Template->render(Array)\n#3 /var/www/app/modules/cms/classes/Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 /var/www/app/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#6 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#7 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#14 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /var/www/app/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#30 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#31 /var/www/app/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#32 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#33 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#34 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#39 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#40 /var/www/app/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#41 {main}',NULL,'2019-02-15 15:14:49','2019-02-15 15:14:49'),(6,'error','Cms\\Classes\\CmsException: The partial \'navigation/mobile-slideout-right\' is not found. in /var/www/app/modules/cms/classes/Controller.php:1032\nStack trace:\n#0 /var/www/app/modules/cms/twig/Extension.php(102): Cms\\Classes\\Controller->renderPartial(\'navigation/mobi...\', Array, true)\n#1 /var/www/app/storage/cms/twig/66/66e3d9ee0915bbb6fe266371bbc41486d842add22c623130fc34fdbe5caa7e2a.php(85): Cms\\Twig\\Extension->partialFunction(\'navigation/mobi...\', Array, true)\n#2 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(386): __TwigTemplate_a33e7f30e3e72da1f214dbc1b57be5b688ede342dbb1e7bf4ec379906f9d2d48->doDisplay(Array, Array)\n#3 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(363): Twig_Template->displayWithErrorHandling(Array, Array)\n#4 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(371): Twig_Template->display(Array)\n#5 /var/www/app/modules/cms/classes/Controller.php(434): Twig_Template->render(Array)\n#6 /var/www/app/modules/cms/classes/Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#7 /var/www/app/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#8 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#14 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /var/www/app/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /var/www/app/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#33 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#34 /var/www/app/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#35 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#36 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#42 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#43 /var/www/app/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#44 {main}\n\nNext Twig_Error_Runtime: An exception has been thrown during the rendering of a template (\"The partial \'navigation/mobile-slideout-right\' is not found.\") in \"/var/www/app/themes/starter/layouts/default.htm\" at line 21. in /var/www/app/vendor/twig/twig/lib/Twig/Template.php:401\nStack trace:\n#0 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(363): Twig_Template->displayWithErrorHandling(Array, Array)\n#1 /var/www/app/vendor/twig/twig/lib/Twig/Template.php(371): Twig_Template->display(Array)\n#2 /var/www/app/modules/cms/classes/Controller.php(434): Twig_Template->render(Array)\n#3 /var/www/app/modules/cms/classes/Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 /var/www/app/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#6 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#7 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#14 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /var/www/app/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#30 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#31 /var/www/app/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#32 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#33 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#34 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#39 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#40 /var/www/app/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#41 {main}',NULL,'2019-02-15 16:00:25','2019-02-15 16:00:25'),(7,'error','Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Call to a member function validateFrontendForm() on null in /var/www/app/plugins/dynamedia/contactform/components/ContactForm.php:163\nStack trace:\n#0 /var/www/app/plugins/dynamedia/contactform/components/ContactForm.php(57): Dynamedia\\ContactForm\\Components\\ContactForm->validateInput()\n#1 /var/www/app/modules/cms/classes/ComponentBase.php(187): Dynamedia\\ContactForm\\Components\\ContactForm->onInitiateSend()\n#2 /var/www/app/modules/cms/classes/Controller.php(873): Cms\\Classes\\ComponentBase->runAjaxHandler(\'onInitiateSend\')\n#3 /var/www/app/modules/cms/classes/Controller.php(740): Cms\\Classes\\Controller->runAjaxHandler(\'onInitiateSend\')\n#4 /var/www/app/modules/cms/classes/Controller.php(373): Cms\\Classes\\Controller->execAjaxHandlers()\n#5 /var/www/app/modules/cms/classes/Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#6 /var/www/app/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#7 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#8 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#14 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#16 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#17 /var/www/app/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#25 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 /var/www/app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#32 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#33 /var/www/app/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#34 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#35 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /var/www/app/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /var/www/app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#41 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#42 /var/www/app/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#43 {main}',NULL,'2019-02-28 14:05:28','2019-02-28 14:05:28'),(8,'error','ReflectionException: Function gdpr:cleanup() does not exist in /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php:136\nStack trace:\n#0 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(136): ReflectionFunction->__construct(\'gdpr:cleanup\')\n#1 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(115): Illuminate\\Container\\BoundMethod::getCallReflector(\'gdpr:cleanup\')\n#2 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): Illuminate\\Container\\BoundMethod::getMethodDependencies(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array)\n#3 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(75): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Object(Closure))\n#5 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array, NULL)\n#6 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/CallbackEvent.php(74): Illuminate\\Container\\Container->call(\'gdpr:cleanup\', Array)\n#7 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/ScheduleRunCommand.php(59): Illuminate\\Console\\Scheduling\\CallbackEvent->run(Object(October\\Rain\\Foundation\\Application))\n#8 [internal function]: Illuminate\\Console\\Scheduling\\ScheduleRunCommand->handle()\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), Array, Object(Closure))\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), Array, Array, NULL)\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#14 /var/www/app/vendor/symfony/console/Command/Command.php(264): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#16 /var/www/app/vendor/symfony/console/Application.php(874): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 /var/www/app/vendor/symfony/console/Application.php(228): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Console\\Scheduling\\ScheduleRunCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 /var/www/app/vendor/symfony/console/Application.php(130): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 /var/www/app/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 {main}',NULL,'2019-06-01 00:00:01','2019-06-01 00:00:01'),(9,'error','ReflectionException: Function gdpr:cleanup() does not exist in /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php:136\nStack trace:\n#0 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(136): ReflectionFunction->__construct(\'gdpr:cleanup\')\n#1 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(115): Illuminate\\Container\\BoundMethod::getCallReflector(\'gdpr:cleanup\')\n#2 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): Illuminate\\Container\\BoundMethod::getMethodDependencies(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array)\n#3 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(75): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Object(Closure))\n#5 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array, NULL)\n#6 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/CallbackEvent.php(74): Illuminate\\Container\\Container->call(\'gdpr:cleanup\', Array)\n#7 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/ScheduleRunCommand.php(59): Illuminate\\Console\\Scheduling\\CallbackEvent->run(Object(October\\Rain\\Foundation\\Application))\n#8 [internal function]: Illuminate\\Console\\Scheduling\\ScheduleRunCommand->handle()\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), Array, Object(Closure))\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), Array, Array, NULL)\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#14 /var/www/app/vendor/symfony/console/Command/Command.php(264): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#16 /var/www/app/vendor/symfony/console/Application.php(874): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 /var/www/app/vendor/symfony/console/Application.php(228): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Console\\Scheduling\\ScheduleRunCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 /var/www/app/vendor/symfony/console/Application.php(130): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 /var/www/app/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 {main}',NULL,'2019-06-15 00:00:01','2019-06-15 00:00:01'),(10,'error','ReflectionException: Function gdpr:cleanup() does not exist in /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php:136\nStack trace:\n#0 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(136): ReflectionFunction->__construct(\'gdpr:cleanup\')\n#1 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(115): Illuminate\\Container\\BoundMethod::getCallReflector(\'gdpr:cleanup\')\n#2 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): Illuminate\\Container\\BoundMethod::getMethodDependencies(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array)\n#3 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(75): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Object(Closure))\n#5 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array, NULL)\n#6 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/CallbackEvent.php(74): Illuminate\\Container\\Container->call(\'gdpr:cleanup\', Array)\n#7 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/ScheduleRunCommand.php(59): Illuminate\\Console\\Scheduling\\CallbackEvent->run(Object(October\\Rain\\Foundation\\Application))\n#8 [internal function]: Illuminate\\Console\\Scheduling\\ScheduleRunCommand->handle()\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), Array, Object(Closure))\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), Array, Array, NULL)\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#14 /var/www/app/vendor/symfony/console/Command/Command.php(264): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#16 /var/www/app/vendor/symfony/console/Application.php(874): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 /var/www/app/vendor/symfony/console/Application.php(228): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Console\\Scheduling\\ScheduleRunCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 /var/www/app/vendor/symfony/console/Application.php(130): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 /var/www/app/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 {main}',NULL,'2019-07-18 00:00:01','2019-07-18 00:00:01'),(11,'error','ReflectionException: Function gdpr:cleanup() does not exist in /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php:136\nStack trace:\n#0 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(136): ReflectionFunction->__construct(\'gdpr:cleanup\')\n#1 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(115): Illuminate\\Container\\BoundMethod::getCallReflector(\'gdpr:cleanup\')\n#2 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): Illuminate\\Container\\BoundMethod::getMethodDependencies(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array)\n#3 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(75): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Object(Closure))\n#5 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array, NULL)\n#6 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/CallbackEvent.php(74): Illuminate\\Container\\Container->call(\'gdpr:cleanup\', Array)\n#7 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/ScheduleRunCommand.php(59): Illuminate\\Console\\Scheduling\\CallbackEvent->run(Object(October\\Rain\\Foundation\\Application))\n#8 [internal function]: Illuminate\\Console\\Scheduling\\ScheduleRunCommand->handle()\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), Array, Object(Closure))\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), Array, Array, NULL)\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#14 /var/www/app/vendor/symfony/console/Command/Command.php(264): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#16 /var/www/app/vendor/symfony/console/Application.php(874): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 /var/www/app/vendor/symfony/console/Application.php(228): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Console\\Scheduling\\ScheduleRunCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 /var/www/app/vendor/symfony/console/Application.php(130): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 /var/www/app/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 {main}',NULL,'2019-07-20 00:00:02','2019-07-20 00:00:02'),(12,'error','ReflectionException: Function gdpr:cleanup() does not exist in /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php:136\nStack trace:\n#0 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(136): ReflectionFunction->__construct(\'gdpr:cleanup\')\n#1 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(115): Illuminate\\Container\\BoundMethod::getCallReflector(\'gdpr:cleanup\')\n#2 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): Illuminate\\Container\\BoundMethod::getMethodDependencies(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array)\n#3 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(75): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Object(Closure))\n#5 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array, NULL)\n#6 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/CallbackEvent.php(74): Illuminate\\Container\\Container->call(\'gdpr:cleanup\', Array)\n#7 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/ScheduleRunCommand.php(59): Illuminate\\Console\\Scheduling\\CallbackEvent->run(Object(October\\Rain\\Foundation\\Application))\n#8 [internal function]: Illuminate\\Console\\Scheduling\\ScheduleRunCommand->handle()\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), Array, Object(Closure))\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), Array, Array, NULL)\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#14 /var/www/app/vendor/symfony/console/Command/Command.php(264): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#16 /var/www/app/vendor/symfony/console/Application.php(874): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 /var/www/app/vendor/symfony/console/Application.php(228): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Console\\Scheduling\\ScheduleRunCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 /var/www/app/vendor/symfony/console/Application.php(130): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 /var/www/app/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 {main}',NULL,'2019-07-25 00:00:01','2019-07-25 00:00:01'),(13,'error','ReflectionException: Function gdpr:cleanup() does not exist in /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php:136\nStack trace:\n#0 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(136): ReflectionFunction->__construct(\'gdpr:cleanup\')\n#1 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(115): Illuminate\\Container\\BoundMethod::getCallReflector(\'gdpr:cleanup\')\n#2 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): Illuminate\\Container\\BoundMethod::getMethodDependencies(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array)\n#3 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(75): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Object(Closure))\n#5 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array, NULL)\n#6 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/CallbackEvent.php(74): Illuminate\\Container\\Container->call(\'gdpr:cleanup\', Array)\n#7 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/ScheduleRunCommand.php(59): Illuminate\\Console\\Scheduling\\CallbackEvent->run(Object(October\\Rain\\Foundation\\Application))\n#8 [internal function]: Illuminate\\Console\\Scheduling\\ScheduleRunCommand->handle()\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), Array, Object(Closure))\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), Array, Array, NULL)\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#14 /var/www/app/vendor/symfony/console/Command/Command.php(264): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#16 /var/www/app/vendor/symfony/console/Application.php(874): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 /var/www/app/vendor/symfony/console/Application.php(228): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Console\\Scheduling\\ScheduleRunCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 /var/www/app/vendor/symfony/console/Application.php(130): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 /var/www/app/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 {main}',NULL,'2019-07-28 00:00:01','2019-07-28 00:00:01'),(14,'error','ReflectionException: Function gdpr:cleanup() does not exist in /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php:136\nStack trace:\n#0 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(136): ReflectionFunction->__construct(\'gdpr:cleanup\')\n#1 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(115): Illuminate\\Container\\BoundMethod::getCallReflector(\'gdpr:cleanup\')\n#2 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): Illuminate\\Container\\BoundMethod::getMethodDependencies(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array)\n#3 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(75): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Object(Closure))\n#5 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array, NULL)\n#6 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/CallbackEvent.php(74): Illuminate\\Container\\Container->call(\'gdpr:cleanup\', Array)\n#7 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/ScheduleRunCommand.php(59): Illuminate\\Console\\Scheduling\\CallbackEvent->run(Object(October\\Rain\\Foundation\\Application))\n#8 [internal function]: Illuminate\\Console\\Scheduling\\ScheduleRunCommand->handle()\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), Array, Object(Closure))\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), Array, Array, NULL)\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#14 /var/www/app/vendor/symfony/console/Command/Command.php(264): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#16 /var/www/app/vendor/symfony/console/Application.php(874): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 /var/www/app/vendor/symfony/console/Application.php(228): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Console\\Scheduling\\ScheduleRunCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 /var/www/app/vendor/symfony/console/Application.php(130): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 /var/www/app/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 {main}',NULL,'2019-07-31 00:00:01','2019-07-31 00:00:01'),(15,'error','ReflectionException: Function gdpr:cleanup() does not exist in /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php:136\nStack trace:\n#0 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(136): ReflectionFunction->__construct(\'gdpr:cleanup\')\n#1 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(115): Illuminate\\Container\\BoundMethod::getCallReflector(\'gdpr:cleanup\')\n#2 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): Illuminate\\Container\\BoundMethod::getMethodDependencies(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array)\n#3 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(75): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Object(Closure))\n#5 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array, NULL)\n#6 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/CallbackEvent.php(74): Illuminate\\Container\\Container->call(\'gdpr:cleanup\', Array)\n#7 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/ScheduleRunCommand.php(59): Illuminate\\Console\\Scheduling\\CallbackEvent->run(Object(October\\Rain\\Foundation\\Application))\n#8 [internal function]: Illuminate\\Console\\Scheduling\\ScheduleRunCommand->handle()\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), Array, Object(Closure))\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), Array, Array, NULL)\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#14 /var/www/app/vendor/symfony/console/Command/Command.php(264): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#16 /var/www/app/vendor/symfony/console/Application.php(874): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 /var/www/app/vendor/symfony/console/Application.php(228): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Console\\Scheduling\\ScheduleRunCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 /var/www/app/vendor/symfony/console/Application.php(130): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 /var/www/app/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 {main}',NULL,'2019-08-08 00:00:01','2019-08-08 00:00:01'),(16,'error','ReflectionException: Function gdpr:cleanup() does not exist in /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php:136\nStack trace:\n#0 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(136): ReflectionFunction->__construct(\'gdpr:cleanup\')\n#1 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(115): Illuminate\\Container\\BoundMethod::getCallReflector(\'gdpr:cleanup\')\n#2 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): Illuminate\\Container\\BoundMethod::getMethodDependencies(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array)\n#3 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(75): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Object(Closure))\n#5 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array, NULL)\n#6 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/CallbackEvent.php(74): Illuminate\\Container\\Container->call(\'gdpr:cleanup\', Array)\n#7 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/ScheduleRunCommand.php(59): Illuminate\\Console\\Scheduling\\CallbackEvent->run(Object(October\\Rain\\Foundation\\Application))\n#8 [internal function]: Illuminate\\Console\\Scheduling\\ScheduleRunCommand->handle()\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), Array, Object(Closure))\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), Array, Array, NULL)\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#14 /var/www/app/vendor/symfony/console/Command/Command.php(264): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#16 /var/www/app/vendor/symfony/console/Application.php(874): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 /var/www/app/vendor/symfony/console/Application.php(228): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Console\\Scheduling\\ScheduleRunCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 /var/www/app/vendor/symfony/console/Application.php(130): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 /var/www/app/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 {main}',NULL,'2019-08-15 00:00:01','2019-08-15 00:00:01'),(17,'error','ReflectionException: Function gdpr:cleanup() does not exist in /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php:136\nStack trace:\n#0 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(136): ReflectionFunction->__construct(\'gdpr:cleanup\')\n#1 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(115): Illuminate\\Container\\BoundMethod::getCallReflector(\'gdpr:cleanup\')\n#2 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): Illuminate\\Container\\BoundMethod::getMethodDependencies(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array)\n#3 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(75): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Object(Closure))\n#5 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array, NULL)\n#6 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/CallbackEvent.php(74): Illuminate\\Container\\Container->call(\'gdpr:cleanup\', Array)\n#7 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/ScheduleRunCommand.php(59): Illuminate\\Console\\Scheduling\\CallbackEvent->run(Object(October\\Rain\\Foundation\\Application))\n#8 [internal function]: Illuminate\\Console\\Scheduling\\ScheduleRunCommand->handle()\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), Array, Object(Closure))\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), Array, Array, NULL)\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#14 /var/www/app/vendor/symfony/console/Command/Command.php(264): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#16 /var/www/app/vendor/symfony/console/Application.php(874): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 /var/www/app/vendor/symfony/console/Application.php(228): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Console\\Scheduling\\ScheduleRunCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 /var/www/app/vendor/symfony/console/Application.php(130): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 /var/www/app/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 {main}',NULL,'2019-08-16 00:00:01','2019-08-16 00:00:01'),(18,'error','ReflectionException: Function gdpr:cleanup() does not exist in /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php:136\nStack trace:\n#0 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(136): ReflectionFunction->__construct(\'gdpr:cleanup\')\n#1 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(115): Illuminate\\Container\\BoundMethod::getCallReflector(\'gdpr:cleanup\')\n#2 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): Illuminate\\Container\\BoundMethod::getMethodDependencies(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array)\n#3 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(75): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Object(Closure))\n#5 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array, NULL)\n#6 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/CallbackEvent.php(74): Illuminate\\Container\\Container->call(\'gdpr:cleanup\', Array)\n#7 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/ScheduleRunCommand.php(59): Illuminate\\Console\\Scheduling\\CallbackEvent->run(Object(October\\Rain\\Foundation\\Application))\n#8 [internal function]: Illuminate\\Console\\Scheduling\\ScheduleRunCommand->handle()\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), Array, Object(Closure))\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), Array, Array, NULL)\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#14 /var/www/app/vendor/symfony/console/Command/Command.php(264): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#16 /var/www/app/vendor/symfony/console/Application.php(874): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 /var/www/app/vendor/symfony/console/Application.php(228): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Console\\Scheduling\\ScheduleRunCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 /var/www/app/vendor/symfony/console/Application.php(130): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 /var/www/app/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 {main}',NULL,'2019-08-17 00:00:01','2019-08-17 00:00:01'),(19,'error','ReflectionException: Function gdpr:cleanup() does not exist in /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php:136\nStack trace:\n#0 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(136): ReflectionFunction->__construct(\'gdpr:cleanup\')\n#1 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(115): Illuminate\\Container\\BoundMethod::getCallReflector(\'gdpr:cleanup\')\n#2 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): Illuminate\\Container\\BoundMethod::getMethodDependencies(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array)\n#3 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(75): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Object(Closure))\n#5 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), \'gdpr:cleanup\', Array, NULL)\n#6 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/CallbackEvent.php(74): Illuminate\\Container\\Container->call(\'gdpr:cleanup\', Array)\n#7 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Scheduling/ScheduleRunCommand.php(59): Illuminate\\Console\\Scheduling\\CallbackEvent->run(Object(October\\Rain\\Foundation\\Application))\n#8 [internal function]: Illuminate\\Console\\Scheduling\\ScheduleRunCommand->handle()\n#9 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#10 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), Array, Object(Closure))\n#12 /var/www/app/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), Array, Array, NULL)\n#13 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#14 /var/www/app/vendor/symfony/console/Command/Command.php(264): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#15 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#16 /var/www/app/vendor/symfony/console/Application.php(874): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 /var/www/app/vendor/symfony/console/Application.php(228): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Console\\Scheduling\\ScheduleRunCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 /var/www/app/vendor/symfony/console/Application.php(130): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 /var/www/app/vendor/laravel/framework/src/Illuminate/Console/Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 /var/www/app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 /var/www/app/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 {main}',NULL,'2019-08-28 00:00:01','2019-08-28 00:00:01');
/*!40000 ALTER TABLE `system_event_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_files`
--

DROP TABLE IF EXISTS `system_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `system_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_files_field_index` (`field`),
  KEY `system_files_attachment_id_index` (`attachment_id`),
  KEY `system_files_attachment_type_index` (`attachment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_files`
--

LOCK TABLES `system_files` WRITE;
/*!40000 ALTER TABLE `system_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_layouts`
--

DROP TABLE IF EXISTS `system_mail_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `system_mail_layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `content_css` text COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_layouts`
--

LOCK TABLES `system_mail_layouts` WRITE;
/*!40000 ALTER TABLE `system_mail_layouts` DISABLE KEYS */;
INSERT INTO `system_mail_layouts` VALUES (1,'Default layout','default','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-default\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ \"now\"|date(\"Y\") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>','{{ content|raw }}','@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}',1,NULL,'2019-02-08 12:48:57','2019-02-08 12:48:57'),(2,'System layout','system','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-system\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>','{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.','@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}',1,NULL,'2019-02-08 12:48:57','2019-02-08 12:48:57');
/*!40000 ALTER TABLE `system_mail_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_partials`
--

DROP TABLE IF EXISTS `system_mail_partials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `system_mail_partials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_partials`
--

LOCK TABLES `system_mail_partials` WRITE;
/*!40000 ALTER TABLE `system_mail_partials` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_partials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_templates`
--

DROP TABLE IF EXISTS `system_mail_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `system_mail_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_templates`
--

LOCK TABLES `system_mail_templates` WRITE;
/*!40000 ALTER TABLE `system_mail_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_parameters`
--

DROP TABLE IF EXISTS `system_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `system_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_parameters`
--

LOCK TABLES `system_parameters` WRITE;
/*!40000 ALTER TABLE `system_parameters` DISABLE KEYS */;
INSERT INTO `system_parameters` VALUES (1,'system','update','count','0'),(2,'system','update','retry','1568456030'),(3,'cms','theme','active','\"starter\"'),(4,'system','core','build','\"458\"'),(5,'system','core','hash','\"7ecf00bd75e60458191bfcdc43dc14e5\"');
/*!40000 ALTER TABLE `system_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_plugin_history`
--

DROP TABLE IF EXISTS `system_plugin_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `system_plugin_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_plugin_history`
--

LOCK TABLES `system_plugin_history` WRITE;
/*!40000 ALTER TABLE `system_plugin_history` DISABLE KEYS */;
INSERT INTO `system_plugin_history` VALUES (1,'October.Drivers','comment','1.0.1','First version of Drivers','2019-02-08 12:49:00'),(2,'October.Drivers','comment','1.0.2','Update Guzzle library to version 5.0','2019-02-08 12:49:00'),(3,'October.Drivers','comment','1.1.0','Update AWS library to version 3.0','2019-02-08 12:49:00'),(4,'October.Drivers','comment','1.1.1','Update Guzzle library to version 6.0','2019-02-08 12:49:00'),(5,'October.Drivers','comment','1.1.2','Update Guzzle library to version 6.3','2019-02-08 12:49:00'),(6,'RainLab.Blog','script','1.0.1','create_posts_table.php','2019-02-08 12:49:02'),(7,'RainLab.Blog','script','1.0.1','create_categories_table.php','2019-02-08 12:49:02'),(8,'RainLab.Blog','script','1.0.1','seed_all_tables.php','2019-02-08 12:49:02'),(9,'RainLab.Blog','comment','1.0.1','Initialize plugin.','2019-02-08 12:49:02'),(10,'RainLab.Blog','comment','1.0.2','Added the processed HTML content column to the posts table.','2019-02-08 12:49:02'),(11,'RainLab.Blog','comment','1.0.3','Category component has been merged with Posts component.','2019-02-08 12:49:02'),(12,'RainLab.Blog','comment','1.0.4','Improvements to the Posts list management UI.','2019-02-08 12:49:02'),(13,'RainLab.Blog','comment','1.0.5','Removes the Author column from blog post list.','2019-02-08 12:49:02'),(14,'RainLab.Blog','comment','1.0.6','Featured images now appear in the Post component.','2019-02-08 12:49:02'),(15,'RainLab.Blog','comment','1.0.7','Added support for the Static Pages menus.','2019-02-08 12:49:02'),(16,'RainLab.Blog','comment','1.0.8','Added total posts to category list.','2019-02-08 12:49:02'),(17,'RainLab.Blog','comment','1.0.9','Added support for the Sitemap plugin.','2019-02-08 12:49:02'),(18,'RainLab.Blog','comment','1.0.10','Added permission to prevent users from seeing posts they did not create.','2019-02-08 12:49:02'),(19,'RainLab.Blog','comment','1.0.11','Deprecate \"idParam\" component property in favour of \"slug\" property.','2019-02-08 12:49:02'),(20,'RainLab.Blog','comment','1.0.12','Fixes issue where images cannot be uploaded caused by latest Markdown library.','2019-02-08 12:49:02'),(21,'RainLab.Blog','comment','1.0.13','Fixes problem with providing pages to Sitemap and Pages plugins.','2019-02-08 12:49:02'),(22,'RainLab.Blog','comment','1.0.14','Add support for CSRF protection feature added to core.','2019-02-08 12:49:02'),(23,'RainLab.Blog','comment','1.1.0','Replaced the Post editor with the new core Markdown editor.','2019-02-08 12:49:02'),(24,'RainLab.Blog','comment','1.1.1','Posts can now be imported and exported.','2019-02-08 12:49:02'),(25,'RainLab.Blog','comment','1.1.2','Posts are no longer visible if the published date has not passed.','2019-02-08 12:49:02'),(26,'RainLab.Blog','comment','1.1.3','Added a New Post shortcut button to the blog menu.','2019-02-08 12:49:02'),(27,'RainLab.Blog','script','1.2.0','categories_add_nested_fields.php','2019-02-08 12:49:02'),(28,'RainLab.Blog','comment','1.2.0','Categories now support nesting.','2019-02-08 12:49:02'),(29,'RainLab.Blog','comment','1.2.1','Post slugs now must be unique.','2019-02-08 12:49:02'),(30,'RainLab.Blog','comment','1.2.2','Fixes issue on new installs.','2019-02-08 12:49:02'),(31,'RainLab.Blog','comment','1.2.3','Minor user interface update.','2019-02-08 12:49:02'),(32,'RainLab.Blog','script','1.2.4','update_timestamp_nullable.php','2019-02-08 12:49:02'),(33,'RainLab.Blog','comment','1.2.4','Database maintenance. Updated all timestamp columns to be nullable.','2019-02-08 12:49:02'),(34,'RainLab.Blog','comment','1.2.5','Added translation support for blog posts.','2019-02-08 12:49:02'),(35,'RainLab.Blog','comment','1.2.6','The published field can now supply a time with the date.','2019-02-08 12:49:02'),(36,'RainLab.Blog','comment','1.2.7','Introduced a new RSS feed component.','2019-02-08 12:49:02'),(37,'RainLab.Blog','comment','1.2.8','Fixes issue with translated `content_html` attribute on blog posts.','2019-02-08 12:49:02'),(38,'RainLab.Blog','comment','1.2.9','Added translation support for blog categories.','2019-02-08 12:49:02'),(39,'RainLab.Blog','comment','1.2.10','Added translation support for post slugs.','2019-02-08 12:49:02'),(40,'RainLab.Blog','comment','1.2.11','Fixes bug where excerpt is not translated.','2019-02-08 12:49:02'),(41,'RainLab.Blog','comment','1.2.12','Description field added to category form.','2019-02-08 12:49:03'),(42,'RainLab.Blog','comment','1.2.13','Improved support for Static Pages menus, added a blog post and all blog posts.','2019-02-08 12:49:03'),(43,'RainLab.Blog','comment','1.2.14','Added post exception property to the post list component, useful for showing related posts.','2019-02-08 12:49:03'),(44,'RainLab.Blog','comment','1.2.15','Back-end navigation sort order updated.','2019-02-08 12:49:03'),(45,'RainLab.Blog','comment','1.2.16','Added `nextPost` and `previousPost` to the blog post component.','2019-02-08 12:49:03'),(46,'RainLab.Blog','comment','1.2.17','Improved the next and previous logic to sort by the published date.','2019-02-08 12:49:03'),(47,'RainLab.Blog','comment','1.2.18','Minor change to internals.','2019-02-08 12:49:03'),(48,'RainLab.Blog','comment','1.2.19','Improved support for Build 420+','2019-02-08 12:49:03'),(49,'RainLab.Blog','script','1.3.0','posts_add_metadata.php','2019-02-08 12:49:03'),(50,'RainLab.Blog','comment','1.3.0','Added metadata column for plugins to store data in','2019-02-08 12:49:03'),(51,'RainLab.Blog','comment','1.3.1','Fixed metadata column not being jsonable','2019-02-08 12:49:03'),(52,'RainLab.Pages','comment','1.0.1','Implemented the static pages management and the Static Page component.','2019-02-08 12:49:05'),(53,'RainLab.Pages','comment','1.0.2','Fixed the page preview URL.','2019-02-08 12:49:05'),(54,'RainLab.Pages','comment','1.0.3','Implemented menus.','2019-02-08 12:49:05'),(55,'RainLab.Pages','comment','1.0.4','Implemented the content block management and placeholder support.','2019-02-08 12:49:05'),(56,'RainLab.Pages','comment','1.0.5','Added support for the Sitemap plugin.','2019-02-08 12:49:05'),(57,'RainLab.Pages','comment','1.0.6','Minor updates to the internal API.','2019-02-08 12:49:05'),(58,'RainLab.Pages','comment','1.0.7','Added the Snippets feature.','2019-02-08 12:49:05'),(59,'RainLab.Pages','comment','1.0.8','Minor improvements to the code.','2019-02-08 12:49:05'),(60,'RainLab.Pages','comment','1.0.9','Fixes issue where Snippet tab is missing from the Partials form.','2019-02-08 12:49:05'),(61,'RainLab.Pages','comment','1.0.10','Add translations for various locales.','2019-02-08 12:49:05'),(62,'RainLab.Pages','comment','1.0.11','Fixes issue where placeholders tabs were missing from Page form.','2019-02-08 12:49:05'),(63,'RainLab.Pages','comment','1.0.12','Implement Media Manager support.','2019-02-08 12:49:05'),(64,'RainLab.Pages','script','1.1.0','snippets_rename_viewbag_properties.php','2019-02-08 12:49:05'),(65,'RainLab.Pages','comment','1.1.0','Adds meta title and description to pages. Adds |staticPage filter.','2019-02-08 12:49:05'),(66,'RainLab.Pages','comment','1.1.1','Add support for Syntax Fields.','2019-02-08 12:49:05'),(67,'RainLab.Pages','comment','1.1.2','Static Breadcrumbs component now respects the hide from navigation setting.','2019-02-08 12:49:05'),(68,'RainLab.Pages','comment','1.1.3','Minor back-end styling fix.','2019-02-08 12:49:05'),(69,'RainLab.Pages','comment','1.1.4','Minor fix to the StaticPage component API.','2019-02-08 12:49:05'),(70,'RainLab.Pages','comment','1.1.5','Fixes bug when using syntax fields.','2019-02-08 12:49:05'),(71,'RainLab.Pages','comment','1.1.6','Minor styling fix to the back-end UI.','2019-02-08 12:49:05'),(72,'RainLab.Pages','comment','1.1.7','Improved menu item form to include CSS class, open in a new window and hidden flag.','2019-02-08 12:49:05'),(73,'RainLab.Pages','comment','1.1.8','Improved the output of snippet partials when saved.','2019-02-08 12:49:05'),(74,'RainLab.Pages','comment','1.1.9','Minor update to snippet inspector internal API.','2019-02-08 12:49:05'),(75,'RainLab.Pages','comment','1.1.10','Fixes a bug where selecting a layout causes permanent unsaved changes.','2019-02-08 12:49:05'),(76,'RainLab.Pages','comment','1.1.11','Add support for repeater syntax field.','2019-02-08 12:49:05'),(77,'RainLab.Pages','comment','1.2.0','Added support for translations, UI updates.','2019-02-08 12:49:05'),(78,'RainLab.Pages','comment','1.2.1','Use nice titles when listing the content files.','2019-02-08 12:49:05'),(79,'RainLab.Pages','comment','1.2.2','Minor styling update.','2019-02-08 12:49:05'),(80,'RainLab.Pages','comment','1.2.3','Snippets can now be moved by dragging them.','2019-02-08 12:49:05'),(81,'RainLab.Pages','comment','1.2.4','Fixes a bug where the cursor is misplaced when editing text files.','2019-02-08 12:49:05'),(82,'RainLab.Pages','comment','1.2.5','Fixes a bug where the parent page is lost upon changing a page layout.','2019-02-08 12:49:05'),(83,'RainLab.Pages','comment','1.2.6','Shared view variables are now passed to static pages.','2019-02-08 12:49:05'),(84,'RainLab.Pages','comment','1.2.7','Fixes issue with duplicating properties when adding multiple snippets on the same page.','2019-02-08 12:49:05'),(85,'RainLab.Pages','comment','1.2.8','Fixes a bug where creating a content block without extension doesn\'t save the contents to file.','2019-02-08 12:49:05'),(86,'RainLab.Pages','comment','1.2.9','Add conditional support for translating page URLs.','2019-02-08 12:49:05'),(87,'RainLab.Pages','comment','1.2.10','Streamline generation of URLs to use the new Cms::url helper.','2019-02-08 12:49:05'),(88,'RainLab.Pages','comment','1.2.11','Implements repeater usage with translate plugin.','2019-02-08 12:49:05'),(89,'RainLab.Pages','comment','1.2.12','Fixes minor issue when using snippets and switching the application locale.','2019-02-08 12:49:05'),(90,'RainLab.Pages','comment','1.2.13','Fixes bug when AJAX is used on a page that does not yet exist.','2019-02-08 12:49:05'),(91,'RainLab.Pages','comment','1.2.14','Add theme logging support for changes made to menus.','2019-02-08 12:49:05'),(92,'RainLab.Pages','comment','1.2.15','Back-end navigation sort order updated.','2019-02-08 12:49:06'),(93,'RainLab.Pages','comment','1.2.16','Fixes a bug when saving a template that has been modified outside of the CMS (mtime mismatch).','2019-02-08 12:49:06'),(94,'RainLab.Pages','comment','1.2.17','Changes locations of custom fields to secondary tabs instead of the primary Settings area. New menu search ability on adding menu items','2019-02-08 12:49:06'),(95,'RainLab.Pages','comment','1.2.18','Fixes cache-invalidation issues when RainLab.Translate is not installed. Added Greek & Simplified Chinese translations. Removed deprecated calls. Allowed saving HTML in snippet properties. Added support for the MediaFinder in menu items.','2019-02-08 12:49:06'),(96,'RainLab.Pages','comment','1.2.19','Catch exception with corrupted menu file.','2019-02-08 12:49:06'),(97,'RainLab.Pages','comment','1.2.20','StaticMenu component now exposes menuName property; added pages.menu.referencesGenerated event.','2019-02-08 12:49:06'),(98,'RainLab.Sitemap','comment','1.0.1','First version of Sitemap','2019-02-08 12:49:07'),(99,'RainLab.Sitemap','script','1.0.2','create_definitions_table.php','2019-02-08 12:49:07'),(100,'RainLab.Sitemap','comment','1.0.2','Create definitions table','2019-02-08 12:49:07'),(101,'RainLab.Sitemap','comment','1.0.3','Minor improvements to the code.','2019-02-08 12:49:07'),(102,'RainLab.Sitemap','comment','1.0.4','Fixes issue where correct headers not being sent.','2019-02-08 12:49:07'),(103,'RainLab.Sitemap','comment','1.0.5','Minor back-end styling fix.','2019-02-08 12:49:07'),(104,'RainLab.Sitemap','comment','1.0.6','Minor fix to internal API.','2019-02-08 12:49:07'),(105,'RainLab.Sitemap','comment','1.0.7','Added access premissions.','2019-02-08 12:49:07'),(106,'RainLab.Sitemap','comment','1.0.8','Minor styling updates.','2019-02-08 12:49:07'),(107,'OFFLINE.GDPR','comment','1.0.1','Initialize plugin.','2019-02-08 12:49:09'),(108,'OFFLINE.GDPR','comment','1.0.2','Fixed translation string.','2019-02-08 12:49:09'),(109,'OFFLINE.GDPR','comment','1.0.3','Fixed loading of ConsentManager component if no settings have been defined yet','2019-02-08 12:49:09'),(110,'OFFLINE.GDPR','comment','1.0.4','Added french translations (thanks to damsfx)','2019-02-08 12:49:09'),(111,'OFFLINE.GDPR','comment','1.0.5','Fixed bug in consent manager configuration','2019-02-08 12:49:09'),(112,'OFFLINE.GDPR','script','1.0.6','create_offline_gdpr_cookie_groups.php','2019-02-08 12:49:09'),(113,'OFFLINE.GDPR','script','1.0.6','create_offline_gdpr_cookies.php','2019-02-08 12:49:09'),(114,'OFFLINE.GDPR','comment','1.0.6','Added new cookie manager component','2019-02-08 12:49:09'),(115,'OFFLINE.GDPR','comment','1.0.7','Optimized default CSS of the new cookieManager component','2019-02-08 12:49:09'),(116,'OFFLINE.GDPR','comment','1.0.8','Fixed cookie group management permission name','2019-02-08 12:49:09'),(117,'OFFLINE.GDPR','comment','1.0.9','Changed default cookie banner wording','2019-02-08 12:49:09'),(118,'OFFLINE.GDPR','comment','1.0.10','Added `ignore_behaviour` property to `cookieBanner`. You can now decide what happens if the user ignores the banner (show banner again, opt-in, opt-out).','2019-02-08 12:49:09'),(119,'OFFLINE.GDPR','comment','1.0.11','Updated french translations (thanks to damsfx)','2019-02-08 12:49:09'),(120,'OFFLINE.GDPR','comment','1.0.12','Optimized default cookieBanner styles','2019-02-08 12:49:09'),(121,'OFFLINE.GDPR','comment','1.0.13','Optimized PHP 7.2 compatibility','2019-02-08 12:49:09'),(122,'OFFLINE.GDPR','comment','1.0.14','Various bug fixes and extended support for old Laravel 5.1 installations','2019-02-08 12:49:09'),(123,'OFFLINE.GDPR','comment','1.0.15','Optimized responsive display of cookie banner on mobile devices','2019-02-08 12:49:09'),(124,'OFFLINE.GDPR','comment','1.0.16','Updated french translations (thanks to damsfx)','2019-02-08 12:49:09'),(125,'OFFLINE.GDPR','comment','1.0.17','Load the correct cookie state when visiting the cookieManager after a user has declined','2019-02-08 12:49:09'),(126,'OFFLINE.GDPR','comment','1.0.18','Fixed bug with data retention closures (thanks to Alex360hd)','2019-02-08 12:49:10'),(127,'OFFLINE.GDPR','script','1.1.1','remove_group_initial_status.php','2019-02-08 12:49:10'),(128,'OFFLINE.GDPR','script','1.1.1','add_new_cookie_fields.php','2019-02-08 12:49:10'),(129,'OFFLINE.GDPR','comment','1.1.1','!!! Removed cookie groups from banner component since they arent in line with GDPR regulations. Also added new fields to optimize ePrivacy conformity. (*Very big thank you* to ayumihamsaki for giving a lot of feedback via our GitHub page!)','2019-02-08 12:49:10'),(130,'OFFLINE.GDPR','comment','1.2.1','Finished off the Cookie Backend and did a general tidy up','2019-02-08 12:49:10'),(131,'OFFLINE.GDPR','comment','1.3.1','Added the Info and Help Section','2019-02-08 12:49:10'),(132,'OFFLINE.GDPR','script','1.3.2','add_further_new_cookie_fields.php','2019-02-08 12:49:10'),(133,'OFFLINE.GDPR','comment','1.3.2','General cleanup and extension of plugin','2019-02-08 12:49:10'),(134,'OFFLINE.GDPR','comment','2.0.0','!!! Big update to make this plugin more GDPR and ePrivacy compliant. Users of the 1.x version will have to manually update their Cookie Levels after the update. All your other settings remain compatible. Check out the new Help and Info section to find out more on how to make your Website GDPR and ePrivacy compliant.','2019-02-08 12:49:10'),(135,'OFFLINE.GDPR','comment','2.0.1','Minor cleanup and bugfixes','2019-02-08 12:49:10'),(136,'OFFLINE.GDPR','comment','2.0.2','Hide Levels selector if a cookie is disabled','2019-02-08 12:49:10'),(137,'OFFLINE.GDPR','comment','2.0.3','Minor wording changes in the cookieManager component','2019-02-08 12:49:10'),(138,'OFFLINE.GDPR','comment','2.0.4','Updated french translation (thanks to damsfx)','2019-02-08 12:49:10'),(139,'OFFLINE.GDPR','comment','2.0.5','Added Slovak translation (thanks to vosco88)','2019-02-08 12:49:10'),(140,'OFFLINE.GDPR','comment','2.0.6','Fixed installation via composer (thanks to angelcoding)','2019-02-08 12:49:10'),(141,'OFFLINE.GDPR','comment','2.0.7','Marked Cookie and CookieGroup fields as fillable','2019-02-08 12:49:10'),(142,'Dynamedia.ContactForm','script','1.0.1','create_forms_table.php','2019-02-08 12:49:15'),(143,'Dynamedia.ContactForm','script','1.0.1','create_recipients_table.php','2019-02-08 12:49:15'),(144,'Dynamedia.ContactForm','script','1.0.1','create_subjects_table.php','2019-02-08 12:49:15'),(145,'Dynamedia.ContactForm','script','1.0.1','create_senders_table.php','2019-02-08 12:49:15'),(146,'Dynamedia.ContactForm','script','1.0.1','create_messages_table.php','2019-02-08 12:49:15'),(147,'Dynamedia.ContactForm','script','1.0.1','create_pivot_tables.php','2019-02-08 12:49:16'),(148,'Dynamedia.ContactForm','comment','1.0.1','Initialize plugin.','2019-02-08 12:49:16'),(149,'Dynamedia.Items','script','1.0.1','create_types_table.php','2019-02-08 12:49:16'),(150,'Dynamedia.Items','script','1.0.1','create_items_table.php','2019-02-08 12:49:16'),(151,'Dynamedia.Items','script','1.0.1','create_fields_table.php','2019-02-08 12:49:16'),(152,'Dynamedia.Items','script','1.0.1','create_categories_table.php','2019-02-08 12:49:16'),(153,'Dynamedia.Items','script','1.0.1','create_category_item_pivot_table.php','2019-02-08 12:49:16'),(154,'Dynamedia.Items','script','1.0.1','create_type_field_pivot_table.php','2019-02-08 12:49:16'),(155,'Dynamedia.Items','comment','1.0.1','Initialise Items','2019-02-08 12:49:16'),(156,'RainLab.Blog','comment','1.3.2','Allow custom slug name for components, add 404 handling for missing blog posts, allow exporting of blog images.','2019-09-13 10:30:07'),(157,'RainLab.Blog','comment','1.3.3','Fixed \'excluded categories\' filter from being run when value is empty.','2019-09-13 10:30:07'),(158,'RainLab.Pages','comment','1.2.21','Fixes a bug where last Static Menu item cannot be deleted. Improved Persian, Slovak and Turkish translations.','2019-09-13 10:30:09'),(159,'RainLab.Pages','comment','1.3.0','Added support for using Database-driven Themes when enabled in the CMS configuration.','2019-09-13 10:30:09'),(160,'RainLab.Sitemap','comment','1.0.9','Replaced the 500 error with 404 when no definition is found. Added Czech translation. Improved Turkish, Hungarian and Portuguese (Brazil) translations.','2019-09-13 10:30:11'),(161,'OFFLINE.GDPR','comment','2.0.8','Fixed saving of translated cookie data','2019-09-13 10:30:13'),(162,'OFFLINE.GDPR','comment','2.0.9','!!! Implemented responsive design for cookieManager component. The markup of the cookieManager component changed slightly. Make sure to check for display errors if you\'ve made manual changes to this component\'s markup after this update.','2019-09-13 10:30:13'),(163,'OFFLINE.GDPR','comment','2.0.10','Fixed style bug for cookieManager component.','2019-09-13 10:30:13'),(164,'OFFLINE.GDPR','comment','2.0.11','Fixed default cookie manager markup bug','2019-09-13 10:30:13'),(165,'OFFLINE.GDPR','comment','2.0.12','Fixed minor bug in cookie manager JS','2019-09-13 10:30:13'),(166,'OFFLINE.GDPR','comment','2.0.13','Added polish translations (thanks to @Magiczne)','2019-09-13 10:30:13'),(167,'October.Demo','comment','1.0.1','First version of Demo','2019-09-13 10:31:54');
/*!40000 ALTER TABLE `system_plugin_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_plugin_versions`
--

DROP TABLE IF EXISTS `system_plugin_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `system_plugin_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_plugin_versions`
--

LOCK TABLES `system_plugin_versions` WRITE;
/*!40000 ALTER TABLE `system_plugin_versions` DISABLE KEYS */;
INSERT INTO `system_plugin_versions` VALUES (1,'October.Drivers','1.1.2','2019-02-08 12:49:00',0,0),(2,'RainLab.Blog','1.3.3','2019-09-13 10:30:07',0,0),(3,'RainLab.Pages','1.3.0','2019-09-13 10:30:09',0,0),(4,'RainLab.Sitemap','1.0.9','2019-09-13 10:30:11',0,0),(5,'OFFLINE.GDPR','2.0.13','2019-09-13 10:30:13',0,0),(6,'Dynamedia.ContactForm','1.0.1','2019-02-08 12:49:16',0,0),(7,'Dynamedia.Items','1.0.1','2019-02-08 12:49:16',0,0),(8,'October.Demo','1.0.1','2019-09-13 10:31:54',0,0);
/*!40000 ALTER TABLE `system_plugin_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_request_logs`
--

DROP TABLE IF EXISTS `system_request_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `system_request_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_request_logs`
--

LOCK TABLES `system_request_logs` WRITE;
/*!40000 ALTER TABLE `system_request_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_request_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_revisions`
--

DROP TABLE IF EXISTS `system_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `system_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  KEY `system_revisions_user_id_index` (`user_id`),
  KEY `system_revisions_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_revisions`
--

LOCK TABLES `system_revisions` WRITE;
/*!40000 ALTER TABLE `system_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `system_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-13 13:11:00

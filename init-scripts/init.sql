-- Created: 2024-06-28

-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: db-mysql-internalapps-dev-eastus2-001.mysql.database.azure.com    Database: hris
-- ------------------------------------------------------
-- Server version	8.0.36-cluster

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hris_candidate`
--

USE `hris`;

DROP TABLE IF EXISTS `hris_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hris_candidate` (
  `candidate_id` int NOT NULL AUTO_INCREMENT,
  `candidate_firstname` blob,
  `candidate_lastname` blob,
  `candidate_gender` blob,
  `candidate_personal_email` blob,
  `candidate_wso2_email` blob,
  `candidate_contact_no` blob,
  `candidate_address` blob,
  `candidate_created_on` timestamp(6) NULL DEFAULT NULL,
  `candidate_created_by` varchar(100) DEFAULT NULL,
  `candidate_updated_on` timestamp(6) NULL DEFAULT NULL,
  `candidate_updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`candidate_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hris_candidate_vacancy`
--

DROP TABLE IF EXISTS `hris_candidate_vacancy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hris_candidate_vacancy` (
  `candidate_vacancy_id` int NOT NULL AUTO_INCREMENT,
  `vacancy_id` int DEFAULT NULL,
  `candidate_id` int DEFAULT NULL,
  `interview_id` int DEFAULT NULL,
  `candidate_vacancy_interviews_completed` int DEFAULT NULL,
  `candidate_vacancy_number_of_interviews` int DEFAULT NULL,
  `candidate_vacancy_date_of_join` date DEFAULT NULL,
  `candidate_vacancy_contract_end_date` date DEFAULT NULL,
  `candidate_vacancy_applied_from` varchar(100) DEFAULT NULL,
  `candidate_vacancy_resume` varchar(100) DEFAULT NULL,
  `candidate_vacancy_status` varchar(100) DEFAULT NULL,
  `candidate_vacancy_additional_info` varchar(255) DEFAULT NULL,
  `candidate_vacancy_created_on` timestamp(6) NULL DEFAULT NULL,
  `candidate_vacancy_created_by` varchar(100) DEFAULT NULL,
  `candidate_vacancy_updated_on` timestamp(6) NULL DEFAULT NULL,
  `candidate_vacancy_updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`candidate_vacancy_id`),
  KEY `candidate_id` (`candidate_id`),
  KEY `hris_candidate_vacancy_ibfk_1` (`vacancy_id`),
  CONSTRAINT `hris_candidate_vacancy_ibfk_1` FOREIGN KEY (`vacancy_id`) REFERENCES `hris_vacancy` (`vacancy_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hris_candidate_vacancy_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `hris_candidate` (`candidate_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hris_interview`
--

DROP TABLE IF EXISTS `hris_interview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hris_interview` (
  `interview_id` int NOT NULL AUTO_INCREMENT,
  `candidate_vacancy_id` int DEFAULT NULL,
  `vacancy_interview_id` int DEFAULT NULL,
  `interview_interviewer` varchar(100) DEFAULT NULL,
  `interview_score_card` varchar(255) DEFAULT NULL,
  `interview_overall_decision` varchar(100) DEFAULT NULL,
  `interview_date` varchar(100) DEFAULT NULL,
  `interview_start_time` varchar(100) DEFAULT NULL,
  `interview_end_time` varchar(100) DEFAULT NULL,
  `interview_type` varchar(100) DEFAULT NULL,
  `interview_location` int DEFAULT NULL,
  `interview_office` int DEFAULT NULL,
  `interview_floor` int DEFAULT NULL,
  `interview_room` varchar(100) DEFAULT NULL,
  `interview_url` varchar(255) DEFAULT NULL,
  `interview_additional_comments` varchar(255) DEFAULT NULL,
  `interview_status` varchar(100) DEFAULT NULL,
  `interview_additional_info` varchar(255) DEFAULT NULL,
  `interview_created_on` timestamp(6) NULL DEFAULT NULL,
  `interview_created_by` varchar(100) DEFAULT NULL,
  `interview_updated_on` timestamp(6) NULL DEFAULT NULL,
  `interview_updated_by` varchar(100) DEFAULT NULL,
  `interview_note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`interview_id`),
  KEY `hris_interview_ibfk_1` (`candidate_vacancy_id`),
  CONSTRAINT `hris_interview_ibfk_1` FOREIGN KEY (`candidate_vacancy_id`) REFERENCES `hris_candidate_vacancy` (`candidate_vacancy_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hris_job_description`
--

DROP TABLE IF EXISTS `hris_job_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hris_job_description` (
  `jd_id` int NOT NULL AUTO_INCREMENT,
  `jd_title` varchar(100) DEFAULT NULL,
  `jd_url` varchar(255) DEFAULT NULL,
  `jd_created_on` timestamp(6) NULL DEFAULT NULL,
  `jd_created_by` varchar(100) DEFAULT NULL,
  `jd_updated_on` timestamp(6) NULL DEFAULT NULL,
  `jd_updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`jd_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hris_job_requisition`
--

DROP TABLE IF EXISTS `hris_job_requisition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hris_job_requisition` (
  `jr_id` int NOT NULL AUTO_INCREMENT,
  `jd_id` int DEFAULT NULL,
  `jr_office_id` int DEFAULT NULL,
  `jr_designation_id` int DEFAULT NULL,
  `jr_bu_id` int DEFAULT NULL,
  `jr_bu_department_id` int DEFAULT NULL,
  `jr_bu_department_team_id` int DEFAULT NULL,
  `jr_bu_department_team_subteam_id` int DEFAULT NULL,
  `jr_no_of_seats` int DEFAULT NULL,
  `jr_type` varchar(100) DEFAULT NULL,
  `jr_predecessor_email` varchar(100) DEFAULT NULL,
  `jr_employment_type` varchar(100) DEFAULT NULL,
  `jr_manager_email` varchar(100) DEFAULT NULL,
  `jr_hiring_manager_email` varchar(100) DEFAULT NULL,
  `jr_year` varchar(100) DEFAULT NULL,
  `jr_month` varchar(100) DEFAULT NULL,
  `jr_interview_panel` json DEFAULT NULL,
  `jr_additional_info` varchar(255) DEFAULT NULL,
  `jr_status` varchar(100) DEFAULT NULL,
  `jr_created_on` timestamp(6) NULL DEFAULT NULL,
  `jr_created_by` varchar(100) DEFAULT NULL,
  `jr_updated_on` timestamp(6) NULL DEFAULT NULL,
  `jr_updated_by` varchar(100) DEFAULT NULL,
  `jr_mode_of_work` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`jr_id`),
  KEY `hris_job_requisition_ibfk_1` (`jd_id`),
  CONSTRAINT `hris_job_requisition_ibfk_1` FOREIGN KEY (`jd_id`) REFERENCES `hris_job_description` (`jd_id`) ON DELETE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hris_vacancy`
--

DROP TABLE IF EXISTS `hris_vacancy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hris_vacancy` (
  `vacancy_id` int NOT NULL AUTO_INCREMENT,
  `vacancy_title` varchar(100) DEFAULT NULL,
  `jr_id` int DEFAULT NULL,
  `vacancy_visibility` varchar(100) DEFAULT NULL,
  `vacancy_note` varchar(255) DEFAULT NULL,
  `vacancy_interview` varchar(1500) DEFAULT NULL,
  `vacancy_status` varchar(100) DEFAULT NULL,
  `vacancy_additional_info` blob,
  `vacancy_created_on` timestamp(6) NULL DEFAULT NULL,
  `vacancy_created_by` varchar(100) DEFAULT NULL,
  `vacancy_updated_on` timestamp(6) NULL DEFAULT NULL,
  `vacancy_updated_by` varchar(100) DEFAULT NULL,
  `vacancy_jd_html_object` blob,
  PRIMARY KEY (`vacancy_id`),
  KEY `hris_vacancy_ibfk_1` (`jr_id`),
  CONSTRAINT `hris_vacancy_ibfk_1` FOREIGN KEY (`jr_id`) REFERENCES `hris_job_requisition` (`jr_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'hris'
--

-- ==========================================
-- Database Schema for Node-RED OEE Simulation
-- Target File: oee.json (r2d2 Flow)
-- ==========================================

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `r2d2`
--
CREATE DATABASE IF NOT EXISTS `r2d2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `r2d2`;

-- --------------------------------------------------------

--
-- Table structure for table `oee_snapshots`
-- Stores periodic (10-second) time-series telemetry metrics emitted by the Node-RED flow.
--

DROP TABLE IF EXISTS `oee_snapshots`;
CREATE TABLE `oee_snapshots` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `run_id` varchar(64) NOT NULL,
  `machine_name` varchar(100) NOT NULL DEFAULT 'R2-D2 Unit',
  `product_name` varchar(100) DEFAULT 'Product A',
  `availability` decimal(5,2) NOT NULL DEFAULT '0.00',
  `performance` decimal(5,2) NOT NULL DEFAULT '0.00',
  `quality` decimal(5,2) NOT NULL DEFAULT '0.00',
  `oee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `total_parts` int NOT NULL DEFAULT '0',
  `good_parts` int NOT NULL DEFAULT '0',
  `defect_parts` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_run_id` (`run_id`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oee_summary`
-- Holds cumulative operational durations and run-level performance metrics.
--

DROP TABLE IF EXISTS `oee_summary`;
CREATE TABLE `oee_summary` (
  `run_id` varchar(64) NOT NULL,
  `machine_name` varchar(100) NOT NULL DEFAULT 'R2-D2 Unit',
  `elapsed_s` int NOT NULL DEFAULT '0',
  `downtime_s` int NOT NULL DEFAULT '0',
  `setup_s` int NOT NULL DEFAULT '0',
  `runtime_s` int NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`run_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oee_events`
-- Records discrete state transition events (e.g., speed gear changes, setup events, product changes).
--

DROP TABLE IF EXISTS `oee_events`;
CREATE TABLE `oee_events` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `run_id` varchar(64) NOT NULL,
  `event_type` varchar(50) NOT NULL,
  `event_value` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_run_events` (`run_id`, `event_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Sample Initial Data Seed
--

INSERT INTO `oee_summary` (`run_id`, `machine_name`, `elapsed_s`, `downtime_s`, `setup_s`, `runtime_s`) 
VALUES ('RUN-2026-INIT', 'R2-D2 Unit', 0, 0, 0, 0);

INSERT INTO `oee_events` (`run_id`, `event_type`, `event_value`) 
VALUES ('RUN-2026-INIT', 'SYSTEM_STARTUP', 'INITIALIZED');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
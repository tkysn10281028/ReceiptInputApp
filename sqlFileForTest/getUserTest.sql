-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- ホスト: mysql
-- 生成日時: 2022 年 8 月 28 日 01:02
-- サーバのバージョン： 8.0.29
-- PHP のバージョン: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `myapp`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `BATCH_JOB_EXECUTION`
--

CREATE TABLE `BATCH_JOB_EXECUTION` (
  `JOB_EXECUTION_ID` bigint NOT NULL,
  `VERSION` bigint DEFAULT NULL,
  `JOB_INSTANCE_ID` bigint NOT NULL,
  `CREATE_TIME` timestamp NOT NULL,
  `START_TIME` timestamp NULL DEFAULT NULL,
  `END_TIME` timestamp NULL DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `EXIT_CODE` varchar(20) DEFAULT NULL,
  `EXIT_MESSAGE` varchar(2500) DEFAULT NULL,
  `LAST_UPDATED` timestamp NULL DEFAULT NULL,
  `JOB_CONFIGURATION_LOCATION` varchar(2500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `BATCH_JOB_EXECUTION_CONTEXT`
--

CREATE TABLE `BATCH_JOB_EXECUTION_CONTEXT` (
  `JOB_EXECUTION_ID` bigint NOT NULL,
  `SHORT_CONTEXT` varchar(2500) NOT NULL,
  `SERIALIZED_CONTEXT` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `BATCH_JOB_EXECUTION_PARAMS`
--

CREATE TABLE `BATCH_JOB_EXECUTION_PARAMS` (
  `JOB_EXECUTION_ID` bigint NOT NULL,
  `TYPE_CD` varchar(6) NOT NULL,
  `KEY_NAME` varchar(100) NOT NULL,
  `STRING_VAL` varchar(250) DEFAULT NULL,
  `DATE_VAL` datetime DEFAULT NULL,
  `LONG_VAL` bigint DEFAULT NULL,
  `DOUBLE_VAL` double DEFAULT NULL,
  `IDENTIFYING` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `BATCH_JOB_EXECUTION_SEQ`
--

CREATE TABLE `BATCH_JOB_EXECUTION_SEQ` (
  `ID` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `BATCH_JOB_EXECUTION_SEQ`
--

INSERT INTO `BATCH_JOB_EXECUTION_SEQ` (`ID`) VALUES
(0);

-- --------------------------------------------------------

--
-- テーブルの構造 `BATCH_JOB_INSTANCE`
--

CREATE TABLE `BATCH_JOB_INSTANCE` (
  `JOB_INSTANCE_ID` bigint NOT NULL,
  `VERSION` bigint DEFAULT NULL,
  `JOB_NAME` varchar(100) NOT NULL,
  `JOB_KEY` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `BATCH_JOB_SEQ`
--

CREATE TABLE `BATCH_JOB_SEQ` (
  `ID` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `BATCH_JOB_SEQ`
--

INSERT INTO `BATCH_JOB_SEQ` (`ID`) VALUES
(0);

-- --------------------------------------------------------

--
-- テーブルの構造 `BATCH_STEP_EXECUTION`
--

CREATE TABLE `BATCH_STEP_EXECUTION` (
  `STEP_EXECUTION_ID` bigint NOT NULL,
  `VERSION` bigint NOT NULL,
  `STEP_NAME` varchar(100) NOT NULL,
  `JOB_EXECUTION_ID` bigint NOT NULL,
  `START_TIME` timestamp NOT NULL,
  `END_TIME` timestamp NULL DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `COMMIT_COUNT` bigint DEFAULT NULL,
  `READ_COUNT` bigint DEFAULT NULL,
  `FILTER_COUNT` bigint DEFAULT NULL,
  `WRITE_COUNT` bigint DEFAULT NULL,
  `READ_SKIP_COUNT` bigint DEFAULT NULL,
  `WRITE_SKIP_COUNT` bigint DEFAULT NULL,
  `PROCESS_SKIP_COUNT` bigint DEFAULT NULL,
  `ROLLBACK_COUNT` bigint DEFAULT NULL,
  `EXIT_CODE` varchar(20) DEFAULT NULL,
  `EXIT_MESSAGE` varchar(2500) DEFAULT NULL,
  `LAST_UPDATED` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `BATCH_STEP_EXECUTION_CONTEXT`
--

CREATE TABLE `BATCH_STEP_EXECUTION_CONTEXT` (
  `STEP_EXECUTION_ID` bigint NOT NULL,
  `SHORT_CONTEXT` varchar(2500) NOT NULL,
  `SERIALIZED_CONTEXT` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `BATCH_STEP_EXECUTION_SEQ`
--

CREATE TABLE `BATCH_STEP_EXECUTION_SEQ` (
  `ID` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `BATCH_STEP_EXECUTION_SEQ`
--

INSERT INTO `BATCH_STEP_EXECUTION_SEQ` (`ID`) VALUES
(0);

-- --------------------------------------------------------

--
-- テーブルの構造 `flyway_schema_history`
--

CREATE TABLE `flyway_schema_history` (
  `installed_rank` int NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `flyway_schema_history`
--

INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES
(1, '1', 'CreateTableInit', 'SQL', 'V1__CreateTableInit.sql', -790856275, 'myapp', '2022-08-15 00:52:09', 332, 1),
(2, '2', 'CreateTableForApp', 'SQL', 'V2__CreateTableForApp.sql', -940918215, 'myapp', '2022-08-15 00:58:36', 633, 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `MAJOR_ITEM`
--

CREATE TABLE `MAJOR_ITEM` (
  `MAJOR_ITEM_INCREMENT_ID` int NOT NULL,
  `USER_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `POSTED_DATE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `POSTED_TIME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MAJOR_ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MAJOR_ITEM_PRICE` int DEFAULT NULL,
  `CREATE_USER` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CREATE_DATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_USER` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UPDATE_DATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `MAJOR_ITEM`
--

INSERT INTO `MAJOR_ITEM` (`MAJOR_ITEM_INCREMENT_ID`, `USER_ID`, `POSTED_DATE`, `POSTED_TIME`, `MAJOR_ITEM_NAME`, `MAJOR_ITEM_PRICE`, `CREATE_USER`, `CREATE_DATE_TIME`, `UPDATE_USER`, `UPDATE_DATE_TIME`) VALUES
(1, '001', '2022/8/12', '10:00', 'item1', 100, 'test', '2022-08-21 11:41:58', 'test', '2022-08-21 11:48:29'),
(2, '001', '2022/8/12', '11:00', 'item2', 200, 'test', '2022-08-21 11:41:58', 'test', '2022-08-21 11:48:33'),
(3, '002', '2022/8/13', '12:00', 'item3', 300, 'test', '2022-08-21 11:41:58', 'test', '2022-08-21 11:48:36'),
(4, '002', '2022/8/13', '13:00', 'item4', 400, 'test', '2022-08-21 11:41:58', 'test', '2022-08-21 11:48:40');

-- --------------------------------------------------------

--
-- テーブルの構造 `MIDDLE_ITEM`
--

CREATE TABLE `MIDDLE_ITEM` (
  `MIDDLE_ITEM_INCREMENT_ID` int NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `POSTED_DATE` varchar(15) NOT NULL,
  `MIDDLE_ITEM_NAME` text NOT NULL,
  `MIDDLE_ITEM_PRICE` int DEFAULT NULL,
  `MAJOR_ITEM_NAME` varchar(100) NOT NULL,
  `MAJOR_ITEM_INCREMENT_ID` int NOT NULL,
  `DELETE_FLG` tinyint NOT NULL,
  `CREATE_USER` text NOT NULL,
  `CREATE_DATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_USER` text NOT NULL,
  `UPDATE_DATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `MINOR_ITEM`
--

CREATE TABLE `MINOR_ITEM` (
  `MINOR_ITEM_INCREMENT_ID` int NOT NULL,
  `USER_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `POSTED_DATE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MINOR_ITEM_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MINOR_ITEM_PRICE` int DEFAULT NULL,
  `MAJOR_ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MAJOR_ITEM_INCREMENT_ID` int NOT NULL,
  `MIDDLE_ITEM_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MIDDLE_ITEM_INCREMENT_ID` int NOT NULL,
  `DELETE_FLG` tinyint NOT NULL,
  `CREATE_USER` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CREATE_DATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_USER` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UPDATE_DATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `USER_INFO`
--

CREATE TABLE `USER_INFO` (
  `USER_INCREMENT_ID` int NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `USER_NAME` text,
  `EMAIL_ADDRESS` text,
  `PASSWORD` text,
  `CREATE_USER` text,
  `CREATE_DATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_USER` text,
  `UPDATE_DATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `USER_INFO`
--

INSERT INTO `USER_INFO` (`USER_INCREMENT_ID`, `USER_ID`, `USER_NAME`, `EMAIL_ADDRESS`, `PASSWORD`, `CREATE_USER`, `CREATE_DATE_TIME`, `UPDATE_USER`, `UPDATE_DATE_TIME`) VALUES
(1, '001', 'TEST', 'test@test.com', 'test', 'test', '2022-08-10 21:15:16', 'test', '2022-08-10 21:15:16'),
(2, '002', 'TESTtest', 'test@test.jp', 'test', 'test', '2022-08-10 21:15:16', 'test', '2022-08-10 22:50:24');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `BATCH_JOB_EXECUTION`
--
ALTER TABLE `BATCH_JOB_EXECUTION`
  ADD PRIMARY KEY (`JOB_EXECUTION_ID`),
  ADD KEY `JOB_INSTANCE_EXECUTION_FK` (`JOB_INSTANCE_ID`);

--
-- テーブルのインデックス `BATCH_JOB_EXECUTION_CONTEXT`
--
ALTER TABLE `BATCH_JOB_EXECUTION_CONTEXT`
  ADD PRIMARY KEY (`JOB_EXECUTION_ID`);

--
-- テーブルのインデックス `BATCH_JOB_EXECUTION_PARAMS`
--
ALTER TABLE `BATCH_JOB_EXECUTION_PARAMS`
  ADD KEY `JOB_EXEC_PARAMS_FK` (`JOB_EXECUTION_ID`);

--
-- テーブルのインデックス `BATCH_JOB_INSTANCE`
--
ALTER TABLE `BATCH_JOB_INSTANCE`
  ADD PRIMARY KEY (`JOB_INSTANCE_ID`);

--
-- テーブルのインデックス `BATCH_STEP_EXECUTION`
--
ALTER TABLE `BATCH_STEP_EXECUTION`
  ADD PRIMARY KEY (`STEP_EXECUTION_ID`),
  ADD KEY `JOB_EXECUTION_STEP_FK` (`JOB_EXECUTION_ID`);

--
-- テーブルのインデックス `BATCH_STEP_EXECUTION_CONTEXT`
--
ALTER TABLE `BATCH_STEP_EXECUTION_CONTEXT`
  ADD PRIMARY KEY (`STEP_EXECUTION_ID`);

--
-- テーブルのインデックス `flyway_schema_history`
--
ALTER TABLE `flyway_schema_history`
  ADD PRIMARY KEY (`installed_rank`),
  ADD KEY `flyway_schema_history_s_idx` (`success`);

--
-- テーブルのインデックス `MAJOR_ITEM`
--
ALTER TABLE `MAJOR_ITEM`
  ADD PRIMARY KEY (`MAJOR_ITEM_INCREMENT_ID`,`USER_ID`,`POSTED_DATE`,`MAJOR_ITEM_NAME`);

--
-- テーブルのインデックス `MIDDLE_ITEM`
--
ALTER TABLE `MIDDLE_ITEM`
  ADD PRIMARY KEY (`MIDDLE_ITEM_INCREMENT_ID`,`USER_ID`,`POSTED_DATE`);

--
-- テーブルのインデックス `MINOR_ITEM`
--
ALTER TABLE `MINOR_ITEM`
  ADD PRIMARY KEY (`MINOR_ITEM_INCREMENT_ID`,`USER_ID`,`POSTED_DATE`);

--
-- テーブルのインデックス `USER_INFO`
--
ALTER TABLE `USER_INFO`
  ADD PRIMARY KEY (`USER_INCREMENT_ID`,`USER_ID`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `MAJOR_ITEM`
--
ALTER TABLE `MAJOR_ITEM`
  MODIFY `MAJOR_ITEM_INCREMENT_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- テーブルの AUTO_INCREMENT `MIDDLE_ITEM`
--
ALTER TABLE `MIDDLE_ITEM`
  MODIFY `MIDDLE_ITEM_INCREMENT_ID` int NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `MINOR_ITEM`
--
ALTER TABLE `MINOR_ITEM`
  MODIFY `MINOR_ITEM_INCREMENT_ID` int NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `USER_INFO`
--
ALTER TABLE `USER_INFO`
  MODIFY `USER_INCREMENT_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `BATCH_JOB_EXECUTION`
--
ALTER TABLE `BATCH_JOB_EXECUTION`
  ADD CONSTRAINT `JOB_INSTANCE_EXECUTION_FK` FOREIGN KEY (`JOB_INSTANCE_ID`) REFERENCES `BATCH_JOB_INSTANCE` (`JOB_INSTANCE_ID`);

--
-- テーブルの制約 `BATCH_JOB_EXECUTION_CONTEXT`
--
ALTER TABLE `BATCH_JOB_EXECUTION_CONTEXT`
  ADD CONSTRAINT `JOB_EXEC_CTX_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `BATCH_JOB_EXECUTION` (`JOB_EXECUTION_ID`);

--
-- テーブルの制約 `BATCH_JOB_EXECUTION_PARAMS`
--
ALTER TABLE `BATCH_JOB_EXECUTION_PARAMS`
  ADD CONSTRAINT `JOB_EXEC_PARAMS_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `BATCH_JOB_EXECUTION` (`JOB_EXECUTION_ID`);

--
-- テーブルの制約 `BATCH_STEP_EXECUTION`
--
ALTER TABLE `BATCH_STEP_EXECUTION`
  ADD CONSTRAINT `JOB_EXECUTION_STEP_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `BATCH_JOB_EXECUTION` (`JOB_EXECUTION_ID`);

--
-- テーブルの制約 `BATCH_STEP_EXECUTION_CONTEXT`
--
ALTER TABLE `BATCH_STEP_EXECUTION_CONTEXT`
  ADD CONSTRAINT `STEP_EXEC_CTX_FK` FOREIGN KEY (`STEP_EXECUTION_ID`) REFERENCES `BATCH_STEP_EXECUTION` (`STEP_EXECUTION_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

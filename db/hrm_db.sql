/*
 Navicat Premium Data Transfer

 Source Server         : ECS
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : 47.96.112.160:3306
 Source Schema         : hrm_db

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 10/07/2018 22:19:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `job_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `spring_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES (1, '0 59 23 * * ?', '任务调度', '1', 'execute', 'taskInfo');

-- ----------------------------
-- Table structure for t_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_apply`;
CREATE TABLE `t_apply`  (
  `RE_ATTEND_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '补签数据UUID\r\n补签数据UUID',
  `ATTEND_DATE` datetime(0) NOT NULL COMMENT '补签日期',
  `RE_ATTEND_STARTER_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '补签发起人UUID',
  `RE_ATTEND_MOR` datetime(0) DEFAULT NULL COMMENT '补签日期早打卡时间',
  `RE_ATTEND_EVE` datetime(0) DEFAULT NULL COMMENT '补签日期晚打卡时间',
  `RE_ATTEND_HANDLER_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '补签处理人',
  `STATUS` int(4) NOT NULL COMMENT '补签状态 -1-不通过  0-审核中 1-已通过',
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '补签注释',
  PRIMARY KEY (`RE_ATTEND_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_attend
-- ----------------------------
DROP TABLE IF EXISTS `t_attend`;
CREATE TABLE `t_attend`  (
  `ATTEND_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考勤数据UUID',
  `ATTEND_DATE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '打卡日期',
  `ATTEND_WEEK` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '打卡星期几',
  `ATTEND_MORNING` datetime(0) DEFAULT NULL COMMENT '上午打卡时间',
  `ATTEND_EVENING` datetime(0) DEFAULT NULL COMMENT '下午打卡时间',
  `WORK_HOURS` int(10) DEFAULT NULL COMMENT '工作时长',
  `ABSENCE` int(10) DEFAULT NULL COMMENT '缺勤时长',
  `ATTEND_STATUS` int(1) DEFAULT 1 COMMENT '考勤状态  0-异常  1-正常',
  PRIMARY KEY (`ATTEND_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_attend
-- ----------------------------
INSERT INTO `t_attend` VALUES ('126B0JCNEC297001', '2018-05-01', '星期二', '2018-05-01 08:56:24', '2018-05-01 19:24:36', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0JHR0S297001', '2018-05-02', '星期三', '2018-05-02 08:43:17', '2018-05-02 18:56:22', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0JJLD6297001', '2018-05-03', '星期四', '2018-05-03 08:47:24', '2018-05-03 19:01:23', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0JLK5E297001', '2018-05-04', '星期五', '2018-05-04 08:23:11', '2018-05-04 20:16:11', 12, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0JO24S297001', '2018-05-05', '星期六', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('126B0JQB3E297001', '2018-05-06', '星期日', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('126B0JQVHA297001', '2018-05-07', '星期一', '2018-05-07 08:11:17', '2018-05-07 19:47:16', 12, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0JT60G297001', '2018-05-08', '星期二', '2018-05-08 08:44:19', '2018-05-08 18:49:11', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0JVNVM297001', '2018-05-09', '星期三', '2018-05-09 08:59:33', '2018-05-09 19:44:12', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0K1EM3297001', '2018-05-10', '星期四', '2018-05-10 08:43:21', '2018-05-10 21:16:22', 13, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0K352J297001', '2018-05-11', '星期五', '2018-05-11 08:42:45', '2018-05-11 18:21:22', 10, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0K61QC297001', '2018-05-12', '星期六', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('126B0K6II3297001', '2018-05-13', '星期日', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('126B0K770E297001', '2018-05-14', '星期一', '2018-05-14 08:37:22', '2018-05-14 21:44:22', 13, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0K8VT3297001', '2018-05-15 ', '星期二', '2018-05-15 08:22:12', '2018-05-15 22:05:10', 14, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0KAKPS297001', '2018-05-16', '星期三', '2018-05-16 07:58:22', '2018-05-16 21:09:11', 13, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0KEVQ7297001', '2018-05-17', '星期四', '2018-05-17 08:47:33', '2018-05-17 19:22:09', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0KGJJF297001', '2018-05-18', '星期五', '2018-05-18 08:47:17', '2018-05-18 21:16:09', 13, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0KI8H7297001', '2018-05-19', '星期六', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('126B0KJ0N9297001', '2018-05-20', '星期日', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('126B0KJK8G297001', '2018-05-21', '星期一', '2018-05-21 08:54:21', '2018-05-21 19:28:21', 10, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0KLJ3E297001', '2018-05-22', '星期二', '2018-05-22 08:41:55', '2018-05-22 21:22:54', 13, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0KN5L6297001', '2018-05-23', '星期三', '2018-05-23 08:51:22', '2018-05-23 22:12:44', 14, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0KOIME297001', '2018-05-24', '星期四', '2018-05-24 07:43:11', '2018-05-24 21:09:11', 14, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0KQ5PA297001', '2018-05-25', '星期五', '2018-05-25 09:43:21', '2018-05-25 21:16:59', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0KRMMF297001', '2018-05-26', '星期六', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('126B0KSDP7297001', '2018-05-27', '星期日', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('126B0KSUV2297001', '2018-05-28', '星期一', '2018-05-28 08:22:44', '2018-05-28 19:22:32', 10, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0KUB4Q297001', '2018-05-29', '星期二', '2018-05-29 08:43:11', '2018-05-29 21:22:41', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0KVO40297001', '2018-05-30', '星期三', '2018-05-30 08:33:12', '2018-05-30 21:19:22', 13, 0, 1);
INSERT INTO `t_attend` VALUES ('126B0L18J8297001', '2018-05-31', '星期四', '2018-05-31 08:11:01', '2018-05-31 19:22:11', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('126B1AKSQE297001', '2018-06-01', '星期五', '2018-06-01 09:22:12', '2018-06-01 17:55:24', 8, 27, 0);
INSERT INTO `t_attend` VALUES ('126B1AOD8R297001', '2018-06-02', '星期六', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('126B1AOU2C297001', '2018-06-03', '星期日', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('126B1APHGD297001', '2018-06-04', '星期一', '2018-06-04 08:55:24', '2018-06-04 19:22:46', 10, 0, 1);
INSERT INTO `t_attend` VALUES ('126B1ARHKS297001', '2018-06-05', '星期二', '2018-06-05 08:22:14', '2018-06-05 19:55:22', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('126B1ASPCB297001', '2018-06-06', '星期三', '2018-06-06 08:32:22', '2018-06-06 19:22:14', 10, 0, 1);
INSERT INTO `t_attend` VALUES ('126B1AU3JP297001', '2018-06-07 ', '星期四', '2018-06-07 08:56:15', '2018-06-07 20:16:12', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('126B1AVP4I297001', '2018-06-08 ', '星期五', '2018-06-08 08:44:16', '2018-06-08 20:14:22', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('126B1B1IMQ297001', '2018-06-09', '星期六', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('126B1B23DL297001', '2018-06-10', '星期日', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('126B1B2LN2297001', '2018-06-11', '星期一', '2018-06-11 08:22:19', '2018-06-11 20:39:10', 12, 0, 1);
INSERT INTO `t_attend` VALUES ('126C0N12G4297001', '2018-06-12', '星期二', '2018-06-12 08:34:11', '2018-06-12 20:44:55', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('126D0J6KAS297001', '2018-06-13', '星期三', '2018-06-13 08:58:23', '2018-06-13 20:03:23', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('126E1JP0M7297001', '2018-06-14', '星期四', '2018-06-14 08:22:43', '2018-06-14 23:07:06', 14, 0, 1);
INSERT INTO `t_attend` VALUES ('126F03MKQ3297003', '2018-06-15', '星期五', '2018-06-15 09:04:41', '2018-06-15 15:12:03', 6, 111, 0);
INSERT INTO `t_attend` VALUES ('126G04G3V6297004', '2018-06-16', '星期六', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('12771EKDQP297001', '2018-06-17', '星期日', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('12771EPIMF297001', '2018-06-18', '星期一', '2018-06-18 08:22:55', '2018-06-18 20:11:22', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('12771EVJ5A297001', '2018-06-19', '星期二', '2018-06-19 08:44:22', '2018-06-19 20:01:11', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('12771F25OV297001', '2018-06-20', '星期三', '2018-06-20 09:01:56', '2018-06-20 20:56:51', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('12771F3P0I297001', '2018-06-21 ', '星期四', '2018-06-21 09:00:45', '2018-06-21 21:02:04', 12, 0, 1);
INSERT INTO `t_attend` VALUES ('12771F53AH297001', '2018-06-22', '星期五', '2018-06-22 08:43:22', '2018-06-22 19:22:19', 10, 0, 1);
INSERT INTO `t_attend` VALUES ('12771F6RNG297001', '2018-06-23', '星期六', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('12771F7INR297001', '2018-06-24', '星期日', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('12771F86L0297001', '2018-06-25', '星期一', '2018-06-25 08:55:21', '2018-06-25 19:01:27', 10, 0, 1);
INSERT INTO `t_attend` VALUES ('12771FBS9H297001', '2018-06-26', '星期二', '2018-06-26 08:49:54', '2018-06-26 19:43:22', 10, 0, 1);
INSERT INTO `t_attend` VALUES ('12771FD74J297001', '2018-06-27', '星期三', '2018-06-27 08:55:11', '2018-06-27 20:07:29', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('12771FF1D4297001', '2018-06-28', '星期四', '2018-06-28 09:22:51', '2018-06-28 20:11:44', 10, 0, 1);
INSERT INTO `t_attend` VALUES ('12771FGKPV297001', '2018-06-29', '星期五', '2018-06-29 09:11:41', '2018-06-29 20:01:19', 10, 0, 1);
INSERT INTO `t_attend` VALUES ('12771FI81O297001', '2018-06-30', '星期六', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('12771FIRMF297001', '2018-07-01', '星期日', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('12771FJKSU297001', '2018-07-02', '星期一', '2018-07-02 08:55:19', '2018-07-02 21:42:18', 12, 0, 1);
INSERT INTO `t_attend` VALUES ('12771FL61B297001', '2018-07-03', '星期二', '2018-07-03 08:59:01', '2018-07-03 21:31:51', 12, 0, 1);
INSERT INTO `t_attend` VALUES ('12771FMVT1297001', '2018-07-04', '星期三', '2018-07-04 08:54:46', '2018-07-04 19:42:49', 10, 0, 1);
INSERT INTO `t_attend` VALUES ('12771FOIDH297001', '2018-07-05', '星期四', '2018-07-05 08:59:29', '2018-07-05 20:12:53', 11, 0, 1);
INSERT INTO `t_attend` VALUES ('12771FQ75K297001', '2018-07-06', '星期五', '2018-07-06 08:43:19', '2018-07-06 21:19:33', 12, 0, 1);
INSERT INTO `t_attend` VALUES ('12771FRFJ7297001', '2018-07-07', '星期六', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_attend` VALUES ('1278171OUH297001', '2018-07-08', '星期日', NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for t_attend_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_attend_apply`;
CREATE TABLE `t_attend_apply`  (
  `ATTEND_REATTEND_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考勤-补签关联UUID',
  `ATTEND_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考勤UUID',
  `RE_ATTEND_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '补签UUID',
  `STATUS` int(4) NOT NULL COMMENT '补签信息状态 0-失效  1-正常',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`ATTEND_REATTEND_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept`  (
  `DEPT_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门编号',
  `DEPT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门名称',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '部门创建时间',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '部门修改时间',
  `STATUS` int(11) DEFAULT 1 COMMENT '部门状态   0-已取消 1-存在',
  `DEPT_REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门描述',
  `DEPT_LEADER_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门领导人员工编号',
  PRIMARY KEY (`DEPT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('126108720Q29700F', 'HR部门', '2018-06-01 10:23:40', NULL, 1, '负责企业内的认识管理', NULL);
INSERT INTO `t_dept` VALUES ('126219MCS829700L', '应用开发部', '2018-06-02 20:08:46', NULL, 1, '负责内部系统的开发', NULL);
INSERT INTO `t_dept` VALUES ('126219PGOF29700M', '移动应用部', '2018-06-02 20:10:28', '2018-06-02 20:13:35', 1, '负责完成带有移动端开发的项目', NULL);
INSERT INTO `t_dept` VALUES ('126219QBS829700N', '系统架构部', '2018-06-02 20:10:56', '2018-06-03 09:29:47', 1, '主要研究系统的架构', NULL);
INSERT INTO `t_dept` VALUES ('126219RDHR29700O', '金融事业部', '2018-06-02 20:11:30', '2018-06-02 20:13:32', 1, '主要负责开发银行类系统', NULL);
INSERT INTO `t_dept` VALUES ('126219TGKC29700P', '网络应用部', '2018-06-02 20:12:39', '2018-06-02 20:13:30', 1, '负责企业内部服务器网络可用', NULL);
INSERT INTO `t_dept` VALUES ('126219U97T29700Q', '人工智能研发部', '2018-06-02 20:13:04', '2018-06-02 20:13:28', 1, '进行人工智能方面的研究', NULL);
INSERT INTO `t_dept` VALUES ('126219UPCM29700R', '区块链研究部', '2018-06-02 20:13:21', '2018-06-02 20:13:26', 1, '负责区块链方面的研究', NULL);
INSERT INTO `t_dept` VALUES ('12621A0D1529700S', '环境架构部', '2018-06-02 20:14:14', '2018-06-03 09:29:38', 1, '为开发提供服务，搭建开发需要的环境', NULL);
INSERT INTO `t_dept` VALUES ('12621A13LI29700T', '华东交付中心', '2018-06-02 20:14:37', '2018-06-03 09:29:42', 0, '负责华东地区项目的交付工作', NULL);
INSERT INTO `t_dept` VALUES ('12621AABE129700U', '华北交付中心', '2018-06-02 20:19:40', NULL, 0, '负责华北地区的项目交付', NULL);
INSERT INTO `t_dept` VALUES ('12621ABV7829700V', '华南交付中心', '2018-06-02 20:20:33', NULL, 1, '负责华南方向的项目交付任务', NULL);

-- ----------------------------
-- Table structure for t_emp
-- ----------------------------
DROP TABLE IF EXISTS `t_emp`;
CREATE TABLE `t_emp`  (
  `EMP_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'UUID',
  `EMP_NUM` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工工号',
  `EMP_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工姓名',
  `SEX` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别 ',
  `AGE` int(11) DEFAULT NULL COMMENT '年龄',
  `ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `PHONE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电话号码',
  `EMAIL` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `PACE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名族',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `STATUS` int(2) NOT NULL DEFAULT 1 COMMENT '是否在职 0-离职 1-在职',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `FLAG` tinyint(2) UNSIGNED ZEROFILL NOT NULL COMMENT '是否为管理员账号 0-普通员工 1-管理员',
  PRIMARY KEY (`EMP_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_emp
-- ----------------------------
INSERT INTO `t_emp` VALUES ('12370I6SDEA93003', 'A00003', 'admin', '男', 24, '湖北省麻城市', '17766320452', '508275369@qq.com', '汉', '2018-06-01 10:14:23', '2018-06-01 10:16:57', 1, '系统管理员，系统权限最高拥有者', 01);
INSERT INTO `t_emp` VALUES ('12620S8LBN297003', 'A00004', 'Jeremy', '男', 24, '湖北省麻城市', '17766320452', '508275369@qq.com', '汉', '2018-06-02 16:14:04', '2018-06-03 15:09:06', 1, '系统权限管理员', 01);
INSERT INTO `t_emp` VALUES ('1262112UC6297001', 'A00005', 'shell', '男', 22, '广东省天河区', '13519216348', '1962865883@qq.com', '汉', '2018-06-02 17:38:25', '2018-06-02 18:36:28', 1, '管理系统内部门信息', 01);
INSERT INTO `t_emp` VALUES ('126215B0C9297001', 'A00006', 'Sunny', '男', 25, '上海浦东新区', '18769576236', '255657187@gamil.com', '汉', '2018-06-02 18:52:38', NULL, 1, '帮助HR部门经理管理系统日志信息', 01);
INSERT INTO `t_emp` VALUES ('126219LAHB29700I', 'A00007', 'Abbott ', '男', 25, '美国加尼福尼亚州', '18853628621', 'Abbott@gmail.com', '无', '2018-06-02 20:08:11', '2018-06-03 14:30:37', 1, '帮助HR部门经理管理员工信息', 01);
INSERT INTO `t_emp` VALUES ('126313QSC9297006', 'A00008', 'jackson', '男', 27, '美国佛罗里达州', '13989429583', 'jackson@gmail.com', '无', '2018-06-03 18:26:52', '2018-06-04 12:15:02', 1, '测试员工信息修改流程', 00);
INSERT INTO `t_emp` VALUES ('126412HL06297001', 'A00009', 'Abby', '男', 25, '瑞士苏黎世', '18847823911', 'Abby520@gmail.com', '无', '2018-06-04 18:03:50', '2018-06-05 17:50:33', 1, '技术过硬，拥有较高的开发能力', 00);
INSERT INTO `t_emp` VALUES ('126412TJCS297001', 'A00010', 'Alisa', '男', 22, '瑞士苏黎世', '13987729976', 'Alisa@gmail.com', '无', '2018-06-04 18:10:22', '2018-06-05 17:50:31', 1, '能够很好的组织项目开发', 00);
INSERT INTO `t_emp` VALUES ('12641AEUQH29700A', 'A00013', 'Fern ', '男', 25, '英国伦敦', '18692674782', 'Fern3306@gmail.com', '无', '2018-06-04 20:22:11', NULL, 1, '熟悉人工智能的开发', 00);
INSERT INTO `t_emp` VALUES ('12641B06MG29700D', 'A00014', 'Alexande', '男', 27, '瑞士苏黎世', '13973561958', 'Alexande@gmail.com', '无', '2018-06-04 20:31:36', NULL, 1, '运维经验丰富', 00);
INSERT INTO `t_emp` VALUES ('12650RH1VV297003', 'A00015', '杨朝来', '男', 22, '广西省南宁市', '18279491135', 'yangchaolai@163.com', '壮', '2018-06-05 16:01:11', NULL, 1, '对人工智能方便研究较深', 00);
INSERT INTO `t_emp` VALUES ('12650RJ9IQ297006', 'A00016', '赵小雪', '女', 22, '湖北省武汉市', '17392740147', 'zhaoxiaoxue@firfox.com', '汉', '2018-06-05 16:02:24', NULL, 0, '拥有较强的组织能力和过硬的技术', 00);
INSERT INTO `t_emp` VALUES ('1265128THC297004', 'A00017', '丁建伟', '男', 21, '湖北省武汉市', '13948274488', 'dingjianwei@gmail.com', '汉', '2018-06-05 17:59:04', NULL, 1, '五年工作经验，拥有开发大型项目的组织能力', 00);
INSERT INTO `t_emp` VALUES ('126512CTQC297008', 'A00018', '凡小芬', '女', 20, '上海浦东新区', '13726389144', 'fanxiaofen@gmail.com', '汉', '2018-06-05 18:01:15', NULL, 1, '实习生，对新技术有很好的适应力', 00);
INSERT INTO `t_emp` VALUES ('126512LJAQ29700C', 'A00019', '文彭凤', '女', 22, '北京市海淀区', '18729872019', 'wenpengfeng@firfox.com', '汉', '2018-06-05 18:06:00', NULL, 1, '能够自主解决较多问题，开发能力较强', 00);

-- ----------------------------
-- Table structure for t_emp_param
-- ----------------------------
DROP TABLE IF EXISTS `t_emp_param`;
CREATE TABLE `t_emp_param`  (
  `EMP_PARAM_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工信息参数UUID',
  `EMP_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工编号',
  `DEPT_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工对应的部门编号',
  `JOB_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工对应的职位编号',
  `STATUS` int(11) NOT NULL DEFAULT 1 COMMENT '状态 1-正常 0-失效',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`EMP_PARAM_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_emp_param
-- ----------------------------
INSERT INTO `t_emp_param` VALUES ('126108SJNHAKS52K', '12370I6SDEA93003', '126108720Q29700F', '1261088SG129700H', 1, '系统管理员对应信息');
INSERT INTO `t_emp_param` VALUES ('12620S8LBN297004', '12620S8LBN297003', '126108720Q29700F', '12620AVUJD29700B', 1, '负责管理HR部门人员的分配以及系统权限管理员');
INSERT INTO `t_emp_param` VALUES ('1262112UC6297002', '1262112UC6297001', '126108720Q29700F', '126213AMC1297006', 1, '1111111111111');
INSERT INTO `t_emp_param` VALUES ('126215B0CA297002', '126215B0C9297001', '126108720Q29700F', '12620GDEK4297005', 1, '帮助HR部门经理管理系统日志信息');
INSERT INTO `t_emp_param` VALUES ('126219LAHB29700J', '126219LAHB29700I', '126108720Q29700F', '12620GDEK4297005', 1, '帮助HR部门经理管理员工信息');
INSERT INTO `t_emp_param` VALUES ('126313R6OQ297007', '126313QSC9297006', '126219MCS829700L', '12621AGF4T297011', 1, '测试员工信息插入过程');
INSERT INTO `t_emp_param` VALUES ('126412HL07297002', '126412HL06297001', '126219PGOF29700M', '12621B8QJK297004', 1, '技术过硬，拥有较高的开发能力');
INSERT INTO `t_emp_param` VALUES ('126412TJCS297002', '126412TJCS297001', '126219MCS829700L', '12630A23BJ297005', 1, '拥有完备的知识体系，能够很好的组织项目开发');
INSERT INTO `t_emp_param` VALUES ('12641AEUQH29700B', '12641AEUQH29700A', '126219U97T29700Q', '126306A8UD29700K', 1, '熟悉人工智能的开发');
INSERT INTO `t_emp_param` VALUES ('12641B06MG29700E', '12641B06MG29700D', '12621ABV7829700V', '1263064M9429700H', 1, '运维经验丰富');
INSERT INTO `t_emp_param` VALUES ('12650RH1VV297004', '12650RH1VV297003', '126219U97T29700Q', '126306A8UD29700K', 1, '对人工智能方便研究较深');
INSERT INTO `t_emp_param` VALUES ('12650RJ9IQ297007', '12650RJ9IQ297006', '126219MCS829700L', '12630A23BJ297005', 0, '拥有较强的组织能力和过硬的技术');
INSERT INTO `t_emp_param` VALUES ('1265128THC297005', '1265128THC297004', '126219MCS829700L', '12621AGF4T297011', 1, '五年工作经验，拥有开发大型项目的组织能力');
INSERT INTO `t_emp_param` VALUES ('126512CTQC297009', '126512CTQC297008', '126219MCS829700L', '12630DIVC4297006', 1, '实习生，对新技术有很好的适应力');
INSERT INTO `t_emp_param` VALUES ('126512LJAQ29700D', '126512LJAQ29700C', '126219MCS829700L', '126306F5V729700M', 1, '能够自主解决较多问题，开发能力较强');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job`  (
  `JOB_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位编号',
  `JOB_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位名称',
  `ATTACH_DEPT_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位隶属于部门ID',
  `VOLUME` int(10) DEFAULT NULL COMMENT '拟招人数',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `STATUS` int(4) NOT NULL DEFAULT 1 COMMENT '职位状态  1-在职  0-空缺',
  `REMARK` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职位描述',
  PRIMARY KEY (`JOB_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO `t_job` VALUES ('1261088SG129700H', 'HR部门经理', '126108720Q29700F', 1, '2018-06-01 10:24:40', '2018-06-03 10:31:31', 1, '拥有HR系统最高权限');
INSERT INTO `t_job` VALUES ('12620AVUJD29700B', 'HR部门主管', '126108720Q29700F', 1, '2018-06-02 11:12:13', '2018-06-03 10:31:40', 1, '负责HR部门人员管理');
INSERT INTO `t_job` VALUES ('12620GDEK4297005', '经理助理', '126108720Q29700F', 4, '2018-06-02 12:46:58', '2018-06-03 10:31:52', 1, '帮助HR部门经理处理日常事务');
INSERT INTO `t_job` VALUES ('126213AMC1297006', '部门管理', '126108720Q29700F', 2, '2018-06-02 18:17:31', '2018-06-03 10:31:58', 1, '负责系统内部门的管理');
INSERT INTO `t_job` VALUES ('12621AGF4T297011', 'Java高级开发工程师', '126219MCS829700L', 2, '2018-06-02 20:23:00', '2018-06-03 10:32:14', 1, '主要完成系统的核心设计');
INSERT INTO `t_job` VALUES ('12621B8QJK297004', 'Java高级开发工程师', '126219PGOF29700M', 1, '2018-06-02 20:36:18', '2018-06-03 12:01:41', 1, '负责后台核心模块的开发工作');
INSERT INTO `t_job` VALUES ('1263064M9429700H', '高级运维工程师', '12621ABV7829700V', 3, '2018-06-03 09:47:25', '2018-06-03 10:32:43', 1, '在华南地区进行运维工作');
INSERT INTO `t_job` VALUES ('1263065UDP29700I', '系统架构师', '126219QBS829700N', 2, '2018-06-03 09:48:06', '2018-06-03 10:32:52', 1, '研究公司内部项目架构');
INSERT INTO `t_job` VALUES ('126306850V29700J', '人工智能初级工程师', '126219U97T29700Q', 10, '2018-06-03 09:49:19', '2018-06-03 10:33:01', 1, '负责初级人工智能研究');
INSERT INTO `t_job` VALUES ('126306A8UD29700K', '人工智能中级工程师', '126219U97T29700Q', 6, '2018-06-03 09:50:28', '2018-06-03 10:33:13', 0, '负责中级的人工智能研究工作');
INSERT INTO `t_job` VALUES ('126306B90Q29700L', '人工智能高级工程师', '126219U97T29700Q', 2, '2018-06-03 09:51:01', '2018-06-03 10:33:25', 1, '负责高级人工智能的研究工作');
INSERT INTO `t_job` VALUES ('126306F5V729700M', 'java初级工程师', '126219MCS829700L', 10, '2018-06-03 09:53:09', '2018-06-03 11:24:57', 1, '完成项目的初级工作');
INSERT INTO `t_job` VALUES ('12630A05KQ297004', '应用开发部门经理', '126219MCS829700L', 1, '2018-06-03 10:54:52', NULL, 1, '负责应用开发部大小事务');
INSERT INTO `t_job` VALUES ('12630A23BJ297005', '应用开发部项目经理', '126219MCS829700L', 2, '2018-06-03 10:55:55', NULL, 1, '负责应用开发部内项目的开发部署');
INSERT INTO `t_job` VALUES ('12630A5BB4297006', 'Java中级工程师', '126219MCS829700L', 5, '2018-06-03 10:57:41', NULL, 1, '负责主要项目的开发');
INSERT INTO `t_job` VALUES ('12630DIVC4297006', 'java开发助理', '126219MCS829700L', 15, '2018-06-03 11:57:33', NULL, 1, '协助工程师完成项目的开发');
INSERT INTO `t_job` VALUES ('12630DKAIG297007', '移动应用部门经理', '126219PGOF29700M', 1, '2018-06-03 11:58:18', NULL, 1, '负责移动应用部门大小事务');
INSERT INTO `t_job` VALUES ('12630DMJ5H297008', '移动应用部项目经理', '126219PGOF29700M', 2, '2018-06-03 11:59:32', NULL, 1, '引领移动应用部项目的开发流程');
INSERT INTO `t_job` VALUES ('12630DNQGM297009', 'Java中级工程师', '126219PGOF29700M', 3, '2018-06-03 12:00:12', '2018-06-03 12:01:51', 1, '负责移动应用部项目的开发');
INSERT INTO `t_job` VALUES ('12630DP70C29700A', 'java初级工程师', '126219PGOF29700M', 5, '2018-06-03 12:00:58', '2018-06-03 12:02:00', 1, '负责移动应用部项目基础部分的编写');
INSERT INTO `t_job` VALUES ('12630DQ81729700B', '开发助理', '126219PGOF29700M', 10, '2018-06-03 12:01:32', '2018-06-03 12:15:25', 1, '协助移动应用部工程师的工作');
INSERT INTO `t_job` VALUES ('12630DUJQ729700C', 'Android初级工程师', '126219PGOF29700M', 5, '2018-06-03 12:03:55', NULL, 1, '完成移动应用部项目Android端基础模块的开发');
INSERT INTO `t_job` VALUES ('12630EHEIO29700D', 'Android中级工程师', '126219PGOF29700M', 3, '2018-06-03 12:14:12', NULL, 1, '负责完成项目Android端核心代码');
INSERT INTO `t_job` VALUES ('12630EJ79G29700E', 'Android高级工程师', '126219PGOF29700M', 2, '2018-06-03 12:15:10', NULL, 1, '负责项目Android端最核心代码的编写');
INSERT INTO `t_job` VALUES ('12630ELG4R29700G', '系统架构部门经理', '126219QBS829700N', 1, '2018-06-03 12:16:25', NULL, 1, '负责系统架构部大小事务');
INSERT INTO `t_job` VALUES ('12630ENF5229700I', '系统架构部项目经理', '126219QBS829700N', 2, '2018-06-03 12:17:29', NULL, 1, '负责系统架构部项目的开发');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `LOG_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志编号',
  `LOG_TYPE_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志类型编号',
  `USER_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户编号',
  `IP` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录IP',
  `OPERATE_TIME` datetime(0) NOT NULL COMMENT '操作时间',
  `REQUEST_URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求路径',
  `RESPONSE_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '相应的状态码',
  `STATUS` int(11) NOT NULL DEFAULT 1 COMMENT '状态 默认为1 删除为0',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`LOG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('125Q1A107P297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-26 20:14:33', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125Q1A1M1S297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-26 20:14:56', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R09ORD0297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 10:50:52', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125R09QJ46297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 10:51:49', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R09RVFT297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 10:52:34', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R09S8MB297004', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 10:52:44', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R0SP9RD297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 16:23:09', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125R0TLTC4297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 16:38:47', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125R0UQOTM297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 16:58:55', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R0UQUD8297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 16:59:00', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R0V0BGF297004', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 17:01:58', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R0V2H1A297005', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 17:03:09', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R0VEOMO297006', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 17:09:50', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R0VGLTB297007', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 17:10:53', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R0VKDLF297008', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 17:12:55', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R0VO746297009', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 17:15:00', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R0VQB5829700A', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 17:16:09', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R0VRT7529700B', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 17:17:01', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R0VSE5B29700C', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 17:17:18', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R10154B29700D', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 17:19:52', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R10BB9529700E', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 17:25:26', '/log/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R10BQ5329700F', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 17:25:42', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R1HS8HI297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 22:31:46', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125R1I284J297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 22:35:03', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125R1I9TU3297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 22:39:14', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125R1IICU1297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 22:43:52', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125R1IVFKM297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 22:51:01', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125R1JCI5K297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 22:58:09', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125R1K5I0M297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 23:11:48', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R1K7T4B297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 23:13:05', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R1KAKEG297004', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 23:14:35', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R1KJR0V297005', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 23:19:36', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R1KJTKS297006', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 23:19:39', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R1KSQFP297007', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 23:24:31', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R1L08RN297008', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 23:26:24', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R1L0R0E297009', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 23:26:42', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R1L115929700A', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 23:26:48', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R1L1CPA29700B', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 23:27:00', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R1L895P29700C', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 23:30:46', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R1L8EQQ29700D', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 23:30:52', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125R1LN44129700E', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-27 23:38:52', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S03BVRM297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 08:58:59', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125S03EGJG297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:00:21', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S03F3QP297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:00:41', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S03IO82297004', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:02:40', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S03J1VL297005', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:02:50', '/permission/menu/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S03M3C5297006', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:04:30', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S03N01A297007', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:04:59', '/log/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S03N40O297008', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:05:04', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S03NB55297009', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:05:11', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S03NIDO29700A', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:05:18', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S03NPJ829700B', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:05:26', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S03PE7829700C', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:06:19', '/permission/menu/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S03QIGH29700D', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:06:57', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S03QL0429700E', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:06:59', '/log/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S03RCI229700F', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:07:23', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S03RJ7U29700G', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:07:30', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S03RKPK29700H', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:07:32', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S03S10929700I', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:07:44', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S04552G29700J', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:12:43', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S045E2K29700K', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:12:53', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S04790129700L', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:13:53', '/permission/menu/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S04A7IH29700M', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:15:30', '/permission/menu/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S04C2EC29700N', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:16:30', '/permission/menu/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S04D9CJ29700O', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:17:10', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S04FI6L29700P', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:18:24', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S04G60G29700Q', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:18:45', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S04G97U29700R', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:18:48', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S04O3NG29700S', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:23:05', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S04O6KF29700T', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:23:08', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S04ODE929700U', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:23:15', '/log/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S04OG8129700V', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:23:17', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S04RVC2297010', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:25:11', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S05L0D2297011', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:38:51', '/log/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S05MDJP297012', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 09:39:38', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S0S00S8297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 16:09:21', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125S0S04IE297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 16:09:25', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S1NNI6V297001', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 00:14:04', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S1NOUI5297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 00:14:49', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125S1NPD47297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-28 00:15:04', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T0RT2OL297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-29 16:07:45', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T0RT5EJ297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-29 16:07:47', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T0S0CJ5297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-29 16:09:33', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T0S0FC8297004', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-29 16:09:36', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T0S0UIU297005', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-29 16:09:51', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T0S2NQU297006', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-29 16:10:50', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T0S5KK6297007', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-29 16:12:25', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T0S8K02297008', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-29 16:14:03', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T0S8OF7297009', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-29 16:14:07', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T0T4HQT297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-29 16:29:18', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T0T4L8E297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-29 16:29:22', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T0T5IEL297003', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-29 16:29:51', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T0T5LKL297004', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-29 16:29:55', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T0UO0GI297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 16:57:24', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T0UO2GT297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 16:57:26', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T0V03PC297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 17:01:50', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T0V07AC297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 17:01:53', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T10SD5J297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 17:34:45', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T10SFD1297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 17:34:48', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T11C0KQ297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 17:43:17', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T11C2KN297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 17:43:19', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T11M2PG297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 17:48:47', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T11MHQP297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 17:49:02', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T11TTMS297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 17:53:04', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T11U0FI297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 17:53:07', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T12HA29297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:03:39', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T12HC8C297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:03:41', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T12I56K297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:04:07', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T12PDMS297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:08:05', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T12PG0V297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:08:07', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T12U8TQ297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:10:44', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T12UELA297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:10:50', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T131U4J297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:12:44', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T1329OU297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:12:56', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T13HM02297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:21:20', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T13HOR2297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:21:23', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T13JCF8297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:22:16', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T13M13G297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:23:42', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T13M394297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:23:44', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T13OMOU297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:25:10', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T13OPV7297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:25:13', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T1433FH297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:30:51', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T1438DS297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:30:56', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T15FUNU297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 18:55:20', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T16A4TB297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 19:09:39', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T16A897297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 19:09:42', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T1AGU7U297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 20:23:15', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T1AH0V9297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 20:23:18', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T1AM9MK297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 20:26:11', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T1AMDH9297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 20:26:15', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T1AQ8EG297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 20:28:21', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T1AQALO297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 20:28:23', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T1AVFID297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 20:31:12', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T1AVI1A297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 20:31:14', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125T1B586N297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 20:34:21', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125T1B5ABJ297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-29 20:34:23', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U0ES8B2297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-30 12:20:06', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125U0SL4K0297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 16:20:53', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125U0SL98T297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 16:20:58', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U0SLMAC297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 16:21:11', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U0SOCA4297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 16:22:39', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U0TOF9U297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 16:40:11', '/log/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U0V3PVT297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 17:03:51', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U0V3US3297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 17:03:56', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U0VH9RS297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 17:11:13', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125U0VHCQ6297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 17:11:16', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U10L0E2297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 17:30:43', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125U10L356297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 17:30:46', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U10M0KU297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 17:31:16', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U10NHHG297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 17:32:06', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U10SV43297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 17:35:04', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U10V9FR297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 17:36:20', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U1121CQ297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 17:37:50', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U1139RC297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 17:38:31', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U113LD8297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 17:38:43', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U11A6G629700A', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 17:42:17', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U13LNDE29700B', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 18:23:32', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125U13LPDQ29700C', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 18:23:34', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U13NTHH29700D', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 18:24:44', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U13R7HD29700E', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 18:26:33', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U145NM429700F', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 18:32:17', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U15FDL729700G', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 18:55:03', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125U15V92B297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-05-30 19:03:42', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125V0MGLMO297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-31 14:33:35', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125V0MGP5U297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-31 14:33:39', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125V0MH9M4297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-31 14:33:56', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125V0MI277297004', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-31 14:34:21', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125V0MI4UT297005', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-31 14:34:24', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125V0MI6NM297006', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-31 14:34:25', '/log/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('125V0QAF58297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-31 15:40:06', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125V0TIHMK297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-05-31 16:36:57', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('125V0TILVH297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-05-31 16:37:01', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126106KR4G297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 09:56:15', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126107S4MQ297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 10:17:42', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126107SR2P297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 10:18:05', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126107TLPK297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 10:18:33', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126107TSQF297004', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 10:18:40', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126107UI0S297005', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 10:19:02', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126107UKDN297006', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 10:19:04', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126107UTI3297007', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 10:19:13', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1261080SKO297008', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 10:20:18', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1261081G0R297009', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 10:20:38', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1261081TKL29700A', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 10:20:52', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1261082MR129700B', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 10:21:18', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1261082QCF29700C', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 10:21:21', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1261082T3R29700D', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 10:21:24', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1261086CE429700E', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 10:23:18', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1261087AVK29700G', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 10:23:49', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12610892IL29700I', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 10:24:46', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126108EUBR29700J', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 10:27:58', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12610CSJN1297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 11:45:21', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12610CSULP297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 11:45:32', '/permission/user/page.html', '1', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12610CVD6T297001', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 11:46:52', '/permission/user/page.html', '1', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12610D1QBD297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 11:48:11', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12610D1SOA297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 11:48:14', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12610D7098297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 11:51:01', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12610D7N5G297004', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 11:51:25', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12610DJQKR297005', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 11:58:01', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12610DKDEE297006', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 11:58:21', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12610DQPRI297007', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 12:01:50', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12610DR0AD297008', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 12:01:57', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12610UCMD7BVR001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 16:51:13', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12610UD56ABVR002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 16:51:29', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12610UDVUIBVR003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-01 16:51:56', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126205NTEK297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 09:40:27', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126205O33F297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 09:40:32', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126205O9MM297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 09:40:39', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126205OQHV297004', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 09:40:57', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126205Q5NP297005', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 09:41:41', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126205QS67297006', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 09:42:04', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126206D550297001', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 09:52:03', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126209DS8G297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 10:44:52', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126209E10E297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 10:44:57', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126209G1RM297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 10:46:03', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126209GB55297004', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 10:46:13', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620A923H297001', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 10:59:43', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620A9RFR297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 11:00:09', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620ALOU7297004', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 11:06:39', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620AP9BS297007', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 11:08:35', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620AT463297009', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 11:10:40', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620AUKU129700A', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 11:11:30', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620B02VP29700C', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 11:12:17', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620B5UUK29700D', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 11:15:30', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620BBL3V297001', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 11:18:36', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620BG0M8297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 11:20:59', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12620BG2MN297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 11:21:01', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620BH3G4297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 11:21:35', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620BHMOM297004', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 11:21:55', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620BPCS0297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 11:26:07', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12620BPH8L297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 11:26:11', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620D0ATV297001', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 11:47:23', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620E28UC297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 12:05:55', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620E31V1297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 12:06:20', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620FNG01297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 12:34:59', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12620FNJC0297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 12:35:02', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620GAGPM297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 12:45:22', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620GBLNH297004', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 12:46:00', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620GDJ89297006', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 12:47:03', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620GMT6K297009', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 12:52:08', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620GRM5A297001', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 12:54:45', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620S5KAV297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 16:12:25', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12620S5OB8297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 16:12:29', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620SAVCB297005', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 16:15:20', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620T7HLU297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 16:30:56', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12620T7KGG297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 16:30:59', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620U6FSS297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 16:47:50', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12620U6IBD297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 16:47:53', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12620VR8N7297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 17:16:40', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12620VRC3G297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 17:16:43', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1262100F6R297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 17:19:30', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1262100HJ9297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 17:19:32', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126210UKGO297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 17:35:58', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126210UN16297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 17:36:01', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1262116F7T297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 17:40:15', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126211U02U297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 17:53:06', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126211U2BQ297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 17:53:08', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126211VCRV297001', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 17:53:52', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12621239OA297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 17:56:00', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1262123C9F297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 17:56:02', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1262131JDV297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:12:33', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1262131NAO297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:12:37', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1262131QJ1297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:12:40', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126213279Q297004', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:12:53', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1262133JA6297005', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:13:38', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126213ART6297007', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:17:36', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126213CT87297008', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:18:43', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126213EF3Q297009', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:19:34', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126213JBH9297001', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:22:15', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126213P5DH297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:25:25', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126213P9FQ297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:25:29', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126213TP07297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:27:56', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126213TR5H297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:27:58', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1262143D9D297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:31:01', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1262143GEC297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:31:04', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126214C3SN297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:35:46', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126214C5TV297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:35:48', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126214E6K7297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:36:54', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126214FALK297004', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:37:31', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126215KNPP297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:57:57', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126215KTRO297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 18:58:03', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126216M08V297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:16:07', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126216M2KV297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:16:10', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126217JTNL297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:32:28', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126217K9B1297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:32:39', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126217NUPN297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:34:40', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126217O26Q297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:34:43', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126217OK9D297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:35:02', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12621879GJ297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:43:02', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1262187EIQ297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:43:07', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126218LN93297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:50:55', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126218ST1O297004', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:54:50', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126218UB4B297005', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:55:37', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1262190B6L297006', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:56:43', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1262192307297007', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:57:40', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1262192670297008', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:57:44', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1262192TO9297009', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:58:08', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12621930S329700A', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:58:11', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1262193VQR29700C', '808953751040688128l', '12620S8LBN297003', '192.168.43.201', '2018-06-02 19:58:43', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12621947QE29700D', '808953871287189504l', '12620S8LBN297003', '192.168.43.201', '2018-06-02 19:58:51', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1262194E5829700E', '808953871287189504l', '12620S8LBN297003', '192.168.43.201', '2018-06-02 19:58:57', '/permission/menu/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1262194S5G29700F', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:59:12', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1262195S0329700G', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 19:59:44', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1262197L8J29700H', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 20:00:43', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126219LLDV29700K', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 20:08:22', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12621AC8IL297010', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 20:20:42', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12621AGO2T297012', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 20:23:09', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12621AOFPG297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 20:27:23', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12621AOK3B297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 20:27:27', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12621APEBV297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 20:27:54', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12621ASQH4297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 20:29:45', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12621ASUGS297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 20:29:49', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12621B4A3Q297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-02 20:33:50', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126304KP2R297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 09:21:15', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126304LDDO297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 09:21:36', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126304N6MI297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 09:22:35', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126304PD5R297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 09:23:47', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126304PSDJ297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 09:24:03', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126304PTEJ297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 09:24:04', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126304QGOK297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 09:24:23', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126304R8U3297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 09:24:48', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126304RDCE297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 09:24:53', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630531S729700B', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 09:29:03', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1263053LSI29700C', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 09:29:24', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1263053RJQ29700D', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 09:29:29', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630556HT29700E', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 09:30:13', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1263055INC29700F', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 09:30:26', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630636UD29700G', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 09:46:37', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126308L0OS297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 10:31:18', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126308L438297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 10:31:21', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126309HH40297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 10:46:52', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126309O75H297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 10:50:31', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126309R25L297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 10:52:04', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630BMOA4297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 11:24:40', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12630BMQM1297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 11:24:43', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630BOSCQ297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 11:25:50', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630BSMR5297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 11:27:55', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630CD2FV297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 11:36:51', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12630CD50O297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 11:36:54', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630CG2OS297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 11:38:30', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630DCM2G297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 11:54:07', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12630DCOF7297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 11:54:10', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630DDKPJ297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 11:54:39', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630DEUHG297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 11:55:22', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630DGSQO297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 11:56:25', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630EJVL629700F', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 12:15:35', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630ELMRU29700H', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 12:16:32', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630ENIT729700J', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 12:17:33', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630ENQNU29700K', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 12:17:41', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630ETNOQ29700L', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 12:20:55', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630F5P0129700M', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 12:25:18', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630HIB4N297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:07:07', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12630HID45297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:07:09', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630HKAUD297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:08:12', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630HNA8L297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:09:50', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630HOEAQ297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:10:27', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630HPPGR297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:11:11', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630HS2OJ297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:12:26', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630HTGR9297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:13:13', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12630HTIUO297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:13:15', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630I2FT2297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:15:56', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630I92L4297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:19:32', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630IBRLL297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:21:03', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630ICGA8297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:21:24', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630IFJCM297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:23:06', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12630IFLBP297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:23:08', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630IGJHE297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:23:39', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630IJ2JP297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:25:00', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630IK0N6297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:25:30', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630ILOQU297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:26:28', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630IMLQQ297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:26:58', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630J19T4297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:32:46', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630J2766297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:33:16', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630J5K4829700A', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:35:07', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630JBK9R29700B', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:38:24', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630JF7F629700C', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:40:22', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630JIN6D29700D', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:42:17', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630JSSK829700E', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:47:50', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630JUSP229700F', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:48:55', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630K277T29700G', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:50:44', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630K75QG29700H', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 13:53:27', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630O1LCM297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 15:00:21', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12630O1NS8297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 15:00:23', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630O8M6J297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 15:04:11', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630O9FG1297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 15:04:37', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12630O9OBP297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 15:04:46', '/permission/user/page.html', '1', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630OD2QP297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 15:06:35', '/permission/user/page.html', '1', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630OF9DH297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 15:07:47', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12630OFPQU297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 15:08:04', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630OKVS2297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 15:10:54', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630OLVKB297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 15:11:26', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630OMVIP297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 15:11:59', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630ON49G297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 15:12:04', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630OT56P297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 15:15:21', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630OTDT3297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 15:15:30', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630OUV4K297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 15:16:21', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630P9KOB297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 15:22:11', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12630Q84Q6297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 15:38:50', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630QN4A9297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 15:47:01', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630RJI7B297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:02:33', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630RT36D297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:07:45', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630RTIHI297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:08:01', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630RUPR3297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:08:41', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630S1LGG297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:10:15', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630S4IL0297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:11:50', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630TEH8U297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:34:45', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12630TEJIP297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:34:48', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630TIDVC297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:36:53', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630TKVN3297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:38:17', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630TLS3B297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:38:46', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12630TNPKD297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:39:49', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630UDIC5297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:51:42', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12630UDMCC297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:51:46', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630UEOQA297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:52:21', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630UG7T7297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:53:10', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12630UGA3F297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:53:12', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630UGUDE297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:53:33', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12630UP674297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 16:58:03', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126312UVSK297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:11:07', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1263137AS6297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:15:41', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1263137COU297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:15:43', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126313O354297004', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:24:50', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126313O66R297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:24:53', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126313TB6M297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:27:42', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126313TPVB29700A', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:27:57', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126313TU2529700B', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:28:01', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126313U5QM29700C', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:28:09', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1263141GSV29700D', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:29:59', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1263144NQP297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:31:44', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12631453G8297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:31:56', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1263146EKC297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:32:40', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126314D1OG297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:36:17', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126314D41H297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:36:19', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126314GC35297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:38:05', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126314GE5Q297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:38:08', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126314ISQC297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:39:28', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126314MC4S297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:41:22', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126314NAR1297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:41:54', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126314RPEE297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:44:20', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126314SAAG297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:44:37', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126314SG22297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:44:43', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126314TIQF297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:45:18', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1263158I0B297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:51:18', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1263158JU1297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:51:20', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126315AHKD297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-03 18:52:23', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126403GPHN297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:01:36', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126403H25K297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:01:45', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126403H46P297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:01:47', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126403JKGG297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:03:09', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126403JN9U297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:03:12', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1264054N5R297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:29:58', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1264054PEQ297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:30:00', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126405ARH9297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:33:19', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126405FGLN297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:35:51', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126405LDNM297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:39:05', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126405P1PA297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:41:04', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126405SJRF297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:43:01', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640604GT297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:44:56', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1264062B4V297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:46:08', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1264063ULV29700A', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:47:01', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1264065Q4Q29700B', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:48:02', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1264067TOE29700C', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:49:11', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126406A7B929700D', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:50:27', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126406J5LL29700E', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:55:20', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126406KMRS29700F', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:56:10', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126406LVCO29700G', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 09:56:52', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1264072EJ429700H', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 10:03:41', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640747UB29700I', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 10:04:39', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640793PP29700J', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 10:07:19', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126407A19129700K', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 10:07:49', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126407DMMB29700L', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 10:09:49', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126407KA6H29700M', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 10:13:26', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126407O7JT29700N', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 10:15:34', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126407TJAN29700O', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 10:18:30', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126407V5TF29700P', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 10:19:22', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1264080HI229700Q', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 10:20:07', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640AMC8J297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:06:59', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12640AMEAP297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:07:01', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640B500I297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:14:58', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12640B51RR297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:15:00', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640C6RHS297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:33:28', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12640C6THQ297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:33:30', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640CCG7U297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:36:33', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640CS37S297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:45:04', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640D366H297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:48:56', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640D475A297006', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:49:30', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12640D497T297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:49:32', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640D5H47297008', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:50:13', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12640D5J2P297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:50:15', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640D8GF529700A', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:51:51', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640DA9J629700B', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:52:49', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640DI94R29700C', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:57:11', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640DKD2Q29700D', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:58:20', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640DMAFK29700E', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:59:23', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640DN5NK29700F', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 11:59:51', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640DO51429700G', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 12:00:23', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640DOI0A29700H', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 12:00:36', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640DPUEL29700I', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 12:01:22', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640DQHNI29700J', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 12:01:42', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640DROQB29700K', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 12:02:22', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640DSDI429700L', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 12:02:43', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640DTM8C29700M', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 12:03:25', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640DUIHO29700N', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 12:03:54', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640E0KHS29700O', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 12:05:01', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640E22RA29700P', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 12:05:49', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640E3UO129700Q', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 12:06:50', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640E9L0V29700R', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 12:09:57', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640EBBTH29700S', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 12:10:53', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12640EI7I829700T', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 12:14:38', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126411SLQ6297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 17:52:23', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126411SOAB297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 17:52:25', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126412HQQS297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 18:03:56', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126412HUM6297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 18:04:00', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126412TQVR297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 18:10:30', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126413JHVK297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 18:22:21', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1264143EB5297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 18:31:02', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1264144BTF297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 18:31:32', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126414HRSK297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 18:38:54', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126414HTTV297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 18:38:56', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126414IA6O297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 18:39:09', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126414ILUV297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 18:39:21', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126414N9M829700E', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 18:41:52', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1264153LNK29700F', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 18:48:38', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1264157P26297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 18:50:52', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126415APKO297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 18:52:31', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126415DDP9297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 18:53:57', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126415H9QN297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 18:56:04', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126415JIQD297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 18:57:19', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126415MH96297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 18:58:56', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1264175OOP297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 19:24:44', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1264175RUD297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 19:24:47', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1264176M2O297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 19:25:14', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126417GS8R297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 19:30:48', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126417GU89297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 19:30:50', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126417HB4Q297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 19:31:03', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126417LFRH297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 19:33:19', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126417OFBI297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 19:34:57', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126417QSDO297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 19:36:16', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126417SQ1R297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 19:37:19', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1264187A6F297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 19:43:03', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12641ACGCC297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 20:20:50', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12641B0AKS29700G', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 20:31:40', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12641B0BHP29700H', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 20:31:41', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12641B7UFL29700I', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 20:35:49', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12641B8RSC29700J', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 20:36:19', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12641BL25K29700K', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-04 20:42:59', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12650R7VE4297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 15:56:13', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12650R81KK297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 15:56:15', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12650TI6FH297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 16:36:45', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12650TI9L4297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 16:36:48', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12650TN1P0297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 16:39:24', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12650TN4Q2297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 16:39:27', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12650TQUHE297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 16:41:32', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12650TR0FN297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 16:41:34', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12650U4OBF297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 16:46:53', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12650U4V49297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 16:47:00', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12650U54D1297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 16:47:06', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12650V3QTS297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 17:03:52', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12650V68MU297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 17:05:11', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12650VHLII297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 17:11:25', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12650VIUV6297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 17:12:07', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12650VOGH2297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 17:15:09', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1265103VR0297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 17:21:25', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126510F4R6297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 17:27:31', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126510I2VQ297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 17:29:07', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126511331C297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 17:38:24', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12651134U4297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 17:38:26', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126511MHOM297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 17:49:02', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126511OEUL297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 17:50:05', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126511SOLT297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 17:52:26', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126511STS6297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 17:52:31', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1265121281297001', '808953751040688128l', '126412TJCS297001', '172.26.232.254', '2018-06-05 17:54:47', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12651255TH297002', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 17:57:01', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12651257V6297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 17:57:04', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12651298EO297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 17:59:15', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126512DDI329700B', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-05 18:01:31', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12670F0C3S297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 12:22:21', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12670F0EKA297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 12:22:24', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12670F3HAL297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 12:24:05', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126712J7OI297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 18:04:42', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126712JA7E297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 18:04:45', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126714F3G9297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 18:37:24', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126714F5VA297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 18:37:26', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126716V7N7297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 19:21:10', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12671724RE297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 19:22:45', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1267175Q2S297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 19:24:45', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1267175RUC297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 19:24:47', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12671777B7297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 19:25:31', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126717E4V1297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 19:29:18', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1267192MPE297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 19:58:00', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1267196OQ8297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 20:00:14', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12671978RQ297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 20:00:30', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12671983PH29700A', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 20:00:58', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1267199CMG29700B', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 20:01:40', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1267199TNV29700C', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 20:01:57', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126719CE7I29700D', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 20:03:19', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126719N9R529700E', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 20:09:15', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126719O5T029700F', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-07 20:09:44', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126802BC2Q297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 08:41:10', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126802BE9F297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 08:41:12', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126804VD5M297003', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 09:27:04', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126804VFIA297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 09:27:06', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126805G47H297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 09:36:12', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126805JFE2297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 09:38:01', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126805N9R7297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 09:40:07', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126805OE7D297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 09:40:44', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126805PRT9297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 09:41:31', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126805QTGS297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 09:42:05', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126805QVO3297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 09:42:07', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126805SH26297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 09:42:58', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126805SJ7G297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 09:43:00', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126805UFNO297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 09:44:02', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126805UHLI297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 09:44:04', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126807DLLS297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 10:09:48', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126807V65R297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 10:19:22', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126807V8HV297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 10:19:25', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126807VFJK297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 10:19:32', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12680805F8297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 10:19:54', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1268081F4G297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 10:20:37', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12680827Q2297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 10:21:02', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1268083AQ1297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 10:21:38', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1268085HEI297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 10:22:50', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1268085L0U297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 10:22:54', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1268085LM129700A', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 10:22:55', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1268087SA029700B', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 10:24:07', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1268092I8F29700C', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 10:38:41', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1268092V1K29700D', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 10:38:55', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12680938AH29700E', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 10:39:04', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12680946FV29700F', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 10:39:35', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12680964S629700G', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 10:40:39', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12680DK8N1297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 11:58:16', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12680K202E297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 13:50:37', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12680LSP7I297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 14:22:43', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12680MHNSN297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 14:34:10', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12680UJ18O297002', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 16:54:41', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12680VS9N0297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 17:17:13', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126810DLBR297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 17:26:42', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126810NEQ6297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 17:32:03', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126810R70P297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 17:34:06', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1268111U3S297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 17:37:47', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126811537S297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 17:39:30', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126811VI1B297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 17:53:57', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126817V3VM297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 19:38:34', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1268182L1K297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 19:40:30', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1268184P0G297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 19:41:40', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1268184VA2297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 19:41:46', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126818CU5Q297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 19:46:07', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126818D4GL297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 19:46:14', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126818D62J297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 19:46:15', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126818D7H0297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 19:46:17', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126818OB9D297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 19:52:21', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126818ODAM297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-08 19:52:23', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126905BVJ3297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 09:33:56', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126905O549297001', '808953751040688128l', '126412TJCS297001', '172.26.232.254', '2018-06-09 09:40:35', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126905R91J297004', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 09:42:17', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1269060BA2297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 09:45:03', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126909B3HU297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 10:43:21', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126909CA8M297002', '808953751040688128l', '126412HL06297001', '172.26.232.254', '2018-06-09 10:44:01', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12690LKB3Q297001', '808953751040688128l', '126215B0C9297001', '172.26.232.254', '2018-06-09 14:18:07', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12690OCH8L297001', '808953751040688128l', '126215B0C9297001', '172.26.232.254', '2018-06-09 15:06:17', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12690PARDV297001', '808953751040688128l', '126215B0C9297001', '172.26.232.254', '2018-06-09 15:22:50', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12690QUUR8297001', '808953751040688128l', '126215B0C9297001', '172.26.232.254', '2018-06-09 15:51:18', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12690RCCVS297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 15:58:38', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12690RD0TT297002', '808953751040688128l', '126215B0C9297001', '172.26.232.254', '2018-06-09 15:58:58', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12690SMMUM297001', '808953751040688128l', '126215B0C9297001', '172.26.232.254', '2018-06-09 16:21:45', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126911AA8H297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 17:42:21', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126911AGJL297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 17:42:28', '/permission/menu/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126911JOOC297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 17:47:31', '/permission/menu/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126911JPTE297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 17:47:32', '/permission/menu/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126911K4AM297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 17:47:43', '/permission/menu/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126911O9N4297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 17:49:59', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('1269120Q7S29700O', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 17:54:38', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1269121BHG29700P', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 17:54:56', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1269121DGG29700Q', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 17:54:58', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126912408929700R', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 17:56:23', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12691246SN29700S', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 17:56:30', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126912489229700T', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 17:56:31', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126912BJKC297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 18:00:32', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126912BM24297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-09 18:00:35', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A0N9CVN297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 14:47:05', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126A0N9G0V297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 14:47:09', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A0NA1VF297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 14:47:27', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A0NA484297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 14:47:29', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A0O6D14297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 15:02:56', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126A0O6G1I297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 15:02:59', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A0O8GPL297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 15:04:05', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A0OLAT7297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 15:11:05', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A0RTBA5297002', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 16:07:53', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126A0RTDDJ297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 16:07:56', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A0S3BMM297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 16:11:10', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A0S584U297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 16:12:12', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A0ST6JR297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 16:25:17', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A0TB01J297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 16:32:49', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A0TB1BE297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 16:32:51', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A0TM5Q8297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 16:38:56', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A0TRAGJ29700A', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 16:41:44', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A0U1SQU29700B', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 16:45:20', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A0U2NAM29700C', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 16:45:47', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A0UCDA9297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 16:51:04', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126A0UCHCB297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 16:51:08', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A107EBF297003', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:23:19', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126A107HP6297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:23:22', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A10A66R297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:24:48', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A10CBBC297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:25:59', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A10DAIC297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:26:31', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A10G0P2297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:28:00', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A10IKB5297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:29:25', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A10S0UQ297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:34:33', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126A10S3G0297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:34:36', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A10TC4R297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:35:17', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A118E29297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:41:20', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126A118HF8297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:41:23', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A119I7C297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:41:57', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A11F5SQ297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:45:01', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126A11F9DJ297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:45:04', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A11I8B2297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:46:41', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A11K3UH297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:47:42', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A11TPOJ297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:53:00', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126A11TSS6297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:53:03', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A1239GL297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 17:56:00', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A12EAD9297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 18:02:01', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A12GTQA297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 18:03:26', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A12I50A297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 18:04:07', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A13S6HB297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 18:27:04', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126A13SA6N297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 18:27:08', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A13U10V297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 18:28:04', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A149RE4297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 18:34:32', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126A14A0PI297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 18:34:37', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A14MNCA297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 18:41:34', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126A14MQJB297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 18:41:37', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A14R0QK297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 18:43:54', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A14RNKS297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 18:44:18', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A14UNLS297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 18:45:56', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A15G29J297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 18:55:24', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A15IGJH297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 18:56:44', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A15J5FI297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 18:57:06', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A15MQOE297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 18:59:06', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A164DS829700A', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 19:06:31', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A1673JV29700B', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 19:07:59', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A167CNH29700C', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 19:08:08', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A16BVK329700D', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 19:10:39', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A1APA1H297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 20:27:50', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126A1APCVI297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 20:27:53', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A1B5JMR297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 20:34:33', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A1BGJRM297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 20:40:33', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A1BJG96297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 20:42:08', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126A1BNF0S297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 20:44:18', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126A1BNIPM297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-10 20:44:22', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0H732B297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 13:00:58', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B0H76OS297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 13:01:02', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0HAN0E297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 13:02:57', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0I0BIJ297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 13:14:46', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0I1DDQ297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 13:15:21', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0I65E1297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 13:17:57', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0I7HC5297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 13:18:42', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0LSAOE297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 14:22:29', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B0LSCSO297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 14:22:31', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0LTLES297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 14:23:12', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0MDENB297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 14:31:50', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0MMSGI297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 14:36:59', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0MPLO5297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 14:38:30', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0MQD6N297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 14:38:54', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0MS3Q0297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 14:39:50', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0MUAT4297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 14:41:03', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0MV4NA29700A', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 14:41:29', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0N0JOA29700B', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 14:42:17', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0N2D0S29700C', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 14:43:16', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0N44MO29700D', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 14:44:13', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0N4SNI29700E', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 14:44:38', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0NLFQU29700F', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 14:53:42', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0NM8KE29700G', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 14:54:07', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0R2IUR297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 15:53:17', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B0R2LC9297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 15:53:19', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0R3CI5297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 15:53:43', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0RB96D297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 15:58:01', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0RJM94297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 16:02:37', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0RL1QP297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 16:03:22', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0RUMBE297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 16:08:37', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B0RUP18297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 16:08:40', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0SAPRI297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 16:15:14', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0SCG4B297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 16:16:10', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0ULV8B297005', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 16:56:17', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B0UM2NG297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 16:56:21', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0UR74L297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 16:59:09', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0USM7D297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 16:59:58', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0USTQI297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:00:05', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0UTNAU29700A', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:00:31', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0UV6DQ29700B', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:01:20', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0V0TJU29700C', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:02:16', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B0VDDMS297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:09:06', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B0VDG1O297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:09:08', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B1085VM297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:23:43', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B10886A297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:23:45', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B10B1HR297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:25:16', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B10FJDN297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:27:46', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B10FM7J297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:27:49', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B10JNV1297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:30:02', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B10JQ35297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:30:04', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B10L900297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:30:52', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B11QPFS297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:51:21', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B11RKDQ297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:51:49', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B11TSFB297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:53:02', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B11UTM3297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:53:36', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B11V1HI297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:53:40', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B121KJ7297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:55:05', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B1274FB297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:58:06', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B127LT6297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:58:23', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B1280VD297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:58:35', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B128VB5297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:59:06', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B1291GL297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:59:08', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B129JO8297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 17:59:27', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B12MP34297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:06:38', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B12SM20297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:09:52', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B130L6T297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:12:02', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B136D6F297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:15:10', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B13927J297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:16:37', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B13AKGE297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:17:29', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B13DO1B297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:19:11', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B13EIEL297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:19:38', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B13FVV7297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:20:24', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B13H45K297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:21:01', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B13H6G0297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:21:04', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B13I7TI297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:21:38', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B13KGBS297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:22:52', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B13LI4D297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:23:27', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B13LK2G297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:23:29', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B144FL7297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:31:36', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B146D1H297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:32:39', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B149Q48297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:34:30', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B149S4E297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:34:32', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B14ADDP297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:34:50', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B14BERD297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:35:24', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B14BGVG297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:35:27', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B15L6O8297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:58:12', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B15M7KH297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:58:46', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B15NC6C297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 18:59:23', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B15PQMS297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:00:44', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B15SKGU297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:02:16', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B15VNN7297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:03:57', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B16UL5R297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:20:51', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B16UNTB297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:20:53', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B170D9H297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:21:48', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B171B3I297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:22:19', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B178M5A297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:26:19', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B17CD43297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:28:21', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B17FMR7297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:30:09', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B17G8R4297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:30:28', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B17GAA4297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:30:29', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B17IEIH297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:31:39', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B17II00297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:31:43', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B17LULV297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:33:34', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B17OKLS297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:35:02', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B17PBIT297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:35:26', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B17PRAO297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:35:42', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B17QVA0297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:36:18', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B189SS0297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:44:28', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B189V88297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:44:30', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B18KNL5297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:50:23', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B191P4G297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:57:30', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B191RGT297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 19:57:33', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B196SK2297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 20:00:18', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B198QRB297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 20:01:21', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B19J4OM297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 20:06:59', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B19UK9E297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 20:13:15', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B1A019U297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 20:14:02', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B1A829A297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 20:18:25', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B1BBNV0297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 20:37:54', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126B1BBQ3V297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 20:37:56', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B1BE6CT297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 20:39:14', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B1C1J1S297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 20:49:50', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B1C3C44297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 20:50:48', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126B1C3L0Q297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-11 20:50:57', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126C0JAMR6297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-12 13:37:54', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126C0JAUMQ297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-12 13:38:02', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126C0N3KCE297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-12 14:43:56', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126C0N3QUK297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-12 14:44:03', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126C1BOFSR297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-12 20:44:51', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126C1BOQD4297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-12 20:45:02', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D0J3GJ0297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 13:33:58', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126D0J3J2A297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 13:34:01', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D0JARUS297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 13:37:59', '/permission/menu/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D0JFJC5297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 13:40:34', '/permission/menu/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D0JMVTK297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 13:44:37', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126D0JN718297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 13:44:44', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D0JNVH2297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 13:45:09', '/permission/menu/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D0JOPIC297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 13:45:36', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D0JTGCU297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 13:48:10', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D0JUREM297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 13:48:54', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D0JVQD0297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 13:49:26', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D0K0B18297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 13:49:43', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D0K0JL729700A', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 13:49:52', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D10GVJM297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 17:28:31', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126D10H2G3297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 17:28:34', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D12TVC1297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 18:10:34', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126D12U6I1297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 18:10:41', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D13BOH3297003', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 18:18:06', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126D13BRPU297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 18:18:09', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D13H9BM297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 18:21:07', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D1555JO297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 18:49:27', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D15F59H297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 18:54:54', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D166UKQ297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:07:54', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126D16735O297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:07:59', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D16AH2F297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:09:51', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D16HDP0297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:13:37', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126D16HFTF297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:13:39', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D16KE44297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:15:16', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126D16KG64297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:15:18', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D16QBKR297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:18:30', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126D16QDQ1297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:18:32', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D16VEUA297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:21:17', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126D16VH4O297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:21:19', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D173U85297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:23:44', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126D1741FH297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:23:47', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D179NK4297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:26:54', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126D179PUF297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:26:56', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D18M7IJ297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:51:12', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D18PEHQ297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:52:57', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126D18PGU1297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:53:00', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D18TBIU297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:55:05', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D191EDJ297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:57:19', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126D191GGQ297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 19:57:21', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D196BLC297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 20:00:00', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D19896F297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 20:01:03', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D199RKH297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 20:01:55', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D19BALU297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 20:02:43', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D19C1T9297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 20:03:07', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D19CLT6297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 20:03:27', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126D19I40P297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-13 20:06:26', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126E0V14L8297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-14 17:02:23', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126E0V2OA7297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-14 17:03:16', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126E0V80DJ297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-14 17:06:08', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126E0VSDVF297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-14 17:17:18', '/permission/menu/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126E1047PS297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-14 17:21:34', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126E11TOVK297008', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-14 17:52:59', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126E1AKU6V297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-14 20:25:26', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126E1APB15297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-14 20:27:51', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126E1AU4BQ297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-14 20:30:28', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126E1IND01297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-14 22:46:36', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126E1ITJIA297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-14 22:49:59', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126E1JM8ML297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-14 23:03:27', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126E1JNOEK297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-14 23:04:16', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126E1JR1D4297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-14 23:06:04', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126E1JSN54297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-14 23:06:59', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126E1JT3TG297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-14 23:07:12', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F02RUUR297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 08:50:14', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F037RG5297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 08:56:43', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F03M6V0297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 09:04:34', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F03MTH2297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 09:04:57', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F03SQ4S297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 09:08:10', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F0M6A7M297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 14:27:56', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F0MCFK6297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 14:31:18', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F0MGRGM297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 14:33:41', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F0OMMO1297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 15:11:50', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F0OOVQS297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 15:13:05', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F0PR0UK297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 15:31:40', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F0QFSEL297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 15:43:04', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F0RNOIO297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 16:04:50', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F0TN7QN297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 16:39:30', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F0TNIB7297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 16:39:41', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F0TNJF2297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 16:39:42', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F0TNKR9297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 16:39:44', '/permission/role/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F0TU3OR297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 16:43:16', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F0U6CEO297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 16:47:47', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F0U927U297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 16:49:14', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F0UBRKL297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 16:50:46', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F0UKTS4297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 16:55:43', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F0V5NBE297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:04:54', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F0V5Q7K297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:04:57', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F0VAAOJ297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:07:25', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F0VBO3P297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:08:11', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F0VD6FB297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:08:58', '/dept/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F0VDC9K297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:09:04', '/job/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F0VDEN9297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:09:07', '/log/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F0VDGND297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:09:09', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F0VV2GD297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:18:44', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F101HCL297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:20:05', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F101JD6297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:20:07', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F10S1G0297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:34:33', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F112AOJ297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:38:00', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F112DDS297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:38:02', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F1170ES297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:40:33', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F1173LC297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:40:36', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F11B8ED297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:42:52', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F11BAK1297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:42:54', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F11DDRF297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:44:03', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F11DFU1297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:44:05', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F11PHR3297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:50:40', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F11RP6P297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 17:51:54', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F158AM7297005', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 18:51:10', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F158PNU297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 18:51:26', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F15ALLD297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 18:52:27', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F15GKPI297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 18:55:43', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F15J49L297002', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 18:57:04', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F15S04C297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 19:01:55', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F15SBE5297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 19:02:07', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F15SDTF297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 19:02:09', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F15TUQB297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 19:02:59', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F16396S297007', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 19:05:54', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F163D6M297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-15 19:05:58', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F184FN6297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-15 19:41:30', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126F184IEQ297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-15 19:41:33', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F194D89297001', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-15 19:58:56', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F19EJU2297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-15 20:04:31', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F19H0LI297003', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-15 20:05:49', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F19HFLK297004', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-15 20:06:05', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126F19JFB9297005', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-15 20:07:10', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G04B2OU297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:15:58', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126G04FCGG297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:18:19', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126G04FLO0297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:18:28', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G04G8TL297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:18:48', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G04LUP3297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:21:54', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126G04M25M297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:21:57', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G04O875297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:23:09', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G04P69I297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:23:40', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G04PE9R297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:23:48', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G04SKG9297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:25:33', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G05ALFS297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:33:13', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G05HE0J297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:36:54', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G05UUF7297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:44:17', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G06I6A0297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:54:48', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126G06IA9V297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:54:52', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G06ILH7297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:55:03', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G06NGB2297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:57:42', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G06QN3K297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:59:27', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G06RB2S297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:59:48', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G06RCT4297007', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:59:49', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G06REV6297008', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:59:52', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G06RGNQ297009', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:59:53', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G06RJ3329700A', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 09:59:56', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G072HNL297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 10:03:44', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126G072KU0297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 10:03:47', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G07GEST297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 10:11:20', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126G07GHL0297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 10:11:22', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G07JO96297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 10:13:07', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G08C3P6297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 10:26:26', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G08MD6N297005', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 10:32:03', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G09VBV8297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 10:54:25', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126G09VEAL297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 10:54:28', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G0A1USO297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 10:55:50', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G0A6FGL297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 10:58:18', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G0AB5UO297001', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 11:00:52', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G0AE4CN297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-16 11:02:29', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G0S59GD297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-16 16:12:14', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126G0S5C3S297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-16 16:12:16', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126G14F6HK297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-06-16 18:37:27', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126G14F9GN297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-06-16 18:37:30', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126I145D9R297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-18 18:32:06', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126I145H01297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-18 18:32:10', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126I159AEV297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-18 18:51:43', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126I15BORV297004', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-18 18:53:03', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126I15GO4P297005', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-18 18:55:46', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126I15GQAI297006', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-18 18:55:49', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126I18BPKQ297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-18 19:45:30', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('126I18BS0D297002', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-18 19:45:32', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126I18BUA8297003', '808953871287189504l', '12370I6SDEA93003', '172.26.232.254', '2018-06-18 19:45:35', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('126J1D2QKC297001', '808953751040688128l', '12370I6SDEA93003', '172.26.232.254', '2018-06-19 21:07:59', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12780MB8RL297001', '808953871287189504l', '12370I6SDEA93003', '192.168.1.111', '2018-07-08 14:30:38', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12780S6LRQ297001', '808953751040688128l', '12370I6SDEA93003', '192.168.1.111', '2018-07-08 16:12:59', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12780TCH44297002', '808953871287189504l', '12370I6SDEA93003', '192.168.1.111', '2018-07-08 16:33:39', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12780UB5PE297001', '808953751040688128l', '12370I6SDEA93003', '192.168.1.111', '2018-07-08 16:50:24', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('127810N4OG297002', '808953751040688128l', '12370I6SDEA93003', '192.168.1.111', '2018-07-08 17:31:53', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('127813UNOL297001', '808953751040688128l', '12370I6SDEA93003', '192.168.1.111', '2018-07-08 18:28:28', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('127814O6IM297001', '808953871287189504l', '12370I6SDEA93003', '192.168.1.111', '2018-07-08 18:42:22', '/emp/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('127816QLK3FDF001', '808953751040688128l', '12370I6SDEA93003', '172.16.125.228', '2018-07-08 19:18:40', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('1278177DO2FDF002', '808953871287189504l', '12370I6SDEA93003', '172.16.125.228', '2018-07-08 19:25:38', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12781BK4A3FDF003', '808953751040688128l', '12370I6SDEA93003', '172.16.125.228', '2018-07-08 20:42:29', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12781BKOBRFDF004', '808953871287189504l', '12370I6SDEA93003', '172.16.125.228', '2018-07-08 20:42:49', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12781BL85GFDF005', '808953871287189504l', '12370I6SDEA93003', '172.16.125.228', '2018-07-08 20:43:05', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12781BLKRJFDF006', '808953871287189504l', '12370I6SDEA93003', '172.16.125.228', '2018-07-08 20:43:18', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12781BNDP0FDF007', '808953871287189504l', '12370I6SDEA93003', '172.16.125.228', '2018-07-08 20:44:17', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12781BO05BFDF008', '808953871287189504l', '12370I6SDEA93003', '172.16.125.228', '2018-07-08 20:44:35', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12781G0VEIFDF009', '808953751040688128l', '12370I6SDEA93003', '172.16.125.228', '2018-07-08 21:59:24', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12781G3GECFDF00A', '808953871287189504l', '12370I6SDEA93003', '172.16.125.228', '2018-07-08 22:00:47', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12781G651CFDF00B', '808953871287189504l', '12370I6SDEA93003', '172.16.125.228', '2018-07-08 22:02:13', '/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12781G69G2FDF00C', '808953871287189504l', '12370I6SDEA93003', '172.16.125.228', '2018-07-08 22:02:18', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12781MBAVPFDF00D', '808953751040688128l', '12370I6SDEA93003', '172.16.125.228', '2018-07-08 23:49:55', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12781MIGRHFDF00E', '808953751040688128l', '12370I6SDEA93003', '172.16.125.228', '2018-07-08 23:53:50', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12781MIPI2FDF00F', '808953871287189504l', '12370I6SDEA93003', '172.16.125.228', '2018-07-08 23:53:59', '/permission/grant/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12781ML3A1FDF00G', '808953871287189504l', '12370I6SDEA93003', '172.16.125.228', '2018-07-08 23:55:15', '/attend/page', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12790G2FMG297001', '808953751040688128l', '12370I6SDEA93003', '192.168.43.201', '2018-07-09 12:40:59', '/loginIn', '0', 1, '登录日志');
INSERT INTO `t_log` VALUES ('12790G2R29297002', '808953871287189504l', '12370I6SDEA93003', '192.168.43.201', '2018-07-09 12:41:10', '/permission/user/page.html', '0', 1, '操作日志');
INSERT INTO `t_log` VALUES ('12790UD2PFFDF01D', '808953751040688128l', '12370I6SDEA93003', '172.16.125.228', '2018-07-09 16:51:26', '/loginIn', '0', 1, '登录日志');

-- ----------------------------
-- Table structure for t_log_type
-- ----------------------------
DROP TABLE IF EXISTS `t_log_type`;
CREATE TABLE `t_log_type`  (
  `LOG_TYPE_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志类型编号',
  `TYPE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志类型名称',
  `STATUS` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '状态',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`LOG_TYPE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_log_type
-- ----------------------------
INSERT INTO `t_log_type` VALUES ('808953751040688128l', '登录日志', '1', '记录登录日志');
INSERT INTO `t_log_type` VALUES ('808953871287189504l', '操作日志', '1', '记录操作日志');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `MENU_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单编号',
  `MENU_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名字',
  `PARENT_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单父级编号',
  `MENU_URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单链接地址',
  `MENU_ICON` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单图标',
  `MENU_INDEX` int(11) NOT NULL DEFAULT 1 COMMENT '菜单显示顺序',
  `PERMISSION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单权限',
  `STATUS` int(11) NOT NULL DEFAULT 1 COMMENT '状态',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`MENU_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('126911FCGU297001', '个人考勤信息', '809280468385005568', '/attend/page', '', 2, 'attend:page', 1, '个人考勤信息展示页面');
INSERT INTO `t_menu` VALUES ('126D0JG6NU297005', '考勤管理', '', '', '**', 7, '', 1, '考勤管理');
INSERT INTO `t_menu` VALUES ('126D0JKRKD297006', '考勤信息', '126D0JG6NU297005', '/system/attend/page', '', 1, 'system:attend:page', 1, '系统所有人员的考勤信息');
INSERT INTO `t_menu` VALUES ('126E103QLR297005', '补签管理', '126D0JG6NU297005', '/system/attend/reAttend', '', 2, 'system:attend:reAttend', 1, '补签页面');
INSERT INTO `t_menu` VALUES ('809280468385005568', '用户管理', NULL, '', '**', 1, '', 1, '用户管理');
INSERT INTO `t_menu` VALUES ('809290438698598400', '员工管理', NULL, '', '**', 6, NULL, 1, '员工管理');
INSERT INTO `t_menu` VALUES ('809290653677649920', '部门管理', NULL, NULL, '序', 3, NULL, 1, '部门管理');
INSERT INTO `t_menu` VALUES ('809290798087536640', '职位管理', NULL, NULL, '人', 4, NULL, 1, '职位管理');
INSERT INTO `t_menu` VALUES ('809290899161874432', '日志管理', NULL, NULL, '生', 5, NULL, 1, '日志管理');
INSERT INTO `t_menu` VALUES ('809291013486018560', '权限管理', NULL, NULL, '程', 2, NULL, 1, '权限管理');
INSERT INTO `t_menu` VALUES ('809310811968241664', '用户信息', '809291013486018560', 'permission/user/page.html', NULL, 2, 'permission:user:page', 1, '权限管理之用户');
INSERT INTO `t_menu` VALUES ('809339761310302208', '角色信息', '809291013486018560', 'permission/role/page.html', NULL, 3, 'permission:role:page', 1, '权限管理之角色');
INSERT INTO `t_menu` VALUES ('809340358776324096', '菜单信息', '809291013486018560', 'permission/menu/page.html', NULL, 4, 'permission:menu:page', 1, '权限管理之菜单');
INSERT INTO `t_menu` VALUES ('809748590816657408', '日志信息', '809290899161874432', 'log/page.html', NULL, 1, 'log:page', 1, '日志管理之日志信息');
INSERT INTO `t_menu` VALUES ('810016051986169856', '授权信息', '809291013486018560', 'permission/grant/page.html', NULL, 1, 'permission:grant:page', 1, '权限管理之授权信息');
INSERT INTO `t_menu` VALUES ('811552189750181888', '个人信息', '809280468385005568', '/user/page.html', NULL, 1, 'user:page', 1, '用户管理之个人信息');
INSERT INTO `t_menu` VALUES ('811869909595193344', '员工信息', '809290438698598400', '/emp/page.html', NULL, 1, 'emp:page', 1, '员工管理之员工信息');
INSERT INTO `t_menu` VALUES ('812261363291258880', '职位信息', '809290798087536640', '/job/page.html', NULL, 1, 'job:page', 1, '职位管理之职位信息');
INSERT INTO `t_menu` VALUES ('814354495977816064', '部门信息', '809290653677649920', '/dept/page.html', NULL, 1, 'dept:page', 1, '部门管理之部门信息');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `NOTICE_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告编号',
  `NOTICE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `CONTENT` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告内容',
  `CREATE_TIME` datetime(0) NOT NULL COMMENT '公告发布时间',
  `USER_ID` int(11) DEFAULT NULL COMMENT '公告发布人 可以匿名发布',
  PRIMARY KEY (`NOTICE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `ROLE_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编号',
  `ROLE_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `CREATE_TIME` datetime(0) DEFAULT NULL,
  `UPDATE_TIME` datetime(0) DEFAULT NULL,
  `STATUS` int(11) NOT NULL DEFAULT 1 COMMENT '状态',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `FLAG` int(4) NOT NULL DEFAULT 1 COMMENT '系统管理员-0 普通管理员-1',
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('126304SL3U29700A', '普通员工', '2018-06-03 09:25:33', NULL, 1, '可以登录系统查看个人信息以及打卡操作', 1);
INSERT INTO `t_role` VALUES ('126D0JVM13297007', '考勤管理员', '2018-06-13 13:49:21', '2018-06-13 13:49:48', 1, '管理系统所有人的考勤', 1);
INSERT INTO `t_role` VALUES ('809281289969467392', '系统管理员', '2018-01-23 11:22:16', '2018-05-27 23:27:25', 1, '系统最高权限角色', 0);
INSERT INTO `t_role` VALUES ('809694250722656256', '权限管理员', '2018-01-29 18:22:13', '2018-06-03 09:26:32', 1, '动态为管理员用户分配权限', 1);
INSERT INTO `t_role` VALUES ('809697588000325632', '日志管理员', '2018-02-22 13:22:19', '2018-06-03 09:26:54', 1, '拥有查看系统日志方面的权限', 1);
INSERT INTO `t_role` VALUES ('811102268043558912', '部门管理员', '2018-02-24 00:00:00', '2018-06-03 09:27:12', 1, '对部门信息进行管理', 1);
INSERT INTO `t_role` VALUES ('812176318056628224', '职位管理员', '2018-03-11 15:41:22', '2018-06-03 09:27:24', 1, '对职位信息进行管理', 1);
INSERT INTO `t_role` VALUES ('812253732514299904', '员工管理员', '2018-04-12 19:44:32', '2018-06-03 09:27:40', 1, '对员工的信息进行管理', 1);

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `ROLE_MENU_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色菜单编号',
  `ROLE_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编号',
  `MENU_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单编号',
  `STATUS` int(11) NOT NULL DEFAULT 1 COMMENT '状态',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ROLE_MENU_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('126911P3UD297006', '126304SL3U29700A', '809280468385005568', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126911PGTO297007', '126304SL3U29700A', '811552189750181888', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126911PIE6297008', '126304SL3U29700A', '126911FCGU297001', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126911POOV297009', '812253732514299904', '809280468385005568', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126911POP829700A', '812253732514299904', '811552189750181888', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126911PQCJ29700B', '812253732514299904', '126911FCGU297001', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126911PV4F29700C', '812176318056628224', '809280468385005568', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126911PV4O29700D', '812176318056628224', '811552189750181888', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126911Q0H629700E', '812176318056628224', '126911FCGU297001', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126911Q4NA29700F', '811102268043558912', '809280468385005568', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126911Q4NL29700G', '811102268043558912', '811552189750181888', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126911Q5VV29700H', '811102268043558912', '126911FCGU297001', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126911QALN29700I', '809697588000325632', '809280468385005568', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126911QAM029700J', '809697588000325632', '811552189750181888', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126911QBLF29700K', '809697588000325632', '126911FCGU297001', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126911QG8N29700L', '809694250722656256', '809280468385005568', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126911QG9229700M', '809694250722656256', '811552189750181888', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126911QH2B29700N', '809694250722656256', '126911FCGU297001', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126911S7LR297001', '809281289969467392', '126911FCGU297001', 1, '系统-个人考勤');
INSERT INTO `t_role_menu` VALUES ('126D0JQ8B4297001', '809281289969467392', '126D0JG6NU297005', 1, '系统-考勤管理');
INSERT INTO `t_role_menu` VALUES ('126D0JRV5C297001', '809281289969467392', '126D0JKRKD297006', 1, '系统-考勤信息');
INSERT INTO `t_role_menu` VALUES ('126D0K0S5J29700C', '126D0JVM13297007', '126D0JG6NU297005', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126D0K0S5S29700D', '126D0JVM13297007', '126D0JKRKD297006', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126D0K1DOQ29700E', '126D0JVM13297007', '809280468385005568', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126D0K1DP229700F', '126D0JVM13297007', '126911FCGU297001', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126D0K1ECA29700G', '126D0JVM13297007', '811552189750181888', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126E104FCA297007', '126D0JVM13297007', '126E103QLR297005', 1, NULL);
INSERT INTO `t_role_menu` VALUES ('126E11S4U5297001', '809281289969467392', '126E103QLR297005', 1, '系统-补签信息');
INSERT INTO `t_role_menu` VALUES ('809281508635312128', '809281289969467392', '809280468385005568', 1, '系统-用户管理');
INSERT INTO `t_role_menu` VALUES ('809291906839216128', '809281289969467392', '809290653677649920', 1, '系统-部门管理');
INSERT INTO `t_role_menu` VALUES ('809291963013529600', '809281289969467392', '809290438698598400', 1, '系统-员工管理');
INSERT INTO `t_role_menu` VALUES ('809292013118685184', '809281289969467392', '809290798087536640', 1, '系统-职位管理');
INSERT INTO `t_role_menu` VALUES ('809292113442242560', '809281289969467392', '809290899161874432', 1, '系统-日志管理');
INSERT INTO `t_role_menu` VALUES ('809292224901677056', '809281289969467392', '809291013486018560', 1, '系统-权限管理');
INSERT INTO `t_role_menu` VALUES ('809315775092359168', '809281289969467392', '809310811968241664', 1, '系统-用户信息');
INSERT INTO `t_role_menu` VALUES ('809340141129695232', '809281289969467392', '809339761310302208', 1, '系统-角色信息');
INSERT INTO `t_role_menu` VALUES ('809340291877175296', '809281289969467392', '809340358776324096', 1, '系统-菜单信息');
INSERT INTO `t_role_menu` VALUES ('810016254478778368', '809281289969467392', '810016051986169856', 1, '系统-授权信息');
INSERT INTO `t_role_menu` VALUES ('811116388876812288', '809281289969467392', '809748590816657408', 1, '系统-日志信息');
INSERT INTO `t_role_menu` VALUES ('811567672683659264', '809281289969467392', '811552189750181888', 1, '系统-个人信息');
INSERT INTO `t_role_menu` VALUES ('811777415985496064', '812176318056628224', '812261363291258880', 1, '职位-职位管理');
INSERT INTO `t_role_menu` VALUES ('811801292321062912', '812176318056628224', '809290798087536640', 1, '职位-职位信息');
INSERT INTO `t_role_menu` VALUES ('811807377429889024', '809694250722656256', '809291013486018560', 1, '权限-权限管理');
INSERT INTO `t_role_menu` VALUES ('811807392994951168', '809694250722656256', '809310811968241664', 1, '权限-用户信息');
INSERT INTO `t_role_menu` VALUES ('811807399328350208', '809694250722656256', '809339761310302208', 1, '权限-角色信息');
INSERT INTO `t_role_menu` VALUES ('811807403283578880', '809694250722656256', '809340358776324096', 1, '权限-菜单信息');
INSERT INTO `t_role_menu` VALUES ('811807407616294912', '809694250722656256', '810016051986169856', 1, '权限-授权信息');
INSERT INTO `t_role_menu` VALUES ('811807690580819968', '809697588000325632', '809290899161874432', 1, '日志-日志管理');
INSERT INTO `t_role_menu` VALUES ('811807690618568704', '809697588000325632', '809748590816657408', 1, '日志-日志信息');
INSERT INTO `t_role_menu` VALUES ('811869980457959424', '809281289969467392', '811869909595193344', 1, '系统-员工信息');
INSERT INTO `t_role_menu` VALUES ('812258982411370496', '811102268043558912', '809290653677649920', 1, '部门-部门管理');
INSERT INTO `t_role_menu` VALUES ('812289330667061248', '809281289969467392', '812261363291258880', 1, '系统-职位信息');
INSERT INTO `t_role_menu` VALUES ('814411293283844096', '809281289969467392', '814354495977816064', 1, '系统-部门信息');
INSERT INTO `t_role_menu` VALUES ('814720285625286656', '811102268043558912', '814354495977816064', 1, '部门-部门信息');
INSERT INTO `t_role_menu` VALUES ('814726566918488064', '812253732514299904', '809290438698598400', 1, '员工-员工管理');
INSERT INTO `t_role_menu` VALUES ('814726577056120832', '812253732514299904', '811869909595193344', 1, '员工-员工信息');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `USER_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户uuid',
  `USER_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `USER_PASSWORD` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `STATUS` int(4) NOT NULL DEFAULT 1 COMMENT '管理员状态 0-注销 1-正常',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('12370I6SDEA93003', 'admin', '0192023a7bbd73250516f069df18b500', 1);
INSERT INTO `t_user` VALUES ('12620S8LBN297003', 'Jeremy', 'e10adc3949ba59abbe56e057f20f883e', 1);
INSERT INTO `t_user` VALUES ('1262112UC6297001', 'shell', 'e10adc3949ba59abbe56e057f20f883e', 1);
INSERT INTO `t_user` VALUES ('126215B0C9297001', 'Sunny', 'e10adc3949ba59abbe56e057f20f883e', 1);
INSERT INTO `t_user` VALUES ('126219LAHB29700I', 'Abbott ', 'e10adc3949ba59abbe56e057f20f883e', 1);
INSERT INTO `t_user` VALUES ('126313QSC9297006', 'jackson', 'e10adc3949ba59abbe56e057f20f883e', 0);
INSERT INTO `t_user` VALUES ('126412HL06297001', 'Abby', 'e10adc3949ba59abbe56e057f20f883e', 1);
INSERT INTO `t_user` VALUES ('126412TJCS297001', 'Alisa', 'e10adc3949ba59abbe56e057f20f883e', 1);
INSERT INTO `t_user` VALUES ('12641AEUQH29700A', 'Fern ', 'e10adc3949ba59abbe56e057f20f883e', 0);
INSERT INTO `t_user` VALUES ('12641B06MG29700D', 'Alexande', 'e10adc3949ba59abbe56e057f20f883e', 0);
INSERT INTO `t_user` VALUES ('12650RH1VV297003', '杨朝来', 'e10adc3949ba59abbe56e057f20f883e', 0);
INSERT INTO `t_user` VALUES ('12650RJ9IQ297006', '赵小雪', 'e10adc3949ba59abbe56e057f20f883e', 0);
INSERT INTO `t_user` VALUES ('1265128THC297004', '丁建伟', 'e10adc3949ba59abbe56e057f20f883e', 0);
INSERT INTO `t_user` VALUES ('126512CTQC297008', '凡小芬', 'e10adc3949ba59abbe56e057f20f883e', 0);
INSERT INTO `t_user` VALUES ('126512LJAQ29700C', '文彭凤', 'e10adc3949ba59abbe56e057f20f883e', 0);

-- ----------------------------
-- Table structure for t_user_attend
-- ----------------------------
DROP TABLE IF EXISTS `t_user_attend`;
CREATE TABLE `t_user_attend`  (
  `USER_ATTEND_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户-考勤关联表ID',
  `USER_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `ATTEND_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考勤数据ID',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户-考勤关联信息备注',
  PRIMARY KEY (`USER_ATTEND_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_attend
-- ----------------------------
INSERT INTO `t_user_attend` VALUES ('126B0L3J4J297001', '12370I6SDEA93003', '126B0JCNEC297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L3SQC297001', '12370I6SDEA93003', '126B0JHR0S297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L433V297001', '12370I6SDEA93003', '126B0JJLD6297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L4B5B297001', '12370I6SDEA93003', '126B0JLK5E297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L4I0L297001', '12370I6SDEA93003', '126B0JO24S297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L4PMU297001', '12370I6SDEA93003', '126B0JQB3E297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L532G297001', '12370I6SDEA93003', '126B0JQVHA297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L59VA297001', '12370I6SDEA93003', '126B0JT60G297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L5HUD297001', '12370I6SDEA93003', '126B0JVNVM297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L5R49297001', '12370I6SDEA93003', '126B0K1EM3297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L61T3297001', '12370I6SDEA93003', '126B0K352J297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L68GR297001', '12370I6SDEA93003', '126B0K61QC297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L6G7K297001', '12370I6SDEA93003', '126B0K6II3297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L6MT5297001', '12370I6SDEA93003', '126B0K770E297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L6TJP297001', '12370I6SDEA93003', '126B0K8VT3297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L747S297001', '12370I6SDEA93003', '126B0KAKPS297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L7ARM297001', '12370I6SDEA93003', '126B0KEVQ7297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L7I6N297001', '12370I6SDEA93003', '126B0KGJJF297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L7PTO297001', '12370I6SDEA93003', '126B0KI8H7297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L820R297001', '12370I6SDEA93003', '126B0KJ0N9297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L89HE297001', '12370I6SDEA93003', '126B0KJK8G297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L8G68297001', '12370I6SDEA93003', '126B0KLJ3E297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L8O4D297001', '12370I6SDEA93003', '126B0KN5L6297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L8UPR297001', '12370I6SDEA93003', '126B0KOIME297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L969E297001', '12370I6SDEA93003', '126B0KQ5PA297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L9E37297001', '12370I6SDEA93003', '126B0KRMMF297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L9KJ6297001', '12370I6SDEA93003', '126B0KSDP7297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0L9RIK297001', '12370I6SDEA93003', '126B0KSUV2297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0LA2KD297001', '12370I6SDEA93003', '126B0KUB4Q297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0LAB9A297001', '12370I6SDEA93003', '126B0KVO40297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B0LAIP6297001', '12370I6SDEA93003', '126B0L18J8297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B1B4CBL297001', '12370I6SDEA93003', '126B1AKSQE297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B1B4LST297001', '12370I6SDEA93003', '126B1AOD8R297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B1B4S2M297001', '12370I6SDEA93003', '126B1AOU2C297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B1B538H297001', '12370I6SDEA93003', '126B1APHGD297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B1B5AEG297001', '12370I6SDEA93003', '126B1ARHKS297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B1B5IM8297001', '12370I6SDEA93003', '126B1ASPCB297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B1B5SMJ297001', '12370I6SDEA93003', '126B1AU3JP297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B1B644M297001', '12370I6SDEA93003', '126B1AVP4I297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B1B6DMK297001', '12370I6SDEA93003', '126B1B1IMQ297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B1B6KE9297001', '12370I6SDEA93003', '126B1B23DL297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126B1B6R15297001', '12370I6SDEA93003', '126B1B2LN2297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126C0N2CB2297001', '12370I6SDEA93003', '126C0N12G4297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126D0J87VE297001', '12370I6SDEA93003', '126D0J6KAS297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126E1JRKBM297001', '12370I6SDEA93003', '126E1JP0M7297001', 'admin-attend关系数据');
INSERT INTO `t_user_attend` VALUES ('126F03MJ0F297002', '12370I6SDEA93003', '126F03MKQ3297003', 'admin-2018-06-15打卡记录');
INSERT INTO `t_user_attend` VALUES ('126G04G3V6297003', '12370I6SDEA93003', '126G04G3V6297004', 'admin-2018-06-16打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771ES466297001', '12370I6SDEA93003', '12771EKDQP297001', 'admin-2018-06-17打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771EU486297001', '12370I6SDEA93003', '12771EPIMF297001', 'admin-2018-06-18打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771FULEF297001', '12370I6SDEA93003', '12771EVJ5A297001', 'admin-2018-06-19打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771FVLQN297001', '12370I6SDEA93003', '12771F25OV297001', 'admin-2018-06-20打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771G0OTT297001', '12370I6SDEA93003', '12771F3P0I297001', 'admin-2018-06-21打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771G1LVC297001', '12370I6SDEA93003', '12771F53AH297001', 'admin-2018-06-22打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771G2IK5297001', '12370I6SDEA93003', '12771F6RNG297001', 'admin-2018-06-23打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771G3M5J297001', '12370I6SDEA93003', '12771F7INR297001', 'admin-2018-06-24打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771G4RR1297001', '12370I6SDEA93003', '12771F86L0297001', 'admin-2018-06-25打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771G5TE6297001', '12370I6SDEA93003', '12771FBS9H297001', 'admin-2018-06-26打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771G6P0D297001', '12370I6SDEA93003', '12771FD74J297001', 'admin-2018-06-27打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771G7LPT297001', '12370I6SDEA93003', '12771FF1D4297001', 'admin-2018-06-28打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771G8I3J297001', '12370I6SDEA93003', '12771FGKPV297001', 'admin-2018-06-29打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771G9OH0297001', '12370I6SDEA93003', '12771FI81O297001', 'admin-2018-06-30打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771GBA2J297001', '12370I6SDEA93003', '12771FIRMF297001', 'admin-2018-07-01打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771GCDQJ297001', '12370I6SDEA93003', '12771FJKSU297001', 'admin-2018-07-02打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771GE834297001', '12370I6SDEA93003', '12771FL61B297001', 'admin-2018-07-03打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771GF6OF297001', '12370I6SDEA93003', '12771FMVT1297001', 'admin-2018-07-04打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771GG434297001', '12370I6SDEA93003', '12771FOIDH297001', 'admin-2018-07-05打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771GH39U297001', '12370I6SDEA93003', '12771FQ75K297001', 'admin-2018-07-06打卡记录');
INSERT INTO `t_user_attend` VALUES ('12771GHTMN297001', '12370I6SDEA93003', '12771FRFJ7297001', 'admin-2018-07-07打卡记录');
INSERT INTO `t_user_attend` VALUES ('1278174693297001', '12370I6SDEA93003', '1278171OUH297001', 'admin-2018-07-08打卡记录');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `USER_ROLE_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户角色表主键uuid',
  `USER_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户uuid',
  `ROLE_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色uuid',
  `STATUS` int(11) NOT NULL DEFAULT 1 COMMENT '状态',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`USER_ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('12370I7QDMA93005', '12370I6SDEA93003', '809281289969467392', 1, NULL);
INSERT INTO `t_user_role` VALUES ('12370J3L2OA9300E', '12370J383KA9300C', '811102268043558912', 1, NULL);
INSERT INTO `t_user_role` VALUES ('12370K0SNCA9300I', '12370J9TQVA9300G', '812176318056628224', 1, NULL);
INSERT INTO `t_user_role` VALUES ('12370KKTJIA9300U', '12370KKGQOA9300S', '809697588000325632', 1, NULL);
INSERT INTO `t_user_role` VALUES ('12370LVJVAA93018', '12370LVBDEA93016', '812253732514299904', 1, NULL);
INSERT INTO `t_user_role` VALUES ('12370LVM23A93019', '12370LVBDEA93016', '812176318056628224', 1, NULL);
INSERT INTO `t_user_role` VALUES ('12370LVNJRA9301A', '12370LVBDEA93016', '811102268043558912', 1, NULL);
INSERT INTO `t_user_role` VALUES ('12370M0NN2A9301F', '12370J9TQVA9300G', '812253732514299904', 1, NULL);
INSERT INTO `t_user_role` VALUES ('12370M0R7KA9301G', '12370J383KA9300C', '809697588000325632', 1, NULL);
INSERT INTO `t_user_role` VALUES ('12370N2HMQA9301P', '12370N289IA9301N', '809697588000325632', 1, NULL);
INSERT INTO `t_user_role` VALUES ('12370N2I4AA9301Q', '12370N289IA9301N', '809694250722656256', 1, NULL);
INSERT INTO `t_user_role` VALUES ('123S0B752O1HD003', '123S0B6JTF1HD002', '812253732514299904', 1, NULL);
INSERT INTO `t_user_role` VALUES ('123S0B77CP1HD004', '123S0B6JTF1HD002', '812176318056628224', 1, NULL);
INSERT INTO `t_user_role` VALUES ('123S0B78RP1HD005', '123S0B6JTF1HD002', '811102268043558912', 1, NULL);
INSERT INTO `t_user_role` VALUES ('123S0B79971HD006', '123S0B6JTF1HD002', '809697588000325632', 1, NULL);
INSERT INTO `t_user_role` VALUES ('123S0B79VD1HD007', '123S0B6JTF1HD002', '809694250722656256', 1, NULL);
INSERT INTO `t_user_role` VALUES ('123S0B7ADQ1HD008', '123S0B6JTF1HD002', '809281289969467392', 1, NULL);
INSERT INTO `t_user_role` VALUES ('123S0BKSKT1HD00J', '123S0BDPKD1HD00C', '812253732514299904', 1, NULL);
INSERT INTO `t_user_role` VALUES ('123S0BLM461HD00K', '123S0BHTEP1HD00F', '809694250722656256', 1, NULL);
INSERT INTO `t_user_role` VALUES ('123S0BM0LG1HD00L', '123S0BFU6T1HD00E', '809281289969467392', 1, NULL);
INSERT INTO `t_user_role` VALUES ('123S0I7H9J1HD015', '123S0I5ONV1HD011', '809694250722656256', 1, NULL);
INSERT INTO `t_user_role` VALUES ('123S0I7LIN1HD016', '123S0I5ONV1HD011', '809697588000325632', 1, NULL);
INSERT INTO `t_user_role` VALUES ('123V0OAF2Q1HD00L', '12370J383KA9300C', '812176318056628224', 1, NULL);
INSERT INTO `t_user_role` VALUES ('12430N6I2MLIA004', '12370KKGQOA9300S', '812176318056628224', 1, NULL);
INSERT INTO `t_user_role` VALUES ('124Q0KLP7F5AK00A', '123R15R2I7VF5003', '809694250722656256', 1, NULL);
INSERT INTO `t_user_role` VALUES ('125P12EK8N297007', '12370LVBDEA93016', '809697588000325632', 1, NULL);
INSERT INTO `t_user_role` VALUES ('12621933RU29700B', '12620S8LBN297003', '809694250722656256', 1, NULL);
INSERT INTO `t_user_role` VALUES ('12630OM4SD297003', '1262112UC6297001', '811102268043558912', 1, NULL);
INSERT INTO `t_user_role` VALUES ('12630OMB48297004', '126215B0C9297001', '812253732514299904', 1, NULL);
INSERT INTO `t_user_role` VALUES ('126313R78M297008', '126313QSC9297006', '126304SL3U29700A', 1, '用户员工关联信息');
INSERT INTO `t_user_role` VALUES ('126412HL07297003', '126412HL06297001', '126304SL3U29700A', 1, '用户员工关联信息');
INSERT INTO `t_user_role` VALUES ('126412TJCS297003', '126412TJCS297001', '126304SL3U29700A', 1, '用户员工关联信息');
INSERT INTO `t_user_role` VALUES ('12641AEUQH29700C', '12641AEUQH29700A', '126304SL3U29700A', 1, '用户员工关联信息');
INSERT INTO `t_user_role` VALUES ('12641B06MG29700F', '12641B06MG29700D', '126304SL3U29700A', 1, '用户员工关联信息');
INSERT INTO `t_user_role` VALUES ('12650RH1VV297005', '12650RH1VV297003', '126304SL3U29700A', 1, '用户员工关联信息');
INSERT INTO `t_user_role` VALUES ('12650RJ9IQ297008', '12650RJ9IQ297006', '126304SL3U29700A', 1, '用户员工关联信息');
INSERT INTO `t_user_role` VALUES ('1265128THC297006', '1265128THC297004', '126304SL3U29700A', 1, '用户员工关联信息');
INSERT INTO `t_user_role` VALUES ('126512CTQC29700A', '126512CTQC297008', '126304SL3U29700A', 1, '用户员工关联信息');
INSERT INTO `t_user_role` VALUES ('126512LJAQ29700E', '126512LJAQ29700C', '126304SL3U29700A', 1, '用户员工关联信息');
INSERT INTO `t_user_role` VALUES ('126D0K0MGD29700B', '126219LAHB29700I', '126D0JVM13297007', 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;

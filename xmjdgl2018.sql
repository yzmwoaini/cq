/*
 Navicat Premium Data Transfer

 Source Server         : epms_cq
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : 192.168.0.9:3307
 Source Schema         : xmjdgl2018

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 22/06/2018 10:40:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for a_cons
-- ----------------------------
DROP TABLE IF EXISTS `a_cons`;
CREATE TABLE `a_cons`  (
  `contract_code` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contract_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  INDEX `a_cons_code`(`contract_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for a_trigger_bs
-- ----------------------------
DROP TABLE IF EXISTS `a_trigger_bs`;
CREATE TABLE `a_trigger_bs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bs_befor_planEndTim` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `new_panEndTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `changeTime` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_acceptance_check
-- ----------------------------
DROP TABLE IF EXISTS `b_acceptance_check`;
CREATE TABLE `b_acceptance_check`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKA6B68F5D967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKA6B68F5D5C31E216`(`project_id`) USING BTREE,
  INDEX `FKA6B68F5D7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKA6B68F5DDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKA6B68F5DF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKA6B68F5DA29A3F85`(`apply_org_id`) USING BTREE,
  INDEX `idx_bac_code`(`entity_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 471987 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_acceptance_detail
-- ----------------------------
DROP TABLE IF EXISTS `b_acceptance_detail`;
CREATE TABLE `b_acceptance_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `con_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `con_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `acceptance_check_id` bigint(20) DEFAULT NULL,
  `check_org_id` bigint(20) DEFAULT NULL,
  `check_unit_id` bigint(20) DEFAULT NULL,
  `org_type_id` bigint(20) DEFAULT NULL,
  `weight` decimal(19, 2) DEFAULT NULL,
  `unit_weight_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK31ACB89CA6F7BCAB`(`check_org_id`) USING BTREE,
  INDEX `FK31ACB89C77243690`(`check_unit_id`) USING BTREE,
  INDEX `FK31ACB89C7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK31ACB89C9AC3ED7F`(`acceptance_check_id`) USING BTREE,
  INDEX `FK31ACB89C69897B7D`(`org_type_id`) USING BTREE,
  INDEX `unit_weight_id`(`unit_weight_id`) USING BTREE,
  INDEX `FK31ACB89C78B2929E`(`unit_weight_id`) USING BTREE,
  CONSTRAINT `FK31ACB89C78B2929E` FOREIGN KEY (`unit_weight_id`) REFERENCES `b_unit_weight` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 157474 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_allproject
-- ----------------------------
DROP TABLE IF EXISTS `b_allproject`;
CREATE TABLE `b_allproject`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime(0) DEFAULT NULL,
  `month_total_invest` decimal(19, 2) DEFAULT NULL,
  `plan_year_invest` decimal(19, 2) DEFAULT NULL,
  `rate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `year_total_invest` decimal(19, 2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_allwarning_node
-- ----------------------------
DROP TABLE IF EXISTS `b_allwarning_node`;
CREATE TABLE `b_allwarning_node`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime(0) DEFAULT NULL,
  `engineer_department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `engineer_room` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `jijianban` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_room` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_applyorg_info
-- ----------------------------
DROP TABLE IF EXISTS `b_applyorg_info`;
CREATE TABLE `b_applyorg_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `applyExample` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `business_contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `business_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `company_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `enterprise_legal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qualifications` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `registered_capital` decimal(19, 2) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `purchaseSubmit_id` bigint(20) DEFAULT NULL,
  `old_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8E3F359A7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK8E3F359A8FA407D3`(`purchaseSubmit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8212 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_archive_detail
-- ----------------------------
DROP TABLE IF EXISTS `b_archive_detail`;
CREATE TABLE `b_archive_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `acount` int(11) DEFAULT NULL,
  `dataArchive_id` bigint(20) DEFAULT NULL,
  `file_type_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKCB9C93EB8317FB55`(`dataArchive_id`) USING BTREE,
  INDEX `FKCB9C93EBD2075DD1`(`file_type_id`) USING BTREE,
  INDEX `FKCB9C93EB5C31E216`(`project_id`) USING BTREE,
  INDEX `FKCB9C93EB7D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10909 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_assess_quota_report
-- ----------------------------
DROP TABLE IF EXISTS `b_assess_quota_report`;
CREATE TABLE `b_assess_quota_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actual_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `business_id` bigint(20) DEFAULT NULL,
  `business_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `design_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deviation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deviation_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fea_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `assess_template_id` bigint(20) DEFAULT NULL,
  `assess_quota_id` bigint(20) DEFAULT NULL,
  `assess_report_unit_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKE7397E7962323CFE`(`assess_report_unit_id`) USING BTREE,
  INDEX `FKE7397E795C31E216`(`project_id`) USING BTREE,
  INDEX `FKE7397E79675BA6DD`(`assess_quota_id`) USING BTREE,
  INDEX `FKE7397E79C437E877`(`assess_template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_assess_quota_report_unit
-- ----------------------------
DROP TABLE IF EXISTS `b_assess_quota_report_unit`;
CREATE TABLE `b_assess_quota_report_unit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) DEFAULT NULL,
  `flow_type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8AF1378A5C31E216`(`project_id`) USING BTREE,
  INDEX `FK8AF1378A7CFF04F3`(`flow_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_assign_task
-- ----------------------------
DROP TABLE IF EXISTS `b_assign_task`;
CREATE TABLE `b_assign_task`  (
  `assign_id` bigint(20) NOT NULL,
  `task_id` bigint(20) NOT NULL,
  INDEX `FK909B8678434ADC34`(`task_id`) USING BTREE,
  INDEX `FK909B8678BB2AE914`(`assign_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_attachement_makeup
-- ----------------------------
DROP TABLE IF EXISTS `b_attachement_makeup`;
CREATE TABLE `b_attachement_makeup`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK7E825747967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK7E8257475C31E216`(`project_id`) USING BTREE,
  INDEX `FK7E8257477D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK7E825747DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK7E825747F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK7E825747A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_attachment
-- ----------------------------
DROP TABLE IF EXISTS `b_attachment`;
CREATE TABLE `b_attachment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attach_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attchment_size` decimal(19, 2) DEFAULT NULL,
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attach_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `doc_date` datetime(0) DEFAULT NULL,
  `attach_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attach_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attach_topic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `upload_date` datetime(0) DEFAULT NULL,
  `uploader_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `attachment_type_id` bigint(20) DEFAULT NULL,
  `attachment_stage_id` bigint(20) DEFAULT NULL,
  `types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKBDD6FD20D5602A78`(`attachment_type_id`) USING BTREE,
  INDEX `FKBDD6FD20F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKBDD6FD205E5F2429`(`attachment_stage_id`) USING BTREE,
  INDEX `FKBDD6FD20587F8362`(`uploader_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 768704 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_attachment_unit
-- ----------------------------
DROP TABLE IF EXISTS `b_attachment_unit`;
CREATE TABLE `b_attachment_unit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attach_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `biz_Id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `pid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK6E0BC9437D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `idx_bau_code`(`entity_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 770273 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_audit_code
-- ----------------------------
DROP TABLE IF EXISTS `b_audit_code`;
CREATE TABLE `b_audit_code`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `approve_adjust_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `approve_adjust_date` datetime(0) DEFAULT NULL,
  `approve_adjust_invest` decimal(19, 2) DEFAULT NULL,
  `approve_reply_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `approve_reply_date` datetime(0) DEFAULT NULL,
  `approve_reply_invest` decimal(19, 2) DEFAULT NULL,
  `complete_work_date` datetime(0) DEFAULT NULL,
  `design_adjust_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `design_adjust_date` datetime(0) DEFAULT NULL,
  `design_adjust_invest` decimal(19, 2) DEFAULT NULL,
  `design_reply_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `design_reply_date` datetime(0) DEFAULT NULL,
  `design_reply_invest` decimal(19, 2) DEFAULT NULL,
  `fea_relay_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fea_relay_date` datetime(0) DEFAULT NULL,
  `fea_relay_invest` decimal(19, 2) DEFAULT NULL,
  `final_check_date` datetime(0) DEFAULT NULL,
  `first_check_date` datetime(0) DEFAULT NULL,
  `plan_adjust_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `plan_adjust_date` datetime(0) DEFAULT NULL,
  `plan_adjust_invest` decimal(19, 2) DEFAULT NULL,
  `start_work_date` datetime(0) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK97B99FCE5C31E216`(`project_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 299 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_audit_entrust
-- ----------------------------
DROP TABLE IF EXISTS `b_audit_entrust`;
CREATE TABLE `b_audit_entrust`  (
  `audit_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `end_date` datetime(0) DEFAULT NULL,
  `entrust_date` datetime(0) DEFAULT NULL,
  `is_entrust_accept` bit(1) DEFAULT NULL,
  `is_interface_accept` bit(1) DEFAULT NULL,
  `is_repeat` bit(1) DEFAULT NULL,
  `entrust_letter_id` bigint(20) DEFAULT NULL,
  `audit_project_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `entrust_user_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `interface_user_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `entrust_org_id` bigint(20) DEFAULT NULL,
  `audit_id` bigint(20) DEFAULT NULL,
  `audit_projects` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `old_iscomplete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `old_node` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `old_userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKD34C69CE967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKD34C69CE9659F7F5`(`entrust_user_id`) USING BTREE,
  INDEX `FKD34C69CEA19EEAB7`(`entrust_letter_id`) USING BTREE,
  INDEX `FKD34C69CE7ED3F932`(`audit_project_id`) USING BTREE,
  INDEX `FKD34C69CE47BDA8CA`(`audit_project_id`) USING BTREE,
  INDEX `FKD34C69CEE9715702`(`audit_project_id`) USING BTREE,
  INDEX `FKD34C69CEDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKD34C69CEC348A084`(`entrust_org_id`) USING BTREE,
  INDEX `FKD34C69CE7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKD34C69CEC9436693`(`audit_id`) USING BTREE,
  INDEX `FKD34C69CEB5693B2B`(`audit_id`) USING BTREE,
  INDEX `FKD34C69CEB9EEC75B`(`audit_id`) USING BTREE,
  INDEX `FKD34C69CE1BF127DF`(`interface_user_id`) USING BTREE,
  INDEX `FKD34C69CEF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKD34C69CEA29A3F85`(`apply_org_id`) USING BTREE,
  INDEX `FKD34C69CE94F90614`(`old_userid`) USING BTREE,
  CONSTRAINT `FKD34C69CE94F90614` FOREIGN KEY (`old_userid`) REFERENCES `s_privilege_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6706 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_audit_exec
-- ----------------------------
DROP TABLE IF EXISTS `b_audit_exec`;
CREATE TABLE `b_audit_exec`  (
  `audit_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `audit_date` datetime(0) DEFAULT NULL,
  `old_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `audit_spec` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `back_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `back_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `con_des_addcutfee` decimal(19, 2) DEFAULT NULL,
  `con_des_addfee` decimal(19, 2) DEFAULT NULL,
  `con_des_addfee_rate` decimal(19, 2) DEFAULT NULL,
  `con_des_auditfee` decimal(19, 2) DEFAULT NULL,
  `con_des_fee` decimal(19, 2) DEFAULT NULL,
  `con_des_subcutfee` decimal(19, 2) DEFAULT NULL,
  `con_des_subfee` decimal(19, 2) DEFAULT NULL,
  `con_des_subfee_rate` decimal(19, 2) DEFAULT NULL,
  `cost_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fee_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_adjust` bit(1) DEFAULT NULL,
  `is_repeat` bit(1) DEFAULT NULL,
  `report_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `construct_person` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `construct_person_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `develop_person` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `develop_person_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `material_addcutfee` decimal(19, 2) DEFAULT NULL,
  `material_addfee` decimal(19, 2) DEFAULT NULL,
  `material_addfee_rate` decimal(19, 2) DEFAULT NULL,
  `material_auditfee` decimal(19, 2) DEFAULT NULL,
  `material_fee` decimal(19, 2) DEFAULT NULL,
  `material_subcutfee` decimal(19, 2) DEFAULT NULL,
  `material_subfee` decimal(19, 2) DEFAULT NULL,
  `material_subfee_rate` decimal(19, 2) DEFAULT NULL,
  `submit_scale` decimal(19, 2) DEFAULT NULL,
  `survey_date` datetime(0) DEFAULT NULL,
  `survey_rate` decimal(19, 2) DEFAULT NULL,
  `survey_times` int(11) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `old_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `audit_project_id` bigint(20) DEFAULT NULL,
  `entrust_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `survey_user_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `entrust_org_id` bigint(20) DEFAULT NULL,
  `order_unit_id` bigint(20) DEFAULT NULL,
  `coop_org_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `coop_user_id` bigint(20) DEFAULT NULL,
  `audit_contract_id` bigint(20) DEFAULT NULL,
  `entrust_user_id` bigint(20) DEFAULT NULL,
  `interface_user_id` bigint(20) DEFAULT NULL,
  `audit_acceptor_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `audit_acceptor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `feed_back_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `feed_back` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_auto` bit(1) DEFAULT NULL,
  `old_iscomplete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `old_node` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `old_userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK97BAAA729659F7F5`(`entrust_user_id`) USING BTREE,
  INDEX `FK97BAAA72967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK97BAAA7294EA5F7A`(`order_unit_id`) USING BTREE,
  INDEX `FK97BAAA724246905E`(`entrust_id`) USING BTREE,
  INDEX `FK97BAAA72A092E226`(`entrust_id`) USING BTREE,
  INDEX `FK97BAAA72D7A9328E`(`entrust_id`) USING BTREE,
  INDEX `FK97BAAA7247BDA8CA`(`audit_project_id`) USING BTREE,
  INDEX `FK97BAAA72E9715702`(`audit_project_id`) USING BTREE,
  INDEX `FK97BAAA727ED3F932`(`audit_project_id`) USING BTREE,
  INDEX `FK97BAAA72DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK97BAAA729653C3`(`audit_contract_id`) USING BTREE,
  INDEX `FK97BAAA72EF2115F3`(`coop_user_id`) USING BTREE,
  INDEX `FK97BAAA725C31E216`(`project_id`) USING BTREE,
  INDEX `FK97BAAA72C348A084`(`entrust_org_id`) USING BTREE,
  INDEX `FK97BAAA7230242040`(`old_id`) USING BTREE,
  INDEX `FK97BAAA723EA02C10`(`old_id`) USING BTREE,
  INDEX `FK97BAAA724A46CAC6`(`coop_org_id`) USING BTREE,
  INDEX `FK97BAAA727D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK97BAAA7239266378`(`old_id`) USING BTREE,
  INDEX `FK97BAAA721BF127DF`(`interface_user_id`) USING BTREE,
  INDEX `FK97BAAA72F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK97BAAA7298D7B100`(`survey_user_id`) USING BTREE,
  INDEX `FK97BAAA72A29A3F85`(`apply_org_id`) USING BTREE,
  INDEX `idx_sett_exec_code`(`entity_code`) USING BTREE,
  INDEX `FK97BAAA7294F90614`(`old_userid`) USING BTREE,
  CONSTRAINT `FK97BAAA7294F90614` FOREIGN KEY (`old_userid`) REFERENCES `s_privilege_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9688 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_audit_file
-- ----------------------------
DROP TABLE IF EXISTS `b_audit_file`;
CREATE TABLE `b_audit_file`  (
  `audit_project_id` bigint(20) NOT NULL,
  `file_type_id` bigint(20) NOT NULL,
  INDEX `FK97BAE75D6E7203CC`(`file_type_id`) USING BTREE,
  INDEX `FK97BAE75D87C1E665`(`audit_project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_audit_order
-- ----------------------------
DROP TABLE IF EXISTS `b_audit_order`;
CREATE TABLE `b_audit_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `add_money` decimal(19, 2) DEFAULT NULL,
  `audit_money` decimal(19, 2) DEFAULT NULL,
  `construct_money` decimal(19, 2) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `money` decimal(19, 2) DEFAULT NULL,
  `production_money` decimal(19, 2) DEFAULT NULL,
  `sub_money` decimal(19, 2) DEFAULT NULL,
  `sub_rate` decimal(19, 2) DEFAULT NULL,
  `order_unit_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `old_id` bigint(20) DEFAULT NULL,
  `order_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_codes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK6024D18D94EA5F7A`(`order_unit_id`) USING BTREE,
  INDEX `FK6024D18D96C586C4`(`old_id`) USING BTREE,
  INDEX `FK6024D18D774908F6`(`order_id`) USING BTREE,
  INDEX `idx_ao_code`(`entity_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83689 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_audit_org
-- ----------------------------
DROP TABLE IF EXISTS `b_audit_org`;
CREATE TABLE `b_audit_org`  (
  `audit_project_id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  INDEX `FKB2507CE36C5DDD94`(`org_id`) USING BTREE,
  INDEX `FKB2507CE387C1E665`(`audit_project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_audit_problem
-- ----------------------------
DROP TABLE IF EXISTS `b_audit_problem`;
CREATE TABLE `b_audit_problem`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `add_info` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `audit_feedback` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `audit_opinion` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `construct_feedback` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `firm_feedback` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `order_feedback` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `plan_feedback` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `problem_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `problem_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sale_feedback` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `old_audit_problem_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `audit_feedback_user_id` bigint(20) DEFAULT NULL,
  `order_feedback_user_id` bigint(20) DEFAULT NULL,
  `sale_feedback_user_id` bigint(20) DEFAULT NULL,
  `audit_project_id` bigint(20) DEFAULT NULL,
  `audit_exec_id` bigint(20) DEFAULT NULL,
  `problem_act_id` bigint(20) DEFAULT NULL,
  `audit_user_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `firm_feedback_user_id` bigint(20) DEFAULT NULL,
  `construct_feedback_user_id` bigint(20) DEFAULT NULL,
  `plan_feedback_user_id` bigint(20) DEFAULT NULL,
  `types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK1FB6791E87C1E665`(`audit_project_id`) USING BTREE,
  INDEX `FK1FB6791E93FE0881`(`plan_feedback_user_id`) USING BTREE,
  INDEX `FK1FB6791EAC99481`(`audit_user_id`) USING BTREE,
  INDEX `FK1FB6791E9756320F`(`audit_feedback_user_id`) USING BTREE,
  INDEX `FK1FB6791ED0E3AFC`(`order_feedback_user_id`) USING BTREE,
  INDEX `FK1FB6791E42DD8A0C`(`firm_feedback_user_id`) USING BTREE,
  INDEX `FK1FB6791ED7AA57BD`(`old_audit_problem_id`) USING BTREE,
  INDEX `FK1FB6791E1718A0AF`(`audit_exec_id`) USING BTREE,
  INDEX `FK1FB6791EA228E193`(`construct_feedback_user_id`) USING BTREE,
  INDEX `FK1FB6791EB305F323`(`sale_feedback_user_id`) USING BTREE,
  INDEX `FK1FB6791E7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK1FB6791EB6EC4854`(`problem_act_id`) USING BTREE,
  INDEX `FK1FB6791EF7258E38`(`attachment_unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 937 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_audit_project
-- ----------------------------
DROP TABLE IF EXISTS `b_audit_project`;
CREATE TABLE `b_audit_project`  (
  `audit_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `adjust_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `audit_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `audit_spec` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `audit_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `back_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `con_des_addcutfee` decimal(19, 2) DEFAULT NULL,
  `con_des_addfee` decimal(19, 2) DEFAULT NULL,
  `con_des_addfee_rate` decimal(19, 2) DEFAULT NULL,
  `con_des_auditfee` decimal(19, 2) DEFAULT NULL,
  `con_des_fee` decimal(19, 2) DEFAULT NULL,
  `con_des_subcutfee` decimal(19, 2) DEFAULT NULL,
  `con_des_subfee` decimal(19, 2) DEFAULT NULL,
  `con_des_subfee_rate` decimal(19, 2) DEFAULT NULL,
  `cost_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fee_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_applyadjust` bit(1) DEFAULT NULL,
  `is_change` bit(1) DEFAULT NULL,
  `is_execadjust` bit(1) DEFAULT NULL,
  `report_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_repeat` bit(1) DEFAULT NULL,
  `material_addcutfee` decimal(19, 2) DEFAULT NULL,
  `material_addfee` decimal(19, 2) DEFAULT NULL,
  `material_auditfee` decimal(19, 2) DEFAULT NULL,
  `material_fee` decimal(19, 2) DEFAULT NULL,
  `material_subcutfee` decimal(19, 2) DEFAULT NULL,
  `material_subfee` decimal(19, 2) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `audit_contract_id` bigint(20) DEFAULT NULL,
  `coop_org_id` bigint(20) DEFAULT NULL,
  `entrust_user_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `order_unit_id` bigint(20) DEFAULT NULL,
  `coop_user_id` bigint(20) DEFAULT NULL,
  `entrust_org_id` bigint(20) DEFAULT NULL,
  `inner_auditor_id` bigint(20) DEFAULT NULL,
  `interface_user_id` bigint(20) DEFAULT NULL,
  `entrust_letter_id` bigint(20) DEFAULT NULL,
  `audit_area` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK1FBA01989653C3`(`audit_contract_id`) USING BTREE,
  INDEX `FK1FBA0198EF2115F3`(`coop_user_id`) USING BTREE,
  INDEX `FK1FBA01989659F7F5`(`entrust_user_id`) USING BTREE,
  INDEX `FK1FBA0198A19EEAB7`(`entrust_letter_id`) USING BTREE,
  INDEX `FK1FBA01985C31E216`(`project_id`) USING BTREE,
  INDEX `FK1FBA019894EA5F7A`(`order_unit_id`) USING BTREE,
  INDEX `FK1FBA0198C348A084`(`entrust_org_id`) USING BTREE,
  INDEX `FK1FBA01987D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK1FBA01984A46CAC6`(`coop_org_id`) USING BTREE,
  INDEX `FK1FBA01981BF127DF`(`interface_user_id`) USING BTREE,
  INDEX `FK1FBA0198F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK1FBA019874874E5B`(`inner_auditor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8535 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_audit_score_detail
-- ----------------------------
DROP TABLE IF EXISTS `b_audit_score_detail`;
CREATE TABLE `b_audit_score_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `real_total` decimal(19, 2) DEFAULT NULL,
  `score_type_id` bigint(20) DEFAULT NULL,
  `score_unit_id` bigint(20) DEFAULT NULL,
  `old_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK73702F7F4F3982BD`(`score_unit_id`) USING BTREE,
  INDEX `FK73702F7F2D741EFD`(`score_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_audit_score_unit
-- ----------------------------
DROP TABLE IF EXISTS `b_audit_score_unit`;
CREATE TABLE `b_audit_score_unit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKE294E4327D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_auditorder_unit
-- ----------------------------
DROP TABLE IF EXISTS `b_auditorder_unit`;
CREATE TABLE `b_auditorder_unit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `pid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKD46B84137D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `idx_aounit_code`(`entity_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38830 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_budget_audit
-- ----------------------------
DROP TABLE IF EXISTS `b_budget_audit`;
CREATE TABLE `b_budget_audit`  (
  `audit_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `audit_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `audit_val_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `con_des_fee` decimal(19, 2) DEFAULT NULL,
  `is_adjust` bit(1) DEFAULT NULL,
  `material_fee` decimal(19, 2) DEFAULT NULL,
  `submit_date` datetime(0) DEFAULT NULL,
  `adjust_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `con_handle_date` datetime(0) DEFAULT NULL,
  `is_con_handle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quartz_submit` bit(1) DEFAULT NULL,
  `inner_auditor_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `coop_org_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `coop_user_id` bigint(20) DEFAULT NULL,
  `audit_project_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `old_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `problem_activity_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKA819FF1EEF2115F3`(`coop_user_id`) USING BTREE,
  INDEX `FKA819FF1E967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKA819FF1E5C31E216`(`project_id`) USING BTREE,
  INDEX `FKA819FF1EE9715702`(`audit_project_id`) USING BTREE,
  INDEX `FKA819FF1E7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKA819FF1E4A46CAC6`(`coop_org_id`) USING BTREE,
  INDEX `FKA819FF1EC5173CBE`(`old_id`) USING BTREE,
  INDEX `FKA819FF1EDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKA819FF1EF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKA819FF1E5297B177`(`problem_activity_id`) USING BTREE,
  INDEX `FKA819FF1EA29A3F85`(`apply_org_id`) USING BTREE,
  INDEX `FKA819FF1E74874E5B`(`inner_auditor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_budget_audit_exec_fee
-- ----------------------------
DROP TABLE IF EXISTS `b_budget_audit_exec_fee`;
CREATE TABLE `b_budget_audit_exec_fee`  (
  `budget_audit_fee_id` bigint(20) NOT NULL,
  `budget_audit_exec_id` bigint(20) NOT NULL,
  UNIQUE INDEX `budget_audit_exec_id`(`budget_audit_exec_id`) USING BTREE,
  INDEX `FKAB7116D9BABB8A9C`(`budget_audit_fee_id`) USING BTREE,
  INDEX `FKAB7116D9883D21B8`(`budget_audit_exec_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_budget_audit_fee
-- ----------------------------
DROP TABLE IF EXISTS `b_budget_audit_fee`;
CREATE TABLE `b_budget_audit_fee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `charged_batch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_charged` bit(1) DEFAULT NULL,
  `total_score` decimal(19, 2) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `score_unit_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `entrust_org_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKFED5FAE5967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKFED5FAE54F3982BD`(`score_unit_id`) USING BTREE,
  INDEX `FKFED5FAE5C348A084`(`entrust_org_id`) USING BTREE,
  INDEX `FKFED5FAE57D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKFED5FAE5DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKFED5FAE5F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKFED5FAE5A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_budget_audit_file
-- ----------------------------
DROP TABLE IF EXISTS `b_budget_audit_file`;
CREATE TABLE `b_budget_audit_file`  (
  `budget_audit_id` bigint(20) NOT NULL,
  `file_type_id` bigint(20) NOT NULL,
  UNIQUE INDEX `file_type_id`(`file_type_id`) USING BTREE,
  INDEX `FKDBE971FD6E7203CC`(`file_type_id`) USING BTREE,
  INDEX `FKDBE971FD94A4E244`(`budget_audit_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_budget_audit_org
-- ----------------------------
DROP TABLE IF EXISTS `b_budget_audit_org`;
CREATE TABLE `b_budget_audit_org`  (
  `budget_audit_id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  INDEX `FKFED61E436C5DDD94`(`org_id`) USING BTREE,
  INDEX `FKFED61E4394A4E244`(`budget_audit_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_building_status
-- ----------------------------
DROP TABLE IF EXISTS `b_building_status`;
CREATE TABLE `b_building_status`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) DEFAULT NULL,
  `now_status_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `year_months` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17921 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_bulletin
-- ----------------------------
DROP TABLE IF EXISTS `b_bulletin`;
CREATE TABLE `b_bulletin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK395BB8E47D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK395BB8E4F7258E38`(`attachment_unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_business_serial_number
-- ----------------------------
DROP TABLE IF EXISTS `b_business_serial_number`;
CREATE TABLE `b_business_serial_number`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Serial_Number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `business_Serial_Number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `business_Type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_capital_adjust_budget
-- ----------------------------
DROP TABLE IF EXISTS `b_capital_adjust_budget`;
CREATE TABLE `b_capital_adjust_budget`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `is_comple` bit(1) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `capital_org_tran_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `capital_budget_id` bigint(20) DEFAULT NULL,
  `capital_budget_tran_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKF8F08F413947D636`(`capital_budget_id`) USING BTREE,
  INDEX `FKF8F08F41967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKF8F08F417D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKF8F08F41B1264AD9`(`capital_budget_tran_id`) USING BTREE,
  INDEX `FKF8F08F41DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKF8F08F41F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKF8F08F419F535F43`(`capital_org_tran_id`) USING BTREE,
  INDEX `FKF8F08F41A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_capital_budget
-- ----------------------------
DROP TABLE IF EXISTS `b_capital_budget`;
CREATE TABLE `b_capital_budget`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `carrried_Forward_invest` decimal(19, 2) DEFAULT NULL,
  `expend_total_investment` decimal(19, 2) DEFAULT NULL,
  `first_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `former_total_invest` decimal(19, 2) DEFAULT NULL,
  `forth_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `invest` decimal(19, 2) DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `occupied_invest` decimal(19, 2) DEFAULT NULL,
  `occupied_total_invest` decimal(19, 2) DEFAULT NULL,
  `occupying_invest` decimal(19, 2) DEFAULT NULL,
  `occupying_total_invest` decimal(19, 2) DEFAULT NULL,
  `plan_invest` decimal(19, 2) DEFAULT NULL,
  `plan_total_invest` decimal(19, 2) DEFAULT NULL,
  `second_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `third_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `total_invest` decimal(19, 2) DEFAULT NULL,
  `plan_year` int(11) DEFAULT NULL,
  `construct_type_id` bigint(20) DEFAULT NULL,
  `project_type_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `spec_id` bigint(20) DEFAULT NULL,
  `plan_type_id` bigint(20) DEFAULT NULL,
  `capital_type_id` bigint(20) DEFAULT NULL,
  `capital_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKDBB2637963C44627`(`capital_type_id`) USING BTREE,
  INDEX `FKDBB26379DA1817B1`(`plan_type_id`) USING BTREE,
  INDEX `FKDBB26379E4A9CCF2`(`spec_id`) USING BTREE,
  INDEX `FKDBB263797D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKDBB263796498D809`(`project_type_id`) USING BTREE,
  INDEX `FKDBB26379B597D61E`(`capital_org_id`) USING BTREE,
  INDEX `FKDBB263799A9B8D85`(`construct_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1083 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_capital_budget_tran
-- ----------------------------
DROP TABLE IF EXISTS `b_capital_budget_tran`;
CREATE TABLE `b_capital_budget_tran`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `adjust_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `carrried_Forward_invest` decimal(19, 2) DEFAULT NULL,
  `expend_total_investment` decimal(19, 2) DEFAULT NULL,
  `first_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `former_total_invest` decimal(19, 2) DEFAULT NULL,
  `forth_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `invest` decimal(19, 2) DEFAULT NULL,
  `is_adjust` bit(1) DEFAULT NULL,
  `is_comple` bit(1) DEFAULT NULL,
  `occupied_invest` decimal(19, 2) DEFAULT NULL,
  `occupied_total_invest` decimal(19, 2) DEFAULT NULL,
  `occupying_invest` decimal(19, 2) DEFAULT NULL,
  `occupying_total_invest` decimal(19, 2) DEFAULT NULL,
  `old_carried_invest` decimal(19, 2) DEFAULT NULL,
  `old_invest` decimal(19, 2) DEFAULT NULL,
  `old_total_invest` decimal(19, 2) DEFAULT NULL,
  `plan_invest` decimal(19, 2) DEFAULT NULL,
  `plan_total_invest` decimal(19, 2) DEFAULT NULL,
  `second_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `third_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `total_invest` decimal(19, 2) DEFAULT NULL,
  `plan_year` int(11) DEFAULT NULL,
  `project_type_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `capital_budget_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `spec_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `capital_type_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `capital_org_tran_id` bigint(20) DEFAULT NULL,
  `construct_type_id` bigint(20) DEFAULT NULL,
  `plan_type_id` bigint(20) DEFAULT NULL,
  `budget_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK673F0C313947D636`(`capital_budget_id`) USING BTREE,
  INDEX `FK673F0C31967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK673F0C3163C44627`(`capital_type_id`) USING BTREE,
  INDEX `FK673F0C31DA1817B1`(`plan_type_id`) USING BTREE,
  INDEX `FK673F0C31E4A9CCF2`(`spec_id`) USING BTREE,
  INDEX `FK673F0C317D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK673F0C31DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK673F0C316498D809`(`project_type_id`) USING BTREE,
  INDEX `FK673F0C31F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK673F0C31A29A3F85`(`apply_org_id`) USING BTREE,
  INDEX `FK673F0C319F535F43`(`capital_org_tran_id`) USING BTREE,
  INDEX `FK673F0C319A9B8D85`(`construct_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_capital_entry
-- ----------------------------
DROP TABLE IF EXISTS `b_capital_entry`;
CREATE TABLE `b_capital_entry`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `carrried_Forward_invest` decimal(19, 2) DEFAULT NULL,
  `expend_total_investment` decimal(19, 2) DEFAULT NULL,
  `first_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `former_total_invest` decimal(19, 2) DEFAULT NULL,
  `forth_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `invest` decimal(19, 2) DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `occupied_invest` decimal(19, 2) DEFAULT NULL,
  `occupied_total_invest` decimal(19, 2) DEFAULT NULL,
  `occupying_invest` decimal(19, 2) DEFAULT NULL,
  `occupying_total_invest` decimal(19, 2) DEFAULT NULL,
  `plan_invest` decimal(19, 2) DEFAULT NULL,
  `plan_total_invest` decimal(19, 2) DEFAULT NULL,
  `second_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `third_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `total_invest` decimal(19, 2) DEFAULT NULL,
  `plan_year` int(11) DEFAULT NULL,
  `publish_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `startup_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `plan_type_id` bigint(20) DEFAULT NULL,
  `capital_budget_id` bigint(20) DEFAULT NULL,
  `project_group_id` bigint(20) DEFAULT NULL,
  `capital_org_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `project_setup_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK38C9FDBE3947D636`(`capital_budget_id`) USING BTREE,
  INDEX `FK38C9FDBEDA1817B1`(`plan_type_id`) USING BTREE,
  INDEX `FK38C9FDBE621C2543`(`project_group_id`) USING BTREE,
  INDEX `FK38C9FDBE7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK38C9FDBE6DE176C4`(`project_setup_id`) USING BTREE,
  INDEX `FK38C9FDBEB597D61E`(`capital_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1085 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_capital_entry_tran
-- ----------------------------
DROP TABLE IF EXISTS `b_capital_entry_tran`;
CREATE TABLE `b_capital_entry_tran`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `carrried_Forward_invest` decimal(19, 2) DEFAULT NULL,
  `expend_total_investment` decimal(19, 2) DEFAULT NULL,
  `first_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `former_total_invest` decimal(19, 2) DEFAULT NULL,
  `forth_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `invest` decimal(19, 2) DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `occupied_invest` decimal(19, 2) DEFAULT NULL,
  `occupied_total_invest` decimal(19, 2) DEFAULT NULL,
  `occupying_invest` decimal(19, 2) DEFAULT NULL,
  `occupying_total_invest` decimal(19, 2) DEFAULT NULL,
  `plan_invest` decimal(19, 2) DEFAULT NULL,
  `plan_total_invest` decimal(19, 2) DEFAULT NULL,
  `second_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `third_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `total_invest` decimal(19, 2) DEFAULT NULL,
  `plan_year` int(11) DEFAULT NULL,
  `adjust_invest` decimal(19, 2) DEFAULT NULL,
  `old_carried_after_invest` decimal(19, 2) DEFAULT NULL,
  `old_carried_invest` decimal(19, 2) DEFAULT NULL,
  `old_invest` decimal(19, 2) DEFAULT NULL,
  `old_total_invest` decimal(19, 2) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `capital_entry_id` bigint(20) DEFAULT NULL,
  `capital_budget_id` bigint(20) DEFAULT NULL,
  `project_setup_id` bigint(20) DEFAULT NULL,
  `capital_budget_tran_id` bigint(20) DEFAULT NULL,
  `capital_org_tran_id` bigint(20) DEFAULT NULL,
  `plan_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKE096150C3947D636`(`capital_budget_id`) USING BTREE,
  INDEX `FKE096150CDA1817B1`(`plan_type_id`) USING BTREE,
  INDEX `fk_capentrytran_caentry`(`capital_entry_id`) USING BTREE,
  INDEX `FKE096150C7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKE096150CB1264AD9`(`capital_budget_tran_id`) USING BTREE,
  INDEX `fk_capentrytran_projsetup`(`project_setup_id`) USING BTREE,
  INDEX `FKE096150C9F535F43`(`capital_org_tran_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1174 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_capital_org
-- ----------------------------
DROP TABLE IF EXISTS `b_capital_org`;
CREATE TABLE `b_capital_org`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `carrried_Forward_invest` decimal(19, 2) DEFAULT NULL,
  `expend_total_investment` decimal(19, 2) DEFAULT NULL,
  `first_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `former_total_invest` decimal(19, 2) DEFAULT NULL,
  `forth_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `invest` decimal(19, 2) DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `occupied_invest` decimal(19, 2) DEFAULT NULL,
  `occupied_total_invest` decimal(19, 2) DEFAULT NULL,
  `occupying_invest` decimal(19, 2) DEFAULT NULL,
  `occupying_total_invest` decimal(19, 2) DEFAULT NULL,
  `plan_invest` decimal(19, 2) DEFAULT NULL,
  `plan_total_invest` decimal(19, 2) DEFAULT NULL,
  `second_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `third_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `total_invest` decimal(19, 2) DEFAULT NULL,
  `plan_year` int(11) DEFAULT NULL,
  `publish_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `capital_type_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK6A9D873063C44627`(`capital_type_id`) USING BTREE,
  INDEX `FK6A9D87307D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_capital_org_tran
-- ----------------------------
DROP TABLE IF EXISTS `b_capital_org_tran`;
CREATE TABLE `b_capital_org_tran`  (
  `capital_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `investment` decimal(19, 2) DEFAULT NULL,
  `plan_year` int(11) DEFAULT NULL,
  `total_investment` decimal(19, 2) DEFAULT NULL,
  `adjust_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `old_investment` decimal(19, 2) DEFAULT NULL,
  `old_total_investment` decimal(19, 2) DEFAULT NULL,
  `pre_adjust` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `capital_type_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `adjust_type_id` bigint(20) DEFAULT NULL,
  `capital_org_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK6518A2DA6C5DDD94`(`org_id`) USING BTREE,
  INDEX `FK6518A2DA967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK6518A2DA63C44627`(`capital_type_id`) USING BTREE,
  INDEX `FK6518A2DAE0A15D75`(`adjust_type_id`) USING BTREE,
  INDEX `FK6518A2DA7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK6518A2DADEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK6518A2DAB597D61E`(`capital_org_id`) USING BTREE,
  INDEX `FK6518A2DAF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK6518A2DAA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_capital_proj
-- ----------------------------
DROP TABLE IF EXISTS `b_capital_proj`;
CREATE TABLE `b_capital_proj`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `carrried_Forward_invest` decimal(19, 2) DEFAULT NULL,
  `expend_total_investment` decimal(19, 2) DEFAULT NULL,
  `first_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `former_total_invest` decimal(19, 2) DEFAULT NULL,
  `forth_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `invest` decimal(19, 2) DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `occupied_invest` decimal(19, 2) DEFAULT NULL,
  `occupied_total_invest` decimal(19, 2) DEFAULT NULL,
  `occupying_invest` decimal(19, 2) DEFAULT NULL,
  `occupying_total_invest` decimal(19, 2) DEFAULT NULL,
  `plan_invest` decimal(19, 2) DEFAULT NULL,
  `plan_total_invest` decimal(19, 2) DEFAULT NULL,
  `second_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `third_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `total_invest` decimal(19, 2) DEFAULT NULL,
  `plan_year` int(11) DEFAULT NULL,
  `audit_total_invest` decimal(19, 2) DEFAULT NULL,
  `design_total_invest` decimal(19, 2) DEFAULT NULL,
  `fea_invest` decimal(19, 2) DEFAULT NULL,
  `fea_total_invest` decimal(19, 2) DEFAULT NULL,
  `fianl_total_invest` decimal(19, 2) DEFAULT NULL,
  `first_total_Investment` decimal(19, 2) DEFAULT NULL,
  `solid_invest` decimal(19, 2) DEFAULT NULL,
  `startup_invest` decimal(19, 2) DEFAULT NULL,
  `startup_total_invest` decimal(19, 2) DEFAULT NULL,
  `capital_entry_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKE913D4915C31E216`(`project_id`) USING BTREE,
  INDEX `FKE913D4917D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKE913D491E1576975`(`capital_entry_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17378 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_carried_business
-- ----------------------------
DROP TABLE IF EXISTS `b_carried_business`;
CREATE TABLE `b_carried_business`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `plan_year` int(11) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK555C2BB2967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK555C2BB27D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK555C2BB2DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK555C2BB2F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK555C2BB2A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_check
-- ----------------------------
DROP TABLE IF EXISTS `b_check`;
CREATE TABLE `b_check`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `score` decimal(19, 2) DEFAULT NULL,
  `check_unit_id` bigint(20) DEFAULT NULL,
  `check_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `check_template_id` bigint(20) DEFAULT NULL,
  `levels` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKE7E2F6EB77243690`(`check_unit_id`) USING BTREE,
  INDEX `FKE7E2F6EB7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKE7E2F6EB32092FD0`(`check_template_id`) USING BTREE,
  INDEX `FKE7E2F6EBAF455ABD`(`parent_id`) USING BTREE,
  INDEX `idx_bc_code`(`entity_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 504116 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_check_attachment
-- ----------------------------
DROP TABLE IF EXISTS `b_check_attachment`;
CREATE TABLE `b_check_attachment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attachmentId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `check_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK47AFC6F77D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_check_tmp_manager
-- ----------------------------
DROP TABLE IF EXISTS `b_check_tmp_manager`;
CREATE TABLE `b_check_tmp_manager`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `check_cycles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `effective` bit(1) DEFAULT NULL,
  `end_year` int(11) DEFAULT NULL,
  `joint_score` bit(1) DEFAULT NULL,
  `start_year` int(11) DEFAULT NULL,
  `check_template_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `org_type_id` bigint(20) DEFAULT NULL,
  `spec_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKF184BD31C34D5868`(`spec_id`) USING BTREE,
  INDEX `FKF184BD317D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKF184BD3132092FD0`(`check_template_id`) USING BTREE,
  INDEX `FKF184BD3169897B7D`(`org_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_check_unit
-- ----------------------------
DROP TABLE IF EXISTS `b_check_unit`;
CREATE TABLE `b_check_unit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK13FB36587D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `idx_bcu_code`(`entity_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107117 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_contract
-- ----------------------------
DROP TABLE IF EXISTS `b_contract`;
CREATE TABLE `b_contract`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accTe_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `con_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `con_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `preTe_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `signDate` datetime(0) DEFAULT NULL,
  `total_money` decimal(19, 2) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `con_type_id` bigint(20) DEFAULT NULL,
  `modifty_Date` datetime(0) DEFAULT NULL,
  `project_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `org_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `contract_info_id` bigint(20) DEFAULT NULL,
  `effectiveDate` datetime(0) DEFAULT NULL,
  `Professional_category_id` bigint(20) DEFAULT NULL,
  `effective_date` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK67B7904FA2112C73`(`con_type_id`) USING BTREE,
  INDEX `FK67B7904F5C31E216`(`project_id`) USING BTREE,
  INDEX `fk_contract_code`(`con_code`) USING BTREE,
  INDEX `FK67B7904F6C5DDD94`(`org_id`) USING BTREE,
  INDEX `FK67B7904FFACC8C35`(`contract_info_id`) USING BTREE,
  INDEX `FK67B7904FE742B140`(`Professional_category_id`) USING BTREE,
  CONSTRAINT `FK67B7904F6C5DDD94` FOREIGN KEY (`org_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK67B7904FE742B140` FOREIGN KEY (`Professional_category_id`) REFERENCES `b_professional` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK67B7904FFACC8C35` FOREIGN KEY (`contract_info_id`) REFERENCES `if_contract_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 103803 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_coo_deduction
-- ----------------------------
DROP TABLE IF EXISTS `b_coo_deduction`;
CREATE TABLE `b_coo_deduction`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `entity_dnCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kfstatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_cooperative_nature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total_ofkfei` decimal(19, 2) DEFAULT NULL,
  `total_ofykfei` decimal(19, 2) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `withholding_stage_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `rocess_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `feather_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `bkh_org_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `happen_date` datetime(0) DEFAULT NULL,
  `Order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5E3AD38CBDFFC894`(`bkh_org_id`) USING BTREE,
  INDEX `FK5E3AD38C967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK5E3AD38CB0B3D269`(`rocess_id`) USING BTREE,
  INDEX `FK5E3AD38C5C31E216`(`project_id`) USING BTREE,
  INDEX `FK5E3AD38C7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK5E3AD38CDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK5E3AD38CC837F73F`(`withholding_stage_id`) USING BTREE,
  INDEX `FK5E3AD38CF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK5E3AD38CFC515F4`(`feather_id`) USING BTREE,
  INDEX `FK5E3AD38CAB07848D`(`parent_id`) USING BTREE,
  INDEX `FK5E3AD38CA29A3F85`(`apply_org_id`) USING BTREE,
  INDEX `FK5E3AD38C774908F6`(`Order_id`) USING BTREE,
  CONSTRAINT `FK5E3AD38C5C31E216` FOREIGN KEY (`project_id`) REFERENCES `b_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5E3AD38C774908F6` FOREIGN KEY (`Order_id`) REFERENCES `b_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5E3AD38C7D3296C0` FOREIGN KEY (`entity_creator_id`) REFERENCES `s_privilege_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5E3AD38C967622C2` FOREIGN KEY (`apply_dept_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5E3AD38CA29A3F85` FOREIGN KEY (`apply_org_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5E3AD38CAB07848D` FOREIGN KEY (`parent_id`) REFERENCES `b_coo_deduction` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5E3AD38CB0B3D269` FOREIGN KEY (`rocess_id`) REFERENCES `b_process_partner_score` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5E3AD38CBDFFC894` FOREIGN KEY (`bkh_org_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5E3AD38CC837F73F` FOREIGN KEY (`withholding_stage_id`) REFERENCES `c_withholding_stage` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5E3AD38CDEFD0F5` FOREIGN KEY (`workflow_activity_id`) REFERENCES `w_workflow_activity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5E3AD38CF7258E38` FOREIGN KEY (`attachment_unit_id`) REFERENCES `b_attachment_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5E3AD38CFC515F4` FOREIGN KEY (`feather_id`) REFERENCES `b_coo_deduction` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 161 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_customize_userset
-- ----------------------------
DROP TABLE IF EXISTS `b_customize_userset`;
CREATE TABLE `b_customize_userset`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `current_user_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKDDD2CE1E7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKDDD2CE1E1EF3381F`(`current_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_data_archive
-- ----------------------------
DROP TABLE IF EXISTS `b_data_archive`;
CREATE TABLE `b_data_archive`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKA4C0C5EA967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKA4C0C5EA5C31E216`(`project_id`) USING BTREE,
  INDEX `FKA4C0C5EA7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKA4C0C5EADEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKA4C0C5EAF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKA4C0C5EAA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7242 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_delay_construct_m
-- ----------------------------
DROP TABLE IF EXISTS `b_delay_construct_m`;
CREATE TABLE `b_delay_construct_m`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `delay_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `delay_tache` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `schedule_unit_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `delay_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKE40B16AC967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKE40B16AC5C31E216`(`project_id`) USING BTREE,
  INDEX `FKE40B16AC7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKE40B16ACDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKE40B16ACF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKE40B16ACB312F34D`(`schedule_unit_id`) USING BTREE,
  INDEX `FKE40B16ACA29A3F85`(`apply_org_id`) USING BTREE,
  INDEX `FKE40B16AC7796FD59`(`delay_type_id`) USING BTREE,
  CONSTRAINT `FKE40B16AC7796FD59` FOREIGN KEY (`delay_type_id`) REFERENCES `c_delay_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4427 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_delay_project_m
-- ----------------------------
DROP TABLE IF EXISTS `b_delay_project_m`;
CREATE TABLE `b_delay_project_m`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `delay_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `delay_tache` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `proj_start_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `schedule_unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK27F8332E967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK27F8332E5C31E216`(`project_id`) USING BTREE,
  INDEX `FK27F8332E7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK27F8332EDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK27F8332EF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK27F8332EE777EA04`(`proj_start_id`) USING BTREE,
  INDEX `FK27F8332EB312F34D`(`schedule_unit_id`) USING BTREE,
  INDEX `FK27F8332EA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_design_adjust
-- ----------------------------
DROP TABLE IF EXISTS `b_design_adjust`;
CREATE TABLE `b_design_adjust`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `batch_no` int(11) DEFAULT NULL,
  `design_adjust_date` datetime(0) DEFAULT NULL,
  `design_adjust_invest` decimal(19, 2) DEFAULT NULL,
  `design_adjust_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `first_check_date` datetime(0) DEFAULT NULL,
  `is_send_oa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK17602013967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK176020135C31E216`(`project_id`) USING BTREE,
  INDEX `FK176020137D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK17602013DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK17602013F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK17602013A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_design_approval
-- ----------------------------
DROP TABLE IF EXISTS `b_design_approval`;
CREATE TABLE `b_design_approval`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `commissionUnit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `design_approval_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `design_invest` decimal(19, 2) DEFAULT NULL,
  `design_reply_date` datetime(0) DEFAULT NULL,
  `first_check_date` datetime(0) DEFAULT NULL,
  `is_send_oa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK44B43DC77E7642DE`(`schedule_id`) USING BTREE,
  INDEX `FK44B43DC7967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK44B43DC75C31E216`(`project_id`) USING BTREE,
  INDEX `FK44B43DC77D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK44B43DC7DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK44B43DC7F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK44B43DC7F60F6DFD`(`parent_id`) USING BTREE,
  INDEX `FK44B43DC7A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26637 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_design_audit
-- ----------------------------
DROP TABLE IF EXISTS `b_design_audit`;
CREATE TABLE `b_design_audit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `design_audit_date` datetime(0) DEFAULT NULL,
  `is_need_revise` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK746592D7967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK746592D77E7642DE`(`schedule_id`) USING BTREE,
  INDEX `FK746592D75C31E216`(`project_id`) USING BTREE,
  INDEX `FK746592D77D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK746592D7DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK746592D7F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK746592D7FB4EC87B`(`parent_id`) USING BTREE,
  INDEX `FK746592D7A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27144 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_design_build
-- ----------------------------
DROP TABLE IF EXISTS `b_design_build`;
CREATE TABLE `b_design_build`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `desBuget_invest` decimal(19, 2) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK7473BD6A7E7642DE`(`schedule_id`) USING BTREE,
  INDEX `FK7473BD6A967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK7473BD6A5C31E216`(`project_id`) USING BTREE,
  INDEX `FK7473BD6A7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK7473BD6ADEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK7473BD6AF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK7473BD6AFB5CF30E`(`parent_id`) USING BTREE,
  INDEX `FK7473BD6AA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 260 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_design_commission
-- ----------------------------
DROP TABLE IF EXISTS `b_design_commission`;
CREATE TABLE `b_design_commission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `is_receive` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `plan_finish_date` datetime(0) DEFAULT NULL,
  `refuse_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `head_user_id` bigint(20) DEFAULT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `interface_user_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `design_org_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKF268836F7E7642DE`(`schedule_id`) USING BTREE,
  INDEX `FKF268836F967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKF268836FA1384735`(`design_org_id`) USING BTREE,
  INDEX `FKF268836FF570F186`(`head_user_id`) USING BTREE,
  INDEX `FKF268836F5C31E216`(`project_id`) USING BTREE,
  INDEX `FKF268836F7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKF268836F1BF127DF`(`interface_user_id`) USING BTREE,
  INDEX `FKF268836FDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKF268836FF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKF268836F8ECC1C3D`(`parent_id`) USING BTREE,
  INDEX `FKF268836FA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19044 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_entrust_letter
-- ----------------------------
DROP TABLE IF EXISTS `b_entrust_letter`;
CREATE TABLE `b_entrust_letter`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entrust_org_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `old_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKC73F4493C348A084`(`entrust_org_id`) USING BTREE,
  INDEX `FKC73F44937D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6639 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_fea_audit
-- ----------------------------
DROP TABLE IF EXISTS `b_fea_audit`;
CREATE TABLE `b_fea_audit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `fea_audit_date` datetime(0) DEFAULT NULL,
  `fea_invest` decimal(19, 2) DEFAULT NULL,
  `is_core` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_need_revise` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK68CEC941967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK68CEC9417E7642DE`(`schedule_id`) USING BTREE,
  INDEX `FK68CEC9415C31E216`(`project_id`) USING BTREE,
  INDEX `FK68CEC9417D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK68CEC941DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK68CEC941F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK68CEC94121112E82`(`parent_id`) USING BTREE,
  INDEX `FK68CEC941A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7046 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_fea_build
-- ----------------------------
DROP TABLE IF EXISTS `b_fea_build`;
CREATE TABLE `b_fea_build`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `is_core` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK68DCF3D47E7642DE`(`schedule_id`) USING BTREE,
  INDEX `FK68DCF3D4967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK68DCF3D45C31E216`(`project_id`) USING BTREE,
  INDEX `FK68DCF3D47D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK68DCF3D4DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK68DCF3D4F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK68DCF3D4211F5915`(`parent_id`) USING BTREE,
  INDEX `FK68DCF3D4A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_fea_commission
-- ----------------------------
DROP TABLE IF EXISTS `b_fea_commission`;
CREATE TABLE `b_fea_commission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `is_receive` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `plan_finish_date` datetime(0) DEFAULT NULL,
  `refuse_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `head_user_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `fea_org_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `interface_user_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK3232BF453E62B8F1`(`fea_org_id`) USING BTREE,
  INDEX `FK3232BF45967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK3232BF45F570F186`(`head_user_id`) USING BTREE,
  INDEX `FK3232BF455C31E216`(`project_id`) USING BTREE,
  INDEX `FK3232BF457D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK3232BF45DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK3232BF451BF127DF`(`interface_user_id`) USING BTREE,
  INDEX `FK3232BF45F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK3232BF454B841EE0`(`parent_id`) USING BTREE,
  INDEX `FK3232BF45A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23400 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_fea_project_info_detail
-- ----------------------------
DROP TABLE IF EXISTS `b_fea_project_info_detail`;
CREATE TABLE `b_fea_project_info_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `company_leader` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `dept_manager` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fea_reply_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fea_reply_date` datetime(0) DEFAULT NULL,
  `fea_total_invest` decimal(19, 2) DEFAULT NULL,
  `manage_style` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `office_manager` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `project_manager` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fea_project_info_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK93E73FC27D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK93E73FC2417304E2`(`fea_project_info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_fea_project_info_his
-- ----------------------------
DROP TABLE IF EXISTS `b_fea_project_info_his`;
CREATE TABLE `b_fea_project_info_his`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `version_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKC8BE09C17D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_fea_reply
-- ----------------------------
DROP TABLE IF EXISTS `b_fea_reply`;
CREATE TABLE `b_fea_reply`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `first_date` datetime(0) DEFAULT NULL,
  `is_OA` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reply_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reply_date` datetime(0) DEFAULT NULL,
  `reply_invest` decimal(19, 2) DEFAULT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `managerorg_ids` bigint(20) DEFAULT NULL,
  `construct_org_ids` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK69B740507E7642DE`(`schedule_id`) USING BTREE,
  INDEX `FK69B74050967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK69B740505C31E216`(`project_id`) USING BTREE,
  INDEX `FK69B740507D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK69B74050DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK69B74050F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK69B7405085C504AF`(`parent_id`) USING BTREE,
  INDEX `FK69B74050A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25787 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_feedback_info
-- ----------------------------
DROP TABLE IF EXISTS `b_feedback_info`;
CREATE TABLE `b_feedback_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `is_send_msg` bit(1) DEFAULT NULL,
  `feedBack_watcher` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `universal_workOrder_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKC3121C0B967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKC3121C0BCD6EF4B0`(`universal_workOrder_id`) USING BTREE,
  INDEX `FKC3121C0B516685D8`(`feedBack_watcher`) USING BTREE,
  INDEX `FKC3121C0B7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKC3121C0BDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKC3121C0BF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKC3121C0BA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_feedback_list
-- ----------------------------
DROP TABLE IF EXISTS `b_feedback_list`;
CREATE TABLE `b_feedback_list`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `feedback_Time` datetime(0) DEFAULT NULL,
  `feedback_state` bit(1) DEFAULT NULL,
  `universal_WorkOrder_id` bigint(20) DEFAULT NULL,
  `recipient_id` bigint(20) DEFAULT NULL,
  `recipientOrg_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKC31367FBCD6EF4B0`(`universal_WorkOrder_id`) USING BTREE,
  INDEX `FKC31367FB640F8BD7`(`recipient_id`) USING BTREE,
  INDEX `FKC31367FBFFE1F52E`(`recipientOrg_id`) USING BTREE,
  INDEX `FKC31367FB615D98ED`(`recipientOrg_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_final_audit
-- ----------------------------
DROP TABLE IF EXISTS `b_final_audit`;
CREATE TABLE `b_final_audit`  (
  `audit_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `con_des_fee` decimal(19, 2) DEFAULT NULL,
  `is_adjust` bit(1) DEFAULT NULL,
  `adjust_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `con_handle_date` datetime(0) DEFAULT NULL,
  `is_con_handle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quartz_submit` bit(1) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `inner_auditor_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `problem_activity_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `old_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `audit_project_id` bigint(20) DEFAULT NULL,
  `send_date` datetime(0) DEFAULT NULL,
  `old_iscomplete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `old_node` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `old_userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKB8D82B75967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKB8D82B755C31E216`(`project_id`) USING BTREE,
  INDEX `FKB8D82B757ED3F932`(`audit_project_id`) USING BTREE,
  INDEX `FKB8D82B757D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKB8D82B75DC08E08E`(`old_id`) USING BTREE,
  INDEX `FKB8D82B75DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKB8D82B75F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKB8D82B755297B177`(`problem_activity_id`) USING BTREE,
  INDEX `FKB8D82B7574874E5B`(`inner_auditor_id`) USING BTREE,
  INDEX `FKB8D82B75A29A3F85`(`apply_org_id`) USING BTREE,
  INDEX `FKB8D82B7594F90614`(`old_userid`) USING BTREE,
  CONSTRAINT `FKB8D82B7594F90614` FOREIGN KEY (`old_userid`) REFERENCES `s_privilege_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2154 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_final_audit_check
-- ----------------------------
DROP TABLE IF EXISTS `b_final_audit_check`;
CREATE TABLE `b_final_audit_check`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `construct_check` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entrust_check` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `finance_check` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `plan_check` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `purchase_check` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `audit_project_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `audit_exec_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK37C547BE967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK37C547BE274B4902`(`audit_exec_id`) USING BTREE,
  INDEX `FK37C547BE7ED3F932`(`audit_project_id`) USING BTREE,
  INDEX `FK37C547BE7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK37C547BEDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK37C547BEF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK37C547BEA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_final_audit_exec_fee
-- ----------------------------
DROP TABLE IF EXISTS `b_final_audit_exec_fee`;
CREATE TABLE `b_final_audit_exec_fee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `audit_fee` decimal(19, 4) DEFAULT NULL,
  `final_audit_fee_id` bigint(20) DEFAULT NULL,
  `final_audit_exec_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK34D9DC62942515F9`(`final_audit_exec_id`) USING BTREE,
  INDEX `FK34D9DC6291D38A3B`(`final_audit_fee_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_final_audit_fee
-- ----------------------------
DROP TABLE IF EXISTS `b_final_audit_fee`;
CREATE TABLE `b_final_audit_fee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `charged_batch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_charged` bit(1) DEFAULT NULL,
  `total_score` decimal(19, 2) DEFAULT NULL,
  `score_unit_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `entrust_org_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKF16823BC967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKF16823BC4F3982BD`(`score_unit_id`) USING BTREE,
  INDEX `FKF16823BCC348A084`(`entrust_org_id`) USING BTREE,
  INDEX `FKF16823BC7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKF16823BCDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKF16823BCF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKF16823BCA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_final_audit_file
-- ----------------------------
DROP TABLE IF EXISTS `b_final_audit_file`;
CREATE TABLE `b_final_audit_file`  (
  `final_audit_id` bigint(20) NOT NULL,
  `file_type_id` bigint(20) NOT NULL,
  INDEX `FK3B9C64066E7203CC`(`file_type_id`) USING BTREE,
  INDEX `FK3B9C6406F2255B03`(`final_audit_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_final_check
-- ----------------------------
DROP TABLE IF EXISTS `b_final_check`;
CREATE TABLE `b_final_check`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `finalCheck_Date` datetime(0) DEFAULT NULL,
  `finalReportAmount` decimal(19, 2) DEFAULT NULL,
  `twoOrg_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `twoReceiveUser_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `trial_run_time` datetime(0) DEFAULT NULL,
  `trial_run_end_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKB8EE74A259BA41EE`(`twoReceiveUser_id`) USING BTREE,
  INDEX `FKB8EE74A2967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKB8EE74A2D4DFB6E0`(`twoOrg_id`) USING BTREE,
  INDEX `FKB8EE74A25C31E216`(`project_id`) USING BTREE,
  INDEX `FKB8EE74A27D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKB8EE74A2DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKB8EE74A2F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKB8EE74A2A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3266 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_final_verification
-- ----------------------------
DROP TABLE IF EXISTS `b_final_verification`;
CREATE TABLE `b_final_verification`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `finance_verify_result` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `is_send_audit_manager` bit(1) DEFAULT NULL,
  `JHBM_verify_result` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `org_manager_begin_date` datetime(0) DEFAULT NULL,
  `org_verify_explain` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `purchase_verify_result` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `verify_content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `audit_exec_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `JHBM_handler` bigint(20) DEFAULT NULL,
  `audit_project_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `purchase_handler` bigint(20) DEFAULT NULL,
  `handler` bigint(20) DEFAULT NULL,
  `org_handler` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `finance_handler` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKD2816541967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKD28165417ED3F932`(`audit_project_id`) USING BTREE,
  INDEX `FKD2816541DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKD2816541CDF2F7C5`(`org_handler`) USING BTREE,
  INDEX `FKD2816541274B4902`(`audit_exec_id`) USING BTREE,
  INDEX `FKD281654127E4E0E2`(`purchase_handler`) USING BTREE,
  INDEX `FKD28165417D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKD2816541F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKD2816541204415EA`(`JHBM_handler`) USING BTREE,
  INDEX `FKD281654141FCC620`(`handler`) USING BTREE,
  INDEX `FKD28165412B793E7A`(`parent_id`) USING BTREE,
  INDEX `FKD2816541983842BB`(`finance_handler`) USING BTREE,
  INDEX `FKD2816541A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 530 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_finalcheck_record
-- ----------------------------
DROP TABLE IF EXISTS `b_finalcheck_record`;
CREATE TABLE `b_finalcheck_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `finalSetupAmount` decimal(19, 2) DEFAULT NULL,
  `finalTotalAmount` decimal(19, 2) DEFAULT NULL,
  `group_Description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `firstCheck_Date` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKFC872181967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKFC8721815C31E216`(`project_id`) USING BTREE,
  INDEX `FKFC8721817D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKFC872181DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKFC872181F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKFC872181A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2379 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_first_check
-- ----------------------------
DROP TABLE IF EXISTS `b_first_check`;
CREATE TABLE `b_first_check`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `endWork_Description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `firstCheck_Date` datetime(0) DEFAULT NULL,
  `first_settlementAmount` decimal(19, 2) DEFAULT NULL,
  `setupAmount` decimal(19, 2) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `suigong_orgunit_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `construction_orgunit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `design_orgunit_id` bigint(20) DEFAULT NULL,
  `supervisor_orgunit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKFF07325CEE47A804`(`construction_orgunit_id`) USING BTREE,
  INDEX `FKFF07325C967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKFF07325CA624B10D`(`supervisor_orgunit_id`) USING BTREE,
  INDEX `FKFF07325C5C31E216`(`project_id`) USING BTREE,
  INDEX `FKFF07325C516E10F7`(`design_orgunit_id`) USING BTREE,
  INDEX `FKFF07325C7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKFF07325CDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKFF07325CF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKFF07325CE529410D`(`suigong_orgunit_id`) USING BTREE,
  INDEX `FKFF07325CA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2647 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_flow_test
-- ----------------------------
DROP TABLE IF EXISTS `b_flow_test`;
CREATE TABLE `b_flow_test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `party_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` date DEFAULT NULL,
  `entity_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_gen_quota_log
-- ----------------------------
DROP TABLE IF EXISTS `b_gen_quota_log`;
CREATE TABLE `b_gen_quota_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `begin_daytimes` datetime(0) DEFAULT NULL,
  `cycle_run_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `end_daytimes` datetime(0) DEFAULT NULL,
  `quota_count` bigint(20) DEFAULT NULL,
  `siphon_cycle_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK800839B115257867`(`siphon_cycle_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_history_addrecording
-- ----------------------------
DROP TABLE IF EXISTS `b_history_addrecording`;
CREATE TABLE `b_history_addrecording`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `is_feasibility` bit(1) DEFAULT NULL,
  `is_invitebid` bit(1) DEFAULT NULL,
  `point_names` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `template_gjname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `template_jhname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `project_type_id` bigint(20) DEFAULT NULL,
  `project_manager_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `schedule_unit_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `policy_type_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `spec_id` bigint(20) DEFAULT NULL,
  `construct_unit_id` bigint(20) DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK4D0D4BF8967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK4D0D4BF8E4A9CCF2`(`spec_id`) USING BTREE,
  INDEX `FK4D0D4BF8DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK4D0D4BF8B312F34D`(`schedule_unit_id`) USING BTREE,
  INDEX `FK4D0D4BF850F0F543`(`policy_type_id`) USING BTREE,
  INDEX `FK4D0D4BF8B28466A9`(`project_manager_id`) USING BTREE,
  INDEX `FK4D0D4BF85C31E216`(`project_id`) USING BTREE,
  INDEX `FK4D0D4BF86E43848D`(`construct_unit_id`) USING BTREE,
  INDEX `FK4D0D4BF87D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK4D0D4BF86498D809`(`project_type_id`) USING BTREE,
  INDEX `FK4D0D4BF8F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK4D0D4BF8AD6A15C3`(`manager_id`) USING BTREE,
  INDEX `FK4D0D4BF8A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10035 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_histroy_quota_issued
-- ----------------------------
DROP TABLE IF EXISTS `b_histroy_quota_issued`;
CREATE TABLE `b_histroy_quota_issued`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK6CE5F6B4967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK6CE5F6B47D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK6CE5F6B4DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK6CE5F6B4F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK6CE5F6B4A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_histroy_quota_response
-- ----------------------------
DROP TABLE IF EXISTS `b_histroy_quota_response`;
CREATE TABLE `b_histroy_quota_response`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `response_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `issued_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8D54BA0A967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK8D54BA0A7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK8D54BA0ADEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK8D54BA0A5165EE6C`(`issued_id`) USING BTREE,
  INDEX `FK8D54BA0AF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK8D54BA0AA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_honest_content
-- ----------------------------
DROP TABLE IF EXISTS `b_honest_content`;
CREATE TABLE `b_honest_content`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `control_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dept_responsible` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `implementation_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `leader_responsible` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `person_responsible` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `post_responsible` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `punishment_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `responsible_department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `scenes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `usable` bit(1) DEFAULT NULL,
  `visible` bit(1) DEFAULT NULL,
  `level_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK9D03A5966F0C1334`(`level_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_honest_content_level
-- ----------------------------
DROP TABLE IF EXISTS `b_honest_content_level`;
CREATE TABLE `b_honest_content_level`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `usable` bit(1) DEFAULT NULL,
  `visible` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_honest_flowtype
-- ----------------------------
DROP TABLE IF EXISTS `b_honest_flowtype`;
CREATE TABLE `b_honest_flowtype`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `depth` int(11) DEFAULT NULL,
  `leaf` bit(1) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `usable` bit(1) DEFAULT NULL,
  `visible` bit(1) DEFAULT NULL,
  `flow_type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `cfg_type_id` bigint(20) DEFAULT NULL,
  `root_id` bigint(20) DEFAULT NULL,
  `node_mode_id` bigint(20) DEFAULT NULL,
  `node_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK9E47FBEB423165B6`(`node_id`) USING BTREE,
  INDEX `FK9E47FBEBF7E69D93`(`root_id`) USING BTREE,
  INDEX `FK9E47FBEB7CFF04F3`(`flow_type_id`) USING BTREE,
  INDEX `FK9E47FBEB7B0597DA`(`node_mode_id`) USING BTREE,
  INDEX `FK9E47FBEBD6BEDCA8`(`cfg_type_id`) USING BTREE,
  INDEX `FK9E47FBEB210AA0CB`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_honest_flowtype_cfg_type
-- ----------------------------
DROP TABLE IF EXISTS `b_honest_flowtype_cfg_type`;
CREATE TABLE `b_honest_flowtype_cfg_type`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `usable` bit(1) DEFAULT NULL,
  `visible` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_honest_flowtype_node_mode
-- ----------------------------
DROP TABLE IF EXISTS `b_honest_flowtype_node_mode`;
CREATE TABLE `b_honest_flowtype_node_mode`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_honest_ft_content_check_info
-- ----------------------------
DROP TABLE IF EXISTS `b_honest_ft_content_check_info`;
CREATE TABLE `b_honest_ft_content_check_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `checked` bit(1) DEFAULT NULL,
  `click_num` int(11) DEFAULT NULL,
  `check_unit_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK1CFADE791DCB4353`(`check_unit_id`) USING BTREE,
  INDEX `FK1CFADE79FEC5CE5`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_honest_ft_content_check_unit
-- ----------------------------
DROP TABLE IF EXISTS `b_honest_ft_content_check_unit`;
CREATE TABLE `b_honest_ft_content_check_unit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `honest_relation_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `node_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK1D00534F423165B6`(`node_id`) USING BTREE,
  INDEX `FK1D00534FDB9547B2`(`honest_relation_id`) USING BTREE,
  INDEX `FK1D00534FDEFD0F5`(`workflow_activity_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_honest_ft_content_relation
-- ----------------------------
DROP TABLE IF EXISTS `b_honest_ft_content_relation`;
CREATE TABLE `b_honest_ft_content_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sort_number` int(11) DEFAULT NULL,
  `usable` bit(1) DEFAULT NULL,
  `visible` bit(1) DEFAULT NULL,
  `honest_content_id` bigint(20) DEFAULT NULL,
  `honest_flowtype_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKB3C67F01D58EEA7`(`honest_content_id`) USING BTREE,
  INDEX `FKB3C67F025402ED`(`honest_flowtype_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_infoview_build
-- ----------------------------
DROP TABLE IF EXISTS `b_infoview_build`;
CREATE TABLE `b_infoview_build`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `js_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sg_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sj_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `syx_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `wg_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ym_date` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_interface_info
-- ----------------------------
DROP TABLE IF EXISTS `b_interface_info`;
CREATE TABLE `b_interface_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `process_DATE` datetime(0) DEFAULT NULL,
  `current_Page` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `identifier_Code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INTERFACE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INTERFACE_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_FileLog` bit(1) DEFAULT NULL,
  `is_Open` bit(1) DEFAULT NULL,
  `LAST_EFFECT_DATE` datetime(0) DEFAULT NULL,
  `LOG_PATH` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `METHOD_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `page_Size` bigint(20) DEFAULT NULL,
  `SERVER_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SYSTEM_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total_Page` bigint(20) DEFAULT NULL,
  `total_Record` bigint(20) DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_PWD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_interface_outliers
-- ----------------------------
DROP TABLE IF EXISTS `b_interface_outliers`;
CREATE TABLE `b_interface_outliers`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attribute2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attribute3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attribute4` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attribute5` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `business_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `exception_specification` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `outliers_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RUN_DATE` datetime(0) DEFAULT NULL,
  `transfer_status` bigint(20) DEFAULT NULL,
  `INTERFACE_RUN_LOG_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK73EABBBE8E95B0DA`(`INTERFACE_RUN_LOG_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_interface_run_log
-- ----------------------------
DROP TABLE IF EXISTS `b_interface_run_log`;
CREATE TABLE `b_interface_run_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `DATA_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARAM_DATE_FROM` datetime(0) DEFAULT NULL,
  `PARAM_DATE_TO` datetime(0) DEFAULT NULL,
  `PARAMENTER` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `RESULT` bigint(20) DEFAULT NULL,
  `RESULT_INFO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RUN_DATE` datetime(0) DEFAULT NULL,
  `INTERFACE_INFO_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK57D17F6D29BEEB65`(`INTERFACE_INFO_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2018 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_member_unit
-- ----------------------------
DROP TABLE IF EXISTS `b_member_unit`;
CREATE TABLE `b_member_unit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK7B9473AC7D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_message
-- ----------------------------
DROP TABLE IF EXISTS `b_message`;
CREATE TABLE `b_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `createDate` datetime(0) DEFAULT NULL,
  `handleDate` datetime(0) DEFAULT NULL,
  `messageType` int(11) DEFAULT NULL,
  `source_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `acceptor_id` bigint(20) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK87AD252A3F0B13C5`(`acceptor_id`) USING BTREE,
  INDEX `FK87AD252A6AE860E4`(`creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 272 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_my_test
-- ----------------------------
DROP TABLE IF EXISTS `b_my_test`;
CREATE TABLE `b_my_test`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `invest` decimal(19, 2) DEFAULT NULL,
  `plan_year` int(11) DEFAULT NULL,
  `testDate` datetime(0) DEFAULT NULL,
  `total_invest` decimal(19, 2) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKA8B4C0686C5DDD94`(`org_id`) USING BTREE,
  INDEX `FKA8B4C068967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKA8B4C0687D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKA8B4C068DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKA8B4C068F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKA8B4C068CDD3C0BB`(`type_id`) USING BTREE,
  INDEX `FKA8B4C068A29A3F85`(`apply_org_id`) USING BTREE,
  CONSTRAINT `FKA8B4C0686C5DDD94` FOREIGN KEY (`org_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKA8B4C0687D3296C0` FOREIGN KEY (`entity_creator_id`) REFERENCES `s_privilege_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKA8B4C068967622C2` FOREIGN KEY (`apply_dept_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKA8B4C068A29A3F85` FOREIGN KEY (`apply_org_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKA8B4C068CDD3C0BB` FOREIGN KEY (`type_id`) REFERENCES `c_my_test_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKA8B4C068DEFD0F5` FOREIGN KEY (`workflow_activity_id`) REFERENCES `w_workflow_activity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKA8B4C068F7258E38` FOREIGN KEY (`attachment_unit_id`) REFERENCES `b_attachment_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_office_sc_management
-- ----------------------------
DROP TABLE IF EXISTS `b_office_sc_management`;
CREATE TABLE `b_office_sc_management`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `contract_name` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `contract_year` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `discount_rate` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `fee_scale_code` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `office` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `scoring` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `type` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000039 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_order
-- ----------------------------
DROP TABLE IF EXISTS `b_order`;
CREATE TABLE `b_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `money` decimal(19, 2) DEFAULT NULL,
  `order_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contract_id` bigint(20) DEFAULT NULL,
  `contract_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contract_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `modifty_Date` datetime(0) DEFAULT NULL,
  `project_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `org_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `org_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `organization_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `expenditure_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `allocation_data` decimal(19, 2) DEFAULT NULL,
  `contract_id1` bigint(20) DEFAULT 100000,
  `organization_id1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKE89099315C31E216`(`project_id`) USING BTREE,
  INDEX `FKE8909931FD356CFE`(`contract_id`) USING BTREE,
  INDEX `idx_order_order_code`(`order_code`) USING BTREE,
  INDEX `idx_order_orgaid`(`organization_id1`) USING BTREE,
  INDEX `idx_order_conid1`(`contract_id1`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1361306 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_org_detail
-- ----------------------------
DROP TABLE IF EXISTS `b_org_detail`;
CREATE TABLE `b_org_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `actual_date` datetime(0) DEFAULT NULL,
  `firstContract_Date` datetime(0) DEFAULT NULL,
  `pre_date` datetime(0) DEFAULT NULL,
  `contract_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `org_unit_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `supervisor_org_id` bigint(20) DEFAULT NULL,
  `suigong_org_id` bigint(20) DEFAULT NULL,
  `design_org_id` bigint(20) DEFAULT NULL,
  `construction_org_id` bigint(20) DEFAULT NULL,
  `orgManager_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK42A442096C5DDD94`(`org_id`) USING BTREE,
  INDEX `FK42A44209A1384735`(`design_org_id`) USING BTREE,
  INDEX `FK42A44209FD356CFE`(`contract_id`) USING BTREE,
  INDEX `FK42A442096D5977A7`(`orgManager_id`) USING BTREE,
  INDEX `FK42A44209EB3E624B`(`supervisor_org_id`) USING BTREE,
  INDEX `FK42A44209FEC5CE5`(`user_id`) USING BTREE,
  INDEX `FK42A442097D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK42A44209AD696CC2`(`construction_org_id`) USING BTREE,
  INDEX `FK42A4420930AF24B`(`suigong_org_id`) USING BTREE,
  INDEX `FK42A44209171F08DF`(`org_unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 409266 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_org_unit
-- ----------------------------
DROP TABLE IF EXISTS `b_org_unit`;
CREATE TABLE `b_org_unit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKD7E0113C7D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 323635 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_partner_eva
-- ----------------------------
DROP TABLE IF EXISTS `b_partner_eva`;
CREATE TABLE `b_partner_eva`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date_end` datetime(0) DEFAULT NULL,
  `date_start` datetime(0) DEFAULT NULL,
  `eva_create_date` datetime(0) DEFAULT NULL,
  `eva_create_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `score` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `partner_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `partner_org_id` bigint(20) DEFAULT NULL,
  `eva_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK6332555CDC0C8CEB`(`partner_org_id`) USING BTREE,
  INDEX `FK6332555C7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK6332555CD3BF4265`(`partner_id`) USING BTREE,
  CONSTRAINT `FK6332555C7D3296C0` FOREIGN KEY (`entity_creator_id`) REFERENCES `s_privilege_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK6332555CD3BF4265` FOREIGN KEY (`partner_id`) REFERENCES `c_partner` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK6332555CDC0C8CEB` FOREIGN KEY (`partner_org_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_partner_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `b_partner_evaluate`;
CREATE TABLE `b_partner_evaluate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `end_date` datetime(0) DEFAULT NULL,
  `is_show` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `start_date` datetime(0) DEFAULT NULL,
  `start_score` decimal(19, 2) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `org_type_id` bigint(20) DEFAULT NULL,
  `spec_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK7746D46D967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK7746D46DC34D5868`(`spec_id`) USING BTREE,
  INDEX `FK7746D46D7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK7746D46DDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK7746D46DF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK7746D46D69897B7D`(`org_type_id`) USING BTREE,
  INDEX `FK7746D46DA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_partner_evaluate_detail
-- ----------------------------
DROP TABLE IF EXISTS `b_partner_evaluate_detail`;
CREATE TABLE `b_partner_evaluate_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `eva_detail_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `evaluate_score` decimal(19, 2) DEFAULT NULL,
  `is_merge` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `order_invest` decimal(19, 2) DEFAULT NULL,
  `order_percent` decimal(19, 2) DEFAULT NULL,
  `org_detail_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_score` decimal(19, 2) DEFAULT NULL,
  `scope_score` decimal(19, 2) DEFAULT NULL,
  `partner_evaluate_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `partner_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKF3DCDC63DC0C8CEB`(`partner_org_id`) USING BTREE,
  INDEX `FKF3DCDC637D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKF3DCDC639CF9E34F`(`partner_evaluate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_partner_information
-- ----------------------------
DROP TABLE IF EXISTS `b_partner_information`;
CREATE TABLE `b_partner_information`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_for_order` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contract_classification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `department_room` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `frame_contract_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `investment_subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_branch_company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_sign_total` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `proportion_contract_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_partner_project_detail
-- ----------------------------
DROP TABLE IF EXISTS `b_partner_project_detail`;
CREATE TABLE `b_partner_project_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_checked` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_invest` decimal(19, 2) DEFAULT NULL,
  `score` decimal(19, 2) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `partner_evaluate_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK2D3EC50B5C31E216`(`project_id`) USING BTREE,
  INDEX `FK2D3EC50B7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK2D3EC50B9CF9E34F`(`partner_evaluate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_partner_score
-- ----------------------------
DROP TABLE IF EXISTS `b_partner_score`;
CREATE TABLE `b_partner_score`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `pingfeng_typeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK6272473E967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK6272473E5C31E216`(`project_id`) USING BTREE,
  INDEX `FK6272473E7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK6272473EDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK6272473EF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK6272473EA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14757 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_partner_star
-- ----------------------------
DROP TABLE IF EXISTS `b_partner_star`;
CREATE TABLE `b_partner_star`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `star_counts` int(11) DEFAULT NULL,
  `star_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK32D3826967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK32D38267D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK32D3826DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK32D3826F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK32D3826D70EFC35`(`parent_id`) USING BTREE,
  INDEX `FK32D3826A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_partner_user_aptitude
-- ----------------------------
DROP TABLE IF EXISTS `b_partner_user_aptitude`;
CREATE TABLE `b_partner_user_aptitude`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `aptitude_Date` datetime(0) DEFAULT NULL,
  `aptitude_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `aptitude_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `aptitude_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `expiry_date` datetime(0) DEFAULT NULL,
  `partner_user_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `expiry_date_end` datetime(0) DEFAULT NULL,
  `expiry_date_start` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKE612E46D90B5A76`(`partner_user_id`) USING BTREE,
  INDEX `FKE612E467D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_partner_user_reward
-- ----------------------------
DROP TABLE IF EXISTS `b_partner_user_reward`;
CREATE TABLE `b_partner_user_reward`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reward_date` datetime(0) DEFAULT NULL,
  `reward_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `partner_user_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK1DC16DCFD90B5A76`(`partner_user_id`) USING BTREE,
  INDEX `FK1DC16DCF7D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_partner_user_train
-- ----------------------------
DROP TABLE IF EXISTS `b_partner_user_train`;
CREATE TABLE `b_partner_user_train`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `end_date` datetime(0) DEFAULT NULL,
  `start_date` datetime(0) DEFAULT NULL,
  `train_day` decimal(19, 2) DEFAULT NULL,
  `train_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `train_score` decimal(19, 2) DEFAULT NULL,
  `partner_user_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK1177F68D90B5A76`(`partner_user_id`) USING BTREE,
  INDEX `FK1177F687D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_partner_week_report
-- ----------------------------
DROP TABLE IF EXISTS `b_partner_week_report`;
CREATE TABLE `b_partner_week_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `end_date` datetime(0) DEFAULT NULL,
  `informed_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `manage_require` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `periods` int(11) DEFAULT NULL,
  `start_date` datetime(0) DEFAULT NULL,
  `year` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `org_type_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK145B6F8B7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK145B6F8BAB4DB5EB`(`parent_id`) USING BTREE,
  INDEX `FK145B6F8B69897B7D`(`org_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_partners_associated
-- ----------------------------
DROP TABLE IF EXISTS `b_partners_associated`;
CREATE TABLE `b_partners_associated`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `suigong_orgunit_id` bigint(20) DEFAULT NULL,
  `supervisor_orgunit_id` bigint(20) DEFAULT NULL,
  `construction_orgunit_id` bigint(20) DEFAULT NULL,
  `design_orgunit_id` bigint(20) DEFAULT NULL,
  `orgunit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK7769EDBDEE47A804`(`construction_orgunit_id`) USING BTREE,
  INDEX `FK7769EDBD49135FD6`(`orgunit_id`) USING BTREE,
  INDEX `FK7769EDBD967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK7769EDBDA624B10D`(`supervisor_orgunit_id`) USING BTREE,
  INDEX `FK7769EDBD5C31E216`(`project_id`) USING BTREE,
  INDEX `FK7769EDBD516E10F7`(`design_orgunit_id`) USING BTREE,
  INDEX `FK7769EDBD7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK7769EDBDDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK7769EDBDF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK7769EDBDE529410D`(`suigong_orgunit_id`) USING BTREE,
  INDEX `FK7769EDBDA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 777778 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_partners_change
-- ----------------------------
DROP TABLE IF EXISTS `b_partners_change`;
CREATE TABLE `b_partners_change`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `orgunit_id` bigint(20) DEFAULT NULL,
  `old_orgunit_id` bigint(20) DEFAULT NULL,
  `old_design_unit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `old_supervisor_unit_id` bigint(20) DEFAULT NULL,
  `design_orgunit_id` bigint(20) DEFAULT NULL,
  `supervisor_orgunit_id` bigint(20) DEFAULT NULL,
  `construction_orgunit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `old_suigong_unit_id` bigint(20) DEFAULT NULL,
  `old_construction_unit_id` bigint(20) DEFAULT NULL,
  `suigong_orgunit_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8A2E1FE7EE47A804`(`construction_orgunit_id`) USING BTREE,
  INDEX `FK8A2E1FE7A9ED6ED1`(`old_design_unit_id`) USING BTREE,
  INDEX `FK8A2E1FE749135FD6`(`orgunit_id`) USING BTREE,
  INDEX `FK8A2E1FE7967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK8A2E1FE7A624B10D`(`supervisor_orgunit_id`) USING BTREE,
  INDEX `FK8A2E1FE7DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK8A2E1FE7E529410D`(`suigong_orgunit_id`) USING BTREE,
  INDEX `FK8A2E1FE73628C8E4`(`old_construction_unit_id`) USING BTREE,
  INDEX `FK8A2E1FE71C062F4B`(`old_suigong_unit_id`) USING BTREE,
  INDEX `FK8A2E1FE75C31E216`(`project_id`) USING BTREE,
  INDEX `FK8A2E1FE7516E10F7`(`design_orgunit_id`) USING BTREE,
  INDEX `FK8A2E1FE77D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK8A2E1FE7F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK8A2E1FE719C778EE`(`old_orgunit_id`) USING BTREE,
  INDEX `FK8A2E1FE7A29A3F85`(`apply_org_id`) USING BTREE,
  INDEX `FK8A2E1FE75A4E6A7B`(`old_supervisor_unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 334 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_pd_detailed
-- ----------------------------
DROP TABLE IF EXISTS `b_pd_detailed`;
CREATE TABLE `b_pd_detailed`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deduction_data` datetime(0) DEFAULT NULL,
  `psd_type_id` bigint(255) DEFAULT NULL,
  `deduction_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mis_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total_fei` decimal(19, 2) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `psd_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `psd_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK1582A5E5C31E216`(`project_id`) USING BTREE,
  INDEX `FK1582A5E7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK1582A5E76D83DDA`(`psd_id`) USING BTREE,
  INDEX `FK1582A5E1CA2BCD2`(`psd_org_id`) USING BTREE,
  CONSTRAINT `FK1582A5E1CA2BCD2` FOREIGN KEY (`psd_org_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK1582A5E5C31E216` FOREIGN KEY (`project_id`) REFERENCES `b_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK1582A5E76D83DDA` FOREIGN KEY (`psd_id`) REFERENCES `b_process_deduction` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK1582A5E7D3296C0` FOREIGN KEY (`entity_creator_id`) REFERENCES `s_privilege_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK1582A5E7D3296C1` FOREIGN KEY (`psd_org_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_point_down_detail
-- ----------------------------
DROP TABLE IF EXISTS `b_point_down_detail`;
CREATE TABLE `b_point_down_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_agree` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kf_desc` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kfei` decimal(19, 2) DEFAULT NULL,
  `kfen` decimal(19, 2) DEFAULT NULL,
  `Opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pspScore_id` bigint(20) DEFAULT NULL,
  `old_koufens` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK921C07C219B7AEC3`(`pspScore_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_pool_bear
-- ----------------------------
DROP TABLE IF EXISTS `b_pool_bear`;
CREATE TABLE `b_pool_bear`  (
  `pool_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `business_id` bigint(20) DEFAULT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK3CE84E5A967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK3CE84E5A7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK3CE84E5ADEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK3CE84E5AF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK3CE84E5AA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_problem_activity
-- ----------------------------
DROP TABLE IF EXISTS `b_problem_activity`;
CREATE TABLE `b_problem_activity`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `audit_type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `back_content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `back_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `construct_handle_begin_date` datetime(0) DEFAULT NULL,
  `construct_handle_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `audit_project_id` bigint(20) DEFAULT NULL,
  `audit_exec_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKC2DDD6EC1718A0AF`(`audit_exec_id`) USING BTREE,
  INDEX `FKC2DDD6EC967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKC2DDD6EC87C1E665`(`audit_project_id`) USING BTREE,
  INDEX `FKC2DDD6EC7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKC2DDD6ECDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKC2DDD6ECF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKC2DDD6ECBFE3C79C`(`parent_id`) USING BTREE,
  INDEX `FKC2DDD6ECA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 754 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_process_deduction
-- ----------------------------
DROP TABLE IF EXISTS `b_process_deduction`;
CREATE TABLE `b_process_deduction`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `need_fei` decimal(19, 2) DEFAULT NULL,
  `over_fei` decimal(19, 2) DEFAULT NULL,
  `total_fei` decimal(19, 2) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `psd_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK2FD80FF81CA2BCD2`(`psd_org_id`) USING BTREE,
  INDEX `FK2FD80FF8967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK2FD80FF85C31E216`(`project_id`) USING BTREE,
  INDEX `FK2FD80FF87D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK2FD80FF8DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK2FD80FF8F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK2FD80FF8A29A3F85`(`apply_org_id`) USING BTREE,
  CONSTRAINT `FK2FD80FF81CA2BCD2` FOREIGN KEY (`psd_org_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK2FD80FF85C31E216` FOREIGN KEY (`project_id`) REFERENCES `b_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK2FD80FF87D3296C0` FOREIGN KEY (`entity_creator_id`) REFERENCES `s_privilege_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK2FD80FF8967622C2` FOREIGN KEY (`apply_dept_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK2FD80FF8A29A3F85` FOREIGN KEY (`apply_org_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK2FD80FF8DEFD0F5` FOREIGN KEY (`workflow_activity_id`) REFERENCES `w_workflow_activity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK2FD80FF8F7258E38` FOREIGN KEY (`attachment_unit_id`) REFERENCES `b_attachment_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_process_partner_score
-- ----------------------------
DROP TABLE IF EXISTS `b_process_partner_score`;
CREATE TABLE `b_process_partner_score`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `total_ofkfei` decimal(19, 2) DEFAULT NULL,
  `total_ofkfen` decimal(19, 2) DEFAULT NULL,
  `bkh_org_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `is_auto_submit` bit(1) DEFAULT NULL,
  `score_eventType_id` bigint(20) DEFAULT NULL,
  `old_fei` decimal(19, 2) DEFAULT NULL,
  `old_fen` decimal(19, 2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKAE74366E967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKAE74366EBDFFC894`(`bkh_org_id`) USING BTREE,
  INDEX `FKAE74366E5C31E216`(`project_id`) USING BTREE,
  INDEX `FKAE74366E7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKAE74366EDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKAE74366E29C132AA`(`score_eventType_id`) USING BTREE,
  INDEX `FKAE74366EF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKAE74366EA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27315 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_product_info
-- ----------------------------
DROP TABLE IF EXISTS `b_product_info`;
CREATE TABLE `b_product_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `monad` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `requireCount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `requireDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `purchaseSubmit_id` bigint(20) DEFAULT NULL,
  `HANDLE_PERSON` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lis_Status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `old_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `material_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `material_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK35FAA6BB7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK35FAA6BB8FA407D3`(`purchaseSubmit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16562 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_professional
-- ----------------------------
DROP TABLE IF EXISTS `b_professional`;
CREATE TABLE `b_professional`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_proj_implem_plan
-- ----------------------------
DROP TABLE IF EXISTS `b_proj_implem_plan`;
CREATE TABLE `b_proj_implem_plan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `template_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `schedule_unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKD306AA9B967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKD306AA9B5C31E216`(`project_id`) USING BTREE,
  INDEX `FKD306AA9B7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKD306AA9BDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKD306AA9BF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKD306AA9BB312F34D`(`schedule_unit_id`) USING BTREE,
  INDEX `FKD306AA9BA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8131 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_proj_info
-- ----------------------------
DROP TABLE IF EXISTS `b_proj_info`;
CREATE TABLE `b_proj_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `assess_template_id1` bigint(20) DEFAULT NULL,
  `assess_template_id2` bigint(20) DEFAULT NULL,
  `construct_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_feasibility` bit(1) DEFAULT NULL,
  `is_invitebid` bit(1) DEFAULT NULL,
  `is_key_project` bit(1) DEFAULT NULL,
  `is_real_estate` bit(1) DEFAULT NULL,
  `satisfied_years` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_date` datetime(0) DEFAULT NULL,
  `plan_type_id` bigint(20) DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  `project_manager_id` bigint(20) DEFAULT NULL,
  `plan_template_id` bigint(20) DEFAULT NULL,
  `policy_type_id` bigint(20) DEFAULT NULL,
  `project_type_id` bigint(20) DEFAULT NULL,
  `spec_id` bigint(20) DEFAULT NULL,
  `construct_org_id` bigint(20) DEFAULT NULL,
  `capital_type_id` bigint(20) DEFAULT NULL,
  `construct_template_id` bigint(20) DEFAULT NULL,
  `construct_manager_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `construct_type_id` bigint(20) DEFAULT NULL,
  `managerorg_id` bigint(20) DEFAULT NULL,
  `spec_manager_id` bigint(20) DEFAULT NULL,
  `interface_manager_id` bigint(20) DEFAULT NULL,
  `types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contract_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contract_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `warn_template_id` bigint(20) DEFAULT NULL,
  `is_prealarm` bit(1) DEFAULT NULL,
  `engineering_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK712574B3E4A9CCF2`(`spec_id`) USING BTREE,
  INDEX `FK712574B3CCA7374D`(`construct_template_id`) USING BTREE,
  INDEX `FK712574B350F0F543`(`policy_type_id`) USING BTREE,
  INDEX `FK712574B39A9B8D85`(`construct_type_id`) USING BTREE,
  INDEX `FK712574B38F120B2B`(`construct_manager_id`) USING BTREE,
  INDEX `FK712574B3B28466A9`(`project_manager_id`) USING BTREE,
  INDEX `FK712574B363C44627`(`capital_type_id`) USING BTREE,
  INDEX `FK712574B3DA1817B1`(`plan_type_id`) USING BTREE,
  INDEX `FK712574B3A075B781`(`managerorg_id`) USING BTREE,
  INDEX `FK712574B34F2AB089`(`interface_manager_id`) USING BTREE,
  INDEX `FK712574B33045E0C7`(`spec_manager_id`) USING BTREE,
  INDEX `FK712574B37D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK712574B36498D809`(`project_type_id`) USING BTREE,
  INDEX `FK712574B3FDF4F39F`(`plan_template_id`) USING BTREE,
  INDEX `fk_projinfo_warn_template`(`warn_template_id`) USING BTREE,
  INDEX `FK712574B3AD6A15C3`(`manager_id`) USING BTREE,
  INDEX `FK712574B349E8C6FC`(`construct_org_id`) USING BTREE,
  INDEX `FK712574B3CA89DAFD`(`engineering_type_id`) USING BTREE,
  CONSTRAINT `FK712574B3CA89DAFD` FOREIGN KEY (`engineering_type_id`) REFERENCES `c_engineering_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33898 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_proj_memberchange
-- ----------------------------
DROP TABLE IF EXISTS `b_proj_memberchange`;
CREATE TABLE `b_proj_memberchange`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `interface_manager_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `construct_manager_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `project_manager_id` bigint(20) DEFAULT NULL,
  `spec_manager_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK3628E9EF8F120B2B`(`construct_manager_id`) USING BTREE,
  INDEX `FK3628E9EFB28466A9`(`project_manager_id`) USING BTREE,
  INDEX `FK3628E9EF967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK3628E9EF5C31E216`(`project_id`) USING BTREE,
  INDEX `FK3628E9EF4F2AB089`(`interface_manager_id`) USING BTREE,
  INDEX `FK3628E9EF3045E0C7`(`spec_manager_id`) USING BTREE,
  INDEX `FK3628E9EF7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK3628E9EFDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK3628E9EFAD6A15C3`(`manager_id`) USING BTREE,
  INDEX `FK3628E9EFF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK3628E9EFA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project
-- ----------------------------
DROP TABLE IF EXISTS `b_project`;
CREATE TABLE `b_project`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `capital_proj_id` bigint(20) DEFAULT NULL,
  `supervisor_orgunit_id` bigint(20) DEFAULT NULL,
  `schedule_unit_id` bigint(20) DEFAULT NULL,
  `construction_orgunit_id` bigint(20) DEFAULT NULL,
  `fea_orgunit_id` bigint(20) DEFAULT NULL,
  `schedule_point_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `construct_unit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `suigong_orgunit_id` bigint(20) DEFAULT NULL,
  `design_orgunit_id` bigint(20) DEFAULT NULL,
  `proj_info_id` bigint(20) DEFAULT NULL,
  `orgunit_id` bigint(20) DEFAULT NULL,
  `schedule_points` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `old_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `member_unit_id` bigint(20) DEFAULT NULL,
  `tempS` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `weight_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK3C52703CEE47A804`(`construction_orgunit_id`) USING BTREE,
  INDEX `FK3C52703C49135FD6`(`orgunit_id`) USING BTREE,
  INDEX `FK3C52703CA624B10D`(`supervisor_orgunit_id`) USING BTREE,
  INDEX `FK3C52703C8C5144B3`(`fea_orgunit_id`) USING BTREE,
  INDEX `FK3C52703CE529410D`(`suigong_orgunit_id`) USING BTREE,
  INDEX `FK3C52703CB312F34D`(`schedule_unit_id`) USING BTREE,
  INDEX `FK3C52703CC2E207C7`(`schedule_point_id`) USING BTREE,
  INDEX `FK3C52703C9D3747D3`(`member_unit_id`) USING BTREE,
  INDEX `fk_proj_proj_capital`(`capital_proj_id`) USING BTREE,
  INDEX `FK3C52703C6E43848D`(`construct_unit_id`) USING BTREE,
  INDEX `FK3C52703C516E10F7`(`design_orgunit_id`) USING BTREE,
  INDEX `FK3C52703C7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK3C52703CF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `fk_proj_proj_info`(`proj_info_id`) USING BTREE,
  INDEX `fk_proj_code`(`entity_code`) USING BTREE,
  INDEX `idx_project_oldid`(`old_id`) USING BTREE,
  INDEX `FK3C52703C3A029D86`(`weight_type_id`) USING BTREE,
  CONSTRAINT `FK3C52703C3A029D86` FOREIGN KEY (`weight_type_id`) REFERENCES `c_weight_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17378 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_adjust
-- ----------------------------
DROP TABLE IF EXISTS `b_project_adjust`;
CREATE TABLE `b_project_adjust`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `adjust_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `adjust_date` datetime(0) DEFAULT NULL,
  `first_date` datetime(0) DEFAULT NULL,
  `is_OA` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `new_replyInvest` decimal(19, 2) DEFAULT NULL,
  `old_replyInvest` decimal(19, 2) DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKCC7F48F2967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKCC7F48F25C31E216`(`project_id`) USING BTREE,
  INDEX `FKCC7F48F27D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKCC7F48F2DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKCC7F48F2F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKCC7F48F2A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_code
-- ----------------------------
DROP TABLE IF EXISTS `b_project_code`;
CREATE TABLE `b_project_code`  (
  `project_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_completed
-- ----------------------------
DROP TABLE IF EXISTS `b_project_completed`;
CREATE TABLE `b_project_completed`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `reportIssue_Date` datetime(0) DEFAULT NULL,
  `design_orgunit_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `construction_orgunit_id` bigint(20) DEFAULT NULL,
  `suigong_orgunit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `supervisor_orgunit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKC5424608EE47A804`(`construction_orgunit_id`) USING BTREE,
  INDEX `FKC5424608967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKC5424608A624B10D`(`supervisor_orgunit_id`) USING BTREE,
  INDEX `FKC54246085C31E216`(`project_id`) USING BTREE,
  INDEX `FKC5424608516E10F7`(`design_orgunit_id`) USING BTREE,
  INDEX `FKC54246087D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKC5424608DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKC5424608F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKC5424608E529410D`(`suigong_orgunit_id`) USING BTREE,
  INDEX `FKC5424608A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3616 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_completed_project
-- ----------------------------
DROP TABLE IF EXISTS `b_project_completed_project`;
CREATE TABLE `b_project_completed_project`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `reportIssue_Date` datetime(0) DEFAULT NULL,
  `design_orgunit_id` bigint(20) DEFAULT NULL,
  `suigong_orgunit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `construction_orgunit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `supervisor_orgunit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK35DFAFE2EE47A804`(`construction_orgunit_id`) USING BTREE,
  INDEX `FK35DFAFE2967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK35DFAFE2A624B10D`(`supervisor_orgunit_id`) USING BTREE,
  INDEX `FK35DFAFE25C31E216`(`project_id`) USING BTREE,
  INDEX `FK35DFAFE27D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK35DFAFE2516E10F7`(`design_orgunit_id`) USING BTREE,
  INDEX `FK35DFAFE2DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK35DFAFE2F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK35DFAFE2E529410D`(`suigong_orgunit_id`) USING BTREE,
  INDEX `FK35DFAFE2A29A3F85`(`apply_org_id`) USING BTREE,
  CONSTRAINT `FK35DFAFE2516E10F7` FOREIGN KEY (`design_orgunit_id`) REFERENCES `b_org_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK35DFAFE25C31E216` FOREIGN KEY (`project_id`) REFERENCES `b_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK35DFAFE27D3296C0` FOREIGN KEY (`entity_creator_id`) REFERENCES `s_privilege_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK35DFAFE2967622C2` FOREIGN KEY (`apply_dept_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK35DFAFE2A29A3F85` FOREIGN KEY (`apply_org_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK35DFAFE2A624B10D` FOREIGN KEY (`supervisor_orgunit_id`) REFERENCES `b_org_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK35DFAFE2DEFD0F5` FOREIGN KEY (`workflow_activity_id`) REFERENCES `w_workflow_activity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK35DFAFE2E529410D` FOREIGN KEY (`suigong_orgunit_id`) REFERENCES `b_org_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK35DFAFE2EE47A804` FOREIGN KEY (`construction_orgunit_id`) REFERENCES `b_org_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK35DFAFE2F7258E38` FOREIGN KEY (`attachment_unit_id`) REFERENCES `b_attachment_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_copy
-- ----------------------------
DROP TABLE IF EXISTS `b_project_copy`;
CREATE TABLE `b_project_copy`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `capital_proj_id` bigint(20) DEFAULT NULL,
  `supervisor_orgunit_id` bigint(20) DEFAULT NULL,
  `schedule_unit_id` bigint(20) DEFAULT NULL,
  `construction_orgunit_id` bigint(20) DEFAULT NULL,
  `fea_orgunit_id` bigint(20) DEFAULT NULL,
  `schedule_point_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `construct_unit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `suigong_orgunit_id` bigint(20) DEFAULT NULL,
  `design_orgunit_id` bigint(20) DEFAULT NULL,
  `proj_info_id` bigint(20) DEFAULT NULL,
  `orgunit_id` bigint(20) DEFAULT NULL,
  `schedule_points` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `old_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `member_unit_id` bigint(20) DEFAULT NULL,
  `tempS` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK3C52703CEE47A804`(`construction_orgunit_id`) USING BTREE,
  INDEX `FK3C52703C49135FD6`(`orgunit_id`) USING BTREE,
  INDEX `FK3C52703CA624B10D`(`supervisor_orgunit_id`) USING BTREE,
  INDEX `FK3C52703C8C5144B3`(`fea_orgunit_id`) USING BTREE,
  INDEX `FK3C52703CE529410D`(`suigong_orgunit_id`) USING BTREE,
  INDEX `FK3C52703CB312F34D`(`schedule_unit_id`) USING BTREE,
  INDEX `FK3C52703CC2E207C7`(`schedule_point_id`) USING BTREE,
  INDEX `FK3C52703C9D3747D3`(`member_unit_id`) USING BTREE,
  INDEX `fk_proj_proj_capital`(`capital_proj_id`) USING BTREE,
  INDEX `FK3C52703C6E43848D`(`construct_unit_id`) USING BTREE,
  INDEX `FK3C52703C516E10F7`(`design_orgunit_id`) USING BTREE,
  INDEX `FK3C52703C7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK3C52703CF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `fk_proj_proj_info`(`proj_info_id`) USING BTREE,
  INDEX `fk_proj_code`(`entity_code`) USING BTREE,
  INDEX `idx_project_oldid`(`old_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17156 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_desinvest
-- ----------------------------
DROP TABLE IF EXISTS `b_project_desinvest`;
CREATE TABLE `b_project_desinvest`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fea_des_invest` decimal(18, 0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 372 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_detail
-- ----------------------------
DROP TABLE IF EXISTS `b_project_detail`;
CREATE TABLE `b_project_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proj_info_id` bigint(20) DEFAULT NULL,
  `capital_entry_tran_id` bigint(20) DEFAULT NULL,
  `schedule_unit_id` bigint(20) DEFAULT NULL,
  `old_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKD1B029B49AE1BB6`(`capital_entry_tran_id`) USING BTREE,
  INDEX `FKD1B029B4225B47CD`(`proj_info_id`) USING BTREE,
  INDEX `FKD1B029B4B312F34D`(`schedule_unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15121 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_feainvest
-- ----------------------------
DROP TABLE IF EXISTS `b_project_feainvest`;
CREATE TABLE `b_project_feainvest`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fea_reply_invest` decimal(18, 0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 246 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_group
-- ----------------------------
DROP TABLE IF EXISTS `b_project_group`;
CREATE TABLE `b_project_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `carried_forward_investment` decimal(19, 2) DEFAULT NULL,
  `former_total_invest` decimal(19, 2) DEFAULT NULL,
  `invest` decimal(19, 2) DEFAULT NULL,
  `is_control` bit(1) DEFAULT NULL,
  `occupied_invest` decimal(19, 2) DEFAULT NULL,
  `occupied_total_invest` decimal(19, 2) DEFAULT NULL,
  `publish_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total_invest` decimal(19, 2) DEFAULT NULL,
  `plan_year` int(11) DEFAULT NULL,
  `capital_type_id` bigint(20) DEFAULT NULL,
  `construct_type_id` bigint(20) DEFAULT NULL,
  `specialty_id` bigint(20) DEFAULT NULL,
  `src_project_group_id` bigint(20) DEFAULT NULL,
  `project_type_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `plan_type_id` bigint(20) DEFAULT NULL,
  `cashed_invest` decimal(19, 2) DEFAULT NULL,
  `first_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `forth_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `second_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  `third_Quarter_Investment` decimal(19, 2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKFEB1ACBC63C44627`(`capital_type_id`) USING BTREE,
  INDEX `FKFEB1ACBCDA1817B1`(`plan_type_id`) USING BTREE,
  INDEX `FKFEB1ACBC7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `fk_project_project_type`(`project_type_id`) USING BTREE,
  INDEX `FKFEB1ACBCF922CE3E`(`src_project_group_id`) USING BTREE,
  INDEX `FKFEB1ACBC122B14CF`(`specialty_id`) USING BTREE,
  INDEX `FKFEB1ACBC9A9B8D85`(`construct_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 464 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_info_requireorg
-- ----------------------------
DROP TABLE IF EXISTS `b_project_info_requireorg`;
CREATE TABLE `b_project_info_requireorg`  (
  `project_info_id` bigint(20) NOT NULL,
  `organization_id` bigint(20) NOT NULL,
  INDEX `FKD6BD9D8DF78DC8E5`(`organization_id`) USING BTREE,
  INDEX `FKD6BD9D8DB617389`(`project_info_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_make_up
-- ----------------------------
DROP TABLE IF EXISTS `b_project_make_up`;
CREATE TABLE `b_project_make_up`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `complete_date` datetime(0) DEFAULT NULL,
  `design_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `design_date` datetime(0) DEFAULT NULL,
  `design_total_invest` decimal(19, 2) DEFAULT NULL,
  `fea_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fea_date` datetime(0) DEFAULT NULL,
  `fea_total_invest` decimal(19, 2) DEFAULT NULL,
  `final_check_date` datetime(0) DEFAULT NULL,
  `first_check_date` datetime(0) DEFAULT NULL,
  `project_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `start_work_date` datetime(0) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `construction_orgunit_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `supervisor_orgunit_id` bigint(20) DEFAULT NULL,
  `fea_orgunit_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `suigong_orgunit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `spec_id` bigint(20) DEFAULT NULL,
  `construct_manager_id` bigint(20) DEFAULT NULL,
  `capital_entry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `construct_org_id` bigint(20) DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  `project_manager_id` bigint(20) DEFAULT NULL,
  `design_orgunit_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK391C9989EE47A804`(`construction_orgunit_id`) USING BTREE,
  INDEX `FK391C9989967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK391C9989A624B10D`(`supervisor_orgunit_id`) USING BTREE,
  INDEX `FK391C9989E4A9CCF2`(`spec_id`) USING BTREE,
  INDEX `FK391C9989DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK391C99898C5144B3`(`fea_orgunit_id`) USING BTREE,
  INDEX `FK391C9989E529410D`(`suigong_orgunit_id`) USING BTREE,
  INDEX `FK391C99898F120B2B`(`construct_manager_id`) USING BTREE,
  INDEX `FK391C9989B28466A9`(`project_manager_id`) USING BTREE,
  INDEX `FK391C99895C31E216`(`project_id`) USING BTREE,
  INDEX `FK391C99897D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK391C9989516E10F7`(`design_orgunit_id`) USING BTREE,
  INDEX `FK391C9989AD6A15C3`(`manager_id`) USING BTREE,
  INDEX `FK391C9989F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK391C998949E8C6FC`(`construct_org_id`) USING BTREE,
  INDEX `FK391C9989A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_member
-- ----------------------------
DROP TABLE IF EXISTS `b_project_member`;
CREATE TABLE `b_project_member`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rolename` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telephone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `member_role_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `member_type_id` bigint(20) DEFAULT NULL,
  `member_unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKE1089BFD6C5DDD94`(`org_id`) USING BTREE,
  INDEX `fk_memeber_memberrole`(`member_role_id`) USING BTREE,
  INDEX `fk_memeber_memberunit`(`member_unit_id`) USING BTREE,
  INDEX `fk_memeber_membertype`(`member_type_id`) USING BTREE,
  INDEX `FKE1089BFDFEC5CE5`(`user_id`) USING BTREE,
  INDEX `FKE1089BFD7D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_online
-- ----------------------------
DROP TABLE IF EXISTS `b_project_online`;
CREATE TABLE `b_project_online`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `isBack` bit(1) DEFAULT NULL,
  `reportIssue_Date` datetime(0) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `construction_orgunit_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `design_orgunit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `supervisor_orgunit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKE4F0C7B6EE47A804`(`construction_orgunit_id`) USING BTREE,
  INDEX `FKE4F0C7B6967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKE4F0C7B6A624B10D`(`supervisor_orgunit_id`) USING BTREE,
  INDEX `FKE4F0C7B65C31E216`(`project_id`) USING BTREE,
  INDEX `FKE4F0C7B6516E10F7`(`design_orgunit_id`) USING BTREE,
  INDEX `FKE4F0C7B67D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKE4F0C7B6DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKE4F0C7B6F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKE4F0C7B6A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_pause
-- ----------------------------
DROP TABLE IF EXISTS `b_project_pause`;
CREATE TABLE `b_project_pause`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `pause_date` datetime(0) DEFAULT NULL,
  `pause_num` bigint(20) DEFAULT NULL,
  `return_date` datetime(0) DEFAULT NULL,
  `supe_orgunit_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `cons_orgunit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKFF28DC33967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKFF28DC335C31E216`(`project_id`) USING BTREE,
  INDEX `FKFF28DC337D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKFF28DC33DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKFF28DC33F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKFF28DC338448AD3E`(`supe_orgunit_id`) USING BTREE,
  INDEX `FKFF28DC332A104DA4`(`cons_orgunit_id`) USING BTREE,
  INDEX `FKFF28DC33A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_policy
-- ----------------------------
DROP TABLE IF EXISTS `b_project_policy`;
CREATE TABLE `b_project_policy`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `is_core` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `policy_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `policy_date` datetime(0) DEFAULT NULL,
  `policy_invest` decimal(19, 2) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `decision_maker_id` bigint(20) DEFAULT NULL,
  `leader_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKE6B3B6955D0C92E7`(`leader_id`) USING BTREE,
  INDEX `FKE6B3B6957E7642DE`(`schedule_id`) USING BTREE,
  INDEX `FKE6B3B695967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKE6B3B6955C31E216`(`project_id`) USING BTREE,
  INDEX `FKE6B3B695D8B82ACF`(`decision_maker_id`) USING BTREE,
  INDEX `FKE6B3B6957D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKE6B3B695DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKE6B3B695F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKE6B3B695178232A9`(`parent_id`) USING BTREE,
  INDEX `FKE6B3B695A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26023 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_return
-- ----------------------------
DROP TABLE IF EXISTS `b_project_return`;
CREATE TABLE `b_project_return`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `return_time` datetime(0) DEFAULT NULL,
  `projectpause_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `supe_orgunit_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `cons_orgunit_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKE9944E93967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKE9944E935C31E216`(`project_id`) USING BTREE,
  INDEX `FKE9944E937D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKE9944E93DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKE9944E938448AD3E`(`supe_orgunit_id`) USING BTREE,
  INDEX `FKE9944E93F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKE9944E932A104DA4`(`cons_orgunit_id`) USING BTREE,
  INDEX `FKE9944E933941D41C`(`projectpause_id`) USING BTREE,
  INDEX `FKE9944E93A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_setup
-- ----------------------------
DROP TABLE IF EXISTS `b_project_setup`;
CREATE TABLE `b_project_setup`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `budget_code` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `budget_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `budget_trans_id` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `capitalType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `group_code` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_new_busy` bit(1) DEFAULT NULL,
  `publish_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `setup_type` int(11) DEFAULT NULL,
  `sort_date` datetime(0) DEFAULT NULL,
  `project_group_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `project_detail_id` bigint(20) DEFAULT NULL,
  `carried_business_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `old_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKFF54F0BA967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKFF54F0BA5C31E216`(`project_id`) USING BTREE,
  INDEX `fk_projsetup_projgroup`(`project_group_id`) USING BTREE,
  INDEX `FKFF54F0BA7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKFF54F0BADEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKFF54F0BAF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `fk_project_setup_proj_det`(`project_detail_id`) USING BTREE,
  INDEX `FKFF54F0BABE01BE6E`(`carried_business_id`) USING BTREE,
  INDEX `FKFF54F0BAA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2677 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_solid
-- ----------------------------
DROP TABLE IF EXISTS `b_project_solid`;
CREATE TABLE `b_project_solid`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `CutOverOnlineProcess` decimal(19, 2) DEFAULT NULL,
  `checkTestProcess` decimal(19, 2) DEFAULT NULL,
  `mainEquProcess` decimal(19, 2) DEFAULT NULL,
  `matchEquProcess` decimal(19, 2) DEFAULT NULL,
  `systTestProcess` decimal(19, 2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKFF595CE8967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKFF595CE85C31E216`(`project_id`) USING BTREE,
  INDEX `FKFF595CE87D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKFF595CE8DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKFF595CE8F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKFF595CE8A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1057 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_startup
-- ----------------------------
DROP TABLE IF EXISTS `b_project_startup`;
CREATE TABLE `b_project_startup`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `estimated_invest` decimal(19, 2) DEFAULT NULL,
  `plan_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `re_submit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `proj_detail_id` bigint(20) DEFAULT NULL,
  `capital_entry_id` bigint(20) DEFAULT NULL,
  `types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK96675D7A967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `fk_startup_proj_detail`(`proj_detail_id`) USING BTREE,
  INDEX `FK96675D7A5C31E216`(`project_id`) USING BTREE,
  INDEX `FK96675D7A7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK96675D7AE1576975`(`capital_entry_id`) USING BTREE,
  INDEX `FK96675D7ADEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK96675D7A2DF9F1BA`(`re_submit_id`) USING BTREE,
  INDEX `FK96675D7AF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK96675D7A92FBDA1A`(`parent_id`) USING BTREE,
  INDEX `FK96675D7AA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30432 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_terminate
-- ----------------------------
DROP TABLE IF EXISTS `b_project_terminate`;
CREATE TABLE `b_project_terminate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK923C0E1E967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK923C0E1E5C31E216`(`project_id`) USING BTREE,
  INDEX `FK923C0E1EFEC5CE5`(`user_id`) USING BTREE,
  INDEX `FK923C0E1E7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK923C0E1EDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK923C0E1EF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK923C0E1EA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 164 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_project_transfer
-- ----------------------------
DROP TABLE IF EXISTS `b_project_transfer`;
CREATE TABLE `b_project_transfer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `accept_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_om_same` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `plan_finish_date` datetime(0) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  `project_manager_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `interface_manager_id` bigint(20) DEFAULT NULL,
  `cons_org_id` bigint(20) DEFAULT NULL,
  `spec_manager_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK345FFC8E7E7642DE`(`schedule_id`) USING BTREE,
  INDEX `FK345FFC8E967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK345FFC8EDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK345FFC8EEDA5E262`(`cons_org_id`) USING BTREE,
  INDEX `FK345FFC8EB28466A9`(`project_manager_id`) USING BTREE,
  INDEX `FK345FFC8E5C31E216`(`project_id`) USING BTREE,
  INDEX `FK345FFC8E4F2AB089`(`interface_manager_id`) USING BTREE,
  INDEX `FK345FFC8E3045E0C7`(`spec_manager_id`) USING BTREE,
  INDEX `FK345FFC8E7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK345FFC8EF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK345FFC8EAD6A15C3`(`manager_id`) USING BTREE,
  INDEX `FK345FFC8ED7F921FB`(`parent_id`) USING BTREE,
  INDEX `FK345FFC8EA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 889 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_psp_score
-- ----------------------------
DROP TABLE IF EXISTS `b_psp_score`;
CREATE TABLE `b_psp_score`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `proj_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `proj_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `org_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kfen` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kfei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `k_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `desc_s` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_pspscore_detail
-- ----------------------------
DROP TABLE IF EXISTS `b_pspscore_detail`;
CREATE TABLE `b_pspscore_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `con_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `con_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `kf_total` decimal(19, 2) DEFAULT NULL,
  `org_type_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `pspScore_id` bigint(20) DEFAULT NULL,
  `check_unit_id` bigint(20) DEFAULT NULL,
  `partner_score_id` bigint(20) DEFAULT NULL,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `weight` decimal(19, 2) DEFAULT NULL,
  `unit_weight_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKFF5BE80E77243690`(`check_unit_id`) USING BTREE,
  INDEX `FKFF5BE80E6C5DDD94`(`org_id`) USING BTREE,
  INDEX `FKFF5BE80E5016C32B`(`pspScore_id`) USING BTREE,
  INDEX `FKFF5BE80ECFDA62F5`(`partner_score_id`) USING BTREE,
  INDEX `FKFF5BE80E69897B7D`(`org_type_id`) USING BTREE,
  INDEX `unit_weight_id`(`unit_weight_id`) USING BTREE,
  INDEX `psp_entity_code`(`entity_code`) USING BTREE,
  INDEX `FKFF5BE80E78B2929E`(`unit_weight_id`) USING BTREE,
  CONSTRAINT `FKFF5BE80E78B2929E` FOREIGN KEY (`unit_weight_id`) REFERENCES `b_unit_weight` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31248 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_purchase_submit
-- ----------------------------
DROP TABLE IF EXISTS `b_purchase_submit`;
CREATE TABLE `b_purchase_submit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `gongqi_Description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `preAmount` decimal(19, 2) DEFAULT NULL,
  `projCodes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `purchase_Description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `single_Description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `suPurWayName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `suPurWays` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `materialType_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `purchaseRequireType_id` bigint(20) DEFAULT NULL,
  `lis_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `capital_type_id` bigint(20) DEFAULT NULL,
  `old_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK602D1739967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK602D173963C44627`(`capital_type_id`) USING BTREE,
  INDEX `FK602D17391006D801`(`purchaseRequireType_id`) USING BTREE,
  INDEX `FK602D1739DE4FB513`(`materialType_id`) USING BTREE,
  INDEX `FK602D17397D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK602D1739DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK602D1739F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK602D1739A29A3F85`(`apply_org_id`) USING BTREE,
  INDEX `idx_bps_code`(`entity_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16492 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_purshasesubmit_project
-- ----------------------------
DROP TABLE IF EXISTS `b_purshasesubmit_project`;
CREATE TABLE `b_purshasesubmit_project`  (
  `purchaseSubmit_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  INDEX `FKCA2BC1E05C31E216`(`project_id`) USING BTREE,
  INDEX `FKCA2BC1E08FA407D3`(`purchaseSubmit_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_pwd_modify_log
-- ----------------------------
DROP TABLE IF EXISTS `b_pwd_modify_log`;
CREATE TABLE `b_pwd_modify_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `passward` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_date` datetime(0) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKECAFE5FE7D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_qualification_issuing_dep
-- ----------------------------
DROP TABLE IF EXISTS `b_qualification_issuing_dep`;
CREATE TABLE `b_qualification_issuing_dep`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_quality_impotinfo
-- ----------------------------
DROP TABLE IF EXISTS `b_quality_impotinfo`;
CREATE TABLE `b_quality_impotinfo`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `build_start_date` datetime(0) DEFAULT NULL,
  `construct_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `construct_org_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `construct_org_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `construct_org_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `design_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `design_org_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `design_org_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `design_org_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `design_phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `execute_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `execute_org_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `execute_org_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `execute_org_user_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `execute_phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pre_end_date` datetime(0) DEFAULT NULL,
  `pre_setup_amount` decimal(19, 2) DEFAULT NULL,
  `pre_total_invest` decimal(19, 2) DEFAULT NULL,
  `project_profile` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `reply_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `review_unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `review_unit_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supervisor_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supervisor_org_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supervisor_org_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supervisor_org_user_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supervisor_phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `build_type_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKE719227D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKE719227155D41C`(`build_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2237 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_quality_super_declaration
-- ----------------------------
DROP TABLE IF EXISTS `b_quality_super_declaration`;
CREATE TABLE `b_quality_super_declaration`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `qualityImportInfo_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKA47E2DD9967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKA47E2DD95C31E216`(`project_id`) USING BTREE,
  INDEX `FKA47E2DD97D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKA47E2DD9DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKA47E2DD9F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKA47E2DD95C32AD9F`(`qualityImportInfo_id`) USING BTREE,
  INDEX `FKA47E2DD9A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2264 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_quick_menu
-- ----------------------------
DROP TABLE IF EXISTS `b_quick_menu`;
CREATE TABLE `b_quick_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `module_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK96F9F86E1EB5BEA6`(`module_id`) USING BTREE,
  INDEX `FK96F9F86EFEC5CE5`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_recommendation_audit
-- ----------------------------
DROP TABLE IF EXISTS `b_recommendation_audit`;
CREATE TABLE `b_recommendation_audit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `is_core` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_need_revise` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `recom_audit_date` datetime(0) DEFAULT NULL,
  `recom_invest` decimal(19, 2) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKB5445B927E7642DE`(`schedule_id`) USING BTREE,
  INDEX `FKB5445B92967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKB5445B925C31E216`(`project_id`) USING BTREE,
  INDEX `FKB5445B927D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKB5445B92DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKB5445B92F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKB5445B9297ED260C`(`parent_id`) USING BTREE,
  INDEX `FKB5445B92A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2039 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_requirement_submit
-- ----------------------------
DROP TABLE IF EXISTS `b_requirement_submit`;
CREATE TABLE `b_requirement_submit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `estimated_invest` decimal(19, 2) DEFAULT NULL,
  `is_merge` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `firstContent` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKDA50F6916C5DDD94`(`org_id`) USING BTREE,
  INDEX `FKDA50F691967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKDA50F6917D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKDA50F691DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKDA50F691AD6A15C3`(`manager_id`) USING BTREE,
  INDEX `FKDA50F691F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKDA50F691C20162F4`(`parent_id`) USING BTREE,
  INDEX `FKDA50F691A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 923 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_safety_accept
-- ----------------------------
DROP TABLE IF EXISTS `b_safety_accept`;
CREATE TABLE `b_safety_accept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `is_isKaiWa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kaiWa_Description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `reportIssue_Date` datetime(0) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `suigong_orgunit_id` bigint(20) DEFAULT NULL,
  `design_orgunit_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  `supervisor_orgunit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `construction_orgunit_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8F9921F8EE47A804`(`construction_orgunit_id`) USING BTREE,
  INDEX `FK8F9921F8967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK8F9921F8DC1B81D8`(`schedule_id`) USING BTREE,
  INDEX `FK8F9921F8A624B10D`(`supervisor_orgunit_id`) USING BTREE,
  INDEX `FK8F9921F85C31E216`(`project_id`) USING BTREE,
  INDEX `FK8F9921F8516E10F7`(`design_orgunit_id`) USING BTREE,
  INDEX `FK8F9921F87D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK8F9921F8DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK8F9921F8F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK8F9921F8E529410D`(`suigong_orgunit_id`) USING BTREE,
  INDEX `FK8F9921F8A29A3F85`(`apply_org_id`) USING BTREE,
  CONSTRAINT `FK8F9921F8516E10F7` FOREIGN KEY (`design_orgunit_id`) REFERENCES `b_org_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8F9921F85C31E216` FOREIGN KEY (`project_id`) REFERENCES `b_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8F9921F87D3296C0` FOREIGN KEY (`entity_creator_id`) REFERENCES `s_privilege_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8F9921F8967622C2` FOREIGN KEY (`apply_dept_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8F9921F8A29A3F85` FOREIGN KEY (`apply_org_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8F9921F8A624B10D` FOREIGN KEY (`supervisor_orgunit_id`) REFERENCES `b_org_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8F9921F8DC1B81D8` FOREIGN KEY (`schedule_id`) REFERENCES `b_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8F9921F8DEFD0F5` FOREIGN KEY (`workflow_activity_id`) REFERENCES `w_workflow_activity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8F9921F8E529410D` FOREIGN KEY (`suigong_orgunit_id`) REFERENCES `b_org_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8F9921F8EE47A804` FOREIGN KEY (`construction_orgunit_id`) REFERENCES `b_org_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8F9921F8F7258E38` FOREIGN KEY (`attachment_unit_id`) REFERENCES `b_attachment_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_schdule_finish
-- ----------------------------
DROP TABLE IF EXISTS `b_schdule_finish`;
CREATE TABLE `b_schdule_finish`  (
  `项目编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `项目名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `委托设计` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `设计会审` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `质检申报` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `开工时间` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `完工时间` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `转固` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `初验` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `初验资料提交` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `竣工备案` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `结算审计提交` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `结算审计反馈` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `终验（质保期）` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `决算审计资料提交` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `决算审计报告反馈` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `后期资料归档` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_schdule_plan
-- ----------------------------
DROP TABLE IF EXISTS `b_schdule_plan`;
CREATE TABLE `b_schdule_plan`  (
  `项目编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `项目名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `委托设计` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `设计会审` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `质检申报` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `开工时间` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `完工时间` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `转固` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `初验` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `初验资料提交` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `竣工备案` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `结算审计提交` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `结算审计反馈` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `终验（质保期）` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `决算审计资料提交` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `决算审计报告反馈` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `后期资料归档` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_schedule
-- ----------------------------
DROP TABLE IF EXISTS `b_schedule`;
CREATE TABLE `b_schedule`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `awoke_date` datetime(0) DEFAULT NULL,
  `begin_date` datetime(0) DEFAULT NULL,
  `delay_date` datetime(0) DEFAULT NULL,
  `delay_begin_date` datetime(0) DEFAULT NULL,
  `delay_time` bigint(20) DEFAULT NULL,
  `delay_type` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `delay_type_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `end_date` datetime(0) DEFAULT NULL,
  `has_activity` bit(1) DEFAULT NULL,
  `isLook` bit(1) DEFAULT NULL,
  `is_required` bit(1) DEFAULT NULL,
  `is_write_finish` bit(1) DEFAULT NULL,
  `plan_begin_date` datetime(0) DEFAULT NULL,
  `plan_end_date` datetime(0) DEFAULT NULL,
  `pre_priority` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `progress` decimal(19, 2) DEFAULT NULL,
  `progress_days` int(11) DEFAULT NULL,
  `space_date` int(11) DEFAULT NULL,
  `work_date` int(11) DEFAULT NULL,
  `schedule_unit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `schedule_type_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `is_warning` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5FE911D4FEC5CE5`(`user_id`) USING BTREE,
  INDEX `FK5FE911D47D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK5FE911D4914D8F8D`(`schedule_type_id`) USING BTREE,
  INDEX `FK5FE911D4B312F34D`(`schedule_unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1221133 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_schedule2
-- ----------------------------
DROP TABLE IF EXISTS `b_schedule2`;
CREATE TABLE `b_schedule2`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `awoke_date` datetime(0) DEFAULT NULL,
  `begin_date` datetime(0) DEFAULT NULL,
  `delay_date` datetime(0) DEFAULT NULL,
  `delay_time` bigint(20) DEFAULT NULL,
  `delay_type` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `delay_type_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `end_date` datetime(0) DEFAULT NULL,
  `has_activity` bit(1) DEFAULT NULL,
  `isLook` bit(1) DEFAULT NULL,
  `is_required` bit(1) DEFAULT NULL,
  `is_write_finish` bit(1) DEFAULT NULL,
  `plan_begin_date` datetime(0) DEFAULT NULL,
  `plan_end_date` datetime(0) DEFAULT NULL,
  `pre_priority` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `progress` decimal(19, 2) DEFAULT NULL,
  `progress_days` int(11) DEFAULT NULL,
  `space_date` int(11) DEFAULT NULL,
  `work_date` int(11) DEFAULT NULL,
  `schedule_unit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `schedule_type_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `is_warning` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5FE911D4FEC5CE5`(`user_id`) USING BTREE,
  INDEX `FK5FE911D47D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK5FE911D4914D8F8D`(`schedule_type_id`) USING BTREE,
  INDEX `FK5FE911D4B312F34D`(`schedule_unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 906415 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_schedule_report
-- ----------------------------
DROP TABLE IF EXISTS `b_schedule_report`;
CREATE TABLE `b_schedule_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `CutOverOnlineProcess` decimal(19, 2) DEFAULT NULL,
  `checkTestProcess` decimal(19, 2) DEFAULT NULL,
  `mainEquProcess` decimal(19, 2) DEFAULT NULL,
  `matchEquProcess` decimal(19, 2) DEFAULT NULL,
  `systTestProcess` decimal(19, 2) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `sumProcess` decimal(19, 2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKFC2749FF967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKFC2749FF5C31E216`(`project_id`) USING BTREE,
  INDEX `FKFC2749FF7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKFC2749FFDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKFC2749FFF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKFC2749FFA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24595 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_schedule_unit
-- ----------------------------
DROP TABLE IF EXISTS `b_schedule_unit`;
CREATE TABLE `b_schedule_unit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `schedule_progress` decimal(19, 2) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `pid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK9B4E850F7D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112221 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_schedule_warn
-- ----------------------------
DROP TABLE IF EXISTS `b_schedule_warn`;
CREATE TABLE `b_schedule_warn`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `begin_days` bigint(20) DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `is_message` bit(1) DEFAULT NULL,
  `is_sms` bit(1) DEFAULT NULL,
  `is_warning_up` bit(1) DEFAULT NULL,
  `per_days` bigint(20) DEFAULT NULL,
  `warn_userids` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `warn_users` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `schedule_type_id` bigint(20) DEFAULT NULL,
  `member_role_id` bigint(20) DEFAULT NULL,
  `template_id` bigint(20) DEFAULT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK9B4F3E117E7642DE`(`schedule_id`) USING BTREE,
  INDEX `FK9B4F3E115B8A93`(`member_role_id`) USING BTREE,
  INDEX `FK9B4F3E118975FADB`(`template_id`) USING BTREE,
  INDEX `FK9B4F3E11914D8F8D`(`schedule_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_schedule_warn_activity
-- ----------------------------
DROP TABLE IF EXISTS `b_schedule_warn_activity`;
CREATE TABLE `b_schedule_warn_activity`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `tem_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `schedule_unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5288297D967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK5288297D5C31E216`(`project_id`) USING BTREE,
  INDEX `FK5288297D7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK5288297DDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK5288297DF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK5288297DB312F34D`(`schedule_unit_id`) USING BTREE,
  INDEX `FK5288297DA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_schedule_warn_up
-- ----------------------------
DROP TABLE IF EXISTS `b_schedule_warn_up`;
CREATE TABLE `b_schedule_warn_up`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `begin_days` bigint(20) DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `per_days` bigint(20) DEFAULT NULL,
  `schedule_warn_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8A892F896AC19905`(`role_id`) USING BTREE,
  INDEX `FK8A892F8972D3C0D`(`schedule_warn_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_settle_audit_exec_fee
-- ----------------------------
DROP TABLE IF EXISTS `b_settle_audit_exec_fee`;
CREATE TABLE `b_settle_audit_exec_fee`  (
  `settlement_audit_fee_id` bigint(20) NOT NULL,
  `settlement_audit_exec_id` bigint(20) NOT NULL,
  UNIQUE INDEX `settlement_audit_exec_id`(`settlement_audit_exec_id`) USING BTREE,
  INDEX `FKDAA3A8131D061FD4`(`settlement_audit_exec_id`) USING BTREE,
  INDEX `FKDAA3A813D00C5900`(`settlement_audit_fee_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_settlement_audit
-- ----------------------------
DROP TABLE IF EXISTS `b_settlement_audit`;
CREATE TABLE `b_settlement_audit`  (
  `audit_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `audit_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `con_des_fee` decimal(19, 2) DEFAULT NULL,
  `is_adjust` bit(1) DEFAULT NULL,
  `material_fee` decimal(19, 2) DEFAULT NULL,
  `submit_date` datetime(0) DEFAULT NULL,
  `adjust_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `con_handle_date` datetime(0) DEFAULT NULL,
  `is_con_handle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quartz_submit` bit(1) DEFAULT NULL,
  `order_unit_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `inner_auditor_id` bigint(20) DEFAULT NULL,
  `coop_org_id` bigint(20) DEFAULT NULL,
  `coop_user_id` bigint(20) DEFAULT NULL,
  `problem_activity_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `audit_project_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `old_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `audit_area` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `old_iscomplete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `old_node` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `old_userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK25073782967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK2507378294EA5F7A`(`order_unit_id`) USING BTREE,
  INDEX `FK2507378247BDA8CA`(`audit_project_id`) USING BTREE,
  INDEX `FK25073782DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK250737825297B177`(`problem_activity_id`) USING BTREE,
  INDEX `FK25073782EF2115F3`(`coop_user_id`) USING BTREE,
  INDEX `FK250737825C31E216`(`project_id`) USING BTREE,
  INDEX `FK25073782305523F6`(`old_id`) USING BTREE,
  INDEX `FK250737824A46CAC6`(`coop_org_id`) USING BTREE,
  INDEX `FK250737827D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK25073782F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK25073782A29A3F85`(`apply_org_id`) USING BTREE,
  INDEX `FK2507378274874E5B`(`inner_auditor_id`) USING BTREE,
  INDEX `FK2507378294F90614`(`old_userid`) USING BTREE,
  CONSTRAINT `FK2507378294F90614` FOREIGN KEY (`old_userid`) REFERENCES `s_privilege_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5981 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_settlement_audit_fee
-- ----------------------------
DROP TABLE IF EXISTS `b_settlement_audit_fee`;
CREATE TABLE `b_settlement_audit_fee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `charged_batch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_charged` bit(1) DEFAULT NULL,
  `total_score` decimal(19, 2) DEFAULT NULL,
  `entrust_org_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `score_unit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK57E86149967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK57E861494F3982BD`(`score_unit_id`) USING BTREE,
  INDEX `FK57E86149C348A084`(`entrust_org_id`) USING BTREE,
  INDEX `FK57E861497D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK57E86149DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK57E86149F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK57E86149A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_settlement_audit_file
-- ----------------------------
DROP TABLE IF EXISTS `b_settlement_audit_file`;
CREATE TABLE `b_settlement_audit_file`  (
  `settlement_audit_id` bigint(20) NOT NULL,
  `file_type_id` bigint(20) NOT NULL,
  INDEX `FKA523D819A803D018`(`settlement_audit_id`) USING BTREE,
  INDEX `FKA523D8196E7203CC`(`file_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_settlement_audit_org
-- ----------------------------
DROP TABLE IF EXISTS `b_settlement_audit_org`;
CREATE TABLE `b_settlement_audit_org`  (
  `settlement_audit_id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  INDEX `FK57E884A7A803D018`(`settlement_audit_id`) USING BTREE,
  INDEX `FK57E884A76C5DDD94`(`org_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_sms
-- ----------------------------
DROP TABLE IF EXISTS `b_sms`;
CREATE TABLE `b_sms`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `categoryid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `recipients` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `senddate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sender` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sendrule` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_start_work
-- ----------------------------
DROP TABLE IF EXISTS `b_start_work`;
CREATE TABLE `b_start_work`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `is_isKaiWa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kaiWa_Description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `reportIssue_Date` datetime(0) DEFAULT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `construction_orgunit_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `design_orgunit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `suigong_orgunit_id` bigint(20) DEFAULT NULL,
  `supervisor_orgunit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKD51CCCCBEE47A804`(`construction_orgunit_id`) USING BTREE,
  INDEX `FKD51CCCCB967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKD51CCCCBDC1B81D8`(`schedule_id`) USING BTREE,
  INDEX `FKD51CCCCBA624B10D`(`supervisor_orgunit_id`) USING BTREE,
  INDEX `FKD51CCCCB5C31E216`(`project_id`) USING BTREE,
  INDEX `FKD51CCCCB7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKD51CCCCB516E10F7`(`design_orgunit_id`) USING BTREE,
  INDEX `FKD51CCCCBDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKD51CCCCBF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKD51CCCCBE529410D`(`suigong_orgunit_id`) USING BTREE,
  INDEX `FKD51CCCCBA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7681 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_start_work_project
-- ----------------------------
DROP TABLE IF EXISTS `b_start_work_project`;
CREATE TABLE `b_start_work_project`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `is_isKaiWa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kaiWa_Description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `reportIssue_Date` datetime(0) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  `suigong_orgunit_id` bigint(20) DEFAULT NULL,
  `design_orgunit_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `construction_orgunit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `supervisor_orgunit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8DF4C3A5EE47A804`(`construction_orgunit_id`) USING BTREE,
  INDEX `FK8DF4C3A5967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK8DF4C3A5DC1B81D8`(`schedule_id`) USING BTREE,
  INDEX `FK8DF4C3A5A624B10D`(`supervisor_orgunit_id`) USING BTREE,
  INDEX `FK8DF4C3A55C31E216`(`project_id`) USING BTREE,
  INDEX `FK8DF4C3A57D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK8DF4C3A5516E10F7`(`design_orgunit_id`) USING BTREE,
  INDEX `FK8DF4C3A5DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK8DF4C3A5F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK8DF4C3A5E529410D`(`suigong_orgunit_id`) USING BTREE,
  INDEX `FK8DF4C3A5A29A3F85`(`apply_org_id`) USING BTREE,
  CONSTRAINT `FK8DF4C3A5516E10F7` FOREIGN KEY (`design_orgunit_id`) REFERENCES `b_org_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8DF4C3A55C31E216` FOREIGN KEY (`project_id`) REFERENCES `b_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8DF4C3A57D3296C0` FOREIGN KEY (`entity_creator_id`) REFERENCES `s_privilege_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8DF4C3A5967622C2` FOREIGN KEY (`apply_dept_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8DF4C3A5A29A3F85` FOREIGN KEY (`apply_org_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8DF4C3A5A624B10D` FOREIGN KEY (`supervisor_orgunit_id`) REFERENCES `b_org_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8DF4C3A5DC1B81D8` FOREIGN KEY (`schedule_id`) REFERENCES `b_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8DF4C3A5DEFD0F5` FOREIGN KEY (`workflow_activity_id`) REFERENCES `w_workflow_activity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8DF4C3A5E529410D` FOREIGN KEY (`suigong_orgunit_id`) REFERENCES `b_org_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8DF4C3A5EE47A804` FOREIGN KEY (`construction_orgunit_id`) REFERENCES `b_org_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8DF4C3A5F7258E38` FOREIGN KEY (`attachment_unit_id`) REFERENCES `b_attachment_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_submit_data
-- ----------------------------
DROP TABLE IF EXISTS `b_submit_data`;
CREATE TABLE `b_submit_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `assetsEnableDate1` datetime(0) DEFAULT NULL,
  `assetsEnableDate2` datetime(0) DEFAULT NULL,
  `assetsEnableDate3` datetime(0) DEFAULT NULL,
  `assetsEnableDate4` datetime(0) DEFAULT NULL,
  `assetsEnableDate5` datetime(0) DEFAULT NULL,
  `isAdjustReport` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `isFireProject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `noFire_Description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `pre_checkDate1` datetime(0) DEFAULT NULL,
  `pre_checkDate2` datetime(0) DEFAULT NULL,
  `pre_checkDate3` datetime(0) DEFAULT NULL,
  `pre_checkDate4` datetime(0) DEFAULT NULL,
  `pre_checkDate5` datetime(0) DEFAULT NULL,
  `requireDate` datetime(0) DEFAULT NULL,
  `totalAssets` decimal(19, 2) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK2C3E9314967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK2C3E93145C31E216`(`project_id`) USING BTREE,
  INDEX `FK2C3E93147D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK2C3E9314DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK2C3E9314F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK2C3E9314A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19794 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_supervise
-- ----------------------------
DROP TABLE IF EXISTS `b_supervise`;
CREATE TABLE `b_supervise`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `att_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attach_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `feedback_time` datetime(0) DEFAULT NULL,
  `supervise_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supervise_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `designApproval_id` bigint(20) DEFAULT NULL,
  `feareply_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `attachment_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK9305DEA3967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK9305DEA35C31E216`(`project_id`) USING BTREE,
  INDEX `FK9305DEA3D2C9BBF1`(`feareply_id`) USING BTREE,
  INDEX `FK9305DEA3D5602A78`(`attachment_type_id`) USING BTREE,
  INDEX `FK9305DEA37D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK9305DEA3DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK9305DEA3F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK9305DEA36BDDD946`(`designApproval_id`) USING BTREE,
  INDEX `FK9305DEA3A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_task_pre_accept
-- ----------------------------
DROP TABLE IF EXISTS `b_task_pre_accept`;
CREATE TABLE `b_task_pre_accept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `require_finish_date` datetime(0) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `sui_fzuser_id` bigint(20) DEFAULT NULL,
  `sui_org_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `sui_user_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKAEA18F41296DCE8C`(`sui_org_id`) USING BTREE,
  INDEX `FKAEA18F41967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKAEA18F41F4DA8AED`(`sui_user_id`) USING BTREE,
  INDEX `FKAEA18F415C31E216`(`project_id`) USING BTREE,
  INDEX `FKAEA18F417D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKAEA18F41DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKAEA18F41F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKAEA18F41A29A3F85`(`apply_org_id`) USING BTREE,
  INDEX `FKAEA18F4169AC599`(`sui_fzuser_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_task_pre_detail
-- ----------------------------
DROP TABLE IF EXISTS `b_task_pre_detail`;
CREATE TABLE `b_task_pre_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `require_finish_date` datetime(0) DEFAULT NULL,
  `task_pre_accept_id` bigint(20) DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKB3E3F28A434ADC34`(`task_id`) USING BTREE,
  INDEX `FKB3E3F28A517E4C29`(`task_pre_accept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_taskimport_manager
-- ----------------------------
DROP TABLE IF EXISTS `b_taskimport_manager`;
CREATE TABLE `b_taskimport_manager`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `template_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `engineering_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK1CDB80F5967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK1CDB80F55C31E216`(`project_id`) USING BTREE,
  INDEX `FK1CDB80F57D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK1CDB80F5DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK1CDB80F5F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK1CDB80F5A29A3F85`(`apply_org_id`) USING BTREE,
  INDEX `FK1CDB80F5CA89DAFD`(`engineering_type_id`) USING BTREE,
  CONSTRAINT `FK1CDB80F5CA89DAFD` FOREIGN KEY (`engineering_type_id`) REFERENCES `c_engineering_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_training_zq_01
-- ----------------------------
DROP TABLE IF EXISTS `b_training_zq_01`;
CREATE TABLE `b_training_zq_01`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `training_date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `training_type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `training_author_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_training_dept`(`apply_dept_id`) USING BTREE,
  INDEX `fk_training_creator`(`entity_creator_id`) USING BTREE,
  INDEX `fk_training_acti`(`workflow_activity_id`) USING BTREE,
  INDEX `fk_training_dept_attach`(`attachment_unit_id`) USING BTREE,
  INDEX `fk_training_org`(`apply_org_id`) USING BTREE,
  INDEX `idx_entity_code`(`entity_code`) USING BTREE,
  CONSTRAINT `b_training_zq_01_ibfk_1` FOREIGN KEY (`apply_dept_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `b_training_zq_01_ibfk_2` FOREIGN KEY (`entity_creator_id`) REFERENCES `s_privilege_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `b_training_zq_01_ibfk_3` FOREIGN KEY (`workflow_activity_id`) REFERENCES `w_workflow_activity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `b_training_zq_01_ibfk_4` FOREIGN KEY (`attachment_unit_id`) REFERENCES `b_attachment_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `b_training_zq_01_ibfk_5` FOREIGN KEY (`apply_org_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_unit_weight
-- ----------------------------
DROP TABLE IF EXISTS `b_unit_weight`;
CREATE TABLE `b_unit_weight`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `weight_score` decimal(19, 2) DEFAULT NULL,
  `org_type_id` bigint(20) DEFAULT NULL,
  `check_template_id` bigint(20) DEFAULT NULL,
  `explain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `manager_score` decimal(19, 2) DEFAULT NULL,
  `construct_score` decimal(19, 2) DEFAULT NULL,
  `des_score` decimal(19, 2) DEFAULT NULL,
  `sup_score` decimal(19, 2) DEFAULT NULL,
  `con_score` decimal(19, 2) DEFAULT NULL,
  `sui_score` decimal(19, 2) DEFAULT NULL,
  `b_org_type_id` bigint(20) DEFAULT NULL,
  `c_weight_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8184453632092FD0`(`check_template_id`) USING BTREE,
  INDEX `FK8184453669897B7D`(`org_type_id`) USING BTREE,
  INDEX `FK81844536929E5720`(`b_org_type_id`) USING BTREE,
  INDEX `FK81844536CDD7D8E2`(`c_weight_type_id`) USING BTREE,
  CONSTRAINT `FK81844536929E5720` FOREIGN KEY (`b_org_type_id`) REFERENCES `c_org_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK81844536CDD7D8E2` FOREIGN KEY (`c_weight_type_id`) REFERENCES `c_weight_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_universal_workorder
-- ----------------------------
DROP TABLE IF EXISTS `b_universal_workorder`;
CREATE TABLE `b_universal_workorder`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `feedBackTime` datetime(0) DEFAULT NULL,
  `isApproval` bit(1) DEFAULT NULL,
  `isFeedBack` bit(1) DEFAULT NULL,
  `pushCycle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `regularEndTime` datetime(0) DEFAULT NULL,
  `regularStartTime` datetime(0) DEFAULT NULL,
  `regularTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sorts` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK1D2FE28C967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK1D2FE28C7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK1D2FE28CDEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK1D2FE28CF7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK1D2FE28CA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_user_customize_relations
-- ----------------------------
DROP TABLE IF EXISTS `b_user_customize_relations`;
CREATE TABLE `b_user_customize_relations`  (
  `user_id` bigint(20) NOT NULL,
  `current_user_id` bigint(20) NOT NULL,
  INDEX `FKBF019FC43078834E`(`user_id`) USING BTREE,
  INDEX `FKBF019FC41EF3381F`(`current_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_user_login_status_log
-- ----------------------------
DROP TABLE IF EXISTS `b_user_login_status_log`;
CREATE TABLE `b_user_login_status_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `client_host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date_long` bigint(20) DEFAULT NULL,
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_date` datetime(0) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK301845E47D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2538 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_ver_interface_his
-- ----------------------------
DROP TABLE IF EXISTS `b_ver_interface_his`;
CREATE TABLE `b_ver_interface_his`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `version_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKCDFF41537D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_ver_interface_his_detail
-- ----------------------------
DROP TABLE IF EXISTS `b_ver_interface_his_detail`;
CREATE TABLE `b_ver_interface_his_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `act_final_check_date` datetime(0) DEFAULT NULL,
  `act_first_check_date` datetime(0) DEFAULT NULL,
  `act_project_split_date` datetime(0) DEFAULT NULL,
  `act_project_Start_date` datetime(0) DEFAULT NULL,
  `capital_invest` decimal(19, 2) DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `contract_invest` decimal(19, 2) DEFAULT NULL,
  `cur_turn_asset_amount` decimal(19, 2) DEFAULT NULL,
  `design_invest` decimal(19, 2) DEFAULT NULL,
  `design_reply_date` datetime(0) DEFAULT NULL,
  `fea_invest` decimal(19, 2) DEFAULT NULL,
  `fea_reply_date` datetime(0) DEFAULT NULL,
  `final_check_invest` decimal(19, 2) DEFAULT NULL,
  `first_check_invest` decimal(19, 2) DEFAULT NULL,
  `former_total_invest` decimal(19, 2) DEFAULT NULL,
  `group_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `invest_source_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `manage_style` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quota1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quota2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quota3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quota4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quota5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quota6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quota7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `solid_total_invest` decimal(19, 2) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `ver_interface_his_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK716140BDCED3654F`(`ver_interface_his_id`) USING BTREE,
  INDEX `FK716140BD7D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_version_attachment
-- ----------------------------
DROP TABLE IF EXISTS `b_version_attachment`;
CREATE TABLE `b_version_attachment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `is_alive` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_must` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `attach_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK65E8F1E7FEC5CE5`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_warning_node
-- ----------------------------
DROP TABLE IF EXISTS `b_warning_node`;
CREATE TABLE `b_warning_node`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime(0) DEFAULT NULL,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `warning_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_wf_audit_content
-- ----------------------------
DROP TABLE IF EXISTS `b_wf_audit_content`;
CREATE TABLE `b_wf_audit_content`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  `wf_act_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKDBFEA8E25603A082`(`wf_act_id`) USING BTREE,
  INDEX `FKDBFEA8E2FEC5CE5`(`user_id`) USING BTREE,
  INDEX `FKDBFEA8E27D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_wf_handler_his
-- ----------------------------
DROP TABLE IF EXISTS `b_wf_handler_his`;
CREATE TABLE `b_wf_handler_his`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `handerDate` datetime(0) DEFAULT NULL,
  `handlerContent` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `nodeName` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `opstr` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `orgName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `taskName` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `wf_act_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `wf_task_id` bigint(20) DEFAULT NULL,
  `business_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `old_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_wfhh_wfa`(`wf_act_id`) USING BTREE,
  INDEX `fk_wfhh_user`(`user_id`) USING BTREE,
  INDEX `FKED84712A325F61C5`(`wf_task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15506 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_wf_task
-- ----------------------------
DROP TABLE IF EXISTS `b_wf_task`;
CREATE TABLE `b_wf_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `begin_time` datetime(0) DEFAULT NULL,
  `deleted_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `end_time` datetime(0) DEFAULT NULL,
  `flowInstanceId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `node_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `oa_state` int(11) DEFAULT NULL,
  `par_task_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `stepInstanceId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `taskName` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `task_show` int(11) DEFAULT NULL,
  `task_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `task_url` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `user_id` bigint(20) DEFAULT NULL,
  `wf_act_id` bigint(20) DEFAULT NULL,
  `pre_user_id` bigint(20) DEFAULT NULL,
  `pre_wftask_id` bigint(20) DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `signin_time` timestamp(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_wft_wfa`(`wf_act_id`) USING BTREE,
  INDEX `fk_wft_user`(`user_id`) USING BTREE,
  INDEX `FK9946EE18688B92D6`(`task_id`) USING BTREE,
  INDEX `fk_wft_preuser`(`pre_user_id`) USING BTREE,
  INDEX `fk_wft_pretask`(`pre_wftask_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32746 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_wfbusiness_error
-- ----------------------------
DROP TABLE IF EXISTS `b_wfbusiness_error`;
CREATE TABLE `b_wfbusiness_error`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessId` bigint(20) DEFAULT NULL,
  `createDate` datetime(0) DEFAULT NULL,
  `error` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `wftaskId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_yang_test
-- ----------------------------
DROP TABLE IF EXISTS `b_yang_test`;
CREATE TABLE `b_yang_test`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `yang_date` datetime(0) DEFAULT NULL,
  `yltestType_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2657 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_yangtest_type
-- ----------------------------
DROP TABLE IF EXISTS `b_yangtest_type`;
CREATE TABLE `b_yangtest_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bs_t_erp_pro_exp
-- ----------------------------
DROP TABLE IF EXISTS `bs_t_erp_pro_exp`;
CREATE TABLE `bs_t_erp_pro_exp`  (
  `PROJECT_EXPEN_ID` double DEFAULT NULL,
  `PROJECT_NUM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_NAME` text CHARACTER SET utf8 COLLATE utf8_bin,
  `EXPENDITURE_DATE` datetime(0) DEFAULT NULL,
  `EXPENDITURE_TOTAL_AMOUNT` double DEFAULT NULL,
  `LAST_UPDATE_DATE` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  INDEX `fk_erprpo_projnum`(`PROJECT_NUM`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bs_t_erp_pro_mis
-- ----------------------------
DROP TABLE IF EXISTS `bs_t_erp_pro_mis`;
CREATE TABLE `bs_t_erp_pro_mis`  (
  `PO_EXPEN_ID` double DEFAULT NULL,
  `PROJECT_NUM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_NAME` text CHARACTER SET utf8 COLLATE utf8_bin,
  `VENDOR_NUM` double DEFAULT NULL,
  `VENDOR_NAME` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MATERIAL_NUM` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MATERIAL_NAME` text CHARACTER SET utf8 COLLATE utf8_bin,
  `SEGMENT1` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SEGMENT1_AMOUNT` double DEFAULT NULL,
  `CREATION_DATE` datetime(0) DEFAULT NULL,
  `CAPITAL_AMOUNT` double DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LAST_UPDATE_DATE` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bs_t_erp_tatol_exp
-- ----------------------------
DROP TABLE IF EXISTS `bs_t_erp_tatol_exp`;
CREATE TABLE `bs_t_erp_tatol_exp`  (
  `ID` double DEFAULT NULL,
  `PERIOD_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PERIOD_DATE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CAPITAL_NPRO_AMOUNT` decimal(30, 2) DEFAULT NULL,
  `CAPITAL_TYPE` text CHARACTER SET utf8 COLLATE utf8_bin,
  `ACCOUNT_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_FLAG` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `CREATION_DATE` datetime(0) DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bs_t_erp_tatol_exp_submodule
-- ----------------------------
DROP TABLE IF EXISTS `bs_t_erp_tatol_exp_submodule`;
CREATE TABLE `bs_t_erp_tatol_exp_submodule`  (
  `PERIOD_DATE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `AMOUNT` decimal(30, 2) DEFAULT NULL,
  `FROM_APP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACCOUNT_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_FLAG` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_NUM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRIMARY_KEY` double DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bs_t_pms_prj
-- ----------------------------
DROP TABLE IF EXISTS `bs_t_pms_prj`;
CREATE TABLE `bs_t_pms_prj`  (
  `PID` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRJ_NAME` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SPECIALTY_TYPE` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRJ_DESC` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRJ_ORIGINAL_TYPE` int(11) DEFAULT NULL,
  `IS_RESEARCHED` int(11) DEFAULT NULL,
  `IS_GROUP_PRJ` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CREATER` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATER_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_DEPT` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_DEPT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PLAN_PRJ_NAME` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PLAN_PRJ_ID` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PLAN_DEPT_PRJ_MANAGER` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PLAN_AMOUNT` double DEFAULT NULL,
  `IS_COMPLETE_RESACRCH` int(11) DEFAULT NULL,
  `IS_NEED_TECH_ACCREDITATION` int(11) DEFAULT NULL,
  `PRJ_SERIAL_NUM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_COMPLETE_DESIGN` int(11) DEFAULT NULL,
  `IS_PRE_STARTED` int(11) DEFAULT NULL,
  `BUILD_DEPT_PRJ_MANAGER` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BUILD_MANAGER_PHONE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRJ_TRANSFER_TIME` double DEFAULT NULL,
  `PRJ_START_TIME` double DEFAULT NULL,
  `PLAN_COMPLETE_TIME` double DEFAULT NULL,
  `PLAN_DESIGN_APPROVAL_TIME` double DEFAULT NULL,
  `PLAN_SUPPLIES_PLACE_TIME` double DEFAULT NULL,
  `ISREF` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OPERATOR` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SPECIALTY_CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_DISCLOSURE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BUDGET_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BUDGET_NAME` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACTUAL_START_TIME` double DEFAULT NULL,
  `ACTUAL_COMPLETE_TIME` double DEFAULT NULL,
  `IS_EMPHASIS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BUILD_DEPT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REQUEST_DEPT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MAKE_CODE_TIME` double DEFAULT NULL,
  `BUILD_SCALE` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_TYPE` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_EXTERNAL_PROJECT` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PLAN_PROJECT_AMOUNT` double DEFAULT NULL,
  `REALITY_PROJECT_AMOUNT` double DEFAULT NULL,
  `ATTACHMENT_SUBMIT_TIME` double DEFAULT NULL,
  `REQUEST_AVAILABLE_TIME` double DEFAULT NULL,
  `REQUEST_DEPT_CONTACT` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `REALITY_EXPENSES_AMOUNT` double DEFAULT NULL,
  `PRJ_BLOCK_NUM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME` int(11) DEFAULT NULL,
  `SECOND_TRAN_DEPID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SECOND_TRAN_MANAGERID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCHEDULE_ADJUSTMENT` int(11) DEFAULT NULL,
  `INVEST_PRJ_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `INVEST_PRJ_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_PLAN_PRJ` double DEFAULT NULL,
  `GROUP_PRJ_STATUS` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `GROUP_STATUS_UPDATE_TIME` bigint(20) DEFAULT NULL,
  `GROUP_PRJ_PID` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `GRADESTATUS` int(11) DEFAULT NULL,
  `ISHISTORY` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RUN_STATUS` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SPECIALTY_TYPE_OLD` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HISTORY_TRAN` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NODE_STS` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ADJUSTMENT_STS` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SPECIALTY_DEP` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SPECIALTY_DEPID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRJ_MODE` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_DXPRJ` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DSESIGN_DEP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `POLICY_TYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RESEARCH_AMOUNT` double DEFAULT NULL,
  `IS_PROPOSALREPKEYAN` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RLM_PREFESSIONAL_TYPE` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bs_t_sm_user
-- ----------------------------
DROP TABLE IF EXISTS `bs_t_sm_user`;
CREATE TABLE `bs_t_sm_user`  (
  `PID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LOGINNAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FULLNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PWD` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `POSITION` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MOBILE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PHONE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FAX` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EMAIL` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `ORDERNUM` int(11) DEFAULT NULL,
  `IMAGE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DEPID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DEPNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `GROUPID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `GROUPNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PTDEPID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PTDEPNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATER` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATETIME` int(11) DEFAULT NULL,
  `LASTMODIFIER` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LASTMODIFYTIME` int(11) DEFAULT NULL,
  `LASTLOGINTIME` int(11) DEFAULT NULL,
  `SYSTEMSKIN` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IPADDRESS` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MSN` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `QQ` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bs_t_soa_assetcustdetail
-- ----------------------------
DROP TABLE IF EXISTS `bs_t_soa_assetcustdetail`;
CREATE TABLE `bs_t_soa_assetcustdetail`  (
  `PID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BOOK_TYPE_CODE` varchar(22) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJRCT_NUMBER` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_NUMBER` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_TYPE` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TAG_NUMBER` varchar(22) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ASSET_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ASSET_DESCRIPTION` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ASSET_NUMBER` varchar(22) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ASSET_CATEGORY` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ASSET_CATEGORY_DESC` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ASSET_LOCATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ASSET_UNITS` varchar(22) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `UNIT_OF_MEASURE` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CAPITALIZED_COST` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CAPITALIZED_DATE` double DEFAULT NULL,
  `ASSET_KEY_CCID_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ASSET_EMPLOYEE` varchar(22) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EMPLOYEE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EMPLOYEE_NUMBER` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DEPRECIATION_EXPENSE_CCID` varchar(22) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MODEL_NUMBER` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MANUFACTORER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DATE_PLACED_IN_SERVICE` double DEFAULT NULL,
  `FA_PERIOD_NAME` varchar(22) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LOCATION_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LOCATION_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_ASSET_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ATTRIBUTE4` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ATTRIBUTE5` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ATTRIBUTE6` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ATTRIBUTE7` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ATTRIBUTE1` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ATTRIBUTE2` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ATTRIBUTE3` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_NAME` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bs_t_soa_orderdistribution
-- ----------------------------
DROP TABLE IF EXISTS `bs_t_soa_orderdistribution`;
CREATE TABLE `bs_t_soa_orderdistribution`  (
  `PID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PO_HEADER_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SEGMENT1` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PO_LINE_NUM` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LINE_LOCATION_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DISTRIBUTION_NUM` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DISTRIBUTION_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_NUM` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_NAME` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EXPENDITURE_TYPE` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUANTITY_ORDERED_MIR` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CHARGE_ACCOUNT_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CHARGE_ACCOUNT_FLEX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CHARGE_ACCOUNT_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_UPDATE_DATE` double DEFAULT NULL,
  `TASK_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELIVER_TO_PERSON_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUANTITY_DELIVERED` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUANTITY_ORDERED` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORGANIZATION_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESTINATION_TYPE` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESTINATION_TYPE_CODE` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EXPENDITURE_ITEM_DATE` double DEFAULT NULL,
  `GL_DATE` double DEFAULT NULL,
  `DIMENSION_COMBINATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUANTITY_CANCELLED` int(11) DEFAULT NULL,
  `QUANTITY_BILLED` int(11) DEFAULT NULL,
  `CODE_COMBINATION_ID` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONCATENATED_SEGMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_UPDATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MAIN_TYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bs_t_soa_orderheader
-- ----------------------------
DROP TABLE IF EXISTS `bs_t_soa_orderheader`;
CREATE TABLE `bs_t_soa_orderheader`  (
  `PID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PO_HEADER_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SEGMENT1` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATION_DATE` double DEFAULT NULL,
  `ORG_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORG_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INTERFACE_SOURCE_CODE` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE_NUM` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AGENT_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AGENT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_SITE_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_SITE` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_CONTACT_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_CONTACT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SHIP_TO_LOCATION_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SHIP_TO_LOCATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BILL_TO_LOCATION_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BILL_TO_LOCATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `START_DATE_ACTIVE` double DEFAULT NULL,
  `END_DATE_ACTIVE` double DEFAULT NULL,
  `CURRENCY_CODE` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RATE_TYPE` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RATE_DATE` double DEFAULT NULL,
  `CURRENCY_CONVERSION_RATE` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PAYMENT_TERMS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATED_BY` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHORIZATION_STATUS` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `APPROVED_DATE` double DEFAULT NULL,
  `VENDOR_ORDER_NUM` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TYPE_LOOKUP_CODE` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PO_AMOUNT` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_UPDATE_DATE` double DEFAULT NULL,
  `ATTRIBUTE1` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE2` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE3` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE4` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE5` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE6` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE7` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE8` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE9` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE10` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE11` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE12` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE13` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE14` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE15` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CLOSED_CODE` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TAX_AMOUNT` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AMOUNT` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE16` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE17` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE18` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE19` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE20` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `APPROVED_FLAG` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_NUMBER` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REVISION_NUM` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORGANIZATION_ID` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTACT_NAME_ALT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TAX_CODE` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MAIN_TYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bs_t_soa_orderline
-- ----------------------------
DROP TABLE IF EXISTS `bs_t_soa_orderline`;
CREATE TABLE `bs_t_soa_orderline`  (
  `PID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PO_HEADER_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PO_LINE_NUM` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LINE_TYPE` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LINE_NUM` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ITEM_NUMBER` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ITEM_DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUANTITY` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UNIT_OF_MEASURE` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UNIT_PRICE` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CURRENCY_CODE` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_NUM` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_NAME` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_AMOUNT` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_UPDATE_DATE` double DEFAULT NULL,
  `CLOSED_CODE` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SEGMENT1` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_PRODUCT_NUM` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SITE_NUMBER` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TAX_CODE` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ITEM_ID` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ITEM_REVISION` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MAIN_TYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bs_t_soa_orderlinelocation
-- ----------------------------
DROP TABLE IF EXISTS `bs_t_soa_orderlinelocation`;
CREATE TABLE `bs_t_soa_orderlinelocation`  (
  `PID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PO_HEADER_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SEGMENT1` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PO_LINE_NUM` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LINE_LOCATION_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SHIPMENT_NUM` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SHIP_TO_ORGANIZATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELIVER_TO_LOCATION_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELIVER_TO_LOCATION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUANTITY_SHIPPED` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUANTITY_RECEIVED` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUANTITY_ACCEPTED` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUANTITY_BILLED` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUANTITY_REJECTED` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUANTITY_CANCELLED` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_UPDATE_DATE` double DEFAULT NULL,
  `CLOSED_FOR_RECEIVING_DATE` double DEFAULT NULL,
  `PROMISED_DATE` double DEFAULT NULL,
  `DEMAND_DATE` double DEFAULT NULL,
  `CONSIGNED_FLAG` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `APPROVED_FLAG` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MAIN_TYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_application_scenes
-- ----------------------------
DROP TABLE IF EXISTS `c_application_scenes`;
CREATE TABLE `c_application_scenes`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_area
-- ----------------------------
DROP TABLE IF EXISTS `c_area`;
CREATE TABLE `c_area`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_assess_package
-- ----------------------------
DROP TABLE IF EXISTS `c_assess_package`;
CREATE TABLE `c_assess_package`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK34F2E5C77D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_assess_package_main
-- ----------------------------
DROP TABLE IF EXISTS `c_assess_package_main`;
CREATE TABLE `c_assess_package_main`  (
  `package_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  INDEX `FK31165D315C31E216`(`project_id`) USING BTREE,
  INDEX `FK31165D312A0313A2`(`package_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_assess_package_power
-- ----------------------------
DROP TABLE IF EXISTS `c_assess_package_power`;
CREATE TABLE `c_assess_package_power`  (
  `package_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  INDEX `FKF1E6208D5C31E216`(`project_id`) USING BTREE,
  INDEX `FKF1E6208D2A0313A2`(`package_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_assess_package_trans
-- ----------------------------
DROP TABLE IF EXISTS `c_assess_package_trans`;
CREATE TABLE `c_assess_package_trans`  (
  `package_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  INDEX `FKF21F8A305C31E216`(`project_id`) USING BTREE,
  INDEX `FKF21F8A302A0313A2`(`package_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_assess_package_wireless
-- ----------------------------
DROP TABLE IF EXISTS `c_assess_package_wireless`;
CREATE TABLE `c_assess_package_wireless`  (
  `package_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  INDEX `FK9C5F63165C31E216`(`project_id`) USING BTREE,
  INDEX `FK9C5F63162A0313A2`(`package_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_assess_quota
-- ----------------------------
DROP TABLE IF EXISTS `c_assess_quota`;
CREATE TABLE `c_assess_quota`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actual_value_algorithm` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `delete_flag` bit(1) DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `design_value_algorithm` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `fea_value_algorithm` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `group_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_leaf` bit(1) DEFAULT NULL,
  `is_main_category` bit(1) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `tree_level` int(11) DEFAULT NULL,
  `root_assess_quota_id` bigint(20) DEFAULT NULL,
  `quota_id` bigint(20) DEFAULT NULL,
  `data_type_id` bigint(20) DEFAULT NULL,
  `source_id` bigint(20) DEFAULT NULL,
  `measure_id` bigint(20) DEFAULT NULL,
  `deviation_alg_type_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKFA8D5C393AB1B812`(`source_id`) USING BTREE,
  INDEX `FKFA8D5C3937A87980`(`root_assess_quota_id`) USING BTREE,
  INDEX `FKFA8D5C39EA24E787`(`deviation_alg_type_id`) USING BTREE,
  INDEX `FKFA8D5C39DC03AE66`(`quota_id`) USING BTREE,
  INDEX `FKFA8D5C391B90CE7`(`data_type_id`) USING BTREE,
  INDEX `FKFA8D5C39C15408F0`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1201 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_assess_template
-- ----------------------------
DROP TABLE IF EXISTS `c_assess_template`;
CREATE TABLE `c_assess_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `delete_flag` bit(1) DEFAULT NULL,
  `enable_flag` bit(1) DEFAULT NULL,
  `is_input_required` bit(1) DEFAULT NULL,
  `is_leaf` bit(1) DEFAULT NULL,
  `is_unit_cost` bit(1) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `tree_level` int(11) DEFAULT NULL,
  `flow_type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `relation_template_id` bigint(20) DEFAULT NULL,
  `fea_flow_type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `wireless_project_type_id` bigint(20) DEFAULT NULL,
  `root_assess_tmpl_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `assess_quota_id` bigint(20) DEFAULT NULL,
  `application_scenes_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKEDE34B19B38D658E`(`wireless_project_type_id`) USING BTREE,
  INDEX `FKEDE34B1947DB9C59`(`root_assess_tmpl_id`) USING BTREE,
  INDEX `FKEDE34B19E8572690`(`fea_flow_type_id`) USING BTREE,
  INDEX `FKEDE34B197CFF04F3`(`flow_type_id`) USING BTREE,
  INDEX `FKEDE34B19675BA6DD`(`assess_quota_id`) USING BTREE,
  INDEX `FKEDE34B19E00D22A2`(`parent_id`) USING BTREE,
  INDEX `FKEDE34B19EDCE4B0F`(`relation_template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1202 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_assess_template_and_itemset
-- ----------------------------
DROP TABLE IF EXISTS `c_assess_template_and_itemset`;
CREATE TABLE `c_assess_template_and_itemset`  (
  `template_id` bigint(20) NOT NULL,
  `itemset_id` bigint(20) NOT NULL,
  INDEX `FK11A729E1C214EDA`(`itemset_id`) USING BTREE,
  INDEX `FK11A729E1CE210CD2`(`template_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_assess_template_and_spec
-- ----------------------------
DROP TABLE IF EXISTS `c_assess_template_and_spec`;
CREATE TABLE `c_assess_template_and_spec`  (
  `template_id` bigint(20) NOT NULL,
  `spec_id` bigint(20) NOT NULL,
  INDEX `FK2D871789E4A9CCF2`(`spec_id`) USING BTREE,
  INDEX `FK2D871789CE210CD2`(`template_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_assess_template_stage
-- ----------------------------
DROP TABLE IF EXISTS `c_assess_template_stage`;
CREATE TABLE `c_assess_template_stage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT NULL,
  `flow_type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `assess_template_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKFE21FA587CFF04F3`(`flow_type_id`) USING BTREE,
  INDEX `FKFE21FA58C437E877`(`assess_template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_assessquota_important_sys
-- ----------------------------
DROP TABLE IF EXISTS `c_assessquota_important_sys`;
CREATE TABLE `c_assessquota_important_sys`  (
  `assess_quota_id` bigint(20) NOT NULL,
  `important_system_id` bigint(20) NOT NULL,
  INDEX `FKFED050E9D94A21DF`(`important_system_id`) USING BTREE,
  INDEX `FKFED050E9675BA6DD`(`assess_quota_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_attachment_stagetype
-- ----------------------------
DROP TABLE IF EXISTS `c_attachment_stagetype`;
CREATE TABLE `c_attachment_stagetype`  (
  `id` bigint(29) NOT NULL DEFAULT 0,
  `attachment_stage_id` bigint(20) DEFAULT NULL,
  `attachment_type_id` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `must` bigint(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_attchment_stage
-- ----------------------------
DROP TABLE IF EXISTS `c_attchment_stage`;
CREATE TABLE `c_attchment_stage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_attchment_type
-- ----------------------------
DROP TABLE IF EXISTS `c_attchment_type`;
CREATE TABLE `c_attchment_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `must` bigint(20) DEFAULT NULL,
  `attachment_stage_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK2E4E74D1F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK2E4E74D15E5F2429`(`attachment_stage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 306 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_audit_fee_type
-- ----------------------------
DROP TABLE IF EXISTS `c_audit_fee_type`;
CREATE TABLE `c_audit_fee_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `base_price` decimal(19, 2) DEFAULT NULL,
  `fee` decimal(19, 2) DEFAULT NULL,
  `fee_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rate` decimal(19, 5) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fee_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_audit_file_type
-- ----------------------------
DROP TABLE IF EXISTS `c_audit_file_type`;
CREATE TABLE `c_audit_file_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `paper_select` int(19) DEFAULT NULL,
  `soft_select` int(19) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_audit_org_rate
-- ----------------------------
DROP TABLE IF EXISTS `c_audit_org_rate`;
CREATE TABLE `c_audit_org_rate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `base_rate` decimal(19, 4) DEFAULT NULL,
  `benefit_rate` decimal(19, 4) DEFAULT NULL,
  `entrust_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK42FAFC9BC348A084`(`entrust_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_audit_problem_type
-- ----------------------------
DROP TABLE IF EXISTS `c_audit_problem_type`;
CREATE TABLE `c_audit_problem_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_audit_score_rate
-- ----------------------------
DROP TABLE IF EXISTS `c_audit_score_rate`;
CREATE TABLE `c_audit_score_rate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rate` decimal(19, 4) DEFAULT NULL,
  `score` decimal(19, 2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_audit_score_type
-- ----------------------------
DROP TABLE IF EXISTS `c_audit_score_type`;
CREATE TABLE `c_audit_score_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_total` decimal(19, 2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_audit_status
-- ----------------------------
DROP TABLE IF EXISTS `c_audit_status`;
CREATE TABLE `c_audit_status`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_audit_wf_config
-- ----------------------------
DROP TABLE IF EXISTS `c_audit_wf_config`;
CREATE TABLE `c_audit_wf_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `audit_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `business_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `node_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `task_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `task_status_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_biz_category_type
-- ----------------------------
DROP TABLE IF EXISTS `c_biz_category_type`;
CREATE TABLE `c_biz_category_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `category_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_CATEGORY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `category_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_budget_type
-- ----------------------------
DROP TABLE IF EXISTS `c_budget_type`;
CREATE TABLE `c_budget_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_build_type
-- ----------------------------
DROP TABLE IF EXISTS `c_build_type`;
CREATE TABLE `c_build_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_capital_adjust_type
-- ----------------------------
DROP TABLE IF EXISTS `c_capital_adjust_type`;
CREATE TABLE `c_capital_adjust_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_capital_type
-- ----------------------------
DROP TABLE IF EXISTS `c_capital_type`;
CREATE TABLE `c_capital_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_check_temp_spec
-- ----------------------------
DROP TABLE IF EXISTS `c_check_temp_spec`;
CREATE TABLE `c_check_temp_spec`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_check_templete
-- ----------------------------
DROP TABLE IF EXISTS `c_check_templete`;
CREATE TABLE `c_check_templete`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `check_cycles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `end_year` int(11) DEFAULT NULL,
  `score` decimal(19, 2) DEFAULT NULL,
  `start_year` int(11) DEFAULT NULL,
  `spec_id` bigint(20) DEFAULT NULL,
  `org_type_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `effective` bit(1) DEFAULT NULL,
  `joint_score` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK40AE8C31C34D5868`(`spec_id`) USING BTREE,
  INDEX `FK40AE8C3169897B7D`(`org_type_id`) USING BTREE,
  INDEX `FK40AE8C3116FC4E57`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1085 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_city
-- ----------------------------
DROP TABLE IF EXISTS `c_city`;
CREATE TABLE `c_city`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `mapping_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_code
-- ----------------------------
DROP TABLE IF EXISTS `c_code`;
CREATE TABLE `c_code`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `code_sql` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_construct_type
-- ----------------------------
DROP TABLE IF EXISTS `c_construct_type`;
CREATE TABLE `c_construct_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_contract_type
-- ----------------------------
DROP TABLE IF EXISTS `c_contract_type`;
CREATE TABLE `c_contract_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_delay_type
-- ----------------------------
DROP TABLE IF EXISTS `c_delay_type`;
CREATE TABLE `c_delay_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_deviation_algorithm_type
-- ----------------------------
DROP TABLE IF EXISTS `c_deviation_algorithm_type`;
CREATE TABLE `c_deviation_algorithm_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_engineering_type
-- ----------------------------
DROP TABLE IF EXISTS `c_engineering_type`;
CREATE TABLE `c_engineering_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_file_name
-- ----------------------------
DROP TABLE IF EXISTS `c_file_name`;
CREATE TABLE `c_file_name`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_flow_org
-- ----------------------------
DROP TABLE IF EXISTS `c_flow_org`;
CREATE TABLE `c_flow_org`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descript` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `workflow_id` bigint(20) DEFAULT NULL,
  `flowtype_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_orgflow_org`(`org_id`) USING BTREE,
  INDEX `fk_orgflow_flowtype`(`flowtype_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_flowtype
-- ----------------------------
DROP TABLE IF EXISTS `c_flowtype`;
CREATE TABLE `c_flowtype`  (
  `flowtype_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descript` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `flowtype_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `flow_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `my_workflow_id` bigint(20) DEFAULT NULL,
  `workflow_id` bigint(20) DEFAULT NULL,
  `module_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`flowtype_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_histroy_quota_and_project
-- ----------------------------
DROP TABLE IF EXISTS `c_histroy_quota_and_project`;
CREATE TABLE `c_histroy_quota_and_project`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issued_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `wireless_project_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK69024F09B38D658E`(`wireless_project_type_id`) USING BTREE,
  INDEX `FK69024F095C31E216`(`project_id`) USING BTREE,
  INDEX `FK69024F095165EE6C`(`issued_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_important_system
-- ----------------------------
DROP TABLE IF EXISTS `c_important_system`;
CREATE TABLE `c_important_system`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_item_set
-- ----------------------------
DROP TABLE IF EXISTS `c_item_set`;
CREATE TABLE `c_item_set`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `spec_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKC4009592E4A9CCF2`(`spec_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_material_type
-- ----------------------------
DROP TABLE IF EXISTS `c_material_type`;
CREATE TABLE `c_material_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_member_role
-- ----------------------------
DROP TABLE IF EXISTS `c_member_role`;
CREATE TABLE `c_member_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `warn_type` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_member_type
-- ----------------------------
DROP TABLE IF EXISTS `c_member_type`;
CREATE TABLE `c_member_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_module_wf_config
-- ----------------------------
DROP TABLE IF EXISTS `c_module_wf_config`;
CREATE TABLE `c_module_wf_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `business_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `node_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `module_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `biz_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_month
-- ----------------------------
DROP TABLE IF EXISTS `c_month`;
CREATE TABLE `c_month`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_my_test_type
-- ----------------------------
DROP TABLE IF EXISTS `c_my_test_type`;
CREATE TABLE `c_my_test_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_org_type
-- ----------------------------
DROP TABLE IF EXISTS `c_org_type`;
CREATE TABLE `c_org_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 206 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_organization
-- ----------------------------
DROP TABLE IF EXISTS `c_organization`;
CREATE TABLE `c_organization`  (
  `id` bigint(20) NOT NULL,
  `isLeaf_flag` bit(1) DEFAULT NULL,
  `isRoot_flag` bit(1) DEFAULT NULL,
  `Unit_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active_flag` bit(1) DEFAULT NULL,
  `party_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contact` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `party_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `end_date` datetime(0) DEFAULT NULL,
  `finacial_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `finacial_code_td` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `inner_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `level_no` int(11) DEFAULT NULL,
  `long_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `manager` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mis_code` bigint(20) DEFAULT NULL,
  `party_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `o_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `simple_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `start_date` datetime(0) DEFAULT NULL,
  `deparment_type_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `update_date` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK21A94F8F31D9D077`(`deparment_type_id`) USING BTREE,
  INDEX `FK21A94F8F23E3E60E`(`parent_id`) USING BTREE,
  INDEX `fk_org_name`(`party_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_page_config
-- ----------------------------
DROP TABLE IF EXISTS `c_page_config`;
CREATE TABLE `c_page_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `field_height` int(11) DEFAULT NULL,
  `field_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `field_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `field_width` int(11) DEFAULT NULL,
  `hidden_flag` bit(1) DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_partner
-- ----------------------------
DROP TABLE IF EXISTS `c_partner`;
CREATE TABLE `c_partner`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active_flag` bit(1) DEFAULT NULL,
  `business_contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `business_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `business_scope` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `company_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `company_profile` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `cooperative_nature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `enterprise_legal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `enterprise_nature` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `enterprise_website` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `establish_date` datetime(0) DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `human_resources` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `other_things` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qualifications` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `registered_capital` decimal(19, 2) DEFAULT NULL,
  `short_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zip_code` decimal(19, 2) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `s_org_id` bigint(20) DEFAULT NULL,
  `deparment_type_id` bigint(20) DEFAULT NULL,
  `inner_user_id` bigint(20) DEFAULT NULL,
  `q_dep_id` bigint(20) DEFAULT NULL,
  `qualification_sta_date` datetime(0) DEFAULT NULL,
  `qualification_end_date` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKB3C370EC20469BFC`(`inner_user_id`) USING BTREE,
  INDEX `FKB3C370EC31D9D077`(`deparment_type_id`) USING BTREE,
  INDEX `FKB3C370EC7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKB3C370ECB7F502E0`(`s_org_id`) USING BTREE,
  INDEX `FKB3C370ECD9D73F0C`(`q_dep_id`) USING BTREE,
  CONSTRAINT `FKB3C370EC3FB65395` FOREIGN KEY (`q_dep_id`) REFERENCES `b_qualification_issuing_dep` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKB3C370ECD9D73F0C` FOREIGN KEY (`q_dep_id`) REFERENCES `c_partner_qualification_dep` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 401 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_partner_job
-- ----------------------------
DROP TABLE IF EXISTS `c_partner_job`;
CREATE TABLE `c_partner_job`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_partner_qualification_dep
-- ----------------------------
DROP TABLE IF EXISTS `c_partner_qualification_dep`;
CREATE TABLE `c_partner_qualification_dep`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_partner_user
-- ----------------------------
DROP TABLE IF EXISTS `c_partner_user`;
CREATE TABLE `c_partner_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `personnel_post` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active_flag` bit(1) DEFAULT NULL,
  `cardId` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `education` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_date` datetime(0) DEFAULT NULL,
  `login_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `last_user_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `is_manager` bit(1) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKE50BE73E8D7DEAC9`(`org_id`) USING BTREE,
  INDEX `FKE50BE73EFEC5CE5`(`user_id`) USING BTREE,
  INDEX `FKE50BE73E7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKE50BE73E3215A03C`(`last_user_id`) USING BTREE,
  INDEX `FKE50BE73ECEA4C927`(`job_id`) USING BTREE,
  INDEX `FKE50BE73EF7258E38`(`attachment_unit_id`) USING BTREE,
  CONSTRAINT `FKE50BE73EF7258E38` FOREIGN KEY (`attachment_unit_id`) REFERENCES `b_attachment_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1159 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_plan_type
-- ----------------------------
DROP TABLE IF EXISTS `c_plan_type`;
CREATE TABLE `c_plan_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_policy_type
-- ----------------------------
DROP TABLE IF EXISTS `c_policy_type`;
CREATE TABLE `c_policy_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_pro_type
-- ----------------------------
DROP TABLE IF EXISTS `c_pro_type`;
CREATE TABLE `c_pro_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_process_type
-- ----------------------------
DROP TABLE IF EXISTS `c_process_type`;
CREATE TABLE `c_process_type`  (
  `id` int(11) NOT NULL,
  `process_type` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_product_material
-- ----------------------------
DROP TABLE IF EXISTS `c_product_material`;
CREATE TABLE `c_product_material`  (
  `id` bigint(20) NOT NULL,
  `product_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `material_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `material_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `material_unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_professional
-- ----------------------------
DROP TABLE IF EXISTS `c_professional`;
CREATE TABLE `c_professional`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_project_info_type
-- ----------------------------
DROP TABLE IF EXISTS `c_project_info_type`;
CREATE TABLE `c_project_info_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_project_type
-- ----------------------------
DROP TABLE IF EXISTS `c_project_type`;
CREATE TABLE `c_project_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_purchaserequire_type
-- ----------------------------
DROP TABLE IF EXISTS `c_purchaserequire_type`;
CREATE TABLE `c_purchaserequire_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_quarter
-- ----------------------------
DROP TABLE IF EXISTS `c_quarter`;
CREATE TABLE `c_quarter`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_quota
-- ----------------------------
DROP TABLE IF EXISTS `c_quota`;
CREATE TABLE `c_quota`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `algorithm` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `algorithm_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `data_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `delete_flag` bit(1) DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `is_area` bit(1) DEFAULT NULL,
  `is_city` bit(1) DEFAULT NULL,
  `is_province` bit(1) DEFAULT NULL,
  `is_warning` bit(1) DEFAULT NULL,
  `level_no` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quota_scene` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quota_template` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `warning_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quota_specialty_id` bigint(20) DEFAULT NULL,
  `measure_id` bigint(20) DEFAULT NULL,
  `caliber_id` bigint(20) DEFAULT NULL,
  `report_org_id` bigint(20) DEFAULT NULL,
  `specialty_id` bigint(20) DEFAULT NULL,
  `siphon_cycle_id` bigint(20) DEFAULT NULL,
  `warning_cal_rule_id` bigint(20) DEFAULT NULL,
  `source_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `FK1D948B9C3AB1B812`(`source_id`) USING BTREE,
  INDEX `FK1D948B9C15257867`(`siphon_cycle_id`) USING BTREE,
  INDEX `FK1D948B9C7E5113C2`(`measure_id`) USING BTREE,
  INDEX `FK1D948B9CCFB6A802`(`caliber_id`) USING BTREE,
  INDEX `FK1D948B9CE1BE4C29`(`quota_specialty_id`) USING BTREE,
  INDEX `FK1D948B9C75A502FF`(`report_org_id`) USING BTREE,
  INDEX `FK1D948B9C72168D28`(`warning_cal_rule_id`) USING BTREE,
  INDEX `FK1D948B9C122B14CF`(`specialty_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_quota_caliber
-- ----------------------------
DROP TABLE IF EXISTS `c_quota_caliber`;
CREATE TABLE `c_quota_caliber`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_quota_data_type
-- ----------------------------
DROP TABLE IF EXISTS `c_quota_data_type`;
CREATE TABLE `c_quota_data_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_quota_library
-- ----------------------------
DROP TABLE IF EXISTS `c_quota_library`;
CREATE TABLE `c_quota_library`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(0) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `delete_flag` bit(1) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `quota_value` decimal(19, 2) DEFAULT NULL,
  `update_date` datetime(0) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `quota_id` bigint(20) DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK6204FB18BD4E7F05`(`area_id`) USING BTREE,
  INDEX `FK6204FB18DC03AE66`(`quota_id`) USING BTREE,
  INDEX `FK6204FB1882483A3A`(`city_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_quota_library_his
-- ----------------------------
DROP TABLE IF EXISTS `c_quota_library_his`;
CREATE TABLE `c_quota_library_his`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(0) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `quota_value` decimal(19, 2) DEFAULT NULL,
  `update_date` datetime(0) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `quota_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK928E71EBDC03AE66`(`quota_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_quota_measure
-- ----------------------------
DROP TABLE IF EXISTS `c_quota_measure`;
CREATE TABLE `c_quota_measure`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_quota_report
-- ----------------------------
DROP TABLE IF EXISTS `c_quota_report`;
CREATE TABLE `c_quota_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(0) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `delete_flag` bit(1) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `quota_value` decimal(19, 2) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `quota_id` bigint(20) DEFAULT NULL,
  `quota_lib_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK2E3CBF37BD4E7F05`(`area_id`) USING BTREE,
  INDEX `FK2E3CBF37F4CAAB3`(`quota_lib_id`) USING BTREE,
  INDEX `FK2E3CBF37DC03AE66`(`quota_id`) USING BTREE,
  INDEX `FK2E3CBF3782483A3A`(`city_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_quota_report_his
-- ----------------------------
DROP TABLE IF EXISTS `c_quota_report_his`;
CREATE TABLE `c_quota_report_his`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(0) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `delete_flag` decimal(19, 2) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `quota_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK36F90E8ADC03AE66`(`quota_id`) USING BTREE,
  INDEX `FK36F90E8A6AE860E4`(`creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_quota_siphon_cycle
-- ----------------------------
DROP TABLE IF EXISTS `c_quota_siphon_cycle`;
CREATE TABLE `c_quota_siphon_cycle`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `gen_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `syn_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_quota_source
-- ----------------------------
DROP TABLE IF EXISTS `c_quota_source`;
CREATE TABLE `c_quota_source`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_quota_specialty
-- ----------------------------
DROP TABLE IF EXISTS `c_quota_specialty`;
CREATE TABLE `c_quota_specialty`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_quota_warning_cal_rule
-- ----------------------------
DROP TABLE IF EXISTS `c_quota_warning_cal_rule`;
CREATE TABLE `c_quota_warning_cal_rule`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_sbc_mapping
-- ----------------------------
DROP TABLE IF EXISTS `c_sbc_mapping`;
CREATE TABLE `c_sbc_mapping`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sbc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sbc_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_schedule_template_next
-- ----------------------------
DROP TABLE IF EXISTS `c_schedule_template_next`;
CREATE TABLE `c_schedule_template_next`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `person_condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `schedule_template_id` bigint(20) DEFAULT NULL,
  `schedule_type_id` bigint(20) DEFAULT NULL,
  `scondition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK927CE34C914D8F8D`(`schedule_type_id`) USING BTREE,
  INDEX `FK927CE34C2AA1460D`(`schedule_template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1142 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_schedule_template_org
-- ----------------------------
DROP TABLE IF EXISTS `c_schedule_template_org`;
CREATE TABLE `c_schedule_template_org`  (
  `schedule_template_id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  INDEX `FKDB6F676B6C5DDD94`(`org_id`) USING BTREE,
  INDEX `FKDB6F676B2AA1460D`(`schedule_template_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_schedule_template_pre
-- ----------------------------
DROP TABLE IF EXISTS `c_schedule_template_pre`;
CREATE TABLE `c_schedule_template_pre`  (
  `schedule_template_id` bigint(20) NOT NULL,
  `schedule_type_id` bigint(20) NOT NULL,
  INDEX `FKDB6F6B2A914D8F8D`(`schedule_type_id`) USING BTREE,
  INDEX `FKDB6F6B2A2AA1460D`(`schedule_template_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_schedule_template_preno
-- ----------------------------
DROP TABLE IF EXISTS `c_schedule_template_preno`;
CREATE TABLE `c_schedule_template_preno`  (
  `schedule_template_id` bigint(20) NOT NULL,
  `schedule_type_id` bigint(20) NOT NULL,
  INDEX `FKBD41566B914D8F8D`(`schedule_type_id`) USING BTREE,
  INDEX `FKBD41566B2AA1460D`(`schedule_template_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_schedule_template_spec
-- ----------------------------
DROP TABLE IF EXISTS `c_schedule_template_spec`;
CREATE TABLE `c_schedule_template_spec`  (
  `schedule_template_id` bigint(20) NOT NULL,
  `spec_id` bigint(20) NOT NULL,
  INDEX `FK927F5014E4A9CCF2`(`spec_id`) USING BTREE,
  INDEX `FK927F50142AA1460D`(`schedule_template_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_schedule_templete
-- ----------------------------
DROP TABLE IF EXISTS `c_schedule_templete`;
CREATE TABLE `c_schedule_templete`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `activity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activity_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `actual_date_from_activity` bit(1) DEFAULT NULL,
  `after_warn_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `after_warn_days` int(11) DEFAULT NULL,
  `after_warn_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `before_warn_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `before_warn_days` int(11) DEFAULT NULL,
  `before_warn_rate` int(11) DEFAULT NULL,
  `before_warn_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `experience_value` int(11) DEFAULT NULL,
  `has_activity` bit(1) DEFAULT NULL,
  `is_after_warn` bit(1) DEFAULT NULL,
  `is_after_warnup` bit(1) DEFAULT NULL,
  `is_autotask` bit(1) DEFAULT NULL,
  `is_look` bit(1) DEFAULT NULL,
  `is_milestone` bit(1) DEFAULT NULL,
  `is_required` bit(1) DEFAULT NULL,
  `is_warn` bit(1) DEFAULT NULL,
  `is_write_finish` bit(1) DEFAULT NULL,
  `level_no` int(11) DEFAULT NULL,
  `required_flag` bit(1) DEFAULT NULL,
  `progress` decimal(19, 2) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `warn_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `warn_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `work_date` int(11) DEFAULT NULL,
  `schedule_type_id` bigint(20) DEFAULT NULL,
  `root_templete_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `is_feasibility` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_invitebid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_type_id` bigint(20) DEFAULT NULL,
  `policy_type_id` bigint(20) DEFAULT NULL,
  `proType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_info_Type_id` tinyblob,
  `proj_info_type_id` bigint(20) DEFAULT NULL,
  `deviation` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK27D62B4A8637618E`(`proj_info_type_id`) USING BTREE,
  INDEX `FK27D62B4AC6B17E54`(`root_templete_id`) USING BTREE,
  INDEX `FK27D62B4A6498D809`(`project_type_id`) USING BTREE,
  INDEX `FK27D62B4A914D8F8D`(`schedule_type_id`) USING BTREE,
  INDEX `FK27D62B4A8B3C9585`(`parent_id`) USING BTREE,
  INDEX `FK27D62B4A50F0F543`(`policy_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1212 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_schedule_type
-- ----------------------------
DROP TABLE IF EXISTS `c_schedule_type`;
CREATE TABLE `c_schedule_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `activity_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `class_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attchment_Stage_id` int(11) DEFAULT NULL,
  `create_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `has_activity` bit(1) DEFAULT NULL,
  `level_no` int(11) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `specialty_id` bigint(20) DEFAULT NULL,
  `limit_type_id` bigint(20) DEFAULT NULL,
  `is_keynode` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKF529A50626EBADC5`(`parent_id`) USING BTREE,
  INDEX `FKF529A506122B14CF`(`specialty_id`) USING BTREE,
  INDEX `FKF529A50692E0E4B1`(`limit_type_id`) USING BTREE,
  CONSTRAINT `FKF529A50692E0E4B1` FOREIGN KEY (`limit_type_id`) REFERENCES `c_schedule_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_schedule_warn_template
-- ----------------------------
DROP TABLE IF EXISTS `c_schedule_warn_template`;
CREATE TABLE `c_schedule_warn_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_warning` bit(1) DEFAULT NULL,
  `schedule_type_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `warn_template_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK627891C77D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK627891C7D4155A6B`(`warn_template_id`) USING BTREE,
  INDEX `FK627891C7914D8F8D`(`schedule_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_score_eventtype
-- ----------------------------
DROP TABLE IF EXISTS `c_score_eventtype`;
CREATE TABLE `c_score_eventtype`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_single_description
-- ----------------------------
DROP TABLE IF EXISTS `c_single_description`;
CREATE TABLE `c_single_description`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_specialty
-- ----------------------------
DROP TABLE IF EXISTS `c_specialty`;
CREATE TABLE `c_specialty`  (
  `id` bigint(20) NOT NULL,
  `isLeaf_flag` bit(1) DEFAULT NULL,
  `isRoot_flag` bit(1) DEFAULT NULL,
  `active_flag` bit(1) DEFAULT NULL,
  `party_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `party_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `finacial_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `inner_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `level_no` int(11) DEFAULT NULL,
  `party_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `spec_detail_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `spec_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `spec_year` int(11) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `is_real_estate` bit(1) DEFAULT NULL,
  `long_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `first_spec_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKD6AE2022D7C761A3`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_status_type
-- ----------------------------
DROP TABLE IF EXISTS `c_status_type`;
CREATE TABLE `c_status_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_suggestpurchase_way
-- ----------------------------
DROP TABLE IF EXISTS `c_suggestpurchase_way`;
CREATE TABLE `c_suggestpurchase_way`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_user_leader
-- ----------------------------
DROP TABLE IF EXISTS `c_user_leader`;
CREATE TABLE `c_user_leader`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `leader_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK1D96E215D0C92E7`(`leader_id`) USING BTREE,
  INDEX `FK1D96E21FEC5CE5`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_warn_template
-- ----------------------------
DROP TABLE IF EXISTS `c_warn_template`;
CREATE TABLE `c_warn_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `schedule_template_con_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `schedule_template_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5665CB371F723B6A`(`schedule_template_con_id`) USING BTREE,
  INDEX `FK5665CB377D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK5665CB372AA1460D`(`schedule_template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_weight_type
-- ----------------------------
DROP TABLE IF EXISTS `c_weight_type`;
CREATE TABLE `c_weight_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_wireless_project_type
-- ----------------------------
DROP TABLE IF EXISTS `c_wireless_project_type`;
CREATE TABLE `c_wireless_project_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_withholding_stage
-- ----------------------------
DROP TABLE IF EXISTS `c_withholding_stage`;
CREATE TABLE `c_withholding_stage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_workorder_type
-- ----------------------------
DROP TABLE IF EXISTS `c_workorder_type`;
CREATE TABLE `c_workorder_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_asset_cust_detai
-- ----------------------------
DROP TABLE IF EXISTS `if_asset_cust_detai`;
CREATE TABLE `if_asset_cust_detai`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ASSET_CATEGORY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSET_CATEGORY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSET_DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSET_EMPLOYEE` decimal(19, 2) DEFAULT NULL,
  `ASSET_KEY_CCID_DESC` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `ASSET_LOCATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSET_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSET_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSET_UNITS` decimal(19, 2) DEFAULT NULL,
  `ATTRIBUTE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BOOK_TYPE_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CAPITALIZED_COST` decimal(19, 2) DEFAULT NULL,
  `CAPITALIZED_DATE` datetime(0) DEFAULT NULL,
  `create_Date` datetime(0) DEFAULT NULL,
  `DATE_PLACED_IN_SERVICE` datetime(0) DEFAULT NULL,
  `DEPRECIATION_EXPENSE_CCID` decimal(19, 2) DEFAULT NULL,
  `EMPLOYEE_NAME` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `EMPLOYEE_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FA_PERIOD_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LOCATION_CODE` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `LOCATION_ID` decimal(19, 2) DEFAULT NULL,
  `MANUFACTORER_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MODEL_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ASSET_ID` decimal(19, 2) DEFAULT NULL,
  `PROJECT_ID` decimal(19, 2) DEFAULT NULL,
  `PROJECT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJRCT_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TAG_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TASK_ID` decimal(19, 2) DEFAULT NULL,
  `TASK_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TASK_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UNIT_OF_MEASURE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_Date` datetime(0) DEFAULT NULL,
  `PID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_assetcustd_projnum`(`PROJRCT_NUMBER`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1401253 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_asset_detai
-- ----------------------------
DROP TABLE IF EXISTS `if_asset_detai`;
CREATE TABLE `if_asset_detai`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `APPLICATIONS_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `APPLICATIONS_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSET_CLASS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSET_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSET_NET_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `ASSET_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSET_STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSET_UNITS` decimal(19, 2) DEFAULT NULL,
  `ASSIGNED_DEPT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSIGNED_DEPT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSIGNED_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSIGNED_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUSINESS_PLAT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUSINESS_PLAT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CATEGORY_DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CATEGORY_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCTION_EQUIPMENT_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_Date` datetime(0) DEFAULT NULL,
  `CREATION_DATE` datetime(0) DEFAULT NULL,
  `DATE_ACTIVE` datetime(0) DEFAULT NULL,
  `DATE_RETIRED` datetime(0) DEFAULT NULL,
  `DEPRN_LEFT_MONTH` decimal(19, 2) DEFAULT NULL,
  `DEPRN_RESERVE` decimal(19, 2) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FIXED_ASSETS_COST` decimal(19, 2) DEFAULT NULL,
  `IMPAIRMENT_RESERVE` decimal(19, 2) DEFAULT NULL,
  `INVEST_CLASS_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INVEST_CLASS_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `LIFE_IN_MONTHS` decimal(19, 2) DEFAULT NULL,
  `LOCATION_CLASS_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LOCATION_CLASS_DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LOCATION_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LOCATION_DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LOGIC_NET_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LOGIC_NET_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MAN_DEPT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MAN_DEPT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MANUFACTURER_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MODEL_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NET_BOOK_VALUE` decimal(19, 2) DEFAULT NULL,
  `NET_LEVEL_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NET_LEVEL_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_CLASS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PTD_DEPRN` decimal(19, 2) DEFAULT NULL,
  `PTD_IMPAIRMENT` decimal(19, 2) DEFAULT NULL,
  `REFERENCE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RETIRED_REASON` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SALVAGE_VALUE` decimal(19, 2) DEFAULT NULL,
  `SHARED_EQUIPMENT_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SUPPORT_EQUIPMENT_DES` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SUPPORT_EQUIPMENT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TAG_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TRANSMISSION_LINE_UNIT` decimal(19, 2) DEFAULT NULL,
  `UNIT_OF_MEASURE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_Date` datetime(0) DEFAULT NULL,
  `USER_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USING_DEPT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `YTD_DEPRN` decimal(19, 2) DEFAULT NULL,
  `YTD_IMPAIRMENT` decimal(19, 2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_claim_doc
-- ----------------------------
DROP TABLE IF EXISTS `if_claim_doc`;
CREATE TABLE `if_claim_doc`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ATTRIBUTE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_NUM` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `create_Date` datetime(0) DEFAULT NULL,
  `CREATE_BY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CURRENT_PROCESSOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DEPARTMENT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DOC_STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DOC_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DOCUMENT_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DOCUMENT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DOCUMENT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INVOICE_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `INVOICE_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `ORGNIZATION_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORGNIZATION_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PAYMENT_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `SUBMIT_DATE` datetime(0) DEFAULT NULL,
  `TIME` datetime(0) DEFAULT NULL,
  `TOTAL_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `update_Date` datetime(0) DEFAULT NULL,
  `VENDOR_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `doc_TIME` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_claim_line
-- ----------------------------
DROP TABLE IF EXISTS `if_claim_line`;
CREATE TABLE `if_claim_line`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACTIVITY_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ACTIVITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AMOUNT` decimal(19, 2) DEFAULT NULL,
  `ATTRIBUTE10_LINE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE1_LINE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE2_LINE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE3_LINE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE4_LINE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE5_LINE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE6_LINE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE7_LINE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE8_LINE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE9_LINE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_DEPT_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_DEPT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_PROJECT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_PROJECT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_LINE_NUM` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `CONTRACT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DOCUMENT_ITEM_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DOCUMENT_ITEM_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DOCUMENT_LINE_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `modifty_Date` datetime(0) DEFAULT NULL,
  `PROJECT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `doc_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKA9053EB978684714`(`doc_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_contract_info
-- ----------------------------
DROP TABLE IF EXISTS `if_contract_info`;
CREATE TABLE `if_contract_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `BUYER_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `CONTRACT_AMOUNT_TOTAL` decimal(19, 2) DEFAULT NULL,
  `CONTRACT_CATEGORY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_DEPT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_DESCRIPTION` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `CONTRACT_DRAFTER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_DRAFTER_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_SOURCE_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_URL` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `CONVERSION_RATE` decimal(19, 2) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `END_DATE_ACTIVE` datetime(0) DEFAULT NULL,
  `EPMSID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EPOID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ERP_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FRAME_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INPUT_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `modifty_Date` datetime(0) DEFAULT NULL,
  `ORG_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORG_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `OU_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `OU_CODE_VIRTUAL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_CONTRACT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARTENT_CONTRACT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARTNER_SIGNN_DATE` datetime(0) DEFAULT NULL,
  `PAYEMNT_TERM` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `PAYMENT_METHOD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PAYMENT_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROMISED_DATE` datetime(0) DEFAULT NULL,
  `REFERENCE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SIGNN_DATE` datetime(0) DEFAULT NULL,
  `SOURCING_METHOD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `START_DATE_ACTIVE` datetime(0) DEFAULT NULL,
  `TAX_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `VAT_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_SITE_ID` decimal(19, 2) DEFAULT NULL,
  `contract_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKC6F53BF9FD356CFE`(`contract_id`) USING BTREE,
  INDEX `fk_contract_code`(`CONTRACT_CODE`) USING BTREE,
  INDEX `fk_contract_vname`(`VENDOR_NAME`) USING BTREE,
  INDEX `fk_contract_pcode`(`PROJECT_NUMBER`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75529 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_contract_line
-- ----------------------------
DROP TABLE IF EXISTS `if_contract_line`;
CREATE TABLE `if_contract_line`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACTIVITY_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ACTIVITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AMOUNT` decimal(19, 2) DEFAULT NULL,
  `ATTRIBUTE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BRAND_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_ACCOUNT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_ACCOUNT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_DEPT_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_DEPT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_MONTH` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_PROJECT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_PROJECT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_QUARTER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_YEAR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CHANNEL_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COMPANY_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DIMENSION1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DIMENSION2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DIMENSION3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DIMENSION4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DIMENSION5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DIMENSION6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ITEM_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `LINE_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `modifty_Date` datetime(0) DEFAULT NULL,
  `PRICE` decimal(19, 2) DEFAULT NULL,
  `PRODUCT_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUANTITY` decimal(19, 2) DEFAULT NULL,
  `STRATEGY_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TAX_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `TAX_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USERGROUP_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contract_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKC6E7FB5FAA534F7E`(`Contract_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72670 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_execution_line
-- ----------------------------
DROP TABLE IF EXISTS `if_execution_line`;
CREATE TABLE `if_execution_line`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ATTRIBUTE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BATCH_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DIMENSION1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DIMENSION2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DIMENSION3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DIMENSION4` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `DIMENSION5` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `DIMENSION6` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `ISCONSPROJECT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `LINE_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `modifty_Date` datetime(0) DEFAULT NULL,
  `PAYMENT_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `PAYMENT_CONDITION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PAYMENT_PROPORTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PAYMENT_SCHEDULE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SCHEDULE_DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TAX_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `Contract_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK734F345DAA534F7E`(`Contract_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_material_info
-- ----------------------------
DROP TABLE IF EXISTS `if_material_info`;
CREATE TABLE `if_material_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CATEGORIES_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CATEGORY_CONCAT_SEGS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CATEGORY_ID` decimal(19, 2) DEFAULT NULL,
  `CLASS_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_Date` datetime(0) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EXPENSE_ACCOUNT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EXPENSE_ACCOUNT_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EXPENSE_ACCOUNT_ID` decimal(19, 2) DEFAULT NULL,
  `INVENTORY_ITEM_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INVENTORY_ITEM_ID` decimal(19, 2) DEFAULT NULL,
  `INVENTORY_ITEM_STATUS_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ITEM_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ITEM_TYPE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `LOT_CONTROL_CODE` decimal(19, 2) DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORGANIZATION_ID` decimal(19, 2) DEFAULT NULL,
  `PRIMARY_UNIT_OF_MEASURE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRIMARY_UOM_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PURCHASING_ENABLED_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SEGMENT1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SERIAL_NUMBER_CONTROL_CODE` decimal(19, 2) DEFAULT NULL,
  `update_Date` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8325 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_oa_appy
-- ----------------------------
DROP TABLE IF EXISTS `if_oa_appy`;
CREATE TABLE `if_oa_appy`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `business_Id` bigint(20) DEFAULT NULL,
  `business_Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_Date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `document_Title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `employee_Num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `modify_Date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `is_office` bit(1) DEFAULT NULL,
  `oa_code` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `oa_date` datetime(0) DEFAULT NULL,
  `oa_status` bit(1) DEFAULT NULL,
  `attach_Url` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `red_word_Url` varchar(156) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `policy_Type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ref_Url` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK6CB58FA37D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK6CB58FA3F7258E38`(`attachment_unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 589 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_oa_org
-- ----------------------------
DROP TABLE IF EXISTS `if_oa_org`;
CREATE TABLE `if_oa_org`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `displayName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `displayOrder` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `endTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `erpID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `facsimile` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `function` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `initials` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `location` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `manageOrgID` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `managerAst` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `modifyMdate` datetime(0) DEFAULT NULL,
  `opertype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `orgId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `orgLevel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `orgManager` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parentErpID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parentOrgId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `postalAddress` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `postalCode` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reserve1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reserve2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reserve3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reserve4` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reserve5` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reserveOid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `startTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `style` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supervisor` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telephoneNumber` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `viceManager` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1560 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_oa_reply
-- ----------------------------
DROP TABLE IF EXISTS `if_oa_reply`;
CREATE TABLE `if_oa_reply`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `approval_Doc_Num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `att_Status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attach_Url` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `create_Date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dealer_Num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `issue_Date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `modify_Date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `oa_Status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `system_Id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `task_Id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `task_Type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_oa_user
-- ----------------------------
DROP TABLE IF EXISTS `if_oa_user`;
CREATE TABLE `if_oa_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `a_oName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `birthday` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `category` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `citizenship` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `displayOrder` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `duty` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `employeeNumber` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `employeeType` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `endTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entryTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `erpID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `facsimile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `function` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gender` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `idCardNumber` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `levelName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `levels` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `location` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `memberOf` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `modifyMdate` datetime(0) DEFAULT NULL,
  `nation` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `opertype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `orgId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pwModifiedDate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `positionLevel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `postalAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `postalCode` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `preferredMobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `religion` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reserve1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reserve2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reserve3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reserve4` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reserve5` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `startTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `superviseDept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supervisor` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supporterCorpContact` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supporterCorpName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supporterDept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telephoneNumber` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userCn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userPassword` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userSn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userType` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `workOrg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16944 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_order_distribution
-- ----------------------------
DROP TABLE IF EXISTS `if_order_distribution`;
CREATE TABLE `if_order_distribution`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CHARGE_ACCOUNT_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CHARGE_ACCOUNT_FLEX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CHARGE_ACCOUNT_ID` decimal(19, 2) DEFAULT NULL,
  `CODE_COMBINATION_ID` decimal(19, 2) DEFAULT NULL,
  `CONCATENATED_SEGMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_Date` datetime(0) DEFAULT NULL,
  `DELIVER_TO_PERSON_ID` decimal(19, 2) DEFAULT NULL,
  `DESTINATION_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESTINATION_TYPE_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DIMENSION_COMBINATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DISTRIBUTION_ID` decimal(19, 2) DEFAULT NULL,
  `DISTRIBUTION_NUM` decimal(19, 2) DEFAULT NULL,
  `EXPENDITURE_ITEM_DATE` datetime(0) DEFAULT NULL,
  `EXPENDITURE_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `GL_DATE` datetime(0) DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `LINE_LOCATION_ID` decimal(19, 2) DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORGANIZATION_ID` decimal(19, 2) DEFAULT NULL,
  `PO_HEADER_ID` decimal(19, 2) DEFAULT NULL,
  `PO_LINE_NUM` decimal(19, 2) DEFAULT NULL,
  `PROJECT_ID` decimal(19, 2) DEFAULT NULL,
  `PROJECT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUANTITY_BILLED` decimal(19, 2) DEFAULT NULL,
  `QUANTITY_CANCELLED` decimal(19, 2) DEFAULT NULL,
  `QUANTITY_DELIVERED` decimal(19, 2) DEFAULT NULL,
  `QUANTITY_ORDERED` decimal(19, 2) DEFAULT NULL,
  `QUANTITY_ORDERED_MIR` decimal(19, 2) DEFAULT NULL,
  `REFERENCE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SEGMENT1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TASK_ID` decimal(19, 2) DEFAULT NULL,
  `update_Date` datetime(0) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `PID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_orddist_header1`(`PO_HEADER_ID`) USING BTREE,
  INDEX `fk_orddist_header`(`LINE_LOCATION_ID`) USING BTREE,
  INDEX `fk_ordd_projnum`(`PROJECT_NUM`) USING BTREE,
  INDEX `idx_ordd_PO_LINE_NUM`(`PO_LINE_NUM`) USING BTREE,
  INDEX `idx_ordd_group`(`PROJECT_NUM`, `PROJECT_NAME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1338670 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_order_header
-- ----------------------------
DROP TABLE IF EXISTS `if_order_header`;
CREATE TABLE `if_order_header`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AGENT_ID` decimal(19, 2) DEFAULT NULL,
  `AGENT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AMOUNT` decimal(19, 2) DEFAULT NULL,
  `APPROVED_DATE` datetime(0) DEFAULT NULL,
  `APPROVED_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE16` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE17` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE18` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE19` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE20` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHORIZATION_STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BILL_TO_LOCATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BILL_TO_LOCATION_ID` decimal(19, 2) DEFAULT NULL,
  `CLOSED_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTACT_NAME_ALT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_Date` datetime(0) DEFAULT NULL,
  `CREATED_BY` decimal(19, 2) DEFAULT NULL,
  `CREATION_DATE` datetime(0) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CURRENCY_CONVERSION_RATE` decimal(19, 2) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `END_DATE_ACTIVE` datetime(0) DEFAULT NULL,
  `INTERFACE_SOURCE_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORGANIZATION_ID` decimal(19, 2) DEFAULT NULL,
  `ORG_ID` decimal(19, 2) DEFAULT NULL,
  `ORG_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PAYMENT_TERMS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PO_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `PO_HEADER_ID` decimal(19, 2) DEFAULT NULL,
  `RATE_DATE` datetime(0) DEFAULT NULL,
  `RATE_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REVISION_NUM` decimal(19, 2) DEFAULT NULL,
  `SEGMENT1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SHIP_TO_LOCATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SHIP_TO_LOCATION_ID` decimal(19, 2) DEFAULT NULL,
  `START_DATE_ACTIVE` datetime(0) DEFAULT NULL,
  `TAX_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `TAX_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TYPE_LOOKUP_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_Date` datetime(0) DEFAULT NULL,
  `VENDOR_CONTACT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_CONTACT_ID` decimal(19, 2) DEFAULT NULL,
  `VENDOR_ID` decimal(19, 2) DEFAULT NULL,
  `VENDOR_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_ORDER_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_SITE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_SITE_ID` decimal(19, 2) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `oid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKE27F3CC0774908F6`(`order_id`) USING BTREE,
  INDEX `fk_ord_vname`(`VENDOR_NAME`) USING BTREE,
  INDEX `fk_ordh_ATT7`(`ATTRIBUTE7`) USING BTREE,
  INDEX `fk_ordh_seg`(`SEGMENT1`) USING BTREE,
  INDEX `idx_ordh_poherderid`(`PO_HEADER_ID`) USING BTREE,
  INDEX `idx_ordh_group`(`SEGMENT1`, `update_Date`, `VENDOR_ID`, `VENDOR_NUMBER`, `VENDOR_NAME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 266656 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_order_line
-- ----------------------------
DROP TABLE IF EXISTS `if_order_line`;
CREATE TABLE `if_order_line`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLOSED_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `CONTRACT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTRACT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_Date` datetime(0) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ITEM_DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ITEM_ID` decimal(19, 2) DEFAULT NULL,
  `ITEM_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ITEM_REVISION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `LINE_NUM` decimal(19, 2) DEFAULT NULL,
  `LINE_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PO_HEADER_ID` decimal(19, 2) DEFAULT NULL,
  `PO_LINE_NUM` decimal(19, 2) DEFAULT NULL,
  `QUANTITY` decimal(19, 2) DEFAULT NULL,
  `REFERENCE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SEGMENT1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SITE_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TAX_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UNIT_OF_MEASURE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UNIT_PRICE` decimal(19, 2) DEFAULT NULL,
  `update_Date` datetime(0) DEFAULT NULL,
  `VENDOR_PRODUCT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_ordline_header`(`PO_HEADER_ID`) USING BTREE,
  INDEX `idx_ordl_PO_LINE_NUM`(`PO_LINE_NUM`) USING BTREE,
  INDEX `idx_ordl_group`(`CONTRACT_NUM`, `CONTRACT_NAME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1257255 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_order_location
-- ----------------------------
DROP TABLE IF EXISTS `if_order_location`;
CREATE TABLE `if_order_location`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `APPROVED_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CLOSED_FOR_RECEIVING_DATE` datetime(0) DEFAULT NULL,
  `CONSIGNED_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_Date` datetime(0) DEFAULT NULL,
  `DELIVER_TO_LOCATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELIVER_TO_LOCATION_ID` decimal(19, 2) DEFAULT NULL,
  `DEMAND_DATE` datetime(0) DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `LINE_LOCATION_ID` decimal(19, 2) DEFAULT NULL,
  `PO_HEADER_ID` decimal(19, 2) DEFAULT NULL,
  `PO_LINE_NUM` decimal(19, 2) DEFAULT NULL,
  `PROMISED_DATE` datetime(0) DEFAULT NULL,
  `QUANTITY_ACCEPTED` decimal(19, 2) DEFAULT NULL,
  `QUANTITY_BILLED` decimal(19, 2) DEFAULT NULL,
  `QUANTITY_CANCELLED` decimal(19, 2) DEFAULT NULL,
  `QUANTITY_RECEIVED` decimal(19, 2) DEFAULT NULL,
  `QUANTITY_REJECTED` decimal(19, 2) DEFAULT NULL,
  `QUANTITY_SHIPPED` decimal(19, 2) DEFAULT NULL,
  `REFERENCE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SEGMENT1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SHIPMENT_NUM` decimal(19, 2) DEFAULT NULL,
  `SHIP_TO_ORGANIZATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_Date` datetime(0) DEFAULT NULL,
  `PID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_ordloc_header`(`PO_HEADER_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1324176 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_pa_expenditure
-- ----------------------------
DROP TABLE IF EXISTS `if_pa_expenditure`;
CREATE TABLE `if_pa_expenditure`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AGENT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ITEM_DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ITEM_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `modifty_Date` datetime(0) DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORDER_DATE` datetime(0) DEFAULT NULL,
  `ORGANIZATION_ID` decimal(19, 2) DEFAULT NULL,
  `PO_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `PO_HEADER_ID` decimal(19, 2) DEFAULT NULL,
  `PO_LINE_NUM` decimal(19, 2) DEFAULT NULL,
  `PO_UNIT_PRICE` decimal(19, 2) DEFAULT NULL,
  `PRIMARY_QUANTITY` decimal(19, 2) DEFAULT NULL,
  `PROJECT_ID` decimal(19, 2) DEFAULT NULL,
  `PROJECT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUANTITY_AP_MATCHED` decimal(19, 2) DEFAULT NULL,
  `QUANTITY_RECEIVED` decimal(19, 2) DEFAULT NULL,
  `QUANTITY_UNDELIVERED` decimal(19, 2) DEFAULT NULL,
  `RECEIPT_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `RECEIPT_BY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RECEIPT_DATE` datetime(0) DEFAULT NULL,
  `SEGMENT1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UNDELIVERED_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `UNIT_OF_MEASURE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UNIT_PRICE` decimal(19, 2) DEFAULT NULL,
  `VENDOR_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 235 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_pa_expenditure_detail
-- ----------------------------
DROP TABLE IF EXISTS `if_pa_expenditure_detail`;
CREATE TABLE `if_pa_expenditure_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `BUIL_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `BUIL_AMOUNT_TOT` decimal(19, 2) DEFAULT NULL,
  `BUIL_AMOUNT_YTD` decimal(19, 2) DEFAULT NULL,
  `ENG_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `ENG_AMOUNT_TOT` decimal(19, 2) DEFAULT NULL,
  `ENG_AMOUNT_YTD` decimal(19, 2) DEFAULT NULL,
  `FA_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `FA_AMOUNT_YTD` decimal(19, 2) DEFAULT NULL,
  `FIXED_ASSETS_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `IA_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `IA_AMOUNT_TOT` decimal(19, 2) DEFAULT NULL,
  `IA_AMOUNT_YTD` decimal(19, 2) DEFAULT NULL,
  `LA_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `LA_AMOUNT_TOT` decimal(19, 2) DEFAULT NULL,
  `LA_AMOUNT_YTD` decimal(19, 2) DEFAULT NULL,
  `modifty_Date` datetime(0) DEFAULT NULL,
  `ORG_ID` decimal(19, 2) DEFAULT NULL,
  `ORG_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PERIOD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `p_month` int(11) DEFAULT NULL,
  `p_PERIOD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `p_year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_pay_schedule
-- ----------------------------
DROP TABLE IF EXISTS `if_pay_schedule`;
CREATE TABLE `if_pay_schedule`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACTIVITY_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_AMOUNT_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BATCH_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BRAND_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_ACCOUNT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_ACCOUNT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_DEPT_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_DEPT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_PROJECT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_PROJECT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CHANNEL_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COMPANY_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DIMENSION1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DIMENSION2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DIMENSION3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DIMENSION4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DIMENSION5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DIMENSION6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `LINE_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `modifty_Date` datetime(0) DEFAULT NULL,
  `PAYMENT_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `PAYMENT_PERCENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PAYMENT_SCHEDULE` datetime(0) DEFAULT NULL,
  `PAYMENT_STATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PAYMENT_TERMS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PAYMENT_TERMS_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRODUCT_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SCHEDULE_DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STRATEGY_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TAX_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `USERGROUP_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contract_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK84845C70AA534F7E`(`Contract_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75467 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_portal_msg
-- ----------------------------
DROP TABLE IF EXISTS `if_portal_msg`;
CREATE TABLE `if_portal_msg`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_Msg_Id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_Date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `delete_Date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `doc_Type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `doc_Type_Id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `instanceId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `msg_Status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `msg_Title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `msg_Type` int(11) DEFAULT NULL,
  `msg_Type_Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `msg_Url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `num1` int(11) DEFAULT NULL,
  `num2` int(11) DEFAULT NULL,
  `receiver` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `receiver_Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sender` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sender_Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `string1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `string2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `string3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_Date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `urgent_Level` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `modify_Date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14108 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_pro_info
-- ----------------------------
DROP TABLE IF EXISTS `if_pro_info`;
CREATE TABLE `if_pro_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CHANNEL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COMPANY_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COMPANY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `END_DATE` datetime(0) DEFAULT NULL,
  `IMPORT_SYS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `modifty_Date` datetime(0) DEFAULT NULL,
  `PARENT_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_PROJECT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_PROJECT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PMS_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `PROJECT_DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `START_DATE` datetime(0) DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `YEAR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_purchase_receipt
-- ----------------------------
DROP TABLE IF EXISTS `if_purchase_receipt`;
CREATE TABLE `if_purchase_receipt`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `BILL_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `BILLED_AMOUNT` decimal(19, 2) DEFAULT NULL,
  `create_Date` datetime(0) DEFAULT NULL,
  `ITEM_ID` decimal(19, 2) DEFAULT NULL,
  `LINE_NUM` decimal(19, 2) DEFAULT NULL,
  `PO_HEADER_ID` decimal(19, 2) DEFAULT NULL,
  `PO_LINE_ID` decimal(19, 2) DEFAULT NULL,
  `PROJECT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PURCHASE_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUANTITY_BILLED` decimal(19, 2) DEFAULT NULL,
  `QUANTITY_RECEIVED` decimal(19, 2) DEFAULT NULL,
  `RECEIPT_DATE` datetime(0) DEFAULT NULL,
  `RECEIPT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SHIPMENT_HEADER_ID` decimal(19, 2) DEFAULT NULL,
  `SHIPMENT_LINE_ID` decimal(19, 2) DEFAULT NULL,
  `UNIT_PRICE` decimal(19, 2) DEFAULT NULL,
  `update_Date` datetime(0) DEFAULT NULL,
  `VENDOR_ITEM_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3874 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_vendor
-- ----------------------------
DROP TABLE IF EXISTS `if_vendor`;
CREATE TABLE `if_vendor`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ALLOW_SUBSTITUTE_RECEIPTS_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COMPANY_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_VENDOR_ID` decimal(19, 2) DEFAULT NULL,
  `create_Date` datetime(0) DEFAULT NULL,
  `CREATED_BY` decimal(19, 2) DEFAULT NULL,
  `EMPLOYEE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EMPLOYEE_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INACTIVE_DATE` datetime(0) DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `ORGCERTNUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PERSON_ID` decimal(19, 2) DEFAULT NULL,
  `REFERENCE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_Date` datetime(0) DEFAULT NULL,
  `VAT_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VAT_REGISTRATION_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_CREATION_DATE` datetime(0) DEFAULT NULL,
  `VENDOR_END_DATE_ACTIVE` datetime(0) DEFAULT NULL,
  `VENDOR_ID` decimal(19, 2) DEFAULT NULL,
  `VENDOR_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_NAME_ALT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_NUMBER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_PUR_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_TYPE_DISP` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_TYPE_LOOKUP_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2905 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for if_vendor_site
-- ----------------------------
DROP TABLE IF EXISTS `if_vendor_site`;
CREATE TABLE `if_vendor_site`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ABAA_LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `ABAU_LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `ACCOUNT_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ADDRESS_LINE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ADDRESS_LINE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ADDRESS_LINE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ADDRESS_LINE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTRIBUTE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BANK_ABSTRCT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BANK_ACCOUNT_ID` decimal(19, 2) DEFAULT NULL,
  `BANK_ACCOUNT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BANK_ACCOUNT_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BANK_ACCOUNT_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BANK_ACCOUNT_USES_ID` decimal(19, 2) DEFAULT NULL,
  `BANK_BRANCH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BANK_BRANCH_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BANK_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BANK_USER_END_DATE` datetime(0) DEFAULT NULL,
  `BANK_VALID_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CITY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTACT_EMAIL` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `CONTACT_FAX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTACT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTACT_PHONE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COST_CENTER_VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COUNTRY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_Date` datetime(0) DEFAULT NULL,
  `CREATION_DATE` datetime(0) DEFAULT NULL,
  `IC_REGISTRATION_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime(0) DEFAULT NULL,
  `LIABILITY_ACCOUNT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORG_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PAY_SITE_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PREPAY_ACCOUNT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRIMARY_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROVINCE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PURCHASING_SITE_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFERENCE9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SITE_INACTIVE_DATE` datetime(0) DEFAULT NULL,
  `update_Date` datetime(0) DEFAULT NULL,
  `VALID_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_CONTACT_ID` decimal(19, 2) DEFAULT NULL,
  `VENDOR_SITE_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_SITE_ID` decimal(19, 2) DEFAULT NULL,
  `ZIP` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VENDOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK7E8CA3BCE3F8A63E`(`VENDOR_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5017 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_audit_entry
-- ----------------------------
DROP TABLE IF EXISTS `s_audit_entry`;
CREATE TABLE `s_audit_entry`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `requested_datetime` datetime(0) DEFAULT NULL,
  `requested_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `audit_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `category_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `duration` bigint(20) NOT NULL,
  `exception` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `oper_data` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `oper_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `succeed_flag` bit(1) DEFAULT NULL,
  `mac` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `login_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `method_cn_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2859985 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_job
-- ----------------------------
DROP TABLE IF EXISTS `s_job`;
CREATE TABLE `s_job`  (
  `id` bigint(20) NOT NULL,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_module
-- ----------------------------
DROP TABLE IF EXISTS `s_module`;
CREATE TABLE `s_module`  (
  `DTYPE` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module_id` bigint(20) NOT NULL,
  `isLeaf_flag` bit(1) DEFAULT NULL,
  `isRoot_flag` bit(1) DEFAULT NULL,
  `active_flag` bit(1) DEFAULT NULL,
  `module_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `module_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `module_index` int(11) DEFAULT NULL,
  `delete_flag` bit(1) DEFAULT NULL,
  `module_level` int(11) DEFAULT NULL,
  `module_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `module_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `module_url` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `cooperation_url` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `current_count_sql` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `height` int(11) DEFAULT NULL,
  `in_win` bit(1) DEFAULT NULL,
  `total_count_sql` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `width` int(11) DEFAULT NULL,
  `icon_id` bigint(20) DEFAULT NULL,
  `parent_module_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`module_id`) USING BTREE,
  INDEX `FKBE2CBB81F4F6D30`(`parent_module_id`) USING BTREE,
  INDEX `FKBE2CBB8EF44F830`(`icon_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_module_config_detail
-- ----------------------------
DROP TABLE IF EXISTS `s_module_config_detail`;
CREATE TABLE `s_module_config_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `count_sql` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `config_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKCC647FA74B45AA10`(`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_module_icon
-- ----------------------------
DROP TABLE IF EXISTS `s_module_icon`;
CREATE TABLE `s_module_icon`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 208 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_operation
-- ----------------------------
DROP TABLE IF EXISTS `s_operation`;
CREATE TABLE `s_operation`  (
  `oper_id` bigint(20) NOT NULL,
  `isLeaf_flag` bit(1) DEFAULT NULL,
  `isRoot_flag` bit(1) DEFAULT NULL,
  `oper_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `oper_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `inner_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `oper_level` int(11) DEFAULT NULL,
  `oper_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `FKED181C9B9FE6320C`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_position
-- ----------------------------
DROP TABLE IF EXISTS `s_position`;
CREATE TABLE `s_position`  (
  `id` bigint(20) NOT NULL,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKEEF59B756C5DDD94`(`org_id`) USING BTREE,
  INDEX `FKEEF59B756120EC2F`(`job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_privilege_user
-- ----------------------------
DROP TABLE IF EXISTS `s_privilege_user`;
CREATE TABLE `s_privilege_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `party_address` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `party_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `party_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `party_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active_flag` bit(1) DEFAULT NULL,
  `eMail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `end_date` datetime(0) DEFAULT NULL,
  `lock_flag` bit(1) DEFAULT NULL,
  `login_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `login_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `manager_enabled_flag` bit(1) DEFAULT NULL,
  `oa_Account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_Id` int(11) DEFAULT NULL,
  `login_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Password_Modify_Time` datetime(0) DEFAULT NULL,
  `relation_ID` bigint(20) DEFAULT NULL,
  `role_enabled_flag` bit(1) DEFAULT NULL,
  `start_date` datetime(0) DEFAULT NULL,
  `u_Id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_date` datetime(0) DEFAULT NULL,
  `wrong_credential_times` int(11) DEFAULT NULL,
  `position_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `Construct_Unit_id` bigint(20) DEFAULT NULL,
  `system_user_id` bigint(20) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `office_id` bigint(20) DEFAULT NULL,
  `leaf_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK32DD4DE5E1CACA66`(`department_id`) USING BTREE,
  INDEX `FK32DD4DE5226C1EBC`(`office_id`) USING BTREE,
  INDEX `FK32DD4DE5A67D7AA5`(`position_id`) USING BTREE,
  INDEX `FK32DD4DE5D0E8D595`(`leaf_org_id`) USING BTREE,
  INDEX `FK32DD4DE56B3B728C`(`Construct_Unit_id`) USING BTREE,
  INDEX `FK32DD4DE56120EC2F`(`job_id`) USING BTREE,
  INDEX `FK32DD4DE5B6685964`(`system_user_id`) USING BTREE,
  INDEX `idx_spu_loginname`(`login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17841 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_privilege_user_copy
-- ----------------------------
DROP TABLE IF EXISTS `s_privilege_user_copy`;
CREATE TABLE `s_privilege_user_copy`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `party_address` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `party_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `party_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `party_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active_flag` bit(1) DEFAULT NULL,
  `eMail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `end_date` datetime(0) DEFAULT NULL,
  `lock_flag` bit(1) DEFAULT NULL,
  `login_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `login_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `manager_enabled_flag` bit(1) DEFAULT NULL,
  `oa_Account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_Id` int(11) DEFAULT NULL,
  `login_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Password_Modify_Time` datetime(0) DEFAULT NULL,
  `relation_ID` bigint(20) DEFAULT NULL,
  `role_enabled_flag` bit(1) DEFAULT NULL,
  `start_date` datetime(0) DEFAULT NULL,
  `u_Id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_date` datetime(0) DEFAULT NULL,
  `wrong_credential_times` int(11) DEFAULT NULL,
  `position_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `Construct_Unit_id` bigint(20) DEFAULT NULL,
  `system_user_id` bigint(20) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `office_id` bigint(20) DEFAULT NULL,
  `leaf_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK32DD4DE5E1CACA66`(`department_id`) USING BTREE,
  INDEX `FK32DD4DE5226C1EBC`(`office_id`) USING BTREE,
  INDEX `FK32DD4DE5A67D7AA5`(`position_id`) USING BTREE,
  INDEX `FK32DD4DE5D0E8D595`(`leaf_org_id`) USING BTREE,
  INDEX `FK32DD4DE56B3B728C`(`Construct_Unit_id`) USING BTREE,
  INDEX `FK32DD4DE56120EC2F`(`job_id`) USING BTREE,
  INDEX `FK32DD4DE5B6685964`(`system_user_id`) USING BTREE,
  INDEX `idx_spu_loginname`(`login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17714 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_privilege_user_old
-- ----------------------------
DROP TABLE IF EXISTS `s_privilege_user_old`;
CREATE TABLE `s_privilege_user_old`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `party_address` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `party_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `party_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `party_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active_flag` bit(1) DEFAULT NULL,
  `eMail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `end_date` datetime(0) DEFAULT NULL,
  `lock_flag` bit(1) DEFAULT NULL,
  `login_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `login_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `manager_enabled_flag` bit(1) DEFAULT NULL,
  `oa_Account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_Id` int(11) DEFAULT NULL,
  `login_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Password_Modify_Time` datetime(0) DEFAULT NULL,
  `relation_ID` bigint(20) DEFAULT NULL,
  `role_enabled_flag` bit(1) DEFAULT NULL,
  `start_date` datetime(0) DEFAULT NULL,
  `u_Id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_date` datetime(0) DEFAULT NULL,
  `wrong_credential_times` int(11) DEFAULT NULL,
  `position_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `Construct_Unit_id` bigint(20) DEFAULT NULL,
  `system_user_id` bigint(20) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `office_id` bigint(20) DEFAULT NULL,
  `leaf_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK32DD4DE5E1CACA66`(`department_id`) USING BTREE,
  INDEX `FK32DD4DE5226C1EBC`(`office_id`) USING BTREE,
  INDEX `FK32DD4DE5A67D7AA5`(`position_id`) USING BTREE,
  INDEX `FK32DD4DE5D0E8D595`(`leaf_org_id`) USING BTREE,
  INDEX `FK32DD4DE56B3B728C`(`Construct_Unit_id`) USING BTREE,
  INDEX `FK32DD4DE56120EC2F`(`job_id`) USING BTREE,
  INDEX `FK32DD4DE5B6685964`(`system_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17499 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_recipienter
-- ----------------------------
DROP TABLE IF EXISTS `s_recipienter`;
CREATE TABLE `s_recipienter`  (
  `recipienter_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  INDEX `FK7E15A6BAFEC5CE5`(`user_id`) USING BTREE,
  INDEX `FK7E15A6BA33A510F3`(`recipienter_id`) USING BTREE,
  CONSTRAINT `FK7E15A6BA33A510F3` FOREIGN KEY (`recipienter_id`) REFERENCES `b_universal_workorder` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_recipientorg
-- ----------------------------
DROP TABLE IF EXISTS `s_recipientorg`;
CREATE TABLE `s_recipientorg`  (
  `recipientOrg_id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  INDEX `FK449EDE576C5DDD94`(`org_id`) USING BTREE,
  INDEX `FK449EDE57FFE1F52E`(`recipientOrg_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_resource
-- ----------------------------
DROP TABLE IF EXISTS `s_resource`;
CREATE TABLE `s_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `realm_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKAE0EC65A6AC19905`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6531 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_role
-- ----------------------------
DROP TABLE IF EXISTS `s_role`;
CREATE TABLE `s_role`  (
  `ROLE_ID` bigint(20) NOT NULL,
  `active_flag` bit(1) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_TeamRole` bit(1) DEFAULT NULL,
  `ROLE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORG_TYPE_ID` bigint(20) DEFAULT NULL,
  `CONSTRUCT_UNIT_ID` bigint(20) DEFAULT NULL,
  `operator_id` bigint(20) DEFAULT NULL,
  `role_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`) USING BTREE,
  UNIQUE INDEX `ROLE_NAME`(`ROLE_NAME`) USING BTREE,
  UNIQUE INDEX `role_code`(`role_code`) USING BTREE,
  INDEX `FKC9AD88C2562F8FD2`(`role_type_id`) USING BTREE,
  INDEX `FKC9AD88C220C2456C`(`operator_id`) USING BTREE,
  INDEX `FKC9AD88C26B3B728C`(`CONSTRUCT_UNIT_ID`) USING BTREE,
  INDEX `FKC9AD88C269897B7D`(`ORG_TYPE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_role_type
-- ----------------------------
DROP TABLE IF EXISTS `s_role_type`;
CREATE TABLE `s_role_type`  (
  `role_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role_type_name` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`role_type_id`) USING BTREE,
  UNIQUE INDEX `role_type_code`(`role_type_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_synonym_mapping
-- ----------------------------
DROP TABLE IF EXISTS `s_synonym_mapping`;
CREATE TABLE `s_synonym_mapping`  (
  `synonym_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entity_business_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_table_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `map_entity_table` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ref_syn_business_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ref_synonym_column` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rel_synonym_table` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `synonym_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`synonym_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_system_user
-- ----------------------------
DROP TABLE IF EXISTS `s_system_user`;
CREATE TABLE `s_system_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `party_address` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `party_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `party_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `party_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active_flag` bit(1) DEFAULT NULL,
  `eMail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lock_flag` bit(1) DEFAULT NULL,
  `login_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `login_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `manager_enabled_flag` bit(1) DEFAULT NULL,
  `oa_Account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_Id` int(11) DEFAULT NULL,
  `login_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Password_Modify_Time` datetime(0) DEFAULT NULL,
  `relation_ID` bigint(20) DEFAULT NULL,
  `role_enabled_flag` bit(1) DEFAULT NULL,
  `u_Id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `office_id` bigint(20) DEFAULT NULL,
  `leaf_org_id` bigint(20) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `Construct_Unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_name`(`login_name`) USING BTREE,
  INDEX `FKA448820FE1CACA66`(`department_id`) USING BTREE,
  INDEX `FKA448820F226C1EBC`(`office_id`) USING BTREE,
  INDEX `FKA448820FD0E8D595`(`leaf_org_id`) USING BTREE,
  INDEX `FKA448820F6B3B728C`(`Construct_Unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12481 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_user_online
-- ----------------------------
DROP TABLE IF EXISTS `s_user_online`;
CREATE TABLE `s_user_online`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_online` bit(1) DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `login_date` datetime(0) DEFAULT NULL,
  `logout_date` datetime(0) DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `online_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKEFAC477BFAA255D`(`online_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15177 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_user_role_relations
-- ----------------------------
DROP TABLE IF EXISTS `s_user_role_relations`;
CREATE TABLE `s_user_role_relations`  (
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`USER_ID`, `ROLE_ID`) USING BTREE,
  INDEX `FK2C1E0E966AC19905`(`ROLE_ID`) USING BTREE,
  INDEX `FK2C1E0E96FEC5CE5`(`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sheet1
-- ----------------------------
DROP TABLE IF EXISTS `sheet1`;
CREATE TABLE `sheet1`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `项目所属科室` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `合作方性质` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `施工单位分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kfen` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kfei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `k_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `f_desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `项目经理` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for supervisehistory
-- ----------------------------
DROP TABLE IF EXISTS `supervisehistory`;
CREATE TABLE `supervisehistory`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8FFEC254967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK8FFEC2547D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK8FFEC254DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK8FFEC254F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK8FFEC254A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_idcreator
-- ----------------------------
DROP TABLE IF EXISTS `sys_idcreator`;
CREATE TABLE `sys_idcreator`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `maxId` int(11) DEFAULT NULL,
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tableName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_audit_node
-- ----------------------------
DROP TABLE IF EXISTS `t_audit_node`;
CREATE TABLE `t_audit_node`  (
  `oldmodule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `oldxmodule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `oldnode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `newmodule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `newnode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `newnodeid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_project_orguser
-- ----------------------------
DROP TABLE IF EXISTS `t_project_orguser`;
CREATE TABLE `t_project_orguser`  (
  `项目编码` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `建设单位` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `建设管理单位` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `建设单位项目经理` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `账号js` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `管理单位项目经理` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `账号gl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_project_orguser1
-- ----------------------------
DROP TABLE IF EXISTS `t_project_orguser1`;
CREATE TABLE `t_project_orguser1`  (
  `项目名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `项目编码` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `管理单位项目经理` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `专业室经理` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `管理单位专业主管` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_project_status
-- ----------------------------
DROP TABLE IF EXISTS `t_project_status`;
CREATE TABLE `t_project_status`  (
  `projectcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_project_status1
-- ----------------------------
DROP TABLE IF EXISTS `t_project_status1`;
CREATE TABLE `t_project_status1`  (
  `projectcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_acceptance_check
-- ----------------------------
DROP TABLE IF EXISTS `vv_acceptance_check`;
CREATE TABLE `vv_acceptance_check`  (
  `PID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJ_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CHECK_ORG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ACCEPTANCE_ORG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TOTAL_SCORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PINGFENREN` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_all_prj_stepname
-- ----------------------------
DROP TABLE IF EXISTS `vv_all_prj_stepname`;
CREATE TABLE `vv_all_prj_stepname`  (
  `PID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRJ_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRJ_SERIAL_NUM` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `STEPNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BIZTYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NODE_STS` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RUN_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_applyorg_info
-- ----------------------------
DROP TABLE IF EXISTS `vv_applyorg_info`;
CREATE TABLE `vv_applyorg_info`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PURCHASESUBMIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `APPLYEXAMPLE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUSINESS_CONTACT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUSINESS_PHONE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COMPANY_ADDRESS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTERPRISE_LEGAL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUALIFICATIONS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REGISTERED_CAPITAL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_archive_detail
-- ----------------------------
DROP TABLE IF EXISTS `vv_archive_detail`;
CREATE TABLE `vv_archive_detail`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ACOUNT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DATAARCHIVE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FILE_TYPE_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_audit_exec_order
-- ----------------------------
DROP TABLE IF EXISTS `vv_audit_exec_order`;
CREATE TABLE `vv_audit_exec_order`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_MONEY` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_MONEY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MONEY` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRODUCTION_MONEY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORDER_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORDER_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ADD_MONEY` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SUB_MONEY` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SUB_RATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `OLD_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_audit_order
-- ----------------------------
DROP TABLE IF EXISTS `vv_audit_order`;
CREATE TABLE `vv_audit_order`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MONEY` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORDER_CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORDER_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_audit_score
-- ----------------------------
DROP TABLE IF EXISTS `vv_audit_score`;
CREATE TABLE `vv_audit_score`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTITUDE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUALITY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TQSCORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PMABILITY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLANSCORE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DRAFTNORM` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TOTALSCORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_FEE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDITTYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_budget_audit
-- ----------------------------
DROP TABLE IF EXISTS `vv_budget_audit`;
CREATE TABLE `vv_budget_audit`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SEND_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_CONTENT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_FEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COOP_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COOP_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INNER_AUDITOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NODE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BACK_CONTENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TEMPLETE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_budget_audit_adjust
-- ----------------------------
DROP TABLE IF EXISTS `vv_budget_audit_adjust`;
CREATE TABLE `vv_budget_audit_adjust`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SEND_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_CONTENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_FEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COOP_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WORKFLOW_ACTIVITY_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COOP_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INNER_AUDITOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDITORG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NODE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BACK_CONTENT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ADJUST_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `OLD_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_ADJUST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_budget_audit_adjust_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_budget_audit_adjust_attachment`;
CREATE TABLE `vv_budget_audit_adjust_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_budget_audit_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_budget_audit_attachment`;
CREATE TABLE `vv_budget_audit_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_budget_audit_entrust
-- ----------------------------
DROP TABLE IF EXISTS `vv_budget_audit_entrust`;
CREATE TABLE `vv_budget_audit_entrust`  (
  `AUDIT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `END_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_ENTRUST_ACCEPT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_INTERFACE_ACCEPT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_REPEAT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INTERFACE_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_LETTER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_budget_audit_exec
-- ----------------------------
DROP TABLE IF EXISTS `vv_budget_audit_exec`;
CREATE TABLE `vv_budget_audit_exec`  (
  `AUDIT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_ADDCUTFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_ADDFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_ADDFEE_RATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_AUDITFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_FEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_SUBCUTFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_SUBFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_SUBFEE_RATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_PERSON` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_PERSON_PHONE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COST_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DEVELOP_PERSON` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DEVELOP_PERSON_PHONE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FEE_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_CONTRACT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_SPEC` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BACK_CONTENT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BACK_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REPORT_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_budget_audit_fee
-- ----------------------------
DROP TABLE IF EXISTS `vv_budget_audit_fee`;
CREATE TABLE `vv_budget_audit_fee`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TOTAL_SCORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CHARGED_BATCH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_CHARGED` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_budget_audit_score
-- ----------------------------
DROP TABLE IF EXISTS `vv_budget_audit_score`;
CREATE TABLE `vv_budget_audit_score`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTITUDE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUALITY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TQSCORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PMABILITY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLANSCORE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DRAFTNORM` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TOTALSCORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_FEE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDITTYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_budget_entrust_letter
-- ----------------------------
DROP TABLE IF EXISTS `vv_budget_entrust_letter`;
CREATE TABLE `vv_budget_entrust_letter`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_ORG_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_budget_problem
-- ----------------------------
DROP TABLE IF EXISTS `vv_budget_problem`;
CREATE TABLE `vv_budget_problem`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_FEEDBACK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_OPINION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_FEEDBACK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FIRM_FEEDBACK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROBLEM_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROBLEM_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROBLEM_ACT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ADD_INFO` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FIRM_FEEDBACK_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_FEEDBACK_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_FEEDBACK_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_budget_problem_activity
-- ----------------------------
DROP TABLE IF EXISTS `vv_budget_problem_activity`;
CREATE TABLE `vv_budget_problem_activity`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_EXEC_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BACK_CONTENT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BACK_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_HANDLE_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_HANDLE_BEGIN_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_data_archive
-- ----------------------------
DROP TABLE IF EXISTS `vv_data_archive`;
CREATE TABLE `vv_data_archive`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WORKFLOW_ACTIVITY_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_data_archive_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_data_archive_attachment`;
CREATE TABLE `vv_data_archive_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_delay_construct
-- ----------------------------
DROP TABLE IF EXISTS `vv_delay_construct`;
CREATE TABLE `vv_delay_construct`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELAY_REASON` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELAY_TACHE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_design_adjust
-- ----------------------------
DROP TABLE IF EXISTS `vv_design_adjust`;
CREATE TABLE `vv_design_adjust`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BATCH_NO` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_ADJUST_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_ADJUST_INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_ADJUST_NUM` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FIRST_CHECK_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_SEND_OA` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_design_adjust_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_design_adjust_attachment`;
CREATE TABLE `vv_design_adjust_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_design_approval_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_design_approval_attachment`;
CREATE TABLE `vv_design_approval_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_design_approvalfather
-- ----------------------------
DROP TABLE IF EXISTS `vv_design_approvalfather`;
CREATE TABLE `vv_design_approvalfather`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_APPROVAL_NUM` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_SEND_OA` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_REPLY_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_design_approvalson
-- ----------------------------
DROP TABLE IF EXISTS `vv_design_approvalson`;
CREATE TABLE `vv_design_approvalson`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_APPROVAL_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_INVEST` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FIRST_CHECK_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_REPLY_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_design_audit_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_design_audit_attachment`;
CREATE TABLE `vv_design_audit_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_design_auditfather
-- ----------------------------
DROP TABLE IF EXISTS `vv_design_auditfather`;
CREATE TABLE `vv_design_auditfather`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_AUDIT_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_design_auditson
-- ----------------------------
DROP TABLE IF EXISTS `vv_design_auditson`;
CREATE TABLE `vv_design_auditson`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_AUDIT_DATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_NEED_REVISE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_design_commission_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_design_commission_attachment`;
CREATE TABLE `vv_design_commission_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_design_commissionf
-- ----------------------------
DROP TABLE IF EXISTS `vv_design_commissionf`;
CREATE TABLE `vv_design_commissionf`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_RECEIVE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLAN_FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFUSE_REASON` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `HEAD_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INTERFACE_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_design_commissions
-- ----------------------------
DROP TABLE IF EXISTS `vv_design_commissions`;
CREATE TABLE `vv_design_commissions`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLAN_FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_fea_audit
-- ----------------------------
DROP TABLE IF EXISTS `vv_fea_audit`;
CREATE TABLE `vv_fea_audit`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FEA_AUDIT_DATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_CORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_fea_audit_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_fea_audit_attachment`;
CREATE TABLE `vv_fea_audit_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_fea_audit_child
-- ----------------------------
DROP TABLE IF EXISTS `vv_fea_audit_child`;
CREATE TABLE `vv_fea_audit_child`  (
  `ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FEA_AUDIT_DATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FEA_INVEST` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_NEED_REVISE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_fea_commission
-- ----------------------------
DROP TABLE IF EXISTS `vv_fea_commission`;
CREATE TABLE `vv_fea_commission`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_RECEIVE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLAN_FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REFUSE_REASON` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `HEAD_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FEA_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INTERFACE_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_fea_commission_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_fea_commission_attachment`;
CREATE TABLE `vv_fea_commission_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_fea_commission_child
-- ----------------------------
DROP TABLE IF EXISTS `vv_fea_commission_child`;
CREATE TABLE `vv_fea_commission_child`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLAN_FINISH_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_fea_reply
-- ----------------------------
DROP TABLE IF EXISTS `vv_fea_reply`;
CREATE TABLE `vv_fea_reply`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_OA` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REPLY_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REPLY_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_fea_reply_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_fea_reply_attachment`;
CREATE TABLE `vv_fea_reply_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_fea_reply_child
-- ----------------------------
DROP TABLE IF EXISTS `vv_fea_reply_child`;
CREATE TABLE `vv_fea_reply_child`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FIRST_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REPLY_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REPLY_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REPLY_INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MANAGERORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_final_audit
-- ----------------------------
DROP TABLE IF EXISTS `vv_final_audit`;
CREATE TABLE `vv_final_audit`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SEND_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_CONTENT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_FEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INNER_AUDITOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NODE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BACK_CONTENT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_final_audit_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_final_audit_attachment`;
CREATE TABLE `vv_final_audit_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_final_audit_entrust
-- ----------------------------
DROP TABLE IF EXISTS `vv_final_audit_entrust`;
CREATE TABLE `vv_final_audit_entrust`  (
  `AUDIT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `END_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_ENTRUST_ACCEPT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_INTERFACE_ACCEPT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_REPEAT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INTERFACE_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_LETTER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_final_audit_exec
-- ----------------------------
DROP TABLE IF EXISTS `vv_final_audit_exec`;
CREATE TABLE `vv_final_audit_exec`  (
  `AUDIT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_ADDCUTFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_ADDFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_ADDFEE_RATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_AUDITFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_FEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_SUBCUTFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_SUBFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_SUBFEE_RATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_PERSON` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_PERSON_PHONE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COST_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DEVELOP_PERSON` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DEVELOP_PERSON_PHONE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FEE_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_SPEC` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_REPEAT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BACK_CONTENT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BACK_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REPORT_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_final_audit_fee
-- ----------------------------
DROP TABLE IF EXISTS `vv_final_audit_fee`;
CREATE TABLE `vv_final_audit_fee`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TOTAL_SCORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CHARGED_BATCH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_CHARGED` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_final_audit_score
-- ----------------------------
DROP TABLE IF EXISTS `vv_final_audit_score`;
CREATE TABLE `vv_final_audit_score`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTITUDE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUALITY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TQSCORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PMABILITY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLANSCORE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DRAFTNORM` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TOTALSCORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_FEE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDITTYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_final_check
-- ----------------------------
DROP TABLE IF EXISTS `vv_final_check`;
CREATE TABLE `vv_final_check`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINALCHECK_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINALREPORTAMOUNT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TWORECEIVEUSER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TWOORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WORKFLOW_ACTIVITY_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ACCEPTING_CONTENT` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_final_check_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_final_check_attachment`;
CREATE TABLE `vv_final_check_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_final_entrust_letter
-- ----------------------------
DROP TABLE IF EXISTS `vv_final_entrust_letter`;
CREATE TABLE `vv_final_entrust_letter`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_ORG_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_final_problem
-- ----------------------------
DROP TABLE IF EXISTS `vv_final_problem`;
CREATE TABLE `vv_final_problem`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_FEEDBACK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_OPINION` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_FEEDBACK` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FIRM_FEEDBACK` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROBLEM_DESC` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROBLEM_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROBLEM_ACT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ADD_INFO` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FIRM_FEEDBACK_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_FEEDBACK_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_FEEDBACK_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLAN_FEEDBACK_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SALE_FEEDBACK_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORDER_FEEDBACK_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLAN_FEEDBACK` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SALE_FEEDBACK` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORDER_FEEDBACK` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_final_problem_activity
-- ----------------------------
DROP TABLE IF EXISTS `vv_final_problem_activity`;
CREATE TABLE `vv_final_problem_activity`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_EXEC_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BACK_CONTENT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BACK_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_HANDLE_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_HANDLE_BEGIN_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_final_verification
-- ----------------------------
DROP TABLE IF EXISTS `vv_final_verification`;
CREATE TABLE `vv_final_verification`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JHBM_VERIFY_RESULT` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINANCE_VERIFY_RESULT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORG_VERIFY_EXPLAIN` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PURCHASE_VERIFY_RESULT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VERIFY_CONTENT` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `HANDLER` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JHBM_HANDLER` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PURCHASE_HANDLER` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORG_HANDLER` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINANCE_HANDLER` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_SEND_AUDIT_MANAGER` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORG_MANAGER_BEGIN_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_EXEC_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_final_verification_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_final_verification_attachment`;
CREATE TABLE `vv_final_verification_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_finalcheck_record
-- ----------------------------
DROP TABLE IF EXISTS `vv_finalcheck_record`;
CREATE TABLE `vv_finalcheck_record`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINALSETUPAMOUNT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINALTOTALAMOUNT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `GROUP_DESCRIPTION` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WORKFLOW_ACTIVITY_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_first_check
-- ----------------------------
DROP TABLE IF EXISTS `vv_first_check`;
CREATE TABLE `vv_first_check`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENDWORK_DESCRIPTION` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FIRSTCHECK_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FIRST_SETTLEMENTAMOUNT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SETUPAMOUNT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SUPERVISOR_ORGUNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_ORGUNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCTION_ORGUNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WORKFLOW_ACTIVITY_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SUIGONG_ORGUNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_first_check_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_first_check_attachment`;
CREATE TABLE `vv_first_check_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_partner_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `vv_partner_evaluate`;
CREATE TABLE `vv_partner_evaluate`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `END_DATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `START_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SPEC_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORG_TYPE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `START_SCORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARTNER_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LEVEL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORDER_INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORDER_PERCENT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_SCORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARTNER_EVALUATE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EVALUATE_SCORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SCOPE_SCORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_partner_project_detail
-- ----------------------------
DROP TABLE IF EXISTS `vv_partner_project_detail`;
CREATE TABLE `vv_partner_project_detail`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORDER_INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SCORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARTNER_EVALUATE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_partners_associat
-- ----------------------------
DROP TABLE IF EXISTS `vv_partners_associat`;
CREATE TABLE `vv_partners_associat`  (
  `PRJ_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRJ_SERIALNUM` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRJ_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WORK_DEP_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MANAGER_DEP_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_DEP_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FELLOW_DEP_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_partners_associated
-- ----------------------------
DROP TABLE IF EXISTS `vv_partners_associated`;
CREATE TABLE `vv_partners_associated`  (
  `PRJ_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRJ_SERIALNUM` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRJ_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WORK_DEP_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WORK_DEP_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MANAGER_DEP_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MANAGER_DEP_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_DEP_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_DEP_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FELLOW_DEP_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FELLOW_DEP_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WORKDEPTYPENAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MANAGERDEPTYPENAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGNDEPTYPENAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_partners_associated_copy
-- ----------------------------
DROP TABLE IF EXISTS `vv_partners_associated_copy`;
CREATE TABLE `vv_partners_associated_copy`  (
  `PRJ_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRJ_SERIALNUM` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRJ_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WORK_DEP_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MANAGER_DEP_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_DEP_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FELLOW_DEP_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_plan_schedule
-- ----------------------------
DROP TABLE IF EXISTS `vv_plan_schedule`;
CREATE TABLE `vv_plan_schedule`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLAN_BEGIN_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLAN_END_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BEGIN_DATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `END_DATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WORK_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRIORITY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRE_PRIORITY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SPACE_DATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SCHEDULE_TYPE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_preparepartner_score
-- ----------------------------
DROP TABLE IF EXISTS `vv_preparepartner_score`;
CREATE TABLE `vv_preparepartner_score`  (
  `PID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJ_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CHECK_ORG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ACCEPTANCE_ORG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TOTAL_SCORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PINGFENREN` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_preparepartner_score_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_preparepartner_score_attachment`;
CREATE TABLE `vv_preparepartner_score_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_processpartner_score
-- ----------------------------
DROP TABLE IF EXISTS `vv_processpartner_score`;
CREATE TABLE `vv_processpartner_score`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TOTAL_OFKFEI` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TOTAL_OFKFEN` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BKH_ORG_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_AGREE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `KF_DESC` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `KFEI` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `KFEN` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `OPINION` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_product_info
-- ----------------------------
DROP TABLE IF EXISTS `vv_product_info`;
CREATE TABLE `vv_product_info`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PURCHASESUBMIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MONAD` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REQUIRECOUNT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REQUIREDATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MATERIAL_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MATERIAL_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_proj_implem_plan
-- ----------------------------
DROP TABLE IF EXISTS `vv_proj_implem_plan`;
CREATE TABLE `vv_proj_implem_plan`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_proj_implem_schedule
-- ----------------------------
DROP TABLE IF EXISTS `vv_proj_implem_schedule`;
CREATE TABLE `vv_proj_implem_schedule`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PLAN_BEGIN_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PLAN_END_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BEGIN_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `END_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `WORK_DATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRE_PRIORITY` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SPACE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCHEDULE_TYPE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project
-- ----------------------------
DROP TABLE IF EXISTS `vv_project`;
CREATE TABLE `vv_project`  (
  `PID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SCHEDULE_TYPE` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CAPITAL_ENTRY_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLAN_NAME` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SPEC_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CAPITAL_TYPE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MANAGERORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MANAGER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SPEC_MANAGER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INTERFACE_MANAGER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_MANAGER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_MANAGER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `POLICY_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_FEASIBILITY` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_KEY_PROJECT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_INVITEBID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONS_TEMPLETE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJ_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FEASIBILITY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INVITEBID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TEMPLETE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_1
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_1`;
CREATE TABLE `vv_project_1`  (
  `PID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCHEDULE_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_DESC` varchar(3000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CAPITAL_ENTRY_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PLAN_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SPEC_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CAPITAL_TYPE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONSTRUCT_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MANAGERORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MANAGER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SPEC_MANAGER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `INTERFACE_MANAGER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONSTRUCT_MANAGER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_MANAGER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONSTRUCT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `POLICY_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_FEASIBILITY` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_KEY_PROJECT` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_INVITEBID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONS_TEMPLETE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJ_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FEASIBILITY` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `INVITEBID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TEMPLETE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJ` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_attachment`;
CREATE TABLE `vv_project_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_audit_recode
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_audit_recode`;
CREATE TABLE `vv_project_audit_recode`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `HANDERDATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `HANDERDATE2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `HANDLERCONTENT` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NODENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORGNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WF_ACT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BIZTYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_CATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_audit_recode1
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_audit_recode1`;
CREATE TABLE `vv_project_audit_recode1`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDERDATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDERDATE2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLERCONTENT` varchar(5000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NODENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ORGNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `WF_ACT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BIZTYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `AUDIT_CATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_completed
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_completed`;
CREATE TABLE `vv_project_completed`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REPORTISSUE_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SUPERVISOR_ORGUNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_ORGUNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCTION_ORGUNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WORKFLOW_ACTIVITY_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SUIGONG_ORGUNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_completed_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_completed_attachment`;
CREATE TABLE `vv_project_completed_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_group
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_group`;
CREATE TABLE `vv_project_group`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CAPITAL_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLAN_YEAR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SPECIALTY_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TOTAL_INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FORMER_TOTAL_INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_manager
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_manager`;
CREATE TABLE `vv_project_manager`  (
  `project_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  INDEX `sys_project_code`(`project_code`) USING BTREE,
  INDEX `sys_user_name`(`user_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_msg_all
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_msg_all`;
CREATE TABLE `vv_project_msg_all`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRJ_SERIAL_NUM` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRJ_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `STEPNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SPECIALTY_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `POLICY_TYPE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_PROPOSALREPKEYAN` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DSESIGN_DEP` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_TYPES` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PLAN_DEPT_PRJ_MANAGER` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BUILD_DEPT_PRJ_MANAGER` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SECOND_TRAN_MANAGERID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_pause
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_pause`;
CREATE TABLE `vv_project_pause`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PAUSE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RETURN_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PAUSE_NUM` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_policy
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_policy`;
CREATE TABLE `vv_project_policy`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_CORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `POLICY_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_policy_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_policy_attachment`;
CREATE TABLE `vv_project_policy_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_policy_child
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_policy_child`;
CREATE TABLE `vv_project_policy_child`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `POLICY_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `POLICY_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `POLICY_INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DECISION_MAKER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LEADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_schedule1
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_schedule1`;
CREATE TABLE `vv_project_schedule1`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SCHEDULE_TEMP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SCHEDULE_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLAN_BEGIN_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BEGIN_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_setup
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_setup`;
CREATE TABLE `vv_project_setup`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_GROUP_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUDGET_TRANS_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_DETAIL_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CAPITAL_TYPE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_TYPE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_TYPE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SPECIALTY_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MANAGER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLAN_TYPE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLAN_YEAR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TOTAL_INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FORMER_TOTAL_INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FIRST_QUARTER_INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SECOND_QUARTER_INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `THIRD_QUARTER_INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FORTH_QUARTER_INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CARRIED_FORWARD_INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CARRIED_BUSINESS_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SETUP_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_startup
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_startup`;
CREATE TABLE `vv_project_startup`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_startup_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_startup_attachment`;
CREATE TABLE `vv_project_startup_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_startup_child
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_startup_child`;
CREATE TABLE `vv_project_startup_child`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_DESC` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_NAME` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ESTIMATED_INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CAPITAL_ENTRY_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RE_SUBMIT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PLAN_NAME` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SPEC_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_TYPE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CAPITAL_TYPE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONSTRUCT_ORG_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MANAGERORG_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_FEASIBILITY` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `POLICY_TYPE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_KEY_PROJECT` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_INVITEBID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `YEAR` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FINISH_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRJ_BLOCK_NUM` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `proj_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `capital` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_project_terminate
-- ----------------------------
DROP TABLE IF EXISTS `vv_project_terminate`;
CREATE TABLE `vv_project_terminate`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `START_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_purchase_submit
-- ----------------------------
DROP TABLE IF EXISTS `vv_purchase_submit`;
CREATE TABLE `vv_purchase_submit`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REQ_SERIAL_NUM` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_DESC` varchar(5000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_NAME` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CAPITAL_TYPE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJCODES` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MATERIALTYPE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REQTYPE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `GONGQI_DESCRIPTION` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PREAMOUNT` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PURCHASE_DESCRIPTION` varchar(5000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SINGLE_DESCRIPTION` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUPURWAYS` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUPURWAYNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LISMSG` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NIMPLIS` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_purchase_submit_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_purchase_submit_attachment`;
CREATE TABLE `vv_purchase_submit_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PURCHASESUBMIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_quality_impotinfo
-- ----------------------------
DROP TABLE IF EXISTS `vv_quality_impotinfo`;
CREATE TABLE `vv_quality_impotinfo`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ADDRESS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUILDSTARTDATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGNPHONENUMBER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EXECUTE_ORG_IDS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EXECUTE_ORG_USER_IDS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EXECUTE_PHONE_NUMBER` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PHONE_NUMBER` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRE_END_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRE_SETUP_AMOUNT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRE_TOTAL_INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_PROFILE` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REPLY_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REVIEW_UNIT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SUPERVISOR_ORG_IDS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SUPERVISOR_ORG_USER_IDS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SUPERVISOR_PHONE_NUMBER` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_ORG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_ORG_USER` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_ORG_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_ORG` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_ORG_USER` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_ORG_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EXECUTE_ORG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EXECUTE_ORG_USER` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REVIEW_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SUPERVISOR_ORG` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SUPERVISOR_ORG_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EXECUTE_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BUILD_TYPE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_quality_super_declaration
-- ----------------------------
DROP TABLE IF EXISTS `vv_quality_super_declaration`;
CREATE TABLE `vv_quality_super_declaration`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QUALITYIMPORTINFO_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_recommendation_audit
-- ----------------------------
DROP TABLE IF EXISTS `vv_recommendation_audit`;
CREATE TABLE `vv_recommendation_audit`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_CORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RECOM_AUDIT_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_recommendation_audit_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_recommendation_audit_attachment`;
CREATE TABLE `vv_recommendation_audit_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_recommendation_audit_child
-- ----------------------------
DROP TABLE IF EXISTS `vv_recommendation_audit_child`;
CREATE TABLE `vv_recommendation_audit_child`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_NEED_REVISE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RECOM_AUDIT_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RECOM_INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_requirement_submit
-- ----------------------------
DROP TABLE IF EXISTS `vv_requirement_submit`;
CREATE TABLE `vv_requirement_submit`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ESTIMATED_INVEST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MANAGER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_requirement_submit_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_requirement_submit_attachment`;
CREATE TABLE `vv_requirement_submit_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_schedule_delayconstruct
-- ----------------------------
DROP TABLE IF EXISTS `vv_schedule_delayconstruct`;
CREATE TABLE `vv_schedule_delayconstruct`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLAN_BEGIN_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLAN_END_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELAY_BEGIN_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELAY_END_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELAYDAYS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WORK_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRIORITY` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRE_PRIORITY` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SCHEDULE_TYPE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_schedule_report
-- ----------------------------
DROP TABLE IF EXISTS `vv_schedule_report`;
CREATE TABLE `vv_schedule_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `projectCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `projectName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `point` decimal(19, 2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8949 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_score
-- ----------------------------
DROP TABLE IF EXISTS `vv_score`;
CREATE TABLE `vv_score`  (
  `id` bigint(20) DEFAULT NULL,
  INDEX `vv_score_id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_settlement_audit
-- ----------------------------
DROP TABLE IF EXISTS `vv_settlement_audit`;
CREATE TABLE `vv_settlement_audit`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SEND_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_CONTENT` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_FEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MATERIAL_FEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COOP_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COOP_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INNER_AUDITOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDITORG` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NODE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BACK_CONTENT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_settlement_audit_adjust
-- ----------------------------
DROP TABLE IF EXISTS `vv_settlement_audit_adjust`;
CREATE TABLE `vv_settlement_audit_adjust`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SEND_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_CONTENT` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_FEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MATERIAL_FEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COOP_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WORKFLOW_ACTIVITY_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COOP_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INNER_AUDITOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDITORG` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NODE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BACK_CONTENT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ADJUST_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `OLD_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_ADJUST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_settlement_audit_adjust_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_settlement_audit_adjust_attachment`;
CREATE TABLE `vv_settlement_audit_adjust_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_settlement_audit_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_settlement_audit_attachment`;
CREATE TABLE `vv_settlement_audit_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_settlement_audit_entrust
-- ----------------------------
DROP TABLE IF EXISTS `vv_settlement_audit_entrust`;
CREATE TABLE `vv_settlement_audit_entrust`  (
  `AUDIT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `END_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_ENTRUST_ACCEPT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_INTERFACE_ACCEPT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_REPEAT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INTERFACE_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_LETTER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_settlement_audit_exec
-- ----------------------------
DROP TABLE IF EXISTS `vv_settlement_audit_exec`;
CREATE TABLE `vv_settlement_audit_exec`  (
  `AUDIT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_ADDCUTFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_ADDFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_ADDFEE_RATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_AUDITFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_FEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_SUBCUTFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_SUBFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CON_DES_SUBFEE_RATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_PERSON` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_PERSON_PHONE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COST_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DEVELOP_PERSON` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DEVELOP_PERSON_PHONE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FEE_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MATERIAL_ADDCUTFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MATERIAL_ADDFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MATERIAL_ADDFEE_RATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MATERIAL_AUDITFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MATERIAL_FEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MATERIAL_SUBCUTFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MATERIAL_SUBFEE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MATERIAL_SUBFEE_RATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SUBMIT_SCALE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SURVEY_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SURVEY_RATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SURVEY_TIMES` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SURVEY_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_CONTRACT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_SPEC` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_REPEAT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `OLD_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BACK_CONTENT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BACK_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REPORT_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_settlement_audit_fee
-- ----------------------------
DROP TABLE IF EXISTS `vv_settlement_audit_fee`;
CREATE TABLE `vv_settlement_audit_fee`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TOTAL_SCORE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CHARGED_BATCH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_CHARGED` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_settlement_entrust_letter
-- ----------------------------
DROP TABLE IF EXISTS `vv_settlement_entrust_letter`;
CREATE TABLE `vv_settlement_entrust_letter`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTRUST_ORG_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_settlement_problem
-- ----------------------------
DROP TABLE IF EXISTS `vv_settlement_problem`;
CREATE TABLE `vv_settlement_problem`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_FEEDBACK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_OPINION` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_FEEDBACK` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FIRM_FEEDBACK` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROBLEM_DESC` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROBLEM_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROBLEM_ACT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ADD_INFO` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FIRM_FEEDBACK_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_FEEDBACK_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_FEEDBACK_USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_settlement_problem_activity
-- ----------------------------
DROP TABLE IF EXISTS `vv_settlement_problem_activity`;
CREATE TABLE `vv_settlement_problem_activity`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_EXEC_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BACK_CONTENT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BACK_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_HANDLE_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCT_HANDLE_BEGIN_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUDIT_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_shianqin1
-- ----------------------------
DROP TABLE IF EXISTS `vv_shianqin1`;
CREATE TABLE `vv_shianqin1`  (
  `ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_DESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DELETED_FLAG` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ORG_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FIRST_ZHIBIAO` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FIRST_FEN` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PID_S` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PID_G` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OUTLINE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DNS_CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SECOND_ZHIBIAO` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SECOND_FEN` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DANWEI` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DETAIL` varchar(10000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PINGFENREN` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  INDEX `ID`(`ID`) USING BTREE,
  INDEX `PID_G`(`PID_G`) USING BTREE,
  INDEX `PARENT_ID`(`PARENT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_shianqin3
-- ----------------------------
DROP TABLE IF EXISTS `vv_shianqin3`;
CREATE TABLE `vv_shianqin3`  (
  `ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_DESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DELETED_FLAG` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ORG_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FIRST_ZHIBIAO` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FIRST_FEN` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PID_S` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PID_G` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LIMIT_SCORE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OUTLINE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DNS_CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SECOND_ZHIBIAO` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SECOND_FEN` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DANWEI` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DETAIL` varchar(10000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PINGFENREN` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCORE_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_shianqinzb
-- ----------------------------
DROP TABLE IF EXISTS `vv_shianqinzb`;
CREATE TABLE `vv_shianqinzb`  (
  `ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_DESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DELETED_FLAG` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ORG_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FIRST_ZHIBIAO` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FIRST_FEN` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PID_S` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PID_G` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LIMIT_SCORE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OUTLINE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DNS_CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SECOND_ZHIBIAO` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SECOND_FEN` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DANWEI` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DETAIL` varchar(10000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PINGFENREN` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCORE_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_specialty
-- ----------------------------
DROP TABLE IF EXISTS `vv_specialty`;
CREATE TABLE `vv_specialty`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LONG_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_start_work
-- ----------------------------
DROP TABLE IF EXISTS `vv_start_work`;
CREATE TABLE `vv_start_work`  (
  `ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_ISKAIWA` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `KAIWA_DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REPORTISSUE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SUPERVISOR_ORGUNIT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESIGN_ORGUNIT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONSTRUCTION_ORGUNIT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SUIGONG_ORGUNIT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_start_work_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_start_work_attachment`;
CREATE TABLE `vv_start_work_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_submit_data
-- ----------------------------
DROP TABLE IF EXISTS `vv_submit_data`;
CREATE TABLE `vv_submit_data`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSETSENABLEDATE1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSETSENABLEDATE2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSETSENABLEDATE3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSETSENABLEDATE4` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSETSENABLEDATE5` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ISADJUSTREPORT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ISFIREPROJECT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NOFIRE_DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRE_CHECKDATE1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRE_CHECKDATE2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRE_CHECKDATE3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRE_CHECKDATE4` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PRE_CHECKDATE5` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REQUIREDATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TOTALASSETS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROJECT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WORKFLOW_ACTIVITY_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_submit_data_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_submit_data_attachment`;
CREATE TABLE `vv_submit_data_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_universal_workorder
-- ----------------------------
DROP TABLE IF EXISTS `vv_universal_workorder`;
CREATE TABLE `vv_universal_workorder`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATE_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_DESC` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FINISH_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DELETED_FLAG` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENTITY_CREATOR_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WORKFLOW_ACTIVITY_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FEEDBACKTIME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ISAPPROVAL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ISFEEDBACK` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PUSHCYCLE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REGULARENDTIME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REGULARSTARTTIME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REGULARTIME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SORTS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vv_universal_workorder_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vv_universal_workorder_attachment`;
CREATE TABLE `vv_universal_workorder_attachment`  (
  `ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTCHMENT_SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACH_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOAD_DATE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_UNIT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPLOADER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_STAGE_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ATTACHMENT_TYPE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_approver_list
-- ----------------------------
DROP TABLE IF EXISTS `w_approver_list`;
CREATE TABLE `w_approver_list`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `instance_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_approver_list_user`(`user_id`) USING BTREE,
  INDEX `FK12AEAC107D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `fk_approver_list_instance`(`instance_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_handle_sight
-- ----------------------------
DROP TABLE IF EXISTS `w_handle_sight`;
CREATE TABLE `w_handle_sight`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `disposal_Id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `disposal_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `flow_Id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `handle_Sight` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `isdefault` bit(1) DEFAULT NULL,
  `next_NodeType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `node_Id` bigint(20) DEFAULT NULL,
  `path_No` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `taskId` bigint(20) DEFAULT NULL,
  `task_Type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `xml_Package` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK149ABFAEFEC5CE5`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_instance
-- ----------------------------
DROP TABLE IF EXISTS `w_instance`;
CREATE TABLE `w_instance`  (
  `instanceid` bigint(20) NOT NULL AUTO_INCREMENT,
  `actionOp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `instanceBeginTime` datetime(0) DEFAULT NULL,
  `instanceEndTime` datetime(0) DEFAULT NULL,
  `instanceName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `instanceTimeLimit` float DEFAULT NULL,
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `state` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `workflowid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`instanceid`) USING BTREE,
  INDEX `wf_instance`(`workflowid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19180 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_instance_bak
-- ----------------------------
DROP TABLE IF EXISTS `w_instance_bak`;
CREATE TABLE `w_instance_bak`  (
  `instanceid` bigint(20) NOT NULL AUTO_INCREMENT,
  `actionOp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `instanceBeginTime` datetime(0) DEFAULT NULL,
  `instanceEndTime` datetime(0) DEFAULT NULL,
  `instanceName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `instanceTimeLimit` float DEFAULT NULL,
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `state` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `WORKFLOWID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`instanceid`) USING BTREE,
  INDEX `fk_wf_instance_bak`(`WORKFLOWID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_model
-- ----------------------------
DROP TABLE IF EXISTS `w_model`;
CREATE TABLE `w_model`  (
  `modelid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`modelid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_node
-- ----------------------------
DROP TABLE IF EXISTS `w_node`;
CREATE TABLE `w_node`  (
  `nodeid` bigint(20) NOT NULL AUTO_INCREMENT,
  `coment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nodeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `wfNodeId` bigint(20) DEFAULT NULL,
  `xmlDescription` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `workflowid` bigint(20) DEFAULT NULL,
  `sequenceNumber` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`nodeid`) USING BTREE,
  UNIQUE INDEX `wfNodeId`(`wfNodeId`) USING BTREE,
  INDEX `wf_node`(`workflowid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 858 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_nodestate
-- ----------------------------
DROP TABLE IF EXISTS `w_nodestate`;
CREATE TABLE `w_nodestate`  (
  `nodestateid` bigint(20) NOT NULL AUTO_INCREMENT,
  `backNodeId` bigint(20) DEFAULT NULL,
  `backUserId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  `isFinish` int(11) DEFAULT NULL,
  `multiPersonRule` int(11) DEFAULT NULL,
  `nodeBeginTime` datetime(0) DEFAULT NULL,
  `nodeEndTime` datetime(0) DEFAULT NULL,
  `nodeTimeLimit` float DEFAULT NULL,
  `nodeType` int(11) DEFAULT NULL,
  `outNodeCount` int(11) DEFAULT NULL,
  `synCounter` int(11) DEFAULT NULL,
  `nodeid` bigint(20) DEFAULT NULL,
  `instanceId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`nodestateid`) USING BTREE,
  INDEX `fk_ns_instance`(`instanceId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35056 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_nodestate_bak
-- ----------------------------
DROP TABLE IF EXISTS `w_nodestate_bak`;
CREATE TABLE `w_nodestate_bak`  (
  `nodestateid` bigint(20) NOT NULL AUTO_INCREMENT,
  `counter` int(11) DEFAULT NULL,
  `isFinish` int(11) DEFAULT NULL,
  `multiPersonRule` int(11) DEFAULT NULL,
  `nodeBeginTime` datetime(0) DEFAULT NULL,
  `nodeEndTime` datetime(0) DEFAULT NULL,
  `nodeTimeLimit` float DEFAULT NULL,
  `nodeType` int(11) DEFAULT NULL,
  `outNodeCount` int(11) DEFAULT NULL,
  `synCounter` int(11) DEFAULT NULL,
  `nodeid` bigint(20) DEFAULT NULL,
  `instanceId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`nodestateid`) USING BTREE,
  INDEX `fk_wf_node_sta_ins_bak`(`instanceId`) USING BTREE,
  INDEX `fk_wf_node_bak`(`nodeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_param
-- ----------------------------
DROP TABLE IF EXISTS `w_param`;
CREATE TABLE `w_param`  (
  `paramId` int(11) NOT NULL AUTO_INCREMENT,
  `paramName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `paramType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `paramValue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `instanceId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`paramId`) USING BTREE,
  INDEX `fk_par_instance`(`instanceId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13329 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_rt_defaultexcuter
-- ----------------------------
DROP TABLE IF EXISTS `w_rt_defaultexcuter`;
CREATE TABLE `w_rt_defaultexcuter`  (
  `defaultexcuterid` bigint(20) NOT NULL AUTO_INCREMENT,
  `rtnodeid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`defaultexcuterid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_rt_node
-- ----------------------------
DROP TABLE IF EXISTS `w_rt_node`;
CREATE TABLE `w_rt_node`  (
  `rtnodeid` bigint(20) NOT NULL AUTO_INCREMENT,
  `thenodeid` int(11) DEFAULT NULL,
  `timeLimit` float DEFAULT NULL,
  `timeLimit1` float DEFAULT NULL,
  `instanceId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rtnodeid`) USING BTREE,
  INDEX `fk_rtn_instance`(`instanceId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_task
-- ----------------------------
DROP TABLE IF EXISTS `w_task`;
CREATE TABLE `w_task`  (
  `taskid` bigint(20) NOT NULL AUTO_INCREMENT,
  `batchFlag` int(11) DEFAULT NULL,
  `beginTime` datetime(0) DEFAULT NULL,
  `consigner` int(11) DEFAULT NULL,
  `endTime` datetime(0) DEFAULT NULL,
  `multiPersonPRI` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `oaState` int(11) DEFAULT NULL,
  `planEndTime` datetime(0) DEFAULT NULL,
  `fromtaskid` bigint(20) DEFAULT NULL,
  `regain` int(11) DEFAULT NULL,
  `returnPrinciple` int(11) DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `taskShow` int(11) DEFAULT NULL,
  `taskType` int(11) DEFAULT NULL,
  `timeLimit` float DEFAULT NULL,
  `timeLimit1` float DEFAULT NULL,
  `timeLimit2` float DEFAULT NULL,
  `timelimitresponse` float DEFAULT NULL,
  `timelimitresponse1` float DEFAULT NULL,
  `timelimitresponse2` float DEFAULT NULL,
  `updateVersion` int(11) DEFAULT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `preuserid` bigint(20) DEFAULT NULL,
  `assignuserid` bigint(20) DEFAULT NULL,
  `instance_id` bigint(20) DEFAULT NULL,
  `nodestateid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `auditOption` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`taskid`) USING BTREE,
  INDEX `fk_t_instance`(`nodestateid`) USING BTREE,
  INDEX `fk_task_pre_u`(`preuserid`) USING BTREE,
  INDEX `FKD081A04D95327AD6`(`instance_id`) USING BTREE,
  INDEX `FKD081A04DE6DCA0FC`(`userid`) USING BTREE,
  INDEX `FKD081A04DC77E72AB`(`assignuserid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25915 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_task_bak
-- ----------------------------
DROP TABLE IF EXISTS `w_task_bak`;
CREATE TABLE `w_task_bak`  (
  `taskid` bigint(20) NOT NULL AUTO_INCREMENT,
  `beginTime` datetime(0) DEFAULT NULL,
  `endTime` datetime(0) DEFAULT NULL,
  `multiPersonPRI` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `taskShow` int(11) DEFAULT NULL,
  `taskType` int(11) DEFAULT NULL,
  `timeLimit` float DEFAULT NULL,
  `timeLimit1` float DEFAULT NULL,
  `timeLimit2` float DEFAULT NULL,
  `timelimitresponse` float DEFAULT NULL,
  `timelimitresponse1` float DEFAULT NULL,
  `timelimitresponse2` float DEFAULT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `userid` int(11) DEFAULT NULL,
  `preuserid` bigint(20) DEFAULT NULL,
  `consigner` bigint(20) DEFAULT NULL,
  `nodestateid` bigint(20) DEFAULT NULL,
  `fromtaskid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`taskid`) USING BTREE,
  INDEX `fk_wf_task_bak_cons`(`consigner`) USING BTREE,
  INDEX `fk_wf_task_bak_node_sta`(`nodestateid`) USING BTREE,
  INDEX `fk_wf_task_bak_pre_user`(`preuserid`) USING BTREE,
  INDEX `fk_wf_task_bak_pre_task`(`fromtaskid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_task_entrust
-- ----------------------------
DROP TABLE IF EXISTS `w_task_entrust`;
CREATE TABLE `w_task_entrust`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(0) DEFAULT NULL,
  `end_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `plan_begin_date` datetime(0) DEFAULT NULL,
  `plan_end_date` datetime(0) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  `workflowid` bigint(20) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `acceptor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK4B295D5D3F0B13C5`(`acceptor_id`) USING BTREE,
  INDEX `FK4B295D5D6AE860E4`(`creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_task_ext
-- ----------------------------
DROP TABLE IF EXISTS `w_task_ext`;
CREATE TABLE `w_task_ext`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `startType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `taskId` bigint(20) DEFAULT NULL,
  `instanceId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wte_instance`(`instanceId`) USING BTREE,
  INDEX `wte_task`(`taskId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_tempexcuter
-- ----------------------------
DROP TABLE IF EXISTS `w_tempexcuter`;
CREATE TABLE `w_tempexcuter`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `taskid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_t_ex_task`(`taskid`) USING BTREE,
  INDEX `fk_t_ex_user`(`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_workflow
-- ----------------------------
DROP TABLE IF EXISTS `w_workflow`;
CREATE TABLE `w_workflow`  (
  `workflowid` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `createUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `modelId` bigint(20) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `valid` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`workflowid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_workflow_activity
-- ----------------------------
DROP TABLE IF EXISTS `w_workflow_activity`;
CREATE TABLE `w_workflow_activity`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activity_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activity_id` bigint(20) DEFAULT NULL,
  `business_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `flow_instance_Id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `read_only_url` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `userid_copy_for` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `username_copy_for` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `instance_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `node_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK4C18EDC77D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK4C18EDC795327AD6`(`instance_id`) USING BTREE,
  INDEX `idx_wwa_code`(`entity_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 670136 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_craft_type
-- ----------------------------
DROP TABLE IF EXISTS `wbs_craft_type`;
CREATE TABLE `wbs_craft_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `need_photo` bit(1) DEFAULT NULL,
  `photoNum` int(11) NOT NULL,
  `schedule_template_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKBC3E0F90604DAC4E`(`schedule_template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_field
-- ----------------------------
DROP TABLE IF EXISTS `wbs_field`;
CREATE TABLE `wbs_field`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `real_value` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `field_unit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `field_Template_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK1B5A6903210A44B5`(`field_unit_id`) USING BTREE,
  INDEX `FK1B5A6903CDE61A2A`(`field_Template_id`) USING BTREE,
  INDEX `FK1B5A69037D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 234 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_field_code
-- ----------------------------
DROP TABLE IF EXISTS `wbs_field_code`;
CREATE TABLE `wbs_field_code`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `code_sql` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_field_role
-- ----------------------------
DROP TABLE IF EXISTS `wbs_field_role`;
CREATE TABLE `wbs_field_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_field_template
-- ----------------------------
DROP TABLE IF EXISTS `wbs_field_template`;
CREATE TABLE `wbs_field_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `data_type` int(11) DEFAULT NULL,
  `is_required` bit(1) DEFAULT NULL,
  `level_no` int(11) DEFAULT NULL,
  `attachment_id` bigint(20) DEFAULT NULL,
  `field_code_id` bigint(20) DEFAULT NULL,
  `root_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `report_org_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKBCC808364AEED487`(`root_id`) USING BTREE,
  INDEX `FKBCC80836348788B1`(`attachment_id`) USING BTREE,
  INDEX `FKBCC80836EE8800F2`(`report_org_type_id`) USING BTREE,
  INDEX `FKBCC808367412D7BF`(`parent_id`) USING BTREE,
  INDEX `FKBCC80836FBA7994A`(`field_code_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_field_template_spec
-- ----------------------------
DROP TABLE IF EXISTS `wbs_field_template_spec`;
CREATE TABLE `wbs_field_template_spec`  (
  `template_id` bigint(20) NOT NULL,
  `spec_id` bigint(20) NOT NULL,
  INDEX `FK8935A24E4A9CCF2`(`spec_id`) USING BTREE,
  INDEX `FK8935A246226C1EF`(`template_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_field_unit
-- ----------------------------
DROP TABLE IF EXISTS `wbs_field_unit`;
CREATE TABLE `wbs_field_unit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK244F53407D3296C0`(`entity_creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_ft_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `wbs_ft_role_relation`;
CREATE TABLE `wbs_ft_role_relation`  (
  `ft_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  INDEX `FKAF0C364BFE7FB11B`(`ft_id`) USING BTREE,
  INDEX `FKAF0C364BA109F2EF`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_ft_st_relation
-- ----------------------------
DROP TABLE IF EXISTS `wbs_ft_st_relation`;
CREATE TABLE `wbs_ft_st_relation`  (
  `ft_id` bigint(20) NOT NULL,
  `st_id` bigint(20) NOT NULL,
  INDEX `FK52D09240FE7FB11B`(`ft_id`) USING BTREE,
  INDEX `FK52D092404C0D06AF`(`st_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_pask
-- ----------------------------
DROP TABLE IF EXISTS `wbs_pask`;
CREATE TABLE `wbs_pask`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `onlyId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `resourceStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lte_id` bigint(20) DEFAULT NULL,
  `import_id` bigint(20) DEFAULT NULL,
  `zhywq_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `zdw_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK537AF6E0B5720919`(`import_id`) USING BTREE,
  INDEX `FK537AF6E0781A3A3B`(`zhywq_id`) USING BTREE,
  INDEX `FK537AF6E07A70597B`(`zdw_id`) USING BTREE,
  INDEX `FK537AF6E07D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK537AF6E06365977B`(`lte_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_pask_check
-- ----------------------------
DROP TABLE IF EXISTS `wbs_pask_check`;
CREATE TABLE `wbs_pask_check`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `import_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK7E1E96E9B5720919`(`import_id`) USING BTREE,
  INDEX `FK7E1E96E9967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK7E1E96E97D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK7E1E96E9A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_pask_completed
-- ----------------------------
DROP TABLE IF EXISTS `wbs_pask_completed`;
CREATE TABLE `wbs_pask_completed`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `import_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK227DCFACB5720919`(`import_id`) USING BTREE,
  INDEX `FK227DCFAC967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK227DCFAC7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK227DCFACA29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_pask_import
-- ----------------------------
DROP TABLE IF EXISTS `wbs_pask_import`;
CREATE TABLE `wbs_pask_import`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `checkDate` datetime(0) DEFAULT NULL,
  `completedDate` datetime(0) DEFAULT NULL,
  `preDate` datetime(0) DEFAULT NULL,
  `resourceStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `startDate` datetime(0) DEFAULT NULL,
  `rlmsMsg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK503CFDE4967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK503CFDE47D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK503CFDE4A29A3F85`(`apply_org_id`) USING BTREE,
  INDEX `FK503CFDE4F7258E38`(`attachment_unit_id`) USING BTREE,
  CONSTRAINT `FK503CFDE4F7258E38` FOREIGN KEY (`attachment_unit_id`) REFERENCES `b_attachment_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_pask_lte
-- ----------------------------
DROP TABLE IF EXISTS `wbs_pask_lte`;
CREATE TABLE `wbs_pask_lte`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `zd1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd16` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd17` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd18` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd19` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd20` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd21` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd22` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd23` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd24` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd25` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd26` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd27` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_pask_pre
-- ----------------------------
DROP TABLE IF EXISTS `wbs_pask_pre`;
CREATE TABLE `wbs_pask_pre`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `import_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK9D9168C4B5720919`(`import_id`) USING BTREE,
  INDEX `FK9D9168C4967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK9D9168C47D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK9D9168C4A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_pask_start
-- ----------------------------
DROP TABLE IF EXISTS `wbs_pask_start`;
CREATE TABLE `wbs_pask_start`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `import_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK7F057643B5720919`(`import_id`) USING BTREE,
  INDEX `FK7F057643967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK7F0576437D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK7F057643A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_pask_zdw
-- ----------------------------
DROP TABLE IF EXISTS `wbs_pask_zdw`;
CREATE TABLE `wbs_pask_zdw`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `zd1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd10` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd100` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd101` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd102` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd103` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd104` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd105` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd106` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd107` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd108` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd109` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd11` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd110` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd111` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd112` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd113` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd114` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd115` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd116` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd117` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd118` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd119` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd12` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd120` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd121` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd122` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd123` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd124` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd125` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd126` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd127` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd128` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd129` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd13` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd130` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd131` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd132` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd133` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd134` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd135` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd136` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd137` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd138` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd139` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd14` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd140` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd141` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd142` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd143` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd144` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd145` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd146` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd147` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd148` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd149` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd15` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd150` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd151` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd152` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd153` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd154` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd155` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd156` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd157` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd158` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd16` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd17` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd18` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd19` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd20` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd21` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd22` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd23` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd24` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd25` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd26` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd27` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd28` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd29` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd30` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd31` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd32` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd33` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd34` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd35` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd36` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd37` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd38` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd39` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd4` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd40` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd41` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd42` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd43` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd44` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd45` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd46` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd47` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd48` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd49` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd5` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd50` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd51` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd52` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd53` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd54` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd55` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd56` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd57` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd58` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd59` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd6` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd60` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd61` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd62` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd63` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd64` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd65` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd66` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd67` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd68` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd69` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd7` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd70` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd71` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd72` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd73` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd74` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd75` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd76` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd77` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd78` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd79` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd8` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd80` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd81` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd82` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd83` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd84` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd85` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd86` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd87` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd88` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd89` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd9` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd90` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd91` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd92` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd93` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd94` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd95` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd96` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd97` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd98` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd99` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd159` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd160` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_pask_zhywq
-- ----------------------------
DROP TABLE IF EXISTS `wbs_pask_zhywq`;
CREATE TABLE `wbs_pask_zhywq`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `zd1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd16` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd17` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd18` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd19` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd20` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd21` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd22` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd23` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd24` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd25` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd26` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd27` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd28` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd29` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd30` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd31` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd32` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd33` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd34` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd35` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd36` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd37` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd38` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd39` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd40` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd41` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd42` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd43` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd44` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd45` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd46` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd47` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd48` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd49` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_photo
-- ----------------------------
DROP TABLE IF EXISTS `wbs_photo`;
CREATE TABLE `wbs_photo`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sourceId` bigint(20) DEFAULT NULL,
  `take_date` datetime(0) DEFAULT NULL,
  `take_latitude` decimal(19, 10) DEFAULT NULL,
  `take_longitude` decimal(19, 10) DEFAULT NULL,
  `upload_date` datetime(0) DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url_little` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url_middle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `photo_unit_id` bigint(20) DEFAULT NULL,
  `take_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK1BE7063BBEAD6B25`(`photo_unit_id`) USING BTREE,
  INDEX `FK1BE7063B1D54C12D`(`take_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_photo_unit
-- ----------------------------
DROP TABLE IF EXISTS `wbs_photo_unit`;
CREATE TABLE `wbs_photo_unit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 244 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_pk
-- ----------------------------
DROP TABLE IF EXISTS `wbs_pk`;
CREATE TABLE `wbs_pk`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `onlyId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `resourceStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `import_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `lte_id` bigint(20) DEFAULT NULL,
  `zdw_id` bigint(20) DEFAULT NULL,
  `zhywq_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKD0AB6A92430BF4C9`(`zdw_id`) USING BTREE,
  INDEX `FKD0AB6A92883C3A09`(`zhywq_id`) USING BTREE,
  INDEX `FKD0AB6A92B5720919`(`import_id`) USING BTREE,
  INDEX `FKD0AB6A922C0132C9`(`lte_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1225 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_pk_lte
-- ----------------------------
DROP TABLE IF EXISTS `wbs_pk_lte`;
CREATE TABLE `wbs_pk_lte`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `zd1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd16` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd17` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd18` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd19` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd20` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd21` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd22` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd23` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd24` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd25` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_pk_zdw
-- ----------------------------
DROP TABLE IF EXISTS `wbs_pk_zdw`;
CREATE TABLE `wbs_pk_zdw`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `zd1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd10` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd100` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd101` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd102` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd103` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd104` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd105` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd106` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd107` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd108` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd109` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd11` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd110` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd111` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd112` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd113` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd114` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd115` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd116` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd117` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd118` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd119` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd12` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd120` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd121` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd122` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd123` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd124` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd125` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd126` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd127` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd128` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd129` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd13` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd130` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd131` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd132` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd133` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd134` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd135` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd136` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd137` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd138` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd139` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd14` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd140` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd141` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd142` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd143` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd144` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd145` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd146` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd147` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd148` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd149` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd15` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd150` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd151` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd152` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd153` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd154` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd155` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd156` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd157` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd158` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd16` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd17` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd18` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd19` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd20` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd21` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd22` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd23` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd24` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd25` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd26` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd27` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd28` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd29` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd30` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd31` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd32` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd33` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd34` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd35` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd36` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd37` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd38` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd39` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd4` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd40` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd41` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd42` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd43` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd44` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd45` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd46` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd47` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd48` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd49` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd5` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd50` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd51` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd52` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd53` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd54` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd55` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd56` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd57` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd58` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd59` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd6` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd60` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd61` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd62` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd63` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd64` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd65` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd66` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd67` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd68` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd69` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd7` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd70` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd71` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd72` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd73` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd74` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd75` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd76` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd77` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd78` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd79` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd8` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd80` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd81` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd82` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd83` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd84` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd85` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd86` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd87` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd88` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd89` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd9` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd90` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd91` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd92` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd93` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd94` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd95` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd96` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd97` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd98` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd99` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 705 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_pk_zhywq
-- ----------------------------
DROP TABLE IF EXISTS `wbs_pk_zhywq`;
CREATE TABLE `wbs_pk_zhywq`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `zd1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd16` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd17` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd18` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd19` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd20` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd21` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd22` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd23` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd24` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd25` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd26` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd27` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd28` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd29` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd30` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd31` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd32` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd33` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd34` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd35` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd36` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd37` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd38` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd39` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd40` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd41` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd42` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd43` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd44` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd45` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd46` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd47` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zd9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_problem
-- ----------------------------
DROP TABLE IF EXISTS `wbs_problem`;
CREATE TABLE `wbs_problem`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `happen_date` datetime(0) DEFAULT NULL,
  `problemId` bigint(20) DEFAULT NULL,
  `solve` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `solveDesc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `urgent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  `photo_unit_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `reflector_id` bigint(20) DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `problem_type_id` bigint(20) DEFAULT NULL,
  `solveor_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKCF46AC6846D6F447`(`photo_unit_id`) USING BTREE,
  INDEX `FKCF46AC68634CBB30`(`reflector_id`) USING BTREE,
  INDEX `FKCF46AC68967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FKCF46AC685C31E216`(`project_id`) USING BTREE,
  INDEX `FKCF46AC687D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKCF46AC68DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FKCF46AC68434ADC34`(`task_id`) USING BTREE,
  INDEX `FKCF46AC685CC8033F`(`problem_type_id`) USING BTREE,
  INDEX `FKCF46AC68F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FKCF46AC687248AEE`(`solveor_id`) USING BTREE,
  INDEX `FKCF46AC68A29A3F85`(`apply_org_id`) USING BTREE,
  CONSTRAINT `FKCF46AC68434ADC34` FOREIGN KEY (`task_id`) REFERENCES `wbs_task` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKCF46AC6846D6F447` FOREIGN KEY (`photo_unit_id`) REFERENCES `b_attachment_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKCF46AC685C31E216` FOREIGN KEY (`project_id`) REFERENCES `b_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKCF46AC685CC8033F` FOREIGN KEY (`problem_type_id`) REFERENCES `wbs_problem_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKCF46AC68634CBB30` FOREIGN KEY (`reflector_id`) REFERENCES `s_privilege_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKCF46AC687248AEE` FOREIGN KEY (`solveor_id`) REFERENCES `s_privilege_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKCF46AC687D3296C0` FOREIGN KEY (`entity_creator_id`) REFERENCES `s_privilege_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKCF46AC68967622C2` FOREIGN KEY (`apply_dept_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKCF46AC68A29A3F85` FOREIGN KEY (`apply_org_id`) REFERENCES `c_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKCF46AC68DEFD0F5` FOREIGN KEY (`workflow_activity_id`) REFERENCES `w_workflow_activity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKCF46AC68F7258E38` FOREIGN KEY (`attachment_unit_id`) REFERENCES `b_attachment_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_problem_type
-- ----------------------------
DROP TABLE IF EXISTS `wbs_problem_type`;
CREATE TABLE `wbs_problem_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_rectification
-- ----------------------------
DROP TABLE IF EXISTS `wbs_rectification`;
CREATE TABLE `wbs_rectification`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `bh_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `finish_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rectify_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `require_finish_date` datetime(0) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `apply_org_id` bigint(20) DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `before_unit_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `apply_dept_id` bigint(20) DEFAULT NULL,
  `after_unit_id` bigint(20) DEFAULT NULL,
  `workflow_activity_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK2187EC033350CF72`(`before_unit_id`) USING BTREE,
  INDEX `FK2187EC03967622C2`(`apply_dept_id`) USING BTREE,
  INDEX `FK2187EC037D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK2187EC03DEFD0F5`(`workflow_activity_id`) USING BTREE,
  INDEX `FK2187EC03434ADC34`(`task_id`) USING BTREE,
  INDEX `FK2187EC03F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK2187EC03A93E8CF`(`after_unit_id`) USING BTREE,
  INDEX `FK2187EC03A29A3F85`(`apply_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_rectification_type
-- ----------------------------
DROP TABLE IF EXISTS `wbs_rectification_type`;
CREATE TABLE `wbs_rectification_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_schedule
-- ----------------------------
DROP TABLE IF EXISTS `wbs_schedule`;
CREATE TABLE `wbs_schedule`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `assign_date` datetime(0) DEFAULT NULL,
  `begin_date` datetime(0) DEFAULT NULL,
  `end_date` datetime(0) DEFAULT NULL,
  `plan_begin_date` datetime(0) DEFAULT NULL,
  `plan_end_date` datetime(0) DEFAULT NULL,
  `progress` decimal(19, 2) DEFAULT NULL,
  `schedule_type_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK2BE9E1EE7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK2BE9E1EEA9E13E4E`(`schedule_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 979 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_schedule_template
-- ----------------------------
DROP TABLE IF EXISTS `wbs_schedule_template`;
CREATE TABLE `wbs_schedule_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `exe_order` int(11) DEFAULT NULL,
  `is_enabled` bit(1) DEFAULT NULL,
  `level_no` int(11) DEFAULT NULL,
  `need_photo` bit(1) DEFAULT NULL,
  `progress` decimal(19, 2) DEFAULT NULL,
  `standard_duration` int(11) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `schedule_type_id` bigint(20) DEFAULT NULL,
  `root_templete_id` bigint(20) DEFAULT NULL,
  `report_org_type_id` bigint(20) DEFAULT NULL,
  `need_check` bit(1) DEFAULT NULL,
  `need_report` bit(1) DEFAULT NULL,
  `standard_process` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `photo_unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK898A67ABBEAD6B25`(`photo_unit_id`) USING BTREE,
  INDEX `FK898A67ABFC5DE495`(`root_templete_id`) USING BTREE,
  INDEX `FK898A67ABEE8800F2`(`report_org_type_id`) USING BTREE,
  INDEX `FK898A67ABA9E13E4E`(`schedule_type_id`) USING BTREE,
  INDEX `FK898A67ABC0E8FBC6`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_schedule_template_spec
-- ----------------------------
DROP TABLE IF EXISTS `wbs_schedule_template_spec`;
CREATE TABLE `wbs_schedule_template_spec`  (
  `template_id` bigint(20) NOT NULL,
  `spec_id` bigint(20) NOT NULL,
  INDEX `FKC91B5BCFE4A9CCF2`(`spec_id`) USING BTREE,
  INDEX `FKC91B5BCFAEFCE5F6`(`template_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_schedule_type
-- ----------------------------
DROP TABLE IF EXISTS `wbs_schedule_type`;
CREATE TABLE `wbs_schedule_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `con_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_required` bit(1) DEFAULT NULL,
  `level_no` int(11) DEFAULT NULL,
  `photo_num` int(11) DEFAULT NULL,
  `quality_way` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `templete_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK6BAD6AEB3F7F5C86`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_supervision_log
-- ----------------------------
DROP TABLE IF EXISTS `wbs_supervision_log`;
CREATE TABLE `wbs_supervision_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK9DD09CF15C31E216`(`project_id`) USING BTREE,
  INDEX `FK9DD09CF17D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK9DD09CF1434ADC34`(`task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_task
-- ----------------------------
DROP TABLE IF EXISTS `wbs_task`;
CREATE TABLE `wbs_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `acceptance_date` datetime(0) DEFAULT NULL,
  `acceptance_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `center_mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `check_date` datetime(0) DEFAULT NULL,
  `con_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `explain_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `irms_Num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_adjust` bit(1) DEFAULT NULL,
  `delete_flag` bit(1) DEFAULT NULL,
  `is_qualified` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `level_no` int(11) DEFAULT NULL,
  `min_hoto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `no_photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `no_photo_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `other_problems` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `physical_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `progress` decimal(19, 2) DEFAULT NULL,
  `quality_way` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `resource_node_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `resource_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `site_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `solving_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `test_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `field_template_id` bigint(20) DEFAULT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `field_unit_id` bigint(20) DEFAULT NULL,
  `detail_id` bigint(20) DEFAULT NULL,
  `main_task_id` bigint(20) DEFAULT NULL,
  `root_task_id` bigint(20) DEFAULT NULL,
  `schedule_template_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  `rectification_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK537CC85C4C291020`(`rectification_id`) USING BTREE,
  INDEX `FK537CC85C3F6A0DF4`(`schedule_id`) USING BTREE,
  INDEX `FK537CC85C210A44B5`(`field_unit_id`) USING BTREE,
  INDEX `FK537CC85CCDE61A2A`(`field_template_id`) USING BTREE,
  INDEX `FK537CC85C7BE12719`(`detail_id`) USING BTREE,
  INDEX `FK537CC85C7D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FK537CC85C604DAC4E`(`schedule_template_id`) USING BTREE,
  INDEX `FK537CC85C1A51FAEF`(`parent_id`) USING BTREE,
  INDEX `FK537CC85CE6FA01D7`(`root_task_id`) USING BTREE,
  INDEX `FK537CC85C68ACBFAE`(`main_task_id`) USING BTREE,
  CONSTRAINT `FK537CC85C68ACBFAE` FOREIGN KEY (`main_task_id`) REFERENCES `wbs_task` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 998 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_task_detail
-- ----------------------------
DROP TABLE IF EXISTS `wbs_task_detail`;
CREATE TABLE `wbs_task_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `is_abolish` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `obtain_way` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `plan_end_date` datetime(0) DEFAULT NULL,
  `plan_latitude` decimal(19, 10) DEFAULT NULL,
  `plan_longitude` decimal(19, 10) DEFAULT NULL,
  `real_latitude` decimal(19, 10) DEFAULT NULL,
  `real_longitude` decimal(19, 10) DEFAULT NULL,
  `construction_orgunit_id` bigint(20) DEFAULT NULL,
  `report_org_id` bigint(20) DEFAULT NULL,
  `construct_org2_id` bigint(20) DEFAULT NULL,
  `reportor_id` bigint(20) DEFAULT NULL,
  `supervisor_id` bigint(20) DEFAULT NULL,
  `acceptor_id` bigint(20) DEFAULT NULL,
  `attachment_unit_id` bigint(20) DEFAULT NULL,
  `photo_unit_id` bigint(20) DEFAULT NULL,
  `construct_org1_id` bigint(20) DEFAULT NULL,
  `no_require` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK9AD86D94BEAD6B25`(`photo_unit_id`) USING BTREE,
  INDEX `FK9AD86D94ADFAF19`(`reportor_id`) USING BTREE,
  INDEX `FK9AD86D94346F4202`(`construct_org2_id`) USING BTREE,
  INDEX `FK9AD86D943F0B13C5`(`acceptor_id`) USING BTREE,
  INDEX `FK9AD86D94F7258E38`(`attachment_unit_id`) USING BTREE,
  INDEX `FK9AD86D94F654A1A3`(`supervisor_id`) USING BTREE,
  INDEX `FK9AD86D9475A502FF`(`report_org_id`) USING BTREE,
  INDEX `FK9AD86D94346ECDA3`(`construct_org1_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 975 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_task_report
-- ----------------------------
DROP TABLE IF EXISTS `wbs_task_report`;
CREATE TABLE `wbs_task_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `report_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `report_org_id` bigint(20) DEFAULT NULL,
  `task_detail_id` bigint(20) DEFAULT NULL,
  `photo_unit_id` bigint(20) DEFAULT NULL,
  `reportor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKB2BAAA77BEAD6B25`(`photo_unit_id`) USING BTREE,
  INDEX `FKB2BAAA77ADFAF19`(`reportor_id`) USING BTREE,
  INDEX `FKB2BAAA778BAAF4DF`(`task_detail_id`) USING BTREE,
  INDEX `FKB2BAAA7775A502FF`(`report_org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_task_status
-- ----------------------------
DROP TABLE IF EXISTS `wbs_task_status`;
CREATE TABLE `wbs_task_status`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_create_date` datetime(0) DEFAULT NULL,
  `entity_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `finish_date` datetime(0) DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `complete_date` datetime(0) DEFAULT NULL,
  `hanler_id` bigint(20) DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  `entity_creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKB53C2535CB396C6B`(`schedule_id`) USING BTREE,
  INDEX `FKB53C253529CDEAAC`(`hanler_id`) USING BTREE,
  INDEX `FKB53C25357D3296C0`(`entity_creator_id`) USING BTREE,
  INDEX `FKB53C2535434ADC34`(`task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wbs_task_status_schedule
-- ----------------------------
DROP TABLE IF EXISTS `wbs_task_status_schedule`;
CREATE TABLE `wbs_task_status_schedule`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for v_bao_projectammountdiff
-- ----------------------------
DROP VIEW IF EXISTS `v_bao_projectammountdiff`;
CREATE ALGORITHM = UNDEFINED DEFINER = `epms_cq`@`%` SQL SECURITY DEFINER VIEW `v_bao_projectammountdiff` AS select `b`.`id` AS `id`,`b`.`entity_code` AS `projectCode`,`b`.`entity_name` AS `projectName`,`bpp`.`policy_invest` AS `policyInvest`,`bfr`.`reply_invest` AS `feaReplyInvest`,(`bpp`.`policy_invest` - `bfr`.`reply_invest`) AS `policyChaE`,cast((((`bpp`.`policy_invest` - `bfr`.`reply_invest`) / `bpp`.`policy_invest`) * 100) as decimal(19,2)) AS `policyChaBi`,`bda`.`design_invest` AS `designInvest`,(`bfr`.`reply_invest` - `bda`.`design_invest`) AS `feaReplyChaDe`,cast((((`bfr`.`reply_invest` - `bda`.`design_invest`) / `bfr`.`reply_invest`) * 100) as decimal(19,2)) AS `feaReplyChaBi`,`csp`.`party_name` AS `specName`,`csp`.`id` AS `specId`,`spu`.`party_name` AS `managerName`,date_format(`bps`.`entity_create_date`,'%Y-%m-%d') AS `createDate` from (((((((`b_project` `b` left join `b_project_policy` `bpp` on((`bpp`.`project_id` = `b`.`id`))) left join `b_fea_reply` `bfr` on((`bfr`.`project_id` = `b`.`id`))) left join `b_design_approval` `bda` on((`bda`.`project_id` = `b`.`id`))) left join `b_proj_info` `info` on((`info`.`id` = `b`.`proj_info_id`))) left join `c_specialty` `csp` on((`csp`.`id` = `info`.`spec_id`))) left join `s_privilege_user` `spu` on((`spu`.`id` = `info`.`manager_id`))) left join `b_project_startup` `bps` on((`bps`.`project_id` = `b`.`id`)));

-- ----------------------------
-- View structure for v_bao_projectfinalauditofreview
-- ----------------------------
DROP VIEW IF EXISTS `v_bao_projectfinalauditofreview`;
CREATE ALGORITHM = UNDEFINED DEFINER = `epms_cq`@`%` SQL SECURITY DEFINER VIEW `v_bao_projectfinalauditofreview` AS (select `bp`.`entity_code` AS `projectCode`,`bp`.`id` AS `projectId`,`bp`.`entity_name` AS `projectName`,`consorg`.`party_name` AS `consOrgName`,`consuser`.`id` AS `consUserId`,`consuser`.`party_name` AS `consUserName`,`auditorg`.`party_name` AS `auditOrgName`,`audituser`.`party_name` AS `auditUserName`,`bap`.`audit_status` AS `auditStatus`,date_format(`bae`.`entity_create_date`,'%Y-%m-%d') AS `acceptDate`,date_format(`bae`.`entrust_date`,'%Y-%m-%d') AS `entrustDate`,date_format(`bae`.`end_date`,'%Y-%m-%d') AS `endDate`,`bap`.`con_des_fee` AS `conDecFee`,`bap`.`con_des_auditfee` AS `conDesAuditFee`,`bap`.`con_des_subfee` AS `conDesSubFee`,`bap`.`con_des_addfee` AS `conDesAddFee`,'' AS `adjustFee`,`bap`.`con_des_subfee_rate` AS `conDesSubFeeRate`,`bap`.`con_des_addfee_rate` AS `conDesAddFeeRate`,'' AS `adjustRate`,`bpa`.`id` AS `problem`,`baexec`.`report_code` AS `reportCode`,(case when (`bfaf`.`is_charged` = 1) then '是' when (`bfaf`.`is_charged` = 0) then '否' end) AS `is_charged`,`bfaf`.`charged_batch` AS `charged_batch`,`bfaef`.`audit_fee` AS `fee`,'' AS `audit`,'' AS `firstAudit`,`baexec`.`attachment_unit_id` AS `report`,`bap`.`attachment_unit_id` AS `atta` from (((((((((((`b_audit_project` `bap` left join `b_project` `bp` on((`bp`.`id` = `bap`.`project_id`))) left join `b_proj_info` `bpi` on((`bpi`.`id` = `bp`.`proj_info_id`))) left join `c_organization` `consorg` on((`consorg`.`id` = `bpi`.`construct_org_id`))) left join `s_privilege_user` `consuser` on((`consuser`.`id` = `bpi`.`project_manager_id`))) left join `b_audit_entrust` `bae` on(((`bae`.`audit_project_id` = `bap`.`id`) and (`bae`.`audit_type` = 'Final')))) left join `c_organization` `auditorg` on((`auditorg`.`id` = `bae`.`entrust_org_id`))) left join `b_audit_exec` `baexec` on((`baexec`.`project_id` = `bp`.`id`))) left join `s_privilege_user` `audituser` on((`audituser`.`id` = `bae`.`entrust_user_id`))) left join `b_final_audit_exec_fee` `bfaef` on((`bfaef`.`final_audit_exec_id` = `baexec`.`id`))) left join `b_final_audit_fee` `bfaf` on((`bfaf`.`id` = `bfaef`.`final_audit_fee_id`))) left join `b_problem_activity` `bpa` on((`bpa`.`audit_project_id` = `bap`.`id`))) where (`baexec`.`audit_type` = 'Final'));

-- ----------------------------
-- View structure for v_bao_projectfullinfo
-- ----------------------------
DROP VIEW IF EXISTS `v_bao_projectfullinfo`;
CREATE ALGORITHM = UNDEFINED DEFINER = `epms_cq`@`%` SQL SECURITY DEFINER VIEW `v_bao_projectfullinfo` AS select distinct `b`.`id` AS `id`,`b`.`entity_name` AS `projectName`,`spu`.`party_name` AS `projectManagerName`,`b`.`entity_code` AS `projectCode`,date_format(`pbpp`.`finish_date`,'%Y-%m-%d') AS `codeCreateDate`,date_format(`bpp`.`policy_date`,'%Y-%m-%d') AS `policyDate`,(`bpp`.`policy_invest` / 10000) AS `policyInvest`,`bpp`.`policy_code` AS `policyCode`,`cpt`.`type_name` AS `policyType`,date_format(`pbpp`.`policy_date`,'%Y-%m-%d') AS `signDate`,(case when (`pbfr`.`entity_status` = 'completed') then `pbfr`.`reply_code` else '立项批复未完成' end) AS `replyCode`,(case when (`pbfr`.`entity_status` = 'completed') then (`bfr`.`reply_invest` / 10000) else '立项批复未完成' end) AS `replyInvest`,(case when (`pbfr`.`entity_status` = 'completed') then date_format(`bfr`.`first_date`,'%Y-%m-%d') else '立项批复未完成' end) AS `firstCheckDate`,(case when (`pbfr`.`entity_status` = 'completed') then date_format(`pbfr`.`finish_date`,'%Y-%m-%d') else '立项批复未完成' end) AS `frFinishDate`,`cor`.`party_name` AS `projectConstructOrg`,(case when (`info`.`is_invitebid` = 1) then '计划部' when (`info`.`is_invitebid` = 0) then '建设管理单位' end) AS `constructOrg`,(case when (`pbda`.`entity_status` = 'completed') then `pbda`.`design_approval_num` else '设计批复未完成' end) AS `designApprovalNum`,(case when (`pbda`.`entity_status` = 'completed') then date_format(`pbda`.`design_reply_date`,'%Y-%m-%d') else '设计批复未完成' end) AS `deFinishDate`,(case when (`pbda`.`entity_status` = 'completed') then (`bda`.`design_invest` / 10000) else '设计批复未完成' end) AS `designInvest`,(case when (`pbda`.`entity_status` = 'completed') then date_format(`bda`.`first_check_date`,'%Y-%m-%d') else '设计批复未完成' end) AS `deFirstCheckDate`,ifnull((to_days(`bpp`.`policy_date`) - to_days(`pbpp`.`entity_create_date`)),'') AS `caDay)`,(case when (`pbfr`.`entity_status` = 'completed') then ((`bfr`.`reply_invest` - `bpp`.`policy_invest`) / 10000) else '立项批复未完成' end) AS `feCde`,(case when (`pbda`.`entity_status` = 'completed') then ((`bda`.`design_invest` - `bfr`.`reply_invest`) / 10000) else '设计批复未完成' end) AS `deFe`,date_format(`bps`.`entity_create_date`,'%Y-%m-%d') AS `qidianDate`,date_format(`bps`.`entity_create_date`,'%Y-%m-%d') AS `bianzhiDate`,date_format(`sch`.`plan_end_date`,'%Y-%m-%d') AS `xiadaDate`,date_format(`psch`.`plan_end_date`,'%Y-%m-%d') AS `sxiadaDate`,(case when (`info`.`is_feasibility` = 0) then '可研类' when (`info`.`is_feasibility` = 1) then '项目建议书类' end) AS `projectMoshi`,`cspe`.`party_name` AS `specialtyName`,(case when (`info`.`is_feasibility` = '0') then '否' when (`info`.`is_feasibility` = '1') then '是' end) AS `isFeasibility`,`aa1`.`atName` AS `jkAtName`,`aa2`.`atName` AS `jcJiYaoAtName`,(case when (`pbfr`.`entity_status` <> 'completed') then '立项批复未完成' else `aa3`.`aoAtName` end) AS `aoAtName`,(case when (`pbui`.`entity_status` <> 'completed') then '设计编制未完成' else `aa4`.`attName` end) AS `bianzhiAttr`,(case when (`paud`.`entity_status` <> 'completed') then '设计会审未完成' else `aa5`.`atName` end) AS `huiSenAtt`,(case when (`pbda`.`entity_status` <> 'completed') then '设计批复未完成' else `aa6`.`aoAtName` end) AS `dsOaAtName`,'' AS `zongtipinjia`,(case when (`sch2`.`entity_status` = 'completed') then '项目移交' else `cst3`.`type_name` end) AS `jinzhan` from (((((((((((((((((((((((((((((((`xmjdgl2018`.`b_project` `b` left join `xmjdgl2018`.`b_proj_info` `info` on((`info`.`id` = `b`.`proj_info_id`))) left join `xmjdgl2018`.`s_privilege_user` `spu` on((`info`.`manager_id` = `spu`.`id`))) left join `xmjdgl2018`.`b_project_policy` `bpp` on((`bpp`.`project_id` = `b`.`id`))) left join `xmjdgl2018`.`b_project_policy` `pbpp` on(((`pbpp`.`id` = `bpp`.`parent_id`) and (`pbpp`.`entity_status` = 'completed')))) left join `xmjdgl2018`.`c_policy_type` `cpt` on((`cpt`.`id` = `info`.`policy_type_id`))) left join `xmjdgl2018`.`b_fea_reply` `bfr` on((`bfr`.`project_id` = `b`.`id`))) left join `xmjdgl2018`.`b_fea_reply` `pbfr` on((`pbfr`.`id` = `bfr`.`parent_id`))) left join `xmjdgl2018`.`c_organization` `co` on((`co`.`id` = `info`.`construct_org_id`))) left join `xmjdgl2018`.`b_design_approval` `bda` on((`bda`.`project_id` = `b`.`id`))) left join `xmjdgl2018`.`b_design_approval` `pbda` on((`pbda`.`id` = `bda`.`parent_id`))) left join `xmjdgl2018`.`s_privilege_user` `aspu` on((`aspu`.`id` = `pbda`.`entity_creator_id`))) left join `xmjdgl2018`.`c_organization` `cor` on((`cor`.`id` = `info`.`managerorg_id`))) left join `xmjdgl2018`.`b_project_startup` `bps` on((`bps`.`project_id` = `b`.`id`))) left join `xmjdgl2018`.`b_project_detail` `det` on((`det`.`id` = `bps`.`proj_detail_id`))) left join `xmjdgl2018`.`b_schedule_unit` `unit` on((`unit`.`id` = `det`.`schedule_unit_id`))) left join `xmjdgl2018`.`b_schedule` `sch` on(((`sch`.`schedule_unit_id` = `unit`.`id`) and (`sch`.`schedule_type_id` = '14')))) left join `xmjdgl2018`.`b_schedule` `psch` on(((`psch`.`schedule_unit_id` = `unit`.`id`) and (`psch`.`schedule_type_id` = '20')))) left join `xmjdgl2018`.`c_specialty` `cspe` on((`cspe`.`id` = `info`.`spec_id`))) left join `xmjdgl2018`.`b_attachment_unit` `bsunit` on((`bsunit`.`id` = `b`.`attachment_unit_id`))) left join (select group_concat(`ba`.`attach_name`,';' separator ',') AS `atName`,`b`.`id` AS `id` from (((`xmjdgl2018`.`b_project` `b` left join `xmjdgl2018`.`b_attachment` `ba` on((`ba`.`attachment_unit_id` = `b`.`attachment_unit_id`))) left join `xmjdgl2018`.`c_attchment_type` `cat` on((`cat`.`id` = `ba`.`attachment_type_id`))) left join `xmjdgl2018`.`c_attchment_stage` `cas` on((`cas`.`id` = `cat`.`attachment_stage_id`))) where ((`cat`.`type_name` = '项目建议书') or (`cat`.`type_name` = '会审纪要') or (`cas`.`type_name` = '需求提交') or (`cas`.`type_name` = '可研会审')) group by `b`.`id`) `aa1` on((`aa1`.`id` = `b`.`id`))) left join (select group_concat(`ba`.`attach_name`,';' separator ',') AS `atName`,`b`.`id` AS `id` from (((`xmjdgl2018`.`b_project` `b` left join `xmjdgl2018`.`b_attachment` `ba` on((`ba`.`attachment_unit_id` = `b`.`attachment_unit_id`))) left join `xmjdgl2018`.`c_attchment_type` `cat` on((`cat`.`id` = `ba`.`attachment_type_id`))) left join `xmjdgl2018`.`c_attchment_stage` `cas` on((`cas`.`id` = `cat`.`attachment_stage_id`))) where ((`cat`.`type_name` = '决策纪要文件') and (`cas`.`type_name` = '立项决策')) group by `b`.`id`) `aa2` on((`aa2`.`id` = `b`.`id`))) left join (select group_concat(`ba`.`attach_name`,';' separator ',') AS `aoAtName`,`bf`.`id` AS `id` from ((`xmjdgl2018`.`b_fea_reply` `bf` left join `xmjdgl2018`.`if_oa_appy` `oa` on(((`oa`.`business_Id` = `bf`.`id`) and (`oa`.`business_Name` = 'FeaReply')))) left join `xmjdgl2018`.`b_attachment` `ba` on((`ba`.`attachment_unit_id` = `oa`.`attachment_unit_id`))) group by `bf`.`id`) `aa3` on((`aa3`.`id` = `pbfr`.`id`))) left join `xmjdgl2018`.`b_design_build` `bui` on((`bui`.`project_id` = `b`.`id`))) left join `xmjdgl2018`.`b_design_build` `pbui` on((`pbui`.`id` = `bui`.`parent_id`))) left join (select group_concat(`ba`.`attach_name`,';' separator ',') AS `attName`,`b`.`id` AS `id` from (((`xmjdgl2018`.`b_project` `b` left join `xmjdgl2018`.`b_attachment` `ba` on((`ba`.`attachment_unit_id` = `b`.`attachment_unit_id`))) left join `xmjdgl2018`.`c_attchment_type` `cat` on((`cat`.`id` = `ba`.`attachment_type_id`))) left join `xmjdgl2018`.`c_attchment_stage` `cas` on((`cas`.`id` = `cat`.`attachment_stage_id`))) where (`cas`.`type_name` = '设计编制') group by `b`.`id`) `aa4` on((`aa4`.`id` = `b`.`id`))) left join `xmjdgl2018`.`b_design_audit` `aud` on((`aud`.`project_id` = `aud`.`id`))) left join `xmjdgl2018`.`b_design_audit` `paud` on((`paud`.`id` = `aud`.`parent_id`))) left join (select group_concat(`ba`.`attach_name`,';' separator ',') AS `atName`,`b`.`id` AS `id` from (((`xmjdgl2018`.`b_project` `b` left join `xmjdgl2018`.`b_attachment` `ba` on((`ba`.`attachment_unit_id` = `b`.`attachment_unit_id`))) left join `xmjdgl2018`.`c_attchment_type` `cat` on((`cat`.`id` = `ba`.`attachment_type_id`))) left join `xmjdgl2018`.`c_attchment_stage` `cas` on((`cas`.`id` = `cat`.`attachment_stage_id`))) where ((`cat`.`type_name` = '会审纪要') and (`cas`.`type_name` = '设计会审')) group by `b`.`id`) `aa5` on((`aa5`.`id` = `b`.`id`))) left join (select group_concat(`ba`.`attach_name`,';' separator ',') AS `aoAtName`,`bf`.`id` AS `id` from ((`xmjdgl2018`.`b_fea_reply` `bf` left join `xmjdgl2018`.`if_oa_appy` `oa` on(((`oa`.`business_Id` = `bf`.`id`) and (`oa`.`business_Name` = 'FeaReply')))) left join `xmjdgl2018`.`b_attachment` `ba` on((`ba`.`attachment_unit_id` = `oa`.`attachment_unit_id`))) group by `bf`.`id`) `aa6` on((`aa6`.`id` = `pbda`.`id`))) left join `xmjdgl2018`.`b_schedule` `sch2` on(((`sch2`.`schedule_unit_id` = `b`.`schedule_unit_id`) and (`sch2`.`schedule_type_id` = 18)))) left join `xmjdgl2018`.`c_schedule_type` `cst3` on((`cst3`.`id` = `b`.`schedule_point_id`))) where ((1 = 1) and ((`b`.`entity_status` = 'completed') or (`b`.`entity_status` = 'startup'))) order by `b`.`id` desc;

-- ----------------------------
-- View structure for v_construct_contractorder
-- ----------------------------
DROP VIEW IF EXISTS `v_construct_contractorder`;
CREATE ALGORITHM = UNDEFINED DEFINER = `epms_cq`@`%` SQL SECURITY DEFINER VIEW `v_construct_contractorder` AS select `obj`.`id` AS `orderId`,`iol`.`CONTRACT_NUM` AS `contractNum`,`iol`.`CONTRACT_NAME` AS `contractName`,`obj`.`SEGMENT1` AS `orderNum`,`obj`.`DESCRIPTION` AS `description`,`obj`.`AMOUNT` AS `amonut`,`obj`.`AUTHORIZATION_STATUS` AS `aStatus`,`bao`.`audit_money` AS `auditMoney`,`obj`.`VENDOR_NAME` AS `vendorName`,'' AS `invoicedAmount`,`icd`.`AMOUNT` AS `reimburseAmount`,'' AS `payAmount` from ((((`if_order_header` `obj` left join `if_order_line` `iol` on((`iol`.`PO_HEADER_ID` = `obj`.`id`))) left join `b_order` `bo` on((`bo`.`order_code` = `obj`.`SEGMENT1`))) left join `b_audit_order` `bao` on((`bao`.`order_id` = `bo`.`id`))) left join `if_claim_line` `icd` on((`icd`.`CONTRACT_NUM` = `iol`.`CONTRACT_NUM`))) order by `obj`.`id`;

-- ----------------------------
-- View structure for v_purchase_listreport
-- ----------------------------
DROP VIEW IF EXISTS `v_purchase_listreport`;
CREATE ALGORITHM = UNDEFINED DEFINER = `epms_cq`@`%` SQL SECURITY DEFINER VIEW `v_purchase_listreport` AS select `obj`.`id` AS `id`,`obj`.`entity_code` AS `code`,`obj`.`entity_desc` AS `description`,`cmt`.`type_name` AS `typeName`,`cct`.`type_name` AS `capitalName`,`cpt`.`type_name` AS `requirName`,`obj`.`suPurWayName` AS `suPurWayName`,date_format(`obj`.`entity_create_date`,'%Y-%m-%d') AS `createDate`,group_concat(`bp`.`entity_name`,',' separator ',') AS `projectName`,`co`.`party_name` AS `orgName` from (((((((`b_purchase_submit` `obj` left join `c_material_type` `cmt` on((`cmt`.`id` = `obj`.`materialType_id`))) left join `c_capital_type` `cct` on((`cct`.`id` = `obj`.`capital_type_id`))) left join `c_purchaserequire_type` `cpt` on((`cpt`.`id` = `obj`.`purchaseRequireType_id`))) left join `b_purshasesubmit_project` `bpp` on((`bpp`.`purchaseSubmit_id` = `obj`.`id`))) left join `b_project` `bp` on((`bp`.`id` = `bpp`.`project_id`))) left join `s_privilege_user` `spu` on((`spu`.`id` = `obj`.`entity_creator_id`))) left join `c_organization` `co` on((`co`.`id` = `spu`.`Construct_Unit_id`))) group by `obj`.`id`;

-- ----------------------------
-- View structure for v_user_login
-- ----------------------------
DROP VIEW IF EXISTS `v_user_login`;
CREATE ALGORITHM = UNDEFINED DEFINER = `epms_cq`@`%` SQL SECURITY DEFINER VIEW `v_user_login` AS select `t`.`client_ip` AS `client_ip`,`t`.`mac` AS `mac`,`t`.`user_account` AS `user_account`,`t`.`user_name` AS `user_name`,`o`.`party_name` AS `deptname`,`t`.`requested_datetime` AS `requested_datetime` from ((`s_audit_entry` `t` left join `s_privilege_user` `u` on((`t`.`user_id` = `u`.`id`))) left join `c_organization` `o` on((`o`.`id` = `u`.`department_id`))) where (`t`.`login_type` is not null);

-- ----------------------------
-- View structure for v_wf_audit_info
-- ----------------------------
DROP VIEW IF EXISTS `v_wf_audit_info`;
CREATE ALGORITHM = UNDEFINED DEFINER = `epms_cq`@`%` SQL SECURITY DEFINER VIEW `v_wf_audit_info` AS select `f`.`name` AS `wfName`,`u`.`login_name` AS `loginName`,`u`.`party_name` AS `userName`,`o`.`party_name` AS `deptname`,`t`.`begin_time` AS `beginTime`,`t`.`end_time` AS `endTime`,timestampdiff(MINUTE,`wt`.`beginTime`,`wt`.`endTime`) AS `auditPeriod` from (((((`b_wf_task` `t` left join `w_task` `wt` on((`wt`.`taskid` = `t`.`task_id`))) left join `w_instance` `i` on((`i`.`instanceid` = `wt`.`instance_id`))) left join `w_workflow` `f` on((`f`.`workflowid` = `i`.`workflowid`))) left join `s_privilege_user` `u` on((`t`.`user_id` = `u`.`id`))) left join `c_organization` `o` on((`o`.`id` = `u`.`department_id`))) where (`t`.`task_show` = 1) order by `t`.`wf_act_id`,`t`.`begin_time`;

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100408
 Source Host           : localhost:3306
 Source Schema         : project_skripsi_cbtapp

 Target Server Type    : MySQL
 Target Server Version : 100408
 File Encoding         : 65001

 Date: 24/04/2021 20:15:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cbt_jawaban
-- ----------------------------
DROP TABLE IF EXISTS `cbt_jawaban`;
CREATE TABLE `cbt_jawaban`  (
  `jawaban_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `jawaban_soal_id` bigint(20) UNSIGNED NOT NULL,
  `jawaban_detail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `jawaban_benar` tinyint(1) NOT NULL DEFAULT 0,
  `jawaban_aktif` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`jawaban_id`) USING BTREE,
  INDEX `p_answer_question_id`(`jawaban_soal_id`) USING BTREE,
  CONSTRAINT `cbt_jawaban_ibfk_1` FOREIGN KEY (`jawaban_soal_id`) REFERENCES `cbt_soal` (`soal_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 627 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cbt_konfigurasi
-- ----------------------------
DROP TABLE IF EXISTS `cbt_konfigurasi`;
CREATE TABLE `cbt_konfigurasi`  (
  `konfigurasi_id` int(11) NOT NULL AUTO_INCREMENT,
  `konfigurasi_kode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `konfigurasi_isi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `konfigurasi_keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`konfigurasi_id`) USING BTREE,
  UNIQUE INDEX `konfigurasi_kode`(`konfigurasi_kode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_konfigurasi
-- ----------------------------
INSERT INTO `cbt_konfigurasi` VALUES (1, 'link_login_operator', 'ya', 'Menampilkan Link Login Operator');
INSERT INTO `cbt_konfigurasi` VALUES (2, 'cbt_nama', 'Ujian Online', 'Nama Penyelenggara');
INSERT INTO `cbt_konfigurasi` VALUES (3, 'cbt_keterangan', 'Ujian Online Berbasis Komputer', 'Keterangan Penyelenggara');
INSERT INTO `cbt_konfigurasi` VALUES (4, 'cbt_mobile_lock_xambro', 'tidak', 'Melakukan Lock pada browser mobile agar menggunakan Xambro Saja');

-- ----------------------------
-- Table structure for cbt_modul
-- ----------------------------
DROP TABLE IF EXISTS `cbt_modul`;
CREATE TABLE `cbt_modul`  (
  `modul_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `modul_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `modul_aktif` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`modul_id`) USING BTREE,
  UNIQUE INDEX `ak_module_name`(`modul_nama`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_modul
-- ----------------------------
INSERT INTO `cbt_modul` VALUES (9, 'Default', 1);

-- ----------------------------
-- Table structure for cbt_sessions
-- ----------------------------
DROP TABLE IF EXISTS `cbt_sessions`;
CREATE TABLE `cbt_sessions`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  INDEX `ci_sessions_timestamp`(`timestamp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_sessions
-- ----------------------------
INSERT INTO `cbt_sessions` VALUES ('s52l0l3cedrpqkdlos26kvhuin479v2l', '::1', 1619059450, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393035393435303B6362745F7573657269647C733A313A2236223B7C4E3B6362745F757365725F69647C733A383A227461727576697461223B6362745F6E616D617C733A383A227461727576697461223B6362745F6C6576656C7C733A343A2247757275223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B);
INSERT INTO `cbt_sessions` VALUES ('u78kl1acio5uit0rstq3me76ep5pk9u9', '::1', 1619059312, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393035393331323B6362745F7573657269647C733A313A2231223B7C4E3B6362745F7465735F757365725F69647C733A343A226A6F6B6F223B6362745F7465735F6E616D617C733A31323A224A6F6B6F20537573616E746F223B6362745F7465735F67726F75707C733A393A22584949204950412033223B6362745F7465735F67726F75705F69647C733A313A2236223B);
INSERT INTO `cbt_sessions` VALUES ('bfucj7uh92ip3o84obs46grgk4jtsk0h', '::1', 1619059641, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393035393634313B6362745F7573657269647C733A313A2231223B7C4E3B6362745F7465735F757365725F69647C733A343A226A6F6B6F223B6362745F7465735F6E616D617C733A31323A224A6F6B6F20537573616E746F223B6362745F7465735F67726F75707C733A393A22584949204950412033223B6362745F7465735F67726F75705F69647C733A313A2236223B);
INSERT INTO `cbt_sessions` VALUES ('f10gr1pf2r6imlvrnsddlrd02k8bu4fp', '::1', 1619059756, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393035393735363B6362745F7573657269647C733A313A2236223B7C4E3B6362745F757365725F69647C733A383A227461727576697461223B6362745F6E616D617C733A383A227461727576697461223B6362745F6C6576656C7C733A343A2247757275223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B);
INSERT INTO `cbt_sessions` VALUES ('aisnd35o1ba1431b0us2fdb2p2rb03li', '::1', 1619059793, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393035393634313B6362745F7573657269647C733A313A2231223B7C4E3B6362745F7465735F757365725F69647C733A353A226C75746669223B6362745F7465735F6E616D617C733A32323A224D7568616D6D6164204C75746669616C2048616B696D223B6362745F7465735F67726F75707C733A393A22584949204950412033223B6362745F7465735F67726F75705F69647C733A313A2236223B);
INSERT INTO `cbt_sessions` VALUES ('62vn0sop1pkuiu9cj2lltk4tg7j0bhgt', '::1', 1619060127, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393036303132373B6362745F7573657269647C733A313A2236223B7C4E3B6362745F757365725F69647C733A383A227461727576697461223B6362745F6E616D617C733A383A227461727576697461223B6362745F6C6576656C7C733A343A2247757275223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B);
INSERT INTO `cbt_sessions` VALUES ('34ev4rav54ohhm2i7pk7524rmcskuman', '::1', 1619060547, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393036303534373B6362745F7573657269647C733A313A2236223B7C4E3B6362745F757365725F69647C733A383A227461727576697461223B6362745F6E616D617C733A383A227461727576697461223B6362745F6C6576656C7C733A343A2247757275223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B);
INSERT INTO `cbt_sessions` VALUES ('c4se3vpstern5cumtqf8p6uooovi6rth', '::1', 1619060852, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393036303835323B6362745F7573657269647C733A313A2236223B7C4E3B6362745F757365725F69647C733A383A227461727576697461223B6362745F6E616D617C733A383A227461727576697461223B6362745F6C6576656C7C733A343A2247757275223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B);
INSERT INTO `cbt_sessions` VALUES ('da7ul5l3irqu3lc6ohttk66a4l3fogha', '::1', 1619062919, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393036323931393B6362745F7573657269647C733A313A2236223B7C4E3B6362745F757365725F69647C733A383A227461727576697461223B6362745F6E616D617C733A383A227461727576697461223B6362745F6C6576656C7C733A343A2247757275223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B);
INSERT INTO `cbt_sessions` VALUES ('7k93t3p3hdrtq2dvo99dkleimccst87p', '::1', 1619063374, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393036333337343B6362745F7573657269647C733A313A2236223B7C4E3B6362745F757365725F69647C733A383A227461727576697461223B6362745F6E616D617C733A383A227461727576697461223B6362745F6C6576656C7C733A343A2247757275223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B);
INSERT INTO `cbt_sessions` VALUES ('nudnjheo4jktksumghep0jiqq9uk62fo', '::1', 1619063685, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393036333638353B6362745F7573657269647C733A313A2236223B7C4E3B6362745F757365725F69647C733A383A227461727576697461223B6362745F6E616D617C733A383A227461727576697461223B6362745F6C6576656C7C733A343A2247757275223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B);
INSERT INTO `cbt_sessions` VALUES ('5im1h82bemujdv3eb6d1bf2v2sv6btmi', '::1', 1619064401, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393036343430313B6362745F7573657269647C733A313A2236223B7C4E3B6362745F757365725F69647C733A383A227461727576697461223B6362745F6E616D617C733A383A227461727576697461223B6362745F6C6576656C7C733A343A2247757275223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B);
INSERT INTO `cbt_sessions` VALUES ('d1dujanvm8989t5pp18be252h5f8ls3v', '::1', 1619064771, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393036343430313B6362745F7573657269647C733A313A2236223B7C4E3B6362745F757365725F69647C733A383A227461727576697461223B6362745F6E616D617C733A383A227461727576697461223B6362745F6C6576656C7C733A343A2247757275223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B);
INSERT INTO `cbt_sessions` VALUES ('dgbarvtt04bn8a5fqd5k86e3kvfqrqat', '::1', 1619147171, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393134373137313B6362745F7573657269647C733A313A2236223B6362745F757365725F69647C733A383A227461727576697461223B6362745F6E616D617C733A383A227461727576697461223B6362745F6C6576656C7C733A343A2247757275223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B7C4E3B);
INSERT INTO `cbt_sessions` VALUES ('alm9v2pl1ugvjnmo366k3pin3grgmg0b', '::1', 1619147678, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393134373637383B6362745F7573657269647C733A313A2236223B6362745F757365725F69647C733A383A227461727576697461223B6362745F6E616D617C733A383A227461727576697461223B6362745F6C6576656C7C733A343A2247757275223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B7C4E3B);
INSERT INTO `cbt_sessions` VALUES ('phii22338o1432cklfvf82i76g5hrbvv', '::1', 1619148124, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393134383132343B6362745F7573657269647C733A313A2236223B6362745F757365725F69647C733A383A227461727576697461223B6362745F6E616D617C733A383A227461727576697461223B6362745F6C6576656C7C733A343A2247757275223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B7C4E3B);
INSERT INTO `cbt_sessions` VALUES ('rv0f6qvibdd66od5e9nngj7t3h7i5ep6', '::1', 1619147938, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393134373834353B6362745F7465735F757365725F69647C733A353A226C75746669223B6362745F7465735F6E616D617C733A32323A224D7568616D6D6164204C75746669616C2048616B696D223B6362745F7465735F67726F75707C733A393A22584949204950412033223B6362745F7465735F67726F75705F69647C733A313A2236223B);
INSERT INTO `cbt_sessions` VALUES ('d6g8i8o9i2a7bue8bo1mmm3q8mugmnuv', '::1', 1619148438, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393134383433383B6362745F7573657269647C733A313A2236223B6362745F757365725F69647C733A383A227461727576697461223B6362745F6E616D617C733A383A227461727576697461223B6362745F6C6576656C7C733A343A2247757275223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B7C4E3B);
INSERT INTO `cbt_sessions` VALUES ('k6lv32fb4fdq6ppn907tmgsvcjh0f2hg', '::1', 1619150086, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393135303038363B6362745F7573657269647C733A313A2236223B6362745F757365725F69647C733A383A227461727576697461223B6362745F6E616D617C733A383A227461727576697461223B6362745F6C6576656C7C733A343A2247757275223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B7C4E3B);
INSERT INTO `cbt_sessions` VALUES ('dp434cfp95m7gi16265656emtblr7rm6', '::1', 1619150356, 0x5F5F63695F6C6173745F726567656E65726174657C693A313631393135303038363B6362745F7573657269647C733A313A2236223B6362745F757365725F69647C733A383A227461727576697461223B6362745F6E616D617C733A383A227461727576697461223B6362745F6C6576656C7C733A343A2247757275223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B7C4E3B);

-- ----------------------------
-- Table structure for cbt_soal
-- ----------------------------
DROP TABLE IF EXISTS `cbt_soal`;
CREATE TABLE `cbt_soal`  (
  `soal_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `soal_topik_id` bigint(20) UNSIGNED NOT NULL,
  `soal_detail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `soal_tipe` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Pilihan ganda, 2=essay, 3=jawaban singkat',
  `soal_kunci` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT 'Kunci untuk soal jawaban singkat',
  `soal_difficulty` smallint(6) NOT NULL DEFAULT 1,
  `soal_aktif` tinyint(1) NOT NULL DEFAULT 0,
  `soal_audio` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `soal_audio_play` int(11) NOT NULL DEFAULT 0,
  `soal_timer` smallint(10) NULL DEFAULT NULL,
  `soal_inline_answers` tinyint(1) NOT NULL DEFAULT 0,
  `soal_auto_next` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`soal_id`) USING BTREE,
  INDEX `p_question_subject_id`(`soal_topik_id`) USING BTREE,
  CONSTRAINT `cbt_soal_ibfk_1` FOREIGN KEY (`soal_topik_id`) REFERENCES `cbt_topik` (`topik_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 244 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_soal
-- ----------------------------
INSERT INTO `cbt_soal` VALUES (240, 20, '<p>jelaskan pengertian megalitikum</p>\r\n', 2, 'megalitikum adalah', 1, 1, NULL, 0, NULL, 0, 0);
INSERT INTO `cbt_soal` VALUES (241, 20, '<p>apa itu sejarah</p>\r\n', 2, 'apa itu sejarah', 1, 1, NULL, 0, NULL, 0, 0);
INSERT INTO `cbt_soal` VALUES (242, 21, '<p>Bahasa Indonesia</p>\r\n', 2, 'sejarah indonesia', 1, 1, NULL, 0, NULL, 0, 0);
INSERT INTO `cbt_soal` VALUES (243, 21, '<p>Bahasa Indonesia mobil</p>\r\n', 2, 'Bahasa Indonesia mobil', 1, 1, NULL, 0, NULL, 0, 0);

-- ----------------------------
-- Table structure for cbt_tes
-- ----------------------------
DROP TABLE IF EXISTS `cbt_tes`;
CREATE TABLE `cbt_tes`  (
  `tes_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tes_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tes_detail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tes_begin_time` datetime(0) NULL DEFAULT NULL,
  `tes_end_time` datetime(0) NULL DEFAULT NULL,
  `tes_duration_time` smallint(10) UNSIGNED NOT NULL DEFAULT 0,
  `tes_ip_range` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '*.*.*.*',
  `tes_results_to_users` tinyint(1) NOT NULL DEFAULT 0,
  `tes_detail_to_users` tinyint(1) NOT NULL DEFAULT 0,
  `tes_score_right` decimal(10, 2) NULL DEFAULT 1,
  `tes_score_wrong` decimal(10, 2) NULL DEFAULT 0,
  `tes_score_unanswered` decimal(10, 2) NULL DEFAULT 0,
  `tes_max_score` decimal(10, 2) NOT NULL DEFAULT 0,
  `tes_token` tinyint(1) NULL DEFAULT 0,
  `tes_create_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`tes_id`) USING BTREE,
  UNIQUE INDEX `ak_test_name`(`tes_nama`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_tes
-- ----------------------------
INSERT INTO `cbt_tes` VALUES (26, 'Ujian Sejarah', 'Ujian Sejarah', '2021-04-22 09:36:00', '2021-04-30 09:36:00', 30, '*.*.*.*', 1, 0, 20.00, 0.00, 0.00, 20.00, 0, 6);
INSERT INTO `cbt_tes` VALUES (27, 'Ujian IPS', 'Ujian IPS', '2021-04-22 09:44:00', '2021-04-23 09:44:00', 50, '*.*.*.*', 1, 0, 50.00, 0.00, 0.00, 50.00, 0, 6);
INSERT INTO `cbt_tes` VALUES (28, 'Bahasa Indonesia', 'Bahasa Indonesia', '2021-04-22 10:50:00', '2021-04-23 10:50:00', 30, '*.*.*.*', 1, 0, 100.00, 0.00, 0.00, 100.00, 0, 6);
INSERT INTO `cbt_tes` VALUES (29, 'Ujian Bahasa Indonesia', 'BI', '2021-04-23 10:16:00', '2021-04-24 10:16:00', 60, '*.*.*.*', 1, 0, 20.00, 0.00, 0.00, 40.00, 0, 6);

-- ----------------------------
-- Table structure for cbt_tes_soal
-- ----------------------------
DROP TABLE IF EXISTS `cbt_tes_soal`;
CREATE TABLE `cbt_tes_soal`  (
  `tessoal_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tessoal_tesuser_id` bigint(20) UNSIGNED NOT NULL,
  `tessoal_user_ip` varchar(39) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `tessoal_soal_id` bigint(20) UNSIGNED NOT NULL,
  `tessoal_jawaban_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `tessoal_nilai` decimal(10, 2) NULL DEFAULT NULL,
  `tessoal_human_point` decimal(10, 2) NULL DEFAULT NULL,
  `tessoal_creation_time` datetime(0) NULL DEFAULT NULL,
  `tessoal_display_time` datetime(0) NULL DEFAULT NULL,
  `tessoal_change_time` datetime(0) NULL DEFAULT NULL,
  `tessoal_reaction_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `tessoal_ragu` int(1) NOT NULL DEFAULT 0 COMMENT '1=ragu, 0=tidak ragu',
  `tessoal_order` smallint(6) NOT NULL DEFAULT 1,
  `tessoal_num_answers` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `tessoal_comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `tessoal_audio_play` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tessoal_id`) USING BTREE,
  UNIQUE INDEX `ak_testuser_question`(`tessoal_tesuser_id`, `tessoal_soal_id`) USING BTREE,
  INDEX `p_testlog_question_id`(`tessoal_soal_id`) USING BTREE,
  INDEX `p_testlog_testuser_id`(`tessoal_tesuser_id`) USING BTREE,
  CONSTRAINT `cbt_tes_soal_ibfk_1` FOREIGN KEY (`tessoal_tesuser_id`) REFERENCES `cbt_tes_user` (`tesuser_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cbt_tes_soal_ibfk_2` FOREIGN KEY (`tessoal_soal_id`) REFERENCES `cbt_soal` (`soal_id`) ON DELETE RESTRICT ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_tes_soal
-- ----------------------------
INSERT INTO `cbt_tes_soal` VALUES (94, 46, NULL, 240, 'megalitikum adalah', 1.00, 100.00, '2021-04-22 09:38:45', '2021-04-22 09:43:17', '2021-04-22 09:43:25', 0, 0, 1, 0, 'Sudah di koreksi taruvita', 0);
INSERT INTO `cbt_tes_soal` VALUES (95, 47, NULL, 240, 'megalitikum merupakan', 1.00, 100.00, '2021-04-22 09:44:38', '2021-04-22 09:44:38', '2021-04-22 09:44:46', 0, 0, 1, 0, 'Sudah di koreksi taruvita', 0);
INSERT INTO `cbt_tes_soal` VALUES (96, 48, NULL, 240, 'pitecantropus', 0.00, 0.00, '2021-04-22 09:48:17', '2021-04-22 09:48:17', '2021-04-22 09:48:29', 0, 0, 1, 0, 'Sudah di koreksi taruvita', 0);
INSERT INTO `cbt_tes_soal` VALUES (97, 49, NULL, 240, 'pitecantropus erectus', 0.00, 0.00, '2021-04-22 09:48:38', '2021-04-22 09:48:38', '2021-04-22 09:48:44', 0, 0, 1, 0, 'Sudah di koreksi taruvita', 0);
INSERT INTO `cbt_tes_soal` VALUES (98, 50, NULL, 242, 'Bahasa Indonesia adalah suatu bahasa yang dimilki oleh negara Indonesia', 0.71, 80.00, '2021-04-23 10:17:40', '2021-04-23 10:17:40', '2021-04-23 10:18:00', 0, 0, 1, 0, 'Sudah di koreksi taruvita', 0);
INSERT INTO `cbt_tes_soal` VALUES (99, 50, NULL, 243, 'Bahasa Indonesia mobil', 1.00, 100.00, '2021-04-23 10:17:40', '2021-04-23 10:18:02', '2021-04-23 10:18:15', 0, 0, 2, 0, 'Sudah di koreksi taruvita', 0);
INSERT INTO `cbt_tes_soal` VALUES (100, 51, NULL, 242, 'Bahasa Indonesia adalah', 0.71, 80.00, '2021-04-23 10:18:33', '2021-04-23 10:18:34', '2021-04-23 10:18:42', 0, 0, 1, 0, 'Sudah di koreksi taruvita', 0);
INSERT INTO `cbt_tes_soal` VALUES (101, 51, NULL, 243, 'Bahasa Indonesia mobil', 1.00, 100.00, '2021-04-23 10:18:33', '2021-04-23 10:18:46', '2021-04-23 10:18:53', 0, 0, 2, 0, 'Sudah di koreksi taruvita', 0);

-- ----------------------------
-- Table structure for cbt_tes_soal_jawaban
-- ----------------------------
DROP TABLE IF EXISTS `cbt_tes_soal_jawaban`;
CREATE TABLE `cbt_tes_soal_jawaban`  (
  `soaljawaban_tessoal_id` bigint(20) UNSIGNED NOT NULL,
  `soaljawaban_jawaban_id` bigint(20) UNSIGNED NOT NULL,
  `soaljawaban_selected` smallint(6) NOT NULL DEFAULT -1,
  `soaljawaban_order` smallint(6) NOT NULL DEFAULT 1,
  `soaljawaban_position` bigint(20) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`soaljawaban_tessoal_id`, `soaljawaban_jawaban_id`) USING BTREE,
  INDEX `p_logansw_answer_id`(`soaljawaban_jawaban_id`) USING BTREE,
  INDEX `p_logansw_testlog_id`(`soaljawaban_tessoal_id`) USING BTREE,
  CONSTRAINT `cbt_tes_soal_jawaban_ibfk_1` FOREIGN KEY (`soaljawaban_tessoal_id`) REFERENCES `cbt_tes_soal` (`tessoal_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cbt_tes_soal_jawaban_ibfk_2` FOREIGN KEY (`soaljawaban_jawaban_id`) REFERENCES `cbt_jawaban` (`jawaban_id`) ON DELETE RESTRICT ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cbt_tes_token
-- ----------------------------
DROP TABLE IF EXISTS `cbt_tes_token`;
CREATE TABLE `cbt_tes_token`  (
  `token_id` int(11) NOT NULL AUTO_INCREMENT,
  `token_isi` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `token_user_id` int(11) NOT NULL,
  `token_ts` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `token_aktif` int(11) NOT NULL DEFAULT 1 COMMENT 'Umur Token dalam menit, 1 = 1 hari penuh',
  `token_tes_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`token_id`) USING BTREE,
  INDEX `token_user_id`(`token_user_id`) USING BTREE,
  CONSTRAINT `cbt_tes_token_ibfk_1` FOREIGN KEY (`token_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_tes_token
-- ----------------------------
INSERT INTO `cbt_tes_token` VALUES (25, '581FB2', 1, '2021-01-20 16:24:21', 1, 0);
INSERT INTO `cbt_tes_token` VALUES (26, '7ABCC9', 1, '2021-01-20 16:41:11', 1, 6);

-- ----------------------------
-- Table structure for cbt_tes_topik_set
-- ----------------------------
DROP TABLE IF EXISTS `cbt_tes_topik_set`;
CREATE TABLE `cbt_tes_topik_set`  (
  `tset_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tset_tes_id` bigint(20) UNSIGNED NOT NULL,
  `tset_topik_id` bigint(20) UNSIGNED NOT NULL,
  `tset_tipe` smallint(6) NOT NULL DEFAULT 1,
  `tset_difficulty` smallint(6) NOT NULL DEFAULT 1,
  `tset_jumlah` smallint(6) NOT NULL DEFAULT 1,
  `tset_jawaban` smallint(6) NOT NULL DEFAULT 0,
  `tset_acak_jawaban` int(11) NOT NULL DEFAULT 1,
  `tset_acak_soal` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`tset_id`) USING BTREE,
  INDEX `p_tsubset_test_id`(`tset_tes_id`) USING BTREE,
  INDEX `tsubset_subject_id`(`tset_topik_id`) USING BTREE,
  CONSTRAINT `cbt_tes_topik_set_ibfk_1` FOREIGN KEY (`tset_tes_id`) REFERENCES `cbt_tes` (`tes_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cbt_tes_topik_set_ibfk_2` FOREIGN KEY (`tset_topik_id`) REFERENCES `cbt_topik` (`topik_id`) ON DELETE RESTRICT ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_tes_topik_set
-- ----------------------------
INSERT INTO `cbt_tes_topik_set` VALUES (24, 26, 20, 2, 1, 1, 2, 1, 1);
INSERT INTO `cbt_tes_topik_set` VALUES (25, 27, 20, 2, 1, 1, 2, 1, 1);
INSERT INTO `cbt_tes_topik_set` VALUES (26, 28, 21, 2, 1, 1, 2, 1, 1);
INSERT INTO `cbt_tes_topik_set` VALUES (27, 29, 21, 2, 1, 2, 2, 1, 1);

-- ----------------------------
-- Table structure for cbt_tes_user
-- ----------------------------
DROP TABLE IF EXISTS `cbt_tes_user`;
CREATE TABLE `cbt_tes_user`  (
  `tesuser_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tesuser_tes_id` bigint(20) UNSIGNED NOT NULL,
  `tesuser_user_id` bigint(20) UNSIGNED NOT NULL,
  `tesuser_status` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `tesuser_creation_time` datetime(0) NOT NULL,
  `tesuser_comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `tesuser_token` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tesuser_id`) USING BTREE,
  UNIQUE INDEX `ak_testuser`(`tesuser_tes_id`, `tesuser_user_id`, `tesuser_status`) USING BTREE,
  INDEX `p_testuser_user_id`(`tesuser_user_id`) USING BTREE,
  INDEX `p_testuser_test_id`(`tesuser_tes_id`) USING BTREE,
  CONSTRAINT `cbt_tes_user_ibfk_1` FOREIGN KEY (`tesuser_tes_id`) REFERENCES `cbt_tes` (`tes_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cbt_tes_user_ibfk_2` FOREIGN KEY (`tesuser_user_id`) REFERENCES `cbt_user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_tes_user
-- ----------------------------
INSERT INTO `cbt_tes_user` VALUES (46, 26, 2, 4, '2021-04-22 09:38:45', NULL, NULL);
INSERT INTO `cbt_tes_user` VALUES (47, 27, 2, 4, '2021-04-22 09:44:38', NULL, NULL);
INSERT INTO `cbt_tes_user` VALUES (48, 26, 1, 4, '2021-04-22 09:48:17', NULL, NULL);
INSERT INTO `cbt_tes_user` VALUES (49, 27, 1, 4, '2021-04-22 09:48:38', NULL, NULL);
INSERT INTO `cbt_tes_user` VALUES (50, 29, 2, 4, '2021-04-23 10:17:40', NULL, NULL);
INSERT INTO `cbt_tes_user` VALUES (51, 29, 1, 4, '2021-04-23 10:18:33', NULL, NULL);

-- ----------------------------
-- Table structure for cbt_tesgrup
-- ----------------------------
DROP TABLE IF EXISTS `cbt_tesgrup`;
CREATE TABLE `cbt_tesgrup`  (
  `tstgrp_tes_id` bigint(20) UNSIGNED NOT NULL,
  `tstgrp_grup_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`tstgrp_tes_id`, `tstgrp_grup_id`) USING BTREE,
  INDEX `p_tstgrp_test_id`(`tstgrp_tes_id`) USING BTREE,
  INDEX `p_tstgrp_group_id`(`tstgrp_grup_id`) USING BTREE,
  CONSTRAINT `cbt_tesgrup_ibfk_1` FOREIGN KEY (`tstgrp_tes_id`) REFERENCES `cbt_tes` (`tes_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cbt_tesgrup_ibfk_2` FOREIGN KEY (`tstgrp_grup_id`) REFERENCES `cbt_user_grup` (`grup_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_tesgrup
-- ----------------------------
INSERT INTO `cbt_tesgrup` VALUES (26, 6);
INSERT INTO `cbt_tesgrup` VALUES (27, 6);
INSERT INTO `cbt_tesgrup` VALUES (28, 6);
INSERT INTO `cbt_tesgrup` VALUES (29, 6);

-- ----------------------------
-- Table structure for cbt_text_mining
-- ----------------------------
DROP TABLE IF EXISTS `cbt_text_mining`;
CREATE TABLE `cbt_text_mining`  (
  `tm_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tm_tessoal_id` bigint(20) UNSIGNED NOT NULL,
  `tm_soal_id` bigint(20) NOT NULL,
  `tm_answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `tm_is_key` tinyint(2) NULL DEFAULT NULL,
  `tm_case_folding` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `tm_tokenization` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `tm_filtering` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `tm_stemming` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`tm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_text_mining
-- ----------------------------
INSERT INTO `cbt_text_mining` VALUES (11, 0, 236, 'ujian sejarah manusia', 1, 'ujian sejarah manusia', '[\"ujian\",\"sejarah\",\"manusia\"]', '[\"ujian\",\"sejarah\",\"manusia\"]', '[\"uji\",\"sejarah\",\"manusia\"]', '2021-04-16 09:06:42', '2021-04-16 09:06:42');
INSERT INTO `cbt_text_mining` VALUES (12, 88, 0, 'pahlawan yaitu seorang pahlawan', 0, 'pahlawan yaitu seorang pahlawan', '[\"pahlawan\",\"yaitu\",\"seorang\",\"pahlawan\"]', '[\"pahlawan\",\"pahlawan\"]', '[\"pahlawan\",\"pahlawan\"]', '2021-04-13 11:21:03', NULL);
INSERT INTO `cbt_text_mining` VALUES (13, 89, 0, 'ujian sejarah', 0, 'ujian sejarah', '[\"ujian\",\"sejarah\"]', '[\"ujian\",\"sejarah\"]', '[\"uji\",\"indo\", \"truk\"]', '2021-04-13 15:06:20', '2021-04-15 11:48:09');
INSERT INTO `cbt_text_mining` VALUES (14, 90, 0, 'ujian sejarah', 0, 'ujian sejarah', '[\"ujian\",\"sejarah\"]', '[\"ujian\",\"sejarah\"]', '[\"uji\",\"sejarah\"]', '2021-04-13 15:06:35', '2021-04-16 09:09:17');
INSERT INTO `cbt_text_mining` VALUES (15, 0, 237, 'APA ITU SEJARAH sejarah', 1, 'apa itu sejarah sejarah', '[\"apa\",\"itu\",\"sejarah\",\"sejarah\"]', '[\"sejarah\",\"sejarah\"]', '[\"sejarah\",\"sejarah\"]', '2021-04-21 10:43:46', '2021-04-21 10:43:46');
INSERT INTO `cbt_text_mining` VALUES (16, 92, 0, 'ujian sosiologi', 0, 'ujian sosiologi', '[\"ujian\",\"sosiologi\"]', '[\"ujian\",\"sosiologi\"]', '[\"uji\",\"sosiologi\"]', '2021-04-13 15:13:12', NULL);
INSERT INTO `cbt_text_mining` VALUES (17, 0, 238, 'Jelaskan pengertian dari bahasa indonesia?', 1, 'jelaskan pengertian dari bahasa indonesia ', '[\"jelaskan\",\"pengertian\",\"dari\",\"bahasa\",\"indonesia\"]', '[\"pengertian\",\"bahasa\",\"indonesia\"]', '[\"erti\",\"bahasa\",\"indonesia\"]', '2021-04-22 08:43:58', NULL);
INSERT INTO `cbt_text_mining` VALUES (18, 93, 0, 'sfsdfsdf', 0, 'sfsdfsdf', '[\"sfsdfsdf\"]', '[\"sfsdfsdf\"]', '[\"sfsdfsdf\"]', '2021-04-22 09:20:42', NULL);
INSERT INTO `cbt_text_mining` VALUES (19, 0, 239, 'megalitikum adalah', 1, 'megalitikum adalah', '[\"megalitikum\",\"adalah\"]', '[\"megalitikum\"]', '[\"megalitikum\"]', '2021-04-22 09:35:20', NULL);
INSERT INTO `cbt_text_mining` VALUES (20, 0, 240, 'megalitikum adalah', 1, 'megalitikum adalah', '[\"megalitikum\",\"adalah\"]', '[\"megalitikum\"]', '[\"megalitikum\"]', '2021-04-22 09:36:13', NULL);
INSERT INTO `cbt_text_mining` VALUES (21, 94, 0, 'megalitikum adalah', 0, 'megalitikum adalah', '[\"megalitikum\",\"adalah\"]', '[\"megalitikum\"]', '[\"megalitikum\"]', '2021-04-22 09:43:25', '2021-04-22 11:12:48');
INSERT INTO `cbt_text_mining` VALUES (22, 95, 0, 'megalitikum merupakan', 0, 'megalitikum merupakan', '[\"megalitikum\",\"merupakan\"]', '[\"megalitikum\"]', '[\"megalitikum\"]', '2021-04-22 09:44:46', NULL);
INSERT INTO `cbt_text_mining` VALUES (23, 96, 0, 'pitecantropus', 0, 'pitecantropus', '[\"pitecantropus\"]', '[\"pitecantropus\"]', '[\"pitecantropus\"]', '2021-04-22 09:48:29', NULL);
INSERT INTO `cbt_text_mining` VALUES (24, 97, 0, 'pitecantropus erectus', 0, 'pitecantropus erectus', '[\"pitecantropus\",\"erectus\"]', '[\"pitecantropus\",\"erectus\"]', '[\"pitecantropus\",\"erectus\"]', '2021-04-22 09:48:44', NULL);
INSERT INTO `cbt_text_mining` VALUES (25, 0, 241, 'apa itu sejarah', 1, 'apa itu sejarah', '[\"apa\",\"itu\",\"sejarah\"]', '[\"sejarah\"]', '[\"sejarah\"]', '2021-04-22 10:49:15', NULL);
INSERT INTO `cbt_text_mining` VALUES (26, 0, 242, 'sejarah indonesia', 1, 'sejarah indonesia', '[\"sejarah\",\"indonesia\"]', '[\"sejarah\",\"indonesia\"]', '[\"sejarah\",\"indonesia\"]', '2021-04-23 10:55:22', '2021-04-23 10:55:22');
INSERT INTO `cbt_text_mining` VALUES (27, 0, 243, 'Bahasa Indonesia mobil', 1, 'bahasa indonesia mobil', '[\"bahasa\",\"indonesia\",\"mobil\"]', '[\"bahasa\",\"indonesia\",\"mobil\"]', '[\"bahasa\",\"indonesia\",\"mobil\"]', '2021-04-22 10:50:17', NULL);
INSERT INTO `cbt_text_mining` VALUES (28, 98, 0, 'Bahasa Indonesia adalah suatu bahasa yang dimilki oleh negara Indonesia', 0, 'bahasa indonesia adalah suatu bahasa yang dimilki oleh negara indonesia', '[\"bahasa\",\"indonesia\",\"adalah\",\"suatu\",\"bahasa\",\"yang\",\"dimilki\",\"oleh\",\"negara\",\"indonesia\"]', '[\"bahasa\",\"indonesia\",\"bahasa\",\"dimilki\",\"negara\",\"indonesia\"]', '[\"bahasa\",\"indonesia\",\"bahasa\",\"dimilki\",\"negara\",\"indonesia\"]', '2021-04-23 10:18:00', NULL);
INSERT INTO `cbt_text_mining` VALUES (29, 99, 0, 'Bahasa Indonesia mobil', 0, 'bahasa indonesia mobil', '[\"bahasa\",\"indonesia\",\"mobil\"]', '[\"bahasa\",\"indonesia\",\"mobil\"]', '[\"bahasa\",\"indonesia\",\"mobil\"]', '2021-04-23 10:18:15', NULL);
INSERT INTO `cbt_text_mining` VALUES (30, 100, 0, 'Bahasa Indonesia adalah', 0, 'bahasa indonesia adalah', '[\"bahasa\",\"indonesia\",\"adalah\"]', '[\"bahasa\",\"indonesia\"]', '[\"bahasa\",\"indonesia\"]', '2021-04-23 10:18:42', NULL);
INSERT INTO `cbt_text_mining` VALUES (31, 101, 0, 'Bahasa Indonesia mobil', 0, 'bahasa indonesia mobil', '[\"bahasa\",\"indonesia\",\"mobil\"]', '[\"bahasa\",\"indonesia\",\"mobil\"]', '[\"bahasa\",\"indonesia\",\"mobil\"]', '2021-04-23 10:18:53', NULL);

-- ----------------------------
-- Table structure for cbt_topik
-- ----------------------------
DROP TABLE IF EXISTS `cbt_topik`;
CREATE TABLE `cbt_topik`  (
  `topik_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `topik_modul_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `topik_create_by` int(11) NULL DEFAULT NULL,
  `topik_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `topik_detail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `topik_aktif` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`topik_id`) USING BTREE,
  UNIQUE INDEX `ak_subject_name`(`topik_modul_id`, `topik_nama`) USING BTREE,
  CONSTRAINT `cbt_topik_ibfk_1` FOREIGN KEY (`topik_modul_id`) REFERENCES `cbt_modul` (`modul_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_topik
-- ----------------------------
INSERT INTO `cbt_topik` VALUES (20, 9, 6, 'Ujian Sejarah', 'Ujian Sejarah', 1);
INSERT INTO `cbt_topik` VALUES (21, 9, 6, 'Bahasa Indonesia', 'Bahasa Indonesia', 1);

-- ----------------------------
-- Table structure for cbt_user
-- ----------------------------
DROP TABLE IF EXISTS `cbt_user`;
CREATE TABLE `cbt_user`  (
  `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_grup_id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_regdate` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `user_ip` varchar(39) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_firstname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_birthdate` date NULL DEFAULT NULL,
  `user_birthplace` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_level` smallint(3) UNSIGNED NOT NULL DEFAULT 1,
  `user_detail` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `ak_user_name`(`user_name`) USING BTREE,
  INDEX `user_groups_id`(`user_grup_id`) USING BTREE,
  INDEX `user_detail`(`user_detail`) USING BTREE,
  CONSTRAINT `cbt_user_ibfk_1` FOREIGN KEY (`user_grup_id`) REFERENCES `cbt_user_grup` (`grup_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_user
-- ----------------------------
INSERT INTO `cbt_user` VALUES (1, 6, 'lutfi', 'lutfi', '', '2018-01-11 11:38:27', NULL, 'Muhammad Lutfial Hakim', NULL, NULL, 1, 'Ruang 1, Sesi 1');
INSERT INTO `cbt_user` VALUES (2, 6, 'joko', 'joko', '', '2018-08-11 10:49:25', NULL, 'Joko Susanto', NULL, NULL, 1, '');
INSERT INTO `cbt_user` VALUES (3, 6, 'imammufiid', 'password', '', '2021-04-21 09:57:29', NULL, 'Imam Mufiid Al-query', NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for cbt_user_grup
-- ----------------------------
DROP TABLE IF EXISTS `cbt_user_grup`;
CREATE TABLE `cbt_user_grup`  (
  `grup_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `grup_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`grup_id`) USING BTREE,
  UNIQUE INDEX `group_name`(`grup_nama`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_user_grup
-- ----------------------------
INSERT INTO `cbt_user_grup` VALUES (5, 'XI MM');
INSERT INTO `cbt_user_grup` VALUES (6, 'XII IPA 3');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `opsi1` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `opsi2` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `level` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ts` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `level`(`level`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`level`) REFERENCES `user_level` (`level`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Achmad Lutfi', '', '', '', 'admin', '2015-07-30 01:12:03');
INSERT INTO `user` VALUES (6, 'taruvita', '7c02d33f6e9da3adea88ec418297d61d7d3079b8', 'taruvita', '', '', 'taruvita', 'Guru', '2021-01-20 17:58:55');

-- ----------------------------
-- Table structure for user_akses
-- ----------------------------
DROP TABLE IF EXISTS `user_akses`;
CREATE TABLE `user_akses`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_menu` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `add` int(2) NOT NULL DEFAULT 1 COMMENT '0=false, 1=true',
  `edit` int(2) NOT NULL DEFAULT 1 COMMENT '0=false, 1=true',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `akses_kode_menu`(`kode_menu`) USING BTREE,
  INDEX `akses_level`(`level`) USING BTREE,
  CONSTRAINT `user_akses_ibfk_2` FOREIGN KEY (`kode_menu`) REFERENCES `user_menu` (`kode_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_akses_ibfk_3` FOREIGN KEY (`level`) REFERENCES `user_level` (`level`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 526 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_akses
-- ----------------------------
INSERT INTO `user_akses` VALUES (478, 'admin', 'peserta-kartu', 1, 1);
INSERT INTO `user_akses` VALUES (479, 'admin', 'peserta-group', 1, 1);
INSERT INTO `user_akses` VALUES (480, 'admin', 'peserta-daftar', 1, 1);
INSERT INTO `user_akses` VALUES (481, 'admin', 'modul-daftar', 1, 1);
INSERT INTO `user_akses` VALUES (482, 'admin', 'tes-daftar', 1, 1);
INSERT INTO `user_akses` VALUES (483, 'admin', 'tool-backup', 1, 1);
INSERT INTO `user_akses` VALUES (484, 'admin', 'tes-evaluasi', 1, 1);
INSERT INTO `user_akses` VALUES (485, 'admin', 'tool-exportimport-soal', 1, 1);
INSERT INTO `user_akses` VALUES (486, 'admin', 'modul-filemanager', 1, 1);
INSERT INTO `user_akses` VALUES (487, 'admin', 'tes-hasil', 1, 1);
INSERT INTO `user_akses` VALUES (488, 'admin', 'peserta-import', 1, 1);
INSERT INTO `user_akses` VALUES (489, 'admin', 'modul-import', 1, 1);
INSERT INTO `user_akses` VALUES (490, 'admin', 'user_level', 1, 1);
INSERT INTO `user_akses` VALUES (491, 'admin', 'user_menu', 1, 1);
INSERT INTO `user_akses` VALUES (492, 'admin', 'user_atur', 1, 1);
INSERT INTO `user_akses` VALUES (493, 'admin', 'user-zyacbt', 1, 1);
INSERT INTO `user_akses` VALUES (494, 'admin', 'tes-rekap', 1, 1);
INSERT INTO `user_akses` VALUES (495, 'admin', 'modul-soal', 1, 1);
INSERT INTO `user_akses` VALUES (496, 'admin', 'tes-tambah', 1, 1);
INSERT INTO `user_akses` VALUES (497, 'admin', 'tes-token', 1, 1);
INSERT INTO `user_akses` VALUES (498, 'admin', 'modul-topik', 1, 1);
INSERT INTO `user_akses` VALUES (518, 'Guru', 'modul-daftar', 1, 1);
INSERT INTO `user_akses` VALUES (519, 'Guru', 'tes-daftar', 1, 1);
INSERT INTO `user_akses` VALUES (520, 'Guru', 'tes-evaluasi', 1, 1);
INSERT INTO `user_akses` VALUES (521, 'Guru', 'tes-hasil', 1, 1);
INSERT INTO `user_akses` VALUES (522, 'Guru', 'modul-import', 1, 1);
INSERT INTO `user_akses` VALUES (523, 'Guru', 'modul-soal', 1, 1);
INSERT INTO `user_akses` VALUES (524, 'Guru', 'tes-tambah', 1, 1);
INSERT INTO `user_akses` VALUES (525, 'Guru', 'modul-topik', 1, 1);

-- ----------------------------
-- Table structure for user_level
-- ----------------------------
DROP TABLE IF EXISTS `user_level`;
CREATE TABLE `user_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `level`(`level`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_level
-- ----------------------------
INSERT INTO `user_level` VALUES (1, 'admin', 'Administrator');
INSERT INTO `user_level` VALUES (9, 'Guru', 'Guru');

-- ----------------------------
-- Table structure for user_log
-- ----------------------------
DROP TABLE IF EXISTS `user_log`;
CREATE TABLE `user_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `log` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ts` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_menu
-- ----------------------------
DROP TABLE IF EXISTS `user_menu`;
CREATE TABLE `user_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipe` int(11) NOT NULL DEFAULT 1 COMMENT '0=parent, 1=child',
  `parent` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_menu` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_menu` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `url` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '#',
  `icon` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'fa fa-circle-o',
  `urutan` int(11) NOT NULL,
  `status` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `kode_menu`(`kode_menu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_menu
-- ----------------------------
INSERT INTO `user_menu` VALUES (1, 0, '', 'user', 'Pengaturan', '#', 'fa fa-user', 20, 1);
INSERT INTO `user_menu` VALUES (3, 1, 'user', 'user_atur', 'Pengaturan User', 'manager/useratur', 'fa fa-circle-o', 5, 1);
INSERT INTO `user_menu` VALUES (4, 1, 'user', 'user_level', 'Pengaturan Level', 'manager/userlevel', 'fa fa-circle-o', 6, 1);
INSERT INTO `user_menu` VALUES (5, 1, 'user', 'user_menu', 'Pengaturan Menu', 'manager/usermenu', 'fa fa-circle-o', 7, 1);
INSERT INTO `user_menu` VALUES (6, 0, '', 'modul', 'Data Modul', '#', 'fa fa-book', 2, 1);
INSERT INTO `user_menu` VALUES (7, 1, 'modul', 'modul-daftar', 'Daftar Soal', 'manager/modul_daftar', 'fa fa-circle-o', 5, 1);
INSERT INTO `user_menu` VALUES (8, 1, 'modul', 'modul-topik', 'Topik', 'manager/modul_topik', 'fa fa-circle-o', 2, 1);
INSERT INTO `user_menu` VALUES (10, 0, '', 'peserta', 'Data Siswa', '#', 'fa fa-users', 1, 1);
INSERT INTO `user_menu` VALUES (11, 1, 'peserta', 'peserta-daftar', 'Daftar Siswa', 'manager/peserta_daftar', 'fa fa-circle-o', 2, 1);
INSERT INTO `user_menu` VALUES (12, 1, 'peserta', 'peserta-group', 'Daftar Kelas', 'manager/peserta_group', 'fa fa-circle-o', 1, 1);
INSERT INTO `user_menu` VALUES (13, 1, 'peserta', 'peserta-import', 'Import Data Peserta', 'manager/peserta_import', 'fa fa-circle-o', 3, 0);
INSERT INTO `user_menu` VALUES (14, 0, '', 'tes', 'Data Tes', '#', 'fa fa-tasks', 7, 1);
INSERT INTO `user_menu` VALUES (15, 1, 'tes', 'tes-tambah', 'Tambah Tes', 'manager/tes_tambah', 'fa fa-circle-o', 1, 1);
INSERT INTO `user_menu` VALUES (16, 1, 'tes', 'tes-daftar', 'Daftar Tes', 'manager/tes_daftar', 'fa fa-circle-o', 2, 1);
INSERT INTO `user_menu` VALUES (17, 1, 'tes', 'tes-hasil', 'Hasil Tes', 'manager/tes_hasil', 'fa fa-circle-o', 6, 1);
INSERT INTO `user_menu` VALUES (18, 1, 'modul', 'modul-soal', 'Soal', 'manager/modul_soal', 'fa fa-circle-o', 3, 1);
INSERT INTO `user_menu` VALUES (19, 1, 'tes', 'tes-token', 'Token', 'manager/tes_token', 'fa fa-circle-o', 8, 0);
INSERT INTO `user_menu` VALUES (22, 1, 'modul', 'modul-filemanager', 'File Manager', 'manager/modul_filemanager', 'fa fa-circle-o', 6, 0);
INSERT INTO `user_menu` VALUES (24, 1, 'modul', 'modul-import', 'Import Soal', 'manager/modul_import', 'fa fa-circle-o', 4, 0);
INSERT INTO `user_menu` VALUES (25, 1, 'tes', 'tes-evaluasi', 'Evaluasi Tes', 'manager/tes_evaluasi', 'fa fa-circle-o', 5, 1);
INSERT INTO `user_menu` VALUES (28, 1, 'tes', 'tes-hasil-operator', 'Hasil Tes Operator', 'manager/tes_hasil_operator', 'fa fa-circle-o', 10, 1);
INSERT INTO `user_menu` VALUES (30, 0, '', 'tool', 'Tool', '#', 'fa fa-wrench', 5, 1);
INSERT INTO `user_menu` VALUES (31, 1, 'tool', 'tool-backup', 'Database', 'manager/tool_backup', 'fa fa-database', 1, 0);
INSERT INTO `user_menu` VALUES (32, 1, 'tes', 'tes-rekap', 'Rekap Hasil Tes', 'manager/tes_rekap_hasil', 'fa fa-circle-o', 7, 0);
INSERT INTO `user_menu` VALUES (33, 1, 'tool', 'tool-exportimport-soal', 'Export / Import Soal', 'manager/tool_exportimport_soal', 'fa fa-circle-o', 2, 0);
INSERT INTO `user_menu` VALUES (34, 1, 'user', 'user-zyacbt', 'Pengaturan Aplikasi', 'manager/pengaturan_zyacbt', 'fa fa-circle-o', 1, 1);
INSERT INTO `user_menu` VALUES (37, 1, 'peserta', 'peserta-kartu', 'Cetak Kartu', 'manager/peserta_kartu', 'fa fa-circle-o', 5, 0);

-- ----------------------------
-- View structure for all_question_by_tes_view
-- ----------------------------
DROP VIEW IF EXISTS `all_question_by_tes_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `all_question_by_tes_view` AS SELECT
	cbt_soal.soal_id,
	cbt_tes.tes_id,
	cbt_tes.tes_nama,
	cbt_text_mining.tm_stemming 
FROM
	cbt_soal
	INNER JOIN cbt_tes_topik_set ON cbt_soal.soal_topik_id = cbt_tes_topik_set.tset_topik_id
	INNER JOIN cbt_tes ON cbt_tes_topik_set.tset_tes_id = cbt_tes.tes_id
	INNER JOIN cbt_text_mining ON cbt_soal.soal_id = cbt_text_mining.tm_soal_id ;

-- ----------------------------
-- View structure for text_mining_answer_view
-- ----------------------------
DROP VIEW IF EXISTS `text_mining_answer_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `text_mining_answer_view` AS SELECT
cbt_text_mining.tm_id,
cbt_tes_soal.tessoal_soal_id AS soal_id,
cbt_tes_soal.tessoal_id,
cbt_tes_user.tesuser_user_id AS user_id,
cbt_tes_user.tesuser_tes_id AS tes_id, 
cbt_tes_user.tesuser_status AS `status`,
cbt_tes_soal.tessoal_jawaban_text AS answer,
cbt_text_mining.tm_case_folding AS case_folding,
cbt_text_mining.tm_tokenization AS tokenization,
cbt_text_mining.tm_filtering AS filtering,
cbt_text_mining.tm_stemming AS stemming,
cbt_tes_soal.tessoal_nilai AS nilai,
cbt_tes_soal.tessoal_human_point AS human_point
FROM
cbt_text_mining
INNER JOIN cbt_tes_soal ON cbt_text_mining.tm_tessoal_id = cbt_tes_soal.tessoal_id
INNER JOIN cbt_tes_user ON cbt_tes_soal.tessoal_tesuser_id = cbt_tes_user.tesuser_id
INNER JOIN cbt_tes ON cbt_tes_user.tesuser_tes_id = cbt_tes.tes_id ;

-- ----------------------------
-- View structure for text_mining_kunci_view
-- ----------------------------
DROP VIEW IF EXISTS `text_mining_kunci_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `text_mining_kunci_view` AS SELECT
cbt_text_mining.tm_id,
cbt_soal.soal_id,
cbt_soal.soal_detail,
cbt_soal.soal_kunci,
cbt_text_mining.tm_case_folding,
cbt_text_mining.tm_tokenization,
cbt_text_mining.tm_filtering,
cbt_text_mining.tm_stemming
FROM
cbt_text_mining
INNER JOIN cbt_soal ON cbt_text_mining.tm_soal_id = cbt_soal.soal_id ;

SET FOREIGN_KEY_CHECKS = 1;

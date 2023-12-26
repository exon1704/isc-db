/*
 Navicat Premium Data Transfer

 Source Server         : comialex
 Source Server Type    : MariaDB
 Source Server Version : 100611
 Source Host           : localhost:3306
 Source Schema         : nova

 Target Server Type    : MariaDB
 Target Server Version : 100611
 File Encoding         : 65001

 Date: 25/12/2023 21:22:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `id_area` int(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_area`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (1, 'Mesa de servicio');
INSERT INTO `area` VALUES (2, 'Telmex');
INSERT INTO `area` VALUES (3, 'Sistemas TI');
INSERT INTO `area` VALUES (4, 'Soporte TI');
INSERT INTO `area` VALUES (5, 'Monitoreo TI');
INSERT INTO `area` VALUES (6, 'CFE');

-- ----------------------------
-- Table structure for empresa
-- ----------------------------
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa`  (
  `id_empresa` int(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `razon_social` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `rfc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_empresa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of empresa
-- ----------------------------
INSERT INTO `empresa` VALUES (1, 'COMIALEX \r\n', 'COMIALEX SA DE CV', 'COM100121D43\r\n');

-- ----------------------------
-- Table structure for estado
-- ----------------------------
DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado`  (
  `id_estado` int(2) NOT NULL AUTO_INCREMENT,
  `clave` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_estado`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of estado
-- ----------------------------
INSERT INTO `estado` VALUES (1, 'AGS', 'AGUASCALIENTES');
INSERT INTO `estado` VALUES (2, 'BC', 'BAJA CALIFORNIA');
INSERT INTO `estado` VALUES (3, 'BCS', 'BAJA CALIFORNIA SUR');
INSERT INTO `estado` VALUES (4, 'CHI', 'CHIHUAHUA');
INSERT INTO `estado` VALUES (5, 'CHS', 'CHIAPAS');
INSERT INTO `estado` VALUES (6, 'CMP', 'CAMPECHE');
INSERT INTO `estado` VALUES (7, 'CMX', 'CIUDAD DE MEXICO');
INSERT INTO `estado` VALUES (8, 'COA', 'COAHUILA');
INSERT INTO `estado` VALUES (9, 'COL', 'COLIMA');
INSERT INTO `estado` VALUES (10, 'DGO', 'DURANGO');
INSERT INTO `estado` VALUES (11, 'GRO', 'GUERRERO');
INSERT INTO `estado` VALUES (12, 'GTO', 'GUANAJUATO');
INSERT INTO `estado` VALUES (13, 'HGO', 'HIDALGO');
INSERT INTO `estado` VALUES (14, 'JAL', 'JALISCO');
INSERT INTO `estado` VALUES (15, 'MCH', 'MICHOACAN');
INSERT INTO `estado` VALUES (16, 'MEX', 'ESTADO DE MEXICO');
INSERT INTO `estado` VALUES (17, 'MOR', 'MORELOS');
INSERT INTO `estado` VALUES (18, 'NAY', 'NAYARIT');
INSERT INTO `estado` VALUES (19, 'NL', 'NUEVO LEON');
INSERT INTO `estado` VALUES (20, 'OAX', 'OAXACA');
INSERT INTO `estado` VALUES (21, 'PUE', 'PUEBLA');
INSERT INTO `estado` VALUES (22, 'QR', 'QUINTANA ROO');
INSERT INTO `estado` VALUES (23, 'QRO', 'QUERETARO');
INSERT INTO `estado` VALUES (24, 'SIN', 'SINALOA');
INSERT INTO `estado` VALUES (25, 'SLP', 'SAN LUIS POTOSI');
INSERT INTO `estado` VALUES (26, 'SON', 'SONORA');
INSERT INTO `estado` VALUES (27, 'TAB', 'TABASCO');
INSERT INTO `estado` VALUES (28, 'TLX', 'TLAXCALA');
INSERT INTO `estado` VALUES (29, 'TMS', 'TAMAULIPAS');
INSERT INTO `estado` VALUES (30, 'VER', 'VERACRUZ');
INSERT INTO `estado` VALUES (31, 'YUC', 'YUCATAN');
INSERT INTO `estado` VALUES (32, 'ZAC', 'ZACATECAS');

-- ----------------------------
-- Table structure for estado_reporte
-- ----------------------------
DROP TABLE IF EXISTS `estado_reporte`;
CREATE TABLE `estado_reporte`  (
  `id_estado` int(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_estado`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of estado_reporte
-- ----------------------------
INSERT INTO `estado_reporte` VALUES (1, 'Abierto');
INSERT INTO `estado_reporte` VALUES (2, 'Cerrado');
INSERT INTO `estado_reporte` VALUES (3, 'Cancelado');
INSERT INTO `estado_reporte` VALUES (4, 'Pendiente');

-- ----------------------------
-- Table structure for folio
-- ----------------------------
DROP TABLE IF EXISTS `folio`;
CREATE TABLE `folio`  (
  `id_folio` int(10) NOT NULL AUTO_INCREMENT,
  `id_unidad` int(10) NOT NULL,
  `id_reporte` int(10) NOT NULL,
  `id_estado` int(2) NOT NULL DEFAULT 1,
  `folio` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `nota` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL,
  `agente` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_folio`) USING BTREE,
  UNIQUE INDEX `folio`(`folio`) USING BTREE,
  INDEX `FK_folio_unidad`(`id_unidad`) USING BTREE,
  INDEX `FK_folio_reporte`(`id_reporte`) USING BTREE,
  INDEX `FK_folio_estado_reporte`(`id_estado`) USING BTREE,
  INDEX `fecha`(`fecha`) USING BTREE,
  CONSTRAINT `FK_folio_estado_reporte` FOREIGN KEY (`id_estado`) REFERENCES `estado_reporte` (`id_estado`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_folio_reporte` FOREIGN KEY (`id_reporte`) REFERENCES `reporte` (`id_reporte`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_folio_unidad` FOREIGN KEY (`id_unidad`) REFERENCES `unidad` (`id_unidad`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of folio
-- ----------------------------
INSERT INTO `folio` VALUES (1, 40, 33, 1, 'RF12713641729256', '2023-12-22 22:05:13', NULL, NULL);
INSERT INTO `folio` VALUES (2, 67, 34, 2, 'IM540465', '2023-12-22 23:02:36', NULL, NULL);
INSERT INTO `folio` VALUES (5, 1, 10, 2, 'IM540518', '2023-12-23 10:05:40', NULL, NULL);
INSERT INTO `folio` VALUES (6, 1, 16, 1, '10318558', '2023-12-23 11:36:38', NULL, NULL);
INSERT INTO `folio` VALUES (7, 38, 11, 2, 'RF729537', '2023-12-24 10:23:22', NULL, NULL);
INSERT INTO `folio` VALUES (8, 1, 10, 2, 'IM540660', '2023-12-24 10:24:42', NULL, NULL);
INSERT INTO `folio` VALUES (9, 2, 3, 1, 'NF-111211232', '2023-12-24 23:09:20', NULL, NULL);
INSERT INTO `folio` VALUES (10, 2, 3, 1, 'NF-11121123223', '2023-12-24 23:09:58', NULL, NULL);
INSERT INTO `folio` VALUES (11, 2, 3, 1, 'F122423192', '2023-12-24 23:10:21', NULL, NULL);
INSERT INTO `folio` VALUES (12, 2, 3, 1, 'F122423302', '2023-12-24 23:10:33', NULL, NULL);
INSERT INTO `folio` VALUES (13, 2, 18, 1, 'F122423452', '2023-12-24 23:13:05', NULL, NULL);
INSERT INTO `folio` VALUES (14, 3, 29, 1, 'F122423260', '2023-12-24 23:18:28', NULL, NULL);
INSERT INTO `folio` VALUES (15, 2, 26, 1, 'F122423202', '2023-12-24 23:38:22', NULL, NULL);
INSERT INTO `folio` VALUES (16, 4, 16, 1, 'NF-11127210', '2023-12-24 23:40:01', NULL, NULL);
INSERT INTO `folio` VALUES (17, 6, 22, 4, '26737389', '2023-12-24 23:40:31', NULL, NULL);
INSERT INTO `folio` VALUES (18, 1, 2, 1, 'F122423330', '2023-12-24 23:57:39', NULL, NULL);
INSERT INTO `folio` VALUES (19, 2, 21, 1, 'F12250130', '2023-12-25 00:01:14', NULL, NULL);
INSERT INTO `folio` VALUES (20, 2, 21, 1, 'F12250152', '2023-12-25 00:02:17', NULL, NULL);
INSERT INTO `folio` VALUES (21, 4, 20, 1, 'F12251280', '2023-12-25 01:05:39', NULL, NULL);
INSERT INTO `folio` VALUES (22, 4, 30, 1, 'kk', '2023-12-25 01:28:56', NULL, NULL);
INSERT INTO `folio` VALUES (23, 4, 30, 1, 'kkk', '2023-12-25 01:29:23', NULL, NULL);
INSERT INTO `folio` VALUES (24, 2, 15, 1, 'F1225210', '2023-12-25 02:07:12', NULL, NULL);

-- ----------------------------
-- Table structure for horario
-- ----------------------------
DROP TABLE IF EXISTS `horario`;
CREATE TABLE `horario`  (
  `id_horario` int(10) NOT NULL AUTO_INCREMENT,
  `id_operatividad` int(4) NULL DEFAULT NULL,
  `id_unidad` int(10) NULL DEFAULT NULL,
  `apertura` time NULL DEFAULT NULL,
  `cierre` time NULL DEFAULT NULL,
  PRIMARY KEY (`id_horario`) USING BTREE,
  INDEX `FK_horario_operatividad`(`id_operatividad`) USING BTREE,
  INDEX `FK_horario_unidad`(`id_unidad`) USING BTREE,
  CONSTRAINT `FK_horario_operatividad` FOREIGN KEY (`id_operatividad`) REFERENCES `operatividad` (`id_operatividad`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_horario_unidad` FOREIGN KEY (`id_unidad`) REFERENCES `unidad` (`id_unidad`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of horario
-- ----------------------------
INSERT INTO `horario` VALUES (1, 1, 13, '08:00:00', '22:00:00');
INSERT INTO `horario` VALUES (2, 2, 13, '09:00:00', '21:00:00');

-- ----------------------------
-- Table structure for operatividad
-- ----------------------------
DROP TABLE IF EXISTS `operatividad`;
CREATE TABLE `operatividad`  (
  `id_operatividad` int(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_operatividad`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operatividad
-- ----------------------------
INSERT INTO `operatividad` VALUES (1, 'Lunes - Sabado');
INSERT INTO `operatividad` VALUES (2, 'Domingo');

-- ----------------------------
-- Table structure for reporte
-- ----------------------------
DROP TABLE IF EXISTS `reporte`;
CREATE TABLE `reporte`  (
  `id_reporte` int(10) NOT NULL AUTO_INCREMENT,
  `id_area` int(4) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_reporte`) USING BTREE,
  INDEX `FK_reporte_area`(`id_area`) USING BTREE,
  CONSTRAINT `FK_reporte_area` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reporte
-- ----------------------------
INSERT INTO `reporte` VALUES (1, 1, 'Error SPOS PV');
INSERT INTO `reporte` VALUES (2, 1, 'Error SPOS AA');
INSERT INTO `reporte` VALUES (3, 1, 'Error en portal franquiciatario');
INSERT INTO `reporte` VALUES (4, 1, 'Error en indicadores de venta');
INSERT INTO `reporte` VALUES (5, 1, 'Error en base de datos');
INSERT INTO `reporte` VALUES (6, 1, 'Falla en sistema operativo');
INSERT INTO `reporte` VALUES (7, 1, 'Instalación SPOS PV');
INSERT INTO `reporte` VALUES (8, 1, 'Instalación SPOS AA');
INSERT INTO `reporte` VALUES (9, 1, 'Cierre anticipado');
INSERT INTO `reporte` VALUES (10, 1, 'Falla de internet');
INSERT INTO `reporte` VALUES (11, 1, 'Falla de energía eléctrica');
INSERT INTO `reporte` VALUES (12, 1, 'Error VPN');
INSERT INTO `reporte` VALUES (13, 1, 'Otros');
INSERT INTO `reporte` VALUES (14, 2, 'Falla de voz');
INSERT INTO `reporte` VALUES (15, 2, 'Falla de datos');
INSERT INTO `reporte` VALUES (16, 2, 'Falla de voz y datos');
INSERT INTO `reporte` VALUES (17, 4, 'Solicitud de hardware/software');
INSERT INTO `reporte` VALUES (18, 4, 'Actualización de software');
INSERT INTO `reporte` VALUES (19, 4, 'Problemas de conectividad');
INSERT INTO `reporte` VALUES (20, 4, 'Falla de hardware');
INSERT INTO `reporte` VALUES (21, 4, 'Falla de software');
INSERT INTO `reporte` VALUES (22, 4, 'Problema de impresión');
INSERT INTO `reporte` VALUES (23, 4, 'Gestión de activos TI');
INSERT INTO `reporte` VALUES (24, 4, 'Otros');
INSERT INTO `reporte` VALUES (25, 5, 'Solicitud de grabación');
INSERT INTO `reporte` VALUES (26, 5, 'Sincronización de equipo');
INSERT INTO `reporte` VALUES (27, 5, 'Verificación de grabaciones');
INSERT INTO `reporte` VALUES (28, 5, 'Seguimiento interno');
INSERT INTO `reporte` VALUES (29, 5, 'Otros');
INSERT INTO `reporte` VALUES (30, 6, 'Falla de energía eléctrica');
INSERT INTO `reporte` VALUES (31, 1, 'Cierre anticipado por reubicacicón');
INSERT INTO `reporte` VALUES (32, 2, 'Cambio de modem');
INSERT INTO `reporte` VALUES (33, 1, 'Instalación Simulador SPOS');
INSERT INTO `reporte` VALUES (34, 1, 'Error en cierre de día (Ventas vs depositos)');

-- ----------------------------
-- Table structure for seguimiento
-- ----------------------------
DROP TABLE IF EXISTS `seguimiento`;
CREATE TABLE `seguimiento`  (
  `id_seguimiento` int(10) NOT NULL AUTO_INCREMENT,
  `id_folio` int(10) NOT NULL,
  `id_estado` int(2) NOT NULL DEFAULT 2,
  `agente` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `nota` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL,
  PRIMARY KEY (`id_seguimiento`) USING BTREE,
  INDEX `FK_seguimiento_folio`(`id_folio`) USING BTREE,
  INDEX `FK_seguimiento_estado_reporte`(`id_estado`) USING BTREE,
  INDEX `fecha`(`fecha`) USING BTREE,
  CONSTRAINT `FK_seguimiento_estado_reporte` FOREIGN KEY (`id_estado`) REFERENCES `estado_reporte` (`id_estado`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_seguimiento_folio` FOREIGN KEY (`id_folio`) REFERENCES `folio` (`id_folio`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seguimiento
-- ----------------------------

-- ----------------------------
-- Table structure for unidad
-- ----------------------------
DROP TABLE IF EXISTS `unidad`;
CREATE TABLE `unidad`  (
  `id_unidad` int(10) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(4) NOT NULL,
  `id_estado` int(2) NOT NULL,
  `clave` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_unidad`) USING BTREE,
  INDEX `FK_unidad_empresa`(`id_empresa`) USING BTREE,
  INDEX `FK_unidad_estado`(`id_estado`) USING BTREE,
  CONSTRAINT `FK_unidad_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_unidad_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of unidad
-- ----------------------------
INSERT INTO `unidad` VALUES (1, 1, 5, '71560', 'ANGEL ALBINO CORZO 1');
INSERT INTO `unidad` VALUES (2, 1, 20, '7802', 'BAHIA DE HUATULCO 3');
INSERT INTO `unidad` VALUES (3, 1, 20, '71440', 'BAHIAS DE HUATULCO 1');
INSERT INTO `unidad` VALUES (4, 1, 20, 'FC0108', 'BAHIAS DE HUATULCO 2');
INSERT INTO `unidad` VALUES (5, 1, 20, '74699', 'BAHIAS DE HUATULCO 4');
INSERT INTO `unidad` VALUES (6, 1, 9, '7923', 'COLIMA 1');
INSERT INTO `unidad` VALUES (7, 1, 9, '71047', 'COLIMA 2');
INSERT INTO `unidad` VALUES (8, 1, 9, 'FC1735', 'COLIMA 3');
INSERT INTO `unidad` VALUES (9, 1, 9, '72666', 'COMALA 1');
INSERT INTO `unidad` VALUES (10, 1, 5, 'FC1963', 'COPAINALA 1, CHIS');
INSERT INTO `unidad` VALUES (11, 1, 9, 'FC1809', 'COQUIMATLAN 1, COL');
INSERT INTO `unidad` VALUES (12, 1, 14, '72627', 'EL GRULLO');
INSERT INTO `unidad` VALUES (13, 1, 14, '73758', 'EL GRULLO 2');
INSERT INTO `unidad` VALUES (14, 1, 5, '71532', 'JITOTOL');
INSERT INTO `unidad` VALUES (15, 1, 14, 'FC1946', 'JOCOTEPEC 2');
INSERT INTO `unidad` VALUES (16, 1, 14, '72006', 'JOCOTEPEC 3');
INSERT INTO `unidad` VALUES (17, 1, 32, '72065', 'JUCHIPILA 2, ZAC');
INSERT INTO `unidad` VALUES (18, 1, 14, '71158', 'LA HUERTA 1, JAL');
INSERT INTO `unidad` VALUES (19, 1, 14, 'FC1988', 'LA RESOLANA 1');
INSERT INTO `unidad` VALUES (20, 1, 14, '73648', 'LA RESOLANA 2');
INSERT INTO `unidad` VALUES (21, 1, 20, '75375', 'POCHUTLA 5');
INSERT INTO `unidad` VALUES (22, 1, 5, 'FC2035', 'PUEBLO NUEVO');
INSERT INTO `unidad` VALUES (23, 1, 20, 'FC0865', 'PUTLA VILLA DE GUERRERO 1');
INSERT INTO `unidad` VALUES (24, 1, 20, 'FC2140', 'PUTLA VILLA DE GUERRERO 2');
INSERT INTO `unidad` VALUES (25, 1, 20, 'FC1472', 'RIO GRANDE 1');
INSERT INTO `unidad` VALUES (26, 1, 20, '7522', 'SALINA CRUZ 2');
INSERT INTO `unidad` VALUES (27, 1, 20, '71120', 'SALINA CRUZ 3');
INSERT INTO `unidad` VALUES (28, 1, 20, 'FC2465', 'SALINA CRUZ 4');
INSERT INTO `unidad` VALUES (29, 1, 20, '71672', 'SALINA CRUZ 5');
INSERT INTO `unidad` VALUES (30, 1, 20, '72451', 'SALINA CRUZ 6');
INSERT INTO `unidad` VALUES (31, 1, 20, '7792', 'SALINA CRUZ 7');
INSERT INTO `unidad` VALUES (32, 1, 20, '75844', 'SALINA CRUZ 8, OAX');
INSERT INTO `unidad` VALUES (33, 1, 20, '75097', 'SAN BLAS ATEMPA');
INSERT INTO `unidad` VALUES (34, 1, 5, '71936', 'SAN FERNANDO 3, CHS.');
INSERT INTO `unidad` VALUES (35, 1, 20, 'FC0107', 'SAN PEDRO POCHUTLA 1');
INSERT INTO `unidad` VALUES (36, 1, 20, 'FC0427', 'SAN PEDRO POCHUTLA 2');
INSERT INTO `unidad` VALUES (37, 1, 20, 'FC0743', 'SAN PEDRO POCHUTLA 3');
INSERT INTO `unidad` VALUES (38, 1, 20, 'FC1936', 'SANTA MA. JALAPA DEL MARQUES 1');
INSERT INTO `unidad` VALUES (39, 1, 20, 'FC0255', 'SANTA MARIA HUATULCO 1');
INSERT INTO `unidad` VALUES (40, 1, 20, 'FC1881', 'SANTA MARIA HUATULCO 2');
INSERT INTO `unidad` VALUES (41, 1, 20, 'FC1494', 'SANTIAGO JAMILTEPEC 1');
INSERT INTO `unidad` VALUES (42, 1, 20, '74806', 'SANTIAGO JAMILTEPEC 2');
INSERT INTO `unidad` VALUES (43, 1, 20, 'FC1447', 'SANTIAGO PINOTEPA NACIONAL 2');
INSERT INTO `unidad` VALUES (44, 1, 20, '73748', 'SANTIAGO PINOTEPA NACIONAL 4');
INSERT INTO `unidad` VALUES (45, 1, 20, '7889', 'SANTO DOMINGO TEHUANTEPEC 1');
INSERT INTO `unidad` VALUES (46, 1, 20, '71309', 'SANTO DOMINGO TEHUANTEPEC 2');
INSERT INTO `unidad` VALUES (47, 1, 20, '7463', 'SANTO DOMINGO TEHUANTEPEC 3');
INSERT INTO `unidad` VALUES (48, 1, 20, '72908', 'SANTO DOMINGO TEHUANTEPEC 4');
INSERT INTO `unidad` VALUES (49, 1, 5, 'FC0943', 'SIMOJOVEL 1, CHS');
INSERT INTO `unidad` VALUES (50, 1, 5, '73101', 'SIMOJOVEL 2, CHS');
INSERT INTO `unidad` VALUES (51, 1, 14, '71114', 'TAMAZULA DE GORDIANO 1');
INSERT INTO `unidad` VALUES (52, 1, 9, 'FC0742', 'TECOMAN 1');
INSERT INTO `unidad` VALUES (53, 1, 9, '71379', 'TECOMAN 2');
INSERT INTO `unidad` VALUES (54, 1, 9, '75423', 'TECOMAN 3');
INSERT INTO `unidad` VALUES (55, 1, 5, '75387', 'TUXTLA 45');
INSERT INTO `unidad` VALUES (56, 1, 5, '7559', 'TUXTLA GUTIERREZ 1');
INSERT INTO `unidad` VALUES (57, 1, 5, '71977', 'TUXTLA GUTIERREZ 11');
INSERT INTO `unidad` VALUES (58, 1, 5, 'FH0209', 'TUXTLA GUTIERREZ 15');
INSERT INTO `unidad` VALUES (59, 1, 5, 'FC1810', 'TUXTLA GUTIERREZ 16');
INSERT INTO `unidad` VALUES (60, 1, 5, '72797', 'TUXTLA GUTIERREZ 25');
INSERT INTO `unidad` VALUES (61, 1, 5, '75555', 'TUXTLA GUTIERREZ 47, CHS');
INSERT INTO `unidad` VALUES (62, 1, 5, '71352', 'VENUSTIANO CARRANZA 1');
INSERT INTO `unidad` VALUES (63, 1, 5, '7143', 'VILLAFLORES 1');
INSERT INTO `unidad` VALUES (64, 1, 5, '73662', 'VILLAFLORES 3');
INSERT INTO `unidad` VALUES (65, 1, 5, '7877', 'VILLAFLORES 4');
INSERT INTO `unidad` VALUES (66, 1, 5, '71533', 'VILLAFLORES 5');
INSERT INTO `unidad` VALUES (67, 1, 5, '72520', 'VILLAFLORES 6');
INSERT INTO `unidad` VALUES (68, 1, 14, '71262', 'ZAPOPAN 18, JAL');
INSERT INTO `unidad` VALUES (69, 1, 14, 'FN0017', 'ZAPOPAN 25');
INSERT INTO `unidad` VALUES (70, 1, 14, '71917', 'ZAPOPAN 26');

-- ----------------------------
-- Table structure for unidad_contacto
-- ----------------------------
DROP TABLE IF EXISTS `unidad_contacto`;
CREATE TABLE `unidad_contacto`  (
  `id_unidad` int(10) NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_unidad`) USING BTREE,
  CONSTRAINT `fk_unidad_contacto` FOREIGN KEY (`id_unidad`) REFERENCES `unidad` (`id_unidad`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of unidad_contacto
-- ----------------------------
INSERT INTO `unidad_contacto` VALUES (1, '992 655 1110', '1RA AV. NORTE ORIENTE # 3, CENTRO, C.P. 30370, ANGEL ALBINO CORZO, CHIAPAS, REFERENCIA 1RA ORIENTE NORTE Y CENTRAL NORTE');
INSERT INTO `unidad_contacto` VALUES (2, '958 587 0868', 'AV. GUAMUCHIL S/N, SECTOR H, C.P. 70989, SANTA CRUZ HUATULCO, OAXACA, REFERENCIA CARRIZAL Y BLVD. CHAHUE');
INSERT INTO `unidad_contacto` VALUES (3, '958 587 1764', 'BAHIA SAN AGUSTIN # 110 LOCAL 12, SECTOR T, C.P. 70987, SANTA CRUZ HUATULCO, OAXACA, REFERENCIA BAHIA CHAHUE Y BAHIA LA ENTREGA');
INSERT INTO `unidad_contacto` VALUES (4, '958 587 1312', 'BUGAMBILIA # 1502 MZA 45 LOTE 1 L-1, SECTOR H, C.P. 70989, SANTA CRUZ HUATULCO, OAXACA, REFERENCIA ESQ. POCHOTE Y SABALI');
INSERT INTO `unidad_contacto` VALUES (5, '958 688 3004', 'CALLE FLAMBOYÁN # 304, SECTOR H, C.P. 70987, SANTA CRUZ HUATULCO, OAXACA, REFERENCIA ENTRE CALLE BUGAMBILIA Y CALLE GARDENIA');
INSERT INTO `unidad_contacto` VALUES (6, '312 136 1259', 'BLVD. CAMINO REAL DE COLIMA # 34, CAMINO REAL, C.P. 28040, COLIMA, COLIMA, REFERENCIA GUILLERMO PRIETO Y AV. DE LOS INSURGENTES');
INSERT INTO `unidad_contacto` VALUES (7, '312 312 1432', 'AV. PINO SUAREZ # 95, FATIMA, C.P. 28050, COLIMA, COLIMA, REFERENCIA MANUEL ALVAREZ Y 5 DE MAYO');
INSERT INTO `unidad_contacto` VALUES (8, '312 312 8194', 'AV. PINO SUAREZ # 95, FATIMA, C.P. 28050, COLIMA, COLIMA, REFERENCIA MANUEL ALVAREZ Y 5 DE MAYO');
INSERT INTO `unidad_contacto` VALUES (9, '312 307 2211', 'CALLE FRANCISCO I. MADERO # 200, CENTRO, C.P. 28450, COMALA, COLIMA, REFERENCIA ENTRE ESQUINA REFORMA Y CALLE IGNACIO ALDAMA');
INSERT INTO `unidad_contacto` VALUES (10, '968 661 0490', 'CLL. 1A PONIENTE NORTE # 2, CENTRO, C.P. 29620, COPAINALA, CHIAPAS, REFERENCIA CENTRAL PONIENTE Y 1A. AV NORTE ORIENTE');
INSERT INTO `unidad_contacto` VALUES (11, '312 323 0177', 'REFORMA # 3, CENTRO, C.P. 28400, COQUIMATLAN, COLIMA, REFERENCIA EMILIANO ZAPATA Y GALEANA');
INSERT INTO `unidad_contacto` VALUES (12, '321 387 0463', 'COLON # 31, CENTRO, C.P. 48740, EL GRULLO, JALISCO, REFERENCIA NIÑOS HEROES Y ALLENDE');
INSERT INTO `unidad_contacto` VALUES (13, '321 387 0146', 'AV. CIRCUNVALACIÓN PTE # 4, LA QUINTA, C.P. 48740, EL GRULLO, JALISCO, REFERENCIA CORREGIDORA Y MORELOS');
INSERT INTO `unidad_contacto` VALUES (14, '919 685 6311', 'AV. CENTRAL ORIENTE NORTE # 285, CENTRO, C.P. 29760, JITOTOL, CHIAPAS, REFERENCIA ESQ. 1A ORIENTE NORTE Y 2A. ORIENTE NORTE');
INSERT INTO `unidad_contacto` VALUES (15, '387 763 1567', 'MIGUEL ARANA ORIENTE # 63, CENTRO, C.P. 45800, JOCOTEPEC, JALISCO, REFERENCIA IGNACIO ALLENDE Y GUADALUPE VICTORIA SUR');
INSERT INTO `unidad_contacto` VALUES (16, '387 763 1238', 'AV. VICENTE GUERRERO PTE. # 97, CENTRO, C.P. 45800, JOCOTEPEC, JALISCO, REFERENCIA ESQ. INDEPENDENCIA SUR Y JOSEFA ORTIZ DE DOMINGUEZ');
INSERT INTO `unidad_contacto` VALUES (17, '467 952 0346', 'IGNACIO ZARAGOZA # 16 CENTRO C.P. 99960 JUCHIPILA, ZACATECAS');
INSERT INTO `unidad_contacto` VALUES (18, '357 384 0643', 'SOR JUANA INES DE LA CRUZ # 10, CENTRO, C.P. 48850, LA HUERTA, JALISCO, REFERENCIA IGNACIO ZARAGOZA Y BENITO JUAREZ');
INSERT INTO `unidad_contacto` VALUES (19, '357 388 1851', 'JOSE CARRANZA SILVA # 2, CENTRO, C.P. 48930, CASIMIRO CASTILLO, JALISCO, REFERENCIA ESQ. PINO SUÁREZ Y MANUEL M. DIEGUEZ');
INSERT INTO `unidad_contacto` VALUES (20, ' 357 388 2345', 'JUAN ÁLVAREZ # 23, CENTRO, C.P. 48930, CASIMIRO CASTILLO, JALISCO, REFERENCIA CARRANZA SILVA Y MANUEL M. DIEGUEZ');
INSERT INTO `unidad_contacto` VALUES (21, '958 688 5899', 'BOULEVARD VIRGILIO URIBE S/N, COLONIA PUERTO ÁNGEL CENTRO, SAN PEDRO POCHUTLA, OAXACA, CP 70900');
INSERT INTO `unidad_contacto` VALUES (22, '919 688 3716', 'CALLE CENTRAL PTE # 19 COLONIA PUEBLO NUEVO, SOLISTAHUACAN CENTRO, C.P. 29750, PUEBLO NUEVO, SOLISTAHUACAN, CHIAPAS. • Entre calle Segunda Pte Nte. Y calle Primera Pte Nte (calle posterior Primera Sur Pte) ');
INSERT INTO `unidad_contacto` VALUES (23, '953 553 0315', 'CLL. COAHUILA NO. 2,  COLONIA CENTRO, PUTLA VILLA DE GUERRERO, OAXACA, C.P. 71009');
INSERT INTO `unidad_contacto` VALUES (24, '953 688 8182', 'CLL. GUERRERO S/N LOCAL 4, COLONIA CENTRO, PUTLA VILLA DE GUERRERO, OAXACA, C.P. 71009');
INSERT INTO `unidad_contacto` VALUES (25, '954 112 0081', 'CARR. COSTERA S/N, CENTRO, C.P. 71830, VILLA DE TUTUTEPEC DE MELCHOR OCAMPO, OAXACA, REFERENCIA ESQ. AV. OAXAXA Y AV. INDEPENDENCIA');
INSERT INTO `unidad_contacto` VALUES (26, '971 714 1660', 'MAZATLAN # 19, CENTRO, C.P. 70600, SALINA CRUZ, OAXACA, REFERENCIA 5 DE MAYO Y MANUEL AVILA CAMACHO');
INSERT INTO `unidad_contacto` VALUES (27, '971 720 2992', 'AV. MANUEL AVILA CAMACHO # 37, CENTRO, C.P. 70600, SALINA CRUZ, OAXACA, REFERENCIA FRONTERA Y MANZANILLO');
INSERT INTO `unidad_contacto` VALUES (28, ' 971 714 2839', 'AV. 5 DE MAYO S/N, CENTRO, C.P. 70600, SALINA CRUZ, OAXACA, REFERENCIA ESQ. ACAPULCO Y MAZATLÁN');
INSERT INTO `unidad_contacto` VALUES (29, '971 716 1039', 'CARR. TRANSISMICA S/N, DEPORTIVA, C.P. 70612, SALINA CRUZ, OAXACA, REFERENCIA RUIZ CORTINEZ Y PUEBLA');
INSERT INTO `unidad_contacto` VALUES (30, '971 714 0012', 'AV. COATZACOALCOS S/N, CENTRO, C.P. 70600, SALINA CRUZ, OAXACA, REFERENCIA ESQ. MANUEL AVILA CAMACHO Y TAMPICO');
INSERT INTO `unidad_contacto` VALUES (31, '971 6884124', 'AV. OLEODUCTO S/N, MIGUEL HIDALGO ORIENTE, C.P. 70610, SALINA CRUZ, OAXACA, REFERENCIA ESQ. BRECHA GENERAL Y LAZARO CARDENAS');
INSERT INTO `unidad_contacto` VALUES (32, '971 688 5309', 'CARRETERA SUPER TRANSISMICA NUM. EXT. S/N NUM. INT. COL. MIGUEL HIDALGO PONIENTE  DEL. O MPIO. SALINA CRUZ, CP. 70610 OAXACA , CIUDAD: SALINA CRUZ ENTRE: COLIMA / OAXACA');
INSERT INTO `unidad_contacto` VALUES (33, '971 688 1566', 'CALLE FRANCISCO CORTES # 41, CENTRO, C.P. 70786, SAN BLAS ATEMPA, OAXACA, REFERENCIA ESQUINA MATEO JIMENES Y CALLE BENITO JUAREZ');
INSERT INTO `unidad_contacto` VALUES (34, '961 656 4179', 'AV. 1A SUR PONIENTE   # 6-A, CENTRO, C.P. 29120, SAN FERNANDO, CHIAPAS, REFERENCIA CENTRAL SUR Y PRIMERA CALLE PTE. SUR');
INSERT INTO `unidad_contacto` VALUES (35, '958 584 0771', 'AV. LAZARO CARDENAS # 62, CENTRO, C.P. 70900, SAN PEDRO POCHUTLA, OAXACA, REFERENCIA JUAREZ Y FRANCISCO SARABIA');
INSERT INTO `unidad_contacto` VALUES (36, '958 584 9011', 'ALLENDE # 115 LOCAL D, CENTRO, C.P. 70900, SAN PEDRO POCHUTLA, OAXACA, REFERENCIA LAZARO CARDENAS Y CONSTITUCION');
INSERT INTO `unidad_contacto` VALUES (37, '958 584 9092', 'AV. LAZARO CARDENAS # 94, CENTRO, C.P. 70900, SAN PEDRO POCHUTLA, OAXACA, REFERENCIA AVILLAS Y CONSTITUCIÓN');
INSERT INTO `unidad_contacto` VALUES (38, '995 721 2597', 'CLL. 1RA SUR # 111, CENTRO, C.P. 70710, SANTA MARIA JALAPA DEL MARQUES, OAXACA, REFERENCIA ESQ. CENTRAL PTE. Y PRIMERA PTE.');
INSERT INTO `unidad_contacto` VALUES (39, '958 581 4365', 'AV. JUAREZ ESQUINA JUAN DE LA BARRERA, CENTRO, C.P. 70980, SANTA MARIA HUATULCO, OAXACA, REFERENCIA ESQ. JUAN DE LA BARRERA Y GUERRERO');
INSERT INTO `unidad_contacto` VALUES (40, '958 587 2614', 'BLVD. CHAHUE MZA 8 LOTE 1, SECTOR H2, C.P. 70989, SANTA CRUZ HUATULCO, OAXACA, REFERENCIA SALINA CRUZ Y SIERRA DE ZEMPOALTEPETL');
INSERT INTO `unidad_contacto` VALUES (41, '954 688 2367', 'AV. MIGUEL HIDALGO S/N, CENTRO, C.P. 71700, SANTIAGO JAMILTEPEC, OAXACA, REFERENCIA LEONA VICARIO Y PRIVADA OAXACA');
INSERT INTO `unidad_contacto` VALUES (42, '954 688 4183', 'CARRETERA COSTERA  PINOTEPA-PUERTO ESCONDIDO S/N, AVIACION, C.P. 71700, SANTIAGO JAMILTEPEC, OAXACA, REFERENCIA ENTRE ESQUINA LUIS ECHEVERRIA Y 25 DE JULIO (CARRETERA SALINA CRUZ-ACAPULCO)');
INSERT INTO `unidad_contacto` VALUES (43, '954 543 6088', 'CLL. 21A SUR LOCAL 9, CENTRO, C.P. 71600, SANTIAGO PINOTEPA NACIONAL, OAXACA, REFERENCIA 2A PONIENTE Y 4A PONIENTE');
INSERT INTO `unidad_contacto` VALUES (44, '954 688 1878', 'AV. BENITO JUÁREZ # 401, CENTRO, C.P. 71600, SANTIAGO PINOTEPA NACIONAL, OAXACA, REFERENCIA NORBERTO AGUIRRE PALANCARES Y OCTAVA SUR');
INSERT INTO `unidad_contacto` VALUES (45, '971 713 7903', 'AV. 5 DE MAYO # 1 L-1B, CENTRO, C.P. 70760, SANTO DOMINGO TEHUANTEPEC, OAXACA, REFERENCIA CARR. TRANSISMICA Y FERROCARRIL');
INSERT INTO `unidad_contacto` VALUES (46, '971 715 2902', 'AV. JUAREZ # 9, CENTRO, C.P. 70760, SANTO DOMINGO TEHUANTEPEC, OAXACA, REFERENCIA 5 DE MAYO Y MELCHOR OCAMPO');
INSERT INTO `unidad_contacto` VALUES (47, '971 715 0125', 'AV. FERROCARRIL S/N, SAN SEBASTIAN, C.P. 70760, SANTO DOMINGO TEHUANTEPEC, OAXACA, REFERENCIA ESQ. 22 DE MARZO Y MATAMOROS');
INSERT INTO `unidad_contacto` VALUES (48, '971 688 1742', 'DR. JOSE MORIN TORRES # 16, INDUSTRIAL, C.P. 70760, SANTO DOMINGO TEHUANTEPEC, OAXACA, REFERENCIA ENTRE CARRETERA TRANSISMICA Y ROBERTO E. SALAZAR');
INSERT INTO `unidad_contacto` VALUES (49, '919 685 0127', 'IGNACIO ALLENDE PONIENTE # 6, SIMOJOVEL DE ALLENDE, C.P. 29820, SIMOJOVEL, CHIAPAS, REFERENCIA ESQ. MIGUEL HIDALGO SUR Y 26 DE ABRIL');
INSERT INTO `unidad_contacto` VALUES (50, '919 685 0785', 'AV. IGNACIO ALLENDE ORIENTE S/N, SIMOJOVEL DE ALLENDE, C.P. 29820, SIMOJOVEL, CHIAPAS, REFERENCIA ESQ. 5 DE FEBRERO SUR Y 24 DE OCTUBRE');
INSERT INTO `unidad_contacto` VALUES (51, '358 416 0666', 'JUAREZ OTE # 18, CENTRO, C.P. 49650, TAMAZULA DE GORDIANO, JALISCO, REFERENCIA ESQ. GUERRERO Y NIGROMANTE');
INSERT INTO `unidad_contacto` VALUES (52, '313 324 5595', 'MARCIANO CABRERA # 13, TEPEYAC, C.P. 28110, TECOMAN, COLIMA, REFERENCIA ESQ. RODOLFO CHAVEZ CARRILO Y COLIMA');
INSERT INTO `unidad_contacto` VALUES (53, '313 324 0882', 'EMILIANO ZAPATA # 125, CENTRO, C.P. 28100, TECOMAN, COLIMA, REFERENCIA J. ANTONIO TORRES Y MORELOS');
INSERT INTO `unidad_contacto` VALUES (54, '313 125 4887', 'RUBÉN DARÍO #1549 COLONIA SOR JUANA INÉS DE LA CRUZ, CP 28134, TECOMÁN, COLIMA, ESQUINA AVENIDA CARLOS DE LA MADRID');
INSERT INTO `unidad_contacto` VALUES (55, '961 688 2044', 'CLZD. AL SUMIDERO NO. 1400, COLONIA MONTEBELLO, TUXTLA GUTIERREZ, CHIAPAS, TUXTLA GUTIERREZ, C.P. 29034');
INSERT INTO `unidad_contacto` VALUES (56, '961 613 3849', '5A AV SUR ORIENTE # 404, SAN ROQUE, C.P. 29040, TUXTLA GUTIÉRREZ, CHIAPAS, REFERENCIA ESQ. 3A OTE. SUR Y 4A OTE. SUR');
INSERT INTO `unidad_contacto` VALUES (57, '961 615 2249', 'CARR. CHICOASEN KM 1.5 # 2219, SAN ISIDRO, C.P. 29049, TUXTLA GUTIÉRREZ, CHIAPAS, REFERENCIA TULIJA Y SAN ISIDRO');
INSERT INTO `unidad_contacto` VALUES (58, ' 961 656 8625', 'BLVD. FIDEL VELAZQUEZ # 49, 24 DE JUNIO, C.P. 29000, TUXTLA GUTIÉRREZ, CHIAPAS, REFERENCIA RIO CHANCALÁ Y RIO CHICOMUSELO');
INSERT INTO `unidad_contacto` VALUES (59, '961 613 3964', 'CLL. 11VA AV. ORIENTE NORTE # 1168, CENTRO, C.P. 29000, TUXTLA GUTIÉRREZ, CHIAPAS, REFERENCIA ESQ. 3A NTE. OTE. Y AV. 2A. NTE. OTE.');
INSERT INTO `unidad_contacto` VALUES (60, '961 600 0384', 'CLL. 3A PONIENTE SUR # 443, CENTRO, C.P. 29000, TUXTLA GUTIÉRREZ, CHIAPAS, REFERENCIA TERCERA SUR PONIENTE Y CUARTA SUR PONIENTE');
INSERT INTO `unidad_contacto` VALUES (61, '961 118 7473', 'AV. DECIMA SEXTA NORTE ORIENTE NO. 466, COLONIA ASTURIAS, TUXTLA GUTIERREZ, CHIAPAS, TUXTLA GUTIERREZ, C.P. 29034 ENTRE CALLE CUARTA ORIENTE NORTE Y CALLE TERCERA ORIENTE NORTE REFERENCIAS: FRENTE A MERCADO PUBLICO MUNICIPAL DEL NORTE');
INSERT INTO `unidad_contacto` VALUES (62, '992 687 0067', 'AV. CENTRAL OTE # 6, CENTRO, C.P. 30200, VENUSTIANO CARRANZA, CHIAPAS, REFERENCIA CENTRAL SUR Y PRIMERA PTE. NTE.');
INSERT INTO `unidad_contacto` VALUES (63, '965 655 3649', '1RA. AV. SUR ORIENTE # 12, CENTRO, C.P. 30475, VILLAFLORES, CHIAPAS, REFERENCIA CALLE CENTRAL SUR Y 1RA ORIENTE');
INSERT INTO `unidad_contacto` VALUES (64, '965 688 1160', 'CALLE SEGUNDA PONIENTE S/N, CENTRO, C.P. 30470, VILLAFLORES, CHIAPAS, REFERENCIA ESQ. PRIMERA AVENIDA SUR');
INSERT INTO `unidad_contacto` VALUES (65, '965 655 3652', '1RA AV. SUR S/N, CENTRO, C.P. 30475, VILLAFLORES, CHIAPAS, REFERENCIA CALLE 6A PONIENTE Y 7A PONIENTE');
INSERT INTO `unidad_contacto` VALUES (66, '965 652 0349', 'CLL. 14A PONIENTE SUR, GUADALUPE, C.P. 30470, VILLAFLORES, CHIAPAS, REFERENCIA ESQ. 3A AV. SUR Y AV. 2A SUR');
INSERT INTO `unidad_contacto` VALUES (67, '965 652 0911', 'CLL. 1RA PONIENTE # 15, SANTA CATARINA, C.P. 30470, VILLAFLORES, CHIAPAS, REFERENCIA ESQ. CENTRAL PONIENTE Y 1A. AVENIDA NORTE');
INSERT INTO `unidad_contacto` VALUES (68, '331 257 0609', 'AV.LOPEZ MATEOS SUR # 2040, FRANCISCO SARABIA, C.P. 45236, ZAPOPAN, JALISCO, REFERENCIA SANTA ANA Y FRANCISCO VILLA');
INSERT INTO `unidad_contacto` VALUES (69, ' 333 632 6440', 'AV. CRUZ DEL SUR # 4849, LAS AGUILAS, C.P. 45081, ZAPOPAN, JALISCO, REFERENCIA ESQ. CERRO DE CUYUTLAN Y FRANCISCO VILLA');
INSERT INTO `unidad_contacto` VALUES (70, '333 624 2834', 'AV.GUADALAJARA # 1618, HOGARES DE NUEVO MEXICO, C.P. 45160, ZAPOPAN, JALISCO, REFERENCIA ESQ. AV. JUAN GIL PRECIADO Y 24 DE FEBRERO');

-- ----------------------------
-- View structure for horario_operacion
-- ----------------------------
DROP VIEW IF EXISTS `horario_operacion`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `horario_operacion` AS SELECT
	horario.id_horario,
	unidad.id_unidad,
	horario.id_operatividad, 
	operatividad.nombre as nombre_operatividad,
	horario.apertura, 
	horario.cierre
FROM
	unidad
	INNER JOIN
	horario
	ON 
		unidad.id_unidad = horario.id_unidad
	INNER JOIN
	operatividad
	ON 
		horario.id_operatividad = operatividad.id_operatividad ;

-- ----------------------------
-- Procedure structure for obtenerFolios
-- ----------------------------
DROP PROCEDURE IF EXISTS `obtenerFolios`;
delimiter ;;
CREATE PROCEDURE `obtenerFolios`(IN in_fecha DATETIME,
    IN unidad_id INT(10),
		IN inicio INT(10),
		IN fin INT(10),
    IN area_id INT(4))
BEGIN
    -- Declarar variables para las condiciones WHERE
    DECLARE whereClause VARCHAR(1000);
    SET whereClause = '';

    -- Construir la cláusula WHERE basada en los parámetros suministrados
    IF in_fecha IS NOT NULL THEN
        SET whereClause = CONCAT(whereClause, ' AND f1_0.fecha = ''', in_fecha, '''');
    END IF;

    IF unidad_id IS NOT NULL THEN
        SET whereClause = CONCAT(whereClause, ' AND f1_0.id_unidad= ''', unidad_id, '''');
    END IF;

    IF area_id IS NOT NULL THEN
        SET whereClause = CONCAT(whereClause, ' AND r1_0.id_area = ''', area_id, '''');
    END IF;

    -- Eliminar el primer 'AND' si está presente
    SET whereClause = IF(LENGTH(whereClause) > 0, SUBSTRING(whereClause FROM 5), '');

    -- Consulta dinámica para obtener las propiedades de folio
    SET @sqlQuery = CONCAT('SELECT
		
		 f1_0.id_folio,
    f1_0.agente,
    e1_0.id_estado,
    e1_0.nombre as nombre_estado,
    f1_0.fecha,
    f1_0.folio,
    f1_0.nota,
    r1_0.id_reporte,
    r1_0.id_area,
    a1_0.nombre as nombre_area,
    r1_0.nombre as nombre_reporte,
    f1_0.id_unidad,
    u1_0.clave,
    u1_0.nombre as nombre_unidad
FROM
    folio f1_0
JOIN
    estado_reporte e1_0 ON e1_0.id_estado = f1_0.id_estado
JOIN
    reporte r1_0 ON r1_0.id_reporte = f1_0.id_reporte
LEFT JOIN
    area a1_0 ON a1_0.id_area = r1_0.id_area
JOIN
    unidad u1_0 ON u1_0.id_unidad = f1_0.id_unidad
WHERE ', whereClause,' ORDER BY f1_0.fecha LIMIT ',inicio,', ',fin);

    -- Ejecutar la consulta dinámica
    PREPARE dynamicQuery FROM @sqlQuery;
    EXECUTE dynamicQuery;
    DEALLOCATE PREPARE dynamicQuery;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

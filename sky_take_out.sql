/*
 Navicat Premium Data Transfer

 Source Server         : me
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : localhost:3306
 Source Schema         : sky_take_out

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 16/11/2023 17:03:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '收货人',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认 0 否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '地址簿' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES (2, 4, '熊鳚貎', '0', '18758485558', '11', '北京市', '1101', '市辖区', '110102', '西城区', '殡仪馆', '1', 1);
INSERT INTO `address_book` VALUES (3, 4, '熊维尼', '0', '18758585555', '11', '北京市', '1101', '市辖区', '110102', '西城区', '殡仪馆', '1', 0);
INSERT INTO `address_book` VALUES (4, 4, '熊维尼', '0', '18758585555', '11', '北京市', '1101', '市辖区', '110102', '西城区', '殡仪馆', '1', 0);
INSERT INTO `address_book` VALUES (5, 4, '熊维尼', '0', '18758585555', '11', '北京市', '1101', '市辖区', '110102', '西城区', '殡仪馆', '3', 0);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(0) NULL DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '分类名称',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '顺序',
  `status` int(0) NULL DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(0) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_category_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品及套餐分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (11, 1, '酒水饮料', 10, 1, '2022-06-09 22:09:18', '2022-06-09 22:09:18', 1, 1);
INSERT INTO `category` VALUES (12, 1, '传统主食', 9, 1, '2022-06-09 22:09:32', '2022-06-09 22:18:53', 1, 1);
INSERT INTO `category` VALUES (13, 2, '人气套餐', 12, 1, '2022-06-09 22:11:38', '2022-06-10 11:04:40', 1, 1);
INSERT INTO `category` VALUES (15, 2, '商务套餐', 13, 1, '2022-06-09 22:14:10', '2022-06-10 11:04:48', 1, 1);
INSERT INTO `category` VALUES (16, 1, '蜀味烤鱼', 4, 1, '2022-06-09 22:15:37', '2023-11-05 13:28:59', 1, 1);
INSERT INTO `category` VALUES (17, 1, '蜀味牛蛙', 5, 1, '2022-06-09 22:16:14', '2022-08-31 14:39:44', 1, 1);
INSERT INTO `category` VALUES (18, 1, '特色蒸菜', 6, 1, '2022-06-09 22:17:42', '2022-06-09 22:17:42', 1, 1);
INSERT INTO `category` VALUES (19, 1, '新鲜时蔬', 7, 1, '2022-06-09 22:18:12', '2022-06-09 22:18:28', 1, 1);
INSERT INTO `category` VALUES (20, 1, '水煮鱼', 8, 1, '2022-06-09 22:22:29', '2022-06-09 22:23:45', 1, 1);
INSERT INTO `category` VALUES (21, 1, '汤类', 11, 1, '2022-06-10 10:51:47', '2022-06-10 10:51:47', 1, 1);

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint(0) NOT NULL COMMENT '菜品分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品价格',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述信息',
  `status` int(0) NULL DEFAULT 1 COMMENT '0 停售 1 起售',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(0) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dish_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (46, '王老吉', 11, 6.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', '', 1, '2022-06-09 22:40:47', '2022-06-09 22:40:47', 1, 1);
INSERT INTO `dish` VALUES (47, '北冰洋', 11, 4.00, 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/1adf860b-8868-49f1-9ee9-356e808a5d69.jpg', '还是小时候的味道', 1, '2022-06-10 09:18:49', '2022-06-10 09:18:49', 1, 1);
INSERT INTO `dish` VALUES (49, '米饭', 12, 2.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png', '精选五常大米', 1, '2022-06-10 09:30:17', '2022-06-10 09:30:17', 1, 1);
INSERT INTO `dish` VALUES (50, '馒头', 12, 1.00, 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/1adf860b-8868-49f1-9ee9-356e808a5d69.jpg', '优质面粉', 1, '2022-06-10 09:34:28', '2022-06-10 09:34:28', 1, 1);
INSERT INTO `dish` VALUES (51, '老坛酸菜鱼', 20, 56.00, 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/1adf860b-8868-49f1-9ee9-356e808a5d69.jpg', '原料：汤，草鱼，酸菜', 1, '2022-06-10 09:40:51', '2022-06-10 09:40:51', 1, 1);
INSERT INTO `dish` VALUES (52, '经典酸菜鮰鱼', 20, 66.00, 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/1adf860b-8868-49f1-9ee9-356e808a5d69.jpg', '原料：酸菜，江团，鮰鱼', 1, '2022-06-10 09:46:02', '2022-06-10 09:46:02', 1, 1);
INSERT INTO `dish` VALUES (53, '蜀味水煮草鱼', 20, 38.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', '原料：草鱼，汤', 1, '2022-06-10 09:48:37', '2022-06-10 09:48:37', 1, 1);
INSERT INTO `dish` VALUES (54, '清炒小油菜', 19, 18.00, 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/1adf860b-8868-49f1-9ee9-356e808a5d69.jpg', '原料：小油菜', 1, '2022-06-10 09:51:46', '2022-06-10 09:51:46', 1, 1);
INSERT INTO `dish` VALUES (55, '蒜蓉娃娃菜', 19, 18.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', '原料：蒜，娃娃菜', 1, '2022-06-10 09:53:37', '2022-06-10 09:53:37', 1, 1);
INSERT INTO `dish` VALUES (56, '清炒西兰花', 19, 18.00, 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/1adf860b-8868-49f1-9ee9-356e808a5d69.jpg', '原料：西兰花', 1, '2022-06-10 09:55:44', '2022-06-10 09:55:44', 1, 1);
INSERT INTO `dish` VALUES (57, '炝炒圆白菜', 19, 18.00, 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/1adf860b-8868-49f1-9ee9-356e808a5d69.jpg', '原料：圆白菜', 1, '2022-06-10 09:58:35', '2022-06-10 09:58:35', 1, 1);
INSERT INTO `dish` VALUES (58, '清蒸鲈鱼', 18, 98.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', '原料：鲈鱼', 1, '2022-06-10 10:12:28', '2022-06-10 10:12:28', 1, 1);
INSERT INTO `dish` VALUES (59, '东坡肘子', 18, 138.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', '原料：猪肘棒', 1, '2022-06-10 10:24:03', '2022-06-10 10:24:03', 1, 1);
INSERT INTO `dish` VALUES (60, '梅菜扣肉', 18, 58.00, 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/1adf860b-8868-49f1-9ee9-356e808a5d69.jpg', '原料：猪肉，梅菜', 1, '2022-06-10 10:26:03', '2022-06-10 10:26:03', 1, 1);
INSERT INTO `dish` VALUES (61, '剁椒鱼头', 18, 66.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', '原料：鲢鱼，剁椒', 1, '2022-06-10 10:28:54', '2022-06-10 10:28:54', 1, 1);
INSERT INTO `dish` VALUES (62, '金汤酸菜牛蛙', 17, 88.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7694a5d8-7938-4e9d-8b9e-2075983a2e38.png', '原料：鲜活牛蛙，酸菜', 1, '2022-06-10 10:33:05', '2022-06-10 10:33:05', 1, 1);
INSERT INTO `dish` VALUES (63, '香锅牛蛙', 17, 88.00, 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/1adf860b-8868-49f1-9ee9-356e808a5d69.jpg', '配料：鲜活牛蛙，莲藕，青笋', 1, '2022-06-10 10:35:40', '2022-06-10 10:35:40', 1, 1);
INSERT INTO `dish` VALUES (64, '馋嘴牛蛙', 17, 88.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', '配料：鲜活牛蛙，丝瓜，黄豆芽', 1, '2022-06-10 10:37:52', '2022-06-10 10:37:52', 1, 1);
INSERT INTO `dish` VALUES (65, '草鱼2斤', 16, 68.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', '原料：草鱼，黄豆芽，莲藕', 1, '2022-06-10 10:41:08', '2022-06-10 10:41:08', 1, 1);
INSERT INTO `dish` VALUES (66, '江团鱼2斤', 16, 119.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a101a1e9-8f8b-47b2-afa4-1abd47ea0a87.png', '配料：江团鱼，黄豆芽，莲藕', 1, '2022-06-10 10:42:42', '2022-06-10 10:42:42', 1, 1);
INSERT INTO `dish` VALUES (67, '鮰鱼2斤', 16, 72.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', '原料：鮰鱼，黄豆芽，莲藕', 1, '2022-06-10 10:43:56', '2022-06-10 10:43:56', 1, 1);
INSERT INTO `dish` VALUES (68, '鸡蛋汤', 21, 5.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c09a0ee8-9d19-428d-81b9-746221824113.png', '配料：鸡蛋，紫菜', 1, '2022-06-10 10:54:25', '2023-11-05 13:57:15', 1, 1);
INSERT INTO `dish` VALUES (69, '平菇豆腐汤', 21, 16.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/16d0a3d6-2253-4cfc-9b49-bf7bd9eb2ad2.png', '配料：豆腐，平菇，汪荣贵', 0, '2022-06-10 10:55:02', '2023-11-05 13:49:51', 1, 1);
INSERT INTO `dish` VALUES (70, '汪荣贵', 20, 50.00, 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/1adf860b-8868-49f1-9ee9-356e808a5d69.jpg', 'w导师！', 0, '2023-10-09 15:12:11', '2023-10-09 15:12:11', 1, 1);

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dish_id` bigint(0) NOT NULL COMMENT '菜品',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味名称',
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味数据list',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品口味关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES (40, 10, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (41, 7, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (42, 7, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]');
INSERT INTO `dish_flavor` VALUES (45, 6, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (46, 6, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (47, 5, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (48, 5, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (49, 2, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (50, 4, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (51, 3, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (52, 3, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (86, 52, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (87, 52, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (88, 51, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (89, 51, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (92, 53, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (93, 53, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (94, 54, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\"]');
INSERT INTO `dish_flavor` VALUES (95, 56, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (96, 57, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (97, 60, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (101, 66, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (102, 67, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (103, 65, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (104, 70, '甜味', '[\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (105, 70, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (106, 70, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]');
INSERT INTO `dish_flavor` VALUES (107, 70, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (112, 69, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (113, 69, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '身份证号',
  `status` int(0) NOT NULL DEFAULT 1 COMMENT '状态 0:禁用，1:启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(0) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '员工信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', 1, '2022-02-15 15:51:20', '2022-02-17 09:16:20', 10, 1);
INSERT INTO `employee` VALUES (2, '张三', '5545', 'e10adc3949ba59abbe56e057f20f883e', '18756967898', '1', '1255255', 1, '2023-09-20 09:52:07', '2023-09-20 09:52:07', 10, 10);
INSERT INTO `employee` VALUES (3, '李四二', 'lisi', 'e10adc3949ba59abbe56e057f20f883e', '18756967890', '1', '340881199810272415', 1, '2023-09-20 09:58:42', '2023-09-27 10:38:08', 10, 1);
INSERT INTO `employee` VALUES (7, '张九', 'zhangjiuer', 'e10adc3949ba59abbe56e057f20f883e', '15866659874', '1', '340881199810258956', 1, '2023-09-20 14:37:42', '2023-09-25 16:53:29', 1, 1);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `order_id` bigint(0) NOT NULL COMMENT '订单id',
  `dish_id` bigint(0) NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(0) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int(0) NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (5, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 9, 65, NULL, '微辣', 1, 68.00);
INSERT INTO `order_detail` VALUES (6, '清蒸鲈鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', 9, 58, NULL, NULL, 1, 98.00);
INSERT INTO `order_detail` VALUES (7, '硕神同款套餐', 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/028259b5-e223-4382-8ba9-3e63f48c9bdc.jpg', 10, NULL, 32, NULL, 2, 10000.00);
INSERT INTO `order_detail` VALUES (8, '硕神同款二号套餐', 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/53ba7697-fd9c-462f-b9f1-1e699a1fea6e.jpg', 10, NULL, 33, NULL, 2, 10001.00);
INSERT INTO `order_detail` VALUES (9, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 11, 65, NULL, '不辣', 1, 68.00);
INSERT INTO `order_detail` VALUES (10, '江团鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a101a1e9-8f8b-47b2-afa4-1abd47ea0a87.png', 12, 66, NULL, '中辣', 1, 119.00);
INSERT INTO `order_detail` VALUES (11, '鸡蛋汤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c09a0ee8-9d19-428d-81b9-746221824113.png', 13, 68, NULL, NULL, 1, 5.00);
INSERT INTO `order_detail` VALUES (12, '老坛酸菜鱼', 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/1adf860b-8868-49f1-9ee9-356e808a5d69.jpg', 14, 51, NULL, '不要葱,重辣', 1, 56.00);
INSERT INTO `order_detail` VALUES (13, '金汤酸菜牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7694a5d8-7938-4e9d-8b9e-2075983a2e38.png', 15, 62, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (14, '香锅牛蛙', 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/1adf860b-8868-49f1-9ee9-356e808a5d69.jpg', 15, 63, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (15, '王老吉', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', 16, 46, NULL, NULL, 1, 6.00);
INSERT INTO `order_detail` VALUES (16, '北冰洋', 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/1adf860b-8868-49f1-9ee9-356e808a5d69.jpg', 16, 47, NULL, NULL, 4, 4.00);
INSERT INTO `order_detail` VALUES (17, '清蒸鲈鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', 17, 58, NULL, NULL, 1, 98.00);
INSERT INTO `order_detail` VALUES (18, '东坡肘子', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', 17, 59, NULL, NULL, 1, 138.00);
INSERT INTO `order_detail` VALUES (19, '梅菜扣肉', 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/1adf860b-8868-49f1-9ee9-356e808a5d69.jpg', 18, 60, NULL, '不要香菜', 1, 58.00);
INSERT INTO `order_detail` VALUES (20, '剁椒鱼头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', 18, 61, NULL, NULL, 1, 66.00);
INSERT INTO `order_detail` VALUES (21, '清蒸鲈鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', 19, 58, NULL, NULL, 2, 98.00);
INSERT INTO `order_detail` VALUES (22, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 20, 65, NULL, '不辣', 1, 68.00);
INSERT INTO `order_detail` VALUES (23, '清蒸鲈鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', 20, 58, NULL, NULL, 2, 98.00);
INSERT INTO `order_detail` VALUES (24, '清蒸鲈鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', 21, 58, NULL, NULL, 2, 98.00);
INSERT INTO `order_detail` VALUES (25, '蒜蓉娃娃菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', 22, 55, NULL, NULL, 3, 18.00);
INSERT INTO `order_detail` VALUES (26, '王老吉', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', 23, 46, NULL, NULL, 4, 6.00);
INSERT INTO `order_detail` VALUES (27, '北冰洋', 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/1adf860b-8868-49f1-9ee9-356e808a5d69.jpg', 24, 47, NULL, NULL, 3, 4.00);
INSERT INTO `order_detail` VALUES (28, '米饭', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png', 25, 49, NULL, NULL, 1, 2.00);
INSERT INTO `order_detail` VALUES (29, '馒头', 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/1adf860b-8868-49f1-9ee9-356e808a5d69.jpg', 25, 50, NULL, NULL, 1, 1.00);
INSERT INTO `order_detail` VALUES (30, '鸡蛋汤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c09a0ee8-9d19-428d-81b9-746221824113.png', 25, 68, NULL, NULL, 1, 5.00);
INSERT INTO `order_detail` VALUES (31, '炝炒圆白菜', 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/1adf860b-8868-49f1-9ee9-356e808a5d69.jpg', 25, 57, NULL, '不要葱', 1, 18.00);
INSERT INTO `order_detail` VALUES (32, '清炒西兰花', 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/1adf860b-8868-49f1-9ee9-356e808a5d69.jpg', 25, 56, NULL, '不要葱', 1, 18.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单号',
  `status` int(0) NOT NULL DEFAULT 1 COMMENT '订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消 7退款',
  `user_id` bigint(0) NOT NULL COMMENT '下单用户',
  `address_book_id` bigint(0) NOT NULL COMMENT '地址id',
  `order_time` datetime(0) NOT NULL COMMENT '下单时间',
  `checkout_time` datetime(0) NULL DEFAULT NULL COMMENT '结账时间',
  `pay_method` int(0) NOT NULL DEFAULT 1 COMMENT '支付方式 1微信,2支付宝',
  `pay_status` tinyint(0) NOT NULL DEFAULT 0 COMMENT '支付状态 0未支付 1已支付 2退款',
  `amount` decimal(10, 2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '备注',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '地址',
  `user_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '用户名称',
  `consignee` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '收货人',
  `cancel_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单取消原因',
  `rejection_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单拒绝原因',
  `cancel_time` datetime(0) NULL DEFAULT NULL COMMENT '订单取消时间',
  `estimated_delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '预计送达时间',
  `delivery_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '配送状态  1立即送出  0选择具体时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '送达时间',
  `pack_amount` int(0) NULL DEFAULT NULL COMMENT '打包费',
  `tableware_number` int(0) NULL DEFAULT NULL COMMENT '餐具数量',
  `tableware_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '餐具数量状态  1按餐量提供  0选择具体数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (9, '1699595857860', 3, 4, 2, '2023-11-10 13:57:38', '2023-11-14 13:59:20', 1, 1, 174.00, '', '18758485558', '殡仪馆', NULL, '熊鳚貎', NULL, NULL, NULL, '2023-11-10 14:57:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (10, '1699596019913', 6, 4, 2, '2023-11-10 14:00:20', NULL, 1, 0, 40012.00, '', '18758485558', '殡仪馆', NULL, '熊鳚貎', '用户取消', NULL, '2023-11-13 20:19:28', '2023-11-10 15:00:00', 0, NULL, 4, 0, 0);
INSERT INTO `orders` VALUES (11, '1699846224718', 6, 4, 2, '2023-11-13 11:30:25', '2023-11-13 11:31:52', 1, 2, 75.00, '', '18758485558', '殡仪馆', NULL, '熊鳚貎', '用户取消', NULL, '2023-11-13 20:19:57', '2023-11-13 12:30:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (12, '1699860550614', 3, 4, 2, '2023-11-13 15:29:11', '2023-11-13 15:29:12', 1, 1, 126.00, '', '18758485558', '殡仪馆', NULL, '熊鳚貎', NULL, NULL, NULL, '2023-11-13 16:29:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (13, '1699860620370', 3, 4, 2, '2023-11-13 15:30:20', '2023-11-13 15:34:55', 1, 1, 12.00, '', '18758485558', '殡仪馆', NULL, '熊鳚貎', NULL, NULL, NULL, '2023-11-13 16:30:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (14, '1699861269924', 6, 4, 2, '2023-11-13 15:41:10', '2023-11-13 15:41:19', 1, 1, 63.00, '', '18758485558', '殡仪馆', NULL, '熊鳚貎', NULL, '订单量较多，暂时无法接单', '2023-11-13 21:13:05', '2023-11-13 16:40:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (15, '1699866592332', 5, 4, 2, '2023-11-13 17:09:52', '2023-11-13 17:09:54', 1, 1, 184.00, '', '18758485558', '殡仪馆', NULL, '熊鳚貎', NULL, NULL, NULL, '2023-11-13 18:09:00', 0, '2023-11-13 21:13:12', 2, 0, 0);
INSERT INTO `orders` VALUES (16, '1699881369985', 3, 4, 2, '2023-11-13 21:16:10', '2023-11-13 21:16:52', 1, 1, 33.00, '', '18758485558', '殡仪馆', NULL, '熊鳚貎', NULL, NULL, NULL, '2023-11-13 22:16:00', 0, NULL, 5, 0, 0);
INSERT INTO `orders` VALUES (17, '1699881503859', 3, 4, 2, '2023-11-13 21:18:24', '2023-11-13 21:19:01', 1, 1, 244.00, '', '18758485558', '殡仪馆', NULL, '熊鳚貎', '订单量较多，暂时无法接单', NULL, '2023-11-13 21:18:55', '2023-11-13 22:18:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (18, '1699881698895', 3, 4, 2, '2023-11-13 21:21:39', '2023-11-13 21:22:22', 1, 1, 132.00, '', '18758485558', '殡仪馆', NULL, '熊鳚貎', NULL, NULL, NULL, '2023-11-13 22:21:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (19, '1699932018704', 1, 4, 2, '2023-11-14 11:20:19', NULL, 1, 0, 204.00, '', '18758485558', '殡仪馆', NULL, '熊鳚貎', NULL, NULL, NULL, '2023-11-14 12:20:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (20, '1699932032902', 5, 4, 2, '2023-11-14 11:20:33', '2023-11-14 11:20:34', 1, 1, 273.00, '', '18758485558', '殡仪馆', NULL, '熊鳚貎', NULL, NULL, NULL, '2023-11-14 12:20:00', 0, '2023-11-15 13:58:25', 3, 0, 0);
INSERT INTO `orders` VALUES (21, '1699932097087', 3, 4, 2, '2023-11-14 11:21:37', '2023-11-14 11:21:39', 1, 1, 204.00, '', '18758485558', '殡仪馆', NULL, '熊鳚貎', NULL, NULL, NULL, '2023-11-14 12:21:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (22, '1699932338875', 5, 4, 2, '2023-11-14 11:25:39', '2023-11-14 11:25:40', 1, 1, 63.00, '', '18758485558', '殡仪馆', NULL, '熊鳚貎', NULL, NULL, NULL, '2023-11-14 12:25:00', 0, '2023-11-15 13:58:24', 3, 0, 0);
INSERT INTO `orders` VALUES (23, '1699932421745', 3, 4, 2, '2023-11-14 11:27:02', '2023-11-14 11:27:03', 1, 1, 34.00, '', '18758485558', '殡仪馆', NULL, '熊鳚貎', NULL, NULL, NULL, '2023-11-14 12:27:00', 0, NULL, 4, 0, 0);
INSERT INTO `orders` VALUES (24, '1699941754967', 5, 4, 2, '2023-11-14 14:02:35', '2023-11-14 14:02:36', 1, 1, 21.00, '', '18758485558', '殡仪馆', NULL, '熊鳚貎', NULL, NULL, NULL, '2023-11-14 15:02:00', 0, '2023-11-15 13:58:23', 3, 0, 0);
INSERT INTO `orders` VALUES (25, '1700104434799', 5, 4, 2, '2023-11-16 11:13:55', '2023-11-16 11:13:56', 1, 1, 55.00, '', '18758485558', '殡仪馆', NULL, '熊鳚貎', NULL, NULL, NULL, '2023-11-16 12:13:00', 0, '2023-11-16 11:14:25', 5, 0, 0);

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint(0) NOT NULL COMMENT '菜品分类id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10, 2) NOT NULL COMMENT '套餐价格',
  `status` int(0) NULL DEFAULT 1 COMMENT '售卖状态 0:停售 1:起售',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(0) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_setmeal_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '套餐' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES (32, 13, '硕神同款套餐', 10000.00, 1, '好！', 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/028259b5-e223-4382-8ba9-3e63f48c9bdc.jpg', '2023-11-07 11:14:23', '2023-11-07 11:15:13', 1, 1);
INSERT INTO `setmeal` VALUES (33, 15, '硕神同款二号套餐', 10001.00, 1, '汪荣贵：好吃！！！！！', 'https://test-lsls.oss-cn-hangzhou.aliyuncs.com/53ba7697-fd9c-462f-b9f1-1e699a1fea6e.jpg', '2023-11-07 11:16:49', '2023-11-07 11:20:10', 1, 1);

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `setmeal_id` bigint(0) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_id` bigint(0) NULL DEFAULT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品单价（冗余字段）',
  `copies` int(0) NULL DEFAULT NULL COMMENT '菜品份数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '套餐菜品关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES (47, 32, 66, '江团鱼2斤', 119.00, 1);
INSERT INTO `setmeal_dish` VALUES (48, 32, 67, '鮰鱼2斤', 72.00, 1);
INSERT INTO `setmeal_dish` VALUES (49, 32, 68, '鸡蛋汤', 5.00, 1);
INSERT INTO `setmeal_dish` VALUES (50, 32, 47, '北冰洋', 4.00, 1);
INSERT INTO `setmeal_dish` VALUES (51, 32, 53, '蜀味水煮草鱼', 38.00, 1);
INSERT INTO `setmeal_dish` VALUES (52, 32, 56, '清炒西兰花', 18.00, 1);
INSERT INTO `setmeal_dish` VALUES (53, 32, 65, '草鱼2斤', 68.00, 1);
INSERT INTO `setmeal_dish` VALUES (63, 33, 60, '梅菜扣肉', 58.00, 1);
INSERT INTO `setmeal_dish` VALUES (64, 33, 61, '剁椒鱼头', 66.00, 1);
INSERT INTO `setmeal_dish` VALUES (65, 33, 59, '东坡肘子', 138.00, 1);
INSERT INTO `setmeal_dish` VALUES (66, 33, 58, '清蒸鲈鱼', 98.00, 1);
INSERT INTO `setmeal_dish` VALUES (67, 33, 65, '草鱼2斤', 68.00, 1);
INSERT INTO `setmeal_dish` VALUES (68, 33, 66, '江团鱼2斤', 119.00, 1);
INSERT INTO `setmeal_dish` VALUES (69, 33, 67, '鮰鱼2斤', 72.00, 1);
INSERT INTO `setmeal_dish` VALUES (70, 33, 68, '鸡蛋汤', 5.00, 1);
INSERT INTO `setmeal_dish` VALUES (71, 33, 46, '王老吉', 6.00, 1);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `user_id` bigint(0) NOT NULL COMMENT '主键',
  `dish_id` bigint(0) NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(0) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int(0) NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '微信用户唯一标识',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (4, 'o-A6i6zj4taZ7Swp71Sb0SCRV03s', NULL, NULL, NULL, NULL, NULL, '2023-11-02 14:32:32');

SET FOREIGN_KEY_CHECKS = 1;

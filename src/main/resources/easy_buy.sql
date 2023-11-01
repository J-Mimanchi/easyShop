/*
 Navicat Premium Data Transfer

 Source Server         : webTest
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : easy_buy

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 18/09/2022 20:25:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '服饰百货');
INSERT INTO `category` VALUES ('10', '图书音像');
INSERT INTO `category` VALUES ('2', '手机通信');
INSERT INTO `category` VALUES ('3', '生活日用');
INSERT INTO `category` VALUES ('4', '食品酒水');
INSERT INTO `category` VALUES ('5', '母婴玩具');
INSERT INTO `category` VALUES ('6', '美妆个护');
INSERT INTO `category` VALUES ('7', '电脑数码');
INSERT INTO `category` VALUES ('8', '家用电器');
INSERT INTO `category` VALUES ('9', '家装建材');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `itemid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `pid` int(8) NULL DEFAULT NULL,
  `oid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('90dd660d8d2e4a8db453ef0306c01f75', 1, 1469, 41, '300862a23e2b4ee6adf151ecc49281b9');
INSERT INTO `orderitem` VALUES ('939be7ba30da4b2fb410a81021b977ce', 1, 2699, 42, 'a98dd8f64b6d48f688d7ecf320d928e3');
INSERT INTO `orderitem` VALUES ('bbc5c87e905f4a4da8c7954dced00d6e', 1, 4288, 98, '066227afe9e74c0e97b5fd9a07d49e66');
INSERT INTO `orderitem` VALUES ('bf675d2012f04026ad86b6a18a69b249', 1, 4288, 579, '65d27a8d311b4ce38d97fe3843f5e22d');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ordertime` datetime(0) NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('066227afe9e74c0e97b5fd9a07d49e66', '2022-09-18 20:12:20', 4288, 0, '江苏省南京市江宁区', '冬奥会感想--精彩的北京冬奥会', '15951967579', 'cd7a4d98dc8d4f1e8106be8b0c5e34d7');
INSERT INTO `orders` VALUES ('300862a23e2b4ee6adf151ecc49281b9', '2022-09-18 18:54:29', 1469, 0, '?????????', '???', '15951967579', 'cd7a4d98dc8d4f1e8106be8b0c5e34d7');
INSERT INTO `orders` VALUES ('65d27a8d311b4ce38d97fe3843f5e22d', '2022-09-18 20:15:45', 4288, 0, '江苏省南京市江宁区', '冬奥会感想--精彩的北京冬奥会', '15951967579', 'cd7a4d98dc8d4f1e8106be8b0c5e34d7');
INSERT INTO `orders` VALUES ('a98dd8f64b6d48f688d7ecf320d928e3', '2022-09-18 20:05:58', 2699, 0, '???????????', '??', '222', 'cd7a4d98dc8d4f1e8106be8b0c5e34d7');

-- ----------------------------
-- Table structure for p_code
-- ----------------------------
DROP TABLE IF EXISTS `p_code`;
CREATE TABLE `p_code`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `code_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置信息类型',
  `code_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置信息名称',
  `code_desc` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置信息说明',
  `param1` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置项1',
  `param2` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `param3` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置项3',
  `param4` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置项4',
  `param5` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置项5',
  `param6` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `param7` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `param8` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置项8',
  `param9` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置项9',
  `sn` int(4) NULL DEFAULT NULL COMMENT '排序规则',
  `param10` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置项10',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_code
-- ----------------------------
INSERT INTO `p_code` VALUES (1, '1', '轮播图', '1:当前图片;2:图片位置3:背景颜色', '', 'img/circular_banner/2.jpg', '#99cce1', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `p_code` VALUES (2, '1', '轮播图', '1:当前图片;2:图片位置3:背景颜色', '', 'img/circular_banner/9.jpg', '#478FFE', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO `p_code` VALUES (3, '1', '轮播图', '1:当前图片;2:图片位置3:背景颜色', '', 'img/circular_banner/3.jpg', '#9D5CFE', NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL);
INSERT INTO `p_code` VALUES (4, '1', '轮播图', '1:当前图片;2:图片位置3:背景颜色', '', 'img/circular_banner/4.jpg', '#FFFFFF', NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL);
INSERT INTO `p_code` VALUES (5, '1', '轮播图', '1:当前图片;2:图片位置3:背景颜色', 'active', 'img/circular_banner/5.jpg', '#EBEFFB', NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO `p_code` VALUES (10, '2', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '1F&nbsp;&nbsp;服饰百货', '1', 'img/1floor/1f_3_1.jpg', '', 'img/1floor/1f_1.jpg', '', 'floor1', NULL, NULL, 1, NULL);
INSERT INTO `p_code` VALUES (11, '2', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '2F&nbsp;&nbsp;手机通信', '2', 'img/2floor/2f_3_1.jpg', '', 'img/2floor/2f_1.jpg', '', 'floor2', NULL, NULL, 2, NULL);
INSERT INTO `p_code` VALUES (12, '2', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '3F&nbsp;&nbsp;生活日用', '3', 'img/3floor/3f_3_1.jpg', '', 'img/3floor/3f_1.jpg', '', 'floor3', NULL, NULL, 3, NULL);
INSERT INTO `p_code` VALUES (13, '2', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '4F&nbsp;&nbsp;食品酒水', '4', 'img/4floor/4f_3_1.jpg', '', 'img/4floor/4f_1.jpg', '', 'floor4', NULL, NULL, 4, NULL);
INSERT INTO `p_code` VALUES (14, '2', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '5F&nbsp;&nbsp;母婴玩具', '5', 'img/5floor/5f_3_1.jpg', '', 'img/5floor/5f_1.jpg', '', 'floor5', NULL, NULL, 5, NULL);
INSERT INTO `p_code` VALUES (15, '2', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '6F&nbsp;&nbsp;美妆个护', '6', 'img/6floor/6f_3_1.jpg', '', 'img/6floor/6f_1.jpg', '', 'floor6', NULL, NULL, 6, NULL);
INSERT INTO `p_code` VALUES (16, '2', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '7F&nbsp;&nbsp;电脑数码', '7', 'img/7floor/7f_3_1.jpg', '', 'img/7floor/7f_1.jpg', '', 'floor7', NULL, NULL, 7, NULL);
INSERT INTO `p_code` VALUES (17, '2', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '8F&nbsp;&nbsp;家用电器', '8', 'img/8floor/8f_3_1.jpg', '', 'img/8floor/8f_1.jpg', '', 'floor8', NULL, NULL, 8, NULL);
INSERT INTO `p_code` VALUES (18, '2', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '9F&nbsp;&nbsp;家装建材', '9', 'img/9floor/9f_3_1.jpg', '', 'img/9floor/9f_1.jpg', '', 'floor9', NULL, NULL, 9, NULL);
INSERT INTO `p_code` VALUES (19, '2', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '10F&nbsp;&nbsp;图书音像', '10', 'img/10floor/10f_3_1.jpg', '', 'img/10floor/10f_1.jpg', '', 'floor10', NULL, NULL, 10, NULL);
INSERT INTO `p_code` VALUES (20, '4', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '1F&nbsp;&nbsp;服饰百货', '1', 'img/go_left/1.jpg', NULL, 'img/go_right/01.jpg', NULL, 'floor1', NULL, NULL, 1, NULL);
INSERT INTO `p_code` VALUES (21, '4', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '2F&nbsp;&nbsp;手机通信', '2', 'img/go_left/2.jpg', NULL, 'img/go_right/02.jpg', NULL, 'floor2', NULL, NULL, 2, NULL);
INSERT INTO `p_code` VALUES (22, '4', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '3F&nbsp;&nbsp;生活日用', '3', 'img/go_left/3.jpg', NULL, 'img/go_right/03.jpg', NULL, 'floor3', NULL, NULL, 3, NULL);
INSERT INTO `p_code` VALUES (23, '4', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '4F&nbsp;&nbsp;食品酒水', '4', 'img/go_left/4.jpg', NULL, 'img/go_right/04.jpg', NULL, 'floor4', NULL, NULL, 4, NULL);
INSERT INTO `p_code` VALUES (24, '4', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '5F&nbsp;&nbsp;母婴玩具', '5', 'img/go_left/5.jpg', NULL, 'img/go_right/05.jpg', NULL, 'floor5', NULL, NULL, 5, NULL);
INSERT INTO `p_code` VALUES (25, '4', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '6F&nbsp;&nbsp;美妆个护', '6', 'img/go_left/6.jpg', NULL, 'img/go_right/06.jpg', NULL, 'floor6', NULL, NULL, 6, NULL);
INSERT INTO `p_code` VALUES (26, '4', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '7F&nbsp;&nbsp;电脑数码', '7', 'img/go_left/7.jpg', NULL, 'img/go_right/07.jpg', NULL, 'floor7', NULL, NULL, 7, NULL);
INSERT INTO `p_code` VALUES (27, '4', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '8F&nbsp;&nbsp;家用电器', '8', 'img/go_left/8.jpg', NULL, 'img/go_right/08.jpg', NULL, 'floor8', NULL, NULL, 8, NULL);
INSERT INTO `p_code` VALUES (28, '4', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '9F&nbsp;&nbsp;家装建材', '9', 'img/go_left/9.jpg', NULL, 'img/go_right/09.jpg', NULL, 'floor9', NULL, NULL, 9, NULL);
INSERT INTO `p_code` VALUES (29, '4', '楼层信息', '1:楼层名称;2:包含的商品分类;3:活动图片;4:活动链接;5:广告图片;6:广告链接;7:楼层标识;', '10F&nbsp;&nbsp;图书音像', '10', 'img/go_left/10.jpg', NULL, 'img/go_right/10.jpg', NULL, 'floor10', NULL, NULL, 10, NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` int(8) NOT NULL AUTO_INCREMENT COMMENT '商品标识',
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `market_price` double NULL DEFAULT NULL,
  `shop_price` double NULL DEFAULT NULL,
  `pimage` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pdate` datetime(0) NULL DEFAULT NULL,
  `is_hot` int(11) NULL DEFAULT NULL,
  `pdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pflag` int(11) NULL DEFAULT NULL,
  `cid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bigimage` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 595 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (31, '线衣披风', 1399, 1299, 'products/1/400/cs10001.jpg', '2022-09-18 13:39:37', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (32, '秋季风衣', 2699, 2599, 'products/1/400/cs10002.jpg', '2022-09-18 13:39:37', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (33, '收腰风衣', 2399, 2298, 'products/1/400/cs10003.jpg', '2022-09-18 13:39:37', 0, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (34, '努比亚（nubia）My 布拉格', 1899, 1799, 'products/2/130/c_0013.jpg', '2022-09-18 13:35:40', 1, '努比亚（nubia）My 布拉格 银白 移动联通4G手机 双卡双待【嗨11，下单立减100】金属机身，快速充电！布拉格相机全新体验！', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (35, '少女迷你裙', 2599, 2499, 'products/1/400/cs10004.jpg', '2022-09-18 13:39:37', 0, '华为 麦芒4 晨曦金 全网通版4G手机 双卡双待金属机身 2.5D弧面屏 指纹解锁 光学防抖', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (36, 'vivo X5M', 1899, 1799, 'products/2/130/c_0011.jpg', '2022-09-18 13:35:40', 1, 'vivo X5M 移动4G手机 双卡双待 香槟金【购机送蓝牙耳机+蓝牙自拍杆】5.0英寸大屏显示·八核双卡双待·Hi-Fi移动KTV', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (37, '大红方格外套', 4399, 4288, 'products/1/400/cs10005.jpg', '2022-09-18 13:39:37', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (38, '华为 HUAWEI Mate S 臻享版', 4200, 4087, 'products/2/130/c_0016.jpg', '2022-09-18 13:35:40', 1, '华为 HUAWEI Mate S 臻享版 手机 极昼金 移动联通双4G(高配)满星评价即返30元话费啦；买就送电源+清水套+创意手机支架；优雅弧屏，mate7升级版', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (39, '索尼(SONY) E6533 Z3+', 4099, 3999, 'products/2/130/c_0017.jpg', '2022-09-18 13:35:40', 1, '索尼(SONY) E6533 Z3+ 双卡双4G手机 防水防尘 涧湖绿索尼z3专业防水 2070万像素 移动联通双4G', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (40, 'HTC One M9+', 3599, 3499, 'products/2/130/c_0018.jpg', '2022-09-18 13:35:40', 1, 'HTC One M9+（M9pw） 金银汇 移动联通双4G手机5.2英寸，8核CPU，指纹识别，UltraPixel超像素前置相机+2000万/200万后置双镜头相机！降价特卖，惊喜不断！', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (41, '草色深深毛衣', 1599, 1469, 'products/1/400/cs20010.jpg', '2022-09-18 16:44:42', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (42, '粉红女郎', 2899, 2699, 'products/1/400/cs10010.jpg', '2022-09-18 16:44:42', 1, '中兴 AXON 天机 mini 压力屏版 B2015 华尔金 移动联通电信4G 双卡双待', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (43, '小米 红米2A 增强版 白色', 649, 549, 'products/2/130/c_0019.jpg', '2022-09-18 13:35:40', 1, '新增至2GB 内存+16GB容量！4G双卡双待，联芯 4 核 1.5GHz 处理器！', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (44, '魅族 魅蓝note2 16GB 白色', 1099, 999, 'products/2/130/c_0021.jpg', '2022-09-18 13:35:40', 1, '现货速抢，抢完即止！5.5英寸1080P分辨率屏幕，64位八核1.3GHz处理器，1300万像素摄像头，双色温双闪光灯！', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (45, '粉色少女', 2099, 1999, 'products/1/400/cs10008.jpg', '2022-09-18 13:39:37', 1, '5.1英寸全高清炫丽屏，2.5GHz四核处理器，1600万像素', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (46, 'sonim 摆裙', 1799, 1699, 'products/1/400/cs10009.jpg', '2022-09-18 13:39:37', 1, '三防智能手机 移动/联通双4G 安全 黑黄色 双4G美国军工IP69 30天长待机 3米防水防摔 北斗', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (47, '努比亚精英', 3988, 3888, 'products/1/400/cs20007.jpg', '2022-09-18 13:39:37', 1, '移动联通电信4G手机 双卡双待真正的无边框！金色尊贵版！4GB+64GB大内存！', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (48, 'Apple iPhone 6 Plus (A1524) 16GB 金色', 5188, 4988, 'products/2/130/c_0025.jpg', '2022-09-18 13:35:40', 1, 'Apple iPhone 6 Plus (A1524) 16GB 金色 移动联通电信4G手机 硬货 硬实力', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (49, 'Apple iPhone 6s (A1700) 64G 玫瑰金色', 6388, 6088, 'products/2/130/c_0026.jpg', '2022-09-18 13:35:40', 1, 'Apple iPhone 6 Plus (A1524) 16GB 金色 移动联通电信4G手机 硬货 硬实力', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (50, '三星 Galaxy Note5（N9200）32G版', 5588, 5388, 'products/2/130/c_0027.jpg', '2022-09-18 13:35:40', 1, '旗舰机型！5.7英寸大屏，4+32G内存！不一样的SPen更优化的浮窗指令！赠无线充电板！', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (51, '三星 Galaxy S6 Edge+（G9280）32G版 铂光金', 5999, 5888, 'products/2/130/c_0028.jpg', '2022-09-18 13:35:40', 1, '赠移动电源+自拍杆+三星OTG金属U盘+无线充电器+透明保护壳', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (52, 'LG G4（H818）陶瓷白 国际版', 3018, 2978, 'products/2/130/c_0029.jpg', '2022-09-18 13:35:40', 1, '李敏镐代言，F1.8大光圈1600万后置摄像头，5.5英寸2K屏，3G+32G内存，LG年度旗舰机！', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (53, '华为荣耀6', 1599, 1499, 'products/2/220/c_0003.jpg', '2022-09-18 13:35:40', 1, '荣耀 6 (H60-L01) 3GB内存标准版 黑色 移动4G手机', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (54, '微软(Microsoft) Lumia 640 LTE DS (RM-1113)', 1099, 999, 'products/2/130/c_0030.jpg', '2022-09-18 13:35:40', 1, '微软首款双网双卡双4G手机，5.0英寸高清大屏，双网双卡双4G！', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (56, '宏碁（acer）ATC705-N50 台式电脑', 2399, 2299, 'products/7/220/c_0031.jpg', '2022-09-18 12:17:56', 1, '爆款直降，满千减百，品质宏碁，特惠来袭，何必苦等11.11，早买早便宜！', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (57, 'Apple MacBook Air MJVE2CH/A 13.3英寸', 6788, 6688, 'products/7/220/c_0032.jpg', '2022-09-18 12:17:56', 1, '宽屏笔记本电脑 128GB 闪存', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (58, '联想（ThinkPad） 轻薄系列E450C(20EH0001CD)', 4399, 4199, 'products/7/220/c_0033.jpg', '2022-09-18 12:17:56', 1, '联想（ThinkPad） 轻薄系列E450C(20EH0001CD)14英寸笔记本电脑(i5-4210U 4G 500G 2G独显 Win8.1)', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (59, '联想（Lenovo）小新V3000经典版', 4599, 4499, 'products/7/220/c_0034.jpg', '2022-09-18 12:17:56', 1, '14英寸超薄笔记本电脑（i7-5500U 4G 500G+8G SSHD 2G独显 全高清屏）黑色满1000減100，狂减！火力全开，横扫3天！', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (60, '华硕（ASUS）经典系列R557LI', 3799, 3699, 'products/7/220/c_0035.jpg', '2022-09-18 12:17:56', 1, '15.6英寸笔记本电脑（i5-5200U 4G 7200转500G 2G独显 D刻 蓝牙 Win8.1 黑色）', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (61, '华硕（ASUS）X450J', 4599, 4399, 'products/7/220/c_0036.jpg', '2022-09-18 12:17:56', 1, '14英寸笔记本电脑 （i5-4200H 4G 1TB GT940M 2G独显 蓝牙4.0 D刻 Win8.1 黑色）', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (62, '戴尔（DELL）灵越 飞匣3000系列', 3399, 3299, 'products/7/220/c_0037.jpg', '2022-09-18 13:26:41', 1, ' Ins14C-4528B 14英寸笔记本（i5-5200U 4G 500G GT820M 2G独显 Win8）黑', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (64, '惠普(HP)WASD 暗影精灵', 5699, 5499, 'products/7/220/c_0038.jpg', '2022-09-18 12:17:56', 1, '15.6英寸游戏笔记本电脑(i5-6300HQ 4G 1TB+128G SSD GTX950M 4G独显 Win10)', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (65, 'Apple 配备 Retina 显示屏的 MacBook', 11299, 10288, 'products/7/220/c_0039.jpg', '2022-09-18 12:17:56', 1, 'Pro MF840CH/A 13.3英寸宽屏笔记本电脑 256GB 闪存', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (66, '联想 P1', 2199, 1999, 'products/2/220/c_0004.jpg', '2022-09-18 13:35:40', 1, '联想 P1 16G 伯爵金 移动联通4G手机充电5分钟，通话3小时！科技源于超越！品质源于沉淀！5000mAh大电池！高端商务佳配！', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (67, '机械革命（MECHREVO）MR X6S-M', 6799, 6599, 'products/7/220/c_0040.jpg', '2022-09-18 13:26:41', 1, '15.6英寸游戏本(I7-4710MQ 8G 64GSSD+1T GTX960M 2G独显 IPS屏 WIN7)黑色', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (68, '神舟（HASEE） 战神K660D-i7D2', 5699, 5499, 'products/7/220/c_0041.jpg', '2022-09-18 13:26:41', 1, '15.6英寸游戏本(i7-4710MQ 8G 1TB GTX960M 2G独显 1080P)黑色', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (70, '微星（MSI）GE62 2QC-264XCN', 6199, 5999, 'products/7/220/c_0042.jpg', '2022-09-18 12:17:56', 1, '15.6英寸游戏笔记本电脑（i5-4210H 8G 1T GTX960MG DDR5 2G 背光键盘）黑色', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (71, '雷神（ThundeRobot）G150S', 5699, 5499, 'products/7/220/c_0043.jpg', '2022-09-18 13:26:41', 1, '15.6英寸游戏本 ( i7-4710MQ 4G 500G GTX950M 2G独显 包无亮点全高清屏) 金', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (72, '惠普（HP）轻薄系列 HP', 3199, 3099, 'products/7/220/c_0044.jpg', '2022-09-18 12:17:56', 1, '15-r239TX 15.6英寸笔记本电脑（i5-5200U 4G 500G GT820M 2G独显 win8.1）金属灰', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (74, '未来人类（Terrans Force）T5', 10999, 9899, 'products/7/220/c_0045.jpg', '2022-09-18 13:26:41', 1, '15.6英寸游戏本（i7-5700HQ 16G 120G固态+1TB GTX970M 3G GDDR5独显）黑', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (75, '戴尔（DELL）Vostro 3800-R6308 台式电脑', 3299, 3199, 'products/7/220/c_0046.jpg', '2022-09-18 12:17:56', 1, '（i3-4170 4G 500G DVD 三年上门服务 Win7）黑', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (76, '联想（Lenovo）H3050 台式电脑', 5099, 4899, 'products/7/220/c_0047.jpg', '2022-09-18 12:17:56', 1, '（i5-4460 4G 500G GT720 1G独显 DVD 千兆网卡 Win10）23英寸', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (77, 'Apple iPad mini 2 ME279CH/A', 2088, 1888, 'products/7/220/c_0048.jpg', '2022-09-18 13:26:41', 1, '（配备 Retina 显示屏 7.9英寸 16G WLAN 机型 银色）', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (78, '小米（MI）7.9英寸平板', 1399, 1299, 'products/7/220/c_0049.jpg', '2022-09-18 13:26:41', 1, 'WIFI 64GB（NVIDIA Tegra K1 2.2GHz 2G 64G 2048*1536视网膜屏 800W）白色', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (79, '摩托罗拉 moto x（x+1）', 1799, 1699, 'products/2/130/c_0005.jpg', '2022-09-18 13:35:40', 1, '摩托罗拉 moto x（x+1）(XT1085) 32GB 天然竹 全网通4G手机11月11天！MOTO X震撼特惠来袭！1699元！带你玩转黑科技！天然材质，原生流畅系统！', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (80, 'Apple iPad Air 2 MGLW2CH/A', 2399, 2299, 'products/7/220/c_0050.jpg', '2022-09-18 13:26:41', 1, '（9.7英寸 16G WLAN 机型 银色）', 0, '7', 'products/7/big/1.jpg');
INSERT INTO `product` VALUES (81, '魅族 MX5 16GB 银黑色', 1899, 1799, 'products/2/130/c_0006.jpg', '2022-09-18 13:35:40', 1, '魅族 MX5 16GB 银黑色 移动联通双4G手机 双卡双待送原厂钢化膜+保护壳+耳机！5.5英寸大屏幕，3G运行内存，2070万+500万像素摄像头！长期省才是真的省！', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (82, '三星 Galaxy On7', 1499, 1398, 'products/2/130/c_0007.jpg', '2022-09-18 13:35:40', 1, '三星 Galaxy On7（G6000）昂小七 金色 全网通4G手机 双卡双待新品火爆抢购中！京东尊享千元良机！5.5英寸高清大屏！1300+500W像素！评价赢30元话费券！', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (83, 'NUU NU5', 1288, 1190, 'products/2/130/c_0008.jpg', '2022-09-18 13:35:40', 1, 'NUU NU5 16GB 移动联通双4G智能手机 双卡双待 晒单有礼 晨光金香港品牌 2.5D弧度前后钢化玻璃 随机附赠手机套+钢化贴膜 晒单送移动电源+蓝牙耳机', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (84, '乐视（Letv）乐1pro（X800）', 2399, 2299, 'products/2/130/c_0009.jpg', '2022-09-18 13:35:40', 1, '乐视（Letv）乐1pro（X800）64GB 金色 移动联通4G手机 双卡双待乐视生态UI+5.5英寸2K屏+高通8核处理器+4GB运行内存+64GB存储+1300万摄像头！', 0, '2', 'products/2/big/1.gif');
INSERT INTO `product` VALUES (94, '时尚服装线衣披风', 1399, 1299, 'products/1/400/cs20001.jpg', '2022-09-18 15:48:50', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (95, '时尚服装秋季风衣', 2699, 2599, 'products/1/400/cs20002.jpg', '2022-09-18 15:48:50', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (96, '时尚服装收腰风衣', 2399, 2298, 'products/1/400/cs20003.jpg', '2022-09-18 15:48:50', 0, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (97, '时尚服装少女迷你裙', 2599, 2499, 'products/1/400/cs20004.jpg', '2022-09-18 15:48:50', 0, '华为 麦芒4 晨曦金 全网通版4G手机 双卡双待金属机身 2.5D弧面屏 指纹解锁 光学防抖', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (98, '时尚服装大红方格外套', 4399, 4288, 'products/1/400/cs20005.jpg', '2022-09-18 15:48:50', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (99, '时尚服装粉色毛衣', 1599, 1469, 'products/1/400/cs20006.jpg', '2022-09-18 15:48:50', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (100, '时尚服装印花小鹿', 2899, 2699, 'products/1/400/cs20007.jpg', '2022-09-18 15:48:50', 1, '中兴 AXON 天机 mini 压力屏版 B2015 华尔金 移动联通电信4G 双卡双待', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (101, '时尚服装粉色少女', 2099, 1999, 'products/1/400/cs20008.jpg', '2022-09-18 15:48:50', 0, '5.1英寸全高清炫丽屏，2.5GHz四核处理器，1600万像素', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (102, '时尚服装sonim 摆裙', 1799, 1699, 'products/1/400/cs20009.jpg', '2022-09-18 15:48:50', 1, '三防智能手机 移动/联通双4G 安全 黑黄色 双4G美国军工IP69 30天长待机 3米防水防摔 北斗', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (103, '时尚服装努比亚精英', 3988, 3888, 'products/1/400/cs20007.jpg', '2022-09-18 15:48:50', 1, '移动联通电信4G手机 双卡双待真正的无边框！金色尊贵版！4GB+64GB大内存！', 0, '1', 'products/1/big/1.jpg');
INSERT INTO `product` VALUES (109, '生活日用31', 1399, 1299, 'products/3/147/13.jpg', '2022-09-18 16:03:24', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (110, '生活日用32', 2699, 2599, 'products/3/147/14.jpg', '2022-09-18 16:03:24', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (111, '生活日用33', 2399, 2298, 'products/3/147/15.jpg', '2022-09-18 16:03:24', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (112, '生活日用31', 1399, 1299, 'products/3/200/9.jpg', '2022-09-18 16:06:47', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (113, '生活日用32', 2699, 2599, 'products/3/200/10.jpg', '2022-09-18 16:06:47', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (114, '生活日用37', 4399, 4288, 'products/3/200/11.jpg', '2022-09-18 16:06:47', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (115, '生活日用41', 1599, 1469, 'products/3/200/12.jpg', '2022-09-18 16:06:47', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (119, '生活日用109', 1399, 1299, 'products/3/147/13.jpg', '2022-09-18 16:10:03', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (120, '生活日用110', 2699, 2599, 'products/3/147/14.jpg', '2022-09-18 16:10:03', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (121, '生活日用111', 2399, 2298, 'products/3/147/15.jpg', '2022-09-18 16:10:03', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (122, '生活日用112', 1399, 1299, 'products/3/200/9.jpg', '2022-09-18 16:10:03', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (123, '生活日用113', 2699, 2599, 'products/3/200/10.jpg', '2022-09-18 16:10:03', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (124, '生活日用114', 4399, 4288, 'products/3/200/11.jpg', '2022-09-18 16:10:03', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (125, '生活日用115', 1599, 1469, 'products/3/200/12.jpg', '2022-09-18 16:10:03', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (126, '食品酒水109', 1399, 1299, 'products/4/147/13.jpg', '2022-09-18 16:47:13', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (127, '食品酒水110', 2699, 2599, 'products/4/147/14.jpg', '2022-09-18 17:08:53', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (128, '食品酒水111', 2399, 2298, 'products/4/147/15.jpg', '2022-09-18 17:03:52', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (129, '食品酒水112', 1399, 1299, 'products/4/200/9.jpg', '2022-09-18 16:47:13', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (130, '食品酒水113', 2699, 2599, 'products/4/200/10.jpg', '2022-09-18 17:08:53', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (131, '食品酒水114', 4399, 4288, 'products/4/200/11.jpg', '2022-09-18 17:37:02', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (132, '食品酒水115', 1599, 1469, 'products/4/200/12.jpg', '2022-09-18 16:50:03', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (133, '食品酒水119', 1399, 1299, 'products/4/147/13.jpg', '2022-09-18 16:47:13', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (134, '食品酒水120', 2699, 2599, 'products/4/147/14.jpg', '2022-09-18 17:08:53', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (135, '食品酒水121', 2399, 2298, 'products/4/147/15.jpg', '2022-09-18 17:03:52', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (136, '食品酒水122', 1399, 1299, 'products/4/200/9.jpg', '2022-09-18 16:47:13', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (137, '食品酒水123', 2699, 2599, 'products/4/200/10.jpg', '2022-09-18 17:08:53', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (138, '食品酒水124', 4399, 4288, 'products/4/200/11.jpg', '2022-09-18 17:37:02', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (139, '食品酒水125', 1599, 1469, 'products/4/200/12.jpg', '2022-09-18 16:50:03', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (141, '食品酒水109', 1399, 1299, 'products/4/147/13.jpg', '2022-09-18 16:28:18', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (142, '食品酒水110', 2699, 2599, 'products/4/147/14.jpg', '2022-09-18 16:28:19', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (143, '食品酒水111', 2399, 2298, 'products/4/147/15.jpg', '2022-09-18 16:28:20', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (144, '食品酒水112', 1399, 1299, 'products/4/200/9.jpg', '2022-09-18 16:28:21', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (145, '食品酒水113', 2699, 2599, 'products/4/200/10.jpg', '2022-09-18 16:28:22', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (146, '食品酒水114', 4399, 4288, 'products/4/200/11.jpg', '2022-09-18 16:28:23', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (147, '食品酒水115', 1599, 1469, 'products/4/200/12.jpg', '2022-09-18 16:28:24', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (148, '食品酒水119', 1399, 1299, 'products/4/147/13.jpg', '2022-09-18 16:28:28', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (149, '食品酒水120', 2699, 2599, 'products/4/147/14.jpg', '2022-09-18 16:28:29', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (150, '食品酒水121', 2399, 2298, 'products/4/147/15.jpg', '2022-09-18 16:28:30', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (151, '食品酒水122', 1399, 1299, 'products/4/200/9.jpg', '2022-09-18 16:28:31', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (152, '食品酒水123', 2699, 2599, 'products/4/200/10.jpg', '2022-09-18 16:28:32', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (153, '食品酒水124', 4399, 4288, 'products/4/200/11.jpg', '2022-09-18 16:28:33', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (154, '食品酒水125', 1599, 1469, 'products/4/200/12.jpg', '2022-09-18 16:28:34', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (156, '食品酒水109', 1399, 1299, 'products/4/147/13.jpg', '2023-01-05 16:27:28', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (157, '食品酒水110', 2699, 2599, 'products/4/147/14.jpg', '2023-01-06 16:27:28', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (158, '食品酒水111', 2399, 2298, 'products/4/147/15.jpg', '2023-01-07 16:27:28', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (159, '食品酒水112', 1399, 1299, 'products/4/200/9.jpg', '2023-01-08 16:27:28', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (160, '食品酒水113', 2699, 2599, 'products/4/200/10.jpg', '2023-01-09 16:27:28', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (161, '食品酒水114', 4399, 4288, 'products/4/200/11.jpg', '2023-01-10 16:27:28', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (162, '食品酒水115', 1599, 1469, 'products/4/200/12.jpg', '2023-01-11 16:27:28', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (163, '食品酒水119', 1399, 1299, 'products/4/147/13.jpg', '2023-01-15 16:27:28', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (164, '食品酒水120', 2699, 2599, 'products/4/147/14.jpg', '2023-01-16 16:27:28', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (165, '食品酒水121', 2399, 2298, 'products/4/147/15.jpg', '2023-01-17 16:27:28', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (166, '食品酒水122', 1399, 1299, 'products/4/200/9.jpg', '2023-01-18 16:27:28', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (167, '食品酒水123', 2699, 2599, 'products/4/200/10.jpg', '2023-01-19 16:27:28', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (168, '食品酒水124', 4399, 4288, 'products/4/200/11.jpg', '2023-01-20 16:27:28', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (169, '食品酒水125', 1599, 1469, 'products/4/200/12.jpg', '2023-01-21 16:27:28', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '4', 'products/4/big/1.jpg');
INSERT INTO `product` VALUES (171, '母婴玩具126', 1399, 1299, 'products/5/147/13.jpg', '2022-09-18 16:31:25', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (172, '母婴玩具127', 2699, 2599, 'products/5/147/14.jpg', '2022-09-18 16:31:26', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (173, '母婴玩具128', 2399, 2298, 'products/5/147/15.jpg', '2022-09-18 16:31:27', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (174, '母婴玩具129', 1399, 1299, 'products/5/200/9.jpg', '2022-09-18 16:31:28', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (175, '母婴玩具130', 2699, 2599, 'products/5/200/10.jpg', '2022-09-18 16:31:29', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (176, '母婴玩具131', 4399, 4288, 'products/5/200/11.jpg', '2022-09-18 16:31:30', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (177, '母婴玩具132', 1599, 1469, 'products/5/200/12.jpg', '2022-09-18 16:31:31', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (178, '母婴玩具133', 1399, 1299, 'products/5/147/13.jpg', '2022-09-18 16:31:32', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (179, '母婴玩具134', 2699, 2599, 'products/5/147/14.jpg', '2022-09-18 16:31:33', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (180, '母婴玩具135', 2399, 2298, 'products/5/147/15.jpg', '2022-09-18 16:31:34', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (181, '母婴玩具136', 1399, 1299, 'products/5/200/9.jpg', '2022-09-18 16:31:35', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (182, '母婴玩具137', 2699, 2599, 'products/5/200/10.jpg', '2022-09-18 16:31:36', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (183, '母婴玩具138', 4399, 4288, 'products/5/200/11.jpg', '2022-09-18 16:31:37', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (184, '母婴玩具139', 1599, 1469, 'products/5/200/12.jpg', '2022-09-18 16:31:38', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (185, '母婴玩具141', 1399, 1299, 'products/5/147/13.jpg', '2022-09-18 16:31:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (186, '母婴玩具142', 2699, 2599, 'products/5/147/14.jpg', '2022-09-18 16:31:41', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (187, '母婴玩具143', 2399, 2298, 'products/5/147/15.jpg', '2022-09-18 16:31:42', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (188, '母婴玩具144', 1399, 1299, 'products/5/200/9.jpg', '2022-09-18 16:31:43', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (189, '母婴玩具145', 2699, 2599, 'products/5/200/10.jpg', '2022-09-18 16:31:44', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (190, '母婴玩具146', 4399, 4288, 'products/5/200/11.jpg', '2022-09-18 16:31:45', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (191, '母婴玩具147', 1599, 1469, 'products/5/200/12.jpg', '2022-09-18 16:31:46', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (192, '母婴玩具148', 1399, 1299, 'products/5/147/13.jpg', '2022-09-18 16:31:47', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (193, '母婴玩具149', 2699, 2599, 'products/5/147/14.jpg', '2022-09-18 16:31:48', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (194, '母婴玩具150', 2399, 2298, 'products/5/147/15.jpg', '2022-09-18 16:31:49', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (195, '母婴玩具151', 1399, 1299, 'products/5/200/9.jpg', '2022-09-18 16:31:50', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (196, '母婴玩具152', 2699, 2599, 'products/5/200/10.jpg', '2022-09-18 16:31:51', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (197, '母婴玩具153', 4399, 4288, 'products/5/200/11.jpg', '2022-09-18 16:31:52', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (198, '母婴玩具154', 1599, 1469, 'products/5/200/12.jpg', '2022-09-18 16:31:53', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (199, '母婴玩具156', 1399, 1299, 'products/5/147/13.jpg', '2022-09-18 16:31:55', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (200, '母婴玩具157', 2699, 2599, 'products/5/147/14.jpg', '2022-09-18 16:31:56', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (201, '母婴玩具158', 2399, 2298, 'products/5/147/15.jpg', '2022-09-18 16:31:57', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (202, '母婴玩具159', 1399, 1299, 'products/5/200/9.jpg', '2022-09-18 16:31:58', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (203, '母婴玩具160', 2699, 2599, 'products/5/200/10.jpg', '2022-09-18 16:31:59', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (204, '母婴玩具161', 4399, 4288, 'products/5/200/11.jpg', '2022-09-18 16:32:00', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (205, '母婴玩具162', 1599, 1469, 'products/5/200/12.jpg', '2022-09-18 16:32:01', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (206, '母婴玩具163', 1399, 1299, 'products/5/147/13.jpg', '2022-09-18 16:32:02', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (207, '母婴玩具164', 2699, 2599, 'products/5/147/14.jpg', '2022-09-18 16:32:03', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (208, '母婴玩具165', 2399, 2298, 'products/5/147/15.jpg', '2022-09-18 16:32:04', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (209, '母婴玩具166', 1399, 1299, 'products/5/200/9.jpg', '2022-09-18 16:32:05', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (210, '母婴玩具167', 2699, 2599, 'products/5/200/10.jpg', '2022-09-18 16:32:06', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (211, '母婴玩具168', 4399, 4288, 'products/5/200/11.jpg', '2022-09-18 16:32:07', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (212, '母婴玩具169', 1599, 1469, 'products/5/200/12.jpg', '2022-09-18 16:32:08', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '5', 'products/5/big/1.jpg');
INSERT INTO `product` VALUES (234, '美妆个护171', 1399, 1299, 'products/6/147/13.jpg', '2022-09-18 16:33:09', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (235, '美妆个护172', 2699, 2599, 'products/6/147/14.jpg', '2022-09-18 16:33:10', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (236, '美妆个护173', 2399, 2298, 'products/6/147/15.jpg', '2022-09-18 16:33:11', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (237, '美妆个护174', 1399, 1299, 'products/6/200/9.jpg', '2022-09-18 16:33:12', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (238, '美妆个护175', 2699, 2599, 'products/6/200/10.jpg', '2022-09-18 16:33:13', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (239, '美妆个护176', 4399, 4288, 'products/6/200/11.jpg', '2022-09-18 16:33:14', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (240, '美妆个护177', 1599, 1469, 'products/6/200/12.jpg', '2022-09-18 16:33:15', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (241, '美妆个护178', 1399, 1299, 'products/6/147/13.jpg', '2022-09-18 16:33:16', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (242, '美妆个护179', 2699, 2599, 'products/6/147/14.jpg', '2022-09-18 16:33:17', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (243, '美妆个护180', 2399, 2298, 'products/6/147/15.jpg', '2022-09-18 16:33:18', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (244, '美妆个护181', 1399, 1299, 'products/6/200/9.jpg', '2022-09-18 16:33:19', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (245, '美妆个护182', 2699, 2599, 'products/6/200/10.jpg', '2022-09-18 16:33:20', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (246, '美妆个护183', 4399, 4288, 'products/6/200/11.jpg', '2022-09-18 16:33:21', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (247, '美妆个护184', 1599, 1469, 'products/6/200/12.jpg', '2022-09-18 16:33:22', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (248, '美妆个护185', 1399, 1299, 'products/6/147/13.jpg', '2022-09-18 16:33:23', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (249, '美妆个护186', 2699, 2599, 'products/6/147/14.jpg', '2022-09-18 16:33:24', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (250, '美妆个护187', 2399, 2298, 'products/6/147/15.jpg', '2022-09-18 16:33:25', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (251, '美妆个护188', 1399, 1299, 'products/6/200/9.jpg', '2022-09-18 16:33:26', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (252, '美妆个护189', 2699, 2599, 'products/6/200/10.jpg', '2022-09-18 16:33:27', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (253, '美妆个护190', 4399, 4288, 'products/6/200/11.jpg', '2022-09-18 16:33:28', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (254, '美妆个护191', 1599, 1469, 'products/6/200/12.jpg', '2022-09-18 16:33:29', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (255, '美妆个护192', 1399, 1299, 'products/6/147/13.jpg', '2022-09-18 16:33:30', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (256, '美妆个护193', 2699, 2599, 'products/6/147/14.jpg', '2022-09-18 16:33:31', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (257, '美妆个护194', 2399, 2298, 'products/6/147/15.jpg', '2022-09-18 16:33:32', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (258, '美妆个护195', 1399, 1299, 'products/6/200/9.jpg', '2022-09-18 16:33:33', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (259, '美妆个护196', 2699, 2599, 'products/6/200/10.jpg', '2022-09-18 16:33:34', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (260, '美妆个护197', 4399, 4288, 'products/6/200/11.jpg', '2022-09-18 16:33:35', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (261, '美妆个护198', 1599, 1469, 'products/6/200/12.jpg', '2022-09-18 16:33:36', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (262, '美妆个护199', 1399, 1299, 'products/6/147/13.jpg', '2022-09-18 16:33:37', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (263, '美妆个护200', 2699, 2599, 'products/6/147/14.jpg', '2022-09-18 16:33:38', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (264, '美妆个护201', 2399, 2298, 'products/6/147/15.jpg', '2022-09-18 16:33:39', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (265, '美妆个护202', 1399, 1299, 'products/6/200/9.jpg', '2022-09-18 16:33:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (266, '美妆个护203', 2699, 2599, 'products/6/200/10.jpg', '2022-09-18 16:33:41', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (267, '美妆个护204', 4399, 4288, 'products/6/200/11.jpg', '2022-09-18 16:33:42', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (268, '美妆个护205', 1599, 1469, 'products/6/200/12.jpg', '2022-09-18 16:33:43', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (269, '美妆个护206', 1399, 1299, 'products/6/147/13.jpg', '2022-09-18 16:33:44', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (270, '美妆个护207', 2699, 2599, 'products/6/147/14.jpg', '2022-09-18 16:33:45', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (271, '美妆个护208', 2399, 2298, 'products/6/147/15.jpg', '2022-09-18 16:33:46', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (272, '美妆个护209', 1399, 1299, 'products/6/200/9.jpg', '2022-09-18 16:33:47', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (273, '美妆个护210', 2699, 2599, 'products/6/200/10.jpg', '2022-09-18 16:33:48', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (274, '美妆个护211', 4399, 4288, 'products/6/200/11.jpg', '2022-09-18 16:33:49', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (275, '美妆个护212', 1599, 1469, 'products/6/200/12.jpg', '2022-09-18 16:33:50', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '6', 'products/6/big/1.jpg');
INSERT INTO `product` VALUES (297, '家用电器234', 1399, 1299, 'products/8/147/13.jpg', '2022-09-18 16:35:12', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (298, '家用电器235', 2699, 2599, 'products/8/147/14.jpg', '2022-09-18 16:35:13', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (299, '家用电器236', 2399, 2298, 'products/8/147/15.jpg', '2022-09-18 16:35:14', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (300, '家用电器237', 1399, 1299, 'products/8/200/9.jpg', '2022-09-18 16:35:15', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (301, '家用电器238', 2699, 2599, 'products/8/200/10.jpg', '2022-09-18 16:35:16', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (302, '家用电器239', 4399, 4288, 'products/8/200/11.jpg', '2022-09-18 16:35:17', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (303, '家用电器240', 1599, 1469, 'products/8/200/12.jpg', '2022-09-18 16:35:18', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (304, '家用电器241', 1399, 1299, 'products/8/147/13.jpg', '2022-09-18 16:35:19', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (305, '家用电器242', 2699, 2599, 'products/8/147/14.jpg', '2022-09-18 16:35:20', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (306, '家用电器243', 2399, 2298, 'products/8/147/15.jpg', '2022-09-18 16:35:21', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (307, '家用电器244', 1399, 1299, 'products/8/200/9.jpg', '2022-09-18 16:35:22', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (308, '家用电器245', 2699, 2599, 'products/8/200/10.jpg', '2022-09-18 16:35:23', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (309, '家用电器246', 4399, 4288, 'products/8/200/11.jpg', '2022-09-18 16:35:24', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (310, '家用电器247', 1599, 1469, 'products/8/200/12.jpg', '2022-09-18 16:35:25', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (311, '家用电器248', 1399, 1299, 'products/8/147/13.jpg', '2022-09-18 16:35:26', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (312, '家用电器249', 2699, 2599, 'products/8/147/14.jpg', '2022-09-18 16:35:27', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (313, '家用电器250', 2399, 2298, 'products/8/147/15.jpg', '2022-09-18 16:35:28', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (314, '家用电器251', 1399, 1299, 'products/8/200/9.jpg', '2022-09-18 16:35:29', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (315, '家用电器252', 2699, 2599, 'products/8/200/10.jpg', '2022-09-18 16:35:30', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (316, '家用电器253', 4399, 4288, 'products/8/200/11.jpg', '2022-09-18 16:35:31', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (317, '家用电器254', 1599, 1469, 'products/8/200/12.jpg', '2022-09-18 16:35:32', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (318, '家用电器255', 1399, 1299, 'products/8/147/13.jpg', '2022-09-18 16:35:33', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (319, '家用电器256', 2699, 2599, 'products/8/147/14.jpg', '2022-09-18 16:35:34', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (320, '家用电器257', 2399, 2298, 'products/8/147/15.jpg', '2022-09-18 16:35:35', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (321, '家用电器258', 1399, 1299, 'products/8/200/9.jpg', '2022-09-18 16:35:36', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (322, '家用电器259', 2699, 2599, 'products/8/200/10.jpg', '2022-09-18 16:35:37', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (323, '家用电器260', 4399, 4288, 'products/8/200/11.jpg', '2022-09-18 16:35:38', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (324, '家用电器261', 1599, 1469, 'products/8/200/12.jpg', '2022-09-18 16:35:39', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (325, '家用电器262', 1399, 1299, 'products/8/147/13.jpg', '2022-09-18 16:35:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (326, '家用电器263', 2699, 2599, 'products/8/147/14.jpg', '2022-09-18 16:35:41', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (327, '家用电器264', 2399, 2298, 'products/8/147/15.jpg', '2022-09-18 16:35:42', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (328, '家用电器265', 1399, 1299, 'products/8/200/9.jpg', '2022-09-18 16:35:43', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (329, '家用电器266', 2699, 2599, 'products/8/200/10.jpg', '2022-09-18 16:35:44', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (330, '家用电器267', 4399, 4288, 'products/8/200/11.jpg', '2022-09-18 16:35:45', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (331, '家用电器268', 1599, 1469, 'products/8/200/12.jpg', '2022-09-18 16:35:46', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (332, '家用电器269', 1399, 1299, 'products/8/147/13.jpg', '2022-09-18 16:35:47', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (333, '家用电器270', 2699, 2599, 'products/8/147/14.jpg', '2022-09-18 16:35:48', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (334, '家用电器271', 2399, 2298, 'products/8/147/15.jpg', '2022-09-18 16:35:49', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (335, '家用电器272', 1399, 1299, 'products/8/200/9.jpg', '2022-09-18 16:35:50', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (336, '家用电器273', 2699, 2599, 'products/8/200/10.jpg', '2022-09-18 16:35:51', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (337, '家用电器274', 4399, 4288, 'products/8/200/11.jpg', '2022-09-18 16:35:52', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (338, '家用电器275', 1599, 1469, 'products/8/200/12.jpg', '2022-09-18 16:35:53', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '8', 'products/8/big/1.jpg');
INSERT INTO `product` VALUES (360, '家装建材297', 1399, 1299, 'products/9/147/13.jpg', '2022-09-18 21:30:00', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (361, '家装建材298', 2699, 2599, 'products/9/147/14.jpg', '2022-09-18 21:31:00', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (362, '家装建材299', 2399, 2298, 'products/9/147/15.jpg', '2022-09-18 21:32:00', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (363, '家装建材300', 1399, 1299, 'products/9/200/9.jpg', '2022-09-18 21:33:00', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (364, '家装建材301', 2699, 2599, 'products/9/200/10.jpg', '2022-09-18 21:34:00', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (365, '家装建材302', 4399, 4288, 'products/9/200/11.jpg', '2022-09-18 21:35:00', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (366, '家装建材303', 1599, 1469, 'products/9/200/12.jpg', '2022-09-18 21:36:00', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (367, '家装建材304', 1399, 1299, 'products/9/147/13.jpg', '2022-09-18 21:37:00', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (368, '家装建材305', 2699, 2599, 'products/9/147/14.jpg', '2022-09-18 21:38:00', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (369, '家装建材306', 2399, 2298, 'products/9/147/15.jpg', '2022-09-18 21:39:00', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (370, '家装建材307', 1399, 1299, 'products/9/200/9.jpg', '2022-09-18 21:40:00', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (371, '家装建材308', 2699, 2599, 'products/9/200/10.jpg', '2022-09-18 21:41:00', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (372, '家装建材309', 4399, 4288, 'products/9/200/11.jpg', '2022-09-18 21:42:00', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (373, '家装建材310', 1599, 1469, 'products/9/200/12.jpg', '2022-09-18 21:43:00', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (374, '家装建材311', 1399, 1299, 'products/9/147/13.jpg', '2022-09-18 21:44:00', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (375, '家装建材312', 2699, 2599, 'products/9/147/14.jpg', '2022-09-18 21:45:00', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (376, '家装建材313', 2399, 2298, 'products/9/147/15.jpg', '2022-09-18 21:46:00', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (377, '家装建材314', 1399, 1299, 'products/9/200/9.jpg', '2022-09-18 21:47:00', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (378, '家装建材315', 2699, 2599, 'products/9/200/10.jpg', '2022-09-18 21:48:00', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (379, '家装建材316', 4399, 4288, 'products/9/200/11.jpg', '2022-09-18 21:49:00', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (380, '家装建材317', 1599, 1469, 'products/9/200/12.jpg', '2022-09-18 21:50:00', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (381, '家装建材318', 1399, 1299, 'products/9/147/13.jpg', '2022-09-18 21:51:00', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (382, '家装建材319', 2699, 2599, 'products/9/147/14.jpg', '2022-09-18 21:52:00', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (383, '家装建材320', 2399, 2298, 'products/9/147/15.jpg', '2022-09-18 21:53:00', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (384, '家装建材321', 1399, 1299, 'products/9/200/9.jpg', '2022-09-18 21:54:00', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (385, '家装建材322', 2699, 2599, 'products/9/200/10.jpg', '2022-09-18 21:55:00', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (386, '家装建材323', 4399, 4288, 'products/9/200/11.jpg', '2022-09-18 21:56:00', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (387, '家装建材324', 1599, 1469, 'products/9/200/12.jpg', '2022-09-18 21:57:00', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (388, '家装建材325', 1399, 1299, 'products/9/147/13.jpg', '2022-09-18 21:58:00', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (389, '家装建材326', 2699, 2599, 'products/9/147/14.jpg', '2022-09-18 21:59:00', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (390, '家装建材327', 2399, 2298, 'products/9/147/15.jpg', '2022-09-18 22:00:00', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (391, '家装建材328', 1399, 1299, 'products/9/200/9.jpg', '2022-09-18 22:01:00', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (392, '家装建材329', 2699, 2599, 'products/9/200/10.jpg', '2022-09-18 22:02:00', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (393, '家装建材330', 4399, 4288, 'products/9/200/11.jpg', '2022-09-18 22:03:00', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (394, '家装建材331', 1599, 1469, 'products/9/200/12.jpg', '2022-09-18 22:04:00', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (395, '家装建材332', 1399, 1299, 'products/9/147/13.jpg', '2022-09-18 22:05:00', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (396, '家装建材333', 2699, 2599, 'products/9/147/14.jpg', '2022-09-18 22:06:00', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (397, '家装建材334', 2399, 2298, 'products/9/147/15.jpg', '2022-09-18 22:07:00', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (398, '家装建材335', 1399, 1299, 'products/9/200/9.jpg', '2022-09-18 22:08:00', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (399, '家装建材336', 2699, 2599, 'products/9/200/10.jpg', '2022-09-18 22:09:00', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (400, '家装建材337', 4399, 4288, 'products/9/200/11.jpg', '2022-09-18 22:10:00', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (401, '家装建材338', 1599, 1469, 'products/9/200/12.jpg', '2022-09-18 22:11:00', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '9', 'products/9/big/1.jpg');
INSERT INTO `product` VALUES (423, '图书音像360', 1399, 1299, 'products/10/147/13.jpg', '2022-09-18 22:33:48', 0, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (424, '图书音像361', 2699, 2599, 'products/10/147/14.jpg', '2022-09-18 22:34:48', 0, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (425, '图书音像362', 2399, 2298, 'products/10/147/15.jpg', '2022-09-18 22:35:48', 0, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (426, '图书音像363', 1399, 1299, 'products/10/200/9.jpg', '2022-09-18 22:36:48', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (427, '图书音像364', 2699, 2599, 'products/10/200/10.jpg', '2022-09-18 22:37:48', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (428, '图书音像365', 4399, 4288, 'products/10/200/11.jpg', '2022-09-18 22:38:48', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (429, '图书音像366', 1599, 1469, 'products/10/200/12.jpg', '2022-09-18 22:39:48', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (430, '图书音像367', 1399, 1299, 'products/10/147/13.jpg', '2022-09-18 22:40:48', 0, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (431, '图书音像368', 2699, 2599, 'products/10/147/14.jpg', '2022-09-18 22:41:48', 0, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (432, '图书音像369', 2399, 2298, 'products/10/147/15.jpg', '2022-09-18 22:42:48', 0, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (433, '图书音像370', 1399, 1299, 'products/10/200/9.jpg', '2022-09-18 22:43:48', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (434, '图书音像371', 2699, 2599, 'products/10/200/10.jpg', '2022-09-18 22:44:48', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (435, '图书音像372', 4399, 4288, 'products/10/200/11.jpg', '2022-09-18 22:45:48', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (436, '图书音像373', 1599, 1469, 'products/10/200/12.jpg', '2022-09-18 22:46:48', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (437, '图书音像374', 1399, 1299, 'products/10/147/13.jpg', '2022-09-18 22:47:48', 0, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (438, '图书音像375', 2699, 2599, 'products/10/147/14.jpg', '2022-09-18 22:48:48', 0, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (439, '图书音像376', 2399, 2298, 'products/10/147/15.jpg', '2022-09-18 22:49:48', 0, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (440, '图书音像377', 1399, 1299, 'products/10/200/9.jpg', '2022-09-18 22:50:48', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (441, '图书音像378', 2699, 2599, 'products/10/200/10.jpg', '2022-09-18 22:51:48', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (442, '图书音像379', 4399, 4288, 'products/10/200/11.jpg', '2022-09-18 22:52:48', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (443, '图书音像380', 1599, 1469, 'products/10/200/12.jpg', '2022-09-18 22:53:48', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (444, '图书音像381', 1399, 1299, 'products/10/147/13.jpg', '2022-09-18 22:54:48', 0, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (445, '图书音像382', 2699, 2599, 'products/10/147/14.jpg', '2022-09-18 22:55:48', 0, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (446, '图书音像383', 2399, 2298, 'products/10/147/15.jpg', '2022-09-18 22:56:48', 0, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (447, '图书音像384', 1399, 1299, 'products/10/200/9.jpg', '2022-09-18 22:57:48', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (448, '图书音像385', 2699, 2599, 'products/10/200/10.jpg', '2022-09-18 22:58:48', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (449, '图书音像386', 4399, 4288, 'products/10/200/11.jpg', '2022-09-18 22:59:48', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (450, '图书音像387', 1599, 1469, 'products/10/200/12.jpg', '2022-09-18 23:00:48', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (451, '图书音像388', 1399, 1299, 'products/10/147/13.jpg', '2022-09-18 23:01:48', 0, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (452, '图书音像389', 2699, 2599, 'products/10/147/14.jpg', '2022-09-18 23:02:48', 0, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (453, '图书音像390', 2399, 2298, 'products/10/147/15.jpg', '2022-09-18 23:03:48', 0, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (454, '图书音像391', 1399, 1299, 'products/10/200/9.jpg', '2022-09-18 23:04:48', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (455, '图书音像392', 2699, 2599, 'products/10/200/10.jpg', '2022-09-18 23:05:48', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (456, '图书音像393', 4399, 4288, 'products/10/200/11.jpg', '2022-09-18 23:06:48', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (457, '图书音像394', 1599, 1469, 'products/10/200/12.jpg', '2022-09-18 23:07:48', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (458, '图书音像395', 1399, 1299, 'products/10/147/13.jpg', '2022-09-18 23:08:48', 0, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (459, '图书音像396', 2699, 2599, 'products/10/147/14.jpg', '2022-09-18 23:09:48', 0, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (460, '图书音像397', 2399, 2298, 'products/10/147/15.jpg', '2022-09-18 23:10:48', 0, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (461, '图书音像398', 1399, 1299, 'products/10/200/9.jpg', '2022-09-18 23:11:48', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (462, '图书音像399', 2699, 2599, 'products/10/200/10.jpg', '2022-09-18 23:12:48', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (463, '图书音像400', 4399, 4288, 'products/10/200/11.jpg', '2022-09-18 23:13:48', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (464, '图书音像401', 1599, 1469, 'products/10/200/12.jpg', '2022-09-18 23:14:48', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '10', 'products/10/big/1.jpg');
INSERT INTO `product` VALUES (486, '生活日用109', 1399, 1299, 'products/3/147/13.jpg', '2022-09-18 20:18:12', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (487, '生活日用110', 2699, 2599, 'products/3/147/14.jpg', '2022-09-18 20:19:12', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (488, '生活日用111', 2399, 2298, 'products/3/147/15.jpg', '2022-09-18 20:20:12', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (489, '生活日用112', 1399, 1299, 'products/3/200/9.jpg', '2022-09-18 20:21:12', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (490, '生活日用113', 2699, 2599, 'products/3/200/10.jpg', '2022-09-18 20:22:12', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (491, '生活日用114', 4399, 4288, 'products/3/200/11.jpg', '2022-09-18 20:23:12', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (492, '生活日用115', 1599, 1469, 'products/3/200/12.jpg', '2022-09-18 20:24:12', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (493, '生活日用119', 1399, 1299, 'products/3/147/13.jpg', '2022-09-18 20:28:12', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (494, '生活日用120', 2699, 2599, 'products/3/147/14.jpg', '2022-09-18 20:29:12', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (495, '生活日用121', 2399, 2298, 'products/3/147/15.jpg', '2022-09-18 20:30:12', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (496, '生活日用122', 1399, 1299, 'products/3/200/9.jpg', '2022-09-18 20:31:12', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (497, '生活日用123', 2699, 2599, 'products/3/200/10.jpg', '2022-09-18 20:32:12', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (498, '生活日用124', 4399, 4288, 'products/3/200/11.jpg', '2022-09-18 20:33:12', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (499, '生活日用125', 1599, 1469, 'products/3/200/12.jpg', '2022-09-18 20:34:12', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (501, '生活日用109', 1399, 1299, 'products/3/147/13.jpg', '2022-09-18 20:18:22', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (502, '生活日用110', 2699, 2599, 'products/3/147/14.jpg', '2022-09-18 20:19:22', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (503, '生活日用111', 2399, 2298, 'products/3/147/15.jpg', '2022-09-18 20:20:22', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (504, '生活日用112', 1399, 1299, 'products/3/200/9.jpg', '2022-09-18 20:21:22', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (505, '生活日用113', 2699, 2599, 'products/3/200/10.jpg', '2022-09-18 20:22:22', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (506, '生活日用114', 4399, 4288, 'products/3/200/11.jpg', '2022-09-18 20:23:22', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (507, '生活日用115', 1599, 1469, 'products/3/200/12.jpg', '2022-09-18 20:24:22', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (508, '生活日用119', 1399, 1299, 'products/3/147/13.jpg', '2022-09-18 20:28:22', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (509, '生活日用120', 2699, 2599, 'products/3/147/14.jpg', '2022-09-18 20:29:22', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (510, '生活日用121', 2399, 2298, 'products/3/147/15.jpg', '2022-09-18 20:30:22', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (511, '生活日用122', 1399, 1299, 'products/3/200/9.jpg', '2022-09-18 20:31:22', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (512, '生活日用123', 2699, 2599, 'products/3/200/10.jpg', '2022-09-18 20:32:22', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (513, '生活日用124', 4399, 4288, 'products/3/200/11.jpg', '2022-09-18 20:33:22', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (514, '生活日用125', 1599, 1469, 'products/3/200/12.jpg', '2022-09-18 20:34:22', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (515, '生活日用486', 1399, 1299, 'products/3/147/13.jpg', '2022-09-19 02:35:22', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (516, '生活日用487', 2699, 2599, 'products/3/147/14.jpg', '2022-09-19 02:36:22', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (517, '生活日用488', 2399, 2298, 'products/3/147/15.jpg', '2022-09-19 02:37:22', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (518, '生活日用489', 1399, 1299, 'products/3/200/9.jpg', '2022-09-19 02:38:22', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (519, '生活日用490', 2699, 2599, 'products/3/200/10.jpg', '2022-09-19 02:39:22', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (520, '生活日用491', 4399, 4288, 'products/3/200/11.jpg', '2022-09-19 02:40:22', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (521, '生活日用492', 1599, 1469, 'products/3/200/12.jpg', '2022-09-19 02:41:22', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (522, '生活日用493', 1399, 1299, 'products/3/147/13.jpg', '2022-09-19 02:42:22', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (523, '生活日用494', 2699, 2599, 'products/3/147/14.jpg', '2022-09-19 02:43:22', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (524, '生活日用495', 2399, 2298, 'products/3/147/15.jpg', '2022-09-19 02:44:22', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (525, '生活日用496', 1399, 1299, 'products/3/200/9.jpg', '2022-09-19 02:45:22', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (526, '生活日用497', 2699, 2599, 'products/3/200/10.jpg', '2022-09-19 02:46:22', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (527, '生活日用498', 4399, 4288, 'products/3/200/11.jpg', '2022-09-19 02:47:22', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (528, '生活日用499', 1599, 1469, 'products/3/200/12.jpg', '2022-09-19 02:48:22', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (532, '生活日用109', 1399, 1299, 'products/3/147/13.jpg', '2022-09-18 20:18:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (533, '生活日用110', 2699, 2599, 'products/3/147/14.jpg', '2022-09-18 20:19:40', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (534, '生活日用111', 2399, 2298, 'products/3/147/15.jpg', '2022-09-18 20:20:40', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (535, '生活日用112', 1399, 1299, 'products/3/200/9.jpg', '2022-09-18 20:21:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (536, '生活日用113', 2699, 2599, 'products/3/200/10.jpg', '2022-09-18 20:22:40', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (537, '生活日用114', 4399, 4288, 'products/3/200/11.jpg', '2022-09-18 20:23:40', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (538, '生活日用115', 1599, 1469, 'products/3/200/12.jpg', '2022-09-18 20:24:40', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (539, '生活日用119', 1399, 1299, 'products/3/147/13.jpg', '2022-09-18 20:28:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (540, '生活日用120', 2699, 2599, 'products/3/147/14.jpg', '2022-09-18 20:29:40', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (541, '生活日用121', 2399, 2298, 'products/3/147/15.jpg', '2022-09-18 20:30:40', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (542, '生活日用122', 1399, 1299, 'products/3/200/9.jpg', '2022-09-18 20:31:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (543, '生活日用123', 2699, 2599, 'products/3/200/10.jpg', '2022-09-18 20:32:40', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (544, '生活日用124', 4399, 4288, 'products/3/200/11.jpg', '2022-09-18 20:33:40', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (545, '生活日用125', 1599, 1469, 'products/3/200/12.jpg', '2022-09-18 20:34:40', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (546, '生活日用486', 1399, 1299, 'products/3/147/13.jpg', '2022-09-19 02:35:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (547, '生活日用487', 2699, 2599, 'products/3/147/14.jpg', '2022-09-19 02:36:40', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (548, '生活日用488', 2399, 2298, 'products/3/147/15.jpg', '2022-09-19 02:37:40', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (549, '生活日用489', 1399, 1299, 'products/3/200/9.jpg', '2022-09-19 02:38:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (550, '生活日用490', 2699, 2599, 'products/3/200/10.jpg', '2022-09-19 02:39:40', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (551, '生活日用491', 4399, 4288, 'products/3/200/11.jpg', '2022-09-19 02:40:40', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (552, '生活日用492', 1599, 1469, 'products/3/200/12.jpg', '2022-09-19 02:41:40', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (553, '生活日用493', 1399, 1299, 'products/3/147/13.jpg', '2022-09-19 02:42:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (554, '生活日用494', 2699, 2599, 'products/3/147/14.jpg', '2022-09-19 02:43:40', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (555, '生活日用495', 2399, 2298, 'products/3/147/15.jpg', '2022-09-19 02:44:40', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (556, '生活日用496', 1399, 1299, 'products/3/200/9.jpg', '2022-09-19 02:45:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (557, '生活日用497', 2699, 2599, 'products/3/200/10.jpg', '2022-09-19 02:46:40', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (558, '生活日用498', 4399, 4288, 'products/3/200/11.jpg', '2022-09-19 02:47:40', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (559, '生活日用499', 1599, 1469, 'products/3/200/12.jpg', '2022-09-19 02:48:40', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (560, '生活日用501', 1399, 1299, 'products/3/147/13.jpg', '2022-09-19 02:50:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (561, '生活日用502', 2699, 2599, 'products/3/147/14.jpg', '2022-09-19 02:51:40', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (562, '生活日用503', 2399, 2298, 'products/3/147/15.jpg', '2022-09-19 02:52:40', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (563, '生活日用504', 1399, 1299, 'products/3/200/9.jpg', '2022-09-19 02:53:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (564, '生活日用505', 2699, 2599, 'products/3/200/10.jpg', '2022-09-19 02:54:40', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (565, '生活日用506', 4399, 4288, 'products/3/200/11.jpg', '2022-09-19 02:55:40', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (566, '生活日用507', 1599, 1469, 'products/3/200/12.jpg', '2022-09-19 02:56:40', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (567, '生活日用508', 1399, 1299, 'products/3/147/13.jpg', '2022-09-19 02:57:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (568, '生活日用509', 2699, 2599, 'products/3/147/14.jpg', '2022-09-19 02:58:40', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (569, '生活日用510', 2399, 2298, 'products/3/147/15.jpg', '2022-09-19 02:59:40', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (570, '生活日用511', 1399, 1299, 'products/3/200/9.jpg', '2022-09-19 03:00:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (571, '生活日用512', 2699, 2599, 'products/3/200/10.jpg', '2022-09-19 03:01:40', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (572, '生活日用513', 4399, 4288, 'products/3/200/11.jpg', '2022-09-19 03:02:40', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (573, '生活日用514', 1599, 1469, 'products/3/200/12.jpg', '2022-09-19 03:03:40', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (574, '生活日用515', 1399, 1299, 'products/3/147/13.jpg', '2022-09-19 03:04:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (575, '生活日用516', 2699, 2599, 'products/3/147/14.jpg', '2022-09-19 03:05:40', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (576, '生活日用517', 2399, 2298, 'products/3/147/15.jpg', '2022-09-19 03:06:40', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (577, '生活日用518', 1399, 1299, 'products/3/200/9.jpg', '2022-09-19 03:07:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (578, '生活日用519', 2699, 2599, 'products/3/200/10.jpg', '2022-09-19 03:08:40', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (579, '生活日用520', 4399, 4288, 'products/3/200/11.jpg', '2022-09-19 03:09:40', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (580, '生活日用521', 1599, 1469, 'products/3/200/12.jpg', '2022-09-19 03:10:40', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (581, '生活日用522', 1399, 1299, 'products/3/147/13.jpg', '2022-09-19 03:11:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (582, '生活日用523', 2699, 2599, 'products/3/147/14.jpg', '2022-09-19 03:12:40', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (583, '生活日用524', 2399, 2298, 'products/3/147/15.jpg', '2022-09-19 03:13:40', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (584, '生活日用525', 1399, 1299, 'products/3/200/9.jpg', '2022-09-19 03:14:40', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (585, '生活日用526', 2699, 2599, 'products/3/200/10.jpg', '2022-09-19 03:15:40', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (586, '生活日用527', 4399, 4288, 'products/3/200/11.jpg', '2022-09-19 03:16:40', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '3', 'products/3/big/1.jpg');
INSERT INTO `product` VALUES (587, '生活日用528', 1599, 1469, 'products/3/200/12.jpg', '2022-09-19 03:17:40', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '3', 'products/3/big/1.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('519195c30e194d4dbd301be97f0066f5', 'cc', 'E10ADC3949BA59ABBE56E057F20F883E', '风力发电机', '289215956@qq.com', NULL, NULL, '0', 0, '73bdac6bfc3b4e8c8618fade4241793d');
INSERT INTO `user` VALUES ('cd7a4d98dc8d4f1e8106be8b0c5e34d7', 'cc1', 'E10ADC3949BA59ABBE56E057F20F883E', '冬奥会感想--精彩的北京冬奥会', '289215956@qq.com', '15951967579', NULL, '0', 1, 'd924cedddc8b412e86734efc9645e851');

SET FOREIGN_KEY_CHECKS = 1;

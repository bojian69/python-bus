/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 127.0.0.1
 Source Database       : xingzai-test

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : utf-8

 Date: 04/22/2025 15:24:58 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `bus_customer`
-- ----------------------------
DROP TABLE IF EXISTS `bus_customer`;
CREATE TABLE `bus_customer` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `customername` varchar(255) NOT NULL COMMENT '客户名称',
  `zip` varchar(255) DEFAULT NULL COMMENT '邮政编码',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `telephone` varchar(255) NOT NULL COMMENT '固定电话',
  `connectionversion` varchar(255) DEFAULT NULL COMMENT '连接版本',
  `phone` varchar(255) NOT NULL COMMENT '移动电话',
  `bank` varchar(255) DEFAULT NULL COMMENT '开户银行',
  `account` varchar(255) DEFAULT NULL COMMENT '银行账户',
  `email` varchar(255) DEFAULT NULL COMMENT '电子邮箱',
  `fax` varchar(255) DEFAULT NULL COMMENT '传真号码',
  `available` int NOT NULL DEFAULT '1' COMMENT '启用状态(1启用 0停用)',
  `stu` varchar(11) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`id`),
  KEY `idx_phone` (`phone`),
  KEY `idx_customername` (`customername`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客户信息表';

-- ----------------------------
--  Table structure for `bus_goods`
-- ----------------------------
DROP TABLE IF EXISTS `bus_goods`;
CREATE TABLE `bus_goods` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `goodsname` varchar(255) NOT NULL COMMENT '商品名称',
  `produce_place` varchar(255) DEFAULT NULL COMMENT '产地',
  `size` varchar(255) DEFAULT NULL COMMENT '规格尺寸',
  `goodspackage` varchar(255) DEFAULT NULL COMMENT '包装方式',
  `productcode` varchar(255) NOT NULL COMMENT '产品编码',
  `promitcode` varchar(255) DEFAULT NULL COMMENT '批准文号',
  `description` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `price` double(10,2) NOT NULL COMMENT '销售价格',
  `number` int NOT NULL COMMENT '库存数量',
  `dangernum` int DEFAULT NULL COMMENT '警戒库存',
  `goodsing` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `available` int DEFAULT '1' COMMENT '上架状态',
  `provider` int NOT NULL COMMENT '供应商ID',
  `typeid` int NOT NULL COMMENT '商品分类ID',
  `stu` int DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_productcode` (`productcode`),
  KEY `idx_provider` (`provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品信息表';

-- ----------------------------
--  Table structure for `bus_inport`
-- ----------------------------
DROP TABLE IF EXISTS `bus_inport`;
CREATE TABLE `bus_inport` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键',
  `paytype` varchar(255) NOT NULL COMMENT '支付方式',
  `importtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入库时间',
  `operateperson` varchar(255) NOT NULL COMMENT '操作人',
  `number` int unsigned NOT NULL COMMENT '数量',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `importprice` double(10,2) NOT NULL COMMENT '入库价格',
  `provider` int NOT NULL COMMENT '供应商ID',
  `goodsid` int NOT NULL COMMENT '商品ID',
  `rent_perhour` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '租金/每小时',
  `stu` int DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`id`),
  KEY `idx_provider` (`provider`),
  KEY `idx_goods` (`goodsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='仓储信息表';

-- ----------------------------
--  Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `o_id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `h_id` int NOT NULL COMMENT '房屋租赁ID',
  `u_id` int NOT NULL COMMENT '用户ID',
  `order_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `order_user` varchar(20) NOT NULL COMMENT '下单用户',
  PRIMARY KEY (`o_id`),
  KEY `idx_h_id` (`h_id`),
  KEY `idx_u_id` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='订单表';

-- ----------------------------
--  Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) NOT NULL COMMENT '文章标题',
  `content` text COMMENT '文章内容',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `openname` varchar(255) DEFAULT '匿名' COMMENT '发布者',
  PRIMARY KEY (`id`),
  KEY `idx_title` (`title`(20)),
  KEY `idx_openname` (`openname`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章表';

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `available` int NOT NULL COMMENT '可用状态(0不可用)',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='表注释';

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `loginname` varchar(255) NOT NULL COMMENT '登录账号',
  `pwd` varchar(255) NOT NULL COMMENT '密码',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `sex` int DEFAULT NULL COMMENT '性别',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `depid` int NOT NULL COMMENT '部门ID',
  `hiredate` datetime NOT NULL COMMENT '入职时间',
  `mgr` int DEFAULT NULL COMMENT '上级领导',
  `available` int NOT NULL DEFAULT '1' COMMENT '是否可用',
  `ordernum` int DEFAULT NULL COMMENT '排序码',
  `type` int DEFAULT NULL COMMENT '用户类型',
  `impaghetti` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `salt` varchar(255) DEFAULT NULL COMMENT '盐',
  `stu` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

SET FOREIGN_KEY_CHECKS = 1;

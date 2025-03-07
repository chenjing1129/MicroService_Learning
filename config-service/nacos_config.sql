/*
 Navicat Premium Data Transfer

 Source Server         : spring_boot
 Source Server Type    : MySQL
 Source Server Version : 80039
 Source Host           : localhost:3300
 Source Schema         : nacos_config

 Target Server Type    : MySQL
 Target Server Version : 80039
 File Encoding         : 65001

 Date: 07/03/2025 19:36:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'group_id',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'configuration description',
  `c_use` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'configuration usage',
  `effect` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '配置生效的描述',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '配置的类型',
  `c_schema` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT '配置的模式',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (1, 'user-service-dev.yaml', 'cj', 'cj:\n  username1: \"cj\"\n  job1: \"student\"\n  serviceFlag: true', '3ef396295260c16849070fd991647158', '2025-03-07 02:09:42', '2025-03-07 02:16:53', 'nacos', '127.0.0.1', '', '', '用户服务', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (3, 'database-config-dev.yaml', 'cj', 'spring:\r\n  datasource:\r\n    url: jdbc:mysql://127.0.0.1:3300/share_user?useUnicode=true&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true\r\n    username: root\r\n    password: \"chen1129\"\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n  jpa:\r\n    properties:\r\n      hibernate:\r\n        hbm2ddl:\r\n          auto: update\r\n    show-sql: true', '321d089e904573b072fca349eb890e8b', '2025-03-07 02:56:45', '2025-03-07 02:56:45', 'nacos', '127.0.0.1', '', '', NULL, NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (4, 'redis-config-dev.yaml', 'cj', 'spring:\n  data:\n    redis:\n      port: 6379 #Redis服务器端口\n      host: 127.0.0.1 #Redis服务器地址\n      database: 0 # Redis数据库索引，默认为0\n      password:    #Redis 服务器密码（默认为空）\n      lettuce:\n        pool:\n          min-idle: 10 #连接池中的最小空闲数，默认为0\n          max-idle: 20 #连接池中的最大空闲数，默认为0\n          max-active: 100 #连接池中的最大连接数，默认为0', 'bd821dea1bd610df15079c96456a8f14', '2025-03-07 03:19:59', '2025-03-07 03:27:28', 'nacos', '127.0.0.1', '', '', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (5, 'oss-config-dev.yaml', 'cj', 'aliyun:\r\n  oss:\r\n    endpoint: https://oss-cn-nanjing.aliyuncs.com\r\n    accessKeyId: LTAI5tLGTH8iAU1YW2UxpbfD\r\n    accessKeySecret: kuabmXnuP11WfTemSYeg0bIjnpADey\r\n    bucketName: chenjing1129\r\n', '82e4e51c19ca07b962dec27986bc26d0', '2025-03-07 08:50:03', '2025-03-07 08:50:03', 'nacos', '127.0.0.1', '', '', NULL, NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (6, 'key-config-dev.yaml', 'cj', 'apiKey: sk-cb95121c9cf647c7a5ddc5ffa4dc7ebf\nmodel: deepseek-chat\nurl: https://api.deepseek.com/chat/completions', 'daa03952f9e417573a936d32bb1b0a5d', '2025-03-07 09:30:37', '2025-03-07 09:38:35', 'nacos', '127.0.0.1', '', '', '', '', '', 'yaml', '', '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `datum_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `tag_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT COMMENT 'nid, 自增长标识',
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id` ASC, `tag_name` ASC, `tag_type` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'id',
  `nid` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'nid, 自增标识',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `op_type` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'operation type',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密钥',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create` ASC) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified` ASC) USING BTREE,
  INDEX `idx_did`(`data_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'user-service-dev.yaml', 'cj', '', 'cj:\r\n  username: \"cj\"\r\n  job: \"student\"\r\n  serverFlag: true', '9b8a936438c7a0aaa7ef10b31279db39', '2025-03-07 10:09:41', '2025-03-07 02:09:42', 'nacos', '127.0.0.1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (1, 2, 'user-service-dev.yaml', 'cj', '', 'cj:\r\n  username: \"cj\"\r\n  job: \"student\"\r\n  serverFlag: true', '9b8a936438c7a0aaa7ef10b31279db39', '2025-03-07 10:10:03', '2025-03-07 02:10:04', 'nacos', '127.0.0.1', 'U', '', '');
INSERT INTO `his_config_info` VALUES (0, 3, 'common-service-dev.yaml', 'cj', '', 'cj:\r\n  username: \"冲击波\"\r\n  job: \"学生\"', 'f76c571493fb86daacbfa980050d5402', '2025-03-07 10:13:38', '2025-03-07 02:13:38', 'nacos', '127.0.0.1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (1, 4, 'user-service-dev.yaml', 'cj', '', 'cj:\n  username: \"cj\"\n  job: \"student\"\n  serviceFlag: true', '9b3e8e000128185332e49bbd5ab7f3a8', '2025-03-07 10:16:52', '2025-03-07 02:16:53', 'nacos', '127.0.0.1', 'U', '', '');
INSERT INTO `his_config_info` VALUES (2, 5, 'common-service-dev.yaml', 'cj', '', 'cj:\r\n  username: \"冲击波\"\r\n  job: \"学生\"', 'f76c571493fb86daacbfa980050d5402', '2025-03-07 10:21:08', '2025-03-07 02:21:09', 'nacos', '127.0.0.1', 'U', '', '');
INSERT INTO `his_config_info` VALUES (2, 6, 'common-service-dev.yaml', 'cj', '', 'cj:\n  username: \"冲击波\"\n  job: \"学生\"\nspring:\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3300/user_center?useUnicode=true&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true\n    username: root\n    password: \"chen1129\"\n    driver-class-name: com.mysql.cj.jdbc.Driver\n  jpa:\n    properties:\n      hibernate:\n        hbm2ddl:\n          auto: update\n    show-sql: true', '2e03e42524603ce6a7f00adf610eac67', '2025-03-07 10:22:09', '2025-03-07 02:22:09', 'nacos', '127.0.0.1', 'U', '', '');
INSERT INTO `his_config_info` VALUES (2, 7, 'common-service-dev.yaml', 'cj', '', 'cj:\n  username: \"冲击波\"\n  job: \"学生\"\nspring:\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3300/share_user?useUnicode=true&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true\n    username: root\n    password: \"chen1129\"\n    driver-class-name: com.mysql.cj.jdbc.Driver\n  jpa:\n    properties:\n      hibernate:\n        hbm2ddl:\n          auto: update\n    show-sql: true', '08aafa2b3ef7dbaa4682f701afb26414', '2025-03-07 10:22:38', '2025-03-07 02:22:39', 'nacos', '127.0.0.1', 'U', '', '');
INSERT INTO `his_config_info` VALUES (2, 8, 'common-service-dev.yaml', 'cj', '', 'cj:\n  username: \"冲击波\"\n  job: \"学生\"\nspring:\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3300/share_user?useUnicode=true&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true\n    username: root\n    password: \"chen1129\"\n    driver-class-name: com.mysql.cj.jdbc.Driver\n  jpa:\n    properties:\n      hibernate:\n        hbm2ddl:\n          auto: update\n    show-sql: true', '08aafa2b3ef7dbaa4682f701afb26414', '2025-03-07 10:31:11', '2025-03-07 02:31:12', 'nacos', '127.0.0.1', 'U', '', '');
INSERT INTO `his_config_info` VALUES (2, 9, 'common-service-dev.yaml', 'cj', '', 'spring:\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3300/share_user?useUnicode=true&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true\n    username: root\n    password: \"chen1129\"\n    driver-class-name: com.mysql.cj.jdbc.Driver\n  jpa:\n    properties:\n      hibernate:\n        hbm2ddl:\n          auto: update\n    show-sql: true', 'f003102e583def2b52e5241f5b6cb893', '2025-03-07 10:53:21', '2025-03-07 02:53:22', 'nacos', '127.0.0.1', 'U', '', '');
INSERT INTO `his_config_info` VALUES (0, 10, 'database-config-dev.yaml', 'cj', '', 'spring:\r\n  datasource:\r\n    url: jdbc:mysql://127.0.0.1:3300/share_user?useUnicode=true&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true\r\n    username: root\r\n    password: \"chen1129\"\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n  jpa:\r\n    properties:\r\n      hibernate:\r\n        hbm2ddl:\r\n          auto: update\r\n    show-sql: true', '321d089e904573b072fca349eb890e8b', '2025-03-07 10:56:45', '2025-03-07 02:56:45', 'nacos', '127.0.0.1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (2, 11, 'common-service-dev.yaml', 'cj', '', 'spring:\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3300/share_user?useUnicode=true&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true\n    username: root\n    password: \"chen1129\"\n    driver-class-name: com.mysql.cj.jdbc.Driver\n  jpa:\n    properties:\n      hibernate:\n        hbm2ddl:\n          auto: update\n    show-sql: true', 'f003102e583def2b52e5241f5b6cb893', '2025-03-07 10:56:49', '2025-03-07 02:56:49', 'nacos', '127.0.0.1', 'D', '', '');
INSERT INTO `his_config_info` VALUES (0, 12, 'redis-config-dev.yaml', 'cj', '', 'spring:\r\n  data:\r\n    redis:\r\n      port: 6379 #Redis服务器端口\r\n      host: 127.0.0.1 #Redis服务器地址\r\n      database: 0 # Redis数据库索引，默认为0\r\n      password:    #Redis 服务器密码（默认为空）\r\n      lettuce:\r\n        pool:\r\n          min-idle: 10 #连接池中的最小空闲数，默认为0\r\n          max-idle: 20 #连接池中的最大空闲数，默认为0\r\n          max-active: 100 #连接池中的最大连接数，默认为0', 'c36ad8ea8499edef6cf78e65115088ec', '2025-03-07 11:19:59', '2025-03-07 03:19:59', 'nacos', '127.0.0.1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (4, 13, 'redis-config-dev.yaml', 'cj', '', 'spring:\r\n  data:\r\n    redis:\r\n      port: 6379 #Redis服务器端口\r\n      host: 127.0.0.1 #Redis服务器地址\r\n      database: 0 # Redis数据库索引，默认为0\r\n      password:    #Redis 服务器密码（默认为空）\r\n      lettuce:\r\n        pool:\r\n          min-idle: 10 #连接池中的最小空闲数，默认为0\r\n          max-idle: 20 #连接池中的最大空闲数，默认为0\r\n          max-active: 100 #连接池中的最大连接数，默认为0', 'c36ad8ea8499edef6cf78e65115088ec', '2025-03-07 11:27:27', '2025-03-07 03:27:28', 'nacos', '127.0.0.1', 'U', '', '');
INSERT INTO `his_config_info` VALUES (0, 14, 'oss-config-dev.yaml', 'cj', '', 'aliyun:\r\n  oss:\r\n    endpoint: https://oss-cn-nanjing.aliyuncs.com\r\n    accessKeyId: LTAI5tLGTH8iAU1YW2UxpbfD\r\n    accessKeySecret: kuabmXnuP11WfTemSYeg0bIjnpADey\r\n    bucketName: chenjing1129\r\n', '82e4e51c19ca07b962dec27986bc26d0', '2025-03-07 16:50:03', '2025-03-07 08:50:03', 'nacos', '127.0.0.1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (0, 15, 'key-config-dev.yaml', 'cj', '', 'apiKey: sk-cb95121c9cf647c7a5ddc5ffa4dc7ebf', '8cf9e2156382b17e9436416a321a003b', '2025-03-07 17:30:36', '2025-03-07 09:30:37', 'nacos', '127.0.0.1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (6, 16, 'key-config-dev.yaml', 'cj', '', 'apiKey: sk-cb95121c9cf647c7a5ddc5ffa4dc7ebf', '8cf9e2156382b17e9436416a321a003b', '2025-03-07 17:37:30', '2025-03-07 09:37:31', 'nacos', '127.0.0.1', 'U', '', '');
INSERT INTO `his_config_info` VALUES (6, 17, 'key-config-dev.yaml', 'cj', '', 'apiKey: sk-cb95121c9cf647c7a5ddc5ffa4dc7ebf\nmodel: deepseek-chat\nurl: https://api.deepseek.com', '911edd7f5c83d252dc4d3bfe44b3daff', '2025-03-07 17:38:34', '2025-03-07 09:38:35', 'nacos', '127.0.0.1', 'U', '', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci NOT NULL COMMENT 'role',
  `resource` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci NOT NULL COMMENT 'resource',
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci NOT NULL COMMENT 'action',
  UNIQUE INDEX `uk_role_permission`(`role` ASC, `resource` ASC, `action` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci NOT NULL COMMENT 'username',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci NOT NULL COMMENT 'role',
  UNIQUE INDEX `idx_user_role`(`username` ASC, `role` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp` ASC, `tenant_id` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci NOT NULL COMMENT 'username',
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci NOT NULL COMMENT 'password',
  `enabled` tinyint(1) NOT NULL COMMENT 'enabled',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('cj', '$2a$10$mjJrUfGOxBuL8z1gSjqXZebPTq.zw9MqhxaNAx7sR/sQvbsMLmUk.', 1);
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;

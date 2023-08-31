/*
 Navicat Premium Data Transfer

 Source Server         : 本机MySQL8
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 03/06/2023 12:01:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_article
-- ----------------------------
DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '作者',
  `category_id` int NULL DEFAULT NULL COMMENT '文章分类',
  `article_cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章缩略图',
  `article_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `article_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '内容',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '文章类型 1原创 2转载 3翻译',
  `original_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原文链接',
  `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶 0否 1是',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除  0否 1是',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态值 1公开 2私密 3评论可见',
  `create_time` datetime NOT NULL COMMENT '发表时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_article
-- ----------------------------
INSERT INTO `tb_article` VALUES (55, 1, 187, 'http://localhost:8081/articles/ba6abb0d280cb773535073e489064d2f.jpeg', 'Linux的一些命令', '\n\n# 有关Linux的一些命令\n\n```\ndate -R 		#查看系统当前的时间\n```\n\n\n\n# 安装jdk\n\n```\n解压\ntar  -zxvf jdk-8u201-linux-x64.tar.gz\n```\n```\n移动\nmv  jdk1.8.0_201  /usr/local/\n```\n```\n添加环境变量\nvi /etc/profile\n    在最下面粘贴内容\n    export JAVA_HOME=/usr/local/jdk1.8.0_201/\n    export PATH=$PATH:$JAVA_HOME/bin\n刷新配置文件\nsource /etc/profile\n```\n\n```\n检验java\njava -version\njavac -version\n```\n\n\n\n# 在线安装Docker系统\n\n**卸载docker的命令**\n\n```\nsudo yum remove docker \\\n                docker-client \\\n                docker-client-latest \\\n                docker-common \\\n                docker-latest \\\n                docker-latest-logrotate \\\n                docker-logrotate \\\n                docker-engine\n```\n\n**第一步：安装所需的软件包。yum-utils 提供了 yum-config-manager**\n\n```\nsudo yum install -y yum-utils \\\n                    device-mapper-persistent-data \\\n                    lvm2\n```\n\n**第二步：设置 yum 仓库地址**\n\n```\nsudo yum-config-manager \\\n    --add-repo \\\n    http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo\n```\n\n**第三步：更新 yum 缓存**\n\n```\nsudo yum makecache\n```\n**第四步：安装新版 docker**\n\n```\nsudo yum install -y docker-ce docker-ce-cli containerd.io\n```\n\n**第五步：安装成功以后，检查安装状态** \n\n```\n查看版本指令：\ndocker -v\nsystemctl enable docker		#设置开机自启动\nsystemctl start docker		#启动docker服务\nsystemctl status docker		#查看docker服务的状态\ndocker info\n```\n\n**第六步：设置镜像加速**\n\n```\n$ mkdir -p /etc/docker\n\n$ tee /etc/docker/daemon.json <<-\'EOF\'\n{\n  \"registry-mirrors\": [\n    \"http://hub-mirror.c.163.com\",\n    \"https://sumd70pl.mirror.aliyuncs.com\"\n  ]\n}\nEOF\n\n$ systemctl daemon-reload\n\n$ systemctl restart docker\n```\n\n\n\n# 在Docker中安装MySQL5.7\n\n```\n安装镜像\n$ docker pull mysql:5.7\n创建并启动容器\n$ docker run -p 3307:3306 --name mysql --restart=always --privileged=true \\\n        -v /docker_guazai/mysql/log:/var/log/mysql \\\n        -v /docker_guazai/mysql/data:/var/lib/mysql \\\n        -v /docker_guazai/mysql/conf:/etc/mysql/conf.d \\\n        -e MYSQL_ROOT_PASSWORD=258025 \\\n        -e TZ=Asia/Shanghai \\\n        -d \\\n        mysql:5.7\n#此时就可以通过 Navicat 远程连接到所安装的 MySQL5.7 了。\n#--privileged=true：获取宿主机root权限。\n\n# 进入容器里面\n    docker exec -it mysql /bin/bash\n    退出 eixt()\n#查看MySQL环境变量：\n    docker exec -it mysql env\n#查看日志：docker logs -f mysql\n```\n\n\n\n\n\n', 1, '', 1, 0, 1, '2023-05-10 17:51:29', '2023-05-30 01:25:42');
INSERT INTO `tb_article` VALUES (56, 1, 188, 'http://localhost:8081/articles/23aa483c7abb94e723f2ff7f6769a5f5.jpeg', '在 Linux 系统中安装 jdk', '# 安装jdk\n\n```\n解压\ntar  -zxvf jdk-8u201-linux-x64.tar.gz\n```\n```\n移动\nmv  jdk1.8.0_201  /usr/local/\n```\n```\n添加环境变量\nvi /etc/profile\n    在最下面粘贴内容\n    export JAVA_HOME=/usr/local/jdk1.8.0_201/\n    export PATH=$PATH:$JAVA_HOME/bin\n刷新配置文件\nsource /etc/profile\n```\n\n```\n检验java\njava -version\njavac -version\n```\n\n\n', 1, '', 0, 0, 1, '2023-05-15 05:46:28', NULL);
INSERT INTO `tb_article` VALUES (57, 1, 187, 'http://localhost:8081/articles/c1be444f43283a567f557b8dfb29b2f5.jpeg', '测试文章', '# 开启你的文章之旅吧\n::: hljs-center\n\n开启你的文章之旅吧。开启你的文章之旅吧。\n开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。\n\n:::\n```language\n开启你的文章之旅吧。开启你的文章之旅吧。\n```\n\n::: hljs-right\n\n开启你的文章之旅吧。开启你的文章之旅吧。\n开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。\n\n:::\n\n\n开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。\n开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。\n', 1, '', 0, 0, 1, '2023-05-15 05:50:34', '2023-05-15 05:52:54');
INSERT INTO `tb_article` VALUES (58, 1, 187, 'http://localhost:8081/articles/fcad510614d0e84bb6cd0cb6eeda34d0.png', '常用maven命令', '//常用maven命令\n\n*斜体*mvn -v //查看版本\n## mvn archetype:create //创建 Maven 项目\nmvn compile //编译源代码\nmvn test-compile //编译测试代码\nmvn test //运行应用程序中的单元测试\nmvn site //生成项目相关信息的网站\nmvn package //依据项目生成 jar 文件\nmvn install //在本地 Repository 中安装 jar\nmvn -Dmaven.test.skip=true //忽略测试文档编译\nmvn clean //清除目标目录中的生成结果\nmvn clean compile //将.java类编译为.class文件\nmvn clean package //进行打包\nmvn clean test //执行单元测试\nmvn clean deploy //部署到版本仓库\nmvn clean install //使其他项目使用这个jar,会安装到maven本地仓库中\nmvn archetype:generate //创建项目架构\nmvn dependency:list //查看已解析依赖\nmvn dependency:tree //看到依赖树\nmvn dependency:analyze //查看依赖的工具\nmvn help:system //从中央仓库下载文件至本地仓库\nmvn help:active-profiles //查看当前激活的profiles\nmvn help:all-profiles //查看所有profiles\nmvn help:effective -pom //查看完整的pom信息\n', 1, '', 0, 1, 1, '2023-05-30 00:39:50', '2023-05-30 01:38:07');
INSERT INTO `tb_article` VALUES (59, 1, 187, 'http://localhost:8081/articles/c1be444f43283a567f557b8dfb29b2f5.jpeg', 'maven命令嘿嘿嘿', '//常用maven命令\n### \n**mvn -v //查看版本\nmvn archetype:create //创建 Maven 项目\nmvn compile //编译源代码\nmvn test-compile //编译测试代码\nmvn test //运行应用程序中的单元测试\nmvn site //生成项目相关信息的网站\nmvn package //依据项目生成 jar 文件**\nmvn install //在本地 Repository 中安装 jar\nmvn -Dmaven.test.skip=true //忽略测试文档编译\nmvn clean //清除目标目录中的生成结果\nmvn clean compile //将.java类编译为.class文件\nmvn clean package //进行打包\nmvn clean test //执行单元测试\nmvn clean deploy //部署到版本仓库\nmvn clean install //使其他项目使用这个jar,会安装到maven本地仓库中\nmvn archetype:generate //创建项目架构\nmvn dependency:list //查看已解析依赖\nmvn dependency:tree //看到依赖树\nmvn dependency:analyze //查看依赖的工具\nmvn help:system //从中央仓库下载文件至本地仓库\nmvn help:active-profiles //查看当前激活的profiles\nmvn help:all-profiles //查看所有profiles\nmvn help:effective -pom //查看完整的pom信息\n', 1, '', 0, 1, 1, '2023-05-30 01:08:19', '2023-05-30 01:25:49');
INSERT INTO `tb_article` VALUES (60, 1, 187, 'http://localhost:8081/articles/c1be444f43283a567f557b8dfb29b2f5.jpeg', '常用maven命令哈哈哈哈', 'en命令\n\nmvn -v //查看版本\nmvn archetype:create //创建 Maven 项目\n# mvn compile //编译源代码\nmvn test-compile //编译测试代码\nmvn test //运行应用程序中的单元测试\nmvn site //生成项目相关信息的网站\nmvn package //依据项目生成 jar 文件\nmvn install //在本地 Repository 中安装 jar\nmvn -Dmaven.test.skip=true //忽略测试文档编译\nmvn clean //清除目标目录中的生成结果\nmvn clean compile //将.java类编译为.class文件\nmvn clean package //进行打包\nmvn clean test //执行单元测试\nmvn clean deploy //部署到版本仓库\nmvn clean install //使其他项目使用这个jar,会安装到maven本地仓库中\nmvn archetype:generate //创建项目架构\nmvn dependency:list //查看已解析依赖\nmvn dependency:tree //看到依赖树\nmvn dependency:analyze //查看依赖的工具\nmvn help:system //从中央仓库下载文件至本地仓库\nmvn help:active-profiles //查看当前激活的profiles\nmvn help:all-profiles //查看所有profiles\nmvn help:effective -pom //查看完整的pom信息\n', 1, '', 0, 0, 1, '2023-05-30 01:25:07', NULL);
INSERT INTO `tb_article` VALUES (61, 1, 187, 'http://localhost:8081/articles/23aa483c7abb94e723f2ff7f6769a5f5.jpeg', 'maven', '//常用maven命令\n\nmvn -v //查看版本\nmvn archetype:create //创建 Maven 项目\nmvn compile //编译源代码\nmvn test-compile //编译测试代码\nmvn test //运行应用程序中的单元测试\nmvn site //生成项目相关信息的网站\nmvn package //依据项目生成 jar 文件\nmvn install //在本地 Repository 中安装 jar\nmvn -Dmaven.test.skip=true //忽略测试文档编译\nmvn clean //清除目标目录中的生成结果\nmvn clean compile //将.java类编译为.class文件\nmvn clean package //进行打包\nmvn clean test //执行单元测试\nmvn clean deploy //部署到版本仓库\nmvn clean install //使其他项目使用这个jar,会安装到maven本地仓库中\nmvn archetype:generate //创建项目架构\nmvn dependency:list //查看已解析依赖\nmvn dependency:tree //看到依赖树\nmvn dependency:analyze //查看依赖的工具\nmvn help:system //从中央仓库下载文件至本地仓库\nmvn help:active-profiles //查看当前激活的profiles\nmvn help:all-profiles //查看所有profiles\nmvn help:effective -pom //查看完整的pom信息\n', 1, '', 0, 1, 1, '2023-05-30 01:37:43', '2023-05-30 01:49:43');
INSERT INTO `tb_article` VALUES (62, 1, 187, 'http://localhost:8081/articles/23aa483c7abb94e723f2ff7f6769a5f5.jpeg', 'mavenmavenmavenmavenmaven', '//常用maven命令\n\nmvn -v //查看版本\nmvn archetype:create //创建 Maven 项目\nmvn compile //编译源代码\nmvn test-compile //编译测试代码\nmvn test //运行应用程序中的单元测试\nmvn site //生成项目相关信息的网站\nmvn package //依据项目生成 jar 文件\nmvn install //在本地 Repository 中安装 jar\nmvn -Dmaven.test.skip=true //忽略测试文档编译\nmvn clean //清除目标目录中的生成结果\nmvn clean compile //将.java类编译为.class文件\nmvn clean package //进行打包\nmvn clean test //执行单元测试\nmvn clean deploy //部署到版本仓库\nmvn clean install //使其他项目使用这个jar,会安装到maven本地仓库中\nmvn archetype:generate //创建项目架构\nmvn dependency:list //查看已解析依赖\nmvn dependency:tree //看到依赖树\nmvn dependency:analyze //查看依赖的工具\nmvn help:system //从中央仓库下载文件至本地仓库\nmvn help:active-profiles //查看当前激活的profiles\nmvn help:all-profiles //查看所有profiles\nmvn help:effective -pom //查看完整的pom信息\n', 1, '', 0, 0, 1, '2023-05-30 01:49:26', '2023-05-30 01:49:49');

-- ----------------------------
-- Table structure for tb_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_article_tag`;
CREATE TABLE `tb_article_tag`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL COMMENT '文章id',
  `tag_id` int NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_article_tag_1`(`article_id` ASC) USING BTREE,
  INDEX `fk_article_tag_2`(`tag_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 875 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_article_tag
-- ----------------------------
INSERT INTO `tb_article_tag` VALUES (859, 56, 30);
INSERT INTO `tb_article_tag` VALUES (865, 57, 31);
INSERT INTO `tb_article_tag` VALUES (866, 58, 31);
INSERT INTO `tb_article_tag` VALUES (868, 59, 31);
INSERT INTO `tb_article_tag` VALUES (870, 60, 31);
INSERT INTO `tb_article_tag` VALUES (871, 55, 31);
INSERT INTO `tb_article_tag` VALUES (872, 61, 31);
INSERT INTO `tb_article_tag` VALUES (874, 62, 31);

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 191 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES (187, '测试分类', '2023-04-24 23:33:56', NULL);
INSERT INTO `tb_category` VALUES (188, 'Linux命令类', '2023-05-10 17:52:13', NULL);
INSERT INTO `tb_category` VALUES (189, 'Java学习', '2023-05-30 00:40:35', NULL);
INSERT INTO `tb_category` VALUES (190, 'MYSQL学习', '2023-05-30 01:09:18', NULL);

-- ----------------------------
-- Table structure for tb_chat_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_chat_record`;
CREATE TABLE `tb_chat_record`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '聊天内容',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ip地址',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ip来源',
  `type` tinyint NOT NULL COMMENT '类型',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2991 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_chat_record
-- ----------------------------
INSERT INTO `tb_chat_record` VALUES (2990, NULL, '未知ip', 'http://localhost:8081/config/ba6abb0d280cb773535073e489064d2f.jpeg', 'hello', '未知ip', '', 3, '2023-05-23 11:41:34', NULL);

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NOT NULL COMMENT '评论用户Id',
  `topic_id` int NULL DEFAULT NULL COMMENT '评论主题id',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `reply_user_id` int NULL DEFAULT NULL COMMENT '回复用户id',
  `parent_id` int NULL DEFAULT NULL COMMENT '父评论id',
  `type` tinyint NOT NULL COMMENT '评论类型 1.文章 2.友链 3.说说',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除  0否 1是',
  `is_review` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否审核',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_comment_user`(`user_id` ASC) USING BTREE,
  INDEX `fk_comment_parent`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 738 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES (725, 1, 54, '测试评论', NULL, NULL, 1, 0, 1, '2023-04-11 22:52:24', NULL);
INSERT INTO `tb_comment` VALUES (726, 1, 54, '测试回复', 1, 725, 1, 0, 1, '2023-04-11 22:52:32', NULL);
INSERT INTO `tb_comment` VALUES (727, 1, 49, '测试评论', NULL, NULL, 3, 0, 1, '2023-04-11 22:52:41', NULL);
INSERT INTO `tb_comment` VALUES (728, 1, 49, '测试回复', 1, 727, 3, 0, 1, '2023-04-11 22:52:46', NULL);
INSERT INTO `tb_comment` VALUES (729, 1, NULL, '测试评论', NULL, NULL, 2, 0, 1, '2023-04-11 22:52:53', NULL);
INSERT INTO `tb_comment` VALUES (731, 1005, 56, '很好！！！', NULL, NULL, 1, 0, 1, '2023-05-30 00:37:07', NULL);
INSERT INTO `tb_comment` VALUES (732, 1007, 55, '嘿嘿嘿', NULL, NULL, 1, 0, 1, '2023-05-30 00:47:53', NULL);
INSERT INTO `tb_comment` VALUES (733, 1005, 55, 'hhh嘿嘿嘿。开心', NULL, NULL, 1, 0, 1, '2023-05-30 00:55:21', NULL);
INSERT INTO `tb_comment` VALUES (734, 1005, 55, '^_^呵呵呵呵', NULL, NULL, 1, 0, 1, '2023-05-30 01:06:06', NULL);
INSERT INTO `tb_comment` VALUES (735, 1005, 55, 'lll康康康康', NULL, NULL, 1, 0, 1, '2023-05-30 01:22:45', NULL);
INSERT INTO `tb_comment` VALUES (736, 1005, 55, 'lllll啦啦啦啦啦', NULL, NULL, 1, 0, 1, '2023-05-30 01:35:48', NULL);
INSERT INTO `tb_comment` VALUES (737, 1005, 55, '很好，加加加油油油', NULL, NULL, 1, 0, 1, '2023-05-30 01:47:47', NULL);

-- ----------------------------
-- Table structure for tb_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `tb_friend_link`;
CREATE TABLE `tb_friend_link`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `link_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接名',
  `link_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接头像',
  `link_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接地址',
  `link_intro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接介绍',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_friend_link_user`(`link_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_friend_link
-- ----------------------------

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名',
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单路径',
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组件',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单icon',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `order_num` tinyint(1) NOT NULL COMMENT '排序',
  `parent_id` int NULL DEFAULT NULL COMMENT '父id',
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏  0否1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 219 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES (1, '首页', '/', '/home/Home.vue', 'el-icon-myshouye', '2021-01-26 17:06:51', '2021-01-26 17:06:53', 1, NULL, 0);
INSERT INTO `tb_menu` VALUES (2, '文章管理', '/article-submenu', 'Layout', 'el-icon-mywenzhang-copy', '2021-01-25 20:43:07', '2021-01-25 20:43:09', 2, NULL, 0);
INSERT INTO `tb_menu` VALUES (3, '消息管理', '/message-submenu', 'Layout', 'el-icon-myxiaoxi', '2021-01-25 20:44:17', '2021-01-25 20:44:20', 3, NULL, 0);
INSERT INTO `tb_menu` VALUES (4, '系统管理', '/system-submenu', 'Layout', 'el-icon-myshezhi', '2021-01-25 20:45:57', '2021-01-25 20:45:59', 5, NULL, 0);
INSERT INTO `tb_menu` VALUES (5, '个人中心', '/setting', '/setting/Setting.vue', 'el-icon-myuser', '2021-01-26 17:22:38', '2021-01-26 17:22:41', 7, NULL, 0);
INSERT INTO `tb_menu` VALUES (6, '发布文章', '/articles', '/article/Article.vue', 'el-icon-myfabiaowenzhang', '2021-01-26 14:30:48', '2021-01-26 14:30:51', 1, 2, 0);
INSERT INTO `tb_menu` VALUES (7, '修改文章', '/articles/*', '/article/Article.vue', 'el-icon-myfabiaowenzhang', '2021-01-26 14:31:32', '2021-01-26 14:31:34', 2, 2, 1);
INSERT INTO `tb_menu` VALUES (8, '文章列表', '/article-list', '/article/ArticleList.vue', 'el-icon-mywenzhangliebiao', '2021-01-26 14:32:13', '2021-01-26 14:32:16', 3, 2, 0);
INSERT INTO `tb_menu` VALUES (9, '分类管理', '/categories', '/category/Category.vue', 'el-icon-myfenlei', '2021-01-26 14:33:42', '2021-01-26 14:33:43', 4, 2, 0);
INSERT INTO `tb_menu` VALUES (10, '标签管理', '/tags', '/tag/Tag.vue', 'el-icon-myicontag', '2021-01-26 14:34:33', '2021-01-26 14:34:36', 5, 2, 0);
INSERT INTO `tb_menu` VALUES (11, '评论管理', '/comments', '/comment/Comment.vue', 'el-icon-mypinglunzu', '2021-01-26 14:35:31', '2021-01-26 14:35:34', 1, 3, 0);
INSERT INTO `tb_menu` VALUES (12, '留言管理', '/messages', '/message/Message.vue', 'el-icon-myliuyan', '2021-01-26 14:36:09', '2021-01-26 14:36:13', 2, 3, 0);
INSERT INTO `tb_menu` VALUES (13, '用户列表', '/users', '/user/User.vue', 'el-icon-myyonghuliebiao', '2021-01-26 14:38:09', '2021-01-26 14:38:12', 1, 202, 0);
INSERT INTO `tb_menu` VALUES (14, '角色管理', '/roles', '/role/Role.vue', 'el-icon-myjiaoseliebiao', '2021-01-26 14:39:01', '2021-01-26 14:39:03', 2, 213, 0);
INSERT INTO `tb_menu` VALUES (15, '接口管理', '/resources', '/resource/Resource.vue', 'el-icon-myjiekouguanli', '2021-01-26 14:40:14', '2021-08-07 20:00:28', 2, 213, 0);
INSERT INTO `tb_menu` VALUES (16, '菜单管理', '/menus', '/menu/Menu.vue', 'el-icon-mycaidan', '2021-01-26 14:40:54', '2021-08-07 10:18:49', 2, 213, 0);
INSERT INTO `tb_menu` VALUES (17, '友链管理', '/links', '/friendLink/FriendLink.vue', 'el-icon-mydashujukeshihuaico-', '2021-01-26 14:41:35', '2021-01-26 14:41:37', 3, 4, 0);
INSERT INTO `tb_menu` VALUES (18, '关于我', '/about', '/about/About.vue', 'el-icon-myguanyuwo', '2021-01-26 14:42:05', '2021-01-26 14:42:10', 4, 4, 0);
INSERT INTO `tb_menu` VALUES (19, '日志管理', '/log-submenu', 'Layout', 'el-icon-myguanyuwo', '2021-01-31 21:33:56', '2021-01-31 21:33:59', 6, NULL, 0);
INSERT INTO `tb_menu` VALUES (20, '操作日志', '/operation/log', '/log/Operation.vue', 'el-icon-myguanyuwo', '2021-01-31 15:53:21', '2021-01-31 15:53:25', 1, 19, 0);
INSERT INTO `tb_menu` VALUES (201, '在线用户', '/online/users', '/user/Online.vue', 'el-icon-myyonghuliebiao', '2021-02-05 14:59:51', '2021-02-05 14:59:53', 7, 202, 0);
INSERT INTO `tb_menu` VALUES (202, '用户管理', '/users-submenu', 'Layout', 'el-icon-myyonghuliebiao', '2021-02-06 23:44:59', '2021-02-06 23:45:03', 4, NULL, 0);
INSERT INTO `tb_menu` VALUES (205, '相册管理', '/album-submenu', 'Layout', 'el-icon-myimage-fill', '2021-08-03 15:10:54', '2021-08-07 20:02:06', 5, NULL, 0);
INSERT INTO `tb_menu` VALUES (206, '相册列表', '/albums', '/album/Album.vue', 'el-icon-myzhaopian', '2021-08-03 20:29:19', '2021-08-04 11:45:47', 1, 205, 0);
INSERT INTO `tb_menu` VALUES (208, '照片管理', '/albums/:albumId', '/album/Photo.vue', 'el-icon-myzhaopian', '2021-08-03 21:37:47', '2021-08-05 10:24:08', 1, 205, 1);
INSERT INTO `tb_menu` VALUES (209, '页面管理', '/pages', '/page/Page.vue', 'el-icon-myyemianpeizhi', '2021-08-04 11:36:27', '2021-08-07 20:01:26', 2, 4, 0);
INSERT INTO `tb_menu` VALUES (210, '照片回收站', '/photos/delete', '/album/Delete.vue', 'el-icon-myhuishouzhan', '2021-08-05 13:55:19', NULL, 3, 205, 1);
INSERT INTO `tb_menu` VALUES (213, '权限管理', '/permission-submenu', 'Layout', 'el-icon-mydaohanglantubiao_quanxianguanli', '2021-08-07 19:56:55', '2021-08-07 19:59:40', 4, NULL, 0);
INSERT INTO `tb_menu` VALUES (214, '网站管理', '/website', '/website/Website.vue', 'el-icon-myxitong', '2021-08-07 20:06:41', NULL, 1, 4, 0);
INSERT INTO `tb_menu` VALUES (215, '说说管理', '/talk-submenu', 'Layout', 'el-icon-mypinglun', '2022-01-23 20:17:59', '2022-01-23 20:38:06', 5, NULL, 0);
INSERT INTO `tb_menu` VALUES (216, '发布说说', '/talks', '/talk/Talk.vue', 'el-icon-myfabusekuai', '2022-01-23 20:18:43', '2022-01-23 20:38:19', 1, 215, 0);
INSERT INTO `tb_menu` VALUES (217, '说说列表', '/talk-list', '/talk/TalkList.vue', 'el-icon-myiconfontdongtaidianji', '2022-01-23 23:28:24', '2022-01-24 00:02:48', 2, 215, 0);
INSERT INTO `tb_menu` VALUES (218, '修改说说', '/talks/:talkId', '/talk/Talk.vue', 'el-icon-myshouye', '2022-01-24 00:10:44', NULL, 3, 215, 1);

-- ----------------------------
-- Table structure for tb_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_message`;
CREATE TABLE `tb_message`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
  `message_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '留言内容',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ip',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户地址',
  `time` tinyint(1) NULL DEFAULT NULL COMMENT '弹幕速度',
  `is_review` tinyint NOT NULL DEFAULT 1 COMMENT '是否审核',
  `create_time` datetime NOT NULL COMMENT '发布时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3948 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_message
-- ----------------------------
INSERT INTO `tb_message` VALUES (3938, '管理员', 'http://localhost:8081/giao/1.png', '测试留言', '127.0.0.1', '', 9, 1, '2023-04-24 23:34:41', NULL);
INSERT INTO `tb_message` VALUES (3939, '游客', 'http://localhost:8081/config/ba6abb0d280cb773535073e489064d2f.jpeg', '哈哈哈哈哈', '127.0.0.1', '', 8, 1, '2023-05-10 19:23:42', NULL);
INSERT INTO `tb_message` VALUES (3940, '游客', 'http://localhost:8081/config/ba6abb0d280cb773535073e489064d2f.jpeg', '啦啦啦啦啦', '127.0.0.1', '', 8, 1, '2023-05-15 07:11:42', NULL);
INSERT INTO `tb_message` VALUES (3941, '游客', 'http://localhost:8081/config/ba6abb0d280cb773535073e489064d2f.jpeg', '写论文好累呀', '127.0.0.1', '', 8, 1, '2023-05-23 12:45:31', NULL);
INSERT INTO `tb_message` VALUES (3943, '游客', 'http://localhost:8081/config/ba6abb0d280cb773535073e489064d2f.jpeg', '嘿嘿嘿', '127.0.0.1', '', 9, 1, '2023-05-30 00:54:17', NULL);
INSERT INTO `tb_message` VALUES (3944, '游客', 'http://localhost:8081/config/ba6abb0d280cb773535073e489064d2f.jpeg', '呵呵呵呵', '127.0.0.1', '', 9, 1, '2023-05-30 01:05:19', NULL);
INSERT INTO `tb_message` VALUES (3945, '游客', 'http://localhost:8081/config/ba6abb0d280cb773535073e489064d2f.jpeg', '看看快快快嘿嘿嘿', '127.0.0.1', '', 7, 1, '2023-05-30 01:22:00', NULL);
INSERT INTO `tb_message` VALUES (3946, '游客', 'http://localhost:8081/config/ba6abb0d280cb773535073e489064d2f.jpeg', '乒乒乓乓', '127.0.0.1', '', 7, 1, '2023-05-30 01:35:11', NULL);
INSERT INTO `tb_message` VALUES (3947, '游客', 'http://localhost:8081/config/ba6abb0d280cb773535073e489064d2f.jpeg', '吞吞吐吐哈哈哈哈', '127.0.0.1', '', 8, 1, '2023-05-30 01:47:11', NULL);

-- ----------------------------
-- Table structure for tb_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_operation_log`;
CREATE TABLE `tb_operation_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `opt_module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作模块',
  `opt_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作类型',
  `opt_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作url',
  `opt_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作方法',
  `opt_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作描述',
  `request_param` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求参数',
  `request_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求方式',
  `response_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返回数据',
  `user_id` int NOT NULL COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作ip',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1146 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_operation_log
-- ----------------------------
INSERT INTO `tb_operation_log` VALUES (1083, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"恭喜你成功运行博客，开启你的文章之旅吧。\",\"articleCover\":\"https://static.talkxj.com/articles/3dffb2fcbd541886616ab54c92570de3.jpg\",\"articleTitle\":\"测试文章\",\"categoryName\":\"测试分类\",\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[\"测试标签\"],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-04-24 23:33:57', NULL);
INSERT INTO `tb_operation_log` VALUES (1084, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"\\n\\n# 有关Linux的一些命令\\n\\n```\\ndate -R \\t\\t#查看系统当前的时间\\n```\\n\\n\\n\\n# 安装jdk\\n\\n```\\n解压\\ntar  -zxvf jdk-8u201-linux-x64.tar.gz\\n```\\n```\\n移动\\nmv  jdk1.8.0_201  /usr/local/\\n```\\n```\\n添加环境变量\\nvi /etc/profile\\n    在最下面粘贴内容\\n    export JAVA_HOME=/usr/local/jdk1.8.0_201/\\n    export PATH=$PATH:$JAVA_HOME/bin\\n刷新配置文件\\nsource /etc/profile\\n```\\n\\n```\\n检验java\\njava -version\\njavac -version\\n```\\n\\n\\n\\n# 在线安装Docker系统\\n\\n**卸载docker的命令**\\n\\n```\\nsudo yum remove docker \\\\\\n                docker-client \\\\\\n                docker-client-latest \\\\\\n                docker-common \\\\\\n                docker-latest \\\\\\n                docker-latest-logrotate \\\\\\n                docker-logrotate \\\\\\n                docker-engine\\n```\\n\\n**第一步：安装所需的软件包。yum-utils 提供了 yum-config-manager**\\n\\n```\\nsudo yum install -y yum-utils \\\\\\n                    device-mapper-persistent-data \\\\\\n                    lvm2\\n```\\n\\n**第二步：设置 yum 仓库地址**\\n\\n```\\nsudo yum-config-manager \\\\\\n    --add-repo \\\\\\n    http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo\\n```\\n\\n**第三步：更新 yum 缓存**\\n\\n```\\nsudo yum makecache\\n```\\n**第四步：安装新版 docker**\\n\\n```\\nsudo yum install -y docker-ce docker-ce-cli containerd.io\\n```\\n\\n**第五步：安装成功以后，检查安装状态** \\n\\n```\\n查看版本指令：\\ndocker -v\\nsystemctl enable docker\\t\\t#设置开机自启动\\nsystemctl start docker\\t\\t#启动docker服务\\nsystemctl status docker\\t\\t#查看docker服务的状态\\ndocker info\\n```\\n\\n**第六步：设置镜像加速**\\n\\n```\\n$ mkdir -p /etc/docker\\n\\n$ tee /etc/docker/daemon.json <<-\'EOF\'\\n{\\n  \\\"registry-mirrors\\\": [\\n    \\\"http://hub-mirror.c.163.com\\\",\\n    \\\"https://sumd70pl.mirror.aliyuncs.com\\\"\\n  ]\\n}\\nEOF\\n\\n$ systemctl daemon-reload\\n\\n$ systemctl restart docker\\n```\\n\\n\\n\\n# 在Docker中安装MySQL5.7\\n\\n```\\n安装镜像\\n$ docker pull mysql:5.7\\n创建并启动容器\\n$ docker run -p 3307:3306 --name mysql --restart=always --privileged=true \\\\\\n        -v /docker_guazai/mysql/log:/var/log/mysql \\\\\\n        -v /docker_guazai/mysql/data:/var/lib/mysql \\\\\\n        -v /docker_guazai/mysql/conf:/etc/mysql/conf.d \\\\\\n        -e MYSQL_ROOT_PASSWORD=258025 \\\\\\n        -e TZ=Asia/Shanghai \\\\\\n        -d \\\\\\n        mysql:5.7\\n#此时就可以通过 Navicat 远程连接到所安装的 MySQL5.7 了。\\n#--privileged=true：获取宿主机root权限。\\n\\n# 进入容器里面\\n    docker exec -it mysql /bin/bash\\n    退出 eixt()\\n#查看MySQL环境变量：\\n    docker exec -it mysql env\\n#查看日志：docker logs -f mysql\\n```\\n\\n\\n\\n\\n\\n\",\"articleCover\":\"http://localhost:8081/articles/ba6abb0d280cb773535073e489064d2f.jpeg\",\"articleTitle\":\"Linux的一些命令\",\"categoryName\":\"测试分类\",\"isTop\":1,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 17:51:30', NULL);
INSERT INTO `tb_operation_log` VALUES (1085, '分类模块', '新增或修改', '/admin/categories', 'com.minzheng.blog.controller.CategoryController.saveOrUpdateCategory', '添加或修改分类', '[{\"categoryName\":\"Linux命令类\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 17:52:13', NULL);
INSERT INTO `tb_operation_log` VALUES (1086, '标签模块', '新增或修改', '/admin/tags', 'com.minzheng.blog.controller.TagController.saveOrUpdateTag', '添加或修改标签', '[{\"tagName\":\"学习笔记标签\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 17:52:57', NULL);
INSERT INTO `tb_operation_log` VALUES (1087, '页面模块', '新增或修改', '/admin/pages', 'com.minzheng.blog.controller.PageController.saveOrUpdatePage', '保存或更新页面', '[{\"pageCover\":\"http://localhost:8081/config/23aa483c7abb94e723f2ff7f6769a5f5.jpeg\",\"pageLabel\":\"测试A\",\"pageName\":\"AAA页面\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 17:57:32', NULL);
INSERT INTO `tb_operation_log` VALUES (1088, '相册模块', '新增或修改', '/admin/photos/albums', 'com.minzheng.blog.controller.PhotoAlbumController.saveOrUpdatePhotoAlbum', '保存或更新相册', '[{\"albumCover\":\"http://localhost:8081/photos/979bd491f5fb216eb5df80321cd4a470.jpg\",\"albumDesc\":\"相册A很good\",\"albumName\":\"相册A\",\"status\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 17:58:26', NULL);
INSERT INTO `tb_operation_log` VALUES (1089, '照片模块', '新增', '/admin/photos', 'com.minzheng.blog.controller.PhotoController.savePhotos', '保存照片', '[{\"albumId\":8,\"photoUrlList\":[\"http://localhost:8081/photos/104d17eaf876c2846696ba2f1231cef9.jpeg\",\"http://localhost:8081/photos/7676f14f45504d760a4884341003cd0a.jpeg\"]}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 17:58:51', NULL);
INSERT INTO `tb_operation_log` VALUES (1090, '页面模块', '新增或修改', '/admin/pages', 'com.minzheng.blog.controller.PageController.saveOrUpdatePage', '保存或更新页面', '[{\"id\":1,\"pageCover\":\"http://localhost:8081/config/7676f14f45504d760a4884341003cd0a.jpeg\",\"pageLabel\":\"home\",\"pageName\":\"首页\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 18:15:47', NULL);
INSERT INTO `tb_operation_log` VALUES (1091, '页面模块', '新增或修改', '/admin/pages', 'com.minzheng.blog.controller.PageController.saveOrUpdatePage', '保存或更新页面', '[{\"id\":1,\"pageCover\":\"https://static.talkxj.com/config/0bee7ba5ac70155766648e14ae2a821f.jpg\",\"pageLabel\":\"home\",\"pageName\":\"首页\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 18:15:48', NULL);
INSERT INTO `tb_operation_log` VALUES (1092, '页面模块', '新增或修改', '/admin/pages', 'com.minzheng.blog.controller.PageController.saveOrUpdatePage', '保存或更新页面', '[{\"id\":8,\"pageCover\":\"http://localhost:8081/config/2f7a43075ff9f311926678fb0a04db9d.jpg\",\"pageLabel\":\"message\",\"pageName\":\"留言\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 18:18:31', NULL);
INSERT INTO `tb_operation_log` VALUES (1093, '页面模块', '新增或修改', '/admin/pages', 'com.minzheng.blog.controller.PageController.saveOrUpdatePage', '保存或更新页面', '[{\"id\":2,\"pageCover\":\"http://localhost:8081/config/c1be444f43283a567f557b8dfb29b2f5.jpeg\",\"pageLabel\":\"archive\",\"pageName\":\"归档\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 18:27:49', NULL);
INSERT INTO `tb_operation_log` VALUES (1094, '页面模块', '新增或修改', '/admin/pages', 'com.minzheng.blog.controller.PageController.saveOrUpdatePage', '保存或更新页面', '[{\"id\":3,\"pageCover\":\"http://localhost:8081/config/c1be444f43283a567f557b8dfb29b2f5.jpeg\",\"pageLabel\":\"category\",\"pageName\":\"分类\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 18:28:19', NULL);
INSERT INTO `tb_operation_log` VALUES (1095, '页面模块', '新增或修改', '/admin/pages', 'com.minzheng.blog.controller.PageController.saveOrUpdatePage', '保存或更新页面', '[{\"id\":4,\"pageCover\":\"http://localhost:8081/config/c1be444f43283a567f557b8dfb29b2f5.jpeg\",\"pageLabel\":\"tag\",\"pageName\":\"标签\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 18:28:40', NULL);
INSERT INTO `tb_operation_log` VALUES (1096, '页面模块', '新增或修改', '/admin/pages', 'com.minzheng.blog.controller.PageController.saveOrUpdatePage', '保存或更新页面', '[{\"id\":5,\"pageCover\":\"http://localhost:8081/config/c1be444f43283a567f557b8dfb29b2f5.jpeg\",\"pageLabel\":\"album\",\"pageName\":\"相册\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 18:28:54', NULL);
INSERT INTO `tb_operation_log` VALUES (1097, '页面模块', '新增或修改', '/admin/pages', 'com.minzheng.blog.controller.PageController.saveOrUpdatePage', '保存或更新页面', '[{\"id\":6,\"pageCover\":\"http://localhost:8081/config/c1be444f43283a567f557b8dfb29b2f5.jpeg\",\"pageLabel\":\"link\",\"pageName\":\"友链\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 18:29:02', NULL);
INSERT INTO `tb_operation_log` VALUES (1098, '页面模块', '新增或修改', '/admin/pages', 'com.minzheng.blog.controller.PageController.saveOrUpdatePage', '保存或更新页面', '[{\"id\":7,\"pageCover\":\"http://localhost:8081/config/c1be444f43283a567f557b8dfb29b2f5.jpeg\",\"pageLabel\":\"about\",\"pageName\":\"关于\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 18:29:12', NULL);
INSERT INTO `tb_operation_log` VALUES (1099, '页面模块', '新增或修改', '/admin/pages', 'com.minzheng.blog.controller.PageController.saveOrUpdatePage', '保存或更新页面', '[{\"id\":9,\"pageCover\":\"http://localhost:8081/config/c1be444f43283a567f557b8dfb29b2f5.jpeg\",\"pageLabel\":\"user\",\"pageName\":\"个人中心\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 18:29:17', NULL);
INSERT INTO `tb_operation_log` VALUES (1100, '页面模块', '新增或修改', '/admin/pages', 'com.minzheng.blog.controller.PageController.saveOrUpdatePage', '保存或更新页面', '[{\"id\":10,\"pageCover\":\"http://localhost:8081/config/c1be444f43283a567f557b8dfb29b2f5.jpeg\",\"pageLabel\":\"articleList\",\"pageName\":\"文章列表\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 18:29:24', NULL);
INSERT INTO `tb_operation_log` VALUES (1101, '页面模块', '新增或修改', '/admin/pages', 'com.minzheng.blog.controller.PageController.saveOrUpdatePage', '保存或更新页面', '[{\"id\":904,\"pageCover\":\"http://localhost:8081/config/c1be444f43283a567f557b8dfb29b2f5.jpeg\",\"pageLabel\":\"talk\",\"pageName\":\"说说\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 18:29:31', NULL);
INSERT INTO `tb_operation_log` VALUES (1102, '页面模块', '新增或修改', '/admin/pages', 'com.minzheng.blog.controller.PageController.saveOrUpdatePage', '保存或更新页面', '[{\"id\":905,\"pageCover\":\"http://localhost:8081/config/23aa483c7abb94e723f2ff7f6769a5f5.jpeg\",\"pageLabel\":\"testAAA\",\"pageName\":\"AAA页面\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-10 18:29:47', NULL);
INSERT INTO `tb_operation_log` VALUES (1103, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"# 安装jdk\\n\\n```\\n解压\\ntar  -zxvf jdk-8u201-linux-x64.tar.gz\\n```\\n```\\n移动\\nmv  jdk1.8.0_201  /usr/local/\\n```\\n```\\n添加环境变量\\nvi /etc/profile\\n    在最下面粘贴内容\\n    export JAVA_HOME=/usr/local/jdk1.8.0_201/\\n    export PATH=$PATH:$JAVA_HOME/bin\\n刷新配置文件\\nsource /etc/profile\\n```\\n\\n```\\n检验java\\njava -version\\njavac -version\\n```\\n\\n\\n\",\"articleCover\":\"http://localhost:8081/articles/23aa483c7abb94e723f2ff7f6769a5f5.jpeg\",\"articleTitle\":\"在 Linux 系统中安装 jdk\",\"categoryName\":\"Linux命令类\",\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-15 05:46:28', NULL);
INSERT INTO `tb_operation_log` VALUES (1104, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"恭喜你成功运行博客，开启你的文章之旅吧。\",\"articleCover\":\"https://static.talkxj.com/articles/3dffb2fcbd541886616ab54c92570de3.jpg\",\"articleTitle\":\"测试文章\",\"categoryName\":\"测试分类\",\"id\":54,\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-15 05:46:56', NULL);
INSERT INTO `tb_operation_log` VALUES (1105, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"恭喜你成功运行博客，开启你的文章之旅吧。\",\"articleCover\":\"https://static.talkxj.com/articles/3dffb2fcbd541886616ab54c92570de3.jpg\",\"articleTitle\":\"测试文章\",\"categoryName\":\"测试分类\",\"id\":54,\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-15 05:47:35', NULL);
INSERT INTO `tb_operation_log` VALUES (1106, '文章模块', '修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.updateArticleDelete', '恢复或删除文章', '[{\"idList\":[54],\"isDelete\":1}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-15 05:47:46', NULL);
INSERT INTO `tb_operation_log` VALUES (1107, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"# 开启你的文章之旅吧\\n::: hljs-center\\n\\n开启你的文章之旅吧。开启你的文章之旅吧。\\n开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。\\n\\n:::\\n```language\\n开启你的文章之旅吧。开启你的文章之旅吧。\\n```\\n\\n::: hljs-right\\n\\n开启你的文章之旅吧。开启你的文章之旅吧。\\n开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。\\n\\n:::\\n\\n\\n开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。\\n开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。\\n\",\"articleCover\":\"http://localhost:8081/articles/c1be444f43283a567f557b8dfb29b2f5.jpeg\",\"articleTitle\":\"测试文章\",\"categoryName\":\"测试分类\",\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-15 05:50:35', NULL);
INSERT INTO `tb_operation_log` VALUES (1108, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"# 开启你的文章之旅吧\\n::: hljs-center\\n\\n开启你的文章之旅吧。开启你的文章之旅吧。\\n开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。\\n\\n:::\\n```language\\n开启你的文章之旅吧。开启你的文章之旅吧。\\n```\\n\\n::: hljs-right\\n\\n开启你的文章之旅吧。开启你的文章之旅吧。\\n开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。\\n\\n:::\\n\\n\\n开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。\\n开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。\\n\",\"articleCover\":\"http://localhost:8081/articles/c1be444f43283a567f557b8dfb29b2f5.jpeg\",\"articleTitle\":\"测试文章\",\"categoryName\":\"测试分类\",\"id\":57,\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-15 05:51:08', NULL);
INSERT INTO `tb_operation_log` VALUES (1109, '标签模块', '新增或修改', '/admin/tags', 'com.minzheng.blog.controller.TagController.saveOrUpdateTag', '添加或修改标签', '[{\"id\":29,\"tagName\":\"测试标\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-15 05:51:37', NULL);
INSERT INTO `tb_operation_log` VALUES (1110, '标签模块', '新增或修改', '/admin/tags', 'com.minzheng.blog.controller.TagController.saveOrUpdateTag', '添加或修改标签', '[{\"tagName\":\"测试标签\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-15 05:51:57', NULL);
INSERT INTO `tb_operation_log` VALUES (1111, '标签模块', '新增或修改', '/admin/tags', 'com.minzheng.blog.controller.TagController.saveOrUpdateTag', '添加或修改标签', '[{\"id\":29,\"tagName\":\"测试标\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-15 05:52:02', NULL);
INSERT INTO `tb_operation_log` VALUES (1112, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"\\n\\n# 有关Linux的一些命令\\n\\n```\\ndate -R \\t\\t#查看系统当前的时间\\n```\\n\\n\\n\\n# 安装jdk\\n\\n```\\n解压\\ntar  -zxvf jdk-8u201-linux-x64.tar.gz\\n```\\n```\\n移动\\nmv  jdk1.8.0_201  /usr/local/\\n```\\n```\\n添加环境变量\\nvi /etc/profile\\n    在最下面粘贴内容\\n    export JAVA_HOME=/usr/local/jdk1.8.0_201/\\n    export PATH=$PATH:$JAVA_HOME/bin\\n刷新配置文件\\nsource /etc/profile\\n```\\n\\n```\\n检验java\\njava -version\\njavac -version\\n```\\n\\n\\n\\n# 在线安装Docker系统\\n\\n**卸载docker的命令**\\n\\n```\\nsudo yum remove docker \\\\\\n                docker-client \\\\\\n                docker-client-latest \\\\\\n                docker-common \\\\\\n                docker-latest \\\\\\n                docker-latest-logrotate \\\\\\n                docker-logrotate \\\\\\n                docker-engine\\n```\\n\\n**第一步：安装所需的软件包。yum-utils 提供了 yum-config-manager**\\n\\n```\\nsudo yum install -y yum-utils \\\\\\n                    device-mapper-persistent-data \\\\\\n                    lvm2\\n```\\n\\n**第二步：设置 yum 仓库地址**\\n\\n```\\nsudo yum-config-manager \\\\\\n    --add-repo \\\\\\n    http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo\\n```\\n\\n**第三步：更新 yum 缓存**\\n\\n```\\nsudo yum makecache\\n```\\n**第四步：安装新版 docker**\\n\\n```\\nsudo yum install -y docker-ce docker-ce-cli containerd.io\\n```\\n\\n**第五步：安装成功以后，检查安装状态** \\n\\n```\\n查看版本指令：\\ndocker -v\\nsystemctl enable docker\\t\\t#设置开机自启动\\nsystemctl start docker\\t\\t#启动docker服务\\nsystemctl status docker\\t\\t#查看docker服务的状态\\ndocker info\\n```\\n\\n**第六步：设置镜像加速**\\n\\n```\\n$ mkdir -p /etc/docker\\n\\n$ tee /etc/docker/daemon.json <<-\'EOF\'\\n{\\n  \\\"registry-mirrors\\\": [\\n    \\\"http://hub-mirror.c.163.com\\\",\\n    \\\"https://sumd70pl.mirror.aliyuncs.com\\\"\\n  ]\\n}\\nEOF\\n\\n$ systemctl daemon-reload\\n\\n$ systemctl restart docker\\n```\\n\\n\\n\\n# 在Docker中安装MySQL5.7\\n\\n```\\n安装镜像\\n$ docker pull mysql:5.7\\n创建并启动容器\\n$ docker run -p 3307:3306 --name mysql --restart=always --privileged=true \\\\\\n        -v /docker_guazai/mysql/log:/var/log/mysql \\\\\\n        -v /docker_guazai/mysql/data:/var/lib/mysql \\\\\\n        -v /docker_guazai/mysql/conf:/etc/mysql/conf.d \\\\\\n        -e MYSQL_ROOT_PASSWORD=258025 \\\\\\n        -e TZ=Asia/Shanghai \\\\\\n        -d \\\\\\n        mysql:5.7\\n#此时就可以通过 Navicat 远程连接到所安装的 MySQL5.7 了。\\n#--privileged=true：获取宿主机root权限。\\n\\n# 进入容器里面\\n    docker exec -it mysql /bin/bash\\n    退出 eixt()\\n#查看MySQL环境变量：\\n    docker exec -it mysql env\\n#查看日志：docker logs -f mysql\\n```\\n\\n\\n\\n\\n\\n\",\"articleCover\":\"http://localhost:8081/articles/ba6abb0d280cb773535073e489064d2f.jpeg\",\"articleTitle\":\"Linux的一些命令\",\"categoryName\":\"测试分类\",\"id\":55,\"isTop\":1,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-15 05:52:32', NULL);
INSERT INTO `tb_operation_log` VALUES (1113, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"# 开启你的文章之旅吧\\n::: hljs-center\\n\\n开启你的文章之旅吧。开启你的文章之旅吧。\\n开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。\\n\\n:::\\n```language\\n开启你的文章之旅吧。开启你的文章之旅吧。\\n```\\n\\n::: hljs-right\\n\\n开启你的文章之旅吧。开启你的文章之旅吧。\\n开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。\\n\\n:::\\n\\n\\n开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。\\n开启你的文章之旅吧。开启你的文章之旅吧。开启你的文章之旅吧。\\n\",\"articleCover\":\"http://localhost:8081/articles/c1be444f43283a567f557b8dfb29b2f5.jpeg\",\"articleTitle\":\"测试文章\",\"categoryName\":\"测试分类\",\"id\":57,\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-15 05:52:54', NULL);
INSERT INTO `tb_operation_log` VALUES (1114, '标签模块', '新增或修改', '/admin/tags', 'com.minzheng.blog.controller.TagController.saveOrUpdateTag', '添加或修改标签', '[{\"id\":29,\"tagName\":\"测试标\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-15 05:53:08', NULL);
INSERT INTO `tb_operation_log` VALUES (1115, '文章模块', '删除', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.deleteArticles', '物理删除文章', '[[54]]', 'DELETE', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-15 05:53:25', NULL);
INSERT INTO `tb_operation_log` VALUES (1116, '标签模块', '删除', '/admin/tags', 'com.minzheng.blog.controller.TagController.deleteTag', '删除标签', '[[29]]', 'DELETE', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-15 05:53:31', NULL);
INSERT INTO `tb_operation_log` VALUES (1117, '博客信息模块', '修改', '/admin/about', 'com.minzheng.blog.controller.BlogInfoController.updateAbout', '修改关于我信息', '[{\"aboutContent\":\"# 今天你Giao了吗\\n今天也要元气满满哦！！！\"}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-15 07:11:06', NULL);
INSERT INTO `tb_operation_log` VALUES (1118, '友链模块', '删除', '/admin/links', 'com.minzheng.blog.controller.FriendLinkController.deleteFriendLink', '删除友链', '[[26]]', 'DELETE', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-23 11:53:32', NULL);
INSERT INTO `tb_operation_log` VALUES (1119, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"//常用maven命令\\n\\n*斜体*mvn -v //查看版本\\n## mvn archetype:create //创建 Maven 项目\\nmvn compile //编译源代码\\nmvn test-compile //编译测试代码\\nmvn test //运行应用程序中的单元测试\\nmvn site //生成项目相关信息的网站\\nmvn package //依据项目生成 jar 文件\\nmvn install //在本地 Repository 中安装 jar\\nmvn -Dmaven.test.skip=true //忽略测试文档编译\\nmvn clean //清除目标目录中的生成结果\\nmvn clean compile //将.java类编译为.class文件\\nmvn clean package //进行打包\\nmvn clean test //执行单元测试\\nmvn clean deploy //部署到版本仓库\\nmvn clean install //使其他项目使用这个jar,会安装到maven本地仓库中\\nmvn archetype:generate //创建项目架构\\nmvn dependency:list //查看已解析依赖\\nmvn dependency:tree //看到依赖树\\nmvn dependency:analyze //查看依赖的工具\\nmvn help:system //从中央仓库下载文件至本地仓库\\nmvn help:active-profiles //查看当前激活的profiles\\nmvn help:all-profiles //查看所有profiles\\nmvn help:effective -pom //查看完整的pom信息\\n\",\"articleCover\":\"http://localhost:8081/articles/fcad510614d0e84bb6cd0cb6eeda34d0.png\",\"articleTitle\":\"常用maven命令\",\"categoryName\":\"测试分类\",\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 00:39:50', NULL);
INSERT INTO `tb_operation_log` VALUES (1120, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"\\n\\n# 有关Linux的一些命令\\n\\n```\\ndate -R \\t\\t#查看系统当前的时间\\n```\\n\\n\\n\\n# 安装jdk\\n\\n```\\n解压\\ntar  -zxvf jdk-8u201-linux-x64.tar.gz\\n```\\n```\\n移动\\nmv  jdk1.8.0_201  /usr/local/\\n```\\n```\\n添加环境变量\\nvi /etc/profile\\n    在最下面粘贴内容\\n    export JAVA_HOME=/usr/local/jdk1.8.0_201/\\n    export PATH=$PATH:$JAVA_HOME/bin\\n刷新配置文件\\nsource /etc/profile\\n```\\n\\n```\\n检验java\\njava -version\\njavac -version\\n```\\n\\n\\n\\n# 在线安装Docker系统\\n\\n**卸载docker的命令**\\n\\n```\\nsudo yum remove docker \\\\\\n                docker-client \\\\\\n                docker-client-latest \\\\\\n                docker-common \\\\\\n                docker-latest \\\\\\n                docker-latest-logrotate \\\\\\n                docker-logrotate \\\\\\n                docker-engine\\n```\\n\\n**第一步：安装所需的软件包。yum-utils 提供了 yum-config-manager**\\n\\n```\\nsudo yum install -y yum-utils \\\\\\n                    device-mapper-persistent-data \\\\\\n                    lvm2\\n```\\n\\n**第二步：设置 yum 仓库地址**\\n\\n```\\nsudo yum-config-manager \\\\\\n    --add-repo \\\\\\n    http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo\\n```\\n\\n**第三步：更新 yum 缓存**\\n\\n```\\nsudo yum makecache\\n```\\n**第四步：安装新版 docker**\\n\\n```\\nsudo yum install -y docker-ce docker-ce-cli containerd.io\\n```\\n\\n**第五步：安装成功以后，检查安装状态** \\n\\n```\\n查看版本指令：\\ndocker -v\\nsystemctl enable docker\\t\\t#设置开机自启动\\nsystemctl start docker\\t\\t#启动docker服务\\nsystemctl status docker\\t\\t#查看docker服务的状态\\ndocker info\\n```\\n\\n**第六步：设置镜像加速**\\n\\n```\\n$ mkdir -p /etc/docker\\n\\n$ tee /etc/docker/daemon.json <<-\'EOF\'\\n{\\n  \\\"registry-mirrors\\\": [\\n    \\\"http://hub-mirror.c.163.com\\\",\\n    \\\"https://sumd70pl.mirror.aliyuncs.com\\\"\\n  ]\\n}\\nEOF\\n\\n$ systemctl daemon-reload\\n\\n$ systemctl restart docker\\n```\\n\\n\\n\\n# 在Docker中安装MySQL5.7\\n\\n```\\n安装镜像\\n$ docker pull mysql:5.7\\n创建并启动容器\\n$ docker run -p 3307:3306 --name mysql --restart=always --privileged=true \\\\\\n        -v /docker_guazai/mysql/log:/var/log/mysql \\\\\\n        -v /docker_guazai/mysql/data:/var/lib/mysql \\\\\\n        -v /docker_guazai/mysql/conf:/etc/mysql/conf.d \\\\\\n        -e MYSQL_ROOT_PASSWORD=258025 \\\\\\n        -e TZ=Asia/Shanghai \\\\\\n        -d \\\\\\n        mysql:5.7\\n#此时就可以通过 Navicat 远程连接到所安装的 MySQL5.7 了。\\n#--privileged=true：获取宿主机root权限。\\n\\n# 进入容器里面\\n    docker exec -it mysql /bin/bash\\n    退出 eixt()\\n#查看MySQL环境变量：\\n    docker exec -it mysql env\\n#查看日志：docker logs -f mysql\\n```\\n\\n\\n\\n\\n\\n\",\"articleCover\":\"http://localhost:8081/articles/ba6abb0d280cb773535073e489064d2f.jpeg\",\"articleTitle\":\"Linux的一些命令\",\"categoryName\":\"测试分类\",\"id\":55,\"isTop\":1,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 00:40:20', NULL);
INSERT INTO `tb_operation_log` VALUES (1121, '分类模块', '新增或修改', '/admin/categories', 'com.minzheng.blog.controller.CategoryController.saveOrUpdateCategory', '添加或修改分类', '[{\"categoryName\":\"Java学习\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 00:40:36', NULL);
INSERT INTO `tb_operation_log` VALUES (1122, '评论模块', '删除', '/admin/comments', 'com.minzheng.blog.controller.CommentController.deleteComments', '删除评论', '[[730]]', 'DELETE', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 00:40:57', NULL);
INSERT INTO `tb_operation_log` VALUES (1123, '留言模块', '删除', '/admin/messages', 'com.minzheng.blog.controller.MessageController.deleteMessages', '删除留言', '[[3942]]', 'DELETE', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 00:41:08', NULL);
INSERT INTO `tb_operation_log` VALUES (1124, '博客信息模块', '修改', '/admin/about', 'com.minzheng.blog.controller.BlogInfoController.updateAbout', '修改关于我信息', '[{\"aboutContent\":\"# 今天你Giao了吗\\n今天也要元气满满哦！！！\\n天天开心天天开心天天开心天天开心天天开心天天开心天天开心\\n天天开心天天开心天天开心天天开心天天开心天天开心\"}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 00:42:28', NULL);
INSERT INTO `tb_operation_log` VALUES (1125, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"//常用maven命令\\n### \\n**mvn -v //查看版本\\nmvn archetype:create //创建 Maven 项目\\nmvn compile //编译源代码\\nmvn test-compile //编译测试代码\\nmvn test //运行应用程序中的单元测试\\nmvn site //生成项目相关信息的网站\\nmvn package //依据项目生成 jar 文件**\\nmvn install //在本地 Repository 中安装 jar\\nmvn -Dmaven.test.skip=true //忽略测试文档编译\\nmvn clean //清除目标目录中的生成结果\\nmvn clean compile //将.java类编译为.class文件\\nmvn clean package //进行打包\\nmvn clean test //执行单元测试\\nmvn clean deploy //部署到版本仓库\\nmvn clean install //使其他项目使用这个jar,会安装到maven本地仓库中\\nmvn archetype:generate //创建项目架构\\nmvn dependency:list //查看已解析依赖\\nmvn dependency:tree //看到依赖树\\nmvn dependency:analyze //查看依赖的工具\\nmvn help:system //从中央仓库下载文件至本地仓库\\nmvn help:active-profiles //查看当前激活的profiles\\nmvn help:all-profiles //查看所有profiles\\nmvn help:effective -pom //查看完整的pom信息\\n\",\"articleCover\":\"http://localhost:8081/articles/c1be444f43283a567f557b8dfb29b2f5.jpeg\",\"articleTitle\":\"maven命令嘿嘿嘿\",\"categoryName\":\"测试分类\",\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:08:19', NULL);
INSERT INTO `tb_operation_log` VALUES (1126, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"\\n\\n# 有关Linux的一些命令\\n\\n```\\ndate -R \\t\\t#查看系统当前的时间\\n```\\n\\n\\n\\n# 安装jdk\\n\\n```\\n解压\\ntar  -zxvf jdk-8u201-linux-x64.tar.gz\\n```\\n```\\n移动\\nmv  jdk1.8.0_201  /usr/local/\\n```\\n```\\n添加环境变量\\nvi /etc/profile\\n    在最下面粘贴内容\\n    export JAVA_HOME=/usr/local/jdk1.8.0_201/\\n    export PATH=$PATH:$JAVA_HOME/bin\\n刷新配置文件\\nsource /etc/profile\\n```\\n\\n```\\n检验java\\njava -version\\njavac -version\\n```\\n\\n\\n\\n# 在线安装Docker系统\\n\\n**卸载docker的命令**\\n\\n```\\nsudo yum remove docker \\\\\\n                docker-client \\\\\\n                docker-client-latest \\\\\\n                docker-common \\\\\\n                docker-latest \\\\\\n                docker-latest-logrotate \\\\\\n                docker-logrotate \\\\\\n                docker-engine\\n```\\n\\n**第一步：安装所需的软件包。yum-utils 提供了 yum-config-manager**\\n\\n```\\nsudo yum install -y yum-utils \\\\\\n                    device-mapper-persistent-data \\\\\\n                    lvm2\\n```\\n\\n**第二步：设置 yum 仓库地址**\\n\\n```\\nsudo yum-config-manager \\\\\\n    --add-repo \\\\\\n    http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo\\n```\\n\\n**第三步：更新 yum 缓存**\\n\\n```\\nsudo yum makecache\\n```\\n**第四步：安装新版 docker**\\n\\n```\\nsudo yum install -y docker-ce docker-ce-cli containerd.io\\n```\\n\\n**第五步：安装成功以后，检查安装状态** \\n\\n```\\n查看版本指令：\\ndocker -v\\nsystemctl enable docker\\t\\t#设置开机自启动\\nsystemctl start docker\\t\\t#启动docker服务\\nsystemctl status docker\\t\\t#查看docker服务的状态\\ndocker info\\n```\\n\\n**第六步：设置镜像加速**\\n\\n```\\n$ mkdir -p /etc/docker\\n\\n$ tee /etc/docker/daemon.json <<-\'EOF\'\\n{\\n  \\\"registry-mirrors\\\": [\\n    \\\"http://hub-mirror.c.163.com\\\",\\n    \\\"https://sumd70pl.mirror.aliyuncs.com\\\"\\n  ]\\n}\\nEOF\\n\\n$ systemctl daemon-reload\\n\\n$ systemctl restart docker\\n```\\n\\n\\n\\n# 在Docker中安装MySQL5.7\\n\\n```\\n安装镜像\\n$ docker pull mysql:5.7\\n创建并启动容器\\n$ docker run -p 3307:3306 --name mysql --restart=always --privileged=true \\\\\\n        -v /docker_guazai/mysql/log:/var/log/mysql \\\\\\n        -v /docker_guazai/mysql/data:/var/lib/mysql \\\\\\n        -v /docker_guazai/mysql/conf:/etc/mysql/conf.d \\\\\\n        -e MYSQL_ROOT_PASSWORD=258025 \\\\\\n        -e TZ=Asia/Shanghai \\\\\\n        -d \\\\\\n        mysql:5.7\\n#此时就可以通过 Navicat 远程连接到所安装的 MySQL5.7 了。\\n#--privileged=true：获取宿主机root权限。\\n\\n# 进入容器里面\\n    docker exec -it mysql /bin/bash\\n    退出 eixt()\\n#查看MySQL环境变量：\\n    docker exec -it mysql env\\n#查看日志：docker logs -f mysql\\n```\\n\\n\\n\\n\\n\\n\",\"articleCover\":\"http://localhost:8081/articles/ba6abb0d280cb773535073e489064d2f.jpeg\",\"articleTitle\":\"Linux的一些命令\",\"categoryName\":\"测试分类\",\"id\":55,\"isTop\":1,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:08:56', NULL);
INSERT INTO `tb_operation_log` VALUES (1127, '分类模块', '新增或修改', '/admin/categories', 'com.minzheng.blog.controller.CategoryController.saveOrUpdateCategory', '添加或修改分类', '[{\"categoryName\":\"MYSQL学习\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:09:18', NULL);
INSERT INTO `tb_operation_log` VALUES (1128, '相册模块', '新增或修改', '/admin/photos/albums', 'com.minzheng.blog.controller.PhotoAlbumController.saveOrUpdatePhotoAlbum', '保存或更新相册', '[{\"albumCover\":\"http://localhost:8081/photos/c1be444f43283a567f557b8dfb29b2f5.jpeg\",\"albumDesc\":\"欢\",\"albumName\":\"huan\",\"status\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:11:02', NULL);
INSERT INTO `tb_operation_log` VALUES (1129, '照片模块', '新增', '/admin/photos', 'com.minzheng.blog.controller.PhotoController.savePhotos', '保存照片', '[{\"albumId\":9,\"photoUrlList\":[\"http://localhost:8081/photos/2f7a43075ff9f311926678fb0a04db9d.jpg\"]}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:11:11', NULL);
INSERT INTO `tb_operation_log` VALUES (1130, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"en命令\\n\\nmvn -v //查看版本\\nmvn archetype:create //创建 Maven 项目\\n# mvn compile //编译源代码\\nmvn test-compile //编译测试代码\\nmvn test //运行应用程序中的单元测试\\nmvn site //生成项目相关信息的网站\\nmvn package //依据项目生成 jar 文件\\nmvn install //在本地 Repository 中安装 jar\\nmvn -Dmaven.test.skip=true //忽略测试文档编译\\nmvn clean //清除目标目录中的生成结果\\nmvn clean compile //将.java类编译为.class文件\\nmvn clean package //进行打包\\nmvn clean test //执行单元测试\\nmvn clean deploy //部署到版本仓库\\nmvn clean install //使其他项目使用这个jar,会安装到maven本地仓库中\\nmvn archetype:generate //创建项目架构\\nmvn dependency:list //查看已解析依赖\\nmvn dependency:tree //看到依赖树\\nmvn dependency:analyze //查看依赖的工具\\nmvn help:system //从中央仓库下载文件至本地仓库\\nmvn help:active-profiles //查看当前激活的profiles\\nmvn help:all-profiles //查看所有profiles\\nmvn help:effective -pom //查看完整的pom信息\\n\",\"articleCover\":\"http://localhost:8081/articles/c1be444f43283a567f557b8dfb29b2f5.jpeg\",\"articleTitle\":\"常用maven命令哈哈哈哈\",\"categoryName\":\"测试分类\",\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:25:07', NULL);
INSERT INTO `tb_operation_log` VALUES (1131, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"\\n\\n# 有关Linux的一些命令\\n\\n```\\ndate -R \\t\\t#查看系统当前的时间\\n```\\n\\n\\n\\n# 安装jdk\\n\\n```\\n解压\\ntar  -zxvf jdk-8u201-linux-x64.tar.gz\\n```\\n```\\n移动\\nmv  jdk1.8.0_201  /usr/local/\\n```\\n```\\n添加环境变量\\nvi /etc/profile\\n    在最下面粘贴内容\\n    export JAVA_HOME=/usr/local/jdk1.8.0_201/\\n    export PATH=$PATH:$JAVA_HOME/bin\\n刷新配置文件\\nsource /etc/profile\\n```\\n\\n```\\n检验java\\njava -version\\njavac -version\\n```\\n\\n\\n\\n# 在线安装Docker系统\\n\\n**卸载docker的命令**\\n\\n```\\nsudo yum remove docker \\\\\\n                docker-client \\\\\\n                docker-client-latest \\\\\\n                docker-common \\\\\\n                docker-latest \\\\\\n                docker-latest-logrotate \\\\\\n                docker-logrotate \\\\\\n                docker-engine\\n```\\n\\n**第一步：安装所需的软件包。yum-utils 提供了 yum-config-manager**\\n\\n```\\nsudo yum install -y yum-utils \\\\\\n                    device-mapper-persistent-data \\\\\\n                    lvm2\\n```\\n\\n**第二步：设置 yum 仓库地址**\\n\\n```\\nsudo yum-config-manager \\\\\\n    --add-repo \\\\\\n    http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo\\n```\\n\\n**第三步：更新 yum 缓存**\\n\\n```\\nsudo yum makecache\\n```\\n**第四步：安装新版 docker**\\n\\n```\\nsudo yum install -y docker-ce docker-ce-cli containerd.io\\n```\\n\\n**第五步：安装成功以后，检查安装状态** \\n\\n```\\n查看版本指令：\\ndocker -v\\nsystemctl enable docker\\t\\t#设置开机自启动\\nsystemctl start docker\\t\\t#启动docker服务\\nsystemctl status docker\\t\\t#查看docker服务的状态\\ndocker info\\n```\\n\\n**第六步：设置镜像加速**\\n\\n```\\n$ mkdir -p /etc/docker\\n\\n$ tee /etc/docker/daemon.json <<-\'EOF\'\\n{\\n  \\\"registry-mirrors\\\": [\\n    \\\"http://hub-mirror.c.163.com\\\",\\n    \\\"https://sumd70pl.mirror.aliyuncs.com\\\"\\n  ]\\n}\\nEOF\\n\\n$ systemctl daemon-reload\\n\\n$ systemctl restart docker\\n```\\n\\n\\n\\n# 在Docker中安装MySQL5.7\\n\\n```\\n安装镜像\\n$ docker pull mysql:5.7\\n创建并启动容器\\n$ docker run -p 3307:3306 --name mysql --restart=always --privileged=true \\\\\\n        -v /docker_guazai/mysql/log:/var/log/mysql \\\\\\n        -v /docker_guazai/mysql/data:/var/lib/mysql \\\\\\n        -v /docker_guazai/mysql/conf:/etc/mysql/conf.d \\\\\\n        -e MYSQL_ROOT_PASSWORD=258025 \\\\\\n        -e TZ=Asia/Shanghai \\\\\\n        -d \\\\\\n        mysql:5.7\\n#此时就可以通过 Navicat 远程连接到所安装的 MySQL5.7 了。\\n#--privileged=true：获取宿主机root权限。\\n\\n# 进入容器里面\\n    docker exec -it mysql /bin/bash\\n    退出 eixt()\\n#查看MySQL环境变量：\\n    docker exec -it mysql env\\n#查看日志：docker logs -f mysql\\n```\\n\\n\\n\\n\\n\\n\",\"articleCover\":\"http://localhost:8081/articles/ba6abb0d280cb773535073e489064d2f.jpeg\",\"articleTitle\":\"Linux的一些命令\",\"categoryName\":\"测试分类\",\"id\":55,\"isTop\":1,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:25:42', NULL);
INSERT INTO `tb_operation_log` VALUES (1132, '文章模块', '修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.updateArticleDelete', '恢复或删除文章', '[{\"idList\":[59],\"isDelete\":1}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:25:49', NULL);
INSERT INTO `tb_operation_log` VALUES (1133, '博客信息模块', '修改', '/admin/about', 'com.minzheng.blog.controller.BlogInfoController.updateAbout', '修改关于我信息', '[{\"aboutContent\":\"# 今天你Giao了吗\\n今天也要元气满满哦！！！\\n天天开心天天开哈哈哈哈哈哈\\n快快快快快快\\n斤斤计较就按快快快\"}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:27:19', NULL);
INSERT INTO `tb_operation_log` VALUES (1134, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"//常用maven命令\\n\\nmvn -v //查看版本\\nmvn archetype:create //创建 Maven 项目\\nmvn compile //编译源代码\\nmvn test-compile //编译测试代码\\nmvn test //运行应用程序中的单元测试\\nmvn site //生成项目相关信息的网站\\nmvn package //依据项目生成 jar 文件\\nmvn install //在本地 Repository 中安装 jar\\nmvn -Dmaven.test.skip=true //忽略测试文档编译\\nmvn clean //清除目标目录中的生成结果\\nmvn clean compile //将.java类编译为.class文件\\nmvn clean package //进行打包\\nmvn clean test //执行单元测试\\nmvn clean deploy //部署到版本仓库\\nmvn clean install //使其他项目使用这个jar,会安装到maven本地仓库中\\nmvn archetype:generate //创建项目架构\\nmvn dependency:list //查看已解析依赖\\nmvn dependency:tree //看到依赖树\\nmvn dependency:analyze //查看依赖的工具\\nmvn help:system //从中央仓库下载文件至本地仓库\\nmvn help:active-profiles //查看当前激活的profiles\\nmvn help:all-profiles //查看所有profiles\\nmvn help:effective -pom //查看完整的pom信息\\n\",\"articleCover\":\"http://localhost:8081/articles/23aa483c7abb94e723f2ff7f6769a5f5.jpeg\",\"articleTitle\":\"maven\",\"categoryName\":\"测试分类\",\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:37:43', NULL);
INSERT INTO `tb_operation_log` VALUES (1135, '文章模块', '修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.updateArticleDelete', '恢复或删除文章', '[{\"idList\":[58],\"isDelete\":1}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:38:07', NULL);
INSERT INTO `tb_operation_log` VALUES (1136, '相册模块', '新增或修改', '/admin/photos/albums', 'com.minzheng.blog.controller.PhotoAlbumController.saveOrUpdatePhotoAlbum', '保存或更新相册', '[{\"albumCover\":\"http://localhost:8081/photos/23aa483c7abb94e723f2ff7f6769a5f5.jpeg\",\"albumDesc\":\"文\",\"albumName\":\"文\",\"status\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:39:38', NULL);
INSERT INTO `tb_operation_log` VALUES (1137, '照片模块', '新增', '/admin/photos', 'com.minzheng.blog.controller.PhotoController.savePhotos', '保存照片', '[{\"albumId\":10,\"photoUrlList\":[\"http://localhost:8081/photos/a06c635dded53ee26a6ae8fde4feba42.png\"]}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:39:46', NULL);
INSERT INTO `tb_operation_log` VALUES (1138, '博客信息模块', '修改', '/admin/about', 'com.minzheng.blog.controller.BlogInfoController.updateAbout', '修改关于我信息', '[{\"aboutContent\":\"# 今天你Giao了吗\\n今天也要元气满满哦！！！\\n天天通天塔吞吞吐吐\\ntttttt\\n\\nt通天塔吞吞吐吐\"}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:40:33', NULL);
INSERT INTO `tb_operation_log` VALUES (1139, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"//常用maven命令\\n\\nmvn -v //查看版本\\nmvn archetype:create //创建 Maven 项目\\nmvn compile //编译源代码\\nmvn test-compile //编译测试代码\\nmvn test //运行应用程序中的单元测试\\nmvn site //生成项目相关信息的网站\\nmvn package //依据项目生成 jar 文件\\nmvn install //在本地 Repository 中安装 jar\\nmvn -Dmaven.test.skip=true //忽略测试文档编译\\nmvn clean //清除目标目录中的生成结果\\nmvn clean compile //将.java类编译为.class文件\\nmvn clean package //进行打包\\nmvn clean test //执行单元测试\\nmvn clean deploy //部署到版本仓库\\nmvn clean install //使其他项目使用这个jar,会安装到maven本地仓库中\\nmvn archetype:generate //创建项目架构\\nmvn dependency:list //查看已解析依赖\\nmvn dependency:tree //看到依赖树\\nmvn dependency:analyze //查看依赖的工具\\nmvn help:system //从中央仓库下载文件至本地仓库\\nmvn help:active-profiles //查看当前激活的profiles\\nmvn help:all-profiles //查看所有profiles\\nmvn help:effective -pom //查看完整的pom信息\\n\",\"articleCover\":\"http://localhost:8081/articles/23aa483c7abb94e723f2ff7f6769a5f5.jpeg\",\"articleTitle\":\"mavenmavenmavenmavenmaven\",\"categoryName\":\"测试分类\",\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:49:26', NULL);
INSERT INTO `tb_operation_log` VALUES (1140, '文章模块', '修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.updateArticleDelete', '恢复或删除文章', '[{\"idList\":[61],\"isDelete\":1}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:49:43', NULL);
INSERT INTO `tb_operation_log` VALUES (1141, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"//常用maven命令\\n\\nmvn -v //查看版本\\nmvn archetype:create //创建 Maven 项目\\nmvn compile //编译源代码\\nmvn test-compile //编译测试代码\\nmvn test //运行应用程序中的单元测试\\nmvn site //生成项目相关信息的网站\\nmvn package //依据项目生成 jar 文件\\nmvn install //在本地 Repository 中安装 jar\\nmvn -Dmaven.test.skip=true //忽略测试文档编译\\nmvn clean //清除目标目录中的生成结果\\nmvn clean compile //将.java类编译为.class文件\\nmvn clean package //进行打包\\nmvn clean test //执行单元测试\\nmvn clean deploy //部署到版本仓库\\nmvn clean install //使其他项目使用这个jar,会安装到maven本地仓库中\\nmvn archetype:generate //创建项目架构\\nmvn dependency:list //查看已解析依赖\\nmvn dependency:tree //看到依赖树\\nmvn dependency:analyze //查看依赖的工具\\nmvn help:system //从中央仓库下载文件至本地仓库\\nmvn help:active-profiles //查看当前激活的profiles\\nmvn help:all-profiles //查看所有profiles\\nmvn help:effective -pom //查看完整的pom信息\\n\",\"articleCover\":\"http://localhost:8081/articles/23aa483c7abb94e723f2ff7f6769a5f5.jpeg\",\"articleTitle\":\"mavenmavenmavenmavenmaven\",\"categoryName\":\"测试分类\",\"id\":62,\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:49:49', NULL);
INSERT INTO `tb_operation_log` VALUES (1142, '博客信息模块', '修改', '/admin/about', 'com.minzheng.blog.controller.BlogInfoController.updateAbout', '修改关于我信息', '[{\"aboutContent\":\"# 今天你Giao了吗\\n今天也要元气满满哦！！！\\n天天通天塔吞吞吐吐\\ntttttt\\n\\nt通天塔吞吞吐吐\\n很符合东风浩荡发货后\\n\\n\\n哈哈哈哈哈哈哈\\n\\nhhhh\"}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:51:03', NULL);
INSERT INTO `tb_operation_log` VALUES (1143, '相册模块', '新增或修改', '/admin/photos/albums', 'com.minzheng.blog.controller.PhotoAlbumController.saveOrUpdatePhotoAlbum', '保存或更新相册', '[{\"albumCover\":\"http://localhost:8081/photos/f12a55b6c2d1f48140793fc14ccf1947.jpeg\",\"albumDesc\":\"呀呀呀呀呀呀\",\"albumName\":\"加油\",\"status\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:51:38', NULL);
INSERT INTO `tb_operation_log` VALUES (1144, '照片模块', '新增', '/admin/photos', 'com.minzheng.blog.controller.PhotoController.savePhotos', '保存照片', '[{\"albumId\":11,\"photoUrlList\":[\"http://localhost:8081/photos/a06c635dded53ee26a6ae8fde4feba42.png\"]}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:51:45', NULL);
INSERT INTO `tb_operation_log` VALUES (1145, '照片模块', '新增', '/admin/photos', 'com.minzheng.blog.controller.PhotoController.savePhotos', '保存照片', '[{\"albumId\":11,\"photoUrlList\":[\"http://localhost:8081/photos/23aa483c7abb94e723f2ff7f6769a5f5.jpeg\"]}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2023-05-30 01:51:51', NULL);

-- ----------------------------
-- Table structure for tb_page
-- ----------------------------
DROP TABLE IF EXISTS `tb_page`;
CREATE TABLE `tb_page`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '页面id',
  `page_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '页面名',
  `page_label` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '页面标签',
  `page_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '页面封面',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 906 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '页面' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_page
-- ----------------------------
INSERT INTO `tb_page` VALUES (1, '首页', 'home', 'http://localhost:8081/config/7676f14f45504d760a4884341003cd0a.jpeg', '2023-04-07 10:32:36', '2023-05-10 18:15:47');
INSERT INTO `tb_page` VALUES (2, '归档', 'archive', 'http://localhost:8081/config/c1be444f43283a567f557b8dfb29b2f5.jpeg', '2023-04-07 10:32:36', '2023-05-10 18:27:49');
INSERT INTO `tb_page` VALUES (3, '分类', 'category', 'http://localhost:8081/config/c1be444f43283a567f557b8dfb29b2f5.jpeg', '2023-04-07 10:32:36', '2023-05-10 18:28:18');
INSERT INTO `tb_page` VALUES (4, '标签', 'tag', 'http://localhost:8081/config/c1be444f43283a567f557b8dfb29b2f5.jpeg', '2023-04-07 10:32:36', '2023-05-10 18:28:39');
INSERT INTO `tb_page` VALUES (5, '相册', 'album', 'http://localhost:8081/config/c1be444f43283a567f557b8dfb29b2f5.jpeg', '2023-04-07 10:32:36', '2023-05-10 18:28:54');
INSERT INTO `tb_page` VALUES (6, '友链', 'link', 'http://localhost:8081/config/c1be444f43283a567f557b8dfb29b2f5.jpeg', '2023-04-07 10:32:36', '2023-05-10 18:29:01');
INSERT INTO `tb_page` VALUES (7, '关于', 'about', 'http://localhost:8081/config/c1be444f43283a567f557b8dfb29b2f5.jpeg', '2023-04-07 10:32:36', '2023-05-10 18:29:09');
INSERT INTO `tb_page` VALUES (8, '留言', 'message', 'http://localhost:8081/config/2f7a43075ff9f311926678fb0a04db9d.jpg', '2023-04-07 10:32:36', '2023-05-10 18:18:31');
INSERT INTO `tb_page` VALUES (9, '个人中心', 'user', 'http://localhost:8081/config/c1be444f43283a567f557b8dfb29b2f5.jpeg', '2023-04-07 10:32:36', '2023-05-10 18:29:17');
INSERT INTO `tb_page` VALUES (10, '文章列表', 'articleList', 'http://localhost:8081/config/c1be444f43283a567f557b8dfb29b2f5.jpeg', '2023-04-10 15:36:19', '2023-05-10 18:29:24');
INSERT INTO `tb_page` VALUES (904, '说说', 'talk', 'http://localhost:8081/config/c1be444f43283a567f557b8dfb29b2f5.jpeg', '2023-04-23 00:51:24', '2023-05-10 18:29:31');
INSERT INTO `tb_page` VALUES (905, 'AAA页面', 'testAAA', 'http://localhost:8081/config/23aa483c7abb94e723f2ff7f6769a5f5.jpeg', '2023-05-10 17:57:32', '2023-05-10 18:29:46');

-- ----------------------------
-- Table structure for tb_photo
-- ----------------------------
DROP TABLE IF EXISTS `tb_photo`;
CREATE TABLE `tb_photo`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `album_id` int NOT NULL COMMENT '相册id',
  `photo_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '照片名',
  `photo_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '照片描述',
  `photo_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '照片地址',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '照片' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_photo
-- ----------------------------
INSERT INTO `tb_photo` VALUES (29, 8, '1656237352349184002', NULL, 'http://localhost:8081/photos/104d17eaf876c2846696ba2f1231cef9.jpeg', 0, '2023-05-10 17:58:51', NULL);
INSERT INTO `tb_photo` VALUES (30, 8, '1656237352349184003', NULL, 'http://localhost:8081/photos/7676f14f45504d760a4884341003cd0a.jpeg', 0, '2023-05-10 17:58:51', NULL);
INSERT INTO `tb_photo` VALUES (31, 9, '1663231521919709186', NULL, 'http://localhost:8081/photos/2f7a43075ff9f311926678fb0a04db9d.jpg', 0, '2023-05-30 01:11:11', NULL);
INSERT INTO `tb_photo` VALUES (32, 10, '1663238714593153025', NULL, 'http://localhost:8081/photos/a06c635dded53ee26a6ae8fde4feba42.png', 0, '2023-05-30 01:39:46', NULL);
INSERT INTO `tb_photo` VALUES (33, 11, '1663241732227104769', NULL, 'http://localhost:8081/photos/a06c635dded53ee26a6ae8fde4feba42.png', 0, '2023-05-30 01:51:45', NULL);
INSERT INTO `tb_photo` VALUES (34, 11, '1663241756751200257', NULL, 'http://localhost:8081/photos/23aa483c7abb94e723f2ff7f6769a5f5.jpeg', 0, '2023-05-30 01:51:51', NULL);

-- ----------------------------
-- Table structure for tb_photo_album
-- ----------------------------
DROP TABLE IF EXISTS `tb_photo_album`;
CREATE TABLE `tb_photo_album`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `album_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '相册名',
  `album_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '相册描述',
  `album_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '相册封面',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态值 1公开 2私密',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '相册' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_photo_album
-- ----------------------------
INSERT INTO `tb_photo_album` VALUES (8, '相册A', '相册A很good', 'http://localhost:8081/photos/979bd491f5fb216eb5df80321cd4a470.jpg', 0, 1, '2023-05-10 17:58:26', NULL);
INSERT INTO `tb_photo_album` VALUES (9, 'huan', '欢', 'http://localhost:8081/photos/c1be444f43283a567f557b8dfb29b2f5.jpeg', 0, 1, '2023-05-30 01:11:02', NULL);
INSERT INTO `tb_photo_album` VALUES (10, '文', '文', 'http://localhost:8081/photos/23aa483c7abb94e723f2ff7f6769a5f5.jpeg', 0, 1, '2023-05-30 01:39:38', NULL);
INSERT INTO `tb_photo_album` VALUES (11, '加油', '呀呀呀呀呀呀', 'http://localhost:8081/photos/f12a55b6c2d1f48140793fc14ccf1947.jpeg', 0, 1, '2023-05-30 01:51:38', NULL);

-- ----------------------------
-- Table structure for tb_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_resource`;
CREATE TABLE `tb_resource`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resource_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资源名',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限路径',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方式',
  `parent_id` int NULL DEFAULT NULL COMMENT '父权限id',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否匿名访问 0否 1是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 288 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_resource
-- ----------------------------
INSERT INTO `tb_resource` VALUES (165, '分类模块', NULL, NULL, NULL, 0, '2023-04-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (166, '博客信息模块', NULL, NULL, NULL, 0, '2023-04-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (167, '友链模块', NULL, NULL, NULL, 0, '2023-04-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (168, '文章模块', NULL, NULL, NULL, 0, '2023-04-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (169, '日志模块', NULL, NULL, NULL, 0, '2023-04-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (170, '标签模块', NULL, NULL, NULL, 0, '2023-04-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (171, '照片模块', NULL, NULL, NULL, 0, '2023-04-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (172, '用户信息模块', NULL, NULL, NULL, 0, '2023-04-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (173, '用户账号模块', NULL, NULL, NULL, 0, '2023-04-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (174, '留言模块', NULL, NULL, NULL, 0, '2023-04-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (175, '相册模块', NULL, NULL, NULL, 0, '2023-04-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (176, '菜单模块', NULL, NULL, NULL, 0, '2023-04-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (177, '角色模块', NULL, NULL, NULL, 0, '2023-04-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (178, '评论模块', NULL, NULL, NULL, 0, '2023-04-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (179, '资源模块', NULL, NULL, NULL, 0, '2023-04-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (180, '页面模块', NULL, NULL, NULL, 0, '2023-04-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (181, '查看博客信息', '/', 'GET', 166, 1, '2023-04-11 21:04:22', '2023-04-11 21:05:29');
INSERT INTO `tb_resource` VALUES (182, '查看关于我信息', '/about', 'GET', 166, 1, '2023-04-11 21:04:22', '2023-04-11 21:05:29');
INSERT INTO `tb_resource` VALUES (183, '查看后台信息', '/admin', 'GET', 166, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (184, '修改关于我信息', '/admin/about', 'PUT', 166, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (185, '查看后台文章', '/admin/articles', 'GET', 168, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (186, '添加或修改文章', '/admin/articles', 'POST', 168, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (187, '恢复或删除文章', '/admin/articles', 'PUT', 168, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (188, '物理删除文章', '/admin/articles', 'DELETE', 168, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (189, '上传文章图片', '/admin/articles/images', 'POST', 168, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (190, '修改文章置顶', '/admin/articles/top', 'PUT', 168, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (191, '根据id查看后台文章', '/admin/articles/*', 'GET', 168, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (192, '查看后台分类列表', '/admin/categories', 'GET', 165, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (193, '添加或修改分类', '/admin/categories', 'POST', 165, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (194, '删除分类', '/admin/categories', 'DELETE', 165, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (195, '搜索文章分类', '/admin/categories/search', 'GET', 165, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (196, '查询后台评论', '/admin/comments', 'GET', 178, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (197, '删除评论', '/admin/comments', 'DELETE', 178, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (198, '审核评论', '/admin/comments/review', 'PUT', 178, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (199, '查看后台友链列表', '/admin/links', 'GET', 167, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (200, '保存或修改友链', '/admin/links', 'POST', 167, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (201, '删除友链', '/admin/links', 'DELETE', 167, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (202, '查看菜单列表', '/admin/menus', 'GET', 176, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (203, '新增或修改菜单', '/admin/menus', 'POST', 176, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (204, '删除菜单', '/admin/menus/*', 'DELETE', 176, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (205, '查看后台留言列表', '/admin/messages', 'GET', 174, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (206, '删除留言', '/admin/messages', 'DELETE', 174, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (207, '审核留言', '/admin/messages/review', 'PUT', 174, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (208, '查看操作日志', '/admin/operation/logs', 'GET', 169, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (209, '删除操作日志', '/admin/operation/logs', 'DELETE', 169, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (210, '获取页面列表', '/admin/pages', 'GET', 180, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (211, '保存或更新页面', '/admin/pages', 'POST', 180, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (212, '删除页面', '/admin/pages/*', 'DELETE', 180, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (213, '根据相册id获取照片列表', '/admin/photos', 'GET', 171, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (214, '保存照片', '/admin/photos', 'POST', 171, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (215, '更新照片信息', '/admin/photos', 'PUT', 171, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (216, '删除照片', '/admin/photos', 'DELETE', 171, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (217, '移动照片相册', '/admin/photos/album', 'PUT', 171, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (218, '查看后台相册列表', '/admin/photos/albums', 'GET', 175, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (219, '保存或更新相册', '/admin/photos/albums', 'POST', 175, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (220, '上传相册封面', '/admin/photos/albums/cover', 'POST', 175, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (221, '获取后台相册列表信息', '/admin/photos/albums/info', 'GET', 175, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (222, '根据id删除相册', '/admin/photos/albums/*', 'DELETE', 175, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (223, '根据id获取后台相册信息', '/admin/photos/albums/*/info', 'GET', 175, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (224, '更新照片删除状态', '/admin/photos/delete', 'PUT', 171, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (225, '查看资源列表', '/admin/resources', 'GET', 179, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (226, '新增或修改资源', '/admin/resources', 'POST', 179, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (227, '导入swagger接口', '/admin/resources/import/swagger', 'GET', 179, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (228, '删除资源', '/admin/resources/*', 'DELETE', 179, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (229, '保存或更新角色', '/admin/role', 'POST', 177, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (230, '查看角色菜单选项', '/admin/role/menus', 'GET', 176, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (231, '查看角色资源选项', '/admin/role/resources', 'GET', 179, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (232, '查询角色列表', '/admin/roles', 'GET', 177, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (233, '删除角色', '/admin/roles', 'DELETE', 177, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (234, '查询后台标签列表', '/admin/tags', 'GET', 170, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (235, '添加或修改标签', '/admin/tags', 'POST', 170, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (236, '删除标签', '/admin/tags', 'DELETE', 170, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (237, '搜索文章标签', '/admin/tags/search', 'GET', 170, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (238, '查看当前用户菜单', '/admin/user/menus', 'GET', 176, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (239, '查询后台用户列表', '/admin/users', 'GET', 173, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (240, '修改用户禁用状态', '/admin/users/disable', 'PUT', 172, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (241, '查看在线用户', '/admin/users/online', 'GET', 172, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (242, '修改管理员密码', '/admin/users/password', 'PUT', 173, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (243, '查询用户角色选项', '/admin/users/role', 'GET', 177, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (244, '修改用户角色', '/admin/users/role', 'PUT', 172, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (245, '下线用户', '/admin/users/*/online', 'DELETE', 172, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (246, '获取网站配置', '/admin/website/config', 'GET', 166, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (247, '更新网站配置', '/admin/website/config', 'PUT', 166, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (248, '根据相册id查看照片列表', '/albums/*/photos', 'GET', 171, 1, '2023-04-11 21:04:22', '2023-04-11 21:06:35');
INSERT INTO `tb_resource` VALUES (249, '查看首页文章', '/articles', 'GET', 168, 1, '2023-04-11 21:04:22', '2023-04-11 21:05:45');
INSERT INTO `tb_resource` VALUES (250, '查看文章归档', '/articles/archives', 'GET', 168, 1, '2023-04-11 21:04:22', '2023-04-11 21:05:47');
INSERT INTO `tb_resource` VALUES (251, '根据条件查询文章', '/articles/condition', 'GET', 168, 1, '2023-04-11 21:04:22', '2023-04-11 21:05:47');
INSERT INTO `tb_resource` VALUES (252, '搜索文章', '/articles/search', 'GET', 168, 1, '2023-04-11 21:04:22', '2023-04-11 21:05:48');
INSERT INTO `tb_resource` VALUES (253, '根据id查看文章', '/articles/*', 'GET', 168, 1, '2023-04-11 21:04:22', '2023-04-11 21:05:49');
INSERT INTO `tb_resource` VALUES (254, '点赞文章', '/articles/*/like', 'POST', 168, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (255, '查看分类列表', '/categories', 'GET', 165, 1, '2023-04-11 21:04:22', '2023-04-11 21:05:26');
INSERT INTO `tb_resource` VALUES (256, '查询评论', '/comments', 'GET', 178, 1, '2023-04-11 21:04:22', '2023-04-11 21:07:33');
INSERT INTO `tb_resource` VALUES (257, '添加评论', '/comments', 'POST', 178, 0, '2023-04-11 21:04:22', '2023-04-11 21:10:05');
INSERT INTO `tb_resource` VALUES (258, '评论点赞', '/comments/*/like', 'POST', 178, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (259, '查询评论下的回复', '/comments/*/replies', 'GET', 178, 1, '2023-04-11 21:04:22', '2023-04-11 21:07:30');
INSERT INTO `tb_resource` VALUES (260, '查看友链列表', '/links', 'GET', 167, 1, '2023-04-11 21:04:22', '2023-04-11 21:05:41');
INSERT INTO `tb_resource` VALUES (261, '查看留言列表', '/messages', 'GET', 174, 1, '2023-04-11 21:04:22', '2023-04-11 21:07:14');
INSERT INTO `tb_resource` VALUES (262, '添加留言', '/messages', 'POST', 174, 1, '2023-04-11 21:04:22', '2023-04-11 21:07:15');
INSERT INTO `tb_resource` VALUES (263, '获取相册列表', '/photos/albums', 'GET', 175, 1, '2023-04-11 21:04:22', '2023-04-11 21:07:20');
INSERT INTO `tb_resource` VALUES (264, '用户注册', '/register', 'POST', 173, 1, '2023-04-11 21:04:22', '2023-04-11 21:07:01');
INSERT INTO `tb_resource` VALUES (265, '查询标签列表', '/tags', 'GET', 170, 1, '2023-04-11 21:04:22', '2023-04-11 21:06:30');
INSERT INTO `tb_resource` VALUES (267, '更新用户头像', '/users/avatar', 'POST', 172, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (268, '发送邮箱验证码', '/users/code', 'GET', 173, 1, '2023-04-11 21:04:22', '2023-04-11 21:07:02');
INSERT INTO `tb_resource` VALUES (269, '绑定用户邮箱', '/users/email', 'POST', 172, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (270, '更新用户信息', '/users/info', 'PUT', 172, 0, '2023-04-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (271, 'qq登录', '/users/oauth/qq', 'POST', 173, 1, '2023-04-11 21:04:22', '2023-04-11 21:07:06');
INSERT INTO `tb_resource` VALUES (272, '微博登录', '/users/oauth/weibo', 'POST', 173, 1, '2023-04-11 21:04:22', '2023-04-11 21:07:06');
INSERT INTO `tb_resource` VALUES (273, '修改密码', '/users/password', 'PUT', 173, 1, '2023-04-11 21:04:22', '2023-04-11 21:07:09');
INSERT INTO `tb_resource` VALUES (274, '上传语音', '/voice', 'POST', 166, 1, '2023-04-11 21:04:22', '2023-04-11 21:05:33');
INSERT INTO `tb_resource` VALUES (275, '上传访客信息', '/report', 'POST', 166, 1, '2023-04-24 00:32:05', '2023-04-24 00:32:07');
INSERT INTO `tb_resource` VALUES (276, '获取用户区域分布', '/admin/users/area', 'GET', 173, 0, '2023-04-24 00:32:35', '2023-04-24 16:25:34');
INSERT INTO `tb_resource` VALUES (278, '说说模块', NULL, NULL, NULL, 0, '2023-04-24 01:29:13', NULL);
INSERT INTO `tb_resource` VALUES (279, '查看首页说说', '/home/talks', 'GET', 278, 1, '2023-04-24 01:29:29', '2023-04-24 01:31:56');
INSERT INTO `tb_resource` VALUES (280, '查看说说列表', '/talks', 'GET', 278, 1, '2023-04-24 01:29:52', '2023-04-24 01:31:56');
INSERT INTO `tb_resource` VALUES (281, '根据id查看说说', '/talks/*', 'GET', 278, 1, '2023-04-24 01:30:10', '2023-04-24 01:31:57');
INSERT INTO `tb_resource` VALUES (282, '点赞说说', '/talks/*/like', 'POST', 278, 0, '2023-04-24 01:30:30', NULL);
INSERT INTO `tb_resource` VALUES (283, '上传说说图片', '/admin/talks/images', 'POST', 278, 0, '2023-04-24 01:30:46', NULL);
INSERT INTO `tb_resource` VALUES (284, '保存或修改说说', '/admin/talks', 'POST', 278, 0, '2023-04-24 01:31:04', NULL);
INSERT INTO `tb_resource` VALUES (285, '删除说说', '/admin/talks', 'DELETE', 278, 0, '2023-04-24 01:31:22', NULL);
INSERT INTO `tb_resource` VALUES (286, '查看后台说说', '/admin/talks', 'GET', 278, 0, '2023-04-24 01:31:38', NULL);
INSERT INTO `tb_resource` VALUES (287, '根据id查看后台说说', '/admin/talks/*', 'GET', 278, 0, '2023-04-24 01:31:53', '2023-04-24 01:33:14');

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名',
  `role_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色描述',
  `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用  0否 1是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES (1, '管理员', 'admin', 0, '2023-04-22 14:10:21', '2023-04-24 01:32:26');
INSERT INTO `tb_role` VALUES (2, '用户', 'user', 0, '2023-04-22 14:25:25', '2023-04-24 01:32:21');
INSERT INTO `tb_role` VALUES (3, '测试', 'test', 0, '2023-04-22 14:42:23', '2023-04-24 01:32:59');

-- ----------------------------
-- Table structure for tb_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_menu`;
CREATE TABLE `tb_role_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int NULL DEFAULT NULL COMMENT '角色id',
  `menu_id` int NULL DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2527 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role_menu
-- ----------------------------
INSERT INTO `tb_role_menu` VALUES (1397, 8, 1);
INSERT INTO `tb_role_menu` VALUES (1398, 8, 2);
INSERT INTO `tb_role_menu` VALUES (1399, 8, 6);
INSERT INTO `tb_role_menu` VALUES (1400, 8, 7);
INSERT INTO `tb_role_menu` VALUES (1401, 8, 8);
INSERT INTO `tb_role_menu` VALUES (1402, 8, 9);
INSERT INTO `tb_role_menu` VALUES (1403, 8, 10);
INSERT INTO `tb_role_menu` VALUES (1404, 8, 3);
INSERT INTO `tb_role_menu` VALUES (1405, 8, 11);
INSERT INTO `tb_role_menu` VALUES (1406, 8, 12);
INSERT INTO `tb_role_menu` VALUES (1407, 8, 202);
INSERT INTO `tb_role_menu` VALUES (1408, 8, 13);
INSERT INTO `tb_role_menu` VALUES (1409, 8, 14);
INSERT INTO `tb_role_menu` VALUES (1410, 8, 201);
INSERT INTO `tb_role_menu` VALUES (1411, 8, 4);
INSERT INTO `tb_role_menu` VALUES (1412, 8, 16);
INSERT INTO `tb_role_menu` VALUES (1413, 8, 15);
INSERT INTO `tb_role_menu` VALUES (1414, 8, 17);
INSERT INTO `tb_role_menu` VALUES (1415, 8, 18);
INSERT INTO `tb_role_menu` VALUES (1416, 8, 19);
INSERT INTO `tb_role_menu` VALUES (1417, 8, 20);
INSERT INTO `tb_role_menu` VALUES (1418, 8, 5);
INSERT INTO `tb_role_menu` VALUES (1595, 9, 1);
INSERT INTO `tb_role_menu` VALUES (1596, 9, 2);
INSERT INTO `tb_role_menu` VALUES (1597, 9, 6);
INSERT INTO `tb_role_menu` VALUES (1598, 9, 7);
INSERT INTO `tb_role_menu` VALUES (1599, 9, 8);
INSERT INTO `tb_role_menu` VALUES (1600, 9, 9);
INSERT INTO `tb_role_menu` VALUES (1601, 9, 10);
INSERT INTO `tb_role_menu` VALUES (1602, 9, 3);
INSERT INTO `tb_role_menu` VALUES (1603, 9, 11);
INSERT INTO `tb_role_menu` VALUES (1604, 9, 12);
INSERT INTO `tb_role_menu` VALUES (1605, 9, 202);
INSERT INTO `tb_role_menu` VALUES (1606, 9, 13);
INSERT INTO `tb_role_menu` VALUES (1607, 9, 14);
INSERT INTO `tb_role_menu` VALUES (1608, 9, 201);
INSERT INTO `tb_role_menu` VALUES (1609, 9, 4);
INSERT INTO `tb_role_menu` VALUES (1610, 9, 16);
INSERT INTO `tb_role_menu` VALUES (1611, 9, 15);
INSERT INTO `tb_role_menu` VALUES (1612, 9, 17);
INSERT INTO `tb_role_menu` VALUES (1613, 9, 18);
INSERT INTO `tb_role_menu` VALUES (1614, 9, 19);
INSERT INTO `tb_role_menu` VALUES (1615, 9, 20);
INSERT INTO `tb_role_menu` VALUES (1616, 9, 5);
INSERT INTO `tb_role_menu` VALUES (1639, 13, 2);
INSERT INTO `tb_role_menu` VALUES (1640, 13, 6);
INSERT INTO `tb_role_menu` VALUES (1641, 13, 7);
INSERT INTO `tb_role_menu` VALUES (1642, 13, 8);
INSERT INTO `tb_role_menu` VALUES (1643, 13, 9);
INSERT INTO `tb_role_menu` VALUES (1644, 13, 10);
INSERT INTO `tb_role_menu` VALUES (1645, 13, 3);
INSERT INTO `tb_role_menu` VALUES (1646, 13, 11);
INSERT INTO `tb_role_menu` VALUES (1647, 13, 12);
INSERT INTO `tb_role_menu` VALUES (2366, 14, 1);
INSERT INTO `tb_role_menu` VALUES (2367, 14, 2);
INSERT INTO `tb_role_menu` VALUES (2461, 1, 1);
INSERT INTO `tb_role_menu` VALUES (2462, 1, 2);
INSERT INTO `tb_role_menu` VALUES (2463, 1, 6);
INSERT INTO `tb_role_menu` VALUES (2464, 1, 7);
INSERT INTO `tb_role_menu` VALUES (2465, 1, 8);
INSERT INTO `tb_role_menu` VALUES (2466, 1, 9);
INSERT INTO `tb_role_menu` VALUES (2467, 1, 10);
INSERT INTO `tb_role_menu` VALUES (2468, 1, 3);
INSERT INTO `tb_role_menu` VALUES (2469, 1, 11);
INSERT INTO `tb_role_menu` VALUES (2470, 1, 12);
INSERT INTO `tb_role_menu` VALUES (2471, 1, 202);
INSERT INTO `tb_role_menu` VALUES (2472, 1, 13);
INSERT INTO `tb_role_menu` VALUES (2473, 1, 201);
INSERT INTO `tb_role_menu` VALUES (2474, 1, 213);
INSERT INTO `tb_role_menu` VALUES (2475, 1, 14);
INSERT INTO `tb_role_menu` VALUES (2476, 1, 15);
INSERT INTO `tb_role_menu` VALUES (2477, 1, 16);
INSERT INTO `tb_role_menu` VALUES (2478, 1, 4);
INSERT INTO `tb_role_menu` VALUES (2479, 1, 214);
INSERT INTO `tb_role_menu` VALUES (2480, 1, 209);
INSERT INTO `tb_role_menu` VALUES (2481, 1, 17);
INSERT INTO `tb_role_menu` VALUES (2482, 1, 18);
INSERT INTO `tb_role_menu` VALUES (2483, 1, 205);
INSERT INTO `tb_role_menu` VALUES (2484, 1, 206);
INSERT INTO `tb_role_menu` VALUES (2485, 1, 208);
INSERT INTO `tb_role_menu` VALUES (2486, 1, 210);
INSERT INTO `tb_role_menu` VALUES (2487, 1, 215);
INSERT INTO `tb_role_menu` VALUES (2488, 1, 216);
INSERT INTO `tb_role_menu` VALUES (2489, 1, 217);
INSERT INTO `tb_role_menu` VALUES (2490, 1, 218);
INSERT INTO `tb_role_menu` VALUES (2491, 1, 19);
INSERT INTO `tb_role_menu` VALUES (2492, 1, 20);
INSERT INTO `tb_role_menu` VALUES (2493, 1, 5);
INSERT INTO `tb_role_menu` VALUES (2494, 3, 1);
INSERT INTO `tb_role_menu` VALUES (2495, 3, 2);
INSERT INTO `tb_role_menu` VALUES (2496, 3, 6);
INSERT INTO `tb_role_menu` VALUES (2497, 3, 7);
INSERT INTO `tb_role_menu` VALUES (2498, 3, 8);
INSERT INTO `tb_role_menu` VALUES (2499, 3, 9);
INSERT INTO `tb_role_menu` VALUES (2500, 3, 10);
INSERT INTO `tb_role_menu` VALUES (2501, 3, 3);
INSERT INTO `tb_role_menu` VALUES (2502, 3, 11);
INSERT INTO `tb_role_menu` VALUES (2503, 3, 12);
INSERT INTO `tb_role_menu` VALUES (2504, 3, 202);
INSERT INTO `tb_role_menu` VALUES (2505, 3, 13);
INSERT INTO `tb_role_menu` VALUES (2506, 3, 201);
INSERT INTO `tb_role_menu` VALUES (2507, 3, 213);
INSERT INTO `tb_role_menu` VALUES (2508, 3, 14);
INSERT INTO `tb_role_menu` VALUES (2509, 3, 15);
INSERT INTO `tb_role_menu` VALUES (2510, 3, 16);
INSERT INTO `tb_role_menu` VALUES (2511, 3, 4);
INSERT INTO `tb_role_menu` VALUES (2512, 3, 214);
INSERT INTO `tb_role_menu` VALUES (2513, 3, 209);
INSERT INTO `tb_role_menu` VALUES (2514, 3, 17);
INSERT INTO `tb_role_menu` VALUES (2515, 3, 18);
INSERT INTO `tb_role_menu` VALUES (2516, 3, 205);
INSERT INTO `tb_role_menu` VALUES (2517, 3, 206);
INSERT INTO `tb_role_menu` VALUES (2518, 3, 208);
INSERT INTO `tb_role_menu` VALUES (2519, 3, 210);
INSERT INTO `tb_role_menu` VALUES (2520, 3, 215);
INSERT INTO `tb_role_menu` VALUES (2521, 3, 216);
INSERT INTO `tb_role_menu` VALUES (2522, 3, 217);
INSERT INTO `tb_role_menu` VALUES (2523, 3, 218);
INSERT INTO `tb_role_menu` VALUES (2524, 3, 19);
INSERT INTO `tb_role_menu` VALUES (2525, 3, 20);
INSERT INTO `tb_role_menu` VALUES (2526, 3, 5);

-- ----------------------------
-- Table structure for tb_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_resource`;
CREATE TABLE `tb_role_resource`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NULL DEFAULT NULL COMMENT '角色id',
  `resource_id` int NULL DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4886 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role_resource
-- ----------------------------
INSERT INTO `tb_role_resource` VALUES (4750, 14, 238);
INSERT INTO `tb_role_resource` VALUES (4751, 2, 254);
INSERT INTO `tb_role_resource` VALUES (4752, 2, 267);
INSERT INTO `tb_role_resource` VALUES (4753, 2, 269);
INSERT INTO `tb_role_resource` VALUES (4754, 2, 270);
INSERT INTO `tb_role_resource` VALUES (4755, 2, 257);
INSERT INTO `tb_role_resource` VALUES (4756, 2, 258);
INSERT INTO `tb_role_resource` VALUES (4757, 2, 282);
INSERT INTO `tb_role_resource` VALUES (4758, 1, 165);
INSERT INTO `tb_role_resource` VALUES (4759, 1, 192);
INSERT INTO `tb_role_resource` VALUES (4760, 1, 193);
INSERT INTO `tb_role_resource` VALUES (4761, 1, 194);
INSERT INTO `tb_role_resource` VALUES (4762, 1, 195);
INSERT INTO `tb_role_resource` VALUES (4763, 1, 166);
INSERT INTO `tb_role_resource` VALUES (4764, 1, 183);
INSERT INTO `tb_role_resource` VALUES (4765, 1, 184);
INSERT INTO `tb_role_resource` VALUES (4766, 1, 246);
INSERT INTO `tb_role_resource` VALUES (4767, 1, 247);
INSERT INTO `tb_role_resource` VALUES (4768, 1, 167);
INSERT INTO `tb_role_resource` VALUES (4769, 1, 199);
INSERT INTO `tb_role_resource` VALUES (4770, 1, 200);
INSERT INTO `tb_role_resource` VALUES (4771, 1, 201);
INSERT INTO `tb_role_resource` VALUES (4772, 1, 168);
INSERT INTO `tb_role_resource` VALUES (4773, 1, 185);
INSERT INTO `tb_role_resource` VALUES (4774, 1, 186);
INSERT INTO `tb_role_resource` VALUES (4775, 1, 187);
INSERT INTO `tb_role_resource` VALUES (4776, 1, 188);
INSERT INTO `tb_role_resource` VALUES (4777, 1, 189);
INSERT INTO `tb_role_resource` VALUES (4778, 1, 190);
INSERT INTO `tb_role_resource` VALUES (4779, 1, 191);
INSERT INTO `tb_role_resource` VALUES (4780, 1, 254);
INSERT INTO `tb_role_resource` VALUES (4781, 1, 169);
INSERT INTO `tb_role_resource` VALUES (4782, 1, 208);
INSERT INTO `tb_role_resource` VALUES (4783, 1, 209);
INSERT INTO `tb_role_resource` VALUES (4784, 1, 170);
INSERT INTO `tb_role_resource` VALUES (4785, 1, 234);
INSERT INTO `tb_role_resource` VALUES (4786, 1, 235);
INSERT INTO `tb_role_resource` VALUES (4787, 1, 236);
INSERT INTO `tb_role_resource` VALUES (4788, 1, 237);
INSERT INTO `tb_role_resource` VALUES (4789, 1, 171);
INSERT INTO `tb_role_resource` VALUES (4790, 1, 213);
INSERT INTO `tb_role_resource` VALUES (4791, 1, 214);
INSERT INTO `tb_role_resource` VALUES (4792, 1, 215);
INSERT INTO `tb_role_resource` VALUES (4793, 1, 216);
INSERT INTO `tb_role_resource` VALUES (4794, 1, 217);
INSERT INTO `tb_role_resource` VALUES (4795, 1, 224);
INSERT INTO `tb_role_resource` VALUES (4796, 1, 172);
INSERT INTO `tb_role_resource` VALUES (4797, 1, 240);
INSERT INTO `tb_role_resource` VALUES (4798, 1, 241);
INSERT INTO `tb_role_resource` VALUES (4799, 1, 244);
INSERT INTO `tb_role_resource` VALUES (4800, 1, 245);
INSERT INTO `tb_role_resource` VALUES (4801, 1, 267);
INSERT INTO `tb_role_resource` VALUES (4802, 1, 269);
INSERT INTO `tb_role_resource` VALUES (4803, 1, 270);
INSERT INTO `tb_role_resource` VALUES (4804, 1, 173);
INSERT INTO `tb_role_resource` VALUES (4805, 1, 239);
INSERT INTO `tb_role_resource` VALUES (4806, 1, 242);
INSERT INTO `tb_role_resource` VALUES (4807, 1, 276);
INSERT INTO `tb_role_resource` VALUES (4808, 1, 174);
INSERT INTO `tb_role_resource` VALUES (4809, 1, 205);
INSERT INTO `tb_role_resource` VALUES (4810, 1, 206);
INSERT INTO `tb_role_resource` VALUES (4811, 1, 207);
INSERT INTO `tb_role_resource` VALUES (4812, 1, 175);
INSERT INTO `tb_role_resource` VALUES (4813, 1, 218);
INSERT INTO `tb_role_resource` VALUES (4814, 1, 219);
INSERT INTO `tb_role_resource` VALUES (4815, 1, 220);
INSERT INTO `tb_role_resource` VALUES (4816, 1, 221);
INSERT INTO `tb_role_resource` VALUES (4817, 1, 222);
INSERT INTO `tb_role_resource` VALUES (4818, 1, 223);
INSERT INTO `tb_role_resource` VALUES (4819, 1, 176);
INSERT INTO `tb_role_resource` VALUES (4820, 1, 202);
INSERT INTO `tb_role_resource` VALUES (4821, 1, 203);
INSERT INTO `tb_role_resource` VALUES (4822, 1, 204);
INSERT INTO `tb_role_resource` VALUES (4823, 1, 230);
INSERT INTO `tb_role_resource` VALUES (4824, 1, 238);
INSERT INTO `tb_role_resource` VALUES (4825, 1, 177);
INSERT INTO `tb_role_resource` VALUES (4826, 1, 229);
INSERT INTO `tb_role_resource` VALUES (4827, 1, 232);
INSERT INTO `tb_role_resource` VALUES (4828, 1, 233);
INSERT INTO `tb_role_resource` VALUES (4829, 1, 243);
INSERT INTO `tb_role_resource` VALUES (4830, 1, 178);
INSERT INTO `tb_role_resource` VALUES (4831, 1, 196);
INSERT INTO `tb_role_resource` VALUES (4832, 1, 197);
INSERT INTO `tb_role_resource` VALUES (4833, 1, 198);
INSERT INTO `tb_role_resource` VALUES (4834, 1, 257);
INSERT INTO `tb_role_resource` VALUES (4835, 1, 258);
INSERT INTO `tb_role_resource` VALUES (4836, 1, 179);
INSERT INTO `tb_role_resource` VALUES (4837, 1, 225);
INSERT INTO `tb_role_resource` VALUES (4838, 1, 226);
INSERT INTO `tb_role_resource` VALUES (4839, 1, 227);
INSERT INTO `tb_role_resource` VALUES (4840, 1, 228);
INSERT INTO `tb_role_resource` VALUES (4841, 1, 231);
INSERT INTO `tb_role_resource` VALUES (4842, 1, 180);
INSERT INTO `tb_role_resource` VALUES (4843, 1, 210);
INSERT INTO `tb_role_resource` VALUES (4844, 1, 211);
INSERT INTO `tb_role_resource` VALUES (4845, 1, 212);
INSERT INTO `tb_role_resource` VALUES (4846, 1, 278);
INSERT INTO `tb_role_resource` VALUES (4847, 1, 282);
INSERT INTO `tb_role_resource` VALUES (4848, 1, 283);
INSERT INTO `tb_role_resource` VALUES (4849, 1, 284);
INSERT INTO `tb_role_resource` VALUES (4850, 1, 285);
INSERT INTO `tb_role_resource` VALUES (4851, 1, 286);
INSERT INTO `tb_role_resource` VALUES (4852, 1, 287);
INSERT INTO `tb_role_resource` VALUES (4853, 3, 192);
INSERT INTO `tb_role_resource` VALUES (4854, 3, 195);
INSERT INTO `tb_role_resource` VALUES (4855, 3, 183);
INSERT INTO `tb_role_resource` VALUES (4856, 3, 246);
INSERT INTO `tb_role_resource` VALUES (4857, 3, 199);
INSERT INTO `tb_role_resource` VALUES (4858, 3, 185);
INSERT INTO `tb_role_resource` VALUES (4859, 3, 191);
INSERT INTO `tb_role_resource` VALUES (4860, 3, 254);
INSERT INTO `tb_role_resource` VALUES (4861, 3, 208);
INSERT INTO `tb_role_resource` VALUES (4862, 3, 234);
INSERT INTO `tb_role_resource` VALUES (4863, 3, 237);
INSERT INTO `tb_role_resource` VALUES (4864, 3, 213);
INSERT INTO `tb_role_resource` VALUES (4865, 3, 241);
INSERT INTO `tb_role_resource` VALUES (4866, 3, 239);
INSERT INTO `tb_role_resource` VALUES (4867, 3, 276);
INSERT INTO `tb_role_resource` VALUES (4868, 3, 205);
INSERT INTO `tb_role_resource` VALUES (4869, 3, 218);
INSERT INTO `tb_role_resource` VALUES (4870, 3, 221);
INSERT INTO `tb_role_resource` VALUES (4871, 3, 223);
INSERT INTO `tb_role_resource` VALUES (4872, 3, 202);
INSERT INTO `tb_role_resource` VALUES (4873, 3, 230);
INSERT INTO `tb_role_resource` VALUES (4874, 3, 238);
INSERT INTO `tb_role_resource` VALUES (4875, 3, 232);
INSERT INTO `tb_role_resource` VALUES (4876, 3, 243);
INSERT INTO `tb_role_resource` VALUES (4877, 3, 196);
INSERT INTO `tb_role_resource` VALUES (4878, 3, 257);
INSERT INTO `tb_role_resource` VALUES (4879, 3, 258);
INSERT INTO `tb_role_resource` VALUES (4880, 3, 225);
INSERT INTO `tb_role_resource` VALUES (4881, 3, 231);
INSERT INTO `tb_role_resource` VALUES (4882, 3, 210);
INSERT INTO `tb_role_resource` VALUES (4883, 3, 282);
INSERT INTO `tb_role_resource` VALUES (4884, 3, 286);
INSERT INTO `tb_role_resource` VALUES (4885, 3, 287);

-- ----------------------------
-- Table structure for tb_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_tag`;
CREATE TABLE `tb_tag`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_tag
-- ----------------------------
INSERT INTO `tb_tag` VALUES (30, '学习笔记标签', '2023-05-10 17:52:57', NULL);
INSERT INTO `tb_tag` VALUES (31, '测试标签', '2023-05-15 05:51:57', NULL);

-- ----------------------------
-- Table structure for tb_talk
-- ----------------------------
DROP TABLE IF EXISTS `tb_talk`;
CREATE TABLE `tb_talk`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '说说id',
  `user_id` int NOT NULL COMMENT '用户id',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '说说内容',
  `images` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1.公开 2.私密',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_talk
-- ----------------------------
INSERT INTO `tb_talk` VALUES (49, 1, '测试说说<img src=\"https://static.talkxj.com/emoji/goutou.jpg\" width=\"24\" height=\"24\" alt=\"[狗头]\" style=\"margin: 0 1px;vertical-align: text-bottom\">，表情包咋显示不出来呢', NULL, 0, 1, '2023-04-24 23:34:59', '2023-05-10 18:01:26');
INSERT INTO `tb_talk` VALUES (50, 1, '今天也要元气满满哦，小啊giao们！！！\n\n', '[\"http://localhost:8081/talks/ba6abb0d280cb773535073e489064d2f.jpeg\"]', 1, 1, '2023-05-10 18:00:30', NULL);
INSERT INTO `tb_talk` VALUES (51, 1, '哈哈哈，开心', NULL, 0, 1, '2023-05-30 00:43:03', NULL);
INSERT INTO `tb_talk` VALUES (52, 1, '今天开心吗', NULL, 0, 1, '2023-05-30 01:11:37', NULL);

-- ----------------------------
-- Table structure for tb_unique_view
-- ----------------------------
DROP TABLE IF EXISTS `tb_unique_view`;
CREATE TABLE `tb_unique_view`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `views_count` int NOT NULL COMMENT '访问量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 534 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_unique_view
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_auth`;
CREATE TABLE `tb_user_auth`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_info_id` int NOT NULL COMMENT '用户信息id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `login_type` tinyint(1) NOT NULL COMMENT '登录类型',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户登录ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ip来源',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user_auth
-- ----------------------------
INSERT INTO `tb_user_auth` VALUES (1, 1, 'admin@qq.com', '$2a$10$AkxkZaqcxEXdiNE1nrgW1.ms3aS9C5ImXMf8swkWUJuFGMqDl.TPW', 1, '127.0.0.1', '', '2023-04-12 15:43:18', '2023-05-30 01:48:57', '2023-05-30 01:48:57');
INSERT INTO `tb_user_auth` VALUES (995, 1005, '123@163.com', '$2a$10$AkxkZaqcxEXdiNE1nrgW1.ms3aS9C5ImXMf8swkWUJuFGMqDl.TPW', 1, '127.0.0.1', '', '2023-04-27 10:58:11', '2023-05-30 01:47:27', '2023-05-30 01:47:27');
INSERT INTO `tb_user_auth` VALUES (996, 1006, '3311696256@qq.com', '$2a$10$6C7V0htppVR8RpD6/AfSueMPHlXaPvNX5QvrvaEF9vWDeD2GPp/72', 1, '127.0.0.1', '', '2023-05-17 00:09:41', '2023-05-17 00:09:41', '2023-05-17 00:09:41');
INSERT INTO `tb_user_auth` VALUES (997, 1007, '123@sohu.com', '$2a$10$ybLyBZtX257mVC2NSicJiuBtzaONT85dGC73xopb6A0UMqzzeIbVK', 1, '127.0.0.1', '', '2023-05-30 00:38:20', '2023-05-30 00:38:20', '2023-05-30 00:38:20');
INSERT INTO `tb_user_auth` VALUES (998, 1008, '456@sohu.com', '$2a$10$zT/mkF2/AHGjaIqeujHqaev7ztyY2iNnx66tLXDYVnxUjVxZ1YNve', 1, '127.0.0.1', '', '2023-05-30 01:06:50', '2023-05-30 01:06:51', '2023-05-30 01:06:51');
INSERT INTO `tb_user_auth` VALUES (999, 1009, '789@sohu.com', '$2a$10$8EotRKkLeiWetC3473/7.u3YZYuZJcR6pfWP9Bnag/lx.8uZYOIua', 1, '127.0.0.1', '', '2023-05-30 01:23:39', '2023-05-30 01:23:40', '2023-05-30 01:23:40');
INSERT INTO `tb_user_auth` VALUES (1000, 1010, '234@sohu.com', '$2a$10$i244zJq4VB.KJcnFFBNRZ.0Gpbrha6CqJFEY/0rJ2trmFHmzCUW9y', 1, '127.0.0.1', '', '2023-05-30 01:36:32', '2023-05-30 01:36:33', '2023-05-30 01:36:33');
INSERT INTO `tb_user_auth` VALUES (1001, 1011, '567@sohu.com', '$2a$10$JWHcc7O67U3xFUjqH/wrOunxs2IOYAUvKALsfh4mgN5bZQZELBYri', 1, '127.0.0.1', '', '2023-05-30 01:48:27', '2023-05-30 01:48:28', '2023-05-30 01:48:28');

-- ----------------------------
-- Table structure for tb_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_info`;
CREATE TABLE `tb_user_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱号',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户简介',
  `web_site` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个人网站',
  `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1012 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user_info
-- ----------------------------
INSERT INTO `tb_user_info` VALUES (1, 'admin@qq.com', '管理员', 'http://localhost:8081/giao/1.png', 'admin@qq.com', NULL, 0, '2023-04-12 15:43:17', '2023-04-12 15:51:42');
INSERT INTO `tb_user_info` VALUES (1005, '123@163.com', '用户1486533968342859778', 'http://localhost:8081/avatar/84e3a1f2fbd67c03d0317458a71a02d0.jpeg', NULL, NULL, 0, '2023-04-27 10:58:11', '2023-05-15 07:30:30');
INSERT INTO `tb_user_info` VALUES (1006, '3311696256@qq.com', '用户1658505001833598977', 'http://localhost:8081/config/daefe10713dfb50746ee99db706333bc.png', NULL, NULL, 0, '2023-05-17 00:09:41', NULL);
INSERT INTO `tb_user_info` VALUES (1007, '123@sohu.com', '用户1663223255038754818', 'http://localhost:8081/config/daefe10713dfb50746ee99db706333bc.png', NULL, NULL, 0, '2023-05-30 00:38:20', NULL);
INSERT INTO `tb_user_info` VALUES (1008, '456@sohu.com', '用户1663230429525815298', 'http://localhost:8081/avatar/84e3a1f2fbd67c03d0317458a71a02d0.jpeg', NULL, NULL, 0, '2023-05-30 01:06:50', '2023-05-30 01:07:13');
INSERT INTO `tb_user_info` VALUES (1009, '789@sohu.com', '用户1663234661297438721', 'http://localhost:8081/config/daefe10713dfb50746ee99db706333bc.png', NULL, NULL, 0, '2023-05-30 01:23:39', NULL);
INSERT INTO `tb_user_info` VALUES (1010, '234@sohu.com', '用户1663237902215188481', 'http://localhost:8081/avatar/84e3a1f2fbd67c03d0317458a71a02d0.jpeg', NULL, NULL, 0, '2023-05-30 01:36:32', '2023-05-30 01:36:52');
INSERT INTO `tb_user_info` VALUES (1011, '567@sohu.com', '用户1663240901662638082', 'http://localhost:8081/avatar/84e3a1f2fbd67c03d0317458a71a02d0.jpeg', NULL, NULL, 0, '2023-05-30 01:48:27', '2023-05-30 01:48:45');

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `role_id` int NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1009 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user_role
-- ----------------------------
INSERT INTO `tb_user_role` VALUES (1001, 1, 1);
INSERT INTO `tb_user_role` VALUES (1002, 1005, 2);
INSERT INTO `tb_user_role` VALUES (1003, 1006, 2);
INSERT INTO `tb_user_role` VALUES (1004, 1007, 2);
INSERT INTO `tb_user_role` VALUES (1005, 1008, 2);
INSERT INTO `tb_user_role` VALUES (1006, 1009, 2);
INSERT INTO `tb_user_role` VALUES (1007, 1010, 2);
INSERT INTO `tb_user_role` VALUES (1008, 1011, 2);

-- ----------------------------
-- Table structure for tb_website_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_website_config`;
CREATE TABLE `tb_website_config`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `config` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '配置信息',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_website_config
-- ----------------------------
INSERT INTO `tb_website_config` VALUES (1, '{\"alipayQRCode\":\"https://static.talkxj.com/photos/13d83d77cc1f7e4e0437d7feaf56879f.png\",\"gitee\":\"https://gitee.com/TaoqiX\",\"github\":\"\",\"isChatRoom\":0,\"isCommentReview\":0,\"isEmailNotice\":0,\"isMessageReview\":0,\"isMusicPlayer\":0,\"isReward\":0,\"qq\":\"\",\"socialLoginList\":[],\"socialUrlList\":[\"gitee\"],\"touristAvatar\":\"http://localhost:8081/config/ba6abb0d280cb773535073e489064d2f.jpeg\",\"userAvatar\":\"http://localhost:8081/config/daefe10713dfb50746ee99db706333bc.png\",\"websiteAuthor\":\"TaoqiX\",\"websiteAvatar\":\"http://localhost:8081/config/23aa483c7abb94e723f2ff7f6769a5f5.jpeg\",\"websiteCreateTime\":\"2023-05-06\",\"websiteIntro\":\"用于我的2023年的毕哈天天吞吞吐吐\",\"websiteName\":\"“细节的温柔”个人博客系统\",\"websiteNotice\":\"有些功能还不够完善，还有一些个小bug，请大家见谅！！\",\"websiteRecordNo\":\"备案号\",\"websocketUrl\":\"ws://127.0.0.1:8080/websocket\",\"weiXinQRCode\":\"https://static.talkxj.com/photos/4f767ef84e55ab9ad42b2d20e51deca1.png\"}', '2023-04-09 19:37:30', '2023-05-30 01:50:36');

SET FOREIGN_KEY_CHECKS = 1;

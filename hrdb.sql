/*
 Navicat Premium Data Transfer

 Source Server         : mysql01
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : hrdb

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 22/07/2020 08:54:21
*/

DROP DATABASE IF EXISTS `hrdb`;
CREATE DATABASE `hrdb` CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

USE `hrdb`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `did` int(0) NOT NULL AUTO_INCREMENT,
  `dname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dremark` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`did`) USING BTREE,
  UNIQUE INDEX `dname`(`dname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, '财务部', '');
INSERT INTO `dept` VALUES (2, '学术部', '');
INSERT INTO `dept` VALUES (3, '公关部', '');
INSERT INTO `dept` VALUES (4, '教学部', '');
INSERT INTO `dept` VALUES (5, '技术部', '');
INSERT INTO `dept` VALUES (6, '人事部', '优秀部门');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_id` int(0) NULL DEFAULT NULL,
  `job_id` int(0) NULL DEFAULT NULL,
  `card_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `party` enum('群众','共青团员','共产党员') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `race` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `education` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `speciality` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hobby` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `card_id`(`card_id`) USING BTREE,
  INDEX `foreikey`(`dept_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE,
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`jid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `foreikey` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`did`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '蔡某', 1, 1, '6353', '广东省', '513408', '333888876', '13919754351', '8035433321', 'wuyingd@qq.com', '男', '群众', '1997-07-17', '汉', '本科', '计算机', '打篮球', 'AA', '2020-07-22 08:49:18 上午');
INSERT INTO `employee` VALUES (2, '陈合', 3, 3, '653515789', '黑龙江', '513488', '3338874', '15919754431', '804712471', 'hlu@qq.com', '女', '共青团员', '1987-02-16', '汉', '本科', '营销', '游泳', '待定', '2020-07-22 08:52:28 上午');

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job`  (
  `jid` int(0) NOT NULL AUTO_INCREMENT,
  `jname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jremark` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`jid`) USING BTREE,
  UNIQUE INDEX `jname`(`jname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES (1, '工程师', '');
INSERT INTO `job` VALUES (2, '会计师', '');
INSERT INTO `job` VALUES (3, '普通职员', '');
INSERT INTO `job` VALUES (4, 'Java程序员', '');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '刘俊明', '安徽日报', '震撼！看王家坝开闸蓄洪十小时后', '&lt;article tt-ignored-node=\"1\"&gt;&lt;p&gt;舍小家，保大家&lt;/p&gt; \n&lt;p&gt;今天上午8点31分&lt;/p&gt; \n&lt;p&gt;王家坝开闸蓄洪！&lt;/p&gt; \n&lt;p&gt;开闸蓄洪后&lt;/p&gt; \n&lt;p&gt;王家坝水位持续下降&lt;/p&gt; \n&lt;p&gt;至今天傍晚18点30分&lt;/p&gt; \n&lt;p&gt;蓄洪十小时后&lt;/p&gt; \n&lt;p&gt;王家坝闸上水位&lt;/p&gt; \n&lt;p&gt;已降至保证水位以下&lt;/p&gt; \n&lt;p&gt;约29米&lt;/p&gt; \n&lt;p&gt;而此刻&lt;/p&gt; \n&lt;p&gt;蒙洼蓄洪区情况如何？&lt;/p&gt; \n&lt;p&gt;王家坝大坝是什么状况？&lt;/p&gt; \n&lt;p&gt;&lt;img class=\"lazy\" data-original=\"https://imgm.gmw.cn/attachement/jpg/site215/20200721/7296697925829505258.jpg\" title=\"震撼！看王家坝开闸蓄洪十小时后\" alt=\"震撼！看王家坝开闸蓄洪十小时后\" src=\"https://imgm.gmw.cn/attachement/jpg/site215/20200721/7296697925829505258.jpg\" style=\"display: block;\"&gt;&lt;/p&gt; \n&lt;p&gt;离王家坝闸仅数百米远的淮河大堤上，就是王玉仁的家，今年68岁的王玉仁身体不太好，在家带孙子。他告诉记者，这次雨水太大了，连下了几天，家里的田地全淹了，几十年一遇。顺着老王手指的地方不远处就是淮河，滔滔洪水奔腾而过，这里是阜南、固始、淮滨县交界的地方，目前，王家坝、老观、曹集、郜台4乡镇的居民全部安置到庄台或乡镇政府驻地居住。&lt;/p&gt; \n&lt;p&gt;&lt;img class=\"lazy\" data-original=\"https://imgm.gmw.cn/attachement/jpg/site215/20200721/3213935221531885763.jpg\" title=\"震撼！看王家坝开闸蓄洪十小时后\" alt=\"震撼！看王家坝开闸蓄洪十小时后\" src=\"https://imgm.gmw.cn/attachement/jpg/site215/20200721/3213935221531885763.jpg\" style=\"display: block;\"&gt;&lt;/p&gt; \n&lt;p&gt;王玉泉坐在家门口正在择韭菜，准备晚饭。家门口就是淮河，她说水涨起来有三四天，没觉得害怕。政府安排的很好，来了很多防汛的干部，门口来来往往的车子很多，都是防汛的干部，还有武警部队的人。生活什么的也不受影响，跟往常没啥区别。&lt;/p&gt; \n&lt;p&gt;&lt;img class=\"lazy\" data-original=\"https://imgm.gmw.cn/attachement/jpg/site215/20200721/7350909577732769608.jpg\" title=\"震撼！看王家坝开闸蓄洪十小时后\" alt=\"震撼！看王家坝开闸蓄洪十小时后\" src=\"https://imgm.gmw.cn/attachement/jpg/site215/20200721/7350909577732769608.jpg\" style=\"display: block;\"&gt;&lt;/p&gt; \n&lt;p&gt;王家坝闸蓄洪进水口，图片左方即为淮河。浩浩汤汤的淮河水向闸口奔腾而去。王家坝闸开闸后，洪水通过分洪道，从王家坝镇、老观乡、曹集镇、郜台乡依次通过。随着河水溢出河道，蓄洪区将会被逐渐淹没。大约40—50小时以后，洪水将到达最下游的郜台乡。&lt;/p&gt; \n&lt;p&gt;&lt;img class=\"lazy\" data-original=\"https://imgm.gmw.cn/attachement/jpg/site215/20200721/7682467463558090351.jpg\" title=\"震撼！看王家坝开闸蓄洪十小时后\" alt=\"震撼！看王家坝开闸蓄洪十小时后\" src=\"https://imgm.gmw.cn/attachement/jpg/site215/20200721/7682467463558090351.jpg\" style=\"display: block;\"&gt;&lt;/p&gt; \n&lt;p&gt;图为王家坝闸蓄洪出水口。离很远便听到怒吼的洪水，声如狮吼，震耳欲聋。此次王家坝闸13孔全开，所以流量非常大。&lt;/p&gt; \n&lt;p&gt;&lt;img class=\"lazy\" data-original=\"https://imgm.gmw.cn/attachement/jpg/site215/20200721/3151905203328598253.jpg\" title=\"震撼！看王家坝开闸蓄洪十小时后\" alt=\"震撼！看王家坝开闸蓄洪十小时后\" src=\"https://imgm.gmw.cn/attachement/jpg/site215/20200721/3151905203328598253.jpg\" style=\"display: block;\"&gt;&lt;/p&gt; \n&lt;p&gt;从20日上午8点31分，王家坝开闸蓄洪。至20日傍晚18点半左右，王家坝水位已经降至保证水位以下。&lt;/p&gt; \n&lt;p&gt;蓄洪后，濛洼有数千群众昨天夜里至今天凌晨连夜转移，他们的安置情况和生活如何？濛洼庄台上的乡亲生活又受到了怎样的影响？明天我们将继续实地探访。&lt;/p&gt; \n&lt;p&gt;自1953年建成以来，王家坝闸先后12个年份15次开闸蓄洪，为削减淮河洪峰、保淮河安澜立下汗马功劳。在多年与洪水的斗争中，铸就了濛洼地区人民舍小家顾大家、舍局部顾全局的“王家坝精神”，即：&lt;/p&gt; \n&lt;p&gt;舍小家、为大家的顾全大局精神&lt;/p&gt; \n&lt;p&gt;不畏艰险、不怕困难的自强不息精神&lt;/p&gt; \n&lt;p&gt;军民团结、干群同心的同舟共济精神&lt;/p&gt; \n&lt;p&gt;尊重规律、综合防治的科学治水精神&lt;/p&gt; \n&lt;p&gt;出品：安徽日报东篱工作室&lt;/p&gt; \n&lt;p&gt;监制：张尚稳杨飞&lt;/p&gt; \n&lt;p&gt;视频/图文：史力汤超王珂安耀武&lt;/p&gt; \n&lt;p&gt;声明：转载此文是出于传递更多信息之目的。若有来源标注错误或侵犯了您的合法权益，请作者持权属证明与本网联系，我们将及时更正、删除，谢谢。&lt;/p&gt;&lt;p&gt;来源： 安徽日报&lt;/p&gt;&lt;/article&gt;', '');
INSERT INTO `notice` VALUES (2, '刘俊明', '新京报', '转发 微博 Qzone 微信 蚂蚁集团宣布上市 估值为何高达万亿 谁是大BOSS？', '&lt;article data-v-e1fd63b2=\"\" class=\"syl-page-article syl-device-pc\"&gt;&lt;p&gt;就在7月上旬刚刚澄清“蚂蚁金服计划最早于今年在香港上市，目标估值为2000亿美元”的消息不实后，7月20日，支付宝母公司蚂蚁集团宣布，将启动在科创板和香港联合交易所有限公司主板寻求同步发行上市的计划，以进一步支持服务业数字化升级做大内需，加强全球合作助力全球可持续发展，以及支持公司加大技术研发和创新。&lt;/p&gt;&lt;p&gt;“我们欣喜地看到，科创板和香港联交所推出了一系列改革和创新的举措，为新经济公司能更好地获得资本市场支持包括国际资本支持创造了良好条件，我们很高兴能有机会参与其中。”蚂蚁集团董事长井贤栋说。&lt;/p&gt;&lt;p&gt;在蚂蚁集团宣布上市之后，阿里巴巴盘前交易大涨超3.8%，相关概念股也被股民热议。&lt;/p&gt;&lt;img src=\"http://p3-tt.byteimg.com/large/pgc-image/S5KfFHSBIm2wwR?from=pc\" img_width=\"800\" img_height=\"5084\" alt=\"蚂蚁集团宣布上市 估值为何高达万亿 谁是大BOSS？\" inline=\"0\"&gt;&lt;p&gt;&lt;strong&gt;谁的蚂蚁集团？马云控制着约50%表决权&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;此前，蚂蚁集团就一直被上市传闻环绕，尽管官方一再否认，但其不少操作都显露了上市的端倪。&lt;/p&gt;&lt;p&gt;今年5月份，在使用“蚂蚁金服”这一简称6年后，支付宝的母公司已启用新名称“蚂蚁集团”，在当时这一举措也被外界解读为上市做准备。&lt;/p&gt;&lt;p&gt;公开资料显示，蚂蚁集团正式成立于2014年10月，起步于2004年成立的支付宝。原本，支付宝属于阿里控股公司，但由于2010年6月，央行发布新规定，要求任何未取得牌照的支付公司必须在2011年9月1日之前停止经营。&lt;/p&gt;&lt;p&gt;尽管支付宝已于2011年初准备提交牌照申请，但当时央行并未颁布适用于外商投资支付公司申请牌照的指导意见，因此，管理层决定将支付宝重组为由中国公民全资拥有的公司。&lt;/p&gt;&lt;p&gt;据悉，自2011年第一个自然季度，阿里对支付宝的全部权益和控制权剥离生效后，支付宝母公司蚂蚁集团的所有权架构发生了改变，马云持有蚂蚁集团的绝大部分股权权益，随后，蚂蚁集团的所有权架构进一步重组，还完成了多轮股权融资。&lt;/p&gt;&lt;p&gt;截至今年3月31日，君瀚和君澳持有蚂蚁集团约50%的股份，阿里则持有33%的股份，并有权提名两名董事经选举进入蚂蚁集团董事会，但并不持有蚂蚁集团或支付宝的多数权益或控制权，而其他股东持有余下股份。&lt;/p&gt;&lt;p&gt;值得一提的是，看似没有直接持大头股份的马云其实才是蚂蚁集团背后的大BOSS，根据阿里披露的公开信息，马云在蚂蚁集团中拥有经济利益，并且能够行使君瀚和君澳持有的蚂蚁集团股份的表决权，也就是说，马云控制着蚂蚁集团约50%的表决权权益。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;全球布局横跨多个领域，数字金融服务贡献了蚂蚁集团总收入的50%以上&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;支付、科技、数字、金融等关键词是外界对蚂蚁集团业务构成的大致印象，根据阿里最新发布的财报，截至今年3月31日12个月期间，数字金融服务贡献了蚂蚁集团总收入的50%以上。&lt;/p&gt;&lt;p&gt;具体来看，在中国，蚂蚁集团的数字金融服务主要包括理财、微贷以及保险。&lt;/p&gt;&lt;p&gt;其中，理财是蚂蚁集团与基金管理公司、保险公司等金融机构合作，通过蚂蚁财富提供包括货币市场基金、固定收益产品和股票投资产品等综合理财产品。截至今年3月31日，蚂蚁财富促成合作伙伴为用户管理的资产超过4万亿元。&lt;/p&gt;&lt;p&gt;微贷则为蚂蚁集团与银行和其他贷款机构合作为消费者和小微经营者提供小额、期限灵活的消费信贷服务。&lt;/p&gt;&lt;p&gt;保险则是蚂蚁集团与保险公司合作提供保险产品，截至今年3月31日12个月期间，集团促成的保险费总额相比去年同期增长了一倍以上。此外，为促成线上和线下交易提供数字支付服务等也是蚂蚁集团在国内的主要业务。&lt;/p&gt;&lt;p&gt;国际业务方面，截至今年3月31日，蚂蚁集团已经与在孟加拉国、中国香港、印度、印度尼西亚、韩国、马来西亚、巴基斯坦、菲律宾和泰国的九个本地合作伙伴实现了战略合作，比如，外国信用卡持有者现在也可以通过支付宝APP在中国内地使用手机支付。&lt;/p&gt;&lt;p&gt;截至今年3月31日止12个月期间，蚂蚁集团及其全球九个本地数字钱包合作伙伴所服务的全球年度活跃用户数量已经达到约13亿。&lt;/p&gt;&lt;p&gt;不过，由于蚂蚁集团目前还未披露招股说明书，因此，也无法得知其准确的过往业绩，但从阿里披露的财报中或许窥见一角。&lt;/p&gt;&lt;p&gt;“蚂蚁集团按照权益法核算的投资收益为53.24亿元”，阿里方面在财报中称，我们于2019年9月23日取得蚂蚁集团33%的股权，与其他权益法核算的股权投资处理一样，我们延后一个季度计入享有蚂蚁集团的损益份额。因此2020财年与蚂蚁集团有关的权益法核算的投资收益反映由取得股权后起计至2019年12月31日止期间所享有蚂蚁集团的收益份额。&lt;/p&gt;&lt;p&gt;也就是说，这53.24亿元仅仅是去年9月23日~12月31日这3个多月的时间内，阿里从蚂蚁集团处取得的投资收益，由此可以推断出，蚂蚁集团具有强大的“吸金”能力。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;2018年完成C轮融资后估值约为1500亿美元&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;此次蚂蚁集团上市，其估值几何也引发市场高度关注。中信证券在今年2月份发布的一份研报中称，三轮融资后，蚂蚁集团估值已在万亿量级，2015年、2016年、2018年，集团分别完成A轮（约18.5亿美元）/B轮（约45亿美元）/C轮（约140亿美元）的融资，而根据彭博报道，该集团在2018年6月完成C轮融资后的估值水平约为1500亿美元。&lt;/p&gt;&lt;p&gt;而两年时间过去后，据业内估算，目前蚂蚁集团估值约为2000亿美元，按照实时汇率，相当于1.4万亿元人民币。&lt;/p&gt;&lt;p&gt;针对这一估值，《蚂蚁金服》作者、北京看懂研究院研究员由曦坦言：“我认为这个估值是合理的，甚至今后仍有上涨预期，其实，我们看到蚂蚁集团正在渗透到日常生活的方方面面，用户规模巨大，假如用银行来类比，应该类似于中国最大的银行，对比市值可以发现，工商银行约为1.83万亿元、招商银行也超过9000亿元，但是这些银行的客户活跃度、年轻化以及场景的延展，与支付宝的黏性、频率还是有一定差距，这是客观事实，当然，不能完全用银行来类比，再增加一个互联网公司的维度，比如美团点评，目前市值大约为1.11万亿港元，但蚂蚁不仅有本地生活等服务，还有很多金融方面的布局，综上所述，我认为蚂蚁的估值是合理的。”&lt;/p&gt;&lt;p&gt;易观支付分析师王蓬博对新京报记者表示，今年1季度，支付宝在移动支付市场的市场份额达54.97%；2016年~2020年支付宝在移动支付市场的市场份额一直在53%以上，以及2014年~2019年移动支付交易规模激增等数据，都可以解释蚂蚁为何能撑起2000亿美元的估值，需要解释的是，支付不光是线下小店的扫码，作为现代商业的毛细血管，早已渗透到商业的各个层面，包括转账、信用卡还款、红包、金融服务、理财、保险等等，每一笔资金的转移对支付工具而言都是一个有价值和意义的事情。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;此次上市对股民而言意味着什么？真正意义上的互联网巨头来了&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;据悉，此次蚂蚁集团在科创板及港交所同步上市，受到了两大交易所的欢迎。&lt;/p&gt;&lt;p&gt;上交所表示，欢迎蚂蚁集团申报科创板。这展现了科创板作为中国科创企业“首选上市地”的市场吸引力和国际竞争力。作为中国资本市场服务国家创新驱动战略和优质科创企业的主市场，科创板经过一年多的实践，支持科创企业发展壮大的集聚引领效应不断增强。&lt;/p&gt;&lt;p&gt;香港交易所集团行政总裁李小加也表示：“我们很高兴蚂蚁集团今天宣布了将在香港和上海进行首次公开招股的计划。蚂蚁集团选择在香港交易所申请上市，再次肯定了香港作为全球领先新股集资市场的地位。我们将继续敞开怀抱，欢迎全球创新和领先的公司来香港上市。”&lt;/p&gt;&lt;p&gt;针对蚂蚁集团上市，中国社会科学院金融研究所金融科技研究室主任尹振涛对新京报记者表示，从支付宝升级到蚂蚁金服，又从蚂蚁金服升级到蚂蚁集团，其脱胎于阿里集团独立运行，一个重要的目标就是独立上市，同时，上市也是一个企业达到阶段性成功目标的标志。其次，蚂蚁集团这次同时在科创板和港交所上市，背后是中国资本市场的快速发展，科创板实施了注册制，而香港作为金融中心也有特殊的地位，选择在这两个市场同时上市，这也是监管部门及市场各方希望看到的。&lt;/p&gt;&lt;p&gt;由曦也表示，上市最直观的一个好处就是公司能够获得更多的资金，让其有更充足的资金储备来应对今后在市场上与竞争对手展开竞争。同时，上市后其品牌、影响力以及老百姓感知度都会有较大幅度的提升。&lt;/p&gt;&lt;p&gt;“当然，上市也有弊端，即公司会更看重今后的盈利能力，如何能在解决社会问题和自身盈利之间做出一个能够权衡社会、股东、员工以及企业自身的综合解决方案，是非常值得关注的。” 由曦表示。&lt;/p&gt;&lt;p&gt;对于A股股民而言，蚂蚁集团的上市，或许也意味着终于有机会参与头部互联网科技公司的投资，“事实上，A股市场从没有存在过真正意义上的互联网巨头或大型的独角兽公司，如果蚂蚁集团此次能在科创板上市的话，意义是很大的，会让更多的市场参与主体分享中国数字经济发展的红利，当然也包括普通股民。” 尹振涛表示。&lt;/p&gt;&lt;p&gt;Wind数据显示，在蚂蚁集团宣布上市之后，阿里巴巴盘前交易大涨超3.8%，一些概念股也被投资者关注，比如企查查数据显示，中国太保旗下的太保寿险持有蚂蚁集团约0.74%的股权。&lt;/p&gt;&lt;p&gt;据公开资料，A股市场上有41只蚂蚁集团概念股，7月20日，蚂蚁集团概念股有37家上涨，20只涨幅超3%，其中，宇信科技涨停，该公司在2019年4月份的投资者关系活动记录表上表示，公司与包括北京蚂蚁云金融信息服务有限公司、新华三集团有限公司等业内领先公司建立了战略合作关系，其中，北京蚂蚁云金融信息服务有限公司即为蚂蚁集团全资子公司。&lt;/p&gt;&lt;p&gt;新京报贝壳财经记者 潘亦纯 编辑 岳彩周 校对 张彦君&lt;/p&gt;&lt;/article&gt;', '');
INSERT INTO `notice` VALUES (3, '刘俊明', '环球时报', '美再将11家中企列入被制裁实体清单，汪文斌：美方企图打压，中方将采取必要举措', '&lt;div class=\"content-a\" id=\"article\"&gt;\n        &lt;h1 class=\"a-title\"&gt;\n            &lt;strong&gt;美再将11家中企列入被制裁实体清单，汪文斌：美方企图打压，中方将采取必要举措&lt;/strong&gt;&lt;/h1&gt;\n        &lt;div class=\"a-info\"&gt;\n            &lt;span class=\"time\"&gt;2020-07-21 16:10&lt;/span&gt;\n\n                            &lt;span class=\"original\"&gt;\n                                        &lt;span&gt;李司坤&lt;/span&gt;\n                                &lt;/span&gt;\n            \n            &lt;span class=\"tag\"&gt;&lt;/span&gt;\n        &lt;/div&gt;\n        &lt;div class=\"a-con\"&gt;\n                            &lt;p&gt;&lt;img alt=\"\" src=\"https://m1-1253159997.image.myqcloud.com/imageDir/49021d096f8adb354120b28d2de3e007u5.jpg\" data-upload-link=\"%7B%22cover%22%3A%22%22%2C%22desc%22%3A%22%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20200721161616.jpg%22%2C%22id%22%3A%2249021d096f8adb354120b28d2de3e007u5%22%2C%22size%22%3A655.98%2C%22width%22%3A1465%2C%22height%22%3A1080%2C%22url%22%3A%22https%3A%2F%2Fm1-1253159997.image.myqcloud.com%2FimageDir%2F49021d096f8adb354120b28d2de3e007u5.jpg%22%2C%22tags%22%3A%5B%5D%2C%22time%22%3A%222020-07-21%2016%3A16%3A43%22%2C%22mime%22%3A%22image%2Fjpeg%22%7D\"&gt;&lt;/p&gt;&lt;p&gt;【环球时报-环球网报道 记者 李司坤】据外媒报道，美国商务部当地时间7月20日把“与新疆侵犯人权有关”的11家中国公司列入被制裁实体清单。此举将导致这些公司在获取美国原产商品（包括大宗商品和技术）时面临新的限制。21日，有记者在外交部例行记者会上就此事提问称，美国商务部又将11家中国公司列入被制裁的实体清单中，并且称它们是因为实施了中国对新疆少数民族进行镇压、大规模拘役等，你对此有何评论？&lt;/p&gt;&lt;p&gt;发言人汪文斌表示，美方以所谓的人权为借口，滥用出口管制措施，将有关的中国企业列入实体清单，这违反了国际关系的基本准则，干涉中国内政，损害中方利益，中方对此坚决反对。&lt;/p&gt;&lt;p&gt;“美方关心的根本不是什么人权问题，而是企图打压中国企业，破坏新疆稳定，抹黑中国的治疆政策，对此国际社会看的十分清楚。”汪文斌说，我们敦促美方纠正错误，撤销有关决定，停止干涉中国内政。“中方将继续采取一切必要举措，维护中国企业的合法权益。”&lt;/p&gt;\n            \n        &lt;/div&gt;\n\n        &lt;div class=\"a-edit\"&gt;&lt;span class=\"a\"&gt;责编：薛艺磊&lt;/span&gt;&lt;/div&gt;\n                    &lt;div class=\"a-sign\"&gt;&lt;p&gt;版权作品，未经环球网 huanqiu.com 书面授权，严禁转载，违者将被追究法律责任。&lt;/p&gt;&lt;/div&gt;\n        \n        \n        \n        \n        \n        \n        \n        \n        &lt;div class=\"a-btool\"&gt;\n            &lt;!-- &lt;div class=\"ab-d\"&gt;&lt;a href=\"https://commentn.huanqiu.com/s/e8fcff106c8f/\"&gt;评论数(0)&lt;/a&gt;&lt;/div&gt; --&gt;\n            &lt;div class=\"ab-a\"&gt;阅读数(&lt;em&gt;21707&lt;/em&gt;）&lt;/div&gt;\n            &lt;div class=\"ab-b\" id=\"uninterested\"&gt;&lt;a href=\"javascript:void(0);\" class=\"one-pan-link-mark\"&gt;&lt;i class=\"iconfont icon-guanbi\"&gt;&lt;/i&gt;不感兴趣&lt;/a&gt;&lt;div class=\"uninterested-box\"&gt;&lt;h4&gt;不感兴趣&lt;/h4&gt;&lt;ul&gt;&lt;li data-val=\"1\"&gt;广告软文&lt;/li&gt;&lt;li data-val=\"2\"&gt;重复、旧闻&lt;/li&gt;&lt;li data-val=\"3\"&gt;文章质量差&lt;/li&gt;&lt;li data-val=\"4\"&gt;文字、图片、视频等展示问题&lt;/li&gt;&lt;li data-val=\"5\"&gt;标题夸张、文不对题&lt;/li&gt;&lt;li data-val=\"6\"&gt;与事实不符&lt;/li&gt;&lt;li data-val=\"7\"&gt;低俗色情&lt;/li&gt;&lt;li data-val=\"8\"&gt;欺诈或恶意营销&lt;/li&gt;&lt;li data-val=\"9\"&gt;疑似抄袭&lt;/li&gt;&lt;li data-val=\"10\"&gt;其他问题，我要吐槽&lt;/li&gt;&lt;/ul&gt;&lt;div class=\"otherarea\"&gt;&lt;textarea maxlength=\"200\"&gt;&lt;/textarea&gt;&lt;/div&gt;&lt;div class=\"btn\"&gt;&lt;a href=\"javascript:void(0);\" target=\"_blank\" class=\"uninterested-ok one-pan-link-mark\"&gt;确定&lt;/a&gt;&lt;/div&gt;&lt;div class=\"info\"&gt;*请填写原因&lt;/div&gt;&lt;/div&gt;&lt;div class=\"unfeedback\"&gt;&lt;i class=\"iconfont icon-Success-Small\"&gt;&lt;/i&gt;&lt;p&gt;感谢您的反馈，我们将会减少此类文章的推荐&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;\n            &lt;div class=\"ab-c\"&gt;\n                &lt;a href=\"mailto:jubao@huanqiu.com\" class=\"one-pan-link-mark\"&gt;\n                    &lt;i class=\"iconfont icon-warning\"&gt;&lt;/i&gt;投诉&lt;/a&gt;\n            &lt;/div&gt;\n        &lt;/div&gt;\n        &lt;div class=\"m-column\"&gt;\n            &lt;div class=\"m-info\"&gt;\n                &lt;a href=\"/a/5e93e2?agt=20\" class=\"s-pic one-pan-link-mark\"&gt;环&lt;/a&gt;\n                &lt;a href=\"/a/5e93e2?agt=20\" class=\"s-name one-pan-link-mark\"&gt;环球时报-环球网&lt;/a&gt;\n            &lt;/div&gt;\n        &lt;/div&gt;\n    &lt;/div&gt;', '');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `rid` int(0) NOT NULL AUTO_INCREMENT,
  `rname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rremark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '普通员工', ' 平平无奇螺丝钉');
INSERT INTO `role` VALUES (2, ' 管理员', ' 苦哈哈又一天');
INSERT INTO `role` VALUES (3, ' 超级管理员', ' 我删库我跑路');

-- ----------------------------
-- Table structure for uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `uploadfile`;
CREATE TABLE `uploadfile`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `uploadName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fileName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uploadDate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` int(0) NULL DEFAULT 1,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`number`) USING BTREE,
  INDEX `mforeikey`(`role_id`) USING BTREE,
  CONSTRAINT `mforeikey` FOREIGN KEY (`role_id`) REFERENCES `role` (`rid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10001', 'czy', 2, '13793871480', '2020-07-22 08:41:23', '陈章鱼', '优秀');
INSERT INTO `user` VALUES ('10002', 'zhd', 1, '13276838624', '2020-07-22 08:42:04', '张汉东', '');
INSERT INTO `user` VALUES ('10003', 'ljm', 1, '13793871485', '2020-07-22 08:42:39', '刘俊明', '好');
INSERT INTO `user` VALUES ('10004', 'lwh', 1, '13276838631', '2020-07-22 08:43:13', '李文浩', '良好');
INSERT INTO `user` VALUES ('10005', 'zqj', 3, '13657510147', '2020-07-22 08:43:49', '左丘吉', '大');
INSERT INTO `user` VALUES ('10006', 'dj', 3, '15386525871', '2020-07-22 08:44:22', '邓剑', 'super');
INSERT INTO `user` VALUES ('10007', 'zys', 2, '15386525858', '2020-07-22 08:44:47', '张一水', 'super');

SET FOREIGN_KEY_CHECKS = 1;

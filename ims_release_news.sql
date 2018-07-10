/*
Navicat MySQL Data Transfer

Source Server         : 微狐分销
Source Server Version : 50631
Source Host           : 115.28.64.190:3306
Source Database       : we7_xcx

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2018-07-10 10:55:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ims_release_news_area`
-- ----------------------------
DROP TABLE IF EXISTS `ims_release_news_area`;
CREATE TABLE `ims_release_news_area` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `uniacid` int(9) DEFAULT NULL,
  `level` tinyint(3) DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `aid` int(9) DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ims_release_news_area
-- ----------------------------
INSERT INTO `ims_release_news_area` VALUES ('9', '13', '1', '山东', null, null);
INSERT INTO `ims_release_news_area` VALUES ('12', '13', '2', '济南', '9', null);
INSERT INTO `ims_release_news_area` VALUES ('14', '13', '2', '历下', '9', null);
INSERT INTO `ims_release_news_area` VALUES ('15', '13', '2', '历城', '9', null);
INSERT INTO `ims_release_news_area` VALUES ('16', '23', '1', '山东', null, '1');
INSERT INTO `ims_release_news_area` VALUES ('17', '23', '2', '济南', '16', '1');
INSERT INTO `ims_release_news_area` VALUES ('19', '23', '1', '河北', null, '1');
INSERT INTO `ims_release_news_area` VALUES ('20', '23', '2', '沧州', '19', '1');
INSERT INTO `ims_release_news_area` VALUES ('21', '23', '2', '唐山', '19', '1');
INSERT INTO `ims_release_news_area` VALUES ('22', '23', '1', '北京', null, '1');
INSERT INTO `ims_release_news_area` VALUES ('23', '23', '1', '天津', null, '1');
INSERT INTO `ims_release_news_area` VALUES ('24', '23', '2', '石家庄', '19', '1');
INSERT INTO `ims_release_news_area` VALUES ('25', '23', '2', '邯郸', '19', '1');
INSERT INTO `ims_release_news_area` VALUES ('26', '23', '2', '邢台', '19', '1');
INSERT INTO `ims_release_news_area` VALUES ('27', '23', '2', '保定', '19', '1');
INSERT INTO `ims_release_news_area` VALUES ('28', '23', '2', '廊坊', '19', '1');
INSERT INTO `ims_release_news_area` VALUES ('29', '23', '2', '衡水', '19', '1');
INSERT INTO `ims_release_news_area` VALUES ('30', '23', '2', '青岛', '16', '1');
INSERT INTO `ims_release_news_area` VALUES ('31', '23', '2', '淄博', '16', '1');
INSERT INTO `ims_release_news_area` VALUES ('32', '23', '2', '枣庄', '16', '1');
INSERT INTO `ims_release_news_area` VALUES ('33', '23', '2', '东营', '16', '1');
INSERT INTO `ims_release_news_area` VALUES ('34', '23', '2', '烟台', '16', '1');
INSERT INTO `ims_release_news_area` VALUES ('35', '23', '2', '潍坊', '16', '1');
INSERT INTO `ims_release_news_area` VALUES ('36', '23', '2', '泰安', '16', '1');
INSERT INTO `ims_release_news_area` VALUES ('37', '23', '2', '威海', '16', '1');
INSERT INTO `ims_release_news_area` VALUES ('38', '23', '2', '日照', '16', '1');
INSERT INTO `ims_release_news_area` VALUES ('39', '23', '2', '滨州', '16', '1');
INSERT INTO `ims_release_news_area` VALUES ('40', '23', '2', '德州', '16', '1');
INSERT INTO `ims_release_news_area` VALUES ('41', '23', '2', '聊城', '16', '1');
INSERT INTO `ims_release_news_area` VALUES ('42', '23', '2', '临沂', '16', '1');
INSERT INTO `ims_release_news_area` VALUES ('43', '23', '2', '菏泽', '16', '1');
INSERT INTO `ims_release_news_area` VALUES ('44', '23', '2', '莱芜', '16', '1');
INSERT INTO `ims_release_news_area` VALUES ('47', '23', '1', '江苏', null, '1');
INSERT INTO `ims_release_news_area` VALUES ('48', '23', '1', '上海', null, '1');
INSERT INTO `ims_release_news_area` VALUES ('49', '23', '1', '陕西', null, '1');
INSERT INTO `ims_release_news_area` VALUES ('50', '23', '1', '山西', null, '1');
INSERT INTO `ims_release_news_area` VALUES ('51', '23', '2', '南京', '47', '1');
INSERT INTO `ims_release_news_area` VALUES ('52', '23', '2', '徐州', '47', '1');
INSERT INTO `ims_release_news_area` VALUES ('53', '23', '2', '连云港', '47', '1');
INSERT INTO `ims_release_news_area` VALUES ('54', '23', '2', '宿迁', '47', '1');
INSERT INTO `ims_release_news_area` VALUES ('55', '23', '2', '扬州', '47', '1');
INSERT INTO `ims_release_news_area` VALUES ('56', '23', '2', '盐城', '47', '1');
INSERT INTO `ims_release_news_area` VALUES ('57', '23', '2', '南通', '47', '1');
INSERT INTO `ims_release_news_area` VALUES ('58', '23', '2', '泰州', '47', '1');
INSERT INTO `ims_release_news_area` VALUES ('59', '23', '2', '苏州', '47', '1');
INSERT INTO `ims_release_news_area` VALUES ('60', '23', '2', '常州', '47', '1');
INSERT INTO `ims_release_news_area` VALUES ('61', '23', '2', '无锡', '47', '1');
INSERT INTO `ims_release_news_area` VALUES ('62', '23', '2', '镇江', '47', '1');
INSERT INTO `ims_release_news_area` VALUES ('63', '23', '2', '西安', '49', '1');
INSERT INTO `ims_release_news_area` VALUES ('64', '23', '2', '宝鸡', '49', '1');
INSERT INTO `ims_release_news_area` VALUES ('65', '23', '2', '咸阳', '49', '1');
INSERT INTO `ims_release_news_area` VALUES ('66', '23', '2', '渭南', '49', '1');
INSERT INTO `ims_release_news_area` VALUES ('67', '23', '2', '榆林', '49', '1');
INSERT INTO `ims_release_news_area` VALUES ('68', '23', '2', '太原', '50', '1');
INSERT INTO `ims_release_news_area` VALUES ('69', '23', '2', '大同', '50', '1');
INSERT INTO `ims_release_news_area` VALUES ('70', '23', '2', '长治', '50', '1');
INSERT INTO `ims_release_news_area` VALUES ('71', '23', '2', '忻州', '50', '1');
INSERT INTO `ims_release_news_area` VALUES ('72', '23', '2', '临汾', '50', '1');
INSERT INTO `ims_release_news_area` VALUES ('73', '23', '2', '吕梁', '50', '1');

-- ----------------------------
-- Table structure for `ims_release_news_chatlog`
-- ----------------------------
DROP TABLE IF EXISTS `ims_release_news_chatlog`;
CREATE TABLE `ims_release_news_chatlog` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `uniacid` int(9) DEFAULT NULL,
  `touid` int(9) DEFAULT NULL,
  `fromuid` int(9) DEFAULT NULL,
  `content` text,
  `createtime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ims_release_news_chatlog
-- ----------------------------
INSERT INTO `ims_release_news_chatlog` VALUES ('41', '23', '12', '15', 'hello', '1517900653');
INSERT INTO `ims_release_news_chatlog` VALUES ('43', '23', '11', '16', '暮鼓谋略', '1517972041');
INSERT INTO `ims_release_news_chatlog` VALUES ('44', '23', '16', '11', '对方水电费', '1517972153');
INSERT INTO `ims_release_news_chatlog` VALUES ('45', '23', '11', '13', '你好', '1520238489');
INSERT INTO `ims_release_news_chatlog` VALUES ('46', '23', '13', '12', '你看看', '1520316354');
INSERT INTO `ims_release_news_chatlog` VALUES ('47', '23', '12', '13', '行啊', '1520320589');
INSERT INTO `ims_release_news_chatlog` VALUES ('48', '23', '12', '13', '想买能收着吧。', '1520320626');
INSERT INTO `ims_release_news_chatlog` VALUES ('49', '23', '22', '25', '马哥', '1520323545');

-- ----------------------------
-- Table structure for `ims_release_news_company`
-- ----------------------------
DROP TABLE IF EXISTS `ims_release_news_company`;
CREATE TABLE `ims_release_news_company` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `uniacid` int(9) NOT NULL,
  `uid` int(9) DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `address` varchar(125) DEFAULT NULL,
  `address_ex` varchar(225) DEFAULT NULL,
  `contactname` varchar(125) DEFAULT NULL,
  `contactmobile` varchar(125) DEFAULT NULL,
  `tel` varchar(125) DEFAULT NULL,
  `businessarea` varchar(225) DEFAULT NULL,
  `content` text,
  `thumb` varchar(225) DEFAULT NULL,
  `createtime` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ims_release_news_company
-- ----------------------------
INSERT INTO `ims_release_news_company` VALUES ('1', '13', '4', '测试企业', '全国', '阿萨德', '张三', '15253654785', '0531-2536548', '第三方第三方；电风扇', '第三方广东省高富帅\r<br>的双方各', 'https://xcx.sdweihu.com/addons/release_news/data/tb591517031603.jpg', '1517031603');
INSERT INTO `ims_release_news_company` VALUES ('2', '13', '4', '测试2', '济南', '第三方第三方', '李四', '15253653657', '0531-9654752', '申达股份发光飞碟', '梵蒂冈梵蒂冈', null, '1517032673');
INSERT INTO `ims_release_news_company` VALUES ('10', '23', '17', '河北尚恒管道制造有限公司', '全国', '盐山县盐塔路北段', '王经理', '13383378160', '0317-5120988', '', '河北尚恒管道制造有限公司是一家实质生产企业，加工不锈钢弯头，三通，大小头，卫生级管件，卡盘，卡箍，金属软管，试镜等', '', '1518610650');
INSERT INTO `ims_release_news_company` VALUES ('11', '23', '34', '河北长虹密封材料有限公司', '全国', '河北省孟村回族自治县辛大路口', '刘占良', '13754533302', '0317-6865567', '', '主营:各种型号材质法兰密封垫片，可定做各种材质异形垫片', 'https://xcx.sdweihu.com/addons/release_news/data/tb721520558756.jpg', '1520558756');
INSERT INTO `ims_release_news_company` VALUES ('12', '23', '59', '盐山明宇不锈钢', '全国', '盐山县盐塔路中段', '张秀胜', '13931755980', '6307316', '', '诚信是金', '', '1520824419');
INSERT INTO `ims_release_news_company` VALUES ('15', '23', '13', '河北国瑞管道有限公司', '沧州', '河北省盐山县城南开发区', '马先生', '18003377956', '15133793616', '', '销售高中低压管道及管件，弯头，法兰，三通，大小头等', '', '1520833102');
INSERT INTO `ims_release_news_company` VALUES ('16', '23', '13', '河北盐山恒海不锈钢法兰管件厂', '沧州', '盐山县五里窑工业区', '贾兆锋', '13832700478', '0317-6391236', '', '生产各种保材质不锈钢，合金钢，高中低压锻打法兰，人孔，视镜，管板及各种材质弯头，三通，大小头，疑难管件。', '', '1520833559');
INSERT INTO `ims_release_news_company` VALUES ('17', '23', '14', '河北泽源管道设备有限公司', '全国', '盐山盐塔路工业区', '袁学超', '13303076111', '0317-6352077', '', 'yidaojia\r<br>支吊架，管道配件及设备', '', '1520833707');
INSERT INTO `ims_release_news_company` VALUES ('18', '23', '13', '盐山明宇不锈钢下脚料加工厂', '沧州', '盐山县沧盐路五里段', '张秀胜', '13931755980', '13931755980', '', '中厚钢板，钢锭，不锈钢法兰盘，废钢回收', '', '1520834165');
INSERT INTO `ims_release_news_company` VALUES ('19', '23', '14', '河北伟东管道设备有限公司', '全国', '盐塔路', '张经理', '13488878808', '13488878808', '', '管件', '', '1520834767');
INSERT INTO `ims_release_news_company` VALUES ('20', '23', '13', '河北汇通管件制造有限公司', '沧州', '盐山县五里窑工业区', '王先生', '13633177808', '13633177808', '', '生产制造各种管件', '', '1520835519');
INSERT INTO `ims_release_news_company` VALUES ('21', '23', '61', '沧州同邦管道装备有限公司', '全国', '沧州市盐山县龙潭工业区', '刘经理', '18931722201', '0317-5120900', '', '主营支吊架，弯头，法兰，三通，大小头，弯管，电厂配件及附件。', 'https://xcx.sdweihu.com/addons/release_news/data/tb761520835659.jpg', '1520835659');
INSERT INTO `ims_release_news_company` VALUES ('23', '23', '14', '河北伟东管道设备有限公司', '全国', '盐塔路', '张经理', '13488878808', '13488878808', '', '管件', '', '1520836836');
INSERT INTO `ims_release_news_company` VALUES ('26', '23', '66', '鑫蕊标准件螺丝大全', '全国', '沧州市盐山县五里窑工业区恒泰门市楼鑫蕊标准件', '王喜庆', '15532882727', '0317-6392077', '', '盐山鑫蕊标准件主要经营：各种材质双头螺栓，六角螺栓，绞制孔螺栓，扒钉（马钉）！鱼尾丝！减速带钉！人孔配件，全螺纹螺栓，地脚螺栓，内六角，U型管卡，级别有4.8.5.6 6.8  8.8  10.9  12.9，钢结构大六角，穿墙丝，止水螺杆，钢筋套筒，拉铆钉，钻尾丝，钢结构通风器，化学锚栓，焊钉，各种长度正扣反扣丝杠，L5花篮螺栓，L6吊杆螺纹接头，L7环形耳子，L8U型耳子，螺纹吊杆拉杆，球面垫圈，方斜垫，卡簧，方键，平键，销轴，门轴合页，膨胀螺栓，高强螺母，热镀锌螺栓，冷镀电镀螺栓，达克罗级特氟龙螺栓，电力抱箍，光伏配件，铁塔螺栓，燃气管道支架，电缆支架，订做弹簧，订做各种异型件，0317-6392077  13131712557            \r<br>15532882727', 'https://xcx.sdweihu.com/addons/release_news/data/tb621520902105.jpg', '1520902105');
INSERT INTO `ims_release_news_company` VALUES ('27', '23', '67', '邯郸市元隆紧固件制造有限公司', '全国', '河北省邯郸市永年区新商城148', '刘瑞阳', '13373401802', '0310-3710107', '', '生产标准件工厂', '', '1520926675');
INSERT INTO `ims_release_news_company` VALUES ('28', '23', '63', '河北润海管道装备有限公司', '全国', '河北省沧州市盐山县南环开发区', '李静', '17734152221', '0317-5129096', '', '本公司主要生产国标，非标，碳钢弯头，法兰，封头等管件，欢迎新老客户咨询', '', '1520937270');
INSERT INTO `ims_release_news_company` VALUES ('29', '23', '14', '青县华顺德运输队', '沧州', '沧州', '张中华', '13111778306', '13111778306', '', '运输，东北专线', '', '1521102152');
INSERT INTO `ims_release_news_company` VALUES ('30', '23', '14', '河北阜晟管道公司', '全国', '盐山', '刘吉领', '13703279444', '0317-6219567', '', '专业生产不锈钢管件', '', '1521102447');
INSERT INTO `ims_release_news_company` VALUES ('31', '23', '14', '河北春雷管道装备制造有限公司', '全国', '泊北', '张春雷', '13785713798', '0317-6896117', '', '对焊管件', '', '1521103087');
INSERT INTO `ims_release_news_company` VALUES ('32', '23', '14', '泊北金鼎管件有限公司', '全国', '泊北', '张春雨', '13831775508', '0317-6892508', '', '对焊管件', '', '1521103260');
INSERT INTO `ims_release_news_company` VALUES ('33', '23', '14', '圆通新材弯头', '全国', '盐山', '赵铁强', '13363672208', '0317-6886258', '', '无缝弯头', '', '1521103451');
INSERT INTO `ims_release_news_company` VALUES ('34', '23', '14', '河北世纪新星管业有限公司', '全国', '盐山', '樊经理', '13831765158', '0317-6825888', '', '煨制弯管', '', '1521103786');
INSERT INTO `ims_release_news_company` VALUES ('35', '23', '14', '河北世纪新星管业有限公司', '全国', '盐山', '樊经理', '13831765158', '0317-6825888', '', '煨制弯管', '', '1521103826');
INSERT INTO `ims_release_news_company` VALUES ('36', '23', '14', '圆通新材弯头', '全国', '盐山', '赵铁强', '13363672208', '0317-6886258', '', '无缝弯头', '', '1521103841');
INSERT INTO `ims_release_news_company` VALUES ('37', '23', '13', '盐城市锦尚机械有限公司', '盐城', '射阳县合德镇开发区', '张先锋', '13962041622', '0515-85027555', '', '主要产品，弹簧碟簧支吊架，恒力支吊家，风门，补偿器，消声器，水箱等各种电力，化工设备。', 'https://xcx.sdweihu.com/addons/release_news/data/tb491521161337.jpg', '1521161337');
INSERT INTO `ims_release_news_company` VALUES ('38', '23', '37', '力拓钢管', '全国', '孟村', '陈留斌', '13831720017', '13831720017', '', '经销各大钢厂无缝钢管', '', '1521352149');
INSERT INTO `ims_release_news_company` VALUES ('39', '23', '37', '爱多广告', '全国', '盐山北环', '爱多', '15076701054', '15076701054', '', '刻板，广告牌子，', '', '1521352271');
INSERT INTO `ims_release_news_company` VALUES ('40', '23', '37', '沧州元成实业', '全国', '沧州开发区', '迟彬', '15931731760', '15931731760', '', '生产各种规格螺旋钢管', '', '1521352387');
INSERT INTO `ims_release_news_company` VALUES ('41', '23', '37', '胜达法兰', '全国', '盐山五里窑', '催书城', '13932700221', '13932700221', '', '主要生产各种材质的锻打法兰', '', '1521352517');
INSERT INTO `ims_release_news_company` VALUES ('42', '23', '37', '东兴法兰厂', '全国', '孟村丁庄子工业区', '东兴法兰', '13623178222', '18632708306', '', '常年大量销售DN15-200非标/二标/新标钢板毛坯及成品销售，可订做异形毛坯，异形法兰，方形法兰，方形毛坯，各种毛坯齐全，订货快，质量好，价格低；欢迎新老客户来电询价，量大优惠；常年放加工活，铁板的。', '', '1521352927');
INSERT INTO `ims_release_news_company` VALUES ('43', '23', '14', '河北宏程管业有限公司', '全国', '盐山五里窑', '刘华军', '13833783988', '0317-6090199', '', '本公司经营合金管材，生产合金管件', '', '1521535666');
INSERT INTO `ims_release_news_company` VALUES ('44', '23', '14', '沧州市恒鑫高压管件厂', '全国', '孟村刘潭', '宋文波', '13803258037', '0317-6828188', '', '生产高压管件', '', '1521535871');
INSERT INTO `ims_release_news_company` VALUES ('45', '23', '14', '华艺公司', '全国', '生产合金管件', '刘华军', '13931756228', '0317-6392566', '', '生产合金管件', '', '1521535994');
INSERT INTO `ims_release_news_company` VALUES ('46', '23', '14', '华艺公司', '全国', '生产合金管件', '刘华军', '13931756228', '0317-6392566', '', '生产合金管件', '', '1521536018');
INSERT INTO `ims_release_news_company` VALUES ('47', '23', '70', '鑫恒纯锻法兰', '全国', '河北省沧州市孟村', '许恩亮', '13231700231', '0317-6858598', '', '鑫恒纯锻法兰\r<br>专业生产销售：新标、二标、老标纯料锻造平焊法兰。型号DN15—DN1200。\r<br>可按客户要求定做异形法兰。欢迎您来电☎️洽谈。\r<br>手机：13231700231（微信同号）\r<br>电话：0317-6858598', 'https://xcx.sdweihu.com/addons/release_news/data/tb451521893107.jpg', '1521893107');
INSERT INTO `ims_release_news_company` VALUES ('48', '23', '70', '鑫恒纯锻法兰', '全国', '河北省沧州市孟村', '许恩亮', '13231700231', '0317-6858598', '', '鑫恒纯锻法兰\r<br>专业生产销售：新标、二标、老标纯料锻造平焊法兰。型号DN15—DN1200。\r<br>可按客户要求定做异形法兰。欢迎您来电☎️洽谈。\r<br>手机：13231700231（微信同号）\r<br>电话：0317-6858598', 'https://xcx.sdweihu.com/addons/release_news/data/tb991521893142.jpg', '1521893142');
INSERT INTO `ims_release_news_company` VALUES ('49', '23', '70', '鑫恒纯锻法兰', '全国', '河北省沧州市孟村', '许恩亮', '13231700231', '0317-6858598', '', '鑫恒纯锻法兰\r<br>专业生产销售：新标、二标、老标纯料锻造平焊法兰。型号DN15—DN1200。\r<br>可按客户要求定做异形法兰。欢迎您来电☎️洽谈。\r<br>手机：13231700231（微信同号）\r<br>电话：0317-6858598', 'https://xcx.sdweihu.com/addons/release_news/data/tb861521893145.jpg', '1521893145');
INSERT INTO `ims_release_news_company` VALUES ('50', '23', '14', '沧州通泰车队', '全国', '沧州市', '温队长', '13373076722', '13373076722', '', '承揽东北线运输', '', '1522035049');
INSERT INTO `ims_release_news_company` VALUES ('51', '23', '14', '沧州永恒车队', '全国', '沧州市', '蒋经理', '13315711169', '13315711169', '', '运输，东北专线', '', '1522035200');
INSERT INTO `ims_release_news_company` VALUES ('52', '23', '14', '沧州宏宇车队', '全国', '沧州市', '王立峰', '13333177713', '13333177713', '', '东北专线', '', '1522035331');
INSERT INTO `ims_release_news_company` VALUES ('53', '23', '14', '盐山艺豪运输队', '全国', '盐山县城', '左经理', '13831775973', '13831775973', '', '东北专线', '', '1522035626');
INSERT INTO `ims_release_news_company` VALUES ('54', '23', '14', '青县华顺德运输公司', '全国', '盐山', '张队长', '13111778306', '13111778306', '', '承揽国内货物运输', '', '1522035865');
INSERT INTO `ims_release_news_company` VALUES ('55', '23', '14', '青县华顺德运输公司', '全国', '盐山', '张队长', '13111778306', '13111778306', '', '承揽国内货物运输', '', '1522036210');
INSERT INTO `ims_release_news_company` VALUES ('56', '23', '13', '河北洋勇管道设备有限公司', '沧州', '盐山县城南开发区', '呈经理', '13603278780', '0317-6811585', '', '不锈钢法兰，三通，弯头，衬胶衬塑管件，耐磨管道管件', '', '1522045719');
INSERT INTO `ims_release_news_company` VALUES ('57', '23', '13', '河北亚都管道装备集团有限公司', '沧州', '孟村县流潭工业区', '马经理', '15133793616', '0317-6896918', '', '公司主要生产高压弯头、大口径管头、合金弯头，拥有推制弯头、压制弯头三通、法兰生产线15条。', '', '1522046547');
INSERT INTO `ims_release_news_company` VALUES ('58', '23', '13', '河北凯泽丰管道制造有限公司', '沧州', '盐山县城南开发区', '门经理', '18733027777', '0317-5125796', '', '公司主要产品为石油、化工、电力、输油、输气等行业专用保温管道管件。', '', '1522046688');
INSERT INTO `ims_release_news_company` VALUES ('59', '23', '13', '盐山亚汇管业有限公司', '沧州', '盐山县盐塔路段', '刘经理', '15831898288', '15831898288', '', '我公司主要经营P92、P91、P9、P5、P22、P11等合金材质的管材及管件产品。', '', '1522046798');
INSERT INTO `ims_release_news_company` VALUES ('60', '23', '13', '河北晨光铸造有限公司', '沧州', '盐山县工业园', '李经理', '15831770111', '0317-6836558', '', '公司生产销售钢管脚手架扣件、建筑扣件、玛钢件、转向扣件等建筑器械。', '', '1522046899');
INSERT INTO `ims_release_news_company` VALUES ('61', '23', '12', '沧州飞红对焊', '全国', '辛满路赵庄路口', '经理', '18031717755', '0317-6830338', '', '对焊管件，喇叭口', '', '1522048699');
INSERT INTO `ims_release_news_company` VALUES ('62', '23', '12', '洪波卷管', '全国', '孟村泊北工业区', '张洪波', '13483801234', '0317-6892006', '', '专业生产大口径厚壁卷管', '', '1522048812');
INSERT INTO `ims_release_news_company` VALUES ('63', '23', '12', '精诚封头', '全国', '盐山', '经理', '13803258333', '0317-6393636', '', '国标封头，管帽，非标封头', '', '1522048933');
INSERT INTO `ims_release_news_company` VALUES ('64', '23', '12', '尹红林弯头', '全国', '孟村辛店五金城', '尹红林', '13785816972', '0317-6886380', '', '弯头，国标弯头，非标弯头，直缝弯头，无缝弯头219-720', '', '1522049290');
INSERT INTO `ims_release_news_company` VALUES ('65', '23', '12', '奕航管业', '全国', '13785809898', '经理', '13785809898', '0317-6818117', '', '专业弯管', '', '1522049397');
INSERT INTO `ims_release_news_company` VALUES ('66', '23', '13', '河北国瑞管道有限公司', '沧州', '盐山县城南开发区', '马经理', '18003377956', '18003377956', '', '我公司专业生产销售各种规格材质的弯头，法兰，三通，异径管，封头，管帽等。', '', '1522130743');
INSERT INTO `ims_release_news_company` VALUES ('67', '23', '14', '会峰大小头厂', '全国', '盐山五里窑', '张会峰', '13803258680', '13803258680', '', '生产大小头', '', '1522203068');
INSERT INTO `ims_release_news_company` VALUES ('68', '23', '14', '会峰大小头厂', '全国', '盐山五里窑', '张会峰', '13803258680', '13803258680', '', '生产大小头', '', '1522203074');
INSERT INTO `ims_release_news_company` VALUES ('69', '23', '65', '华昊三通', '沧州', '沧州孟村县辛店镇卜宅市场', '张洪光', '13582477905', '6768988', '', '生产销售各种型号三通四通', 'https://xcx.sdweihu.com/addons/release_news/data/tb681522243691.jpg', '1522243691');
INSERT INTO `ims_release_news_company` VALUES ('70', '23', '14', '天畅运输队', '全国', '盐山县城', '何国林', '13111728337', '0317-6838337', '', '山西专线', '', '1522406502');
INSERT INTO `ims_release_news_company` VALUES ('71', '23', '14', '陈龙车队', '全国', '青县', '陈经理', '13333179996', '13333179996', '', '山西专线', '', '1522406710');
INSERT INTO `ims_release_news_company` VALUES ('72', '23', '14', '盐山鑫鑫运输有限公司', '全国', '盐山县城', '张经理', '17778866658', '17778866658', '', '山西专线', '', '1522406843');
INSERT INTO `ims_release_news_company` VALUES ('73', '23', '14', '盐山中原车队', '全国', '盐山县城', '李经理', '13363679698', '13363679698', '', '山东，山西专线', '', '1522406967');
INSERT INTO `ims_release_news_company` VALUES ('74', '23', '80', '质量大口径对焊弯头', '全国', '河北孟村北肖庄子村', '韩东岩', '15532755510', '15532755510', '', '大口径对焊弯头，质量保证，保证新材，焊接 不二的选择', 'https://xcx.sdweihu.com/addons/release_news/data/tb741522732817.jpg', '1522732817');
INSERT INTO `ims_release_news_company` VALUES ('75', '23', '20', '沧州鼎信防腐保温管道工程有限公司', '沧州', '盐山县城南蒲洼开发区', '闫晓飞', '15128791096', '0317-3012365', '', ' 沧州鼎信管道防腐保温工程有限公司\r<br>保温厂接单中：15128791096 本公司加工生产：\r<br>聚氨酯直埋保温管\r<br>钢套钢蒸汽保温管\r<br>钢套钢复合保温管\r<br>铁皮保温管\r<br>发泡保温管件\r<br>防腐钢管\r<br>各种管道管件的保温和防腐。\r<br>对外销售聚乙烯外护管（黑黄夹克管）\r<br>联系人：闫经理\r<br>电话：0317-3012365 \r<br>手机：15128791096   \r<br>地址：盐山城南蒲洼开发区', 'https://xcx.sdweihu.com/addons/release_news/data/tb921524099474.jpg', '1524099474');

-- ----------------------------
-- Table structure for `ims_release_news_idea`
-- ----------------------------
DROP TABLE IF EXISTS `ims_release_news_idea`;
CREATE TABLE `ims_release_news_idea` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `uniacid` int(9) DEFAULT NULL,
  `uid` int(9) DEFAULT NULL,
  `content` varchar(225) DEFAULT NULL,
  `createtime` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ims_release_news_idea
-- ----------------------------
INSERT INTO `ims_release_news_idea` VALUES ('2', '13', '4', '测试意见\r<br>测试建议', '1517130536');

-- ----------------------------
-- Table structure for `ims_release_news_news`
-- ----------------------------
DROP TABLE IF EXISTS `ims_release_news_news`;
CREATE TABLE `ims_release_news_news` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `uniacid` int(9) DEFAULT NULL,
  `uid` int(9) DEFAULT NULL,
  `address` varchar(125) DEFAULT NULL,
  `type` tinyint(3) DEFAULT NULL,
  `content` text,
  `createtime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ims_release_news_news
-- ----------------------------
INSERT INTO `ims_release_news_news` VALUES ('18', '13', '4', '济南', '1', '冠农股份', '1516935896');
INSERT INTO `ims_release_news_news` VALUES ('21', '13', '4', '山东', '1', '阿萨德', '1516938163');
INSERT INTO `ims_release_news_news` VALUES ('23', '13', '4', '山东', '3', '阿萨德发', '1516938442');
INSERT INTO `ims_release_news_news` VALUES ('25', '13', '4', '山东', '2', '是电风扇的', '1516938458');
INSERT INTO `ims_release_news_news` VALUES ('26', '13', '4', '济南', '3', '电饭锅梵蒂冈梵蒂冈', '1516938465');
INSERT INTO `ims_release_news_news` VALUES ('27', '13', '4', '济南', '2', '水电费第三方是的', '1516938473');
INSERT INTO `ims_release_news_news` VALUES ('28', '13', '4', '山东', '3', '十大歌手大富大贵', '1516938478');
INSERT INTO `ims_release_news_news` VALUES ('29', '13', '4', '山东', '1', '阿斯达斯的撒旦', '1516938483');
INSERT INTO `ims_release_news_news` VALUES ('31', '13', '4', '济南', '1', '第三方15253379480梵蒂冈', '1516948291');
INSERT INTO `ims_release_news_news` VALUES ('38', '13', '4', '济南', '1', '多个地方个\r<br>第三个风高放火', '1517126105');
INSERT INTO `ims_release_news_news` VALUES ('63', '23', '12', '沧州', '1', '弯头', '1520320492');
INSERT INTO `ims_release_news_news` VALUES ('64', '23', '20', '山东', '1', '保温钢管管件，管道厂家', '1520321599');
INSERT INTO `ims_release_news_news` VALUES ('65', '23', '22', '太原', '1', '耐磨弯头，防腐管道，保温管道，衬塑管道，双金属耐磨弯头，陶瓷耐磨弯头', '1520322280');
INSERT INTO `ims_release_news_news` VALUES ('66', '23', '21', '沧州', '1', '本厂专业生产：聚氨酯发泡保温管（黑夹克、黄夹克）、钢套钢直埋蒸汽保温钢管（玻璃棉、岩棉、硅酸铝硅酸钙复合保温）、3PE防腐钢管、环氧煤沥青防腐钢管IPN8710饮水管道内防腐、钢套钢直埋保温管、发泡保温管件、防腐管件等 配套专用的管件一系列产品均可供应', '1520322294');
INSERT INTO `ims_release_news_news` VALUES ('67', '23', '22', '山西', '1', '耐磨弯头，防腐管道，保温管道，衬塑管道，双金属耐磨弯头，陶瓷耐磨弯头，稀土合金耐磨弯头，碳化硅耐磨弯头，陶瓷复合管，背包耐磨弯头，脱硫耐磨防腐管道管件', '1520322412');
INSERT INTO `ims_release_news_news` VALUES ('68', '23', '24', '聊城', '2', '长期收购带钢头，板材边角料', '1520322957');
INSERT INTO `ims_release_news_news` VALUES ('69', '23', '21', '江苏', '1', '法兰 弯头 大小头 封头等异型管件只需图纸便可订做 ', '1520323114');
INSERT INTO `ims_release_news_news` VALUES ('70', '23', '30', '东营', '1', ' 专业生产制造3pe防腐弯头，3pe防腐弯管。', '1520399777');
INSERT INTO `ims_release_news_news` VALUES ('71', '23', '31', '沧州', '1', '专业生产各种型号标准及材质锻打不锈钢带颈对焊法兰，盲板、八字盲板、人孔、锻件等', '1520404287');
INSERT INTO `ims_release_news_news` VALUES ('72', '23', '31', '沧州', '1', '专业生产各种型号标准及材质锻打不锈钢带颈对焊法兰，盲板、八字盲板、人孔、锻件等', '1520404315');
INSERT INTO `ims_release_news_news` VALUES ('73', '23', '31', '沧州', '1', '专业生产各种型号标准及材质锻打不锈钢带颈对焊法兰，盲板、八字盲板、人孔、锻件等', '1520404342');
INSERT INTO `ims_release_news_news` VALUES ('74', '23', '34', '沧州', '1', '各种材质法兰垫片', '1520558913');
INSERT INTO `ims_release_news_news` VALUES ('75', '23', '50', '山东', '1', '本公司生产销售各种型号各种材质闸阀，球阀，截止阀，蝶阀等，自产自销，质量好，价格低，有资质，可授权。', '1520818509');
INSERT INTO `ims_release_news_news` VALUES ('76', '23', '64', '沧州', '1', '石油，石化，电厂，化工等管道管件', '1520855920');
INSERT INTO `ims_release_news_news` VALUES ('78', '23', '56', '沧州', '1', '河北泽源管道设备制造有限公司:专业生产弹簧支吊架.滑动支座，双孔短管夹，花兰螺丝，U型耳子，高效隔热管托，恒力弹簧，螺纹吊杆，人孔等电厂，化工厂管道支吊架及各种连接件附件等系列配套产品\r<br>  联系电话:13303076111', '1520869358');
INSERT INTO `ims_release_news_news` VALUES ('79', '23', '56', '山东', '1', '河北泽源管道设备制造有限公司:专业生产弹簧支吊架.滑动支座，双孔短管夹，花兰螺丝，U型耳子，高效隔热管托，恒力弹簧，螺纹吊杆，人孔等电厂，化工厂管道支吊架及各种连接件附件等系列配套产品\r<br>  联系电话:13303076111', '1520869385');
INSERT INTO `ims_release_news_news` VALUES ('83', '23', '56', '上海', '1', '河北泽源管道设备制造有限公司:专业生产弹簧支吊架.滑动支座，双孔短管夹，花兰螺丝，U型耳子，高效隔热管托，恒力弹簧，螺纹吊杆，人孔等电厂，化工厂管道支吊架及各种连接件附件等系列配套产品\r<br>  联系电话:13303076111', '1520869465');
INSERT INTO `ims_release_news_news` VALUES ('86', '23', '14', '沧州', '3', '国内外物流', '1520901756');
INSERT INTO `ims_release_news_news` VALUES ('87', '23', '37', '沧州', '1', '天津大无缝钢管', '1520909634');
INSERT INTO `ims_release_news_news` VALUES ('88', '23', '37', '沧州', '1', '一倍，一倍半无缝弯头', '1520909731');
INSERT INTO `ims_release_news_news` VALUES ('89', '23', '37', '沧州', '1', '模压异径管', '1520909891');
INSERT INTO `ims_release_news_news` VALUES ('90', '23', '37', '沧州', '1', '各种材质的高中低压管件及疑难管件', '1520910035');
INSERT INTO `ims_release_news_news` VALUES ('91', '23', '37', '沧州', '1', '各种材质的高中低压管件及疑难管件', '1520910053');
INSERT INTO `ims_release_news_news` VALUES ('92', '23', '37', '沧州', '1', '各种材质的高中低压管件及疑难管件', '1520910066');
INSERT INTO `ims_release_news_news` VALUES ('93', '23', '37', '沧州', '1', '天津大无缝钢管', '1520910081');
INSERT INTO `ims_release_news_news` VALUES ('94', '23', '67', '泰州', '1', '河北元隆紧固件制造有限公司，专业生产钢丝绳卡头、花兰、卸扣。型号齐全，质量保证。联系电话13373401802', '1520911358');
INSERT INTO `ims_release_news_news` VALUES ('95', '23', '67', '济南', '1', '河北元隆紧固件制造有限公司，专业生产钢丝绳卡头、花兰、卸扣。型号齐全，质量保证。联系电话13373401802', '1520911393');
INSERT INTO `ims_release_news_news` VALUES ('96', '23', '67', '青岛', '1', '河北元隆紧固件制造有限公司，专业生产钢丝绳卡头、花兰、卸扣。型号齐全，质量保证。联系电话13373401802', '1520911399');
INSERT INTO `ims_release_news_news` VALUES ('97', '23', '67', '淄博', '1', '河北元隆紧固件制造有限公司，专业生产钢丝绳卡头、花兰、卸扣。型号齐全，质量保证。联系电话13373401802', '1520911406');
INSERT INTO `ims_release_news_news` VALUES ('98', '23', '67', '枣庄', '1', '河北元隆紧固件制造有限公司，专业生产钢丝绳卡头、花兰、卸扣。型号齐全，质量保证。联系电话13373401802', '1520911411');
INSERT INTO `ims_release_news_news` VALUES ('99', '23', '67', '南京', '1', '河北元隆紧固件制造有限公司，专业生产钢丝绳卡头、花兰、卸扣。型号齐全，质量保证。联系电话13373401802', '1520911419');
INSERT INTO `ims_release_news_news` VALUES ('100', '23', '67', '徐州', '1', '河北元隆紧固件制造有限公司，专业生产钢丝绳卡头、花兰、卸扣。型号齐全，质量保证。联系电话13373401802', '1520911425');
INSERT INTO `ims_release_news_news` VALUES ('101', '23', '67', '连云港', '1', '河北元隆紧固件制造有限公司，专业生产钢丝绳卡头、花兰、卸扣。型号齐全，质量保证。联系电话13373401802', '1520911431');
INSERT INTO `ims_release_news_news` VALUES ('102', '23', '37', '沧州', '1', '沧州市恒昌钢管制造有限公司，\r<br>专业生产大口径无缝钢管，\r<br>常年代理天津大无缝、烟宝、包钢、凤宝等各大钢厂优质无缝钢管，\r<br>公司六条热扩生产线年产量十万余吨，生产范围351-1020mm*6-60mm\r<br>各种型号无缝钢管，GB/T8163，GB3087，GB5310，GB6479,GB9948\r<br>常年库存万余吨，可加工外贸定尺无缝管、镀锌无缝管、防腐保温无缝管，\r<br>现货充足，配货方便，欢迎新老客户来厂考察，\r<br>', '1520919640');
INSERT INTO `ims_release_news_news` VALUES ('103', '23', '37', '沧州', '1', '河北龙马钢管制造有限公司专业生产325-2020mm，壁厚8-80mm，备有大量管线钢管库存  15132716881  高洁   www.guandao688.com', '1520919704');
INSERT INTO `ims_release_news_news` VALUES ('104', '23', '37', '沧州', '1', '公司专业生产弯头、三通、弯管、异径管、管帽、法兰、承插等管件系列产品。\r<br>可按照ANSI、ASME、API5L、GOST、DIN、JIS等标准生产，产品出口到东南亚、\r<br>中东、欧美等数十个国家和地区，在国内外市场享有很高的信誉。\r<br>公司拥有的无损检测、超声检测、万能试验机、冲击试验机、物理检测和理化实验室，形成了完整的质量安全检验体系。\r<br>产品质量实行三级检验制度和一票否决制。实现产品出厂合格率100%。', '1520919764');
INSERT INTO `ims_release_news_news` VALUES ('105', '23', '63', '宝鸡', '1', '本公司主要生产碳钢弯头，法兰，封头等管件，欢迎广大新老客户咨询', '1520936943');
INSERT INTO `ims_release_news_news` VALUES ('107', '23', '13', '济南', '1', '273*14  R=6D弯管   4支  材质16Mn有需要的联系', '1521176963');
INSERT INTO `ims_release_news_news` VALUES ('108', '23', '69', '沧州', '1', '加工销售联箱汇气管  、三通    、 大小头、    90°弯头    、 180°弯头等各种材质疑难管件联系电话18931748307', '1521252442');
INSERT INTO `ims_release_news_news` VALUES ('109', '23', '73', '沧州', '1', '复合陶瓷耐磨弯头，陶瓷耐磨管道', '1522031751');
INSERT INTO `ims_release_news_news` VALUES ('110', '23', '71', '沧州', '2', '大型法兰', '1522034565');
INSERT INTO `ims_release_news_news` VALUES ('111', '23', '14', '沧州', '1', '专业生产大口径对焊弯头，价格最低，质量最高\r<br>三通，大小头，虾米弯等，各种疑难管件，型号DN700-DN2800，也可来图制作\r<br>一律新材，保材质，\r<br>给我一份信任，还您十分满意\r<br>\r<br>2018值得您信赖的合作伙伴\r<br>以质量求发展，以信任求第一，一次合作终身朋友，欢迎新老顾客来厂合谈，\r<br>\r<br>联系电话15532755510\r<br>联系微信14194805\r<br>联系QQ14194805\r<br>大口径对焊弯头，价格最低，只做好产品，', '1522041763');
INSERT INTO `ims_release_news_news` VALUES ('112', '23', '14', '沧州', '1', '专业生产大口径对焊弯头，价格最低，质量最高\r<br>三通，大小头，虾米弯等，各种疑难管件，型号DN700-DN2800，也可来图制作\r<br>一律新材，保材质，\r<br>给我一份信任，还您十分满意\r<br>\r<br>2018值得您信赖的合作伙伴\r<br>以质量求发展，以信任求第一，一次合作终身朋友，欢迎新老顾客来厂合谈，\r<br>\r<br>联系电话15532755510\r<br>联系微信14194805\r<br>联系QQ14194805\r<br>大口径对焊弯头，价格最低，只做好产品，', '1522042545');
INSERT INTO `ims_release_news_news` VALUES ('113', '23', '13', '沧州', '2', '法兰盖   DN450   2500LB   20#    5片   18003377956', '1522045845');
INSERT INTO `ims_release_news_news` VALUES ('114', '23', '79', '沧州', '1', '法兰DN100     PN1.6', '1522047267');
INSERT INTO `ims_release_news_news` VALUES ('115', '23', '13', '临沂', '1', '出售273*14   R=6D弯头4件', '1522134017');
INSERT INTO `ims_release_news_news` VALUES ('116', '23', '65', '沧州', '1', '各种三通四通', '1522242940');
INSERT INTO `ims_release_news_news` VALUES ('117', '23', '65', '沧州', '1', '生产销售各种型号三通四通', '1522243504');
INSERT INTO `ims_release_news_news` VALUES ('118', '23', '13', '沧州', '2', '谁能干石油套管加工  ', '1522288284');
INSERT INTO `ims_release_news_news` VALUES ('119', '23', '49', '山东', '1', '弯头三通异形件大量销售', '1522559089');
INSERT INTO `ims_release_news_news` VALUES ('120', '23', '78', '沧州', '1', '百源法兰保材质16Mn 20# A105DN15-350so wn sw pl国标美标全部现货', '1523081412');
INSERT INTO `ims_release_news_news` VALUES ('121', '23', '20', '沧州', '1', ' 沧州鼎信管道防腐保温工程有限公司\r<br>保温厂接单中：15128791096 本公司加工生产：\r<br>聚氨酯直埋保温管\r<br>钢套钢蒸汽保温管\r<br>钢套钢复合保温管\r<br>铁皮保温管\r<br>发泡保温管件\r<br>防腐钢管\r<br>各种管道管件的保温和防腐。\r<br>对外销售聚乙烯外护管（黑黄夹克管）\r<br>联系人：闫经理\r<br>电话：0317-3012365 \r<br>手机：15128791096   \r<br>地址：盐山城南蒲洼开发区', '1524099523');

-- ----------------------------
-- Table structure for `ims_release_news_set`
-- ----------------------------
DROP TABLE IF EXISTS `ims_release_news_set`;
CREATE TABLE `ims_release_news_set` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `uniacid` int(9) DEFAULT NULL,
  `freedays` int(5) DEFAULT NULL,
  `rechargedays` int(5) DEFAULT NULL,
  `rechargeprice` float(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ims_release_news_set
-- ----------------------------
INSERT INTO `ims_release_news_set` VALUES ('1', '13', '90', '365', '200.00');
INSERT INTO `ims_release_news_set` VALUES ('2', '23', '30', '365', '0.00');

-- ----------------------------
-- Table structure for `ims_release_news_users`
-- ----------------------------
DROP TABLE IF EXISTS `ims_release_news_users`;
CREATE TABLE `ims_release_news_users` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `uniacid` int(9) NOT NULL,
  `openid` varchar(125) NOT NULL,
  `name` varchar(125) DEFAULT NULL,
  `avatar` varchar(225) DEFAULT NULL,
  `mobile` varchar(125) DEFAULT NULL,
  `address` varchar(125) DEFAULT NULL,
  `address2` varchar(125) DEFAULT NULL,
  `type` tinyint(3) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `stoptime` varchar(255) DEFAULT NULL,
  `updatetime` varchar(255) DEFAULT NULL,
  `follow` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ims_release_news_users
-- ----------------------------
INSERT INTO `ims_release_news_users` VALUES ('4', '13', 'okAOK0-iz8wzd_DBQvkn9wJ242gA', '张三', 'http://wx.qlogo.cn/mmopen/uTAotoJRyDVpqmQ0TvhkpbWVh7hJ9LPy95OTlLG9nyib4ZKb7oc0lyh21Rfg0ibHk82y8pLvINUO8yZ7EM9qR7ugYlMYdWNqibY/132', '15253379488', '全国', '济南', '3', '1516764603', '1524540603', '1517127647', '20,29,24,19,38,25,18,');
INSERT INTO `ims_release_news_users` VALUES ('9', '13', 'okAOK00wRO1VbE5Jy3deX7AtCi1Q', '流长', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epxBafZnwFlkchyibQwo0p3icVeMvuaLh7Kx94qa6G8D5bREicoVv8ZH27qakBx3sPfzHOm4Z4ZqWsdQ/132', '15236985472', null, '全国', '1', '1517046045', '1524822045', '1517046045', null);
INSERT INTO `ims_release_news_users` VALUES ('10', '13', 'okAOK0zBww6Hlc3kTcuFfTubbd-I', '千城幕白', 'http://wx.qlogo.cn/mmopen/vi_32/JZkIyRcGOEULhIQ7mUokDnEOQblgKC5icQ8ntayE1Nhvib13PCoAicKibRG5fErPhwpnOhrdvcEowGHDIB38uK37gg/132', '15269857452', null, '全国', '1', '1517046184', '1524822184', '1517046184', null);
INSERT INTO `ims_release_news_users` VALUES ('11', '23', 'oIg1m0yP10r9ZiW_36GNyKQ29YM4', '羔羊', 'http://wx.qlogo.cn/mmopen/Cyu7Vk5qnWF7cAMiapYcBwkKNQsdEsr5IibqORMeyaNjXGVUPca5ug5XRcM5fYu0OYbQgk636GVGkgQwCd5FSib0HfiafE96mohV/132', '15253379480', '山东', '济南', '3', '1517814264', '9999999999', '1517966945', '43,44,');
INSERT INTO `ims_release_news_users` VALUES ('12', '23', 'oIg1m0_6pPJwu8mVrkxfnJO3eAy0', '兰陵王@管件制造', 'http://wx.qlogo.cn/mmopen/fo2iaqYic1685ia0ibVaMxliclibx1Je3lYLrsiajWvI9icG0R511cIC11njuEKdM7z1PxJWWULEbz9usvT1Zr7Nmrl9zSQuQtXIqMWw/132', '13930761650', null, '全国', '2', '1517814716', '1525590716', '1517896096', '');
INSERT INTO `ims_release_news_users` VALUES ('13', '23', 'oIg1m07RVnRdcNegK-iKQV9d-rF8', '国瑞管道', 'http://wx.qlogo.cn/mmopen/EcK3IEWer4M6EOXRaATzCSnmAwhIJEfQVEKTwVowiayiaIK6zwIPZ7NF4IQ9WKNNyU3P6aWlmQaFFkCq2XVEmgbTWoVmLpP81A/132', '18003377956', '全国', '全国', '1', '1517895189', '1525671189', '1520824813', '58,61,');
INSERT INTO `ims_release_news_users` VALUES ('14', '23', 'oIg1m017VnGv3RwApUXf1YOUNWdw', '刘宝重', 'http://wx.qlogo.cn/mmopen/fo2iaqYic1687XYpeEMFIgPU3qVG7dPZib7zVIUwxCXFic5Z4MfCOkOUvcf8R3QASlhDaduXKnu6XcrBicofqTb8eHZrt4dV0ajWGDqwyNfRQ8EI/132', '13373230561', null, '全国', '1', '1517896506', '1525672506', '1517896506', null);
INSERT INTO `ims_release_news_users` VALUES ('15', '23', 'oIg1m0_HMKJA1RoIF8D2X5jW0zd0', 'LiúXiǎoShuài', 'http://wx.qlogo.cn/mmopen/fo2iaqYic1687TPyx8vu4GB1jjU0vetOQpianbeib4p5RV4lM48WfribWUVY4kYNHIuHDKBHRo8hPOgydcoC0ptFBfUHahZA69qlY/132', '18301668322', '济南', '全国', '2', '1517899501', '1525675501', '1517900598', '43,');
INSERT INTO `ims_release_news_users` VALUES ('16', '23', 'oIg1m091Y-CltZtGDI1vxEKgFr_s', '流长', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epicqRmOVSZuTNf4kODxBSyicjDibFfTFicHvLDxoJzicA2FZHCVygKIzTcLZ230m5wrNYZqdGiaicgHEaEQ/132', '15264978521', null, '济南', '2', '1517971988', '1525747988', '1517971988', null);
INSERT INTO `ims_release_news_users` VALUES ('17', '23', 'oIg1m0xCqekOfhdSo8n46e7Mqo-U', '河北尚恒管道', 'http://thirdwx.qlogo.cn/mmopen/fo2iaqYic16858sw5NiaatOx2jLtQTC9Tjnwrd7TRdDNZ5ictNpGU4YSricusO7zx7rkkv9n6AAnZWxTjWTdr2AiavQWAuXCpDDF4V/132', '13383378160', null, '全国', '1', '1518610338', '1526386338', '1518610338', null);
INSERT INTO `ims_release_news_users` VALUES ('18', '23', 'oIg1m06gY3Z12LixQpvZxWo7nJ18', '李娟', 'http://thirdwx.qlogo.cn/mmopen/fo2iaqYic1686iaqbjlZibZcnZOwKI6X1YRQxOXGdD5Tz09CI2ckribdDlVBcDjY7klB3DcxVoX0CygmHBxz9bia52nMz2DUTq5VNb/132', '18931712825', null, '全国', '1', '1519784151', '1527560151', '1519784151', null);
INSERT INTO `ims_release_news_users` VALUES ('19', '23', 'oIg1m03dWCSLTZeui-ZwtYowVpyI', '大展宏图', 'http://thirdwx.qlogo.cn/mmopen/bqlXzzbrNicrOia0YiazcFhCWJttqdYrhM6wODASEcKzic0boMwjsdcSmkNx8slSPBVwfCSB2icGVeJpdCHC53uHdiabGm86m0Kib3e/132', '13111712666', null, '全国', '1', '1520140077', '1527916077', '1520140077', null);
INSERT INTO `ims_release_news_users` VALUES ('20', '23', 'oIg1m01o5HhjnjQAM9VfQaSfTqvw', 'A鼎信保温防腐厂闫-15128791096', 'http://thirdwx.qlogo.cn/mmopen/ajNVdqHZLLBDXI8ckSic91cia9GJ1xROcuXrWia2Gk7rDRJBB92ESxlVGqmUO3kUYMMRBFdRSWqTzJN1UpYFuQOCQ/132', '15128791096', null, '全国', '1', '1520321311', '1528097311', '1520321469', null);
INSERT INTO `ims_release_news_users` VALUES ('21', '23', 'oIg1m00S1AxlT0TaqS-GT1wIidOk', '尹晓月@保温管道管件', 'http://thirdwx.qlogo.cn/mmopen/92PyIX2jM7XZC7GqXklEHtZIubia7nVO2uPMblsmGoG71Ao1mIUmyXEecyQXcZiaUlicAxXRxUdhNddiaTLKmCHRlql18BCialrB5/132', '15533702274', null, '全国', '1', '1520322178', '1522914178', '1520322178', null);
INSERT INTO `ims_release_news_users` VALUES ('22', '23', 'oIg1m0y3NTUaU8RERlsbEIynhlgk', '耐磨防腐管道', 'http://thirdwx.qlogo.cn/mmopen/fo2iaqYic1686iaqbjlZibZcndHibXRjiaCsNicKGq3ywJeNJuNEAFzI1TicJWD9459WYK1Eszuz7APwaC3ibxFC0j4zcfoeLzDqDzrIV/132', '13283295168', null, '全国', '1', '1520322199', '1522914199', '1520322435', null);
INSERT INTO `ims_release_news_users` VALUES ('23', '23', 'oIg1m07MEf6RaRGfxXU6yfrk-xRU', '李迎宾', 'http://thirdwx.qlogo.cn/mmopen/ajNVdqHZLLCib1RvPyKuKa1z4DzPcKWphhtDrJLXwLXiatSgBd8H8dpB1NpRKZ0PQBGibKWRWibCxMxr8T20zQZmiaA/132', '17733757108', null, '全国', '1', '1520322629', '1522914629', '1520322629', null);
INSERT INTO `ims_release_news_users` VALUES ('24', '23', 'oIg1m0z-3-u-t2K6LHoVdXLUDPgw', '山东宏兴冲压机械配件有限公司', 'http://thirdwx.qlogo.cn/mmopen/bqlXzzbrNicpTspQag3VQwnjT0NOZlrLOD4fIbUwCHcZFCewVicRz8KnRKxIbJiagicV1PSTpDMHg2f7TEjK052HrsQoQgGgxjA4/132', '13346220002', null, '全国', '2', '1520322842', '1522914842', '1520322842', null);
INSERT INTO `ims_release_news_users` VALUES ('25', '23', 'oIg1m06QX3TY4SBFq6_uKSwfjPHU', 'A.', 'http://thirdwx.qlogo.cn/mmopen/fo2iaqYic1686iaqbjlZibZcnURfPn5rnJWbkibKCsbXWtk0u11Jd0PkkcBNEgbjr1wiapTU42ibXJ7CwuIAaMT7T6iakBamQkVicdQGA/132', '17772679990', null, '全国', '1', '1520323255', '1522915255', '1520323255', null);
INSERT INTO `ims_release_news_users` VALUES ('26', '23', 'oIg1m0zO0MpNrT3-su-KRmfN89Nk', '港浩高压对焊法兰A10516MN20#', 'http://thirdwx.qlogo.cn/mmopen/bqlXzzbrNicoWicKqAMDQKicdEHZYbHhfIjUxGfShibUtudj4sUvUhgFCwib3eKUQTaLCXWibYicyHdMY7Zusd0btGFuiakCRqibibFwAX/132', '13231729895', null, '全国', '1', '1520323772', '1522915772', '1520323772', null);
INSERT INTO `ims_release_news_users` VALUES ('27', '23', 'oIg1m0044POxmDp4Gt-LvuZRb2F4', '邢文a', 'http://thirdwx.qlogo.cn/mmopen/PiajxSqBRaEKBVKbyTlgoCBWwIT0jTgxrOnck3j4lCiaQMZ3JMMbvLdlR7zvQl6JaqjiayibUEgia5CBkZ8uMc8sic6w/132', '13103375525', null, '全国', '1', '1520344734', '1522936734', '1520344734', null);
INSERT INTO `ims_release_news_users` VALUES ('28', '23', 'oIg1m0xt_P9b0ZcZz9prvI9rO7Mg', 'AA高金葆-13673170839', '', '13673170839', null, '全国', '1', '1520398819', '1522990819', '1520398819', null);
INSERT INTO `ims_release_news_users` VALUES ('29', '23', 'oIg1m06doTaLxvJx-cWkaLi_VOkA', '管道基地', 'http://thirdwx.qlogo.cn/mmopen/fo2iaqYic1687QGuaCf3TVqFsCxLwS54Hfn5S0HxTl9cpYB4YdPCHdev4R0n5rd5ibXPVsuAy7rjbhsaLTAgaCK8VZuA5bicEdv9/132', '15076767206', null, '全国', '1', '1520399459', '1522991459', '1520399459', null);
INSERT INTO `ims_release_news_users` VALUES ('30', '23', 'oIg1m0_qWC0RgAKxiJw0cTNlgMGA', '夕颜。', 'http://thirdwx.qlogo.cn/mmopen/PiajxSqBRaEKyyz7nx5NsTXEMrKRszNicqXmNic2UQvZ6xsEzV2tVKoQ2fM8uIqUOM7DXRyZmCsGsiaxroQXKuBAyg/132', '13833772765', null, '全国', '1', '1520399626', '1522991626', '1520399626', null);
INSERT INTO `ims_release_news_users` VALUES ('31', '23', 'oIg1m04msBmPFYiPTOX9q787ADpc', '借酒言心', 'http://thirdwx.qlogo.cn/mmopen/bqlXzzbrNicrOia0YiazcFhCVn9YJpey0XqlM7C1Z51SLSkwick2RsX1PdrOMfjoc2NWuZFlgU4eLmvUsVFDXl1vSuPML1tr0I3n/132', '18733772330', null, '全国', '1', '1520401795', '1522993795', '1520401795', null);
INSERT INTO `ims_release_news_users` VALUES ('32', '23', 'oIg1m03p4Cwo0jQwAzZ0H0OBgEvE', '管件销售', 'http://thirdwx.qlogo.cn/mmopen/92PyIX2jM7WpmV55A40C8gdpUcNwXAlBgrCtsoib7nfo8s5HJkWwB5RcOmSvsNe0N1pJvyAvN1YezMPy32h1WC2bOO65cSCAib/132', '15303274909', null, '全国', '1', '1520407604', '1522999604', '1520407604', null);
INSERT INTO `ims_release_news_users` VALUES ('33', '23', 'oIg1m03XaibGQTC7wEy7OLOPOm6Q', '管件销售', '', '15133701464', null, '全国', '1', '1520411928', '1523003928', '1520411928', null);
INSERT INTO `ims_release_news_users` VALUES ('34', '23', 'oIg1m0112Eq9dnW7FQhGfEqXfdeg', '长虹垫片', '', '13754533302', null, '全国', '1', '1520558248', '1523150248', '1520725115', null);
INSERT INTO `ims_release_news_users` VALUES ('35', '23', 'oIg1m0216muuBc4G40236SeQeI38', '快乐', '', '13333279944', null, '全国', '2', '1520566815', '1523158815', '1520566815', null);
INSERT INTO `ims_release_news_users` VALUES ('36', '23', 'oIg1m03CteZatOtqzYVy0FamWwmc', '长虹密封垫片', '', '15832772120', null, '全国', '1', '1520689270', '1523281270', '1520689270', null);
INSERT INTO `ims_release_news_users` VALUES ('37', '23', 'oIg1m0-WNM4i-WpPQV4LxtlaLlzQ', '袁文中，', 'http://thirdwx.qlogo.cn/mmopen/92PyIX2jM7WpmV55A40C8qwfbuxNUAYIdbU5CEczzicBZ4NdKFH1GobhXYql5SjuWefGdmeKaibsHTvaxOMywExCOGUUTmvCicc/132', '18633708050', null, '全国', '1', '1520750290', '1523342290', '1520750290', null);
INSERT INTO `ims_release_news_users` VALUES ('38', '23', 'oIg1m0wJ6g7Zh_JzbINzAkoKchWs', '厚德载物', '', '13653276009', null, '全国', '1', '1520750455', '1523342455', '1520750455', null);
INSERT INTO `ims_release_news_users` VALUES ('39', '23', 'oIg1m03-XkmK0EmFpjqcOOiX80v8', '禅心如雪', 'http://thirdwx.qlogo.cn/mmopen/ajNVdqHZLLDFGfhH04RWiaXBj2Mibb0pMAYBNeriaTibKgKlQfNumsPdsTYRse0WANK3JhpSGyuCB8qYD5pxTdhOlQ/132', '18632732958', null, '全国', '2', '1520750892', '1523342892', '1520750892', null);
INSERT INTO `ims_release_news_users` VALUES ('40', '23', 'oIg1m0yq12JryrEgZGAGu3MnLTsc', '没你不行', 'http://thirdwx.qlogo.cn/mmopen/92PyIX2jM7WpmV55A40C8o7LHunZgxtj1RNPYK16snXwib1ZzTZ0HCoSHEJgTNmTic8HLLYjyZMUabxVG4xX4GRoNR9A1mXVian/132', '13642076128', null, '全国', '1', '1520751706', '1523343706', '1520751706', null);
INSERT INTO `ims_release_news_users` VALUES ('41', '23', 'oIg1m0woL3ht_D1leSXLMqc87op4', '鹏程万里', 'http://thirdwx.qlogo.cn/mmopen/PiajxSqBRaEIlG7yfAAxypPAN9c13OqaYX9d3hZrbtPFianI6XAaxGTZrsUicWxiaGbgQtw7vkzOia4CKs1ic22cS8UQ/132', '13131782988', null, '全国', '2', '1520752055', '1523344055', '1520752055', null);
INSERT INTO `ims_release_news_users` VALUES ('42', '23', 'oIg1m0y8ht6uLZAp0BoOWh3BDj9M', '沁园春', 'http://thirdwx.qlogo.cn/mmopen/fo2iaqYic1686iaqbjlZibZcnWeFLUSVoeGURzyjRSovuedabguHY7g9Hg3dT7Aol7e6ELwK3AqbgnAV2BrINVZZxp6plgtZTpzq/132', '13932331430', null, '全国', '1', '1520755754', '1523347754', '1520755754', null);
INSERT INTO `ims_release_news_users` VALUES ('43', '23', 'oIg1m02_eGxptC4-C5sdqIREYpok', '天之骄子', 'http://thirdwx.qlogo.cn/mmopen/3a3QxMHZ8YxgnKepnJSZl9ZNK3fo7Hgp5EPaxYJnI2yLsrLDMbzvic25U2YvVobDdXpZJJHX9MHHWC3jkKZ3LJRqiazePRG3pO/132', '13333170020', null, '全国', '1', '1520761984', '1523353984', '1520761984', null);
INSERT INTO `ims_release_news_users` VALUES ('44', '23', 'oIg1m04vUjAXylbIWPj86wy3-VtA', 'A万物', 'http://thirdwx.qlogo.cn/mmopen/bqlXzzbrNicp2doAsdeCj8SlBBkO0ZegibYLosW4wNFKibBlRjHKEGyDrVUk307jcDN6hcqVib8C5xpU5EbtIoNicY0IkEMLoIrZH/132', '13315747007', null, '全国', '1', '1520768653', '1523360653', '1520768653', null);
INSERT INTO `ims_release_news_users` VALUES ('45', '23', 'oIg1m01ARzW9oe2fJx3KU-kwSvbo', '海明', 'http://thirdwx.qlogo.cn/mmopen/EcK3IEWer4M6EOXRaATzCXDAYjM015OyzxHxGriaWAexy6e776EtZYORf3XXvG6kX5gOZyd86yh7WNkgjXvHe8pQ85ETwYuf3/132', '15030732304', null, '全国', '1', '1520770611', '1523362611', '1520770611', null);
INSERT INTO `ims_release_news_users` VALUES ('46', '23', 'oIg1m05RcQdT-xoRT3rQaBfYRgVk', '工作号15383373171', 'http://thirdwx.qlogo.cn/mmopen/bqlXzzbrNicqwNTnibibJY1XZHA7Sk3OdKBv5aMbnAFvAvwNgeXtcL8BH0ppQtqwoqeNSeTSbh1icsn3sIZUSV4uDNCoSHibqvodQ/132', '15383373171', null, '全国', '1', '1520776708', '1523368708', '1520776708', null);
INSERT INTO `ims_release_news_users` VALUES ('47', '23', 'oIg1m09O3eaydUBDZllpAjv6cH24', '王永强', 'http://thirdwx.qlogo.cn/mmopen/3a3QxMHZ8YxgnKepnJSZlibxSxoEYN0a2BjumuZGD1sZlDQiaDNCdVXDyFOicibicA5xw1erc07OXJUznLsNh60NG3VMyIEF6tV03/132', '17736993834', null, '全国', '1', '1520813370', '1523405370', '1520813370', null);
INSERT INTO `ims_release_news_users` VALUES ('48', '23', 'oIg1m09OQZqqrdptxJunS5-sd3sE', 'A回收各种钢管。老周13720728912', '', '13720728912', null, '全国', '2', '1520816227', '1523408227', '1520816227', null);
INSERT INTO `ims_release_news_users` VALUES ('49', '23', 'oIg1m0yFgsuLoZ-wXJ40P1gD55w8', '河北伟东管道', 'http://thirdwx.qlogo.cn/mmopen/bqlXzzbrNicrv5IzzsaTqPZl7hfnEicJVIJ6ia3k9cmnrya2V7fXbyd5fycTNfj9qk7QyvBzOIyL6ER6ia6icRdbwOn6x0L5icfz5f/132', '17370275157', null, '全国', '1', '1520817631', '1523409631', '1523003465', null);
INSERT INTO `ims_release_news_users` VALUES ('50', '23', 'oIg1m03qzcJ_QgLaKcDoK-Qdq3z0', '北京北高阀门', 'http://thirdwx.qlogo.cn/mmopen/92PyIX2jM7WpmV55A40C8rsHRMrKXheNn4M3yFg1H8S85ia6kCmiae6uZm4g8X9NkwJFjbDQO4sM023nmauTz81jrvoAYPvoMJ/132', '18830713888', null, '全国', '1', '1520818397', '1523410397', '1520818397', null);
INSERT INTO `ims_release_news_users` VALUES ('51', '23', 'oIg1m00d5np8k3tW9BaUoF5KIctc', 'A盐山万达海陆空大型物流', '', '18333763666', null, '全国', '3', '1520819056', '1523411056', '1520819056', null);
INSERT INTO `ims_release_news_users` VALUES ('52', '23', 'oIg1m02SEb_0NUX_men1E2We3YaA', '盐山圣雄密封', 'http://thirdwx.qlogo.cn/mmopen/92PyIX2jM7XZC7GqXklEHsPI1MDaeZuspAnMc2ue7lpqC4kSbMVyBNgVEZ5ah05Aou13kg9Ggkdj5IpcQLGWZ1sAgtWR6f0x/132', '17332740163', null, '全国', '1', '1520819370', '1523411370', '1520819370', null);
INSERT INTO `ims_release_news_users` VALUES ('53', '23', 'oIg1m029fiK056HnNWNiU3tpoCW8', '伟东管道', '', '17772696999', null, '全国', '1', '1520820893', '1523412893', '1520820893', null);
INSERT INTO `ims_release_news_users` VALUES ('54', '23', 'oIg1m03grTXwYWzYd3KskdmSsaN8', 'AAA河北伟东张林', '', '17370275167', null, '全国', '1', '1520820902', '1523412902', '1520820902', null);
INSERT INTO `ims_release_news_users` VALUES ('55', '23', 'oIg1m0_kBniGBBe89CHsw0eSzsE0', '河北伟东管道设备有限', 'http://thirdwx.qlogo.cn/mmopen/bqlXzzbrNicp2doAsdeCj8atZfic7CzaUMiaW3sPWuwxQTRIV0XZNu6vAQ9ZcZwEbP01WgzBEKOc5091s4lsyeP98j54Xd0tG94/132', '13488878808', null, '全国', '1', '1520820939', '1523412939', '1520820939', null);
INSERT INTO `ims_release_news_users` VALUES ('56', '23', 'oIg1m09NxLbc3AzR1-W2pyb_9zNo', '星愿', 'http://thirdwx.qlogo.cn/mmopen/bqlXzzbrNico8xJe6YpSv7TLwcFxTy6yg0s5ccYZ4fdbMTnjicCllDzsfRZpskbVwQs7JaXibIYEZXdXRvuZWXcaTBpmibCF1Mr8/132', '13303076111', null, '全国', '1', '1520821480', '1523413480', '1520821480', '75,');
INSERT INTO `ims_release_news_users` VALUES ('57', '23', 'oIg1m063t3eztOsWitBJgtMZbTrc', '黄', 'http://thirdwx.qlogo.cn/mmopen/3a3QxMHZ8YxgnKepnJSZlybKwCDTPvIvHZrEbk8FMojyj20JnGIaoDSbdQzwWAnI5ozKOyoRBRqbt8v6Fv4bq2MziaaoKEPUG/132', '13313174330', null, '全国', '1', '1520823100', '1523415100', '1520823100', null);
INSERT INTO `ims_release_news_users` VALUES ('58', '23', 'oIg1m0-3sjAbG2c96zuQ9uBek91A', '管件大全', 'http://thirdwx.qlogo.cn/mmopen/3a3QxMHZ8YxgnKepnJSZlibcZaRqPRf9Wq6KnZb78qV12gva5Rh3kOhQ6zDEVBictVUXia447dPT4F622ANdlwq8Z8odxqvUlqia/132', '13784738956', null, '全国', '2', '1520823481', '1523415481', '1520823530', null);
INSERT INTO `ims_release_news_users` VALUES ('59', '23', 'oIg1m01WbQTF_4JkudGKQxQdQ7Uo', '张秀胜明宇不锈钢13931755980', '', '13931755980', null, '全国', '1', '1520824263', '1523416263', '1520824263', null);
INSERT INTO `ims_release_news_users` VALUES ('60', '23', 'oIg1m081mZuX92IXoSey6XbOqsPQ', '恒海法兰管件', 'http://thirdwx.qlogo.cn/mmopen/3a3QxMHZ8YxgnKepnJSZlyadXickA7SO5rTqo1OJj8TUJqgjrPiafOjFL1tQHUwmFq2ON5n9FsB0pkmGeUAwmibuic2jlz6Sv5TC/132', '13832700478', null, '全国', '1', '1520825651', '1523417651', '1520825651', null);
INSERT INTO `ims_release_news_users` VALUES ('61', '23', 'oIg1m0-hke-X0g1uBa3JP8rLm2O8', '沧州同邦管道装备有限', 'http://thirdwx.qlogo.cn/mmopen/ibtqMdCzXl3QQqia6YycYdOHQS69t7LvkXNOVFSCzQCjrmGUjTqCbzrHSSJFic69GnxFNFib4Q7jb7kjUotIP2VGnVqE15nXKD8O/132', '18931722201', null, '全国', '1', '1520834328', '1523426328', '1520834328', null);
INSERT INTO `ims_release_news_users` VALUES ('62', '23', 'oIg1m06zXVc3b0d9XxiY71g7XsJs', '༊྄ཻ见贤思齐', 'http://thirdwx.qlogo.cn/mmopen/bqlXzzbrNicp2doAsdeCj8VOictV0CQn0Tf2L5YxqwIW4cdj2XGmw3mJmQhR5BxeVpcMFh3icgMbv6iaj45PjCsYexYuYxEPCzVZ/132', '15130261055', null, '全国', '2', '1520839298', '1523431298', '1520839298', null);
INSERT INTO `ims_release_news_users` VALUES ('63', '23', 'oIg1m09eJ3Tvds7OtLfqeBt3UZ1M', '李静', 'http://thirdwx.qlogo.cn/mmopen/bqlXzzbrNicp2doAsdeCj8SmzTbzGDEA5PY20w8WquxcL2PT4FibU5DazWF1s1oM5eeyAwUBaQUCsNxoJjcILR2YbzOSC6bo88/132', '17734152221', null, '沧州', '1', '1520849314', '1523441314', '1520937072', null);
INSERT INTO `ims_release_news_users` VALUES ('64', '23', 'oIg1m0wQThGe0xUvgdZCR67OZgiU', '雨花石', 'http://thirdwx.qlogo.cn/mmopen/bqlXzzbrNicrqZbSOhTdfemNUiaBthO7WibU8IxvMPW0lv4h8rISjmTzDrnMIuSq8ibMG7nfHXsWTiaKgh0X3wnc3xaFYjNhwdkmY/132', '15030888544', null, '全国', '1', '1520855810', '1523447810', '1520855810', null);
INSERT INTO `ims_release_news_users` VALUES ('65', '23', 'oIg1m09S9sGVxEeoCewzrDKnUlr4', '心安是归处', '', '13582477905', null, '全国', '1', '1520866001', '1523458001', '1520866785', null);
INSERT INTO `ims_release_news_users` VALUES ('66', '23', 'oIg1m02GtITwoIri8gTq9kTcVl9A', 'A鑫蕊标准件王喜庆18713767880', '', '15532882727', null, '全国', '1', '1520901490', '1523493490', '1520901490', null);
INSERT INTO `ims_release_news_users` VALUES ('67', '23', 'oIg1m0x6AY6_xxICiRbRonjCgvHE', 'A元隆紧固件13373401802.阳', 'http://thirdwx.qlogo.cn/mmopen/3a3QxMHZ8YwSUEeszvkVT46FYkBymudKcJqDwH4sVWw7D7lQibAQERrWxljcWz8r6vaHCm4xd7vJGeRrNyYA8nQPeu5AJRy2s/132', '13373401802', null, '全国', '1', '1520903915', '1523495915', '1520911239', null);
INSERT INTO `ims_release_news_users` VALUES ('68', '23', 'oIg1m0_XkggXOdphbS38nB9wGX9E', '振峰', 'http://thirdwx.qlogo.cn/mmopen/bqlXzzbrNicrOia0YiazcFhCcB9M6MicCIkyR7Fzx2qtYFHHNK6Q1p4Rk4pKoypBFI55tlzeS9YuRorUFKywK9Box7sFOaBHEY99/132', '13785795716', null, '全国', '1', '1520913085', '1523505085', '1520913085', null);
INSERT INTO `ims_release_news_users` VALUES ('69', '23', 'oIg1m05YL7r45bQ3EKE5LZfaK0N8', '张鹏', 'http://thirdwx.qlogo.cn/mmopen/3a3QxMHZ8YxgnKepnJSZl8HgicyrfnTsvl4jk58w04f2Z7mafjHIBrhY6Bx6kIm1hYDjALibrHahzPEpvpdu3hibCJj6zjS0gx2/132', '18931748307', null, '沧州', '1', '1521252056', '1523844056', '1521252056', null);
INSERT INTO `ims_release_news_users` VALUES ('70', '23', 'oIg1m02-sIARiAZzjH4BSHP6pjZY', '鑫恒纯锻法兰17761595680', '', '17761595680', null, '全国', '1', '1521892939', '1524484939', '1521892948', null);
INSERT INTO `ims_release_news_users` VALUES ('71', '23', 'oIg1m02djZsvakjN7b33VFe3vN68', '李忠亮', 'http://thirdwx.qlogo.cn/mmopen/liciaDs8OtmS53hxndL5DiaibDU2FTzVv7cvibGeiac8OHcBNibxSwP15ZCKCvcYU29BAenhCXmIbgn6zYFKaRy4DH3VDHDs0HAOCHt/132', '18713624388', '全国', '全国', '1', '1522029838', '1524621838', '1522029838', null);
INSERT INTO `ims_release_news_users` VALUES ('72', '23', 'oIg1m0-4DWPP5l6JLZw-Gb__vzTc', '沧州申越管道有限公司', '', '13931713712', null, '全国', '1', '1522030279', '1524622279', '1522030398', null);
INSERT INTO `ims_release_news_users` VALUES ('73', '23', 'oIg1m00WBfwhuSs3691UDEPwGK7g', 'AaO防腐耐磨管道管件生产厂家', '', '15230779316', null, '全国', '1', '1522031707', '1524623707', '1522031861', null);
INSERT INTO `ims_release_news_users` VALUES ('74', '23', 'oIg1m05rUldqyL9_xKkNKJExvX-I', 'o卟荏ご輸', 'http://thirdwx.qlogo.cn/mmopen/92PyIX2jM7VTic4qrgvROdcsiawGicy2xEKOGQ7ZQt3JCuEz9wx9mGfldDScWDdcDOzGu8DxQsCFdRXs9KU6Y9gSWW90rLtIQuZ/132', '18832716191', null, '全国', '2', '1522032022', '1524624022', '1522032022', null);
INSERT INTO `ims_release_news_users` VALUES ('75', '23', 'oIg1m0-l-GeOpkqkXuFM296tfbt0', '河北沧瀚管道装备有限', 'http://thirdwx.qlogo.cn/mmopen/Q3auHgzwzM5IG7KcNsrch5mVTnfPI6hiaNXhx8rw7vzZoH12dBLJWokJYesJ8DFJzYsPtR9lAibQByQn1kUxpDdg/132', '18713756569', null, '全国', '1', '1522034112', '1524626112', '1522034112', null);
INSERT INTO `ims_release_news_users` VALUES ('76', '23', 'oIg1m0x2Dd1F6syeTZ9O_bCLlBhw', '胥宝发', 'http://thirdwx.qlogo.cn/mmopen/92PyIX2jM7WpmV55A40C8nibWN1Wqz8R0UbnSsjYTk2xOVjibuTFNgf14W0ZRNBVjhvyfQW2huscnYumWMM33TE60XUybLaDXf/132', '15333177756', null, '全国', '2', '1522046197', '1524638197', '1522046197', null);
INSERT INTO `ims_release_news_users` VALUES ('77', '23', 'oIg1m071Rb-h04FPu2i1J4A7Zh7U', 'A体育器材冯新义', '', '18803273698', null, '全国', '1', '1522046300', '1524638300', '1522046300', null);
INSERT INTO `ims_release_news_users` VALUES ('78', '23', 'oIg1m0zRBijRwTHSYNXF3h67fn70', 'A00000百源管道-法兰部6288730', '', '13303065139', null, '全国', '1', '1522046364', '1524638364', '1522046364', null);
INSERT INTO `ims_release_news_users` VALUES ('79', '23', 'oIg1m07b1Knrz_RL6BsEwgxpgZXM', '奋斗', 'http://thirdwx.qlogo.cn/mmopen/fo2iaqYic1685G98r9EUAZ29rNlhUEoNAnKFibxZskawMicg8ic36I9ClTWCRfBpxAQ9GfOjsy2lqOq091FPBUDMDNMBu3cSc4QiaS/132', '18730768293', null, '全国', '1', '1522047180', '1524639180', '1522047180', null);
INSERT INTO `ims_release_news_users` VALUES ('80', '23', 'oIg1m0_aJOXcEHhpoWEzCs9bq6Ew', 'A000对焊弯头韩15532755510', '', '15532755510', null, '全国', '1', '1522732575', '1525324575', '1522732575', null);
INSERT INTO `ims_release_news_users` VALUES ('81', '23', 'oIg1m0xRd46yWO0PxlicwsVE75tQ', '天道酬勤', '', '13643283908', null, '全国', '1', '1522757170', '1525349170', '1522757170', null);
INSERT INTO `ims_release_news_users` VALUES ('82', '23', 'oIg1m03_X4PFdUIYR97R6qeS7wEo', '浩淼', 'http://thirdwx.qlogo.cn/mmopen/fo2iaqYic1686iaqbjlZibZcndyHtKzAp39U8oSciassQIX2nqykl2SicdtibZ92FyrL31QEeiamXgiabndaXVNSEdRpQTWxEtgXLfqd7/132', '13032533988', null, '全国', '1', '1523494321', '1526086321', '1523494321', null);

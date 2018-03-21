/*
SQLyog  v12.2.6 (64 bit)
MySQL - 10.1.9-MariaDB : Database - chromeplugin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`chromeplugin` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `chromeplugin`;

/*Table structure for table `heatmap` */

DROP TABLE IF EXISTS `heatmap`;

CREATE TABLE `heatmap` (
  `url` varchar(255) NOT NULL COMMENT '点击网址',
  `width` int(4) NOT NULL COMMENT '页面宽度',
  `height` int(5) NOT NULL COMMENT '页面高度',
  `uid` char(36) NOT NULL COMMENT '用户编号',
  `clickData` mediumtext NOT NULL COMMENT '点击数据',
  `scrollData` mediumtext NOT NULL COMMENT '滚动条数据',
  `title` varchar(100) NOT NULL COMMENT '页面标题',
  `pid` char(7) NOT NULL COMMENT '页面编号',
  `foucsRecord` int(5) NOT NULL COMMENT '关键元素查看时间',
  `isSearch` int(1) NOT NULL COMMENT '是否为搜索页面',
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '数据库编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

/*Data for the table `heatmap` */

insert  into `heatmap`(`url`,`width`,`height`,`uid`,`clickData`,`scrollData`,`title`,`pid`,`foucsRecord`,`isSearch`,`id`) values 
('https://s.taobao.com/search?ie=utf8&initiative_id=staobaoz_20170523&stats_click=search_radio_all:1&js=1&imgfile=&q=阿凡达遥控飞机 直升机 超大&suggest=0_3&_input_charset=utf-8&wq=阿凡达遥控飞机&suggest_query=阿凡达遥控飞机&source=suggest',2042,5570,'cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','[[1757,448],[473,401],[561,403],[635,401],[388,436],[594,433],[775,325],[775,325],[775,325],[774,333],[780,330],[887,325],[454,697]]','[[548],[548],[548],[548],[548],[548],[548],[548],[548],[548],[548],[548],[548],[548],[548]]','阿凡达遥控飞机 直升机 超大_淘宝搜索','057b4d2',63,1,160),
('https://detail.tmall.com/item.htm?spm=a230r.1.14.4.rOfVg1&id=545931616703&ns=1&abbucket=13',1838,12789,'30a35971-5ca6-1b86-1de9-2e9e08acc361','[]','[[481],[481],[481],[481]]','康师傅DIY面-原汁牛肉面1盒*4包-tmall.com天猫','4b186f9',32,0,149),
('https://s.taobao.com/search?q=统一',2042,6099,'as4363456-3ga6-1b86-1de9-2e1118aaad7','[[473,388],[766,823]]','[[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[534],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004],[1004]]','统一_淘宝搜索','6419feb',143,1,150),
('https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.2.Ejz3CL&id=527068842670&skuId=3206696034774&areaId=440100&standard=1&user_id=428722076&cat_id=50024406&is_b=1&rn=ec5f981b90e842e3522dd4994dd93c60',1838,8796,'as4363456-3ga6-1b86-1de9-2e1118aaad7','[]','[[614]]','罗技M170无线鼠标男生女生光电办公游戏笔记本电脑鼠标包邮-tmall.com天猫','d5086a2',1,0,153),
('https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.2.dBupJe&id=527068842670&skuId=3206696034774&areaId=440100&standard=1&user_id=428722076&cat_id=50024406&is_b=1&rn=d1117e05f9d96b6fa56a0b7b37754c3f',1838,15672,'as4363456-3ga6-1b86-1de9-2e1118aaad7','[[968,620],[915,690],[915,690],[817,802],[947,769],[1075,942]]','[[481]]','罗技M170无线鼠标男生女生光电办公游戏笔记本电脑鼠标包邮-tmall.com天猫','a9940c1',11,0,154),
('https://list.tmall.com/search_product.htm?q=光电鼠标',1838,6091,'as4363456-3ga6-1b86-1de9-2e1118aaad7','[[423,659]]','[[481]]','光电鼠标-电脑硬件-天猫Tmall.com-上天猫，就够了','4b0c641',0,1,155),
('https://detail.tmall.com/item.htm?spm=a230r.1.14.5.ymThT3&id=534540222334&cm_id=140105335569ed55e27b&abbucket=13&skuId=3190305540207',1287,17295,'as4363456-3ga6-1b86-1de9-2e1118aaad7','[[642,648],[642,648],[650,706],[802,389],[394,934],[289,947]]','[[325]]','8寸显示器vga bnc av三合一输入监控液晶屏幕高清电脑小显示屏-tmall.com天猫','664029b',14,0,156),
('https://s.taobao.com/search?q=小屏幕',1430,5686,'as4363456-3ga6-1b86-1de9-2e1118aaad7','[[834,5651],[247,312],[725,327],[226,724]]','[[361],[361],[508],[508]]','小屏幕_淘宝搜索','66743d6',30,1,157),
('https://item.taobao.com/item.htm?spm=a230r.1.14.4.p6g55Q&id=547375845148&ns=1&abbucket=13#detail',1838,18039,'cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','[[865,733],[1344,1040],[713,919],[623,915],[1408,1144],[1400,1602],[1403,1874],[1403,2007],[1547,7887],[1451,7731]]','[[759],[1292],[3652],[3652],[7919],[7919],[7919],[7919],[7919],[7919],[7919],[7919],[7919],[7919],[7919],[7919]]','2017儿童电动玩具阿凡达遥控飞机合金充电直升机中国大陆电玩具-淘宝网','ae6e323',65,0,158),
('https://item.taobao.com/item.htm?spm=a230r.1.14.5.Zexh7N&id=41750989027&ns=1&abbucket=13#detail',1838,18039,'cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','[[883,642],[1144,559],[1474,2651],[1473,6251],[714,860],[813,929]]','[[759],[6759]]','超大双轴双翼正品阿凡达电动遥控直升飞机战斗机仿真耐摔飞行玩具-淘宝网','1f65994',39,0,159),
('https://list.tmall.com/search_product.htm?q=光电鼠标',1838,6091,'as4363456-3ga6-1b86-1de9-2e1118aaad7','[[390,367]]','[]','光电鼠标-电脑硬件-天猫Tmall.com-上天猫，就够了','dac54d6',0,1,151),
('https://item.taobao.com/item.htm?spm=2013.1.w4023-16451162035.10.g3hN8R&id=551096418036',1838,7522,'30a35971-5ca6-1b86-1de9-2e9e08acc361','[[732,1056]]','[[881]]','热卖oppo R7手机壳A33t保护套find7水钻R7007外壳A57M挂绳防摔女-淘宝网','46429df',1,0,146),
('https://s.taobao.com/search?q=康师傅',2042,5814,'30a35971-5ca6-1b86-1de9-2e9e08acc361','[[490,533],[484,662],[703,665],[501,936]]','[[534]]','康师傅_淘宝搜索','c9bb073',17,1,147),
('https://detail.tmall.com/item.htm?spm=a230r.1.14.4.rOfVg1&id=545931616703&ns=1&abbucket=13',1838,16880,'30a35971-5ca6-1b86-1de9-2e9e08acc361','[[917,568],[917,568],[661,925],[589,942],[521,12542],[1007,12556],[977,13207],[917,483],[1040,601],[1241,506],[981,645],[1073,548]]','[[481],[2213],[481],[481]]','康师傅DIY面-原汁牛肉面1盒*4包-tmall.com天猫','3a1b99a',53,0,148),
('https://list.tmall.com/search_product.htm?spm=a220m.1000858.1000724.2.jz9IUe&cat=50024406&q=????????&sort=rq&style=g&smAreaId=440100#J_Filter',1838,6101,'as4363456-3ga6-1b86-1de9-2e1118aaad7','[[400,674]]','[[834]]','光电鼠标-电脑硬件-天猫Tmall.com-上天猫，就够了','ec35371',0,1,152),
('https://item.taobao.com/item.htm?spm=2013.1.w4023-16451162035.4.n1JxuG&id=550703569360',1838,19122,'30a35971-5ca6-1b86-1de9-2e9e08acc361','[[848,824],[735,1006],[655,1169],[995,1171],[593,1015],[592,1854],[882,1875],[994,1864],[1148,1897],[1273,3111],[1827,18662],[1066,829]]','[[481],[1281],[10880],[10880]]','热卖ulzzang潮流手表男女学生韩版简约复古休闲大气情侣手表一对-淘宝网','88d2ccf',51,0,144),
('https://s.taobao.com/search?q=测试物品',2042,5572,'30a35971-5ca6-1b86-1de9-2e9e08acc361','[[746,311],[884,314],[480,324],[366,362],[1018,320],[522,494]]','[[534],[3498],[534],[534],[534],[534],[534],[534]]','测试物品_淘宝搜索','873788f',63,1,143),
('https://item.taobao.com/item.htm?spm=a230r.1.14.1.lpKWTg&id=551371169571&ns=1&abbucket=13#detail',1838,7325,'30a35971-5ca6-1b86-1de9-2e9e08acc361','[[732,971],[874,523],[748,573],[494,1902]]','[[526],[787]]','热卖古董收藏 美国产微波探测器带耳机 测试仪 老物件 老物品-淘宝网','e8577f6',29,0,142);

/*Table structure for table `operation_record` */

DROP TABLE IF EXISTS `operation_record`;

CREATE TABLE `operation_record` (
  `uid` char(36) NOT NULL COMMENT '用户标识符',
  `time` datetime NOT NULL COMMENT '操作时间',
  `type` tinyint(2) NOT NULL COMMENT '操作类型',
  `value` varchar(256) NOT NULL COMMENT '操作数据(变长)',
  `pid` char(7) NOT NULL COMMENT '用户页面标识符',
  `other` varchar(100) DEFAULT NULL COMMENT '扩展存储项'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `operation_record` */

insert  into `operation_record`(`uid`,`time`,`type`,`value`,`pid`,`other`) values 
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:45:00',2,'https://item.taobao.com/item.htm?spm=a230r.1.14.5.Zexh7N&id=41750989027&ns=1&abbucket=13#detail','7131cc3','超大双轴双翼正品阿凡达电动遥控直升飞机战斗机仿真耐摔飞行玩具-淘宝网'),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:36',5,'超大双轴双翼正品阿凡达电动遥控直升飞机战斗机仿真耐摔飞行玩具','057b4d2',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:44',7,'{\"value\":\"厂家标配\",\"title\":\"套餐类型\"}','1f65994',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:45',5,'立即购买','1f65994',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:34:24',5,'累计评论                0','1f65994',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:42',7,'{\"value\":\"厂家标配\",\"title\":\"套餐类型\"}','1f65994',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:40',6,'2','1f65994',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:37',2,'https://item.taobao.com/item.htm?spm=a230r.1.14.5.Zexh7N&id=41750989027&ns=1&abbucket=13#detail','1f65994','超大双轴双翼正品阿凡达电动遥控直升飞机战斗机仿真耐摔飞行玩具-淘宝网'),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:19',4,'{\"support_cod\":[\"\",\"1\"],\"pid\":\"057b4d2\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:33',4,'{\"filter\":[\"\",\"reserve_price[100,]\"],\"pid\":\"057b4d2\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:13',5,'销量','057b4d2',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:14',4,'{\"sort\":[\"renqi-desc\",\"sale-desc\"],\"pid\":\"057b4d2\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:15',5,'信用','057b4d2',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:15',4,'{\"sort\":[\"sale-desc\",\"credit-desc\"],\"pid\":\"057b4d2\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:17',5,'包邮','057b4d2',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:17',4,'{\"fs\":[\"\",\"1\"],\"baoyou\":[\"\",\"1\"],\"pid\":\"057b4d2\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:02',4,'{\"\":[\"undefined\",null],\"q\":[\"阿凡达遥控飞机 直升机 超大\",\"阿凡达遥控飞机+直升机+超大\"],\"wq\":[\"阿凡达遥控飞机 \",\"阿凡达遥控飞机\"],\"suggest_query\":[\"阿凡达遥控飞机 \",\"阿凡达遥控飞机\"],\"pid\":\"057b4d2\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:19',5,'货到付款','057b4d2',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:11',5,'人气','057b4d2',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:12',4,'{\"sort\":[\"\",\"renqi-desc\"],\"pid\":\"057b4d2\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:04',3,'阿凡达遥控飞机 直升机 超大','057b4d2',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:33:02',2,'https://s.taobao.com/search?&ie=utf8&initiative_id=staobaoz_20170523&stats_click=search_radio_all%3A1&js=1&imgfile=&q=%E9%98%BF%E5%87%A1%E8%BE%BE%E9%81%A5%E6%8E%A7%E9%A3%9E%E6%9C%BA%20%E7%9B%B4%E5%8D%87%E6%9C%BA%20%E8%B6%85%E5%A4%A7&suggest=0_3&_input_char','057b4d2','阿凡达遥控飞机 直升机 超大_淘宝搜索'),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:31:12',5,'立即购买','ae6e323',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:31:20',5,'累计评论                0','ae6e323',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:31:22',5,'宝贝详情','ae6e323',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:31:10',6,'2','ae6e323',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:31:10',6,'3','ae6e323',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:31:07',7,'{\"value\":\"电池2【送1块电池共3块电池】\",\"title\":\"套餐类型\"}','ae6e323',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:31:05',7,'{\"value\":\"黑色\",\"title\":\"颜色分类\"}','ae6e323',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:31:03',7,'{\"value\":\"黑色高清50万像素航拍版\",\"title\":\"颜色分类\"}','ae6e323',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:30:56',2,'https://item.taobao.com/item.htm?spm=a230r.1.14.4.p6g55Q&id=547375845148&ns=1&abbucket=13#detail','ae6e323','2017儿童电动玩具阿凡达遥控飞机合金充电直升机中国大陆电玩具-淘宝网'),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:30:55',5,'2017儿童电动玩具阿凡达遥控飞机合金充电直升机中国大陆电玩具','d729eff',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:30:45',4,'{\"fs\":[\"\",\"1\"],\"baoyou\":[\"\",\"1\"],\"pid\":\"d729eff\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:30:50',4,'{\"filter\":[\"\",\"reserve_price[100,]\"],\"pid\":\"d729eff\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:30:44',5,'包邮','d729eff',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:30:42',5,'销量','d729eff',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:30:42',4,'{\"sort\":[\"renqi-desc\",\"sale-desc\"],\"pid\":\"d729eff\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:30:40',4,'{\"sort\":[\"\",\"renqi-desc\"],\"pid\":\"d729eff\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:30:39',5,'人气','d729eff',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:30:35',3,'阿凡达遥控飞机 合金','d729eff',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:30:34',4,'{\"\":[\"undefined\",null],\"q\":[\"阿凡达遥控飞机 合金\",\"阿凡达遥控飞机+合金\"],\"pid\":\"d729eff\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:29:08',3,'阿凡达遥控飞机','3c38e10',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:29:14',2,'https://s.taobao.com/search?ie=utf8&initiative_id=staobaoz_20170523&stats_click=search_radio_all%3A1&js=1&imgfile=&q=%E9%98%BF%E5%87%A1%E8%BE%BE%E9%81%A5%E6%8E%A7%E9%A3%9E%E6%9C%BA&suggest=0_2&_input_charset=utf-8&wq=%E9%98%BF%E5%87%A1%E8%BE%BE&suggest_que','c8ba39d','阿凡达遥控飞机_淘宝搜索'),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:30:34',2,'https://s.taobao.com/search?&ie=utf8&initiative_id=staobaoz_20170523&stats_click=search_radio_all%3A1&js=1&imgfile=&q=%E9%98%BF%E5%87%A1%E8%BE%BE%E9%81%A5%E6%8E%A7%E9%A3%9E%E6%9C%BA%20%E5%90%88%E9%87%91&suggest=0_1&_input_charset=utf-8&wq=%E9%98%BF%E5%87%A','d729eff','阿凡达遥控飞机 合金_淘宝搜索'),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:29:16',3,'阿凡达遥控飞机','c8ba39d',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:29:06',2,'https://s.taobao.com/search?ie=utf8&initiative_id=staobaoz_20170523&stats_click=search_radio_all%3A1&js=1&imgfile=&q=%E9%98%BF%E5%87%A1%E8%BE%BE%E9%81%A5%E6%8E%A7%E9%A3%9E%E6%9C%BA&suggest=0_2&_input_charset=utf-8&wq=%E9%98%BF%E5%87%A1%E8%BE%BE&suggest_que','3c38e10','阿凡达遥控飞机_淘宝搜索'),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:28:47',3,'阿凡达遥控飞机','ef7235b',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:28:44',2,'https://s.taobao.com/search?ie=utf8&initiative_id=staobaoz_20170523&stats_click=search_radio_all%3A1&js=1&imgfile=&q=%E9%98%BF%E5%87%A1%E8%BE%BE%E9%81%A5%E6%8E%A7%E9%A3%9E%E6%9C%BA&suggest=0_2&_input_charset=utf-8&wq=%E9%98%BF%E5%87%A1%E8%BE%BE&suggest_que','ef7235b','阿凡达遥控飞机_淘宝搜索'),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:25:09',6,'2','a3f7bc0',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:25:10',6,'3','a3f7bc0',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:25:11',5,'立即购买','a3f7bc0',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:25:04',7,'{\"value\":\"小阿凡达718\",\"title\":\"套餐类型\"}','a3f7bc0',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:25:06',7,'{\"value\":\"大阿凡达711\",\"title\":\"套餐类型\"}','a3f7bc0',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:24:45',4,'{\"filter\":[\"\",\"reserve_price[100,]\"],\"pid\":\"965d5cb\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:24:53',2,'https://item.taobao.com/item.htm?id=45196366151&ns=1&abbucket=13#detail','1819acb','雅得阿凡达遥控飞机直升机耐摔6岁充电耐摔战斗机玩具初学者YD711-淘宝网'),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:24:53',5,'雅得阿凡达遥控飞机直升机耐摔6岁充电耐摔战斗机玩具初学者YD711','965d5cb',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:24:53',2,'https://item.taobao.com/item.htm?spm=a230r.1.14.13.wuyRvR&id=45196366151&ns=1&abbucket=13#detail','a3f7bc0','雅得阿凡达遥控飞机直升机耐摔6岁充电耐摔战斗机玩具初学者YD711-淘宝网'),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:24:33',5,'人气','965d5cb',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:24:34',4,'{\"sort\":[\"\",\"renqi-desc\"],\"pid\":\"965d5cb\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:24:35',5,'销量','965d5cb',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:24:36',4,'{\"sort\":[\"renqi-desc\",\"sale-desc\"],\"pid\":\"965d5cb\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:24:38',5,'包邮','965d5cb',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:24:39',4,'{\"fs\":[\"\",\"1\"],\"baoyou\":[\"\",\"1\"],\"pid\":\"965d5cb\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:24:22',3,'阿凡达遥控飞机','965d5cb',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:21:32',3,'阿凡达','e5e6b07',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:21:34',5,'人气','e5e6b07',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:21:35',4,'{\"sort\":[\"\",\"renqi-desc\"],\"pid\":\"e5e6b07\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:21:36',5,'销量','e5e6b07',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:21:37',4,'{\"sort\":[\"renqi-desc\",\"sale-desc\"],\"pid\":\"e5e6b07\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:21:38',5,'包邮','e5e6b07',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:21:39',4,'{\"fs\":[\"\",\"1\"],\"baoyou\":[\"\",\"1\"],\"pid\":\"e5e6b07\"}','undefin',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:24:20',2,'https://s.taobao.com/search?ie=utf8&initiative_id=staobaoz_20170523&stats_click=search_radio_all%3A1&js=1&imgfile=&q=%E9%98%BF%E5%87%A1%E8%BE%BE%E9%81%A5%E6%8E%A7%E9%A3%9E%E6%9C%BA&suggest=0_2&_input_charset=utf-8&wq=%E9%98%BF%E5%87%A1%E8%BE%BE&suggest_que','965d5cb','阿凡达遥控飞机_淘宝搜索'),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:17:10',2,'https://s.taobao.com/search?q=%E9%98%BF%E5%87%A1%E8%BE%BE%E5%A4%96%E8%AE%BE','6c5aa8e','阿凡达外设_淘宝搜索'),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:21:30',2,'https://s.taobao.com/search?q=%E9%98%BF%E5%87%A1%E8%BE%BE&imgfile=&js=1&stats_click=search_radio_all%3A1&initiative_id=staobaoz_20170523&ie=utf8','e5e6b07','阿凡达_淘宝搜索'),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:17:16',3,'阿凡达','536bea2',''),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:17:14',2,'https://s.taobao.com/search?q=%E9%98%BF%E5%87%A1%E8%BE%BE','536bea2','阿凡达_淘宝搜索'),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s','2017-05-23 12:17:12',3,'阿凡达外设','6c5aa8e',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 12:13:59',2,'https://list.tmall.com/search_product.htm?q=%B9%E2%B5%E7%CA%F3%B1%EA23&type=p&spm=a220m.1000858.a2227oh.d100&from=.list.pc_1_searchbutton','dabea4f','光电鼠标23-天猫Tmall.com-上天猫，就够了'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 12:14:48',2,'https://s.taobao.com/search?q=%E6%B5%8B%E8%AF%95%E7%89%A9%E5%93%81','c8dec7c','测试物品_淘宝搜索'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 12:14:49',2,'https://login.taobao.com/member/login.jhtml?redirectURL=http%3A%2F%2Fcart.taobao.com%2Fcart.htm%3Ffrom%3Dmini%26pm_id%3D1501036000a02c5c3739','df24a1a','淘宝网 - 淘！我喜欢'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 12:14:50',3,'测试物品','c8dec7c',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 12:14:53',2,'https://item.taobao.com/item.htm?id=12303401310&ali_refid=a3_420434_1006:1104769910:N:%E7%9B%90%E9%9B%BE%E8%AF%95%E9%AA%8C%E6%9C%BA:62d571628e9b27c03f986fa26717861f&ali_trackid=1_62d571628e9b27c03f986fa26717861f','3e293f0','厂家直销 60 90 120盐雾腐蚀试验箱|盐雾试验机|全国包邮送货上门-淘宝网'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 12:13:58',2,'https://jutusm.tmall.com/search.htm?user_number_id=1725383232&rn=693aa5a65ed0c4deab847d15e98d3f46&keyword=%B9%E2%B5%E7%CA%F3%B1%EA23','0c80645','店内搜索页-巨途数码专营店-天猫Tmall.com'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 12:13:43',2,'https://list.tmall.com/search_product.htm?q=%B9%E2%B5%E7%CA%F3%B1%EA23&type=p&spm=a220m.1000858.a2227oh.d100&from=.list.pc_1_searchbutton','1d6a537','光电鼠标23-天猫Tmall.com-上天猫，就够了'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 12:13:08',2,'https://list.tmall.com/search_product.htm?q=%B9%E2%B5%E7%CA%F3%B1%EA23&type=p&spm=a220m.1000858.a2227oh.d100&from=.list.pc_1_searchbutton','2fac18d','光电鼠标23-天猫Tmall.com-上天猫，就够了'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:13:02',5,'累计评价 18','664029b',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 12:12:13',2,'https://list.tmall.com/search_product.htm?q=%E5%85%89%E7%94%B5%E9%BC%A0%E6%A0%87','655557d','光电鼠标-电脑硬件-天猫Tmall.com-上天猫，就够了'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 12:13:04',2,'https://list.tmall.com/search_product.htm?q=%E5%85%89%E7%94%B5%E9%BC%A0%E6%A0%87','c3f39bb','光电鼠标-电脑硬件-天猫Tmall.com-上天猫，就够了'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:12:56',6,'2','664029b',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:12:57',6,'3','664029b',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:12:58',5,'立即购买确认','664029b',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:12:52',1,'63cf28b','63cf28b',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:12:52',5,'8寸显示器vga bnc av三合一输入监控液晶屏幕高清电脑小显示屏','66743d6',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:12:53',2,'https://detail.tmall.com/item.htm?spm=a230r.1.14.5.ymThT3&id=534540222334&cm_id=140105335569ed55e27b&abbucket=13&skuId=3190305540207','664029b','8寸显示器vga bnc av三合一输入监控液晶屏幕高清电脑小显示屏-tmall.com天猫'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:12:41',5,'人气','66743d6',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:12:42',4,'{\"sort\":[\"\",\"renqi-desc\"],\"pid\":\"66743d6\"}','undefin',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:12:48',4,'{\"filter\":[\"\",\"reserve_price[166.01,]\"],\"pid\":\"66743d6\"}','undefin',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:12:27',3,'小屏幕','66743d6',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:12:35',2,'https://item.taobao.com/item.htm?id=550753890291&ns=1&abbucket=13#detail','31199c0','定时器提醒器 电子正倒计时器大屏幕学生计时器儿童24小时钟厨房-淘宝网'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:12:25',2,'https://s.taobao.com/search?q=%E5%B0%8F%E5%B1%8F%E5%B9%95','66743d6','小屏幕_淘宝搜索'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:00:35',5,'立即购买确认','a9940c1',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:00:33',6,'3','a9940c1',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:00:32',6,'3','a9940c1',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:00:31',5,'M170红色','a9940c1',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:00:31',7,'{\"value\":\"M170红色\",\"title\":\"颜色分类\"}','a9940c1',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:00:31',7,'{\"value\":\"M170红色\",\"title\":\"颜色分类\"}','a9940c1',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:00:27',2,'https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.2.dBupJe&id=527068842670&skuId=3206696034774&areaId=440100&standard=1&user_id=428722076&cat_id=50024406&is_b=1&rn=d1117e05f9d96b6fa56a0b7b37754c3f','a9940c1','罗技M170无线鼠标男生女生光电办公游戏笔记本电脑鼠标包邮-tmall.com天猫'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:00:26',1,'e93c1b0','e93c1b0',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:00:26',5,'Logitech/罗技 M170','4b0c641',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:00:16',3,'光电鼠标','4b0c641',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:00:19',2,'https://detail.tmall.com/item.htm?id=527068842670&skuId=3206696034774&areaId=440100&standard=1&user_id=428722076&cat_id=50024406&is_b=1&rn=d1117e05f9d96b6fa56a0b7b37754c3f','3e00fb7','罗技M170无线鼠标男生女生光电办公游戏笔记本电脑鼠标包邮-tmall.com天猫'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:00:16',2,'https://list.tmall.com/search_product.htm?q=%E5%85%89%E7%94%B5%E9%BC%A0%E6%A0%87','4b0c641','光电鼠标-电脑硬件-天猫Tmall.com-上天猫，就够了'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 11:00:08',2,'https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.2.Ejz3CL&id=527068842670&skuId=3206696034774&areaId=440100&standard=1&user_id=428722076&cat_id=50024406&is_b=1&rn=ec5f981b90e842e3522dd4994dd93c60','d5086a2','罗技M170无线鼠标男生女生光电办公游戏笔记本电脑鼠标包邮-tmall.com天猫'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 10:59:03',2,'https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.2.Ejz3CL&id=527068842670&skuId=3206696034774&areaId=440100&standard=1&user_id=428722076&cat_id=50024406&is_b=1&rn=ec5f981b90e842e3522dd4994dd93c60','bcca44a','罗技M170无线鼠标男生女生光电办公游戏笔记本电脑鼠标包邮-tmall.com天猫'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 10:59:03',2,'https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.2.Ejz3CL&id=527068842670&skuId=3206696034774&areaId=440100&standard=1&user_id=428722076&cat_id=50024406&is_b=1&rn=ec5f981b90e842e3522dd4994dd93c60','4123d43','罗技M170无线鼠标男生女生光电办公游戏笔记本电脑鼠标包邮-tmall.com天猫'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 10:59:02',2,'https://detail.tmall.com/item.htm?id=527068842670&skuId=3206696034774&areaId=440100&standard=1&user_id=428722076&cat_id=50024406&is_b=1&rn=ec5f981b90e842e3522dd4994dd93c60','bb1fdf4','罗技M170无线鼠标男生女生光电办公游戏笔记本电脑鼠标包邮-tmall.com天猫'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 10:58:46',3,'光电鼠标','ec35371',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 10:59:01',1,'458b9ae','458b9ae',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 10:59:01',5,'Logitech/罗技 M170','ec35371',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 10:58:33',3,'光电鼠标','dac54d6',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 10:58:45',5,'人气','dac54d6',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 10:58:46',2,'https://list.tmall.com/search_product.htm?spm=a220m.1000858.1000724.2.jz9IUe&cat=50024406&q=%B9%E2%B5%E7%CA%F3%B1%EA&sort=rq&style=g&smAreaId=440100#J_Filter','ec35371','光电鼠标-电脑硬件-天猫Tmall.com-上天猫，就够了'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 10:58:32',2,'https://list.tmall.com/search_product.htm?q=%E5%85%89%E7%94%B5%E9%BC%A0%E6%A0%87','dac54d6','光电鼠标-电脑硬件-天猫Tmall.com-上天猫，就够了'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 09:45:17',2,'https://chaoshi.detail.tmall.com/item.htm?spm=a220o.7406545.0.da321h.iOXAso&id=35722264637','e2826ab','【天猫超市】统一 汤达人 罗宋汤面 128g/袋*5袋 方便面 甄选食材-天猫超市-天猫Tmall.com-上天猫，就购了-上天猫，就够了'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 09:45:15',4,'{\"ad_id\":[\"\",null],\"am_id\":[\"\",null],\"pm_id\":[\"\",\"\"],\"pid\":\"e8b5851\"}','undefin',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 09:45:13',2,'https://chaoshi.detail.tmall.com/item.htm?spm=a230r.1.14.10.ddDvqE&id=20460056220&ad_id=&am_id=&cm_id=140105335569ed55e27b&pm_id=&abbucket=13','e8b5851','【天猫超市】统一 汤达人日式豚骨拉面 125g*5袋 方便面 豚骨面-天猫超市-天猫Tmall.com-上天猫，就购了-上天猫，就够了'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 09:45:13',4,'{\"ad_id\":[\"\",null],\"am_id\":[\"\",null],\"pm_id\":[\"\",\"\"],\"pid\":\"cf90dc8\"}','undefin',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 09:45:12',2,'https://chaoshi.detail.tmall.com/item.htm?spm=a230r.1.14.10.ddDvqE&id=20460056220&ad_id=&am_id=&cm_id=140105335569ed55e27b&pm_id=&abbucket=13','cf90dc8','【天猫超市】统一 汤达人日式豚骨拉面 125g*5袋 方便面 豚骨面-天猫超市-天猫Tmall.com-上天猫，就购了-上天猫，就够了'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 09:45:11',4,'{\"ad_id\":[\"\",null],\"am_id\":[\"\",null],\"pm_id\":[\"\",\"\"],\"pid\":\"d54fc54\"}','undefin',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 09:45:10',1,'1db8f0a','1db8f0a',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 09:45:10',2,'https://chaoshi.detail.tmall.com/item.htm?id=20460056220&ad_id=&am_id=&cm_id=140105335569ed55e27b&pm_id=&abbucket=13','d54fc54','【天猫超市】统一 汤达人日式豚骨拉面 125g*5袋 方便面 豚骨面-天猫超市-天猫Tmall.com-上天猫，就购了-上天猫，就够了'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 09:45:08',4,'{\"sort\":[\"\",\"renqi-desc\"],\"pid\":\"6419feb\"}','undefin',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 09:45:10',5,'【天猫超市】统一 汤达人日式豚骨拉面 125g*5袋 方便面 豚骨面','6419feb',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 09:42:48',3,'统一','6419feb',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 09:45:07',5,'人气','6419feb',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:39:49',5,'商品详情','3a1b99a',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:40:16',5,'湖南','3a1b99a',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:40:20',5,'立即购买确认','3a1b99a',''),
('as4363456-3ga6-1b86-1de9-2e1118aaad7','2017-05-23 09:42:47',2,'https://s.taobao.com/search?q=%E7%BB%9F%E4%B8%80','6419feb','统一_淘宝搜索'),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:39:42',6,'2','3a1b99a',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:39:43',6,'3','3a1b99a',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:39:30',2,'https://detail.tmall.com/item.htm?spm=a230r.1.14.4.rOfVg1&id=545931616703&ns=1&abbucket=13','4b186f9','康师傅DIY面-原汁牛肉面1盒*4包-tmall.com天猫'),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:39:30',2,'https://detail.tmall.com/item.htm?spm=a230r.1.14.4.rOfVg1&id=545931616703&ns=1&abbucket=13','3a1b99a','康师傅DIY面-原汁牛肉面1盒*4包-tmall.com天猫'),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:39:27',5,'康师傅DIY面-原汁牛肉面1盒*4包','c9bb073',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:39:27',1,'df37d86','df37d86',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:39:23',4,'{\"sort\":[\"renqi-desc\",\"price-asc\"],\"pid\":\"c9bb073\"}','undefin',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:39:27',2,'https://detail.tmall.com/item.htm?id=545931616703&ns=1&abbucket=13','858e4d7','康师傅DIY面-原汁牛肉面1盒*4包-tmall.com天猫'),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:39:18',5,'人气','c9bb073',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:39:18',4,'{\"sort\":[\"\",\"renqi-desc\"],\"pid\":\"c9bb073\"}','undefin',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:39:22',5,'价格从低到高','c9bb073',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:39:16',5,'浙江省','c9bb073',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:39:16',4,'{\"cps\":[\"\",\"yes\"],\"ppath\":[\"\",\"122450261:52860\"],\"pid\":\"c9bb073\"}','undefin',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:39:10',2,'https://s.taobao.com/search?q=%E5%BA%B7%E5%B8%88%E5%82%85','c9bb073','康师傅_淘宝搜索'),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:39:12',3,'康师傅','c9bb073',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:34:09',6,'2','46429df',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:34:16',5,'累计评论                0','46429df',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:34:07',7,'{\"value\":\"R7魅惑宝蓝 珍珠挂绳\",\"title\":\"颜色分类\"}','46429df',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:34:08',7,'{\"value\":\"R7魅惑大红 珍珠挂绳\",\"title\":\"颜色分类\"}','46429df',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:34:03',2,'https://item.taobao.com/item.htm?spm=2013.1.w4023-16451162035.10.g3hN8R&id=551096418036','8373c55','热卖oppo R7手机壳A33t保护套find7水钻R7007外壳A57M挂绳防摔女-淘宝网'),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:34:03',2,'https://item.taobao.com/item.htm?spm=2013.1.w4023-16451162035.10.g3hN8R&id=551096418036','46429df','热卖oppo R7手机壳A33t保护套find7水钻R7007外壳A57M挂绳防摔女-淘宝网'),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:34:01',1,'1ccc0b7','1ccc0b7',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:33:48',5,'返回顶部','88d2ccf',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:33:52',5,'加入购物车','88d2ccf',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:34:01',5,'热卖oppo R7手机壳A33t保护套find7水钻R7007外壳A57M挂绳防摔女','2659101',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:33:25',5,'宝贝详情','88d2ccf',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:33:16',5,'累计评论                4','88d2ccf',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:33:09',6,'3','88d2ccf',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:33:11',5,'立即购买','88d2ccf',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:33:09',6,'2','88d2ccf',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:33:07',7,'{\"value\":\"圈圈白盘男款\",\"title\":\"颜色分类\"}','88d2ccf',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:33:06',7,'{\"value\":\"经典表盘皮带女款\",\"title\":\"颜色分类\"}','88d2ccf',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:33:04',7,'{\"value\":\"齿轮白盘男款\",\"title\":\"颜色分类\"}','88d2ccf',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:32:57',2,'https://item.taobao.com/item.htm?spm=2013.1.w4023-16451162035.4.n1JxuG&id=550703569360','88d2ccf','热卖ulzzang潮流手表男女学生韩版简约复古休闲大气情侣手表一对-淘宝网'),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:32:57',2,'https://item.taobao.com/item.htm?spm=2013.1.w4023-16451162035.4.n1JxuG&id=550703569360','2659101','热卖ulzzang潮流手表男女学生韩版简约复古休闲大气情侣手表一对-淘宝网'),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:32:55',5,'热卖ulzzang潮流手表男女学生韩版简约复古休闲大气情侣手表一对','e8577f6',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:32:55',1,'1528243','1528243',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:32:40',6,'1','e8577f6',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:32:42',5,'立即购买','e8577f6',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:32:39',6,'1','e8577f6',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:32:30',5,'累计评论                0','e8577f6',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:32:20',2,'https://item.taobao.com/item.htm?spm=a230r.1.14.1.lpKWTg&id=551371169571&ns=1&abbucket=13#detail','e8577f6','热卖古董收藏 美国产微波探测器带耳机 测试仪 老物件 老物品-淘宝网'),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:32:09',4,'{\"fs\":[\"\",\"1\"],\"baoyou\":[\"\",\"1\"],\"pid\":\"873788f\"}','undefin',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:32:09',5,'包邮','873788f',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:32:03',5,'人气','873788f',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:32:04',4,'{\"sort\":[\"\",\"renqi-desc\"],\"pid\":\"873788f\"}','undefin',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:31:59',2,'https://item.taobao.com/item.htm?id=551562334068&ns=1&abbucket=13#detail','c4c54c2','热卖古董收藏 美国产微波探测器带耳机 测试仪 老物件 老物品-淘宝网'),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:31:53',4,'{\"filter\":[\"\",\"reserve_price[100,]\"],\"pid\":\"873788f\"}','undefin',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:31:38',3,'测试物品','873788f',''),
('30a35971-5ca6-1b86-1de9-2e9e08acc361','2017-05-23 09:31:35',2,'https://s.taobao.com/search?q=%E6%B5%8B%E8%AF%95%E7%89%A9%E5%93%81','873788f','测试物品_淘宝搜索');

/*Table structure for table `url_jump` */

DROP TABLE IF EXISTS `url_jump`;

CREATE TABLE `url_jump` (
  `rid` char(7) NOT NULL COMMENT '跳转编号',
  `hosturl` varchar(255) NOT NULL COMMENT '原地址',
  `objurl` varchar(255) NOT NULL COMMENT '跳转地址'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `url_jump` */

insert  into `url_jump`(`rid`,`hosturl`,`objurl`) values 
('63cf28b','https://s.taobao.com/search?q=%E5%B0%8F%E5%B1%8F%E5%B9%95&sort=renqi-desc&filter=reserve_price%5B166.01%2C%5D','https://detail.tmall.com/item.htm?spm=a230r.1.14.5.ymThT3&id=534540222334&ad_id=&am_id=&cm_id=140105335569ed55e27b&pm_id=&abbucket=13'),
('e93c1b0','https://list.tmall.com/search_product.htm?q=%E5%85%89%E7%94%B5%E9%BC%A0%E6%A0%87','https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.2.dBupJe&id=527068842670&skuId=3206696034774&areaId=440100&standard=1&user_id=428722076&cat_id=50024406&is_b=1&rn=d1117e05f9d96b6fa56a0b7b37754c3f'),
('458b9ae','https://list.tmall.com/search_product.htm?spm=a220m.1000858.1000724.2.jz9IUe&cat=50024406&q=%B9%E2%B5%E7%CA%F3%B1%EA&sort=rq&style=g&smAreaId=440100#J_Filter','https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.2.Ejz3CL&id=527068842670&skuId=3206696034774&areaId=440100&standard=1&user_id=428722076&cat_id=50024406&is_b=1&rn=ec5f981b90e842e3522dd4994dd93c60'),
('1db8f0a','https://s.taobao.com/search?q=%E7%BB%9F%E4%B8%80&sort=renqi-desc','https://detail.tmall.com/item.htm?spm=a230r.1.14.10.ddDvqE&id=20460056220&ad_id=&am_id=&cm_id=140105335569ed55e27b&pm_id=&abbucket=13'),
('df37d86','https://s.taobao.com/search?q=%E5%BA%B7%E5%B8%88%E5%82%85&cps=yes&ppath=122450261%3A52860&sort=price-asc','https://detail.tmall.com/item.htm?spm=a230r.1.14.4.rOfVg1&id=545931616703&ns=1&abbucket=13'),
('1528243','https://item.taobao.com/item.htm?spm=a230r.1.14.1.lpKWTg&id=551371169571&ns=1&abbucket=13#detail','https://item.taobao.com/item.htm?spm=2013.1.w4023-16451162035.4.n1JxuG&id=550703569360'),
('1ccc0b7','https://item.taobao.com/item.htm?spm=2013.1.w4023-16451162035.4.n1JxuG&id=550703569360','https://item.taobao.com/item.htm?spm=2013.1.w4023-16451162035.10.g3hN8R&id=551096418036');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` char(36) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`) values 
('30a35971-5ca6-1b86-1de9-2e9e08acc361'),
('as4363456-3ga6-1b86-1de9-2e1118aaad7'),
('cc4vdg56-6ggs-1b86-1de9-2jfgh5aaa99s');

/* Trigger structure for table `operation_record` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `uidSynchronize` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `uidSynchronize` AFTER INSERT ON `operation_record` FOR EACH ROW BEGIN
	INSERT into user(uid) values(new.uid);
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

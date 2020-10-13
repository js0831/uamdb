CREATE DATABASE  IF NOT EXISTS `uam` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `uam`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: uam
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `application_attributes`
--

DROP TABLE IF EXISTS `application_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_attributes` (
  `application_id` int NOT NULL,
  `category_id` int NOT NULL,
  UNIQUE KEY `UK_app_attr` (`application_id`,`category_id`),
  CONSTRAINT `app_attr_app` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_attributes`
--

LOCK TABLES `application_attributes` WRITE;
/*!40000 ALTER TABLE `application_attributes` DISABLE KEYS */;
INSERT INTO `application_attributes` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4),(3,1),(3,2),(3,3),(3,4);
/*!40000 ALTER TABLE `application_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `shortname` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,'SVC / SB','SVC / SB','Application for SVC / SB'),(2,'BOM MOB','BOM MOB','Application for BOM MOB'),(3,'Ruby','Ruby','Application for Ruby');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes_values`
--

DROP TABLE IF EXISTS `attributes_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `attributes_value` varchar(255) NOT NULL,
  `attributes_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attr_val_attr` (`category_id`),
  CONSTRAINT `attr_val_cat_attr` FOREIGN KEY (`category_id`) REFERENCES `category_attributes` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes_values`
--

LOCK TABLES `attributes_values` WRITE;
/*!40000 ALTER TABLE `attributes_values` DISABLE KEYS */;
INSERT INTO `attributes_values` VALUES (1,5,'TVCC1','1'),(2,5,'TVCC2','2'),(3,5,'TVCC3','3'),(4,6,'Profile ID 1','4'),(5,6,'Profile ID 2','5'),(6,6,'Profile ID 3','6');
/*!40000 ALTER TABLE `attributes_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_roles`
--

DROP TABLE IF EXISTS `business_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_roles`
--

LOCK TABLES `business_roles` WRITE;
/*!40000 ALTER TABLE `business_roles` DISABLE KEYS */;
INSERT INTO `business_roles` VALUES (1,'Frontline'),(2,'Sales Manager'),(3,'Manager'),(4,'Support'),(5,'Supervisor'),(6,'Order Support');
/*!40000 ALTER TABLE `business_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_attributes`
--

DROP TABLE IF EXISTS `category_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_attributes` (
  `category_id` int NOT NULL,
  `category_value` varchar(255) NOT NULL,
  UNIQUE KEY `UK_attr` (`category_id`,`category_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_attributes`
--

LOCK TABLES `category_attributes` WRITE;
/*!40000 ALTER TABLE `category_attributes` DISABLE KEYS */;
INSERT INTO `category_attributes` VALUES (1,'Functional Group'),(2,'Centers'),(3,'Channels ID'),(4,'Channels CD'),(5,'Teams'),(6,'Profile ID');
/*!40000 ALTER TABLE `category_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `center_cds`
--

DROP TABLE IF EXISTS `center_cds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `center_cds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `application_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application id_idx` (`application_id`),
  CONSTRAINT `center_cd_application` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `center_cds`
--

LOCK TABLES `center_cds` WRITE;
/*!40000 ALTER TABLE `center_cds` DISABLE KEYS */;
INSERT INTO `center_cds` VALUES (1,'string',3),(3,'A',1),(4,'C',2),(5,'string',1),(6,'a',1);
/*!40000 ALTER TABLE `center_cds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centers`
--

DROP TABLE IF EXISTS `centers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `application_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `center_application_idx` (`application_id`),
  CONSTRAINT `center_application` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centers`
--

LOCK TABLES `centers` WRITE;
/*!40000 ALTER TABLE `centers` DISABLE KEYS */;
INSERT INTO `centers` VALUES (1,'TVCC1',1),(2,'TVCC2',1),(3,'TVCC3',2),(4,'TVCC4',2),(5,'TVCC5',2),(6,'TVCC6',3),(7,'TVCC8',3),(8,'TVCC9',3),(9,'New',1),(10,'QOM',1),(11,'PTV01',1),(12,'CCTV1',1),(13,'TVCC6',1),(14,'TVCC9',1),(15,'TVCC5',1),(16,'TVCC1',1),(17,'TV RET.1',1),(18,'TVCC2',1),(19,'TVCC4',1),(20,'TVCC3',1),(21,'TV RET. 1',1),(22,'CS SERVICE CENTER',1),(23,'LCK2 NBBTV TEAM',1),(24,'DEL RETENTION',1),(25,'MKK14OB',1),(26,'GZOB',1),(27,'HK ER NIGHT',1),(28,'CSS',1),(29,'LANGUAGE CENTER (HK)',1),(30,'F&S',1),(31,'MRS D',1),(32,'MRS A',1),(33,'PCD AGENT',1),(34,'SHOP TEAM 5',1),(35,'SHOP TEAM 3',1),(36,'YCK/9',1),(37,'TSWOB',1),(38,'IDD FFP OS',1),(39,'RETENTION TEAM',1),(40,'LTS B',1),(41,'SHOP TEAM 6',1),(42,'MASS A',1),(43,'LTS A',1),(44,'HK SMART LIVING',1),(45,'SHOP TEAM 4',1),(46,'SHOP TEAM 2',1),(47,'HK REFERRAL',1),(48,'SHOP TEAM 1',1),(49,'PH A',1),(50,'BNKOB',1),(51,'HK ER DAY',1),(52,'DSQA',1),(53,'TTW/33',1),(54,'SHOP TEAM 7',1),(55,'FLPR TEAM',1),(56,'PH E',1),(57,'ALL',1),(58,'MKK13OB',1),(59,'MASS D',1),(60,'NOWTV DS',1),(61,'HK ER DAY (SINGLE)',1),(62,'PH C',1),(63,'SUPPORT TEAM',1),(64,'ORDER SUPPORT',1),(65,'LTS PROACTIVE RETENTION OS',1),(66,'PROJECT TEAM A',1),(67,'COACHING',1),(68,'PH DEALER',1),(69,'MASS E',1),(70,'PH D',1),(71,'MKK12OB',1),(72,'BNK/5',1),(73,'PH B',1),(74,'DOOR KNOCK A',1),(75,'PCD_SPD',1),(76,'ETT/8',1),(77,'CPA',1),(78,'NOWTV PARTNERSHIP & AGENT (PA)',1),(79,'MASS C',1),(80,'SURVEY',1),(81,'TTW17',1),(82,'NOWTV CENTRAL ADMINISTRATION',1),(83,'AREA M2',1),(84,'MOBILE OUTSOURCE',1),(85,'NOWTV DIGITAL SALES',1),(86,'TMH/12',1),(87,'PCD ACQUISITION',1),(88,'SUPPORT',1),(89,'DOOR KNOCK B',1),(90,'Team2',1),(91,'ORDER',1),(92,'SALES PLANNING',1),(93,'LTS_SPD',1),(94,'TVCC8',1),(95,'Team 2',1),(96,'IB OTHERS',1),(97,'COMPLAINT',1),(98,'CS SALES REFERRAL',1),(99,'GZ PROACTIVE RETENTION',1),(100,'AREA Q3',1),(101,'DS QA',1),(102,'YCK/6',1),(103,'MASS D&E',1),(104,'GZ PCD DAY',1),(105,'GZ EYE',1),(106,'GZ NIG',1),(107,'GOLDEN MEMBERSHIP PROJECT',1),(108,'GZ REACTIVE RETENTION',1),(109,'GZ PCD',1),(110,'OUTSOURCE - MTO',1),(111,'OUTSOURCE - CWT',1),(112,'OUTSOURCE - EUR',1),(113,'OUTSOURCE - SR',1),(114,'OUTSOURCE - CM',1),(115,'CC QA',1),(116,'OST',1),(117,'WHT',1),(118,'YTB Mobile',1),(119,'BOT Mobile',1),(120,'REDEMPTION',1),(121,'TEAM 5',1),(122,'LCK3',1),(123,'BNK9',1),(124,'RET SUP_H',1),(125,'RET SUP_P',1),(126,'CRE21',1),(127,'BIT Mobile Retention',1),(128,'WTT/20',1),(129,'MDV',1),(130,'VF',1),(131,'BIT Mobile Acquisition',1),(132,'YTB3',1),(133,'CHL',1),(134,'MASS',1),(135,'CSM6',1),(136,'T&G',1),(137,'CSM9',1),(138,'TTW40',1),(139,'CG',1),(140,'KSG3',1),(141,'LCK6_CARRIER',1),(142,'C516',1),(143,'G35',1),(144,'CSA',1),(145,'YTB Club',1),(146,'BCC5',1),(147,'xxx',1),(148,'YTB10',1),(149,'QAT',1),(150,'TT6',1),(151,'TTW Mobile',1),(152,'TTW',1),(153,'TEAM 4',1),(154,'SP',1),(155,'BOT6',1),(156,'OAT',1),(157,'AREA H',1),(158,'CP12',1),(159,'BOT Club',1),(160,'MOBILE CS',1),(161,'TEAM 1',1),(162,'UNDEFINED',1),(163,'1010',1),(164,'AREA SH',1),(165,'CSR1',1),(166,'nowTV Premier',1),(167,'BCC4',1),(168,'DUM',1),(169,'MOBILE OUTSOURCE TEAM',1),(170,'AREA X2',1),(171,'CES',1),(172,'TKP',1),(173,'KFM',1),(174,'TEAM 3',1),(175,'BNK',1),(176,'TEAM 6',1),(177,'JSM',1),(178,'YAM',1),(179,'YUM',1),(180,'SUG',1),(181,'TMV',1),(182,'TMS',1),(183,'MGS',1),(184,'SYC',1),(185,'BOH26',1),(186,'BPF7',1),(187,'CPE',1),(188,'SUN ',1);
/*!40000 ALTER TABLE `centers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,'QSI__D01'),(2,'YIMS_D01'),(3,'OTHERSQA'),(4,'CES__D05'),(5,'CS_SC_12'),(6,'PTV01'),(7,'TVCC5'),(9,'TVCC6'),(10,'TVCC9'),(11,'TVCC1'),(12,'TVCC13'),(13,'TVCC2'),(14,'TVCC4'),(570,'TVCC3'),(571,'TVCC12'),(572,'TVCC11'),(573,'TVCC15'),(574,'CS_SC_14'),(575,'LVIOB_01'),(576,'LVIOB_02'),(577,'YPCDS_D1'),(578,'YRES_D01'),(579,'YRET_D06'),(580,'OBSUPP'),(581,'MOBS_N01'),(582,'BITOB_01'),(583,'DM_CCS'),(584,'CFS__N06'),(585,'QA_CCS'),(586,'YIMS_D02'),(587,'V10'),(588,'DQ-HKD01'),(589,'SPT__01'),(590,'CFS__M03'),(591,'V11'),(592,'BNKCSI'),(593,'HKPCDVI2'),(594,'MDST'),(595,'MDSD'),(596,'MTC5'),(597,'MDSC'),(598,'CLSS_D01'),(599,'LCKS01'),(600,'OSSR03'),(601,'APP'),(602,'CYW'),(603,'TP1'),(604,'STP'),(605,'HKTP05'),(606,'CFS__N01'),(607,'TOBS_N01'),(608,'TOBS_N02'),(609,'HKTP03'),(610,'BIMSS_02'),(611,'LT51'),(612,'YIMSTD03'),(613,'BE-HKD02'),(614,'FLT'),(615,'Y68'),(616,'YECSFB01'),(617,'YIMSTD04'),(618,'STOCKMGT'),(619,'MOBSU_N1'),(620,'LT36'),(621,'OTHIMSTS'),(622,'CFRH_D09'),(623,'WA2'),(624,'YOFEMN05'),(625,'HKPCDVI1'),(626,'PABX-HKD01'),(627,'OPC'),(628,'CES'),(629,'FRC-HKD01'),(630,'CFRH_D08'),(631,'HO'),(632,'JDL'),(633,'YWS'),(634,'Y67'),(635,'BOBS_D08'),(636,'CFS__D01'),(637,'DSQA'),(638,'CNR'),(639,'TEF'),(640,'HKTP02'),(641,'SSM'),(642,'POP'),(643,'OTHTRAIN'),(644,'LT50'),(645,'TTW'),(646,'SPT__02'),(647,'MOBS_A06'),(648,'TW1'),(649,'Y55'),(650,'CFS__M02'),(651,'TMQ'),(652,'HMM'),(653,'CFS__D08'),(654,'Y60'),(655,'YRETE_D1'),(656,'HKTP07'),(657,'BIMSS_05'),(658,'WTP'),(659,'SUPPORT TEAM'),(660,'TKS'),(661,'HKTP04'),(662,'CFS__D06'),(663,'SP2'),(664,'V08'),(665,'YIMSTD02'),(666,'DVC'),(667,'YIMSTD08'),(668,'KFM'),(669,'FR-HKDN01'),(670,'MHT'),(671,'OSCM__02'),(672,'YIMSCS02'),(673,'NJS'),(674,'IOS-HKN01'),(675,'CFS__N03'),(676,'FS4'),(677,'DQ-HKN01'),(678,'TS8'),(679,'OTHIMSCS'),(680,'CFS__D05'),(681,'Y77'),(682,'YECSFB03'),(683,'MOBS_A03'),(684,'YIMS_D03'),(685,'MOBS_D04'),(686,'HKTP22'),(687,'Y73'),(688,'BIMSS_07'),(689,'FS5'),(690,'SHP'),(691,'TY1'),(692,'Y87'),(693,'MOS'),(694,'YIMSTD10'),(695,'Y70'),(696,'HKTP08'),(697,'CES__D07'),(698,'CES__D04'),(699,'MGS'),(700,'NPS'),(701,'CJ61'),(702,'VI48'),(703,'YLF'),(704,'Y88'),(705,'Y91'),(706,'HKTP06'),(707,'LT49'),(708,'Y92'),(709,'Y95'),(710,'SBD'),(711,'CFS__N04'),(712,'PCD_SPD'),(713,'HKTP26'),(714,'YOFEMD02'),(715,'HKTP30'),(716,'MOBS_A02'),(717,'Y99'),(718,'HKTP01'),(719,'CPA'),(720,'PCS'),(721,'ABF'),(722,'Y69'),(723,'CSIB_N05'),(724,'VI26'),(725,'YCM'),(726,'CFRH_D05'),(727,'Y26'),(728,'Y57'),(729,'HKTP27'),(730,'MOBS_D05'),(731,'IOT'),(732,'YIMSCS05'),(986,'HKTP28'),(987,'ESM'),(988,'TFP'),(989,'HO-SUP'),(990,'BOBS_D01'),(991,'VI82'),(992,'Y63'),(993,'HKTP25'),(994,'MOBS_D03'),(995,'YIMSCS06'),(996,'HKTP34'),(997,'VI81'),(998,'YIMSCS01'),(999,'Y90'),(1000,'YIMSCS08'),(1001,'SSF'),(1002,'CFS__M01'),(1003,'OSCY_04'),(1004,'HKTP33'),(1005,'SPT__03'),(1006,'- HO'),(1007,'TYP'),(1008,'OSMT02'),(1009,'TOBS_N05'),(1010,'YECSFB02'),(1011,'BOBS_D02'),(1012,'YOFEMD04'),(1013,'YIMSCS03'),(1014,'YIMSNS01'),(1015,'OSMMT__1'),(1016,'VI90'),(1017,'HKTP29'),(1018,'ZSCS01'),(1019,'Y72'),(1020,'HKTP24'),(1021,'KS01'),(1022,'PHP'),(1023,'CFRH_D01'),(1024,'HKTP21'),(1025,'CS_SC_13'),(1026,'BIMSS_04'),(1027,'SVC'),(1028,'KS02'),(1029,'CZT'),(1030,'BN01'),(1031,'VI59'),(1032,'V09'),(1033,'YIMSLV01'),(1034,'CFS__D02'),(1035,'VI54'),(1036,'TMS'),(1037,'VF08'),(1038,'HKTP23'),(1039,'EPC'),(1040,'JTF'),(1041,'HBC'),(1042,'TSZ'),(1043,'TMT'),(1044,'TKP'),(1045,'TPS'),(1046,'TMI'),(1047,'TMV'),(1048,'SYC'),(1049,'YHO'),(1050,'PSS'),(1051,'KCC'),(1052,'SWL'),(1053,'KTS'),(1054,'OLP'),(1055,'CEKEO__1'),(1056,'BIMSS_08'),(1057,'FLPR_06'),(1058,'CES__D02'),(1059,'YRET_D01'),(1060,'OSMTO_01'),(1061,'VI99'),(1062,'OTHIMSMG'),(1063,'VI89'),(1064,'TSK'),(1065,'NB_SW_01'),(1066,'YOFEMD03'),(1067,'VI96'),(1068,'VI71'),(1069,'CES__D06'),(1070,'YOFEMD01'),(1071,'CES__D01'),(1072,'OSEUR_01'),(1073,'CES__D03'),(1074,'YIMSCS07'),(1075,'Y76'),(1076,'Y71'),(1077,'Y12'),(1078,'LTS_SPD'),(1079,'TVCC8'),(1080,'HKTP31'),(1081,'Y46'),(1082,'YRETE_D2'),(1083,'IOR'),(1084,'CES__D08'),(1085,'TPP'),(1086,'VF10'),(1087,'NB_SA_02'),(1088,'Y53'),(1089,'SVW'),(1090,'VF06'),(1091,'PS 1'),(1092,'GLSS_D01'),(1093,'GIMSCS11'),(1094,'DS-PYD01'),(1095,'BNKQA'),(1096,'ES-PYD01'),(1097,'OTHPFLCS'),(1098,'IOS-HKD01'),(1099,'RMANT_D1'),(1100,'YREF04'),(1101,'MPGZS_D1'),(1102,'TOBSU_N1'),(1103,'GIMSTSE1'),(1104,'OTHPFLTS'),(1105,'GFLPR_05'),(1106,'HO-PRO'),(1107,'BE-GZN02'),(1108,'GIMSTSP1'),(1109,'GIMSTS02'),(1110,'GIMSTSP9'),(1111,'GIMSTSE2'),(1112,'GIMSTSP7'),(1113,'GIMSTS09'),(1114,'GIMSTS07'),(1115,'GIMSTSSP'),(1116,'FR-PYN01'),(1117,'PYLTS'),(1118,'GIMSTS14'),(1119,'GIMSTS13'),(1120,'GZQSI_01'),(1121,'PIMSCS04'),(1122,'PIMSTS03'),(1123,'GIMSCS03'),(1124,'CR16'),(1125,'GIMSCS06'),(1126,'BE-GZD02'),(1127,'PYPCDVI'),(1128,'PYQA'),(1129,'GIMSCS04'),(1130,'GIMSCS10'),(1131,'GIMSCS01'),(1132,'GFS__D08'),(1133,'GFLPR_01'),(1134,'GZ-FRD02'),(1135,'IOS-PYD01'),(1136,'GIMSTS01'),(1137,'GIMSTS11'),(1138,'GIMSCS02'),(1139,'GIMSTSP3'),(1140,'FR-PYD02'),(1141,'GIDD__01'),(1142,'GIDD_N03'),(1143,'GZ-FRDN01'),(1144,'PYCOS'),(1145,'PIMSTS05'),(1146,'GFLPR_03'),(1147,'GIMSTS05'),(1148,'DQ-PYN02'),(1149,'IOS-PYN01'),(1150,'GFS__D13'),(1151,'PIMSTS04'),(1152,'GIMSCS14'),(1153,'PYEYE'),(1154,'FR-PYD01'),(1155,'GIDD__02'),(1156,'BE-GZD04'),(1157,'MR01'),(1158,'GIMSCS09'),(1159,'PIMSCS03'),(1160,'DQ-PYD01'),(1161,'GFS__D09'),(1162,'GIDD__03'),(1163,'PIMSTS02'),(1164,'GIMSTS03'),(1165,'MGZRTN01'),(1166,'BE-GZD01'),(1167,'GZOB_D06'),(1168,'GZOB_D07'),(1169,'GZOB_D02'),(1170,'GZOB_D03'),(1171,'MGZRTD02'),(1172,'GFS__D03'),(1173,'GZOB_D05'),(1174,'GFS__N02'),(1175,'GFLPR_07'),(1176,'GFS__D01'),(1177,'MRGZS_D1'),(1178,'GZCS__02'),(1179,'GFS__N03'),(1180,'GIDD_N01'),(1181,'OSEL__01'),(1182,'OSSN__01'),(1183,'OSCM__01'),(1184,'OSEP__03'),(1185,'OSSR__02'),(1186,'OSDL__01'),(1187,'OSDT__01'),(1188,'OSMT__02'),(1189,'GZCS__01'),(1190,'OSPT__01'),(1191,'ZSCS__01'),(1192,'OSCY__04'),(1193,'OSEP02'),(1194,'QAE'),(1195,'SEA'),(1196,'MOB'),(1197,'MDV'),(1198,'CSYA6'),(1199,'CLHYM'),(1200,'IBCS2'),(1201,'CLHYS'),(1202,'CSYB3'),(1203,'HKMOB1'),(1204,'HKMOB2'),(1205,'STR'),(1206,'CER'),(1207,'MGR'),(1208,'TSR'),(1209,'CSYA2'),(1210,'IBCS1'),(1211,'CSYB4'),(1212,'CLHYO'),(1213,'CLHYK'),(1214,'CRT'),(1215,'IST'),(1216,'APPL'),(1217,'BNK004'),(1218,'PY0007'),(1219,'OAT'),(1220,'CSYA5'),(1221,'CLHYA'),(1222,'CLHYE'),(1223,'CLHYN'),(1224,'CLHYP'),(1225,'BIT9'),(1226,'BIT3'),(1227,'RTT'),(1228,'VI42'),(1229,'BIT3A'),(1230,'VF07'),(1231,'BNK 7'),(1232,'VI57'),(1233,'VI28'),(1234,'VI91'),(1235,'VI55'),(1236,'MIN2'),(1237,'VI83'),(1238,'VI85'),(1239,'T2B01'),(1240,'MRE1'),(1241,'CDT'),(1242,'BIL'),(1243,'CRT_I'),(1244,'VI40'),(1245,'CMS1A'),(1246,'IBCS9'),(1247,'SLT'),(1248,'CMS2K'),(1249,'CMS3F'),(1250,'MKT'),(1251,'QA'),(1252,'CSC'),(1253,'CMS1'),(1254,'Stores'),(1255,'CMS2J'),(1256,'CSSP1'),(1257,'CARRIER_TEAM'),(1258,'IBCS7'),(1259,'MCE1'),(1260,'CAM'),(1261,'TRAINING'),(1262,'OPN SUPP'),(1263,'HK OPERATION'),(1264,'VI51'),(1265,'PRT'),(1266,'PDT'),(1267,'SLE'),(1268,'CSA'),(1269,'MOB PT'),(1270,'VI95'),(1271,'CMS1D'),(1272,'CAB'),(1273,'CMS1D1'),(1274,'CMS1A1'),(1275,'MOB RETN'),(1276,'CRT_D'),(1277,'IBCS5'),(1278,'IBCS3'),(1279,'LKT16'),(1280,'CMS1B'),(1281,'CMS3'),(1282,'CSL_IT'),(1283,'CMS3E'),(1284,'CRT_B'),(1285,'CMS1B3'),(1286,'CRT_E'),(1287,'ORT_P'),(1288,'CMS1D2'),(1289,'MSC2'),(1290,'TT6'),(1291,'SO'),(1292,'CMS1C'),(1293,'CVT'),(1294,'CMS1D3'),(1295,'DSTA'),(1296,'CRT_C'),(1297,'CMS1C2'),(1298,'CLHYD'),(1299,'CLUCM'),(1300,'CSO'),(1301,'T2C01'),(1302,'SO'),(1303,'CMS3J'),(1304,'CAS6'),(1305,'MKT Team 1'),(1306,'CLHYJ'),(1307,'MSC1'),(1308,'CMS3L'),(1309,'CRT_A'),(1310,'CSYA1'),(1311,'GSP'),(1312,'MCS1'),(1313,'CMS1C1'),(1314,'B2B'),(1315,'MANAGED OPERATION'),(1316,'IBCS4'),(1317,'TTW40'),(1318,'CRT_V'),(1319,'VI98'),(1320,'TOB'),(1321,'YWR'),(1322,'MHKPCS1'),(1323,'CLHYB'),(1324,'MTKG_MO'),(1325,'CMS2E'),(1326,'MFS1'),(1327,'CMS3M'),(1328,'CMS1B2'),(1329,'CMS2F'),(1330,'CMS2M'),(1331,'MSOM'),(1332,'MOB CS'),(1333,'TVCC7'),(1334,'PTV02'),(1335,'VI97'),(1336,'VI27'),(1337,'TVCC14'),(1338,'CMSJ4'),(1339,'MAVP'),(1340,'CCM01'),(1341,'OM'),(1342,'PROD'),(1343,'CCM02'),(1344,'SIS SUPPORT'),(1345,'CRT_M'),(1346,'DUM'),(1347,'MCS2'),(1348,'MOB SA'),(1349,'ADM'),(1350,'COM'),(1351,'CSL001'),(1352,'CSL002'),(1353,'CSL003'),(1354,'CSL004'),(1355,'CSL005'),(1356,'OST'),(1357,'XLT'),(1358,'SMS1'),(1359,'TTR'),(1360,'SIS'),(1361,'SCE'),(1362,'MDS'),(1363,'MDSM'),(1364,'MDSU'),(1365,'MDSY'),(1366,'MDP'),(1367,'MINB'),(1368,'BNK9'),(1369,'GKC'),(1370,'GKN'),(1371,'GKO'),(1372,'GLK'),(1373,'GMB'),(1374,'GTM'),(1375,'GTW'),(1376,'GYT'),(1377,'GUL'),(1378,'GUT'),(1379,'N39'),(1380,'TAG'),(1381,'TAXI'),(1382,'CPM'),(1383,'PURE'),(1384,'HBEW'),(1385,'SULN'),(1386,'FUPL'),(1387,'ATIM'),(1388,'MTOL'),(1389,'AGCC'),(1390,'SASL'),(1391,'AQUA'),(1392,'BNK'),(1393,'SONI'),(1394,'SUNM'),(1395,'EPBI'),(1396,'IPRO'),(1397,'WCHK'),(1398,'SNIC'),(1399,'CMTL'),(1400,'IHZS'),(1401,'SUN');
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels_cd`
--

DROP TABLE IF EXISTS `channels_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels_cd` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `application_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application id_idx` (`application_id`),
  CONSTRAINT `channel_cd_application` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels_cd`
--

LOCK TABLES `channels_cd` WRITE;
/*!40000 ALTER TABLE `channels_cd` DISABLE KEYS */;
INSERT INTO `channels_cd` VALUES (4,'AB',1),(5,'CH',2),(6,'QOM',1),(7,'CSS',1),(8,'IBS',1),(9,'SC',1),(10,'VCC',1),(11,'OBS',1),(12,'SCS',1),(13,'RET',1),(14,'CPA(LTS)',1),(15,'CFM1',1),(16,'DS6',1),(17,'DS5',1),(18,'RS',1),(19,'PTC',1),(20,'PTA',1),(21,'DS3',1),(22,'DS2',1),(23,'CFM3',1),(24,'DS1',1),(25,'QCC',1),(26,'PTR',1),(27,'VDS',1),(28,'DS4',1),(29,'PTF',1),(30,'CPA(PCD)',1),(31,'PTH',1),(32,'OSS',1),(33,'VDT',1),(34,'PTT',1),(35,'PTP',1),(36,'PTE',1),(37,'VQA',1),(38,'PTM',1),(39,'CPA',1),(40,'MOB',1),(41,'CRM',1),(42,'CFM',1),(43,'ORT',1),(44,'CRT',1),(45,'IST',1),(46,'OAT',1),(47,'NTV',1),(48,'MDV',1),(49,'CSFM',1),(50,'COM',1),(51,'CAP',1),(52,'CSL',1),(53,'SLV',1),(54,'WH',1),(55,'CARRIER(LTS)',1),(56,'CHL1',1),(57,'TELESERVICES',1),(58,'CHL',1),(59,'EDU',1),(60,'CSA',1),(61,'SBDM_IT',1),(62,'CDAL',1),(63,'CAS',1),(64,'SLE',1),(65,'RM',1),(66,'MMO',1),(67,'OTHER',1),(68,'CPM',1),(69,'SP',1),(70,'SMS',1),(71,'SC1',1),(72,'SCJ',1),(73,'SIS',1),(74,'Tap & Go',1),(75,'RSD',1),(76,'SUN',1);
/*!40000 ALTER TABLE `channels_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels_id`
--

DROP TABLE IF EXISTS `channels_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels_id` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `application_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application id_idx` (`application_id`),
  CONSTRAINT `channel_application` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels_id`
--

LOCK TABLES `channels_id` WRITE;
/*!40000 ALTER TABLE `channels_id` DISABLE KEYS */;
INSERT INTO `channels_id` VALUES (1,'1',1),(5,'2',2),(6,'3',3),(7,'4',1),(8,'5',1),(9,'6',1),(10,'7',1),(11,'8',1),(12,'9',1),(13,'10',1),(14,'11',2),(15,'12',2),(16,'13',2),(17,'14',2),(18,'15',2),(19,'16',2),(20,'17',2),(21,'18',3),(22,'19',3),(23,'20',3),(24,'21',3),(25,'22',3),(26,'23',3),(27,'24',3);
/*!40000 ALTER TABLE `channels_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_app_configs`
--

DROP TABLE IF EXISTS `default_app_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_app_configs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_id` int DEFAULT NULL,
  `preset_id` int DEFAULT NULL,
  `function_group_id` int DEFAULT NULL,
  `channel_id` int DEFAULT NULL,
  `channel_cd` varchar(45) DEFAULT NULL,
  `center_cd` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_app_configs`
--

LOCK TABLES `default_app_configs` WRITE;
/*!40000 ALTER TABLE `default_app_configs` DISABLE KEYS */;
INSERT INTO `default_app_configs` VALUES (1,2,1,5,4,'4','4'),(2,2,2,6,4,'3','5'),(3,1,2,4,1,'1','2'),(4,1,3,2,9,'7','9'),(5,1,4,1,1,'4','1'),(6,1,5,26,11,'11','14'),(7,2,5,10,19,'5','4');
/*!40000 ALTER TABLE `default_app_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `hierarchy_level` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `organization_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department organization_idx` (`organization_id`),
  CONSTRAINT `department_organization` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (40,'B','B',1,0,'department',15),(41,'Channel Fulfillment Management (CFM) ','',1,0,'department',18),(42,'Fulfillment & Services (F&S) - HK ',NULL,2,41,'department',18),(43,'Fulfillment & Services (F&S) - PRC ',NULL,2,41,'department',18),(44,'HK - CPE Team ',NULL,3,42,'department',18),(45,'HK - Order Team ',NULL,3,42,'department',18),(46,'HK - Misc. Support ',NULL,3,42,'department',18),(47,'PY - Order Team ',NULL,3,43,'department',18),(48,'PY - COS & QC Team ',NULL,3,43,'department',18);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `function_group_functions`
--

DROP TABLE IF EXISTS `function_group_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `function_group_functions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `function_id` int DEFAULT NULL,
  `function_group_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `function id_idx` (`function_id`),
  KEY `function group id_idx` (`function_group_id`),
  CONSTRAINT `function_group_function_function` FOREIGN KEY (`function_id`) REFERENCES `functions` (`id`),
  CONSTRAINT `function_group_function_function_group` FOREIGN KEY (`function_group_id`) REFERENCES `function_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `function_group_functions`
--

LOCK TABLES `function_group_functions` WRITE;
/*!40000 ALTER TABLE `function_group_functions` DISABLE KEYS */;
/*!40000 ALTER TABLE `function_group_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `function_groups`
--

DROP TABLE IF EXISTS `function_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `function_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `application_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application id_idx` (`application_id`),
  CONSTRAINT `function_group_application` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `function_groups`
--

LOCK TABLES `function_groups` WRITE;
/*!40000 ALTER TABLE `function_groups` DISABLE KEYS */;
INSERT INTO `function_groups` VALUES (1,'SVC_IMS_VIEW',1),(2,'SVC_MOB_VIEW',1),(3,'SVC_VIEW_PROFILE_INTERACTION_DFORM',1),(4,'SVC-ACQ-RET',1),(5,'MOB-CN-QA',2),(6,'MOB-CRM-FRONTLINE',2),(7,'MOB-CRM-GOLD-FRONTLINE',2),(8,'MOB-CRM-GOLD-SM',2),(9,'MOB-CRM-GOLD-SUPPORT',2),(10,'MOB-CRM-MGR',2),(11,'MOB-CRM-SERVICE-SUPPORT-FRONTLINE',2),(12,'RS-BACKEND',3),(13,'RS-CSL-FRONTLINE',3),(14,'RS-CSL-SHOP MANAGER',3),(15,'RS-CSL-SUPPORT',3),(16,'RS-DEVICE-MARKETING',3),(19,'QOM-QSI',1),(20,'CSS-IMS CS - SUPPORT',1),(21,'CSS-IMS CS - AGENT',1),(22,'IBS-SM',1),(23,'SC-GENERAL CS - AGENT',1),(24,'VCC-NOWTV CALL CENTER-FL',1),(25,'SC - SC OPERATION SUPPORT - SUPERVISOR',1),(26,'OBS-FRONTLINE',1),(27,'PCD-RET-SM',1),(28,'LTS-RET-SM',1),(29,'LTS-RET-FRONTLINE',1),(30,'OBS-SM',1),(31,'PCD-PRO-FRONTLINE',1),(32,'QOM-DM',1),(33,'IBS-FRONTLINE',1),(34,'QOM-QA',1),(35,'CSS-FIXED LINE CS - SUPPORT',1),(36,'CSS-CCO',1),(37,'CPA-ADMIN',1),(38,'CFM1-F&S-NON MOB SUPPORT',1),(39,'DS SB DIRECT',1),(40,'DSA-6D',1),(41,'DSA-6A',1),(42,'LTS-PRO-SM',1),(43,'RS-CSL-FRONTLINE',1),(44,'RS-CSL-SHOP MANAGER',1),(45,'PTC-MANAGER',1),(46,'PTA-TRAINING',1),(47,'CSS-IMSTS - MANAGER',1),(48,'CSS-FIXED LINE CS - AGENT',1),(49,'CSS-ECS - AGENT',1),(50,'CFM3-F&S-SMART-LIVING ONLY SUPPORT',1),(51,'PCD-PRO-SM',1),(52,'DSA-3A',1),(53,'CSS-IMSTS - SUPPORT',1),(54,'IBS-MGR',1),(55,'PCD-PRO-MGR',1),(56,'CSS-ECS - MANAGER',1),(57,'CFM1-F&S-NON MOB SUPERVISOR',1),(58,'CSS-IOS',1),(59,'CSS-LTS TS - MANAGER',1),(60,'DSA-5',1),(61,'OBS-MGR',1),(62,'DSA-1A',1),(63,'DSQA-CS',1),(64,'PTR-FRONTLINE1',1),(65,'CSS-IMSTS - AGENT',1),(66,'PTC-FRONTLINE',1),(67,'RS-HKT-FRONTLINE',1),(68,'RS-HKT-SUPPORT',1),(69,'VDS-NOWTV DIRECT SALES-SM',1),(70,'DSA-1E',1),(71,'DSA-1C',1),(72,'PCD-RET-FRONTLINE',1),(73,'PTR-MANAGER',1),(74,'RS-CSL-SUPPORT',1),(75,'SC-CENTER MANAGER - SUPERVISOR',1),(76,'DSA-4',1),(77,'CSS-IMS CS - 2ND TIER',1),(78,'DSB-2A',1),(79,'DSB-PHD-2',1),(80,'PTR-SALES MANAGER',1),(81,'DSA-2D&E',1),(82,'DSA-1D',1),(83,'PTF-FRONTLINE',1),(84,'PCD-RET-MGR',1),(85,'DSA-1B',1),(86,'VDS-NOWTV DIRECT SALES-FL',1),(87,'DSA-3B',1),(88,'SLBD - BD SALES - SUPERVISOR',1),(89,'VCC-NOWTV CALL CENTER-SM',1),(90,'DSA-2A',1),(91,'PTH-FRONTLINE',1),(92,'PTR-FRONTLINE2',1),(93,'RS-FRONTLINE',1),(94,'VDS-NOWTV DIRECT SALES-M',1),(95,'PTH-SALES MANAGER',1),(96,'OSS-SM',1),(97,'VDT-NOWTV DIGITAL SALES-SM',1),(98,'CSS-FIXED LINE CS - UM',1),(99,'PTR-SUPPORT',1),(100,'CSS-LTS TS - AGENT',1),(101,'PTT-SUPPORT',1),(102,'PTP-CEA',1),(103,'CSS-FIXED LINE CS - 2ND TIER',1),(104,'VDT-NOWTV DIGITAL SALES-FL',1),(105,'PTE-FRONTLINE',1),(106,'VDT-NOWTV DIGITAL SALES-M',1),(107,'RS-SHOP MANAGER',1),(108,'VQA-NOWTV QA-SM',1),(109,'LTS-PRO-FRONTLINE',1),(110,'CRM_TESTING',1),(111,'PTM-MARKETING',1),(112,'CSS-IMS CS - UM',1),(113,'VCC-NOWTV CALL CENTER-M',1),(114,'DSA-2C',1),(115,'PTH-FULFILLMENT-FRONTLINE',1),(116,'CSS-LTS TS - SUPPORT',1),(117,'CFM3-F&S-SMART-LIVING ONLY SUPERVISOR',1),(118,'PTF-SALES MANAGER',1),(119,'LTS-RET-MGR',1),(120,'CSS-IMS CS - SSM',1),(121,'CSS-FIXED LINE CS - SSM',1),(122,'VQA-NOWTV QA-M',1),(123,'CSS-IMSTS - SALES MANAGER',1),(124,'CSS-SALES REFERRAL - MANAGER',1),(125,'MOB-PRO-SM',1),(126,'PTC-SALES MANAGER',1),(127,'CSS-LTS TS - SALES MANAGER',1),(128,'VQA-NOWTV QA-FL',1),(129,'OSS-MGR',1),(130,'RS-HKT-SHOP MANAGER',1),(131,'PTE-MANAGER',1),(132,'LTS-PRO-MGR',1),(133,'OSS-FRONTLINE',1),(134,'MOB-DS-OST',1),(135,'MOB-DS-WHT',1),(136,'MOB-CRM-FRONTLINE',1),(137,'CFM-F&S-MOB SUPPORT',1),(138,'MOB-CRM-MGR',1),(139,'SMC-ITSA',1),(140,'MOB-ORT-SM',1),(141,'MOB-CRT-SM',1),(142,'MOB-IST-SM',1),(143,'MOB-OAT-SM',1),(144,'MOB-ORT-FRONTLINE',1),(145,'CSL-1010-CSO-SUPPORT',1),(146,'MOB-NTV-FRONTLINE',1),(147,'MOB-NTV-MGR',1),(148,'MOB-NTV-SM',1),(149,'MOB-CRT-MGR',1),(150,'MOB-CRT-FRONTLINE',1),(151,'MOB-MDV-SM',1),(152,'MOB-OAT-FRONTLINE',1),(153,'CSFM_RAI',1),(154,'MOB-MDV-FL',1),(155,'SVC_MOB_VIEW',1),(156,'CHL-FRONTLINE',1),(157,'SCS-CAP-CREDITMGT',1),(158,'BM_SC-CAP',1),(159,'SVC-ACQ-RET',1),(160,'SUPPORT-GOLD',1),(161,'SMART-LIVING-TC',1),(162,'CFM-F&S-MOB SUPERVISOR',1),(163,'MOB-CRM-SM',1),(164,'SMART-LIVING-MKT',1),(165,'RS-BACKEND',1),(166,'MOB-CN-QA',1),(167,'NOWTV PRODUCT',1),(168,'CG-ORDER-SUPPORT',1),(169,'HKT-KS-WH-SUPPORT',1),(170,'MOB-CRM-SUPPORT',1),(171,'LTS-CARRIER',1),(172,'MOB-IST-FRONTLINE',1),(173,'SMART-CHARGE-MKT',1),(174,'MOB-TELE-SM',1),(175,'SCS-CAP-CASHMGT',1),(176,'TELESERVICES',1),(177,'CHL-GENERAL',1),(178,'MOB-CRM-GOLD-SUPPORT',1),(179,'SMC-ITSA-HK',1),(180,'HKT-EDUCATION-PRT',1),(181,'CHL-SUPERVISOR',1),(182,'SMART-LIVING-PRT',1),(183,'SMART-LIVING-SLE',1),(184,'CSS-MOB ADM',1),(185,'SMART-LIVING-MANAGER',1),(186,'MOB-CRM-SERVICE-SUPPORT-FRONTLINE',1),(187,'MOB-IST-MGR',1),(188,'SVC_IMS_VIEW',1),(189,'CLUB-CSO-ADM',1),(190,'MOB-RET-FRONTLINE',1),(191,'SBDM-IT-SUPPORT',1),(192,'CSFM-INVESTIGATION',1),(193,'MOB-TELE-QAT',1),(194,'CAS-CSC-FRONTLINE',1),(195,'CSL-CORP-SUPERVISOR',1),(196,'PSI-SUPPORT',1),(197,'CSL-1010-CSO',1),(198,'MOB-CRM-GOLD-FRONTLINE',1),(199,'MOB-SP-FRONTLINE',1),(200,'CDAL-FUNC-GRP-1',1),(201,'MOB-ORT-MGR',1),(202,'CSL-CORP-SUPPORT',1),(203,'CRM-GOLD-LOB',1),(204,'CAS-HOTLINE-SM',1),(205,'CHL-MARKETING',1),(206,'CAS-HOTLINE-FRONTLINE',1),(207,'HKT-KS-WH-SUPERVISOR',1),(208,'MOB-CRM-GOLD-SM',1),(209,'CLUB-CSO',1),(210,'SMART-LIVING-B2B-PM',1),(211,'MOB-DS-QAT',1),(212,'SVC_VIEW_PROFILE_INTERACTION_DFORM',1),(213,'RISK-MANAGEMENT',1),(214,'CAS-CSC-MGR',1),(215,'CSS-MOB CS',1),(216,'MOB-MO',1),(217,'AUX-GENERAL',1),(218,'MOB-SP-MGR',1),(219,'HKT-CPM-SUPPORT',1),(220,'RS-DEVICE-MARKETING',1),(221,'MOB-RET-SM',1),(222,'MOB-SP-TG-FRONTLINE',1),(223,'MOB-OAT-MGR',1),(224,'HKT-TTW-WH-SUPPORT',1),(225,'MOB-SMS-SM',1),(226,'SMART-LIVING-PARTNER',1),(227,'CRM-GOLD',1),(228,'SMART-CHARGE-JV-FIN',1),(229,'MOB-SIS-FL',1),(230,'MOB-SIS-SM',1),(231,'KYC-ONLY',1),(232,'MOB-RSD-SM',1),(233,'MOB-SUN-SM',1),(234,'MOB-SUN-MGR',1);
/*!40000 ALTER TABLE `function_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functions`
--

DROP TABLE IF EXISTS `functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `functions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functions`
--

LOCK TABLES `functions` WRITE;
/*!40000 ALTER TABLE `functions` DISABLE KEYS */;
/*!40000 ALTER TABLE `functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_duties`
--

DROP TABLE IF EXISTS `job_duties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_duties` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_duties`
--

LOCK TABLES `job_duties` WRITE;
/*!40000 ALTER TABLE `job_duties` DISABLE KEYS */;
INSERT INTO `job_duties` VALUES (1,'QOM'),(2,'Call Center / CSS'),(3,'Inbound Sales (call center) / IBS'),(4,'Service Center / SC'),(5,'NowTV / VCC'),(6,'Outbound Sales (call center) / OBS'),(7,'Smart Charge / SCS'),(8,'Retention / RET'),(9,'IBS'),(10,'Fulfiment / CFM1'),(11,'Direct Sales / DS6'),(12,'Direct Sales 5'),(13,'Retail Sales / RS'),(14,'Premium Team / PTC'),(15,'Premium Team / PTA'),(16,'Direct Sales / DS3'),(17,'Direct Sales / DS2'),(18,'Fulfiment / CFM3'),(19,'Direct Sales / DS1'),(20,'VCC'),(21,'Premium Team / PTR'),(22,'NowTV / VDS'),(23,'Direct Sales /DS4'),(24,'Premium Team / PTF'),(25,'Premium Team / PTH'),(26,'Outsource Sales / OSS'),(27,'NowTV / VDT'),(28,'Premium Team / PTT'),(29,'Premium Team / PTP'),(30,'Premium Team / PTE'),(31,'NowTV / VQA'),(32,'Premium Team / PTM'),(33,'Fulfilment / CFM'),(34,'Roadshow (MDV)'),(35,'Customer Account Payment / CAP'),(36,'Smart Living / SLV'),(37,'Warehouse / WH'),(38,'Fixed Number Porting / CARRIER(LTS)'),(39,'Customer Data Access Logging (CDAL)'),(40,'Smart Living Engineer / SLE'),(41,'Retail Sales / RSD');
/*!40000 ALTER TABLE `job_duties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `levels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `level department_idx` (`department_id`),
  CONSTRAINT `level_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `hierarchy_level` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `root_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (15,'Mobile Sales and Marketing','...',0,0,0),(16,'Consumer Mobile',NULL,1,15,15),(17,'CSL Marketing & Prepaid ',NULL,1,16,15),(18,'Marketing Operation',NULL,1,16,15),(19,'Brand & Communications',NULL,1,16,15),(20,'Human Resources',NULL,1,16,15),(21,'Finance',NULL,1,16,15);
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presets`
--

DROP TABLE IF EXISTS `presets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_duty_id` int DEFAULT NULL,
  `business_role_id` int DEFAULT NULL,
  `channel_id` int DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presets`
--

LOCK TABLES `presets` WRITE;
/*!40000 ALTER TABLE `presets` DISABLE KEYS */;
INSERT INTO `presets` VALUES (1,1,2,1,NULL),(2,1,2,2,NULL),(3,2,3,3,3),(4,1,1,1,1),(5,2,2,2,2);
/*!40000 ALTER TABLE `presets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_app_attr`
--

DROP TABLE IF EXISTS `staff_app_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_app_attr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int NOT NULL,
  `application_id` int NOT NULL,
  `category_id` int NOT NULL,
  `attribute_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_app_attr_staff` (`staff_id`),
  KEY `staff_app_attr_app` (`application_id`),
  CONSTRAINT `staff_app_attr_app` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`),
  CONSTRAINT `staff_app_attr_staff` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_app_attr`
--

LOCK TABLES `staff_app_attr` WRITE;
/*!40000 ALTER TABLE `staff_app_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_app_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_applications`
--

DROP TABLE IF EXISTS `staff_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_applications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `application_id` int DEFAULT NULL,
  `function_group_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff id_idx` (`staff_id`),
  KEY `application id_idx` (`application_id`),
  KEY `function group id_idx` (`function_group_id`),
  CONSTRAINT `staff_application_application` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`),
  CONSTRAINT `staff_application_function_group` FOREIGN KEY (`function_group_id`) REFERENCES `function_groups` (`id`),
  CONSTRAINT `staff_application_staff` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_applications`
--

LOCK TABLES `staff_applications` WRITE;
/*!40000 ALTER TABLE `staff_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_center_areas`
--

DROP TABLE IF EXISTS `staff_center_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_center_areas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `center_area_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff id_idx` (`staff_id`),
  CONSTRAINT `staff_center_area_staff` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_center_areas`
--

LOCK TABLES `staff_center_areas` WRITE;
/*!40000 ALTER TABLE `staff_center_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_center_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_department_roles`
--

DROP TABLE IF EXISTS `staff_department_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_department_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department id_idx` (`department_id`),
  KEY `staff id_idx` (`staff_id`),
  CONSTRAINT `staff_department_role_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `staff_department_role_staff` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_department_roles`
--

LOCK TABLES `staff_department_roles` WRITE;
/*!40000 ALTER TABLE `staff_department_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_department_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_infos`
--

DROP TABLE IF EXISTS `staff_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_infos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `label` varchar(45) DEFAULT NULL,
  `field_name` varchar(45) DEFAULT NULL,
  `field_value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff id_idx` (`staff_id`),
  CONSTRAINT `staff_info_staff` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_infos`
--

LOCK TABLES `staff_infos` WRITE;
/*!40000 ALTER TABLE `staff_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_managers`
--

DROP TABLE IF EXISTS `staff_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_managers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff id_idx` (`staff_id`),
  KEY `manager id_idx` (`manager_id`),
  CONSTRAINT `staff_manager_manager` FOREIGN KEY (`manager_id`) REFERENCES `staffs` (`id`),
  CONSTRAINT `staff_manager_staff` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_managers`
--

LOCK TABLES `staff_managers` WRITE;
/*!40000 ALTER TABLE `staff_managers` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_team_shops`
--

DROP TABLE IF EXISTS `staff_team_shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_team_shops` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `team_shop_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff id_idx` (`staff_id`),
  CONSTRAINT `staff_team_shop_staff` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_team_shops`
--

LOCK TABLES `staff_team_shops` WRITE;
/*!40000 ALTER TABLE `staff_team_shops` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_team_shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `staff_number` varchar(45) DEFAULT NULL,
  `organization_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `business_role_id` int DEFAULT NULL,
  `job_duty_id` int DEFAULT NULL,
  `channel_id` int DEFAULT NULL,
  `teams_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffs`
--

LOCK TABLES `staffs` WRITE;
/*!40000 ALTER TABLE `staffs` DISABLE KEYS */;
INSERT INTO `staffs` VALUES (3,'a','a@a',NULL,NULL,'2020-10-21','2020-10-31','1',15,40,2,1,1,3);
/*!40000 ALTER TABLE `staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Team 1'),(2,'Team 2'),(3,'Team 3'),(4,'Team 4'),(5,'Team 5'),(6,'Team 6'),(8,'test');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `user_type` varchar(45) DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user staff id_idx` (`staff_id`),
  CONSTRAINT `user_staff` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-13  9:42:00
